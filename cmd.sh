#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting function app"
if [ "$(az sql server show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting sql server"
else
  echo "sql server not found"
  echo "creating sql server"
  az sql server create \
    --admin-password "$adminPassword" \
    --admin-user "$adminUser" \
    --location "$location" \
    --name "$name" \
    --resource-group "$resourceGroup"
fi
