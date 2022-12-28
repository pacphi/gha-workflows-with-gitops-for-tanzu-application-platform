#@ load("@ytt:yaml", "yaml")
---
#@ def config():
tap:
  devNamespace: {{ .dev_namespace }}
  catalogs:
  - {{ .backstage_catalog }}

  registry:
    repositories:
      buildService: {{ or .container_image_registry_prefix "tanzu" }}/build-service
      ootbSupplyChain: {{ or .container_image_registry_prefix "tanzu" }}/supply-chain

  domains:
    main: {{ .domain }}
    tapGui: tap-gui.{{ .domain }}
    learningCenter: learningcenter.{{ .domain }}
    knative: {{ .domain }}

  ingress:
    contour_tls_secret: tls
    contour_tls_namespace: contour-tls

  cluster:
    issuerRef:
      group: cert-manager.io
      kind: ClusterIssuer
      name: letsencrypt-contour-cluster-issuer

  supply_chain:
    gitops:
      provider: {{ or .gitops_provider "github.com" }}
      repository:
        name: {{ or .gitops_repo_name "tap-gitops-depot" }}
        owner: {{ .gitops_username }}
        branch: {{ or .gitops_repo_branch "main" }}

  contour:
    infrastructure_provider: aws
    envoy:
      service:
        aws:
          LBType: nlb
#@ end
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .app_name }}
  namespace: tap-install-gitops
data:
  tap-config.yml: #@ yaml.encode(config())
