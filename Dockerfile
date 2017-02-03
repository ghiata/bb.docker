FROM maven:alpine
ENV MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
ADD  settings.xml /root/.m2/
RUN mkdir backbase
WORKDIR backbase
RUN mvn archetype:generate -DarchetypeArtifactId=launchpad-archetype-CXP5.6 -DarchetypeGroupId=com.backbase.launchpad -DarchetypeVersion=2.2.0 -DgroupId=com.backbase.training -DartifactId=badbase -DinteractiveMode=false
WORKDIR /backbase/badbase
RUN mvn clean install -Pclean-database
#RUN bash run.sh