# Problem statement
creates an azure sql server (if doesn't already exist)

# Example usage

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
op:
  pkg: { ref: github.com/opspec-pkgs/azure.sql.server.create#VERSION }
  inputs: 
    subscriptionId:
    loginId:
    loginSecret:
    adminPassword:
    adminUser:
    resourceGroup:
    name:
    # begin optional args
    location:
    loginTenantId:
    loginType:
    tags:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.sql.server.create/issues)
