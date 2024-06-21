FROM openjdk:17-jdk

COPY spigot-1.20.4.jar /app/spigot-1.20.4.jar

WORKDIR /app

CMD ["java","-jar", "spigot-1.20.4.jar", "nogui"]