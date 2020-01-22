# TerraformPracticeAWS
![infrastructure](https://raw.githubusercontent.com/joshuansu0897/TerraformPracticeAWS/master/doc/infra.png)

### Prerequisites

- terraform (version used v0.12.16)
- aws account

On `~/.aws/credentials`
```
[default]
aws_access_key_id=YOUR_ACCESS_KEY_ID
aws_secret_access_key=YOUR_SECRET_ACCESS_KEY
```

## Deployment
```sh
./deploy.sh
```

### How to SSH into instances
```sh
ssh -i ./private/ssh/key_access.pem -A ubuntu@x.x.x.x
```

### Destroy
```sh
./down.sh
```

## Authors
* **Joshua Saucedo** - [Github](https://github.com/joshuansu0897)
