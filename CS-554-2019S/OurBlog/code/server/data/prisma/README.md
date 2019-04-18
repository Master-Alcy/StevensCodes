# How to config Prisma Client

1. npm install -g prisma
2. Install Docker
   1. For Windows: <https://hub.docker.com/editions/community/docker-ce-desktop-windows>
   2. Or install docker toolbox
3. Inside of Docker follow this guide: <https://www.prisma.io/docs/1.31/get-started/01-setting-up-prisma-new-database-JAVASCRIPT-a002/>
   1. follow the guide and create hello-world prisma client in docker
   2. Last step is run <docker-compose up -d> at /OurBlog/code/server/data/prisma/hello-world
   3. run export PRISMA_MANAGEMENT_API_SECRET="mysecret42" in docker
   4. run "prisma deploy"
   * run "docker ps", should show something similar to:

~~~docker
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS                      NAMES
1f1d49c8d0f5        prismagraphql/prisma:1.31   "/bin/sh -c /app/sta…"   3 minutes ago       Up 3 minutes        0.0.0.0:4466->4466/tcp     helloworld_prisma_1
9e19aa3c700b        mongo:3.6                   "docker-entrypoint.s…"   3 minutes ago       Up 3 minutes        0.0.0.0:27017->27017/tcp   helloworld_mongo_1
~~~

* **Note that current setup is for docker using Orcal Virtual Box**
* To change to other env, adjust the endpoint in prisma.yml
* View data here: <http://192.168.99.100:4466/_admin>