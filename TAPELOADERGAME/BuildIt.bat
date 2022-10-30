REM *** TAPE TOOL BUILD V1.0.0.5 SUITABLE FOR FOR LOADER GAMES ***

REM *** DELETE FILES TO BE UPDATED ***
del _config.a
del *.prg
del *.tap

REM *** ASSEMBLE LOADER GAME SOURCE ***
acme.exe mootilation.asm
REM *** RELOCATE MAIN TARGET GAME ***
acme.exe relocator.asm

REM CONFIGURE THE LOADER 
echo EnableBlockChecksum = 1 >>_config.a
echo TapeTurboSpeed = $80 >>_config.a
echo SmallLoader = 1 >>_config.a

echo Assembling with ACME
acme.exe --lib  ../ --lib ../../  -v3 --msvc Loaders.a

echo WRITING EVERYTHING TO A TAP FILE
rem Tiny header auto-boot loaders are used so use this...
TapeTool.exe wn "test.tap" m "Loaders.map" ocb1 Loaders.bin otl$c0 otft "Loaders.bin" .RealCodeStart .RealCodeEnd otl$c0 otfb "Loaders.bin" 0 .SpriteDataStart .SpriteDataEnd $200 otl$c0 otfb "LOADERGAME.PRG" 1 otl$c0 otfb "RELOCATEDGAME.prg" 2 otl$c0 c

echo run test.tap (Must be correct path)
c:\c64\tools\vice\x64sc.exe test.tap
