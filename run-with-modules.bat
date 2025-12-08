@echo off
mvn clean package -DskipTests
java --module-path "target/classes" --add-modules javafx.controls,javafx.graphics -jar target/project-maven-1.0.jar
pause