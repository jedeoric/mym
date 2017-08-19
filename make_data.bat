
@echo off


SET BINARYFILE=mym

::
echo %osdk%
          
mkdir build\usr\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%
mkdir build\usr\share\%BINARYFILE%\games\
mkdir build\usr\share\%BINARYFILE%\4mat\
mkdir build\usr\share\%BINARYFILE%\bigalec\
mkdir build\usr\share\man

SET YM2MYM=%osdk%\Bin\ym2mym.exe -h0 -m15872 -t0
SET PATH_RELEASE=build\usr\share\mym\

echo Generating Numbers

%YM2MYM% "data\4-mat\Beastbusters 1.ym"                %PATH_RELEASE%\4mat\beastbus.mym

echo Generating B Letter
%YM2MYM% "data\Bubble Bobble 1.ym"               %PATH_RELEASE%\games\bubblebo.mym
%YM2MYM% "data\big-alec\bouncy.ym"               %PATH_RELEASE%\bigalec\bouncy.mym
%YM2MYM% "data\big-alec\orion.ym"               %PATH_RELEASE%\bigalec\orion.mym
%YM2MYM% "data\big-alec\traffic.ym"               %PATH_RELEASE%\bigalec\traffic.mym

rem too long
rem %YM2MYM% "data\big-alec\Judgement day.ym"               %PATH_RELEASE%\bigalec\judgemen.mym



echo Generating C Letter
%YM2MYM% "data\Commando.ym"                     %PATH_RELEASE%\games\commando.mym                         

echo Generating G Letter
%YM2MYM% "data\The Real Ghostbusters 1.ym"       %PATH_RELEASE%\games\ghostbus.mym      
%YM2MYM% "data\Great Giana Sisters 1 - title.ym" %PATH_RELEASE%\games\gianatit.mym 

echo Generating N Letter
%YM2MYM% "data\Nebulus.ym"                       %PATH_RELEASE%\games\nebulus.mym

echo Generating O Letter
%YM2MYM% "data\Outrun 1.ym"                      %PATH_RELEASE%\games\outrun.mym                           

echo Generating P Letter
%YM2MYM% "data\Pacmania 1.ym"                    %PATH_RELEASE%\games\pacmania.mym                     

echo Generating R Letter
%YM2MYM% "data\Rainbow Island  1.ym"             %PATH_RELEASE%\games\rainbowi.mym           

echo Generating S Letter
%YM2MYM% "data\Speedball 1.ym"                   %PATH_RELEASE%\games\speedbal.mym                     
%YM2MYM% "data\Supercars 1.ym"                   %PATH_RELEASE%\games\supercar.mym           

echo Generating T Letter
%YM2MYM% "data\Tetris title.ym"                  %PATH_RELEASE%\games\tetris.mym   





