# Tutorial 01: State is Truth

Learn why Terraform's state file is more important than your HCL code and what happens when it disappears.

## Full Tutorial

Read the complete tutorial with explanations at: [tannerthings.com/tutorials/01-state-is-truth](https://tannerthings.com/tutorials/foundation/01-state-is-truth)

## What You'll Learn

- Why state files are Terraform's source of truth
- What happens when state is lost
- How to recover from state file deletion
- State file inspection and manipulation

## Time Required

20 minutes

## Prerequisites

- AWS account with credentials configured
- Terraform 1.0+ installed
- Basic command line familiarity

## Lab Instructions

### Starting Point

You're in the `starter/` directory with a basic Terraform configuration.

### Steps

1. **Initialize and apply**:
   ```bash
   terraform init
   terraform apply
   ```

2. **Inspect the state file**:
   ```bash
   cat terraform.tfstate
   ```
   
   Notice how it contains AWS-assigned values like the bucket name and ARN.

3. **Make a safe change** - add a tag in `main.tf`:
   ```hcl
   tags = {
     Purpose     = "Learning Terraform State"
     ManagedBy   = "Terraform"
     Environment = "Dev"  # Add this line
   }
   ```

4. **Plan and apply**:
   ```bash
   terraform plan   # Shows update in-place
   terraform apply
   ```

5. **THE BREAK - Delete state file** (intentionally):
   ```bash
   rm terraform.tfstate
   terraform plan
   ```
   
   Terraform now thinks nothing exists! It wants to create new resources.

6. **Try to apply**:
   ```bash
   terraform apply
   ```
   
   It fails! The bucket already exists.

7. **Recovery** - restore from backup:
   ```bash
   mv terraform.tfstate.backup terraform.tfstate
   terraform plan   # Shows no changes
   ```

### Key Takeaways

- State file = source of truth, not your HCL code
- Losing state = losing Terraform's memory of infrastructure
- Always back up state files (or use remote state)
- State contains sensitive data - treat it like production credentials

### Cleanup

```bash
terraform destroy
```

## Solution

If you get stuck, check the `../solution/` directory for working code.

## Next Tutorial

**Tutorial 02: The Plan-Apply Contract** - Learn to predict resource replacement vs update-in-place.
