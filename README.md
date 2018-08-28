# Docker Create React App

## Description

The Docker image for running create-react-app in a container.

[Docker Hub Link](https://hub.docker.com/r/henryc/docker-create-react-app)

## Usage

Mount the parent directory in a container

``` sh
cd /path/to/parent/dir
$ docker run --rm -v $(pwd):/opt/project henryc/docker-create-react-app yarn create react-app app-name
cd app-name
```

> **`app-name` can ONLY contain lowercase letters and dash '-'.**
