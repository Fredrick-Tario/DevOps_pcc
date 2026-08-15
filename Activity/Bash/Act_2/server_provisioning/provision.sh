#!/bin/bash

echo "Starting server provisioning..."
echo

# Read the operating system information
. /etc/os-release

echo "Detected Operating System: $NAME"
echo "Version: $VERSION_ID"
echo

# Check the Linux operating system
if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then

    apt update

    apt install -y nginx

    apt install -y docker.io

    apt install -y git

    apt install -y curl

    apt install -y htop sysstat

else
    echo "Unsupported operating system: $ID"
    exit 1
fi

systemctl enable nginx
systemctl start nginx

systemctl enable docker
systemctl start docker

nginx -v
docker --version
git --version
curl --version

echo
echo "Services Status:"
echo

if systemctl is-active --quiet nginx; then
    echo "Nginx Status: RUNNING"
else
    echo "Nginx Status: NOT RUNNING"
fi

if systemctl is-active --quiet docker; then
    echo "Docker Status: RUNNING"
else
    echo "Docker Status: NOT RUNNING"
fi

echo
echo "Server Provisioning Completed"
echo 
echo "Operating System: $NAME"
echo "Nginx: Installed"
echo "Docker: Installed"
echo "Git: Installed"
echo "Curl: Installed"
echo "Monitoring Tools: Installed"