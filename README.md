# Docker Deployment Instructions
Clone this Repository:  
``` git clone --recurse-submodules https://github.com/TheCamoc/bt-docker-deployment ```

Build docker Image:  
``` docker build --tag smarthome . ```

Fill in environment variables in docker-compose.yml

Start Container (in detached mode):  
``` docker-compose up -d ```