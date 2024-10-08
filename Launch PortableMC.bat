@echo off
setlocal

pip install portablemc --target="%CD%\PortableMC"
set PYTHONPATH=%CD%\PortableMC
set portablemc_path=PortableMC\bin\portablemc.exe

rem default variables
    set /p mc_path="Enter the Minecraft installation directory path you want to use : "
    set /p user_path="Enter the User directory path you want to use : "

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


    %portablemc_path% search
    set /p ver="Enter the minecraft version (You can add 'fabric:' or 'forge:' before the version number to specify the loader you want to use) : "
    set /p ram="Enter the number of GB of ram you want to allocate to Minecraft : "

rem choice if online or offline
    choice /c YN /n /m "Launch in online mode? (y/n): "
        if %errorlevel% equ 1 goto online
        if %errorlevel% equ 2 goto offline

    :online
        set /p email="Enter your Microsoft account email : "
        rem set the mode to online
            set mode=-l="%email%"
        goto end

    :offline
        set /p pseudo="Enter your pseudo : "
        rem set the mode to offline
            set mode=-u="%pseudo%"
        goto end

    :end

rem execute with jvm args
    %portablemc_path% --main-dir="%mc_path%" --work-dir="%user_path%" start %ver% %mode% --jvm-args="-Xmx%ram%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

pause
endlocal
