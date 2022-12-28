#@ load("@ytt:yaml", "yaml")
---
#@ def config():
aws:
  credentials:
    accessKey: {{ .aws_access_key_id }}
    secretKey: {{ .aws_secret_access_key }}
  region: {{ .aws_region }}
  route53:
    hosted_zone_id: {{ .aws_route53_hosted_zone_id }}
acme:
  email: {{ .email_address }}
#@ end
---
apiVersion: v1
kind: Secret
metadata:
  name: git-ssh-for-carvel
  namespace: tanzu-user-managed-packages
type: kubernetes.io/ssh-auth
data:
  ssh-privatekey: {{ .git_ssh_private_key }}
  ssh-knownhosts: {{ .git_ssh_known_hosts }}
---
apiVersion: v1
kind: Secret
metadata:
  name: tanzu-ingress
  namespace: tanzu-user-managed-packages
stringData:
  tanzu-ingress-secrets.yml: #@ yaml.encode(config())