# Docker Create React App

## Description

The Docker image for running create-react-app in a container.

[Docker Hub Link](https://hub.docker.com/r/henryc/docker-create-react-app)

## Usage

### Method 1: Directly mount the parent directory in a container

``` sh
$ cd /path/to/parent/dir
$ docker run --rm -v $(pwd):/opt/project henryc/docker-create-react-app yarn create react-app app-name
```

> **`app-name` can ONLY contain lowercase letters and dash '-'.**

### Method 2: Use a helper shell function

Add the following shell function to `~/.profile`, `~/.bashrc`, or `~/.zshrc` depends on the shell you use.

``` sh
# docker-create-react-app helper function
docker-create-react-app() {
  dcra_app_name=$1
  dcra_first_empty_check=true
  while true; do
    if [[ -z "$dcra_app_name" ]]; then
      if [[ ! $dcra_first_empty_check ]]; then
        echo 'Hmmm... App Name cannot be empty :('
      fi
      dcra_first_empty_check=false
      printf 'Enter App Name: '
      read dcra_app_name
      continue
    fi
    if [[ -d "$dcra_app_name" ]]; then
      echo 'Ooop... that name has been taken by another directory here :('
      printf 'Enter App Name: '
      read dcra_app_name
      continue
    fi
    if $(echo "$dcra_app_name" | grep -qe '[A-Z]'); then
      echo "Bummer... we cannot use UPPERCASE letters for React App Name. SERIOUSLY"
      printf 'Enter App Name: '
      read dcra_app_name
      continue
    fi
    break
  done

  echo "Creating $dcra_app_name ..."

  docker run --rm -v $(pwd):/opt/project henryc/docker-create-react-app \
    yarn create react-app "$dcra_app_name"
}
```

After adding the helper shell function, use `$ exec "$SHELL" -l` command to restart your shell. To create a new React App, you can run following commands:

``` sh
$ cd /path/to/parent/dir
$ docker-create-react-app app-name
```
