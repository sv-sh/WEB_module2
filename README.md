Following command can be used for creation container:
>  docker build . -t app_note:1.0.0
-------------
Step 9/9 : CMD ["python", "./remind_me/main.py"]
 ---> Running in 86804ad08c90
Removing intermediate container 86804ad08c90
 ---> 7a2216c3ea7a
Successfully built 7a2216c3ea7a
Successfully tagged app_note:1.0.0
-------------

Show all images:
> docker images
-----------
REPOSITORY                   TAG                    IMAGE ID       CREATED              SIZE
app_note                     1.0.0                  7a2216c3ea7a   About a minute ago   213MB
-----------

Run app in container in interactive mode:
> docker run -it 7a2216c3ea7a
-----------------------------
loading 0
loading 1
loading 2
Loading data... ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 0:00:01
--------------------------------------------------Main menu of contacts:-----------------------------------------------------
| 1. Add | 2.All contacts | 3.Edit | 4.Delete | 5.Find | 6.Birthday soon! | 7.Note menu | 8.Sort directory | 9. Save & Exit |
-----------------------------------------------------------------------------------------------------------------------------
Choose an option: 2
Contact: Kerry Miligan || Phone: 0987776655 || Birthday: 1998-01-01 || Email: qwerty@asd.ua || Address: London || Notes: test #zxc || 
Contact: John Dou || Phone: 0981234532 || Birthday: 1990-07-09 || Email: kjhl@hj.ua || Address: Ukraine || Notes: test3 #adsdsa
-----------------------------

Show all containers:
> docker ps --all
-------
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS                          PORTS                                           NAMES
b5f168738a14   7a2216c3ea7a   "python ./remind_me/…"   About a minute ago   Exited (0) About a minute ago                                                 
--------

Remove some image:
> docker rm container_id
> docker image rm image_id

Execute some command in container:
> docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS     NAMES
059f4556a250   7a2216c3ea7a   "python ./remind_me/…"   About a minute ago   Up About a minute             charming_montalcini

> docker exec -it 059f4556a250 bash
-----------
root@059f4556a250:/my_app# ls
Dockerfile  contacts.pkl  poetry.lock  pyproject.toml  readme.md  remind_me
root@059f4556a250:/my_app# exit
exit
-----------
=========================================================
docker-compose.yaml will be used for future projects; it is simplifies interaction between containers.
For my console app, docker-compose.yaml following:

version: "3"
services:
  app:
    build: .
    container_name: "my_app"
    stdin_open: true # Equivalent to -i
    tty: true # Equivalent to -t

create container:
> docker-compose build --no-cache  # do not use previous build cache
...
Step 10/10 : CMD ["python", "./remind_me/main.py"]
 ---> Running in 374cf7da63ff
Removing intermediate container 374cf7da63ff
 ---> 746d3d04697d
Successfully built 746d3d04697d
Successfully tagged mod2_app:latest

> docker-compose run app
...
--------------------------------------------------Main menu of contacts:-----------------------------------------------------
| 1. Add | 2.All contacts | 3.Edit | 4.Delete | 5.Find | 6.Birthday soon! | 7.Note menu | 8.Sort directory | 9. Save & Exit |
-----------------------------------------------------------------------------------------------------------------------------
Choose an option: 

> docker ps

CONTAINER ID   IMAGE      COMMAND                  CREATED          STATUS          PORTS     NAMES
730b7f7a56a9   mod2_app   "python ./remind_me/…"   17 seconds ago   Up 16 seconds             mod2_app_run_26d5c439a597

> docker exec -it 730b7f7a56a9 bash

root@730b7f7a56a9:/my_app# ls
Dockerfile  README.md  contacts.pkl  poetry.lock  pyproject.toml  remind_me  # .dockerignore is correct


