@echo off
setlocal

rem Chemin complet vers portablemc
set portablemc_path=%appdata%\Python\Python39\Scripts\portablemc.exe

rem Variables
set email=
set path=
set ver=
set ram=

rem Verification du portablemc_path
if not exist %portablemc_path% (
    echo Le chemin %portablemc_path% n'existe pas. Veuillez verifier l'installation.
    PAUSE
    exit /b 1
)

rem Verification du path
if not exist "%path%" (
    echo Le chemin specifie n'existe pas. Veuillez verifier que le dossier existe bien.
    PAUSE
    exit /b 1
)

rem Execute portablemc avec les arguments
%portablemc_path% --main-dir="%path%" --work-dir="%path%" start %ver% -l="%email%" --jvm-args="-Xmx%ram%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

PAUSE
endlocal