# Descargar la imagen base de Ubuntu
FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y 

# Actualizar el sistema e instalar PHP
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php && apt-get clean

# Copiar los archivos de tu aplicación al directorio de trabajo
COPY ./webapp /var/www/html/

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Exponer el puerto 8080
EXPOSE 8080

# Ejecutar el servidor embebido de PHP en el puerto 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
