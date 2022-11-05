; file created from codeinit.asm by disasm6502

;DRAW MOOTILATION GAME SCREEN

           lda #$00             ; $2d00: $a9 $00
           sta border           ; $2d02: $8d $20 $d0
           sta screenc          ; $2d05: $8d $21 $d0
           lda #$01             ; $2d08: $a9 $01
           sta screenc + 1      ; $2d0a: $8d $22 $d0
           lda #$09             ; $2d0d: $a9 $09
           sta $d023            ; $2d0f: $8d $23 $d0
           lda #$1b             ; $2d12: $a9 $18
           sta $d011            ; $2d14: $8d $11 $d0
           lda #$18             ; $2d17: $a9 $18
           sta $d016            ; $2d19: $8d $16 $d0
           lda #$12
           sta $d018            ; $2d1c: $8d $18 $d0
       
       ;Draw game screen
       
           ldx #$00             ; $2d1f: $a2 $00
drawscrn   lda mapscreen,x          ; $2d21: $bd $00 $25
           sta screen,x          ; $2d24: $9d $00 $04
           lda mapscreen+$100,x          ; $2d27: $bd $00 $26
           sta screen+$100,x          ; $2d2a: $9d $00 $05
           lda mapscreen+$200,x          ; $2d2d: $bd $00 $27
           sta screen+$200,x          ; $2d30: $9d $00 $06
           lda mapscreen+$2e8,x          ; $2d33: $bd $e8 $27
           sta screen+$2e8,x          ; $2d36: $9d $e8 $06
           ldy mapscreen,x
           lda mapcolour,y
           sta colour,x
           ldy mapscreen+$100,x
           lda mapcolour,y
           sta colour+$100,x
           ldy mapscreen+$200,x
           lda mapcolour,y
           sta colour+$200,x
           ldy mapscreen+$2e8,x
           lda mapcolour,y
           sta colour+$2e8,x
           inx
           bne drawscrn
           
           
           
       
       ;Output text/credits, etc
       
           ldx #$00             ; $2d54: $a2 $00
puttext    lda textmem,x          ; $2d56: $bd $00 $35
           sta screen,x          ; $2d59: $9d $00 $04
           lda textmem+40,x          ; $2d5c: $bd $28 $35
           sta screen+$190,x          ; $2d5f: $9d $90 $05
           lda textmem+80,x          ; $2d62: $bd $50 $35
           sta screen+$1e0,x          ; $2d65: $9d $e0 $05
           lda textmem+120,x          ; $2d68: $bd $78 $35
           sta screen+$230,x          ; $2d6b: $9d $30 $06
           lda textmem+160,x          ; $2d6e: $bd $a0 $35
           sta screen+$258,x          ; $2d71: $9d $58 $06
           lda textmem+200,x          ; $2d74: $bd $c8 $35
           sta screen+$2a8,x          ; $2d77: $9d $a8 $06
           lda #$01             ; $2d7a: $a9 $01
           sta colour,x          ; $2d7c: $9d $00 $d8
           sta colour+$190,x          ; $2d7f: $9d $90 $d9
           lda #$07             ; $2d82: $a9 $07
           sta colour+$1e0,x          ; $2d84: $9d $e0 $d9
           lda #$03             ; $2d87: $a9 $03
           sta colour+$230,x          ; $2d89: $9d $30 $da
           sta colour+$258,x          ; $2d8c: $9d $58 $da
           lda #$05             ; $2d8f: $a9 $05
           sta colour+$2a8,x          ; $2d91: $9d $a8 $da
           inx                  ; $2d94: $e8
           cpx #$28             ; $2d95: $e0 $28
           bne puttext          ; $2d97: $d0 $bd
       
           lda #$ff             ; $2d99: $a9 $ff
           sta $d015            ; $2d9b: $8d $15 $d0
           lda #$00             ; $2d9e: $a9 $00
           sta $d017            ; $2da0: $8d $17 $d0
           sta $d01d            ; $2da3: $8d $1d $d0
           sta $d01b            ; $2da6: $8d $1b $d0
           sta firebutton
           lda #$ff             ; $2da9: $a9 $ff
           sta $d01c            ; $2dab: $8d $1c $d0
           lda #$01             ; $2dae: $a9 $01
           sta $d025            ; $2db0: $8d $25 $d0
           lda #$09             ; $2db3: $a9 $09
           sta $d026            ; $2db5: $8d $26 $d0
       lda #$00
       jsr musicinit
           rts