#!/bin/bash

sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y vim

cd /home

sudo npm install connect

cat >/home/app.js << EOL
 var connect = require('connect');
    var app = connect()
    .use(function(req, res){
        console.log(JSON.stringify(req.headers));
        res.end(JSON.stringify(req.headers))
    })
 .listen(80);
EOL

sudo node /home/app.js
