Param(
    [Parameter(Mandatory=$True,
                ValueFromPipelineByPropertyName=$false,
                HelpMessage='Specify the AKS cluster name.',
                Position=1)]
                [String]
                $aksClusterName,
                
    [Parameter(Mandatory=$True,
                ValueFromPipelineByPropertyName=$false,
                HelpMessage='Specify the name of the resoure group containing the AKS cluster.',
                Position=2)]
                [String]
                $resourceGroupName,

    [Parameter(Mandatory=$True,
                ValueFromPipelineByPropertyName=$false,
                HelpMessage='Specify the operation to be performed on the AKS cluster name (Start/Stop).',
                Position=2)]
                [ValidateSet('Start','Stop')]
                [String]
                $operation
    )

# Change the ErrorActionPreference to 'Stop'
$ErrorActionPreference = 'Stop'

# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process | Out-Null


try {
        $AzureContext = (Connect-AzAccount -Identity).context
    }
catch{
        Write-Error  "There is no system-assigned user identity. Aborting."; 
        exit
    } 

    $AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext

    #Start/Stop cluster
    #az aks $operation --name $aksClusterName --resource-group $resourceGroupName
    #POST https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ContainerService/managedClusters/{resourceName}/stop?api-version=2021-05-01
        
    #Setting REST API Authentication token
    $accToken = Get-AzAccessToken | Select-Object -Property Token
    $AccessToken = $accToken.Token
    $headers_Auth = @{'Authorization'="Bearer $AccessToken"}

    #Setting GET RestAPI Uri
    $getRestUri = "https://management.azure.com/subscriptions/$($AzureContext.Subscription.Id)/resourceGroups/$($resourceGroupName.Trim())/providers/Microsoft.ContainerService/managedClusters/$($aksClusterName.Trim())?api-version=2021-05-01"

    #Setting POST RestAPI Uri
    $postRestUri = "https://management.azure.com/subscriptions/$($AzureContext.Subscription.Id)/resourceGroups/$($resourceGroupName.Trim())/providers/Microsoft.ContainerService/managedClusters/$($aksClusterName.Trim())/$($operation.ToLower().Trim())?api-version=2021-05-01"

    try
    {
        #Getting the cluster state
        Write-Output "Invoking RestAPI method to get the cluster state. The request Uri is ==$getRestUri==."
        $getResponse = Invoke-WebRequest -UseBasicParsing -Method Get -Headers $headers_Auth -Uri $getRestUri
        $getResponseJson = $getResponse.Content | ConvertFrom-Json
        $clusterState = $getResponseJson.properties.powerState.code
        Write-Output "AKS Cluster ==$aksClusterName== is currently ==$clusterState=="

        #Checking if the requested operation can be performed based on the current state
        Switch ($operation)
        {
            "Start"
            {
                If ($clusterState -eq "Running")
                {
                    Write-Warning -Message "$aksClusterName is already ==$clusterState== and cannot be started again."
                    exit
                }
                else
                {
                    Write-Output "Invoking RestAPI method to perform the requested ==$operation== operation on AKS Cluster ==$aksClusterName==. The request Uri is ==$postRestUri==."
                    $postResponse = Invoke-WebRequest -UseBasicParsing -Method Post -Headers $headers_Auth -Uri $postRestUri
                    $StatusCode = $postResponse.StatusCode
                }
            }
            
            "Stop"
            {
                If ($clusterState -eq "Stopped")
                {
                    Write-Warning -Message "$aksClusterName is already ==$clusterState== and cannot be stopped again."
                    exit
                }
                else
                {
                    Write-Output "Invoking RestAPI method to perform the requested ==$operation== operation on AKS Cluster ==$aksClusterName==. The request Uri is ==$postRestUri==."
                    $postResponse = Invoke-WebRequest -UseBasicParsing -Method Post -Headers $headers_Auth -Uri $postRestUri
                    $StatusCode = $postResponse.StatusCode
                }
            }

            Default
            {
                Write-Error "Unexpected scenario. The requested operation ==$operation== was not matching any of the managed cases."
            }
        }
    }
    catch
    {
        $StatusCode = $_.Exception.Response.StatusCode.value__
        $exMsg = $_.Exception.Message
        Write-Error "$StatusCode : $exMsg"
    }

    if (($StatusCode -ge 200) -and ($StatusCode -lt 300))
    {
        Write-Output "The ==$operation== operation on AKS Cluster ==$aksClusterName== has been completed succesfully."
    }
    else
    {
        Write-Error "The ==$operation== operation on AKS Cluster ==$aksClusterName== was not completed succesfully."
    }
