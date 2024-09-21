@echo off
setlocal

pip install portablemc --target="%CD%\PortableMC"
set PYTHONPATH=%CD%\PortableMC
set portablemc_path=PortableMC\bin\portablemc.exe

rem variables
    set mc_path=%CD%
    set user_path=%CD%

    rem Verification of path
        if not exist "%mc_path%" (
            echo the path %mc_path% doesn't exist.
            PAUSE
            exit /b 1
        )
        if not exist "%user_path%" (
            echo the path %user_path% doesn't exist.
            PAUSE
            exit /b 1
        )
        
    set ver=
    set ram=
    set email=

rem execute with jvm args
    %portablemc_path% --main-dir="%mc_path%" --work-dir="%user_path%" start %ver% -l="%email%" --jvm-args="-Xmx%ram%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

pause
endlocal
