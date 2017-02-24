@echo off
::
:: Assemble the music player
::
rem ECHO Assembling music player

rem %OSDK%\bin\header -h1 -a0 build\mymplayer.o build\mymplayer.tap $6500



::
echo %osdk%

SET YM2MYM=%osdk%\Bin\ym2mym.exe -h0 -m15872

%YM2MYM% -t0 "data\Bubble Bobble 1.ym" release\usr\share\mym\bubble.mym              
%YM2MYM% -t0 "data\Great Giana Sisters 1 - title.ym" release\usr\share\mym\giana.mym 
%YM2MYM% -t0 "data\Rainbow Island  1.ym" release\usr\share\mym\rainbow.mym           
%YM2MYM% -t0 "data\Pacmania 1.ym" release\usr\share\mym\pacmania.mym                     
%YM2MYM% -t0 "data\Tetris title.ym" release\usr\share\mym\tetris.mym                       
%YM2MYM% -t0 "data\Speedball 1.ym" release\usr\share\mym\speedbal.mym                     
%YM2MYM% -t0 "data\Nebulus.ym" release\usr\share\mym\nebulus.mym                           
%YM2MYM% -t0 "data\Outrun 1.ym" release\usr\share\mym\outrun.mym                           
%YM2MYM% -t0 "data\Commando.ym" release\usr\share\mym\commando.mym                         
%YM2MYM% -t0 "data\The Real Ghostbusters 1.ym" release\usr\share\mym\ghostbus.mym      
%YM2MYM% -t0 "data\Supercars 1.ym" release\usr\share\mym\supercars.mym                     

rem %osdk%\bin\bin2txt -s1 -f2 -h1 mym\Ghostbusters.mym   mym\music.inc music_mym

rem %osdk%\bin\xa mymplayer.s -o mym -DTARGET_TELEMON

%osdk%\bin\xa  -c mymplayer.s  -DTARGET_TELEMON 


rem %osdk%\bin\xa mymplayer.s -o ghost.o -l xalist.txt
rem %osdk%\bin\header  -a1  ghost.o ghost.tap $1000


rem copy  ghost.tap ..\..\..\..\..\..\oricutron\tapes\
rem copy  ghost.com ..\..\..\..\..\..\oricutron\usbdrive\
rem copy  release\mym ..\..\..\..\..\..\oricutron\usbdrive\




