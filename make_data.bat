
@echo off


SET BINARYFILE=mym

::
echo %osdk%
          
mkdir build\usr\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%\b\
mkdir build\usr\share\%BINARYFILE%\c\
mkdir build\usr\share\%BINARYFILE%\g\
mkdir build\usr\share\%BINARYFILE%\n\
mkdir build\usr\share\%BINARYFILE%\o\
mkdir build\usr\share\%BINARYFILE%\p\
mkdir build\usr\share\%BINARYFILE%\r\
mkdir build\usr\share\%BINARYFILE%\s\
mkdir build\usr\share\%BINARYFILE%\t\
mkdir build\usr\share\man

SET YM2MYM=%osdk%\Bin\ym2mym.exe -h0 -m15872 -t0
SET PATH_RELEASE=build\usr\share\mym\

echo Generating B Letter
%YM2MYM% "data\Bubble Bobble 1.ym"               %PATH_RELEASE%\b\bubblebo.mym              

echo Generating C Letter
%YM2MYM% "data\Commando.ym"                     %PATH_RELEASE%\c\commando.mym                         

echo Generating G Letter
%YM2MYM% "data\The Real Ghostbusters 1.ym"       %PATH_RELEASE%\g\ghostbus.mym      
%YM2MYM% "data\Great Giana Sisters 1 - title.ym" %PATH_RELEASE%\g\gianatit.mym 

echo Generating N Letter
%YM2MYM% "data\Nebulus.ym"                       %PATH_RELEASE%\n\nebulus.mym

echo Generating O Letter
%YM2MYM% "data\Outrun 1.ym"                      %PATH_RELEASE%\o\outrun.mym                           

echo Generating P Letter
%YM2MYM% "data\Pacmania 1.ym"                    %PATH_RELEASE%\p\pacmania.mym                     

echo Generating R Letter
%YM2MYM% "data\Rainbow Island  1.ym"             %PATH_RELEASE%\r\rainbowi.mym           

echo Generating S Letter
%YM2MYM% "data\Speedball 1.ym"                   %PATH_RELEASE%\s\speedbal.mym                     
%YM2MYM% "data\Supercars 1.ym"                   %PATH_RELEASE%\s\supercar.mym           

echo Generating T Letter
%YM2MYM% "data\Tetris title.ym"                  %PATH_RELEASE%\t\tetris.mym   





