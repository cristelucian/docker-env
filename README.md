# docker-env
Docker enviromante for Thelia 



You need to have install :
	1.Docker (Mac OS , Linux Distro,Windos)
	 - For Windos you need to activate Hyper V (https://docs.docker.com/machine/drivers/hyper-v/)
	2. Git install
	3. CMD, CLI, POWERSHELL with admin rights 


Folder structure:
----
        app -- source code of the application
        
        db -- database persistent volume from docker
        
        docker -- docker config. files 
        
        docker-compose.yaml -- configuration file for env.
        
        
        -----
        



Because the docker is not persistent (when stop the data is lost and on starup he will be in initial state) we need to use the volumes
 - app folder is use to share the source of the platform
 - db folder is to store the mysql data when you stop the docker container or it fails from som reasones

Steps to use the repo:
1. buid the images
2. need to clone the git repo to app folder
3. db folder need to be present
4. Start env(Open CLI/POWERSHEL with admin rights ):
   - docker-compose up -d (need to be run on the folder level where the docker-compose file exist0)
   - check container:
     docker ps






