
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.type == "public" ? {} : { subnet = "subnet" }
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}


resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
}

# -
# - Resource
# -

# resource "azurerm_public_ip" "azlb" {
#   for_each            = var.type == "public" ? var.pip : {}
#   name                = each.value["name"]
#   location            = local.location
#   resource_group_name = local.resource_group_name
#   allocation_method   = each.value["allocation_method"]
# }

resource "azurerm_lb" "load-balancer" {
  #for_each            = var.lb 
  location            = local.location
  name                = var.lb_name
  resource_group_name = local.resource_group_name
  sku                 = var.lb_sku

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration
    content {
      name                          = frontend_ip_configuration.value.name
      private_ip_address            = var.type == "public" ? null :frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation = var.type == "public" ? null : frontend_ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = frontend_ip_configuration.value.public_ip_address_id
      subnet_id                     = var.type == "public" ? null : data.azurerm_subnet.subnet["subnet"].id
    }
  }
  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "load-balancer" {
  for_each        = var.backend_pool
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = each.value["name"]
}

resource "azurerm_lb_probe" "lb_probe" {
  for_each     = var.lb_probe
  name         = each.value["name"]
  port         = each.value["probe_port"]
  protocol     = each.value["protocol"]
  request_path = each.value["request_path"]
  #This forces a destroy when adding a new lb --> loadbalancer_id     = lookup(azurerm_lb.load-balancer, each.value["lb_key"])["id"]
  depends_on          = [azurerm_lb.load-balancer]
  loadbalancer_id     = azurerm_lb.load-balancer.id
  interval_in_seconds = each.value["interval_in_seconds"]
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.create_lb_rule == true ? var.LbRules : {}
  name                           = each.value["name"]
  protocol                       = each.value["protocol"]
  frontend_port                  = each.value["frontend_port"]
  backend_port                   = each.value["backend_port"]
  frontend_ip_configuration_name = each.value["frontend_ip_configuration_name"]
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.load-balancer[each.value.poolkey].id]
  probe_id                       = azurerm_lb_probe.lb_probe[each.value.probekey].id
  load_distribution              = each.value["load_distribution"]
  idle_timeout_in_minutes        = 4
  #This forces a destroy when adding a new lb --> loadbalancer_id     = lookup(azurerm_lb.load-balancer, each.value["lb_key"])["id"]
  loadbalancer_id = azurerm_lb.load-balancer.id
}

# Use the condition customer wants the outbound rule or not and use loop for multiple rule
resource "azurerm_lb_outbound_rule" "load-balancer" {
  for_each                = var.create_outbound_rule == true ? var.outbound_rule : {}
  name                    = each.value["name"]
  loadbalancer_id         = azurerm_lb.load-balancer.id
  protocol                = each.value["protocol"]
  backend_address_pool_id = azurerm_lb_backend_address_pool.load-balancer[each.value.poolkey].id
}


#Use the condition customer wants the nat rule or not and use loop for multiple rule

resource "azurerm_lb_nat_rule" "load-balancer" {
  for_each                       = var.create_lb_nat_rule == true ? var.lb_nat_rule : {}
  resource_group_name            = local.resource_group_name
  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = each.value["name"]
  protocol                       = each.value["protocol"]
  frontend_port_start            = each.value["frontend_port_start"]
  frontend_port_end              = each.value["frontend_port_end"]
  backend_port                   = each.value["backend_port"]
  backend_address_pool_id        = azurerm_lb_backend_address_pool.load-balancer[each.value.poolkey].id
  frontend_ip_configuration_name = each.value["frontend_ip_configuration_name"]
}
