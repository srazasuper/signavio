#!/bin/bash
# Dockerize the Application
sudo docker build -t app1:latest app1/.
if [ $? -eq 0 ]; then
    echo "Image build for app1 is successful moving to create image for app2"
    sudo docker build -t app2:latest app2/.
    if [ $? -eq 0 ]; then
    echo "Image build successful, Now moving to deploye On Kube"
     sudo kubectl apply -f apps.yaml
   	if [ $? -eq 0 ]; then
	echo "Services are Now deployed"
	sleep 5
	echo "Testing the services now........"
	app1=`sudo kubectl get services | grep "app1-service" | awk '{ print $3 }'`
	curl http://$app1:8080
	if [ $? -eq 0 ]; then
	echo "app1 is working... now testing app2"
	app2=`sudo kubectl get services | grep "app2-service" | awk '{ print $3 }'`
	curl http://$app2:9090
	if [ $? -eq 0 ]; then
	echo "App2 is also working..... Deployement finish"
	sudo kubectl get service
	sudo kubectl get deployments
else
    echo "The Image build for app1 has failed"
    exit 1
fi
fi
fi
fi
fi
