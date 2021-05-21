Terraform AWS-Honeycomb CloudWatch Metrics Stream module
========================================================

This module creates resources to send your CloudWatch Metrics to
[Honeycomb](https://www.honeycomb.io).

## Use

The minimal config is:
```hcl
module "my-cloudwatch-metrics" {
  source = "honeycombio/terraform-aws-honeycomb-cloudwatch-metric-stream"

  name = "my-cloudwatch-metrics"
  honeycomb_dataset_name = "my-cloudwatch-metrics"
  honeycomb_api_key = "HONEYCOMB_API_KEY"
}
```

For more config options, including resource tagging and namespace
include/exclude filters, see [USAGE.md](USAGE.md).


## Examples

Examples of use of this module can be found in [`examples/`](examples/).  We've
provided a default example ("send all metrics") and examples using the
`namespace_include_filters` and `namespace_exclude_filters` (which are mutually
exclusive). We've also provided an example of tagging your resources.


## Development

### Tests
Test cases are in [`tests/`](tests/). To setup:

1. Edit the `provider "aws"` block to fit your credentials.

2. Create a `test.auto.tfvars` file in `tests/` with values for
   `honeycomb_api_key` and, optionally, `honeycomb_api_host`.

3. `terraform plan` and `terraform apply` will now work as expected, as will
   `terraform destroy`.

4. There's a small [Bats](https://github.com/sstephenson/bats) that validates
   a few test cases, one for each of the [`examples/`](examples/).  To run it, `bats test.bats` inside [`tests/`](tests/). It does not run `terraform apply` for you, you have to do that first. See [test.bats](tests/test.bats) for more documentation. (Feel free to add more test cases.)

### Docs
Docs are autogenerated via `./docs.sh`, and put in [USAGE.md](USAGE.md).  Please
regenerate and commit before merging. (Consider automating this with a [github
action](.github/workflows/terraform-docs.yml.bak) - see comments in that file for
what's not yet working.

### Lints
We use [tflint](https://github.com/terraform-linters/tflint) and `terraform
fmt`, and enforce this with a [github action](.github/workflows/tflint.yml).


## Contributions
Features, bug fixes and other changes to this module are gladly accepted. Please open issues or a pull request with your change.

All contributions will be released under the Apache License 2.0.
