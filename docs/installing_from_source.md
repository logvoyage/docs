# Installation

!!! tip "Note"

    Build from source is usefull for local development. In production mode consider to use [docker][1] images.

  [1]: installing_using_docker.md

Before running LogVoyage itself, there are a few minimum services that are required for LogVoyage to communicate with.

## Requirements
- Go (>=1.7)
- PostgreSQL(>=9.x)
- RabbitMQ(3.6.x)
- ElasticSearch(5.x)
- Node.js(>=6.9)

## Get sources

Installing LogVoyage is as easy as installing any other go package:
``` bash
go get -u github.com/logvoyage/logvoyage
```

## Configuration

We assume you have all services listed above installed.
Before starting create main configuration file `$HOME/.logvoyage/config.json`.
Copy config file from LogVoyage directory:
``` bash
mkdir ~/.logvoyage
cp $GOPATH/src/github.com/logvoyage/logvoyage/config.json $HOME/.logvoyage
```

Example file:
``` json
{
  "secret": "random-secret-code",
  "db": {
    "address": "localhost",
    "database": "logvoyage",
    "user": "postgres",
    "password": "postgres",
    "port": "5432",
    "sslmode": "disable"
  },
  "elastic": {
    "url": "http://localhost:9200"
  },
  "amqp": {
    "url": "amqp://guest:guest@localhost:5672"
  }
}
```

## Database setup

Run next commands to create and setup basic database structure:
``` bash
logvoyage database create
logvoyage database migrate
```

## Running services

Large amount of work is managed via background workers: consumer and producer. Producer is responsible for accepting data from users
and sending to queue. Consumer(s) will process data and send it to storage.

Start workers and services:
```
logvoyage start consumer
logvoyage start producer
logvoyage start api
```

## Frontend

To start development verion of web frontend we need Node.js >=6.9. [NVM](https://github.com/creationix/nvm) is preffered way to
manage multiple node versions. Clone frontend repository in your code directory, install dependencies and start development server.

``` bash
cd ~/Code
git clone git@github.com/logvoyage/frontend logvoyage-frontend
cd logvoyage-frontend
nvm install 7.0
nvm use 7.0
npm install -g yarn @angular/cli
yarn install
ng serve
```

Last command will start development server on `http://localhost:4200`

