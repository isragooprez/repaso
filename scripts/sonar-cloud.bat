@echo off
set workspace=F:\workspace\Oxygen\Santiago.Perez.SVC.miw.upm.es
::Las variables de entorno se pueden configurar directamente en Windows cuando se tienen los permisos necesarios
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_131
set M2_HOME=C:\apache-maven-3.5.0
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
echo ============ mvn sonar:sonar ... =======================================================
echo ================mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify --settings settings.xml  ==========
echo . Se produce la cobertura 
call mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify --settings settings.xml

echo . Calidad de codigo sonarcloud
call mvn sonar:sonar -Dsonar.organization=isragooprez-github -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=8e85915ebde5c3c8fcf4104e35894e9ead06e7a6 --settings settings.xml   
pause

