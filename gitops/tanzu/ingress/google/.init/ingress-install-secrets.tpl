#@ load("@ytt:yaml", "yaml")
---
#@ def config():
google:
  credentials:
    project_id: {{ .google_project_id }}
    service_account_key: {{ .google_service_account_key }}
  dns:
    zone_name: {{ .google_cloud_dns_zone_name }}
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