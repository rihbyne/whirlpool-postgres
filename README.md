### whirlpool-postgres

This image overrides the defacto/standard postgres image available at docker hub with custom settings for 
only whirlpool project implemented as part of my master's project.

To quickly run this image, issue following command

`docker run -v /covered/whirlpool/postgresdata/:/var/lib/postgresql/data -p 5432:5432 -td rihbyne/whirlpool-postgres
`

To build the image, running the following command

`
docker build --no-cache -t whirlpool-postgres \
--build-arg POSTGRES_USER=<username>\
--build-arg POSTGRES_PASSWORD=<pwd>\
--build-arg WHIRLPOOL_USER=<user>\
--build-arg WHIRLPOOL_USER_PWD=<mypwd>\
--build-arg WHIRLPOOL_DB=<dbname>\
.
`

After successful build, start the container with the following command. Create a external storage
directory and map it to the volume inside docker.

`
docker run --name whirlpool-postgres -e POSTGRES_PASSWORD=<pwd>-v /covered/whirlpool/postgresdata/:/var/lib/postgresql/data -p 5432:5432 -td whirlpool-postgres:latest
`
