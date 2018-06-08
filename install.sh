#!/bin/bash

#Tools
sudo apt-get -y install unzip tar


#add Oracle's PPA, then update your package repository.
echo Installing Oracle Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -y update

#Silenty install java
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections

#Install oracle java 8
sudo apt-get -y install oracle-java8-installer

java -version
echo $JAVA_HOME

#MAVEN
echo Installing Maven-3.5.3
cd /opt
sudo wget http://www.eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
sudo tar -xzvf apache-maven-3.5.3-bin.tar.gz 
#export PATH=/opt/apache-maven-3.5.3/bin:$PATH
sudo ln -s /opt/apache-maven-3.5.3/bin/mvn /usr/bin/mvn
echo Creating .m2 directory
sudo mkdir ~/.m2
echo Copy default settings.xml in .m2 directory
sudo cp /opt/apache-maven-3.5.3/conf/settings.xml ~/.m2/

mvn -v

#SVN
echo Installing SVN
sudo apt-get -y install subversion
