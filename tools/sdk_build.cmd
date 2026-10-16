@echo off
setlocal enableextensions
set "BT=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"
set "LLVM=%BT%\VC\Tools\Llvm\x64\bin"
set "CMAKEDIR=%BT%\Common7\IDE\CommonExtensions\Microsoft\CMake"
set "CMAKE=%CMAKEDIR%\CMake\bin\cmake.exe"
call "%BT%\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
set "PATH=%LLVM%;%CMAKEDIR%\CMake\bin;%CMAKEDIR%\Ninja;%PATH%"
cd /d "%~dp0.."
echo === INICIO SDK BUILD %DATE% %TIME% ===
"%CMAKE%" --build out/build/win-amd64 --config RelWithDebInfo --parallel
set "SALIDA=%ERRORLEVEL%"
echo === FIN %DATE% %TIME% SDK_BUILD_SALIDA=%SALIDA% ===
exit /b %SALIDA%
