***************************************
IRQ TURBO TAPE LOADER FOR LOADER GAMES

		    HAPPY BLOCKS
		  By Richard Bayliss
  (C)2011-2026 The New Dimension		  

***************************************

In order to be able to use this project
you will need TapeTool V1.0.0.5, 
Do not use V1.0.0.6 or higher because
the source code will not work 
correctly in those versions. If using 
V1.0.0.6 or higher you will need to 
modify the source code quite a lot.

Alternatively you can use a different
IRQ tape loader system such as:

- PRG2TAP by TCE and Freeload by P.Hugues
- S-Load by TLR (Not U64 compatible)
- or any custom IRQ loader of your own

... but you will need to edit the source 
    code here. Also you will need to 
	inject a relocator routine inside 
	the IRQ loader so that data at $4000
	gets relocated to $0801 after 
	loading is successfully done.
	
Notes: LOADER GAME INIT: $3800
       LOADER GAME PLAY: $38F7
       (or if you changed the code, use
        the correct address to play)	   

TapeTool V1.0.0.5 is available to 
download from CSDB at:

https://csdb.dk/release/?id=160636


It also comes with the ACME cross
assembler, modified by Martin Piper.

After you have downloaded the complete
TapeTool V1.0.0.5 archive, copy all of
the files from the HAPPYBLOCKS project 
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
			  
RELOCATOR.ASM -Relocated crunched game 
              to be run after loading 
              after tape loader game.			  
			  
TAPELOADERCIASMALL.A - My modified 
version of the boot loader. Instead of 
making noises like the Crazy Comets
loader. This little modification just 
blanks out the screen and displays 
black and blue loading stripes.

TAPELOADERCIACOMMON.A - My modified 
version of the actual boot loading 
scheme. Black and blue stripes.

TAPELOADERCIAIRQ.A - My modified 
versionof the actual main loading 
scheme. Black and blue stripes.
                   			  
SCROLLERMUSICLOADER.A - Main IRQ loader
routines, which will load and run the 
tape loader game, and load in the main 
program to run. 			  

HAPPYBLOCKS.ASM - The main source code 
which should be called to build the 
loader game project, Mootilation. 

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

LDA $D020
EOR #$06
STA $D020 

in TAPELOADERCIACOMMON.A and 
TAPELOADERCIAIRQ.A 

I wish you good fun with this source.

Credit goes to Martin Piper for the 
original tape loader source. 

This software is free to use. You may 
improve this game by adding better 
graphics, etc. But please make sure to
credit me for the loader game code if 
you use it.


