Folder structure:

app -- source code of the application
db -- database persistent volume from docker
docker -- docker config. files (build) 
docker-compose.yaml -- configuration file for env. (magic)



Because the docker is not persistent (when stop the data is lost and on starup he will be in initial state) we need to use the volumes
 - app folder is use to share the source of the platform
 - db folder is to store the mysql data when you stop the docker container or it fails from som reasones

Steps to use the repo:
1. buid the images
  a. cd docker
  b. docker build -t {namespace}/{name_of_images:tag} .
  	ex: docker build -t sepa/holterh:u16php7.1
  obs: {namespace}/{name_of_images:tag} -is important we will need to use in the docker-compose.yaml file
2. need to clone the git repo to app folder
3. db folder need to be present
4. edit docker-compose.yaml file and add the correct name of the docker image:
    line 4 (you need to use the image name setup on 1.b)
   ex:  
   webapp:
   	image: sepa/holterh:u16php71
5. Start env(Open CLI/POWERSHEL with admin rights ):
   - docker-compose up -d (need to be run on the folder level where the docker-compose file exist)
   - check container:
     docker ps 
     you will get something like :


CONTAINER ID  IMAGE                    COMMAND                 CREATED             STATUS              PORTS  NAMES
23a61d90f87a  mysql:5.7               "docker-entrypoint.s…"   33 minutes ago      Up 10 seconds       0.0.0.0:3306->3306/tcp     holter_mysql_1
0decb33bdf39  sepa/holterh:u16php71   "/start.sh"              33 minutes ago      Up 10 seconds       0.0.0.0:80->80/tcp, 0.0.0.0:4443->443/tcp   holter_webapp_1

6. add to your host :
    127.0.0.1   127.0.0.1 holter-home.loc www.holter-home.loc

7. open browser and access:
	www.holter-home.loc







