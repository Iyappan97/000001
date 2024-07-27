# update the vm
apt-get update

# Install zip
apt install zip -y

# install java
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y fontconfig openjdk-17-jre openjdk-17-jdk

# install tar
apt install tar

# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# configure aws 
aws --version
aws configure set aws_access_key_id #################
aws configure set aws_secret_access_key ###################
aws configure set region us-east-1
aws configure set output json

# install docker 
wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installDocker.sh -P /tmp
chmod 755 /tmp/installDocker.sh
bash /tmp/installDocker.sh

#install terraform
wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installTerraform.sh -P /tmp
chmod 755 /tmp/installTerraform.sh
bash /tmp/installTerraform.sh

# install eksctl
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
mv /tmp/eksctl /usr/local/bin

# install jenkins in the console
wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get install jenkins

# configuring jenkins privilege to run docker cmds
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
groups jenkins

# login in into jenkins server
# install following plugins : Docker pipeline , terraform
# configure tools with their appropriate env 
# configure credentials 
# Modify credentials id in pipeline script 
# install eksctl
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin
