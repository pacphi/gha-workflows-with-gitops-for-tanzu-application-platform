#!/usr/bin/env bash

# Converts .tpl files in this package to .yml
# A .env file should be colocated in the same directory as this script with all environment variable values defined

if [ -f ".env" ]; then
  source .env
else
  echo " You forgot to provide a .env file with environment variable values set appropriately.  See .env.sample."
  exit 1
fi

# Convert .init/git-secrets.tpl to .init/git-secrets.yml
sed \
  -e "s/{{ .git_ssh_private_key }}/$GIT_SSH_PRIVATE_KEY/g" \
  -e "s/{{ .git_ssh_known_hosts }}/$GIT_SSH_KNOWN_HOSTS/g" \
  .init/git-secrets.tpl > .init/git-secrets.yml

if [ "$IAAS" == "aws" ] || [ "$IAAS" == "tkg-on-aws" ]; then
  # Convert .init/tap-install-config-aws.tpl to .init/tap-install-config-aws.yml
  sed \
    -e "s/{{ .app_name }}/$APP_NAME/g" \
    -e "s/{{ .dev_namespace }}/$DEV_NAMESPACE/g" \
    -e "s~{{ .backstage_catalog }}~$BACKSTAGE_CATALOG~g" \
    -e "s~{{ or .container_image_registry_prefix \"tanzu\" }}~$CONTAINER_IMAGE_REGISTRY_PREFIX~g" \
    -e "s~{{ or .gitops_provider \"github.com\" }}~$GITOPS_PROVIDER~g" \
    -e "s/{{ .gitops_username }}/$GITOPS_USERNAME/g" \
    -e "s~{{ or .gitops_repo_name \"tap-gitops-depot\" }}~$GITOPS_REPO_NAME~g" \
    -e "s~{{ or .gitops_repo_branch \"main\" }}~$GITOPS_REPO_BRANCH~g" \
    -e "s/{{ .domain }}/$DOMAIN/g" \
    .init/tap-install-config-aws.tpl > .init/tap-install-config-aws.yml
fi

if [ "$IAAS" == "oracle" ]; then
  # Convert .init/tap-install-config-oracle.tpl to .init/tap-install-config-oracle.yml
  sed \
    -e "s/{{ .app_name }}/$APP_NAME/g" \
    -e "s/{{ .dev_namespace }}/$DEV_NAMESPACE/g" \
    -e "s~{{ .backstage_catalog }}~$BACKSTAGE_CATALOG~g" \
    -e "s~{{ or .container_image_registry_prefix \"\" }}~$CONTAINER_IMAGE_REGISTRY_PREFIX~g" \
    -e "s~{{ or .gitops_provider \"github.com\" }}~$GITOPS_PROVIDER~g" \
    -e "s/{{ .gitops_username }}/$GITOPS_USERNAME/g" \
    -e "s~{{ or .gitops_repo_name \"tap-gitops-depot\" }}~$GITOPS_REPO_NAME~g" \
    -e "s~{{ or .gitops_repo_branch \"main\" }}~$GITOPS_REPO_BRANCH~g" \
    -e "s/{{ .domain }}/$DOMAIN/g" \
    .init/tap-install-config-oracle.tpl > .init/tap-install-config-oracle.yml
fi

if [ "$IAAS" != "aws" ] && [ "$IAAS" != "oracle" ]; then
  # Convert .init/tap-install-config.tpl to .init/tap-install-config.yml
  sed \
    -e "s/{{ .app_name }}/$APP_NAME/g" \
    -e "s/{{ .dev_namespace }}/$DEV_NAMESPACE/g" \
    -e "s~{{ .backstage_catalog }}~$BACKSTAGE_CATALOG~g" \
    -e "s~{{ or .container_image_registry_prefix \"tanzu\" }}~$CONTAINER_IMAGE_REGISTRY_PREFIX~g" \
    -e "s~{{ or .gitops_provider \"github.com\" }}~$GITOPS_PROVIDER~g" \
    -e "s/{{ .gitops_username }}/$GITOPS_USERNAME/g" \
    -e "s~{{ or .gitops_repo_name \"tap-gitops-depot\" }}~$GITOPS_REPO_NAME~g" \
    -e "s~{{ or .gitops_repo_branch \"main\" }}~$GITOPS_REPO_BRANCH~g" \
    -e "s/{{ .domain }}/$DOMAIN/g" \
    .init/tap-install-config.tpl > .init/tap-install-config.yml
fi

# Convert .init/tap-install-secrets.tpl to .init/tap-install-secrets.yml
sed \
  -e "s/{{ .app_name }}/$APP_NAME/g" \
  -e "s/{{ .email_address }}/$EMAIL_ADDRESS/g" \
  -e "s/{{ .tanzu_network_username }}/$TANZU_NETWORK_USERNAME/g" \
  -e "s/{{ .tanzu_network_password }}/$TANZU_NETWORK_PASSWORD/g" \
  -e "s~{{ .container_image_registry_url }}~$CONTAINER_IMAGE_REGISTRY_URL~g" \
  -e "s~{{ .container_image_registry_username }}~$CONTAINER_IMAGE_REGISTRY_USERNAME~g" \
  -e "s~{{ .container_image_registry_password }}~$CONTAINER_IMAGE_REGISTRY_PASSWORD~g" \
  -e "s/{{ .git_host }}/$GIT_HOST/g" \
  -e "s/{{ .git_username }}/$GIT_USERNAME/g" \
  -e "s/{{ .git_personal_access_token }}/$GIT_PERSONAL_ACCESS_TOKEN/g" \
  -e "s/{{ .git_ssh_private_key }}/$GIT_SSH_PRIVATE_KEY/g" \
  -e "s/{{ .git_ssh_public_key }}/$GIT_SSH_PUBLIC_KEY/g" \
  -e "s/{{ .git_ssh_known_hosts }}/$GIT_SSH_KNOWN_HOSTS/g" \
  -e "s/{{ or .oidc_auth_client_id \"\" }}/$OIDC_AUTH_CLIENT_ID/g" \
  -e "s/{{ or .oidc_auth_client_secret \"\" }}/$OIDC_AUTH_CLIENT_SECRET/g" \
  -e "s/{{ or .oidc_auth_provider \"github\" }}/$OIDC_AUTH_PROVIDER/g" \
  .init/tap-install-secrets.tpl > .init/tap-install-secrets.yml

# Convert .install/tap-install.tpl to .install/tap-install.yml
sed \
  -e "s/{{ .app_name }}/$APP_NAME/g" \
  -e "s~{{ .git_ref_name }}~$GIT_REF_NAME~g" \
  -e "s/{{ .profile }}/$ACTIVE_PROFILE/g" \
  .install/tap-install.tpl > .install/tap-install.yml

# Convert .post-install/tap-post-install.tpl to .post-install/tap-post-install.yml
sed \
  -e "s/{{ .app_name }}/$APP_NAME/g" \
  -e "s~{{ .git_ref_name }}~$GIT_REF_NAME~g" \
  -e "s/{{ .profile }}/$ACTIVE_PROFILE/g" \
  .post-install/tap-post-install.tpl > .post-install/tap-post-install.yml
