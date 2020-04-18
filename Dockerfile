FROM openjdk:8-jdk-buster

# These help the Java GUI run
RUN apt update && apt install -y libxtst6 libxrender1
# yeah I know I could clean up those apt cache files but it's easier to experiment in the container if I don't

# Clone and build Alloy
RUN git clone https://github.com/AlloyTools/org.alloytools.alloy.git

WORKDIR /org.alloytools.alloy

RUN ./gradlew build

# This works on Windows, and probably Mac, but you may need to override it.
# You need --env DISPLAY=<host IP>:0.0 in your docker run command for this
ENV DISPLAY=host.docker.internal:0.0

# run Alloy GUI by default. You can also run /bin/bash, and run this from there
CMD ["java", "-jar", "org.alloytools.alloy.dist/target/org.alloytools.alloy.dist.jar"]