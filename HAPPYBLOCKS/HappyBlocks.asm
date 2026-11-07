;****************************
;
;        HAPPY BLOCKS 
; 	  TAPE LOADER GAME
;         Written by  
;     By Richard Bayliss
;
;    (C)2011-2026 T.N.D
;
;****************************

;Please read the README source to help
;get you started.

;Comment this in order to disable the 
;test IRQ routine.

LoaderGameInit = $3800

;Enable this for test IRQ or disable 
;this command for use in tape loader 
;system

IRQEnabled = 1

;Enable this for "Blocks to Load" text
;to display, otherwise the loader game 
;will just show "NOW LOADING" text 
;instead.

ShowBlocksToLoad = 1

;Generate tape loader game source 

	  !to "happyblocks.prg",cbm

;--------------------------------------
; Import music data
;--------------------------------------

		*=$1000
		!bin "c64/music.prg",,2
		
;--------------------------------------
; Import game sprites 		
;--------------------------------------

		*=$2000
		!bin "c64/sprites.prg",,2
		
;--------------------------------------
; Import game charset
;--------------------------------------

		*=$2800
		!bin "c64/charset.prg",,2
		
;--------------------------------------
; Import game screen data
;--------------------------------------

		*=$3000
		!bin "c64/screen.prg",,2
		
;--------------------------------------
; Import game screen colour data 		
;--------------------------------------

		*=$3400
		!bin "c64/colour.prg",,2

;--------------------------------------
; Outside IRQ tape loader, create a 
; runnable IRQ for testing the game 
; outside the tape loader. 
;--------------------------------------

!ifdef IRQEnabled {

;Create a runnable program for test IRQ

	*=$0801 ;Setup 10 SYS 2061
			!byte $0b,$08,$0a,$00,$9e
			!byte $32,$30,$36,$31,$00
			
; Now make the IRQ tester 

	* = $080d
	sei
	jsr LoaderGameInit
	ldx #<IRQ
	ldy #>IRQ
	lda #$7f
	stx $0314
	sty $0315
	sta $dc0d
	lda #$36
	sta $d012
	lda #$1b
	sta $d011
	lda #$01
	sta $d01a	
	cli

	jmp *

; Main IRQ routine for testing 

IRQ:
	inc $d019 
	lda #$fa
	sta $d012
	
	jsr LoaderGamePlay
	jmp $ea7e
}



;--------------------------------------
; Main source code 
;--------------------------------------		
      
	  *=$3800
	  
LoaderGameInit
	  jsr CHECKPALNTSC
		
; Setup VIC 2 graphics mode 

      lda  #$00                         
      sta  $D020                        ; Border color
      sta  $D021                        ; Background 0 color
      lda  #$0B                         
      sta  $D022                        ; Background 1 color
      lda  #$0C                         
      sta  $D023                        ; Background 2 color
      lda  #$00                         
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  #$FF                         
      sta  $D015                        ; Sprites Abilitator
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      sta  $D01B                        ; Sprite-background screen priority
	  
; Copy the game screen and colour 
; data to the C64 screen and colour 
; RAM.
	  
      ldx  #$00                         
W3824:
      lda  $3000,x                      
      sta  $0400,x                      ; Video matrix (25*40)
      lda  $3100,x                      
      sta  $0500,x                      ; Video matrix (25*40)
      lda  $3200,x                      
      sta  $0600,x                      ; Video matrix (25*40)
      lda  $32E8,x                      
      sta  $06E8,x                      ; Video matrix (25*40)
      lda  $3400,x                      
      sta  $D800,x                      ; Color RAM
      lda  $3500,x                      
      sta  $D900,x                      ; Color RAM
      lda  $3600,x                      
      sta  $DA00,x                      ; Color RAM
      lda  $36E8,x                      
      sta  $DAE8,x                      ; Color RAM
      inx                               
      bne  W3824          
	  
;Put loading text at bottom of the screen 
	  
	  ldx #$00
