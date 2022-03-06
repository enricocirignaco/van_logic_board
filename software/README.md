Node Red running on a docker container. Image used is the official node-red image.

#### Setup Dev Enviroment:

- navigate to project location
- create project: `docker run -it -p 1880:1880 -v ${PWD}:/data --name node-red nodered/node-red`
- to stop container run `docker stop node-red`
- to start container and attach to it run `docker start -a node-red`

## GPIO configuration:

### Outputs

- Fridge
  - enable: GPIO23 (HW 16)
  - disable: GPIO22 (HW 15)
- Inverter
  - enable: GPIO18 (HW 12)
  - disable: GPIO17 (HW 11)
- Charger
  - enable: GPIO8 (HW 24)
  - disable: GPIO25 (HW 22)
- Source Select **(ON = lead battery, OFF = lfp battery)**: GPIO24 (HW 18)
- Pump: GPIO13 (HW33)
- Aux output: GPIO12 (HW32)

### Inputs

- Switch kitchen (low active): GPIO6 (HW 31)
- Switch living room (low active): GPIO16 (HW 36)
- Aux input 1: GPIO20 (HW 38)
- Aux input 2: GPIO21 (HW 40)
