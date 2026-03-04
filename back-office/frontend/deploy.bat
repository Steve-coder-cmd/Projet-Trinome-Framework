@echo off

echo Copie de Framework.jar...
copy "..\..\backend\Framework.jar" "..\lib\"
@echo off

REM Configuration des variables
SET APP_NAME=TestFramework
SET SRC_DIR=src\main\java
SET WEB_DIR=src\main\webapp
SET BUILD_DIR=build
SET LIB_DIR=lib
SET TOMCAT_WEBAPPS=C:\Users\MIAHY\Desktop\ITU\S4\apache-tomcat-10.1.28\webapps
SET FRAMEWORK_JAR=lib\Framework.jar

REM Nettoyage de l'ancien build
if exist %BUILD_DIR% (
    rmdir /s /q %BUILD_DIR%
)
mkdir %BUILD_DIR%\WEB-INF\classes
mkdir %BUILD_DIR%\WEB-INF\lib

REM Compilation des fichiers .java
echo Recherche des fichiers Java...
dir /b /s %SRC_DIR%\*.java > sources.txt
javac -cp "%LIB_DIR%\*;%FRAMEWORK_JAR%" -d %BUILD_DIR%\WEB-INF\classes @sources.txt

REM Copie des librairies nécessaires
copy "%LIB_DIR%\*" "%BUILD_DIR%\WEB-INF\lib"
copy "%FRAMEWORK_JAR%" "%BUILD_DIR%\WEB-INF\lib"

REM Copie des fichiers de configuration web
xcopy %WEB_DIR%\* %BUILD_DIR%\ /s /e /y

REM Création de l'archive WAR
cd %BUILD_DIR%
jar -cvf %APP_NAME%.war *
cd ..

REM Déploiement sur Tomcat
if exist %TOMCAT_WEBAPPS%\%APP_NAME% (
    rmdir /s /q %TOMCAT_WEBAPPS%\%APP_NAME%
)
copy %BUILD_DIR%\%APP_NAME%.war %TOMCAT_WEBAPPS%\

echo.
echo Deploiement termine avec succes!
echo Application accessible sur: http://localhost:8080/%APP_NAME%/
pause
