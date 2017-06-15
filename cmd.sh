#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for exiting sql server"
if [ "$(az sql server show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting sql server"
else
    createCmd='az sql server create'
    createCmd=$(printf "%s --admin-password %s" "$createCmd" "$adminPassword")
    createCmd=$(printf "%s --admin-user %s" "$createCmd" "$adminUser")
    createCmd=$(printf "%s --location %s" "$createCmd" "$location")
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")

    # handle opts
    if [ "$tags" != " " ]; then
        createCmd=$(printf "%s --tags %s" "$createCmd" "$tags")
    fi

    echo "creating sql server"
    eval "$createCmd"
fi
