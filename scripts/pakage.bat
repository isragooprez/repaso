@echo off
set workspace=C:\Users\bo0414\eclipse-workspace\repasov
::Las variables de entorno se pueden configurar directamente en Windows cuando se tienen los permisos necesarios
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_31
set M2_HOME=D:\apache-maven-3.5.2
set PATH=%PATH%;%JAVA_HOME%\bin;%M2_HOME%\bin
echo -----------------------------------------
echo . (C) MIW
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo JAVA_HOME --- %JAVA_HOME%
echo M2_HOME   --- %M2_HOME%
echo .
cd %workspace%

echo ============ mvn clean test (profile: develop) =======================================================
echo .
call mvn clean test --settings settings.xml

echo ============ mvn -Dmaven.test.skip=true package (profile: preproduction) =======================================================
echo .
call mvn -Dmaven.test.skip=true -Denvironment.type=preproduction package 

pause