# iac-lab01-martes

Tenemos código de una aplicación web. Se compone por un archivo HTML que tiene como contenido: WEB01

Quiero poder publicar esta web, especificamente una sola copia como primera instancia

TAREA lab 02:

Desplegar dos web, mostrar Web01, y Web02 como contenido
Los puertos deben estar configurados en 4000 y 4001
Gestionar carpetas para orden
Hacer uso de Gitflow/Conventional Commits
Este proyecto despliega una arquitectura de tres capas (Web, API y Base de Datos) utilizando Terraform y Docker.

## Arquitectura
- WEB01: Servidor Nginx (Puerto local: 4001)
- API: Aplicación Java 17 (Puerto local: 4002)
- BD: Base de Datos PostgreSQL (Puerto local: 4003)

## Requisitos Previos
- Docker Desktop instalado y corriendo.
- Terraform instalado en el sistema.

## Instrucciones de Despliegue

Siga estos comandos en la terminal para levantar la infraestructura:

1. Entrar a la carpeta de infraestructura:**
   cd iac
- Inicializar Terraform: terraform init
- Validar la configuración: terraform plan
- Aplicar los cambios y crear los contenedores: terraform apply 
Paso 2: Guardar cambios con "Conventional Commits"

Escribe estos comandos uno por uno:

1.  Preparar el archivo:
    git add README.md
    
2.  Hacer el commit con el formato correcto:
    git commit -m "docs: agregar instrucciones de despliegue en README.md"

3.  Subir a GitHub:
    bash
    git push
