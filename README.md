## PHP Docker Base

This is my base Docker image setup for PHP-based applications. It was specifically developed for use with Laravel, but its components can easily be modified to suit most purposes. Feel free to clone/fork and modify at will to suit your needs! Hopefully this takes some of the bite out of setting up a new development environment. Good luck!

## Components
- PHP8.2-FPM
- nginx 1.21
- MySQL 8

## SSL
In order for nginx to start successfully on first build, a dummy certificate and key are included and used by the configuration in this repo. 

To get SSL working fully, generate your CA & self-signed certificates (I highly recommend using [Ben Morel's dev certificates](https://github.com/BenMorel/dev-certificates) scripts to do this), and place your certificate and key files in the `docker/nginx/ssl` folder (the nginx container will automatically mount this folder on container creation). Update the `nginx.conf` in the same folder to match your SSL files, and make any other changes to support your development environment. 


If you're on a Linux-based system, you may need to manually add your CA and self-signed certificate to your browser's cert registry. This is a fairly well-publicized issue, but the general process is laid out in the later steps listed in [this article](https://dgu2000.medium.com/working-with-self-signed-certificates-in-chrome-walkthrough-edition-a238486e6858).

You may also want to add the hostname used during certificate generation to your `/etc/hosts` so it resolves properly.

## Docker Environment Variables

Rename the `.dockerenv.template` file to `.dockerenv` and fill it out with your desired DB root password, database user, user password, and database name. If your application requires a database hostname, you can use `db` (the name of the MySQL 8 container) or use `docker inspect db` and search for its IP.

## Adding Your Application

Your application can be added to the `application` folder- it is empty, so you shouldn't have any trouble cloning a repository, or using a utility like `laravel new` to generate a new application scaffolding, into it.


## Startup

To start the container(s), simply run `docker compose up -d` to run them in the background. Depending on your Docker version/configuration, you may instead need to run `docker-compose`- however, if allowed by your system/architecture, you may want to consider opting to install and use [the Compose plugin](https://docs.docker.com/compose/install/#scenario-two-install-the-compose-plugin) instead.
