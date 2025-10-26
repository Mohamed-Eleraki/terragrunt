# Fix Terragrunt Deployment Errors

## Tasks
- [x] Fix typo in container-env variables.tf: change `log_nlog_analytics_workspace_id` to `log_analytics_workspace_id`
- [x] Fix reference in ca-env.tf to use corrected variable name
- [x] Add `log_analytics_retention = 30` to network unit in terragrunt.stack.hcl
- [x] Add `log_analytics_retention = 30` to container-reg unit in terragrunt.stack.hcl
- [x] Add `log_analytics_retention = 30` to container-env unit in terragrunt.stack.hcl
- [x] Add log_analytics_retention to inputs in network terragrunt.hcl
- [x] Add log_analytics_retention to inputs in container-reg terragrunt.hcl
- [x] Add log_analytics_retention to inputs in container-env terragrunt.hcl
- [ ] Run terragrunt apply to verify fixes
