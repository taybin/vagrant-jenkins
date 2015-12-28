#! /bin/sh

apt-get update
apt-get install --assume-yes wget

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install --assume-yes openjdk-7-jre jenkins
apt-get autoremove --assume-yes
