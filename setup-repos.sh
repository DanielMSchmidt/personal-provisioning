#!/bin/bash

set -e

# Load all work related repositories
HASHICORP_REPOS=(
terraform
tfc-agent
atlas
hcl
terraform-stacks-cli
)


mkdir -p ~/work/hashicorp
cd ~/work/hashicorp
for repo in "${HASHICORP_REPOS[@]}"; do
    if [ ! -d ${repo} ]; then
        gh repo clone hashicorp/${repo}

    else
        echo "${repo} already exists"
    fi
done

mkdir -p ~/work/hashicorp/demos

CDKTF_REPOS_CDKTF_ORG=(
cdktf-cdk8s
cdktf-provider-project
cdktf-repository-manager
cdktf-tf-module-stack
)

mkdir -p ~/work/cdktf
cd ~/work/cdktf
for repo in "${CDKTF_REPOS_CDKTF_ORG[@]}"; do
    if [ ! -d ${repo} ]; then
        gh repo clone cdktf/${repo}
    else
        echo "${repo} already exists"
    fi
done

CDKTF_REPOS_HASHICORP_ORG=(
terraform-cdk
terraform-cdk-action
terraform-cdk-team
cdktf-registry-docs
)
for repo in "${CDKTF_REPOS_HASHICORP_ORG[@]}"; do
    if [ ! -d ${repo} ]; then
        gh repo clone hashicorp/${repo}
    else
        echo "${repo} already exists"
    fi
done
