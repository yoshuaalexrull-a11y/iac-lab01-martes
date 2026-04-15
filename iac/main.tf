terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 1. Crear la Red (NETWORK)
resource "docker_network" "private_network" {
  name = "backend_network"
}

# 2. Contenedor de Base de Datos (PostgreSQL)
resource "docker_container" "db" {
  name  = "bd"
  image = "postgres:latest"
  networks_advanced { name = docker_network.private_network.name }
  env = [
    "POSTGRES_PASSWORD=password123"
  ]
  ports {
    internal = 5432
    external = 4003 # Puerto Default de tu imagen
  }
}

# 3. Contenedor de API (Java 17)
resource "docker_container" "api" {
  name  = "api01"
  image = "openjdk:17-jdk-slim" # Imagen base Java 17
  networks_advanced { name = docker_network.private_network.name }
  ports {
    internal = 8080
    external = 4002 # Puerto Default de tu imagen
  }
  command = ["tail", "-f", "/dev/null"] # Mantiene el contenedor vivo
}

# 4. Contenedor Web (Nginx)
resource "docker_container" "api" {
  name  = "api01"   # <--- AGREGA ESTA LÍNEA
  image = "openjdk:17-jdk-slim"
  networks_advanced { name = docker_network.private_network.name } # <--- TAMBIÉN AGREGA ESTO
  ports {
    internal = 8080
    external = 4002
  }
  command = ["tail", "-f", "/dev/null"]
}