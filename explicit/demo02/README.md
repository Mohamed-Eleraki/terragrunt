# Terragrunt Explicit Stack Example

This directory contains a complete example of using Terragrunt explicit stacks to manage infrastructure across multiple environments (dev and prod) with interdependent modules.

## Structure

- `dev/` - Development environment configuration
  - `terragrunt.stack.hcl` - Stack definition for dev environment
  - `resource-group/` - Generated unit for resource group
  - `log-analytics/` - Generated unit for log analytics workspace
- `prod/` - Production environment configuration
  - `terragrunt.stack.hcl` - Stack definition for prod environment
  - `resource-group/` - Generated unit for resource group
  - `log-analytics/` - Generated unit for log analytics workspace
- `modules/` - Terraform modules
  - `resource-group/` - Module for creating Azure resource groups
  - `log-analytics/` - Module for creating Azure log analytics workspaces

## Prerequisites

- Terragrunt installed (version that supports explicit stacks)
- Azure CLI authenticated
- Access to the Azure subscription specified in root.hcl

## Usage

### Step 1: Generate Unit Configurations

First, generate the individual unit terragrunt.hcl files from the stack definitions. This creates the specific configuration files for each infrastructure component.

For dev environment:
```bash
cd dev
terragrunt stack clean && terragrunt stack generate
```

For prod environment:
```bash
cd ../prod
terragrunt stack generate
```

This command reads the `terragrunt.stack.hcl` file and generates:
- `resource-group/terragrunt.hcl` - Configuration for the resource group unit
- `log-analytics/terragrunt.hcl` - Configuration for the log analytics unit with dependency on resource group

### Step 2: Plan Infrastructure Changes

Before applying, review what changes will be made by running plan commands.

For dev resource group:
```bash
cd resource-group
terragrunt plan
```

For dev log analytics:
```bash
cd ../log-analytics
terragrunt plan
```

Repeat for prod environment by navigating to `../prod/resource-group` and `../prod/log-analytics`.

### Step 3: Apply Infrastructure

Apply the infrastructure changes. You can apply units individually or all units in an environment at once.

#### Apply All Units in an Environment

To apply all units in an environment in dependency order automatically:

For dev environment:
```bash
cd dev
terragrunt stack run apply
```

For prod environment:
```bash
cd ../prod
terragrunt stack run apply
```

This command will:
1. Apply the resource-group unit first
2. Then apply the log-analytics unit (which depends on resource-group)

#### Apply Units Individually

Alternatively, apply units one by one for more control:

For dev environment:
```bash
cd dev/resource-group
terragrunt apply
cd ../log-analytics
terragrunt apply
```

For prod environment:
```bash
cd ../prod/resource-group
terragrunt apply
cd ../log-analytics
terragrunt apply
```

### Step 4: Verify Deployment

After applying, you can verify the resources were created correctly by checking the Azure portal or using Azure CLI commands.

## Key Concepts

- **Explicit Stacks**: Define infrastructure components and their dependencies in a declarative way using `terragrunt.stack.hcl` files.
- **Units**: Individual infrastructure components (like resource-group, log-analytics) that can depend on each other.
- **Dependencies**: Log-analytics depends on resource-group, ensuring correct deployment order.
- **Environments**: Separate dev and prod configurations with different inputs and isolated state.

## Cleanup

To destroy the infrastructure. You can destroy all units in an environment at once or individually.

#### Destroy All Units in an Environment

For dev environment:
```bash
cd dev
terragrunt stack destroy
```

For prod environment:
```bash
cd ../prod
terragrunt stack destroy
```

This command will destroy units in reverse dependency order (log-analytics before resource-group).

#### Destroy Units Individually

For dev:
```bash
cd dev/log-analytics
terragrunt destroy
cd ../resource-group
terragrunt destroy
```

For prod:
```bash
cd ../prod/log-analytics
terragrunt destroy
cd ../resource-group
terragrunt destroy
```

Note: Always destroy dependent resources first (log-analytics before resource-group).
