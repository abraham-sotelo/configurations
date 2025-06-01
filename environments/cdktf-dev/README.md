## Setup
Create symbolic links in the workspace
```bash
ln -s ~/configurations/environments/cdktf-dev/Dockerfile /path/to/workspace/symlink
ln -s ~/configurations/environments/cdktf-dev/build_docker.sh /path/to/workspace/symlink
```

From the workspace build the docker image
```bash
./build_docker.sh
```

Run the docker image
```bash
docker run --name cdktf-dev -v path/to/cdktf/project:/path/in/container -u ${USER} -it cdktf-dev:1.0
```

In order to run `cdktf synth`, Terradorm must authenticate to teh cloud provider. To authenticate with GCP run
```bash
gcloud auth application-default login
``` 

*[Optional]* In VSCode attach to the running container https://code.visualstudio.com/docs/devcontainers/attach-container


If you need to rebuild the container, stop it and remove it.
```bash
docker rm cdktf-dev
```