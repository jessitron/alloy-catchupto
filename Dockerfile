FROM openjdk:8-jdk-buster

RUN apt update && apt install -y libxtst6 libxrender1

RUN git clone https://github.com/AlloyTools/org.alloytools.alloy.git

WORKDIR /org.alloytools.alloy

RUN ./gradlew build

ENV DISPLAY=host.docker.internal:0.0

# run Alloy GUI
# You need --env DISPLAY=<host IP>:0.0 in your docker run command for this
CMD ["java", "-jar", "org.alloytools.alloy.dist/target/org.alloytools.alloy.dist.jar"]