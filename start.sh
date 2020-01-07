
#!/bin/bash
app="comingsoon"

docker build -t $app .

if docker ps | awk -v app="app" 'NR>1{  ($(NF) == app )  }'; then
    docker stop "$app" && docker rm -f "$app"
fi

docker run -d -p 43590:80 \
    --name=$app \
    -v $PWD:/usr/share/nginx/html $app
