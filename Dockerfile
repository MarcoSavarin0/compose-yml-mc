# Utilizamos la imagen oficial de OpenJDK como base
FROM openjdk:17-slim

# Variables de entorno
ENV MC_VERSION="1.18.1" \
    MC_RAM="2G" \
    MC_JAR="server.jar"

# Instalamos wget para descargar archivos
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Creamos un directorio donde se ubicará el servidor de Minecraft
WORKDIR /minecraft

# Descargamos el servidor de Minecraft
RUN wget -q "https://launcher.mojang.com/v1/objects/${MC_VERSION}/server.jar" -O ${MC_JAR}

# Creamos el archivo de propiedades del servidor
RUN echo "eula=true" > eula.txt

# Puerto que utilizará el servidor
EXPOSE 25565

# Comando para iniciar el servidor
CMD ["java", "-Xmx${MC_RAM}", "-jar", "server.jar", "nogui"]
