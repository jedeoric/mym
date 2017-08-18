@echo off

::
:: Assemble the music player
::
rem ECHO Assembling music player

rem %OSDK%\bin\header -h1 -a0 build\mymplayer.o build\mymplayer.tap $6500

SET BINARYFILE=mym
SET PATH_RELEASE=build\usr\share\%BINARYFILE%\
SET ORICUTRON="..\..\..\oricutron\"
set VERSION="0.0.1"
SET ORIGIN_PATH=%CD%
echo %osdk%
          
mkdir build\usr\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%
mkdir build\usr\share\man
          

%OSDK%\bin\xa.exe -v -R -cc src\mymDbug.s -o src\mymplayer.o -DTARGET_FILEFORMAT_O65
co65  src\mymplayer.o -o src\mymcc65.s

cl65 -ttelestrat src/%BINARYFILE%.c src\mymcc65.s -o build\usr\bin\%BINARYFILE%

copy src\man\%BINARYFILE%.hlp build\usr\share\man

rem this next line create release
IF "%1"=="NORUN" GOTO End
copy build\usr\bin\%BINARYFILE% %ORICUTRON%\usbdrive\bin
mkdir %ORICTRON%\usbdrive\usr\share\%BINARYFILE%\ 

xcopy build\usr\share\%BINARYFILE%\* %ORICUTRON%\usbdrive\usr\share\%BINARYFILE%\  /E /Q /Y
copy src\man\%BINARYFILE%.hlp %ORICUTRON%\usbdrive\usr\share\man\
rem copy README.md %ORICUTRON%\usbdrive\usr\share\mkdir\
cd %ORICUTRON%
OricutronV4 -mt 
cd %ORIGIN_PATH%
:End

rem copy  ghost.com ..\..\..\..\..\..\oricutron\usbdrive\
rem copy  release\mym ..\..\..\..\..\..\oricutron\usbdrive\





