@echo off
setlocal

rem Chemin complet vers portablemc
set portablemc_path=%appdata%\Python\Python39\Scripts\portablemc.exe

rem Variables
set /p email="Entrez votre email : "
set /p path="Entrez le repertoire de Minecraft (la ou portablemc va stocker les donnees de Minecraft) : "
%portablemc_path% search
set /p ver="Entrez la version de Minecraft (Vous pouvez rajouter 'fabric:' ou 'forge:' avant le numero de version pour preciser quel modloader utiliser) : "
set /p ram="Entrez le nombre de Go de RAM que vous voulez allouer a Minecraft : "

rem Verification du portablemc_path
if not exist "%portablemc_path%" (
    echo Le chemin %portablemc_path% n'existe pas. Veuillez verifier l'installation.
    PAUSE
    exit /b 1
)
rem Verification du path
if not exist "%path%" (
    echo Le chemin %path% n'existe pas. Veuillez verifier l'installation.
    PAUSE
    exit /b 1
)

rem Execute portablemc avec les arguments
%portablemc_path% --main-dir="%path%" --work-dir="%path%" start %ver% -l="%email%" --jvm-args="-Xmx%ram%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

PAUSE
endlocal
