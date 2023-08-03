FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
RUN apt-get install -y git

RUN git clone https://github.com/zc142365/CM_ott.git
RUN cd CM_ott && mvn clean && mvn package

EXPOSE 80 8080

CMD nohup java -jar /CM_ott/target/ott-0.0.1-SNAPSHOT.jar -Dspring.datasource.url=jdbc:mysql://localhost:3306/ottDB >> /CM_ott/target/ott.log
