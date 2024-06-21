FROM docker.io/library/openjdk:17-slim

ENV MC_VERSION="1.18.1"
ENV MC_JAR="server.jar"

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

# Descargamos el servidor de Minecraft
RUN wget -q "https://launcher.mojang.com/v1/objects/${MC_VERSION}/server.jar" -O ${MC_JAR}

# Creamos el archivo de propiedades del servidor
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
