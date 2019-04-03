# Usage
If you want your server config to be persistent you should create an empty directory and link the volume:

```
mkdir minecraft_server
cd minecraft_server
docker run --rm -ti -v $(pwd):/home/atlauncher/data schuellerf/docker-atlauncher
```

otherwise for simple testing you can also just call
```
docker run -d --name minecraft schuellerf/docker-atlauncher
# and get the IP to connect to (for vncviewer):
docker inspect minecraft|grep -m1 -Po '(?<="IPAddress": ")[0-9.]+'
```

