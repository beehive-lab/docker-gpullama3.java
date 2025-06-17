#!/bin/bash 

TAG_VERSION=v0.1.0-beta

function buildDockerImage() {
    IMAGE=$1
    FILE=$2
    docker build --progress=plain -t $IMAGE -f $FILE .
    docker tag $IMAGE beehivelab/$IMAGE:$TAG_VERSION
    docker tag $IMAGE beehivelab/$IMAGE:latest
}

function nvidiaJDK21OCL() {
    docker volume create data
    buildDockerImage "gpullama3.java-nvidia-openjdk-opencl" "dockerFiles/Dockerfile.nvidia.jdk21.ocl"
}

function nvidiaJDK21PTX() {
    docker volume create data
    buildDockerImage "gpullama3.java-nvidia-openjdk-ptx" "dockerFiles/Dockerfile.nvidia.jdk21.ptx"
}

function printHelp() {
    echo "GPULlama3.java Docker Build"
    echo -e "\nOptions: "
    echo "Builds for NVIDIA Compute Platforms: GPUs"
    echo "       --nvidia-jdk21-ocl	(OpenCL) : Build Docker Image for NVIDIA GPUs using JDK21 and OpenCL"
    echo "       --nvidia-jdk21-ptx	(PTX) : Build Docker Image for NVIDIA GPUs using JDK21 and PTX"
    exit 0
}

POSITIONAL=()

if [[ $# == 0 ]] 
then
    printHelp
    exit
fi

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
  --help)
    printHelp
    shift
    ;;
  --nvidia-jdk21-ocl)
    nvidiaJDK21OCL
    shift
    ;;
  --nvidia-jdk21-ptx)
    nvidiaJDK21PTX
    shift
    ;;
  esac
done
