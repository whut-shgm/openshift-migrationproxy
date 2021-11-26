# openshift-migrationproxy

Template for running a nginx proxy for soon to be migrated instances based on openEuler:20.03-lts-sp1.
Sites will be proxied to http://old.$host and https://old.$host, just
need to add old.blabla.com to DNS and things will hapen automagicaly.
This is compatible with openshift-letsencrypt.

## Installation

You need oc (https://github.com/openshift/origin/releases) localy installed，this is my openshift version:
```sh
oc v3.7.1+ab0f056
kubernetes v1.7.6+a08f5eeb62
features: Basic-Auth GSSAPI Kerberos SPNEGO

Server https://ip:port
openshift v3.7.1+282e43f-42
kubernetes v1.7.6+a08f5eeb62
```


## create a new project

```sh
oc new-project openshift-migrationproxy \
    --description="Proxy - nginx" \
    --display-name="Nginx migration proxy"
```

## Clone the repository

```sh
git clone 
cd openshift-migrationproxy
```

## Deploy

```sh
oc new-app https://github.com/ure/openshift-migrationproxy.git
```

## Other Config
you can deploy the buildconfig,deploymentconfig and route through yaml files 

### Create the BuildConfig and DeploymentConfig

```sh
oc create -f BuildConfig.yaml
oc create -f DeploymentConfig.yaml
```

#### Route.yml

Create routes for sites to be proxied

```sh
oc create -f Route.yaml
```
