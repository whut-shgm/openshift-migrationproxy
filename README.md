# openshift-migrationproxy

Template for running a nginx proxy for soon to be migrated instances.
Sites will be proxied to http://old.$host and https://old.$host, just
need to add old.blabla.com to DNS and things will hapen automagicaly.
This is compatible with openshift-letsencrypt.

### Installation

You need oc (https://github.com/openshift/origin/releases) localy installed:

create a new project

```sh
oc new-project openshift-migrationproxy \
    --description="Proxy - nginx" \
    --display-name="Nginx migration proxy"
```

Clone the repository
```sh
git clone https://github.com/ure/openshift-migrationproxy.git
cd openshift-migrationproxy
```

Create the BuildConfig and DeploymentConfig

```sh
oc create -f BuildConfig.yaml
oc create -f DeploymentConfig.yaml
```

Deploy

```sh
oc new-app https://github.com/ure/openshift-migrationproxy.git
```

#### Route.yml

Create routes for sites to be proxied

```sh
oc create -f Route.yaml
```
