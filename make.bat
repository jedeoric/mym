@echo off

::
:: Assemble the music player
::
rem ECHO Assembling music player

rem %OSDK%\bin\header -h1 -a0 build\mymplayer.o build\mymplayer.tap $6500

REM COPY from make file from touch

SET BINARYFILE=mym
SET PATH_RELEASE=build\usr\share\%BINARYFILE%\
SET ORICUTRON="..\..\..\oricutron\"
set VERSION=1.0.0
SET ORIGIN_PATH=%CD%
echo %osdk%
SET PATH=%PATH%;%CC65%

echo Cleaning build folder

rem del /F /S /Q build\
          
mkdir build\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%
mkdir build\usr\share\man
IF NOT EXIST build\usr\share\ipkg mkdir build\usr\share\ipkg      

echo #define VERSION "%VERSION%" > src\version.h
rem  123456789012345678
echo | set /p dummyName=mym       1.0.0  Play a mym file > src\ipkg\%BINARYFILE%.csv

copy README.md build\usr\share\doc\%BINARYFILE%\

%OSDK%\bin\xa.exe -v -R -cc src\mymDbug.s -o src\mymplayer.o -DTARGET_FILEFORMAT_O65 -DTARGET_ORIX
co65  src\mymplayer.o -o src\mymcc65.s

cl65 -ttelestrat src/%BINARYFILE%.c src\mymcc65.s -o build\bin\%BINARYFILE%

copy src\man\%BINARYFILE%.hlp build\usr\share\man

rem this next line create release
IF "%1"=="NORUN" GOTO End
copy build\bin\%BINARYFILE% %ORICUTRON%\usbdrive\bin
mkdir %ORICTRON%\usbdrive\usr\share\%BINARYFILE%\ 

xcopy build\usr\share\%BINARYFILE%\* %ORICUTRON%\usbdrive\usr\share\%BINARYFILE%\  /E /Q /Y
copy src\man\%BINARYFILE%.hlp %ORICUTRON%\usbdrive\usr\share\man\

IF NOT EXIST %ORICUTRON%\usbdrive\usr\share\doc\%BINARYFILE%\ mkdir %ORICUTRON%\usbdrive\usr\share\doc\%BINARYFILE%\
copy README.md %ORICUTRON%\usbdrive\usr\share\doc\%BINARYFILE%\
IF NOT EXIST %ORICUTRON%\usbdrive\usr\share\ipkg\ mkdir %ORICUTRON%\usbdrive\usr\share\ipkg\
copy src\ipkg\%BINARYFILE%.csv %ORICUTRON%\usbdrive\usr\share\ipkg\

rem copy README.md %ORICUTRON%\usbdrive\usr\share\mkdir\
cd %ORICUTRON%
OricutronV4 -mt 
cd %ORIGIN_PATH%
:End

rem copy  ghost.com ..\..\..\..\..\..\oricutron\usbdrive\
rem copy  release\mym ..\..\..\..\..\..\oricutron\usbdrive\





