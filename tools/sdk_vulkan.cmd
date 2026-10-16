@echo off
rem Uso: sdk_vulkan.cmd configure ^| build ^| install
rem Configura/compila/instala o SDK com o backend Vulkan ligado.
setlocal enableextensions
set "BT=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"
set "LLVM=%BT%\VC\Tools\Llvm\x64\bin"
set "CMAKEDIR=%BT%\Common7\IDE\CommonExtensions\Microsoft\CMake"
set "CMAKE=%CMAKEDIR%\CMake\bin\cmake.exe"
set "P2=C:\Users\MeowA\Documents\Prototype2-Recompiled"
call "%BT%\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
set "PATH=%LLVM%;%CMAKEDIR%\CMake\bin;%CMAKEDIR%\Ninja;%PATH%"
cd /d "%~dp0.."

if /i "%~1"=="configure" (
    echo === CONFIGURE VULKAN %DATE% %TIME% ===
    "%CMAKE%" --preset win-amd64 -DREXGLUE_USE_VULKAN=ON
    exit /b %ERRORLEVEL%
)
if /i "%~1"=="build" (
    echo === BUILD VULKAN %DATE% %TIME% ===
    "%CMAKE%" --build out/build/win-amd64 --config RelWithDebInfo --parallel
    exit /b %ERRORLEVEL%
)
if /i "%~1"=="install" (
    echo === INSTALL VULKAN %DATE% %TIME% ===
    "%CMAKE%" --install out/build/win-amd64 --config RelWithDebInfo --prefix "%P2%\tools\sdk-bin\win-amd64"
    exit /b %ERRORLEVEL%
)
echo uso: sdk_vulkan.cmd configure ^| build ^| install
exit /b 1
