# openshift-migrationproxy

Template for running a nginx container for a static website.

### Installation

You need oc (https://github.com/openshift/origin/releases) localy installed:

create a new project

```sh
oc new-project openshift-migrationproxy \
    --description="Website - static nginx" \
    --display-name="Website static"
```

#### github private deploy key

create an ssh deploy key without passphrase
```sh
ssh-keygen -f ~/.ssh/openshift-migrationproxy
```

```sh
oc secrets new-sshauth openshift-migrationproxy --ssh-privatekey=/home/joeri/.ssh/openshift-migrationproxy
oc secrets add serviceaccount/builder secrets/openshift-migrationproxy
```

Clone the repository
```sh
git clone git@github.com:ure/openshift-migrationproxy.git
cd openshift-migrationproxy
```

Create the BuildConfig

```sh
./genwebhooksecret.sh
oc create -f BuildConfig.yaml
```
Add your key to the deploy keys of you repository on GitHub

```sh
cat ~/.ssh/openshift-migrationproxy.pub
```

Deploy from private git repository

```sh
oc new-app .
```

#### route.yml

Routes to a static hostname

```sh
oc create -f route.yaml
```
#### WebHooks

You can find the (github and generic) webhook in the openshift control pannel ! (Browse - Builds)
You can copy the url to clipboard and paste it in Github webhook url (handy for rolling updates)
