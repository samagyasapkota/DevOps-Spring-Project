FROM maven:3.8-openjdk-8 AS build

WORKDIR /app
COPY JavaApp-CICD/pom.xml .
RUN mvn dependency:go-offline -B

COPY JavaApp-CICD/ .
# Build with H2 profile (default, no external database)
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk8

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/local/tomcat/webapps/*
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

COPY --from=build /app/target/petclinic.war /usr/local/tomcat/webapps/
RUN cd /usr/local/tomcat/webapps && unzip -q petclinic.war -d ROOT && rm petclinic.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
