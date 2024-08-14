# XWiki Demo

Documentation for XWiki:

* https://hub.docker.com/_/xwiki
* https://github.com/xwiki/xwiki-docker/blob/master/README.md

<br>


Here are the basic commands to get the container(s) to work:

```bash
## For docker compose to work, you need to be in the directory where the docker-compose.yaml file is located
$ cd cw_cs_python_intro/src/docker/xwiki

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

<br>

Mysql Database:
* Username:  xwiki
* Password:  xwiki

<br><br>
