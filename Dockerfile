# Utiliza una imagen base con OpenJDK 17 slim
FROM openjdk:17-slim

# Actualiza y instala wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Configura el directorio de trabajo
WORKDIR /minecraft

# Descarga el servidor de Minecraft (ejemplo con la última versión)
ARG MC_VERSION=1.18.1
RUN wget -q "https://launcher.mojang.com/v1/objects/${MC_VERSION}/server.jar" -O server.jar

# Copia los archivos de configuración necesarios
COPY config/ ./config
COPY eula.txt .

# Expone el puerto del servidor Minecraft
EXPOSE 25565

# Comando para ejecutar el servidor de Minecraft
CMD ["java", "-Xmx2G", "-jar", "server.jar", "nogui"]
