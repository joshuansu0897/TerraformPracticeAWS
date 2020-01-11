## Inputs

| Name | Description | Type |
|------|-------------|------|
| region | Region on AWS to Deploy | string |
| instance\_type | Instance type EC2 AWS | string |
| min\_size | min\_size of instances on aws\_launch\_configuration | string |
| desired\_capacity | desired\_capacity of instances on aws\_launch\_configuration | string |
| max\_size | max\_size of instances on aws\_launch\_configuration | string |
| public\_elb\_name | Is the name of ELB in public subnets | string |
| private\_elb\_name | Is the name of ELB in private subnets | string |
| public\_sg\_name | Is the name of security groups of public\_subnet | string |
| public\_sg\_ingress | Ingress Rules to public\_subnet | list |
| public\_sg\_egress | Egress Rules to public\_subnet | list |
| private\_sg\_name | Is the name of security groups of private\_subnet | string |
| private\_sg\_ingress | Ingress Rules to private\_subnet | list |
| private\_sg\_egress | Egress Rules to private\_subnet | list |
| vpc\_main\_id | ID of main VPC | string |
| public\_subnets | The list of publics subnets | list |
| private\_subnets | The list of privates subnets | list |

## Outputs

| Name | Description | Type |
|------|-------------|------|
| elb\_dns\_name\_public | Endpoint of the public ELB | string |
| elb\_dns\_name\_private | Endpoint of the private/internal ELB | string |
| private\_sg\_id | ID of the private security group | string |
