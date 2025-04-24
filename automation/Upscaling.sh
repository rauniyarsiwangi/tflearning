#set the PT Subscription
az account set --subscription xxxxxxxxxxxxxxxxx

#Updating the APIM
az apim update --name resource-name --resource-group rg-name --sku-name Premium --sku-capacity 2 &

#Updating the App Service
az appservice plan update --name resource-name --resource-group rg-name --sku P3v2 --number-of-workers 6

#Updating the SQLDB
az sql db update -g rg-name -s resource-name -n db-name --edition Hyperscale --capacity 16 --family Gen5

#set the Dev Subscription
az account set --subscription xxxxxxxxxxxxxxxxx

#Updating the Redis
az redis delete -g rg-name -n resource-name --yes -y

redisstate=$(az redis show --name resource-name --resource-group rg-name --query "provisioningState")

if [ "$redisstate" == "\"Deleting\"" ]; then

    sleep 150

else

    az redis create --name resource-name --resource-group rg-name --location centralindia --sku Premium --vm-size P1

fi
