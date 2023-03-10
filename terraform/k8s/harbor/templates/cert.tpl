apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: harbor-cert
  namespace: ${namespace}
spec:
  dnsNames:
  - '${harbor_domain}'
  - '${notary_domain}'
  issuerRef:
    kind: ClusterIssuer
    name: letsencrypt-contour-cluster-issuer
  secretName: harbor-tls-secret