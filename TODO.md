# TODO: Fix Terragrunt Configuration Issues

## Problem
Component terragrunt.hcl files have `include { path = find_in_parent_folders("env-config.hcl") }` which causes errors when running terragrunt stack commands, as the stack provides the configuration.

## Solution
Remove the `include` block from all component terragrunt.hcl files since the stack handles the configuration.

## Files to Edit
- [ ] Advanced-containerApp-deployment-02/modules/components/foundation/common-resource-group/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/foundation/container-reg/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/foundation/network/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/infra-team/resource-group/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/infra-team/storage-account/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/infra-team/log-analytics/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/infra-team/container-env/terragrunt.hcl
- [ ] Advanced-containerApp-deployment-02/modules/components/infra-team/container-apps/terragrunt.hcl

## Verification
- [ ] Run `terragrunt plan --all` in `Advanced-containerApp-deployment-02/live/dev` to verify no errors.
