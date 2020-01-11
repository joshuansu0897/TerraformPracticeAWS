## Inputs

| Name | Description | Type |
|------|-------------|------|
| region | Region on AWS to Deploy | string |
| vpc\_cidr | CIDR for the VPC | string |
| public\_subnet\_cidrs | CIDRs for the public subnets | list |
| private\_subnet\_cidrs | CIDRs for the private subnets | list |

## Outputs

| Name | Description | Type |
|------|-------------|------|
| vpc\_main\_id | ID of main VPC | string |
| public\_subnets | The list of publics subnets | list |
| private\_subnets | The list of privates subnets | list |