SHOWTXT:
	  lda BlockShower,x 
	  sta $07c0,x 
	  inx 
	  cpx #$28
	  bne SHOWTXT 
	  
	  
      lda  #$1B                         
      sta  $D011                        ; VIC control register
      lda  #$1A                         
      sta  $D018                        ; VIC memory control register
      lda  #$18                         
      sta  $D016                        ; VIC control register
      
	  ; Setup the game sprite multicolour mode
	  
	  lda  #$01                         
      sta  $D025                        ; Multicolor animation 0 register
      lda  #$0B                         
      sta  $D026                        ; Multicolor animation 1 register
	  
	  ; ... and also the sprite frames
	  
      lda  #$80                         
      sta  $07F8                        ; Pointer to data sprites (Player)
      lda  #$81                         
      sta  $07F9                        ; Pointer to data sprites (Nasty block 1)
      lda  #$82                         
      sta  $07FA                        ; Pointer to data sprites (Nasty block 2)
      lda  #$83                         
      sta  $07FB                        ; Pointer to data sprites (Nasty block 3)
      lda  #$84                         
      sta  $07FC                        ; Pointer to data sprites (Nasty block 4)

	  ; Paint those sprites chosen colours 
	  
      lda  #$0E                         
      sta  $D027                        ; Color sprite 0
      lda  #$0A                         
      sta  $D028                        ; Color sprite 1
      lda  #$0F                         
      sta  $D029                        ; Color sprite 2
      lda  #$07                         
      sta  $D02A                        ; Color sprite 3
      lda  #$0D                         
      sta  $D02B                        ; Color sprite 4
	  
	  ; Set starting position for all the sprites
	  
      lda  #$A0                         
      sta  $D000                        ; Position X sprite 0
      lda  #$D8                         
      sta  $D001                        ; Position Y sprite 0
      lda  #$32                         
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      sta  $D007                        ; Position Y sprite 3
      sta  $D00D                        ; Position Y sprite 6
      lda  #$88                         
      sta  $D002                        ; Position X sprite 1
      clc                               
      adc  #$18                         
      sta  $D004                        ; Position X sprite 2
      clc                               
      adc  #$18                         
      sta  $D006                        ; Position X sprite 3
      lda  #$00                         
      sta  $D008                        ; Position X sprite 4
      lda  #$00                         
      sta  $D00A                        ; Position X sprite 5
	  
; Initialise the music 
	  
      lda  #$00                         
      jsr  $1000

; Setup game pointers 
	  
      sta  W3CDE                        
      sta  W3CDB                        
      sta  W3CDC                        
      sta  W3CDD                        
      rts                               

