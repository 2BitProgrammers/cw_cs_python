## MediaWiki Demo

Documentation for MediaWiki:

* https://hub.docker.com/_/mediawiki

<br>

This runs a MediaWiki instance for demonstration purposes.  
The container is already setup with SQLite database and the files saved into tis git repo are from when it was first created.  Hence, there isn't any pages saved (except "Main Page").


Here are the basic commands to get the container(s) to work:

```bash
## For docker compose to work, you need to be in the directory where the docker-compose.yaml file is located
$ cd cw_cs_python_intro/src/docker/mediawiki

## Bring up the container
$ docker-compose up

## To stop the container, hit CTRL+C
## Or, you can run
$ docker-compose stop

## Destroy and remove the container
$ docker-compose down
```

<br>

Once the container is up and running, you can connect via:

* http://localhost:8000
* http://localhost:8000/index.php
* http://localhost:8080/index.php/Main_Page

<br>

To login as admin:

* **Username:**  &nbsp; &nbsp; _admin_
* **Password:**  &nbsp; &nbsp; _abc123456_

<br><br>