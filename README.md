# Sistema de Información para Control y Gestión de Recursos Humanos (SIRRHH)  

## Proyecto de curso de la asignatura de Ingeniería de Software IES - UNI 

### Mini Guía de Instalación del Etorno de Ejecución y Plugins

## Elaborado por:
- Eduardo Castellón
- Carlos Tapia
- Ashly Ramos
- Josías Nicaragua
- María Valverde
- Nayely Martinica

### Requisitos para la Instalación del Entorno de Ejecución

### GIT para Windows

![Imagen](./img/git.png)

Link:
<https://git-scm.com/downloads>


#### MySQL WorkBench 8.0

![Imagen](./img/mysql.png)

Link:
<https://www.mysql.com/products/workbench/>

#### Python en su última versión

![Imagen](./img/python.png)

Link:
<https://www.python.org/downloads/>

## Pasos

#### 1. Clonar el repositorio, copiando la URL mostrada o descargando el ZIP

![Imagen](./img/gitclone.png)

##### En caso de clonarlo, se deposita en la consola de git en un directorio

![Imagen](./img/bashhere.png)

##### En la consola de git abierta escribimos 'git clone' y pega

![Imagen](./img/clone.png)

#### Ahi se encuentran los directorios de las BD y el código fuente.

#### 2. Navegar hasta el código fuente y ejecutarlo.

Abre una consola de git ahí mismo y navega 'cd SI-RRHH-3T1-S/SIRRHHv1/SIRRH'

Luego, aplicar el siguiente comando python (que ya debería estar instalado) para instalar los plugins:

![Imagen](./img/require.png)

#### 3. Hacer las migraciones del ORM con el siguiente comando:

![Imagen](./img/migrate.png)

#### 4. Si todo se ha hecho correctamente se hace el siguiente comando:

![Imagen](./img/run.png)

#### 5. Ejecutalo en el navegador abriendo la URL

![Imagen](./img/open.png)

Se tiene que copiar y pegar la ruta sombreada