# drone-kubectl

This [Drone](https://drone.io/) plugin allows you to use `kubectl` without messing around with the authentication

## Usage

```yaml
# drone 1.0 syntax
kind: pipeline
name: deploy

steps:
  - name: deploy
    image: nemonik/drone-kubectl
    settings:
      kubernetes_cert:
        from_secret: k8s_cert
      kubernetes_token:
        from_secret: k8s_token
    commands:
      - kubectl create -f job_foo.yaml
      - kubectl wait --for=condition=complete -f job_foo.yaml

```

## How to get the credentials

First, you need to have a service account with **proper privileges** and **service-account-token**.

If the service account is `deploy`, you would have a secret named `deploy-token-xxxx` (xxxx is some random characters).
You can get your token and certificate by the following commands:

cert:
```bash
kubectl get secret deploy-token-xxxx -o jsonpath='{.data.ca\.crt}' && echo
```
token:
```bash
kubectl get secret deploy-token-xxxx -o jsonpath='{.data.token}' | base64 --decode && echo
```

### Special thanks

Inspired by [drone-kubernetes](https://github.com/honestbee/drone-kubernetes).
