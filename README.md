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
run kubectl apply -f deployment.yaml
now Use your browser like http://IP-of-Server:8080  (for app1), and http://IP-of-Server:9090/  (for app2 which is consuming the data from app1)
