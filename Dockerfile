FROM openjdk:11.0.8-slim
RUN addgroup spring && adduser --ingroup spring --disabled-password spring
USER spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.sayan.docker.DockerDemoApplication"]