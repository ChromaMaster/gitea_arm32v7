# Gitea on armv7

Deploy on your Raspberry pi your self-hosted git repository based on 
[Gitea](https://gitea.io) using [Docker](https://www.docker.com/)


## Table of Contents
- [Gitea on armv7](#gitea-on-armv7)
    - [Table of Contents](#table-of-contents)
    - [Getting Started](#getting-started)
        - [Prerequisites](#prerequisites)
        - [Installing](#installing)
    - [Deployment](#deployment)
    - [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

**[Back to top](#table-of-contents)**

### Prerequisites

- ARMv7 architecture
- docker-compose 1.10.0 or above
- Docker
- Git

**[Back to top](#table-of-contents)**

### Installing

First of all you need to clone this repository locally

```sh
git clone https://gitea.dropi.com.es/Vlad/gitea_armv7 
```

The get into the **gitea_armv7** directory using `cd`.

Now you have to get to clone the [Gitea official repository](https://github.com/go-gitea/gitea).
This is needed because the Dockerfile needs the docker directory which is in there to run 
correctly.

```sh
git clone https://github.com/go-gitea/gitea gitea
```

To build the dockers gitea image you can do it using `docker build -t gitea_armv7 .` 
and upload to your docker hub. 

If you decide to build yout own docker image you can do it using `docker build -t your_image_name .`
but you will have to modify the docker-compose file by deleting the *build: .* line
in the app object and discomment and put your image name in the *#image: your_image_name*

## Deployment

Before deployment you have to change the docker-compose file by editing the 
ENVIRONMENT VARIABLES so you can set your mysql passowrd, mysql dabase name and so on.

To deploy the app you just need to use the `docker-compose`.
To do this, go to the file where you have the Dockerfile and docker-compose files
run the following command (You should read the **[Installing](#installing)** section before)

```sh
docker-compose up -d
```

Also keep in mind that if you use this docker-compose without modify the volumes
the data will be stored in a directory called data in the same directory of the docker-compose.

**[Back to top](#table-of-contents)**

## Acknowledgments

The Dockerfile has been taken from this [gitea issue comment](https://github.com/go-gitea/gitea/issues/531#issuecomment-289451101)
and has been barely modified.

**[Back to top](#table-of-contents)**
