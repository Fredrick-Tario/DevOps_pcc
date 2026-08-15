Infrastrucutre as Code (IaC)

Jenkins Features

Extensible Plugins:

VCS PLugin
Build Plugin (Maven (pom.xml), Gradle (build.gradle))

plugins {
    id 'java'
}

dependencies {
    testImplementation 'junit:junit:4:13'
}

Cloud Plugin
Testing Plugin (Selenium)

JVM Java Virtual Machine
JRE Java Runtime Environment
JDK Jave Development Kit


sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins

ssh -i "jenkins-key.pem" ubuntu@ec2-54-176-219-50.us-west-1.compute.amazonaws.com

sudo su


root@ip-172-31-13-9:/home/ubuntu# cat /var/lib/jenkins/secrets/initialAdminPassword
0297d717a3474c94b84435258497314f


Create an instance using terraform and jenkins