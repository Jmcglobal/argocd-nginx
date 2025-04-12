## USE PRIVATE DOCKER IMAGE AND PRIVATE REPO IN ARGOCD DEPLOYMENT

- Create a private docker image
- Create a private repository

## USE SSH to Authenticate with Argocd
- Create SSH ed25519

ssh-keygen -t ed25519 -f ~/.ssh/argocd

- Uplaod the public SSH key to Github with only read access 
on the github repo, click settings
Deploy keys
Add deploy key
Title ""
Paste the public key

- Create a kubernetes secret and mount the private key as the secret
```
```

## Create a Secret for Private Image using a private token or password
kubectl create secret docker-registry dockerconfig -n foo \
--docker-server="https://index.docker.io/v1/" \
--docker-username=<username> \
--docker-password=<password or token> \
--docker-email=jmc@yahoo.mail 