# problem statement
creates an azure sql server (if doesn't already exist)

# example usage

> note: in examples, VERSION represents a version of the azure.sql.server.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.sql.server.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.sql.server.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.sql.server.create#VERSION }
    inputs: 
      subscriptionId: 
      azureUsername: 
      azurePassword: 
      name: 
      resourceGroup: 
      adminPassword: 
      adminUsername: 
```

