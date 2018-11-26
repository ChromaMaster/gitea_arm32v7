user=chromamaster
repository=gitea_armv7
tag=latest
docker build --no-cache -t ${user}/${repository}:${tag} .