; Game play address (inside loader or 
; IRQ.

LoaderGamePlay:

      jsr  W3C0F                        
      lda  W3CDE                        
      cmp  #$01                         
      bne  W3901                        
      jsr  W390B                        
      jsr  W3A5E                        
      jsr  W3AA4                        
      jsr  W39F5                        
	  jsr TXTFLASH
      jsr MUSPLAYER
      rts             

MUSPLAYER:	  
	  lda SYSTEM 
	  cmp #1
	  beq PLAYIT
	  inc NTSCTIMER
	  lda NTSCTIMER
	  cmp #$06
	  beq LOOPTIMER
PLAYIT 
	  jsr $1003
	  rts
	  
LOOPTIMER	  
	  lda #0
	  sta NTSCTIMER 
	  rts

W3901:
      jsr  W3AE9                        
      jsr  W39F5  
	  jsr TXTFLASH
      jsr  $1003                        
      rts                               

; Move those nasty blocks down the 
; screen.

W390B:
      ldx  #$00                         
W390D:
      lda  $D003,x                      ; Position Y sprite 1
      clc                               
      adc  W3CDF                        
      sta  $D003,x                      ; Position Y sprite 1
      inx                               
      inx                               
      cpx  #$08                         
      bne  W390D                        
      lda  $D003                        ; Position Y sprite 1
      cmp  #$FC                         
      bcs  W3925                        
      rts                               

W3925:
      lda  #$00                         
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      sta  $D007                        ; Position Y sprite 3
      sta  $D009                        ; Position Y sprite 4
      lda  W3CE0                        
      cmp  #$05                         
      beq  W3940                        
      inc  W3CE0                        
      jmp  W3957                        

W3940:
      lda  #$00                         
      sta  W3CE0                        
      inc  W3CDF                        
      lda  W3CDF                        
      cmp  #$06                         
      beq  W3952                        
      jmp  W3957                        

W3952:
      lda  #$05                         
      sta  W3CDF                        
W3957:
      jsr  W3975                        
      jsr  W398D                        
      inc  $0637                        ; Video matrix (25*40)
      ldx  #$03                         
W3962:
      lda  $0634,x                      ; Video matrix (25*40)
      cmp  #$3A                         
      bne  W3971                        
      lda  #$30                         
      sta  $0634,x                      ; Video matrix (25*40)
      inc  $0633,x                      ; Video matrix (25*40)
W3971:
      dex                               
      bne  W3962                        
      rts                               

W3975:
      ldx  W3CE1                        
      lda  W3CF4,x                      
      sta  W3CE2                        
      inx                               
      cpx  #$27                         
      beq  W3987                        
      inc  W3CE1                        
      rts                               

W3987:
      ldx  #$00                         
      stx  W3CE1                        
      rts                               

W398D:
      lda  W3CE2                        
      cmp  #$00                         
      beq  W39A1                        
      cmp  #$01                         
      beq  W39B6                        
      cmp  #$02                         
      beq  W39CB                        
      cmp  #$03                         
      beq  W39E0                        
      rts                               

W39A1:
      lda  #$00                         
      sta  $D002                        ; Position X sprite 1
      lda  #$A0                         
      sta  $D004                        ; Position X sprite 2
      lda  #$B8                         
      sta  $D006                        ; Position X sprite 3
      lda  #$D0                         
      sta  $D008                        ; Position X sprite 4
      rts                               

W39B6:
      lda  #$88                         
      sta  $D002                        ; Position X sprite 1
      lda  #$00                         
      sta  $D004                        ; Position X sprite 2
      lda  #$B8                         
      sta  $D006                        ; Position X sprite 3
      lda  #$D0                         
      sta  $D008                        ; Position X sprite 4
      rts                               

W39CB:
      lda  #$88                         
      sta  $D002                        ; Position X sprite 1
      lda  #$A0                         
      sta  $D004                        ; Position X sprite 2
      lda  #$00                         
      sta  $D006                        ; Position X sprite 3
      lda  #$D0                         
      sta  $D008                        ; Position X sprite 4
      rts                               

W39E0:
      lda  #$88                         
      sta  $D002                        ; Position X sprite 1
      lda  #$A0                         
      sta  $D004                        ; Position X sprite 2
      lda  #$B8                         
      sta  $D006                        ; Position X sprite 3
      lda  #$00                         
      sta  $D008                        ; Position X sprite 4
      rts                               

W39F5:
      lda  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lsr                               
      lsr                               
      lsr                               
      bit  W3CDB                        
      ror  W3CDB                        
      bmi  W3A1A                        
      bvc  W3A1A                        
      lda  $D000                        ; Position X sprite 0
      sec                               
      sbc  #$18                         
      cmp  #$88                         
      bcs  W3A11                        
      lda  #$88                         
W3A11:
      sta  $D000                        ; Position X sprite 0
      lda  #$00                         
      sta  W3CDB                        
      rts                               

W3A1A:
      lda  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      bit  W3CDC                        
      ror  W3CDC                        
      bmi  W3A40                        
      bvc  W3A40                        
      lda  $D000                        ; Position X sprite 0
      clc                               
      adc  #$18                         
      cmp  #$E0                         
      bcc  W3A37                        
      lda  #$D0                         
W3A37:
      sta  $D000                        ; Position X sprite 0
      lda  #$00                         
      sta  W3CDC                        
      rts                               

W3A40:
      lda  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      lsr                               
      bit  W3CDD                        
      ror  W3CDD                        
      bmi  W3A5D                        
      bvc  W3A5D                        
      lda  W3CDE                        
      cmp  #$01                         
      beq  W3A5D                        
      jmp  W3B70                        

      rts                               

W3A5D:
      rts                               

W3A5E:
      lda  $D000                        ; Position X sprite 0
      sec                               
      sbc  #$06                         
      sta  W3CE3                        
      clc                               
      adc  #$0C                         
      sta  W3CE4                        
      lda  $D001                        ; Position Y sprite 0
      sec                               
      sbc  #$0C                         
      sta  W3CE5                        
      clc                               
      adc  #$18                         
      sta  W3CE6                        
      ldx  #$00                         
W3A7E:
      lda  $D002,x                      ; Position X sprite 1
      cmp  W3CE3                        
      bcc  W3A9D                        
      cmp  W3CE4                        
      bcs  W3A9D                        
      lda  $D003,x                      ; Position Y sprite 1
      cmp  W3CE5                        
      bcc  W3A9D                        
      cmp  W3CE6                        
      bcs  W3A9D                        
      lda  #$00                         
      sta  W3CDE                        
W3A9D:
      inx                               
      inx                               
      cpx  #$08                         
      bne  W3A7E                        
      rts                               

W3AA4:
      lda  W3CDF                        
      cmp  #$01                         
      beq  W3ABC                        
      cmp  #$02                         
      beq  W3AC5                        
      cmp  #$03                         
      beq  W3ACE                        
      cmp  #$04                         
      beq  W3AD7                        
      cmp  #$05                         
      beq  W3AE0                        
      rts                               

W3ABC:
      lda  #$05                         
      sta  $D9D8                        ; Color RAM
      sta  $D9D9                        ; Color RAM
      rts                               

W3AC5:
      lda  #$05                         
      sta  $D9B0                        ; Color RAM
      sta  $D9B1                        ; Color RAM
      rts                               

W3ACE:
      lda  #$07                         
      sta  $D988                        ; Color RAM
      sta  $D989                        ; Color RAM
      rts                               

W3AD7:
      lda  #$07                         
      sta  $D960                        ; Color RAM
      sta  $D961                        ; Color RAM
      rts                               

W3AE0:
      lda  #$02                         
      sta  $D938                        ; Color RAM
      sta  $D939                        ; Color RAM
      rts                               

W3AE9:
      lda  #$00                         
      sta  $D015                        ; Sprites Abilitator
      ldx  #$00                         
W3AF0:
      lda  W3C49,x                      
      sta  $040E,x                      ; Video matrix (25*40)
      lda  #$01                         
      sta  $D80E,x                      ; Color RAM
      lda  W3C55,x                      
      sta  $04D6,x                      ; Video matrix (25*40)
      lda  #$07                         
      sta  $D8D6,x                      ; Color RAM
      lda  W3C61,x                      
      sta  $0526,x                      ; Video matrix (25*40)
      lda  W3C6D,x                      
      sta  $054E,x                      ; Video matrix (25*40)
      lda  W3C79,x                      
      sta  $0576,x                      ; Video matrix (25*40)
      lda  #$03                         
      sta  $D926,x                      ; Color RAM
      sta  $D94E,x                      ; Color RAM
      sta  $D976,x                      ; Color RAM
      lda  W3C85,x                      
      sta  $05C6,x                      ; Video matrix (25*40)
      lda  #$01                         
      sta  $D9C6,x                      ; Color RAM
      lda  W3C91,x                      
      sta  $0616,x                      ; Video matrix (25*40)
      lda  W3C9D,x                      
      sta  $063E,x                      ; Video matrix (25*40)
      lda  #$05                         
      sta  $DA16,x                      ; Color RAM
      sta  $DA3E,x                      ; Color RAM
      lda  W3CA9,x                      
      sta  $068E,x                      ; Video matrix (25*40)
      lda  W3CB5,x                      
      sta  $06B6,x                      ; Video matrix (25*40)
      lda  #$01                         
      sta  $DA8E,x                      ; Color RAM
      sta  $DAB6,x                      ; Color RAM
      lda  W3CC1,x                      
      sta  $0756,x                      ; Video matrix (25*40)
      lda  W3CCD,x                      
      sta  $077E,x                      ; Video matrix (25*40)
      lda  #$07                         
      sta  $DB56,x                      ; Color RAM
      sta  $DB7E,x                      ; Color RAM
      inx                               
      cpx  #$0C                         
      bne  W3AF0                        
      rts                               

W3B70:
      ldx  #$00                         
      lda  #$FF                         
      sta  $D015                        ; Sprites Abilitator
      ldx  #$00                         
W3B79:
      lda  #$20                         
      sta  $040E,x                      ; Video matrix (25*40)
      sta  $04D6,x                      ; Video matrix (25*40)
      sta  $0526,x                      ; Video matrix (25*40)
      sta  $054E,x                      ; Video matrix (25*40)
      sta  $0576,x                      ; Video matrix (25*40)
      sta  $05C6,x                      ; Video matrix (25*40)
      sta  $0616,x                      ; Video matrix (25*40)
      sta  $063E,x                      ; Video matrix (25*40)
      sta  $068E,x                      ; Video matrix (25*40)
      sta  $06B6,x                      ; Video matrix (25*40)
      sta  $0756,x                      ; Video matrix (25*40)
      sta  $077E,x                      ; Video matrix (25*40)
      inx                               
      cpx  #$0C                         
      bne  W3B79                        
      lda  #$32                         
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      sta  $D007                        ; Position Y sprite 3
      sta  $D00D                        ; Position Y sprite 6
      lda  #$88                         
      sta  $D002                        ; Position X sprite 1
      clc                               
      adc  #$18                         
      sta  $D004                        ; Position X sprite 2
      clc                               
      adc  #$18                         
      sta  $D006                        ; Position X sprite 3
      lda  #$00                         
      sta  $D008                        ; Position X sprite 4
      lda  #$00                         
      sta  $D00A                        ; Position X sprite 5
      lda  #$30                         
      sta  $0634                        ; Video matrix (25*40)
      sta  $0635                        ; Video matrix (25*40)
      sta  $0636                        ; Video matrix (25*40)
      sta  $0637                        ; Video matrix (25*40)
      sta  $0638                        ; Video matrix (25*40)
      sta  $0639                        ; Video matrix (25*40)
      lda  #$06                         
      sta  $D9D8                        ; Color RAM
      sta  $D9D9                        ; Color RAM
      sta  $D9B0                        ; Color RAM
      sta  $D9B1                        ; Color RAM
      sta  $D988                        ; Color RAM
      sta  $D989                        ; Color RAM
      sta  $D960                        ; Color RAM
      sta  $D961                        ; Color RAM
      sta  $D938                        ; Color RAM
      sta  $D939                        ; Color RAM
      lda  #$01                         
      sta  W3CDF                        
      sta  W3CE0                        
      lda  #$01                         
      sta  W3CDE                        
      rts                               

W3C0F:
      lda  W3CF3                        
      cmp  #$EE                         
      beq  W3C1A                        
      inc  W3CF3                        
      rts                               

W3C1A:
      lda  #$00                         
      sta  W3CF3                        
      ldx  W3CF2                        
      lda  W3CE8,x                      
      sta  $D022                        ; Background 1 color
      lda  W3CED,x                      
      sta  $D023                        ; Background 2 color
      inx                               
      cpx  #$04                         
      beq  W3C37                        
      inc  W3CF2                        
      rts                               

W3C37:
      ldx  #$00                         
      stx  W3CF2                        
      rts                

; Text flash routine for bottom area of screen 	  

TXTFLASH:
	  lda FP 
	  cmp #5
	  beq FPOK
	  inc FP 
	  rts 
FPOK: lda #0
	  sta FP 
	  ldx FP+1
	  lda FC,x 
	  sta $dbc0
	  inx 
	  cpx #21
	  beq LOOPFC 
	  inc FP+1
	  jmp FLASHCOL
LOOPFC:
	  ldx #0
	  stx FP+1
FLASHCOL:
	  ldx #$00
FLASHIT:
	  lda $dbc0
	  sta $dbc0,x 
	  inx 
	  cpx #40
	  bne FLASHIT 
	  rts
	  
; Check PAL/NTSC compatibility 
	  
CHECKPALNTSC
	  lda $d012 
	  cmp $d012 
	  beq *-3
	  bmi CHECKPALNTSC
	  cmp #$20
	  bcc NTSC
	  lda #1
	  sta SYSTEM
	  rts 
NTSC  lda #0
	  sta SYSTEM
	  rts
	  
SYSTEM !byte 0
NTSCTIMER !byte 0	 

      !scr "------------"
W3C49:
      !scr " game  over"
W3C54:
      !scr " "
W3C55:
      !scr "happy blocks"
W3C61:
      !scr "   a new"
W3C69:
      !scr "   "
W3C6C:
      !scr " "
W3C6D:
      !scr "loader  gam"
W3C78:
      !scr "e"
W3C79:
      !scr "     by   "
W3C83:
      !scr "  "
W3C85:
      !scr " richard b! "
W3C91:
      !scr " tape turb"
W3C9B:
      !scr "o "
W3C9D:
      !scr " system  b"
W3CA7:
      !scr "y "
W3CA9:
      !scr "   martin  "
W3CB4:
      !scr " "
W3CB5:
      !scr "    piper   "
W3CC1:
      !scr " press fire "
W3CCD:
      !scr "  to  play  @"
	  
;Show blocks to load if required 

!ifdef ShowBlocksToLoad { 
	!ct scr
BlockShower
	!text "now loading ........ blocks to load: ---"
} else {
BlockShower
	!text "now loading ................ please wait"
}

	  
      !byte $00                         
W3CDB:
      !byte $FF
W3CDC:
      !byte $FF
W3CDD:
      !byte $FF
W3CDE:
      !byte $00
W3CDF:
      !byte $01
W3CE0:
      !byte $00
W3CE1:
      !byte $00
W3CE2:
      !byte $00
W3CE3:
      !byte $00
W3CE4:
      !byte $00
W3CE5:
      !byte $00
W3CE6:
      !byte $00, $00                    
W3CE8:
      !byte $0B, $06, $05, $02          
W3CEC:
      !byte $09
W3CED:
      !byte $0C, $0E, $0D, $0A, $08     
W3CF2:
      !byte $00
W3CF3:
      !byte $77
W3CF4:
      !byte $00, $03, $01, $02, $03, $02, $01, $00 
      !byte $01, $02, $03, $00, $02, $01, $03, $02 
      !byte $03, $00, $03, $01, $02, $01, $03, $03 
      !byte $00, $02, $01, $03, $00, $02, $01, $03 
      !byte $00, $02, $00, $01, $00, $03, $00, $03 
      !byte $00, $00, $00, $00, $00, $00, $00, $00 
      !byte $00, $00, $00, $00, $00, $00, $00, $00 
      !byte $00, $00, $00, $00, $00, $00, $00, $00 
      !byte $00, $00, $00, $00, $00, $00, $00, $00 
      !byte $00, $00, $00, $00          

FP: 	  !byte 0,0
FC:    !byte $06,$02,$04,$03,$07,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$07,$03,$04,$02,$06
	  !byte 0
FCEND:	  