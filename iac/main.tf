terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 1. Red (Network)
resource "docker_network" "private_network" {
  name = "backend_network"
}

# 2. Contenedor BD
resource "docker_container" "db" {
  name  = "bd"
  image = "postgres:latest"
  networks_advanced { name = docker_network.private_network.name }
  env   = ["POSTGRES_PASSWORD=password123"]
  ports {
    internal = 5432
    external = 4003
  }
}

# 3. Contenedor API
resource "docker_container" "api" {
  name  = "api01"
  image = "amazoncorretto:17-alpine-jdk" # Imagen corregida
  networks_advanced { name = docker_network.private_network.name }
  ports {
    internal = 8080
    external = 4002
  }
  command = ["tail", "-f", "/dev/null"]
}

# 4. Contenedor WEB (Aquí estaba el error, ahora se llama "web")
resource "docker_container" "web" {
  name  = "web-LOCAL-01"
  image = "nginx:latest"
  networks_advanced { name = docker_network.private_network.name }
  ports {
    internal = 80
    external = 4001
  }
}