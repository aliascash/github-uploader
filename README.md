# GitHub-Uploader
This repository contains a Dockerfile to create an image with the very
nice tool [github-release](https://github.com/aktau/github-release).
With this tool you can upload respectively deploy any kind of artifacts
to a release tag on GitHub.

## Facts
* Image is based on official _Alpine Linux_ based [_golang_ image](https://hub.docker.com/_/golang/)
* Additional installed packages:
  * git

## Upload Artifacts to GitHub

### Preparation
You should prepare a directory on the host machine, which contains all
files, which should be uploaded to GitHub. This directory will be mounted
into the container.

Additionally you need a proper GitHub access token and put it into the
environemt variable _GITHUB_TOKEN_:

```
export GITHUB_TOKEN=1234568790abcdef
```

### Available commands
To see a list of available commands and options you can run a container
with this command:

```
docker run --rm -it spectreproject/github-uploader:latest github-release --help
```

For further details regarding usage of _github-release_ please see it's
[own GitHub page](https://github.com/aktau/github-release).

### Perfom GitHub upload

To do an upload the usage schema is as follows:

```
docker run \
    --rm \
    -it \
    -e GITHUB_TOKEN=${GITHUB_TOKEN} \
    -v <folder-with-files-to-upload>:/tmp/filesToDeploy \
    spectreproject/github-deployer:latest \
    github-release upload \
        --user <GitHub-user-or-organization-name> \
        --repo <GitHub-repo> \
        --tag <tag-on-GitHub-repo> \
        --name <name-of-file-after-upload> \
        --file /tmp/filesToDeploy/<file-to-upload>
```

All other commands of _github-release_ can be used the same way.

Here's an example for the upload of the file _aTest.txt_, which will be
available as _notes.txt_ on the given tag _latest_:

```
docker run \
    --rm \
    -it \
    -e GITHUB_TOKEN=${GITHUB_TOKEN} \
    -v ~/filesToDeploy:/tmp/filesToDeploy \
    spectreproject/github-deployer:latest \
    github-release upload \
        --user HLXEasy \
        --repo GitHub-Deployer \
        --tag latest \
        --name "notes.txt" \
        --file /tmp/filesToDeploy/aTest.txt
```

### Short explanation of parameters:

```
docker run \
    --rm \                                  # Container will automatically be removed afterwards
    -it \                                   # Start in interactive mode with a virtual terminal
    -v <local-path>:/tmp/filesToDeploy/ \   # Mapping of local data folder into the container
    spectreproject/github-deployer:latest \ # Image to use
    github-release ...                      # Executed command followed by all it's parameters
```

## How to build image from scratch
```
docker build -t spectreproject/github-uploader:latest .
```
