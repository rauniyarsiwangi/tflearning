module "elb-ci-central-prd-ftp-001" {
  source                = "../../../../tfs-modules/azurerm_load_balancer"
  create_resource_group = false
  resource_group_name   = "rsg-ci-central-prd-shs-001"
  location              = "Central india"
  type                  = "public"
  lb_sku                = "Standard"
  lb_name               = "elb-ci-central-prd-ftp-001"
  frontend_ip_configuration = {
    "conf1" = {
      name                 = "fip-ci-central-prd-ftp-001"
      public_ip_address_id = "/subscriptions/f4cd9586-d49d-4f16-874e-3441698105f7/resourceGroups/rsg-ci-central-prd-shs-001/providers/Microsoft.Network/publicIPAddresses/pip-ci-central-prd-shs-008"
    }
  }
  backend_pool = {
    "pool1" = {
      name = "lbpool-ci-central-prd-ftp-001"
    }
  }
  lb_probe = {
    "probe1" = {
      name                = "hp-ci-central-prd-ftp-001"
      probe_port          = 21
      protocol            = "Tcp"
      interval_in_seconds = "5"
    }
  }
  create_lb_rule = true
  LbRules = {
    "rules1" = {
      name                           = "lbrule-ci-central-prd-ftp-001"
      protocol                       = "Tcp"
      frontend_port                  = "21"
      backend_port                   = "21"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },
    "rules2" = {
      name                           = "lbrule-ci-central-prd-ftp-002"
      protocol                       = "Tcp"
      frontend_port                  = "49152"
      backend_port                   = "49152"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },
    "rules3" = {
      name                           = "lbrule-ci-central-prd-ftp-003"
      protocol                       = "Tcp"
      frontend_port                  = "49153"
      backend_port                   = "49153"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules4" = {
      name                           = "lbrule-ci-central-prd-ftp-004"
      protocol                       = "Tcp"
      frontend_port                  = "49154"
      backend_port                   = "49154"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules5" = {
      name                           = "lbrule-ci-central-prd-ftp-005"
      protocol                       = "Tcp"
      frontend_port                  = "49155"
      backend_port                   = "49155"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },
    "rules6" = {
      name                           = "lbrule-ci-central-prd-ftp-006"
      protocol                       = "Tcp"
      frontend_port                  = "49156"
      backend_port                   = "49156"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules7" = {
      name                           = "lbrule-ci-central-prd-ftp-007"
      protocol                       = "Tcp"
      frontend_port                  = "49157"
      backend_port                   = "49157"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules8" = {
      name                           = "lbrule-ci-central-prd-ftp-008"
      protocol                       = "Tcp"
      frontend_port                  = "49158"
      backend_port                   = "49158"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },
    "rules9" = {
      name                           = "lbrule-ci-central-prd-ftp-009"
      protocol                       = "Tcp"
      frontend_port                  = "49159"
      backend_port                   = "49159"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules10" = {
      name                           = "lbrule-ci-central-prd-ftp-010"
      protocol                       = "Tcp"
      frontend_port                  = "49160"
      backend_port                   = "49160"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules11" = {
      name                           = "lbrule-ci-central-prd-ftp-011"
      protocol                       = "Tcp"
      frontend_port                  = "49161"
      backend_port                   = "49161"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules12" = {
      name                           = "lbrule-ci-central-prd-ftp-012"
      protocol                       = "Tcp"
      frontend_port                  = "49162"
      backend_port                   = "49162"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules13" = {
      name                           = "lbrule-ci-central-prd-ftp-013"
      protocol                       = "Tcp"
      frontend_port                  = "49163"
      backend_port                   = "49163"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules14" = {
      name                           = "lbrule-ci-central-prd-ftp-014"
      protocol                       = "Tcp"
      frontend_port                  = "49164"
      backend_port                   = "49164"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules15" = {
      name                           = "lbrule-ci-central-prd-ftp-015"
      protocol                       = "Tcp"
      frontend_port                  = "49165"
      backend_port                   = "49165"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules16" = {
      name                           = "lbrule-ci-central-prd-ftp-016"
      protocol                       = "Tcp"
      frontend_port                  = "49166"
      backend_port                   = "49166"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules17" = {
      name                           = "lbrule-ci-central-prd-ftp-017"
      protocol                       = "Tcp"
      frontend_port                  = "49167"
      backend_port                   = "49167"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules18" = {
      name                           = "lbrule-ci-central-prd-ftp-018"
      protocol                       = "Tcp"
      frontend_port                  = "49168"
      backend_port                   = "49168"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules19" = {
      name                           = "lbrule-ci-central-prd-ftp-019"
      protocol                       = "Tcp"
      frontend_port                  = "49169"
      backend_port                   = "49169"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules20" = {
      name                           = "lbrule-ci-central-prd-ftp-020"
      protocol                       = "Tcp"
      frontend_port                  = "49170"
      backend_port                   = "49170"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules21" = {
      name                           = "lbrule-ci-central-prd-ftp-021"
      protocol                       = "Tcp"
      frontend_port                  = "49171"
      backend_port                   = "49171"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules22" = {
      name                           = "lbrule-ci-central-prd-ftp-022"
      protocol                       = "Tcp"
      frontend_port                  = "49172"
      backend_port                   = "49172"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules23" = {
      name                           = "lbrule-ci-central-prd-ftp-023"
      protocol                       = "Tcp"
      frontend_port                  = "49173"
      backend_port                   = "49173"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules24" = {
      name                           = "lbrule-ci-central-prd-ftp-024"
      protocol                       = "Tcp"
      frontend_port                  = "49174"
      backend_port                   = "49174"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules25" = {
      name                           = "lbrule-ci-central-prd-ftp-025"
      protocol                       = "Tcp"
      frontend_port                  = "49175"
      backend_port                   = "49175"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules26" = {
      name                           = "lbrule-ci-central-prd-ftp-026"
      protocol                       = "Tcp"
      frontend_port                  = "49176"
      backend_port                   = "49176"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules27" = {
      name                           = "lbrule-ci-central-prd-ftp-027"
      protocol                       = "Tcp"
      frontend_port                  = "49177"
      backend_port                   = "49177"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules28" = {
      name                           = "lbrule-ci-central-prd-ftp-028"
      protocol                       = "Tcp"
      frontend_port                  = "49178"
      backend_port                   = "49178"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules29" = {
      name                           = "lbrule-ci-central-prd-ftp-029"
      protocol                       = "Tcp"
      frontend_port                  = "49179"
      backend_port                   = "49179"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules30" = {
      name                           = "lbrule-ci-central-prd-ftp-030"
      protocol                       = "Tcp"
      frontend_port                  = "49180"
      backend_port                   = "49180"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules31" = {
      name                           = "lbrule-ci-central-prd-ftp-031"
      protocol                       = "Tcp"
      frontend_port                  = "49181"
      backend_port                   = "49181"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules32" = {
      name                           = "lbrule-ci-central-prd-ftp-032"
      protocol                       = "Tcp"
      frontend_port                  = "49182"
      backend_port                   = "49182"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules33" = {
      name                           = "lbrule-ci-central-prd-ftp-033"
      protocol                       = "Tcp"
      frontend_port                  = "49183"
      backend_port                   = "49183"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules34" = {
      name                           = "lbrule-ci-central-prd-ftp-034"
      protocol                       = "Tcp"
      frontend_port                  = "49184"
      backend_port                   = "49184"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules35" = {
      name                           = "lbrule-ci-central-prd-ftp-035"
      protocol                       = "Tcp"
      frontend_port                  = "49185"
      backend_port                   = "49185"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules36" = {
      name                           = "lbrule-ci-central-prd-ftp-036"
      protocol                       = "Tcp"
      frontend_port                  = "49186"
      backend_port                   = "49186"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules37" = {
      name                           = "lbrule-ci-central-prd-ftp-037"
      protocol                       = "Tcp"
      frontend_port                  = "49187"
      backend_port                   = "49187"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules38" = {
      name                           = "lbrule-ci-central-prd-ftp-038"
      protocol                       = "Tcp"
      frontend_port                  = "49188"
      backend_port                   = "49188"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules39" = {
      name                           = "lbrule-ci-central-prd-ftp-039"
      protocol                       = "Tcp"
      frontend_port                  = "49189"
      backend_port                   = "49189"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules40" = {
      name                           = "lbrule-ci-central-prd-ftp-040"
      protocol                       = "Tcp"
      frontend_port                  = "49190"
      backend_port                   = "49190"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    },

    "rules41" = {
      name                           = "lbrule-ci-central-prd-ftp-041"
      protocol                       = "Tcp"
      frontend_port                  = "49191"
      backend_port                   = "49191"
      probekey                       = "probe1"
      frontend_ip_configuration_name = "fip-ci-central-prd-ftp-001"
      poolkey                        = "pool1"
    }




  }
  create_outbound_rule = false
  outbound_rule        = {}
  create_lb_nat_rule   = false
  lb_nat_rule          = {}
  tags = {
    environment = "Prod"
    application = "SW"
    module      = "FTP"
  }
}
