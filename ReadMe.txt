***************************************
IRQ TURBO TAPE LOADER FOR LOADER GAMES
***************************************

This source was made to cover the 
feature in Scene World issue 32 on how
to make a tape loader where a game can
be played during loading.

In order to be able to use this project
you will need TapeTool V1.0.0.5, 
Do not use V1.0.0.6 or V1.0.0.7
as the source code will not work 
correctly in those versions. If using 
V1.0.0.6 or V1.0.0.7, you will need to 
modify the source code quite a lot.

TapeTool V1.0.0.5 is available to 
download from CSDB at:

https://csdb.dk/release/?id=160636

It also comes with the ACME cross
assembler, modified by Martin Piper.
The ACME cross assembler is needed!!!

After you have downloaded the complete
TapeTool V1.0.0.5 archive, copy all of
the files from the MOOTILATION project 
file to the TapeTool archive. The 
files which you need to copy are as 
follows:

FOLDERS:
C64 - This is the binary files for the 
      loader game assembly source code
	  (All files should be included)
	  
GAME - This is where your runnable game 
       with BASIC sys run address goes.
	   This is the file in which you 
       are loading from tape after the 
	   tape loader game.
	   	   
FILES:	   

BUILDIT.BAT - The target batch file in 
              which will assemble the 
			  source files and compile 
			  the tape loader system 
			  and make a .tap file 
			  
RELOCATOR.ASM -Relocating crunched game 
              to be run after loading 
              after tape loader game.			  
			  
TAPELOADERCIASMALL.A - My modified 
version of the boot loader. Instead of 
making noises like the Crazy Comets
loader. This little modification just 
blanks out the screen and displays 
loading stripes.

TAPELOADERCIACOMMON.A - My modified 
version of the actual boot loading 
scheme. My change is simply using the 
black border and thin stripes.

TAPELOADERCIAIRQ.A - My modified 
versionof the actual main loading 
scheme. This simply uses a black border 
and thin stripes.
                   			  
SCROLLERMUSICLOADER.A - Main IRQ loader
routines, which will load and run the 
tape loader game, and load in the main 
program to run. 			  

MOOTILATION.ASM - The main source code 
which should be called to build the 
loader game project, Mootilation. 

GAMEINIT.ASM - The source code linked 
to MOOTILATION.ASM, which should 
setup the game screen and exit from 
subroutine.

GAMECODE.ASM - The source code which 
controls the main body of the game 
code. 

These are all of the files that need 
to be copied to the TAPETOOL V1.0.0.5
project folder. 

COMPILING:

Open the file BuildIt.bat and ensure
that you have set the correct path 
locations for the project and VICE 
for testing the .tap image. You can 
use either the command prompt or run 
the batch file from Windows explorer by 
double-clicking the buildit.bat. 

HINTS:
To edit the filename of your game on 
tape, edit !pet "TURBO" in LOADERS.A

To edit the filename of the game you 
wish to relocate. Copy it into the game 
folder and then edit the filename in 
the game path, in RELOCATOR.ASM.

To edit the tape loading stripes 
scheme. Search for:

LDA #$0E
STA $D020
LDA #$00
STA $D020 

in TAPELOADERCIACOMMON.A and 
TAPELOADERCIAIRQ.A 

I wish you good fun with this source.

Credit goes to Martin Piper for the 
original tape loader source. 

This little project was made as part 
of Scene World's feature on making a 
tape loader game. You may also use the 
source to as a guideline to make your 
very own tape loader games for your own
c64 projects if your want to.

This software is free to use.


