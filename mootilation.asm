;------------------------------------------------
;MOOTILATION tape loader game, by Richard Bayliss
;built specially for TapeTool by Martin Piper,
;although this tape loader game can also be used
;in other IRQ tape loaders.
;------------------------------------------------
;Note: This is a reverse-engineered version of
;      my tape loader game, as the original 
;      source long got lost. 
;
; 
;------------------------------------------------

;In order to implement the tape loader, set 
;loader game to init at $1F00 and play at $1F03
;also ensure your main program loads from 
;$3500 - $CFFF using:
;
;exomizer sfx $(gamejmp) source.prg -o targ.prg -Di_loadaddr=$3500
;Then after game (not loader game) has loaded JMP $3500
;or alternatively create a program relocator to 
;move the main program to $0801-$cfff. 
;
;HAVE FUN
;
;------------------------------------------------

d6510 = $00
r6510 = $01
unused1 = $02
adray1 = $03
charac = $07
stal = $c1
ndx = $c6
pnt = $d1
border = $d020
screenc = $d021
screen = $0400
colour = $d800
musicinit = $1048
musicplay = $1021

;Comment this to disable the additional loader game test

;loadergametest = 1

;Generate loader game file

  !to "loadergame.prg",cbm
;--------------------------------------------------------------------  
  ;Insert charet
  *=$0800
  !binary "c64/charset.bin"
;--------------------------------------------------------------------    
  ;Insert loader game map screen
  *=$0c00
mapscreen  
  !binary "c64/map.bin"
;--------------------------------------------------------------------    
  ;Insert game music
  *=$1000
  !binary "c64/music.prg",,2
;--------------------------------------------------------------------    
  ;Insert game map attributes (colour data)
  *=$1c00
mapcolour  
  !binary "c64/attributes.bin"
;--------------------------------------------------------------------    
  ;Insert game text data
  *=$1d00
  !ct scr
textmem 
  ;!text "0123456789012345678901234567890123456789"
  ;------------------------------------------------
   !text "score: 000000     loading time left: 000"
   !text " oh no, the aliens are coming ... it's  "
   !text "           *** moo-tilation ***         "  
   !text " loader game programming, graphics and  "
   !text "        music by richard bayliss        "
   !text "            press fire to play          "
;--------------------------------------------------------------------  
  
   ;Init and play sub routines to implement inside tape loader
   ;IN LOADER, SET INIT $1F00, AND PLAY $1F03
   
   *=$1f00
   jmp loadergamecodeinit
   jmp loadergamecodeplay
    
;--------------------------------------------------------------------  
   
  ;Insert gameinit routine
  *=$2000
loadergamecodeinit  
  !source "gameinit.asm"
;--------------------------------------------------------------------    
  ;Also insert the loader game play routine
loadergamecodeplay  
  !source "gamecode.asm"
;--------------------------------------------------------------------    
;Tester 
  !align $ff,$00  
  ;Initialise loader game routine
  
!ifdef loadergametest {
  
  jsr loadergamecodeinit
  
Mainloop
  ldx #<irq
  ldy #>irq
  lda #$7f
  stx $0314
  sty $0315
  sta $dc0d
  sta $dd0d
  
  lda #$32
  sta $d012
  lda #$1b
  sta $d011
  lda #$01
  sta $d019
  sta $d01a
  
  cli
  
  jmp *
  
irq inc $d019 
  lda #$fa
  sta $d012
  jsr loadergamecodeplay
  jmp $ea7e
  
}
;--------------------------------------------------------------------  
  
  ;Finally add in the game sprites 
  
  *=$3000 
  !binary "c64/sprites.prg",,2

;--------------------------------------------------------------------  
 