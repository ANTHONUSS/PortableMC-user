@echo off
setlocal

rem Chemin complet vers portablemc
set portablemc_path=%localappdata%\Programs\Python\Python312\Scripts\portablemc.exe
rem Verifie que portablemc_path est correct
if not exist %portablemc_path% (
    echo Le chemin %portablemc_path% n'existe pas. Veuillez verifier l'installation.
    PAUSE
    exit /b 1
)

rem Demande le pseudo a l'utilisateur
set /p pseudo="Entrez le pseudo : "

rem demande a l'utilisateur et verifie le directory
set /p path="Entrez le repertoire de Minecraft (la ou portablemc va stocker les donnees de Minecraft) : "
if not exist "%path%" (
    echo Le chemin specifie n'existe pas. Veuillez verifier que le dossier existe bien.
    PAUSE
    exit /b 1
)

%portablemc_path% search
set /p ver="Entrez la version de Minecraft (Vous pouvez rajouter 'fabric:' ou 'forge:' avant le numero de version pour preciser quel modloader utiliser) : "

rem Execute portablemc avec les arguments
%portablemc_path% --main-dir="%path%" --work-dir="%path%" start %ver% -u="%pseudo%"

PAUSE
endlocal