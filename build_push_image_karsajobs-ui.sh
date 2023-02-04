#!/bin/sh

# membuat image baru dari Dockerfile yang berada di direktori ini
docker build -t karsajobs-ui:latest .

# menampilkan daftar image yang ada
docker images

# membuat tag untuk image yang baru dibuat , tag ini akan digunakan untuk push image ke GitHub Container Registry
docker tag karsajobs-ui:latest ghcr.io/louisaldorio/karsajobs-ui:latest

# melakukan echo untuk memasukkan CR_PAT (GitHub Personal Access Token) ke dalam docker login
echo $CR_PAT | docker login ghcr.io -u louisaldorio --password-stdin

# melakukan push image ke GitHub Container Registry
docker push ghcr.io/louisaldorio/karsajobs-ui:latest