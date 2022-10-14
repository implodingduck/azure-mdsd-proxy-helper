#!/bin/bash
docker stop mdsdproxyhelper
docker rm mdsdproxyhelper
docker build -t mdsdproxyhelper .
docker run --name mdsdproxyhelper -d -p 8443:8443 mdsdproxyhelper