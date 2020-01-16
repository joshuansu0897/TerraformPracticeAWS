#!/bin/bash

sudo apt update
apt-get --yes install jq
sudo apt install nginx -y
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx HTTP'
sudo ufw enable

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
curl -s http://169.254.169.254/latest/dynamic/instance-identity/document

metadata="$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document)"
instanceId="$(echo "$metadata" | jq .instanceId)"

cat >/var/www/html/index.nginx-debian.html << EOL
<!DOCTYPE html>
<html>
<head>
    <title>Metadata from $instanceId</title>
</head>
<body>
    <h1>Metadata from $instanceId</h1>
    <pre>
$metadata
    </pre>
</body>
</html>
EOL