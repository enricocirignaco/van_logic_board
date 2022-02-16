Node Red running on a docker container. Image used is the official node-red image.

####Setup Dev Enviroment:
- navigate to project location
- create project: ```docker run -it -p 1880:1880 -v ${PWD}:/data --name node-red nodered/node-red```
- to stop container run ```docker stop node-red```
- to start container and attach to it run ```docker start -a node-red```
