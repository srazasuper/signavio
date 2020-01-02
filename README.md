Install Docker.
Install minikube.

App1:
cd to app1 directory and run.
docker build -t app1:latest .
to run in docker.
sudo docker run -v $(pwd)/sample.json:/app/sample.json -d --name app1 -p 8080:8080 app1


APP2:
go to app2 Directory and run.
docker build -t app2:latest .

To run in docker.
sudo docker run -d --name app2 --link=app1 -p 9090:9090 app2

Lets get to Mini kube.
create deployement file like in the root directory.
run kubectl apply -f apps.yaml
now from cli.
sudo kubectl get service
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
app1-service   LoadBalancer   10.96.185.132   <pending>     8080:30791/TCP   13s
app2-service   LoadBalancer   10.96.119.44    <pending>     9090:31969/TCP   13s
kubernetes     ClusterIP      10.96.0.1       <none>        443/TCP          67m

TESTING:
1) curl http://10.96.185.132:8080
{
"id": "1",
"message": "Hello world"
}


2) curl http://10.96.119.44:9090
{"id":"1","message":"dlrow olleH"}
