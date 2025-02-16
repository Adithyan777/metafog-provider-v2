
---

# Docker Buildx Multi-Architecture Build Setup

This guide explains how to set up Docker Buildx for building multi-architecture images and pushing them to your Docker registry.

> **Note:**  
> - On **macOS/Windows**, Docker Desktop comes with Buildx pre-installed.  
> - On **Linux**, you may need to install Buildx manually.

---

## 1. Setup Your Buildx Builder

Create a new builder instance using the `docker-container` driver and bootstrap it:

```bash
docker buildx create --name mybuilder --driver docker-container --bootstrap
```

---

## 2. Use the Newly Created Builder

Set `mybuilder` as the active builder:

```bash
docker buildx use mybuilder
```

---

## 3. Verify the Active Builder

Double-check that the builder has been switched. The active builder will have an asterisk (`*`) next to it.

```bash
docker buildx ls
```

**Expected Output Example:**

```
NAME/NODE           DRIVER/ENDPOINT                   
mybuilder*          docker-container                                       
 └─ mybuilder0      unix:///var/run/docker.sock   running   v0.19.0    linux/amd64 (+2), linux/arm64, linux/arm (+2), linux/ppc64le, (3 more)
```

> **Note:**  
> If the builder used is still the default one, close and reopen the Docker Desktop app or restart the Docker daemon.

---

## 4. Login to Your Docker Account

Make sure you have logged in to your Docker account before proceeding:

```bash
docker login
```

---

## 5. Build and Push the Multi-Architecture Image

Build the multi-arch image and push it to your Docker registry. Replace `username/image-name:tag-name` with your desired image name and tag.

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag username/image-name:tag-name \
  --push \
  .
```

---