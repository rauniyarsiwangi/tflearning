#set the PT Subscription
az account set --subscription xxxxxxxxxxxxxxxxx

#Downscaling the APIM
az apim update --name resource-name --resource-group rg-name --sku-name Developer --sku-capacity 1 --no-wait

#Downscaling the App Service
az appservice plan update --name resource-name --resource-group rg-name --sku B1 --number-of-workers 1

#Downscaling the SQLDB
az sql db update -g rg-name -s resource-name -n db-name --edition Hyperscale --capacity 2 --family Gen5

#set the Dev Subscription
az account set --subscription xxxxxxxxxxxxxxxxx

#Downscaling the Redis
az redis delete -g rg-name -n resource-name --yes -y
redisstate=$(az redis show --name resource-name --resource-group rg-name --query "provisioningState")
if [ "$redisstate" == "\"Deleting\"" ]; then
    sleep 150
else
    az redis create --name resource-name --resource-group rg-name --location centralindia --sku Basic --vm-size C0
fi
