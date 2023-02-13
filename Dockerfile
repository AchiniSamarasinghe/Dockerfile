sudo docker images
sudo docker info
sudo docker version
sudo docker help
sudo docker logs c_id
sudo docker pull nginx
sudo docker run -p 80:80 nginx
sudo docker run -d nginx
sudo docker ps
sudo docker ps -a
sudo docker stop c_id
sudo docker rm c_id
sudo docker rmi c_id
sudo docker rm $(sudo docker ps -aq)
sudo docker run --rm nginx
----------------------------------
FROM ubuntu
MAINTAINER ICT119
RUN apt-get update
RUN apt-get install -y nginx
ADD index.html /var/www/html/index.nginx-debian.html
COPY . /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g","daemon off;"]
EXPOSE 80

//sudo docker build -t web:latest .
//sudo docker run -p 80:80 web
-----------------------------------
sudo apt-get update
sudo apt-get install\
	ca-certificate\
	curl\
	gnupg\
	|sb-relese
sudo mkdir -p/etc/apt/keyrings
get the official GPG key from docker file and install
setup the repository
To install docker engine,
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd-io docker-compose-piugin
-------------------------------------
//docker load -i xxx.tar
-------------------------------------
version: '3'
services:
  wordpress:
    image: wordpress
    ports:
      - "8002:80"
    depends_on:
      - db
    volumes:
      - wordpress_files:/var/www/html
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: 1234
    restart: always

  db:
    image: mysql
    volumes:
     - db_data:/var/lib/mysql
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: 1234
      MYSQL_ROOT_PASSWORD: 1234
    restart: always
   
volumes:
  wordpress_files:
  db_data:

//sudo docker compose up
//docker-compose.yml
-------------------------------
//sudo docker run -it nginx bin/bash
	hostname
	ls
	pwd
	exit
	control+p -> contol+q
//sudo docker login

sudo docker network ls
sudo docker network create --subnet=193.10.10.1/16 ICT
sudo docker network inspect ICT
sudo docker network create -d bridge ICT1

sudo service docker restart
sudo docker -p --restart nginx 80:80
--------------------------------


docker network connect multi-host-network container1
docker run -itd --network=multi-host-network busybox
docker network connect --ip 10.10.36.122 multi-host-network container2
docker network connect --link container1:c1 multi-host-network container2
docker network connect --alias db --alias mysql multi-host-network container2

sudo docker network connect abc c40f7374988c
sudo docker run -itd --network=abc busybox
sudo docker network connect --ip 192.10.36.122 xyz a7e99d37cfbf
sudo docker network connect --link 192.10.36.122 xyz a7e99d37cfbf
