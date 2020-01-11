#!/bin/bash

terraform destroy -auto-approve

rm -rf private
rm -rf modules/instances/private