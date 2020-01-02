**PRE-REQs.**
Install Docker.
Install minikube.
python3
python3-pip
Sudo-user with password less access to root

**Automated through deployement script**
```
after cloning the directory.
cd signavio.
chmod +x deployer.sh
bash -x deployer.sh
```

**Description**
```
There are 2 Directories in the Signavio.
app1 and app2.
app1 just returns the json on port 8080.
app2 consumes the output of app1 and reverse the String values of the key.

To Dockorise the apps.
sudo docker build -t app1:latest app1/.
sudo docker build -t app2:latest /. 
 
At this point we have build our image.
we can these image and test the api at this point.
````

**deploy on  Kuberenetes**
```
we have define the deployement,Replicas, Exposed Service so we just have to apply in kubernetes.
# sudo kubectl apply -f apps.yaml
 This will create service named app1-service and app2-service.
to test this you need to get the IP and  port of each expose service.
# sudo kubectl get service
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
app1-service   LoadBalancer   10.96.247.190   <pending>     8080:30642/TCP   88m
app2-service   LoadBalancer   10.96.190.1     <pending>     9090:32082/TCP   88m
kubernetes     ClusterIP      10.96.0.1       <none>        443/TCP          2d20h

Now we have running app1-service on "10.96.247.190" on port 8080
and app2-service on 10.96.190.1 port 9090

Just use curl command to see the result.
curl http://10.96.247.190:8080
{
"id": "1",
"message": "Hello world"
}
ubuntu@ip-172-31-39-79:~/signavio$ curl http://10.96.190.1:9090
{"id":"1","message":"dlrow olleH"}

```
