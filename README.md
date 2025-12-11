# Terraform Tutorials - Companion Repository

Hands-on code examples for the Terraform tutorial series at [tannerthings.com/tutorials](https://tannerthings.com/tutorials).

## About These Tutorials

Most Terraform tutorials teach the happy path. These tutorials teach what actually happens in production environments, including state management nightmares, drift detection, and recovery scenarios.

Written by Troy Tanner, with 15+ years managing commercial and DoD systems and FedRAMP High infrastructure.

## Repository Structure

Each tutorial has two directories:

- **`starter/`** - Starting point code with instructions
- **`solution/`** - Completed working example

## Tutorials

### Foundation Track (Complete sequentially)

1. **[01-state-is-truth](./01-state-is-truth/)** - Why Terraform's state file matters more than your HCL code
2. **[02-plan-apply-contract](./02-plan-apply-contract/)** - Predict resource replacement vs update-in-place
3. **[03-variables-outputs](./03-variables-outputs/)** - Stop hardcoding values and prevent configuration drift
4. **[04-remote-state](./04-remote-state/)** - Enable team collaboration with S3 backend and DynamoDB locking
5. **[05-importing-infrastructure](./05-importing-infrastructure/)** - Adopt existing resources without recreation
6. **[06-data-sources](./06-data-sources/)** - Query infrastructure without managing it

### Patterns Track (Reference-based)

Coming soon:
- Count vs For_Each
- Lifecycle Rules
- Dynamic Blocks
- And more...

### Operations Track (Production concerns)

Coming soon:
- Drift Detection
- Version Constraints
- State File Surgery
- And more...

## Prerequisites

- **Terraform** 1.0+ ([Install instructions](https://www.terraform.io/downloads))
- **AWS Account** with credentials configured
- **AWS CLI** configured (`aws configure`)
- Basic command line familiarity

## Getting Started

1. **Clone this repository**:

```bash
git clone https://github.com/yourusername/terraform-tutorials.git
cd terraform-tutorials
```

2. **Navigate to a tutorial**:

```bash
cd 01-state-is-truth/starter
```

3. **Follow the README** in each tutorial directory

4. **Read the full tutorial** at tannerthings.com for detailed explanations

## AWS Costs

Most tutorials use AWS free tier resources:
- t2.micro EC2 instances
- Small S3 buckets
- DynamoDB PAY_PER_REQUEST tables

Estimated cost: $0-2 per tutorial if cleaned up promptly with `terraform destroy`.

**Always run `terraform destroy` when finished** to avoid charges.

## Troubleshooting

### "Error: Invalid provider configuration"

Make sure AWS credentials are configured:

```bash
aws configure
# Enter your access key, secret key, and default region
```

### "Error: acquiring the state lock"

Someone else (or another terminal) is running Terraform in the same directory. Wait for the lock to release or use `terraform force-unlock LOCK-ID` if you're certain no other process is running.

### "Error: Error launching source instance"

Your AWS region might not support t2.micro instances. Change region in `main.tf` or use a different instance type.

## Contributing

Found an issue? Have a suggestion? Open an issue or pull request.

## About the Author

**Troy Tanner** is a Technical Program Manager at LexisNexis managing $2.74B in operations for 2,800+ Air Force personnel. He specializes in DoD systems modernization, AWS GovCloud architecture, and agile transformation.

- Website: [tannerthings.com](https://tannerthings.com)
- LinkedIn: [linkedin.com/in/tannerthings](https://linkedin.com/in/tannerthings)

## License

MIT License - feel free to use this code for learning and reference.

---

## Need Help Implementing Terraform?

I help government contractors and defense organizations modernize their infrastructure using Terraform and AWS GovCloud. With 15+ years managing DoD systems and active Secret clearance, I understand compliance requirements that commercial consultants miss.

[Schedule a consultation →](https://tannerthings.com/contact)
