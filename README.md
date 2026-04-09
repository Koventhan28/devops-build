# This is the  Repository link for downloading the repo: https://github.com/Koventhan28/devops-build.git
Once you clone the Repository move to the directory and use the below commands commands 
Note: The application files are already built so no need to again build using npm commands.
If you want to locally build the docker images you can use the just use the below command 
```
docker build -t koventhan/ecommerce .
```
Once the images is build you can check the images details using the 
```
docker images koventhan/ecommerce
```
You can use the below command to run the docker locally
```
docker run -p 80:3000 -d koventhan/ecommerce
```
Can access the site in the localhost using 
```
http:\\localhost:3000
```

There are two scripts present on the repository 
Build.sh scripts- this is for building the docker container 
```
Need to make sure you have execute permission for the script
chmod +x build.sh
./build.sh
```
deploy.sh scripts- Deploying the docker container using docker-compose
```
similarly we need execute permission for the script
chmod +x deploy.sh
./deploy.sh
```
Login to the AWS Console and Create EC2 Instance with t3.medium for creating jenkins and open security group for ports 22,80 and 8080 for the following ssh,application port and Jenkins.
Use the below command for Installing the Dependency of running the Jenkins Pipeline
```
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key
sudo yum upgrade
sudo yum install java-21-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum install git docker -y
sudo yum install docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Once the Jenkins is up and running on the AWS cloud .for the first time you need to get the credentials from the below file path 
```
/var/lib/jenkins/secrets/initialAdminPassword
```
Login to Jenkins and create the admin user and credentials.
For adding the Docker hub credentails which is used for building the pushing the container to dockerhub
```
Manage Jenkins-> Credentials -> Add-Credentials -> Username and password
```
Once the Devops-build Application jenkins-pipeline is created
Add the github project detail and the github hook trigger with the Pipeline with SCM option for building the Jenkinspipeline
For Linking the github webhook with jenkins
```
Go Github Repo -> Settings->Webhooks-> Add-Weebhook
Add the jenkins website link with /github-webhook/ at the end and once its added it will show for succesful for a push request.
```
Once git push happens the pipeline automatically starts and Pipeline runs for building,Pushing and the Deploying the application to EC2.
You can access the site using the Appropriate EC2 IP Address and port

### Monitoring 
For monitoring download the uptime kuma opensource monitoring tool from site 
```
https://raw.githubusercontent.com/louislam/uptime-kuma/master/compose.yaml
```
run the below command so make sure the compose.yaml file is present.
```
docker-compose up -d
```