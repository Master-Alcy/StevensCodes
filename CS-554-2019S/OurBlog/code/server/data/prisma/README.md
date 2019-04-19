# How to config Prisma Client

## For Windows

1. npm install -g prisma
2. Install Docker
   1. For Windows 10 Professional : <https://hub.docker.com/editions/community/docker-ce-desktop-windows>
   2. Else install docker toolbox: <https://docs.docker.com/toolbox/toolbox_install_windows/>
3. Inside of Docker follow this guide: <https://www.prisma.io/docs/1.31/get-started/01-setting-up-prisma-new-database-JAVASCRIPT-a002/>
   1. You should run the `start.sh` in docker folder
   2. follow the guide and create hello-world prisma client in docker. Note the datamodel.prisma, docker-compose.yml, and prisma.yml are in `code\server\data\prisma\hello-world\`
   3. run `docker-compose up -d` at /OurBlog/code/server/data/prisma/hello-world
   4. run `export PRISMA_MANAGEMENT_API_SECRET="abc"` in docker
   5. run `prisma deploy`
   6. go to `code\server\data\` and run `node index`

* run `docker ps`, should show something similar to:

~~~docker
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS                      NAMES
1f1d49c8d0f5        prismagraphql/prisma:1.31   "/bin/sh -c /app/sta…"   3 minutes ago       Up 3 minutes        0.0.0.0:4466->4466/tcp     helloworld_prisma_1
9e19aa3c700b        mongo:3.6                   "docker-entrypoint.s…"   3 minutes ago       Up 3 minutes        0.0.0.0:27017->27017/tcp   helloworld_mongo_1
~~~

* **Note that current setup is for docker using Orcal Virtual Box**
* To change to other env, adjust the endpoint in prisma.yml
* View data here: <http://192.168.99.100:4466/_admin>
* Connect Mongodb Compass at 192.168.99.100:4466 with user name prisma and password prisma