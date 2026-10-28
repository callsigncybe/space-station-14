@echo off
rem Inicia el servidor [ES][MRP] Argentea Station ya compilado (bin\Content.Server).
rem Para compilarlo: dotnet build -c Release Content.Server\Content.Server.csproj
title [ES][MRP] Argentea Station
cd /d "%~dp0bin\Content.Server"

if not exist "Content.Server.exe" (
    echo No se encontro bin\Content.Server\Content.Server.exe.
    echo Compila primero el servidor con:
    echo     dotnet build -c Release Content.Server\Content.Server.csproj
    pause
    exit /b 1
)

tasklist /fi "imagename eq Content.Server.exe" 2>nul | find /i "Content.Server.exe" >nul
if not errorlevel 1 (
    echo Ya hay un servidor abierto: solo puede haber uno a la vez, porque usan el puerto 1212.
    echo Cierra la otra ventana del servidor y vuelve a abrir este archivo.
    pause
    exit /b 1
)

if not exist "server_config.toml" (
    echo No hay server_config.toml: se copia server_config.example.toml.
    copy /y "%~dp0server_config.example.toml" "server_config.toml" >nul
)

echo Iniciando [ES][MRP] Argentea Station en localhost:1212...
echo Para apagar el servidor, cierra esta ventana o escribe "shutdown".
echo.
"%~dp0bin\Content.Server\Content.Server.exe"
echo.
echo El servidor se detuvo.
pause
