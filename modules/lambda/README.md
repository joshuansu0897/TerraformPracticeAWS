## Inputs

| Name | Description | Type |
|------|-------------|------|
| region | Region on AWS to Deploy | string |
| function\_name\_public | Name of the public lambda | string |
| public\_elb\_endpoint | Endpoint of the public ELB to use in public lambda | string |
| function\_name\_private | Name of the private lambda | string |
| private\_elb\_endpoint | Endpoint of the private/internal ELB to use in private lambda | string |
| private\_subnets | The list of privates subnets | list |
| private\_sg\_id | Is the ID of the securityGroup for private lambda | string |
