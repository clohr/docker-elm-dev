## Dockerized Elm dev environment

The goal of this project is to create a basic Elm boilerplate development using Docker. Both the `api` and `app` folders are mounted volumes to allow for seamless local development without having to install either the `node_modules` or `elm-stuff` dependencies as those will run solely within the Docker container.

## Pre-Requisites
* [Docker](https://www.docker.com/get-docker)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Start
* `docker-compose up`
