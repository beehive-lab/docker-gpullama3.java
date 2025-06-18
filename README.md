# Docker Support for GPULlama3.java on NVIDIA GPUs

Run **GPULlama3.java** on NVIDIA GPUs using Docker with either **OpenCL** or **PTX** support.

---

## 🛠 Requirements

- **NVIDIA GPU** with compatible drivers
- **NVIDIA Container Toolkit** installed  
  👉 [Install Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

---

## 🚀 Quick Start

### 1. Pull a Docker Image

**OpenCL:**
```bash
docker pull beehivelab/gpullama3.java-nvidia-openjdk-opencl:latest
```

**PTX:**
```bash
docker pull beehivelab/gpullama3.java-nvidia-openjdk-ptx:latest
```

---

### 2. Clone the Runner Scripts Repository

```bash
git clone https://github.com/beehive-lab/docker-gpullama3.java
cd docker-gpullama3.java
```

---

### 3. Download a Model

Download a model from huggingface, as shown in [GPULlama3.java](https://github.com/beehive-lab/GPULlama3.java#download-model-files). For example:
```bash
wget https://huggingface.co/beehive-lab/Llama-3.2-1B-Instruct-GGUF-FP16/resolve/main/beehive-llama-3.2-1b-instruct-fp16.gguf
```

---

### 4. Run a Prompt

**OpenCL Runner:**
```bash
./dockerized-llama-tornado-nvidia-opencl \
  --gpu --opencl --verbose-init \
  --model beehive-llama-3.2-1b-instruct-fp16.gguf \
  --prompt "tell me a joke"
```

**PTX Runner:**
```bash
./dockerized-llama-tornado-nvidia-ptx \
  --gpu --ptx --verbose-init \
  --model beehive-llama-3.2-1b-instruct-fp16.gguf \
  --prompt "tell me a joke"
```

> Sample Output:
> ```
> Here's one:
> What do you call a fake noodle?
> An impasta!
> ```

---

## 🧱 Build the GPULlama3.java Docker Images

To build the Docker images locally, use the provided `build.sh` script:

```bash
./build.sh
```

### Build Options

Build for **NVIDIA GPUs** using one of the following flags:

- `--nvidia-jdk21-ocl`  → Build image with **OpenCL** support and **JDK 21**
- `--nvidia-jdk21-ptx`  → Build image with **PTX** support and **JDK 21**

Example:
```bash
./build.sh --nvidia-jdk21-ocl
```

This will create a Docker image ready to run `GPULlama3.java` on NVIDIA GPUs with OpenCL.

---

## License

[![](https://img.shields.io/badge/License-Apache%202.0-orange.svg)](https://opensource.org/licenses/Apache-2.0)

This project is developed at [The University of Manchester](https://www.manchester.ac.uk/), and it is open-source under the [Apache 2](https://github.com/beehive-lab/docker-gpullama3.java/blob/main/LICENSE) license.
