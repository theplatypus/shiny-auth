

```bash
docker build -t authproxy -f ./docker/auth-proxy/Dockerfile .

docker run --rm --name auth -it -p 8080:8080 --env SHINY_URI="http://127.0.0.1:3838/" authproxy

docker exec -it auth htpasswd /etc/nginx/.htpasswd exampleuser
```

```bash
docker build -t shinyserver -f ./docker/shiny-server/Dockerfile .

docker run --rm --name shiny -p 3838:3838 shinyserver
```
