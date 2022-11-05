; file created from gamecode.asm by disasm6502

     
         
           jsr l_0012           ; $3700: $20 $1d $37
           jsr l_0050           ; $3703: $20 $6b $37
           jsr l_0024           ; $3706: $20 $36 $37
           jsr l_0161           ; $3709: $20 $82 $38
      
       
           ldx #$00             ; $370c: $a2 $00
l_0005     lda l_1072           ; $370e: $ad $f5 $40
           sta $d800,x          ; $3711: $9d $00 $d8
           inx                  ; $3714: $e8
           cpx #$28             ; $3715: $e0 $28
           bne l_0005           ; $3717: $d0 $f5
           jsr $1021            ; $3719: $20 $21 $10
           rts                  ; $371c: $60
l_0012     ldx #$00             ; $371d: $a2 $00
l_0013     lda l_1020,x         ; $371f: $bd $33 $40
           sta $d001,x          ; $3722: $9d $01 $d0
           lda l_1019 + 1,x     ; $3725: $bd $32 $40
           asl                  ; $3728: $0a
           ror $d010            ; $3729: $6e $10 $d0
           sta $d000,x          ; $372c: $9d $00 $d0
           inx                  ; $372f: $e8
           inx                  ; $3730: $e8
           cpx #$10             ; $3731: $e0 $10
           bne l_0013           ; $3733: $d0 $ea
           rts                  ; $3735: $60
l_0024     lda l_1019           ; $3736: $ad $31 $40
           cmp #$01             ; $3739: $c9 $01
           beq l_0028           ; $373b: $f0 $01
           rts                  ; $373d: $60
l_0028     lda #$00             ; $373e: $a9 $00
           sta $d015            ; $3740: $8d $15 $d0
           ldx #$00             ; $3743: $a2 $00
l_0031     lda l_1071           ; $3745: $ad $f4 $40
           sta $d9e0,x          ; $3748: $9d $e0 $d9
           inx                  ; $374b: $e8
           cpx #$28             ; $374c: $e0 $28
           bne l_0031           ; $374e: $d0 $f5
           lda #0
           sta firebutton
           
           lda $dc00            ; $3750: $ad $01 $dc
           lsr                  ; $3753: $4a
           lsr                  ; $3754: $4a
           lsr                  ; $3755: $4a
           lsr                  ; $3756: $4a
           lsr       
           bcs l_0049
           lda #0
           sta firebutton       ; $3758: $b0 $10
           jsr l_0101           ; $375a: $20 $eb $37
           jsr l_0115           ; $375d: $20 $0c $38
           lda #$00             ; $3760: $a9 $00
           sta l_1019           ; $3762: $8d $31 $40
           lda #$ff             ; $3765: $a9 $ff
           sta $d015            ; $3767: $8d $15 $d0
l_0049     rts                  ; $376a: $60
l_0050     lda l_1069           ; $376b: $ad $f1 $40
           cmp #$03             ; $376e: $c9 $03
           beq l_0055           ; $3770: $f0 $04
           inc l_1069           ; $3772: $ee $f1 $40
           rts                  ; $3775: $60
l_0055     lda #$00             ; $3776: $a9 $00
           sta l_1069           ; $3778: $8d $f1 $40
           ldx l_1070           ; $377b: $ae $f2 $40
           lda l_1054,x         ; $377e: $bd $b5 $40
           sta l_1068           ; $3781: $8d $ee $40
           lda l_1055,x         ; $3784: $bd $bd $40
           sta l_1068 + 1       ; $3787: $8d $ef $40
           lda l_1056,x         ; $378a: $bd $c5 $40
           sta l_1067           ; $378d: $8d $ed $40
           lda l_1058,x         ; $3790: $bd $dd $40
           sta l_1071           ; $3793: $8d $f4 $40
           lda l_1050,x         ; $3796: $bd $83 $40
           sta l_1072           ; $3799: $8d $f5 $40
           inx                  ; $379c: $e8
           cpx #$08             ; $379d: $e0 $08
           beq l_0073           ; $379f: $f0 $04
           inc l_1070           ; $37a1: $ee $f2 $40
           rts                  ; $37a4: $60
l_0073     ldx #$00             ; $37a5: $a2 $00
           stx l_1070           ; $37a7: $8e $f2 $40
           rts                  ; $37aa: $60
l_0076     ldx #$00             ; $37ab: $a2 $00
l_0077     lda textmem+40,x          ; $37ad: $bd $28 $35
           sta screen+$190,x          ; $37b0: $9d $90 $05
           lda textmem,x          ; $2d56: $bd $00 $35
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
           lda #$01             ; $37cb: $a9 $01
           sta colour,x          ; $37cd: $9d $00 $d8
           sta colour+$190,x          ; $37d0: $9d $90 $d9
           lda #$07             ; $37d3: $a9 $07
           sta colour+$1e0,x          ; $37d5: $9d $e0 $d9
           lda #$03             ; $37d8: $a9 $03
           sta colour+$230,x          ; $37da: $9d $30 $da
           sta colour+$258,x          ; $37dd: $9d $58 $da
           lda #$05             ; $37e0: $a9 $05
           sta colour+$2a8,x          ; $37e2: $9d $a8 $da
           inx                  ; $37e5: $e8
           cpx #$28             ; $37e6: $e0 $28
           bne l_0077           ; $37e8: $d0 $c3
           rts            
       ; $37ea: $60
l_0101     ldx #$00             ; $37eb: $a2 $00
l_0102     lda #$20             ; $37ed: $a9 $20
           sta $0590,x          ; $37ef: $9d $90 $05
           sta $05e0,x          ; $37f2: $9d $e0 $05
           sta $0630,x          ; $37f5: $9d $30 $06
           sta $0658,x          ; $37f8: $9d $58 $06
           sta $06a8,x          ; $37fb: $9d $a8 $06
           inx                  ; $37fe: $e8
           cpx #$28             ; $37ff: $e0 $28
           bne l_0102           ; $3801: $d0 $ea
           lda #$00             ; $3803: $a9 $00
           sta l_1080           ; $3805: $8d $03 $41
           sta l_1081           ; $3808: $8d $04 $41
           rts                  ; $380b: $60
l_0115     ldx #$00             ; $380c: $a2 $00
l_0116     lda #$30             ; $380e: $a9 $30
           sta $0407,x          ; $3810: $9d $07 $04
           inx                  ; $3813: $e8
           cpx #$06             ; $3814: $e0 $06
           bne l_0116           ; $3816: $d0 $f6
           lda #$00             ; $3818: $a9 $00
           sta l_1059 + 1       ; $381a: $8d $e5 $40
           sta l_1060           ; $381d: $8d $e6 $40
           sta l_1065           ; $3820: $8d $eb $40
           sta l_1066           ; $3823: $8d $ec $40
           sta l_1061           ; $3826: $8d $e7 $40
           sta l_1062           ; $3829: $8d $e8 $40
           sta l_1063           ; $382c: $8d $e9 $40
           sta l_1064           ; $382f: $8d $ea $40
           sta l_1069           ; $3832: $8d $f1 $40
           sta l_1070           ; $3835: $8d $f2 $40
           sta l_1011           ; $3838: $8d $29 $40
           sta l_1010           ; $383b: $8d $28 $40
           sta l_1013           ; $383e: $8d $2b $40
           sta l_1012           ; $3841: $8d $2a $40
           sta l_1014           ; $3844: $8d $2c $40
           sta l_1015           ; $3847: $8d $2d $40
           sta l_1016           ; $384a: $8d $2e $40
           sta l_1017           ; $384d: $8d $2f $40
           sta l_1009           ; $3850: $8d $27 $40
           sta l_1018           ; $3853: $8d $30 $40
           lda #$01             ; $3856: $a9 $01
           sta l_1007           ; $3858: $8d $24 $40
           sta l_0197 + 1       ; $385b: $8d $e7 $38
           sta l_0243 + 1       ; $385e: $8d $58 $39
           sta l_0290 + 1       ; $3861: $8d $cc $39
           sta l_0338 + 1       ; $3864: $8d $42 $3a
           ldx #$00             ; $3867: $a2 $00
l_0149     lda l_1047,x         ; $3869: $bd $52 $40
           sta l_1019 + 1,x     ; $386c: $9d $32 $40
           inx                  ; $386f: $e8
           cpx #$10             ; $3870: $e0 $10
           bne l_0149           ; $3872: $d0 $f5
           ldx #$00             ; $3874: $a2 $00
l_0155     lda l_1049,x         ; $3876: $bd $7b $40
           sta $d027,x          ; $3879: $9d $27 $d0
           inx                  ; $387c: $e8
           cpx #$08             ; $387d: $e0 $08
           bne l_0155           ; $387f: $d0 $f5
l_0160     rts                  ; $3881: $60
l_0161     lda l_1019           ; $3882: $ad $31 $40
           cmp #$01             ; $3885: $c9 $01
           beq l_0160           ; $3887: $f0 $f8
           lda l_1053           ; $3889: $ad $b3 $40
           sta $07f8            ; $388c: $8d $f8 $07
           lda l_1053 + 1       ; $388f: $ad $b4 $40
           sta $07f9            ; $3892: $8d $f9 $07
           lda l_1068           ; $3895: $ad $ee $40
           sta $07fa            ; $3898: $8d $fa $07
           lda l_1068 + 1       ; $389b: $ad $ef $40
           sta $07fb            ; $389e: $8d $fb $07
           lda l_1067           ; $38a1: $ad $ed $40
           sta $07fc            ; $38a4: $8d $fc $07
           sta $07fd            ; $38a7: $8d $fd $07
           sta $07fe            ; $38aa: $8d $fe $07
           sta $07ff            ; $38ad: $8d $ff $07
           jsr l_0189           ; $38b0: $20 $d2 $38
           jsr l_0235           ; $38b3: $20 $43 $39
           jsr l_0282           ; $38b6: $20 $b7 $39
           jsr l_0330           ; $38b9: $20 $2d $3a
           jsr l_0390           ; $38bc: $20 $bf $3a
           jsr l_0423           ; $38bf: $20 $02 $3b
           jsr l_0444           ; $38c2: $20 $29 $3b
           jsr l_0622           ; $38c5: $20 $cf $3c
           jsr l_0649           ; $38c8: $20 $0b $3d
           jsr l_0718           ; $38cb: $20 $b0 $3d
           jsr l_0948           ; $38ce: $20 $a2 $3f
           rts                  ; $38d1: $60
l_0189     lda l_1061           ; $38d2: $ad $e7 $40
           cmp #$01             ; $38d5: $c9 $01
           beq l_0210           ; $38d7: $f0 $2c
           jsr l_0487           ; $38d9: $20 $84 $3b
           lda l_1067           ; $38dc: $ad $ed $40
           sta $07fc            ; $38df: $8d $fc $07
           lda l_1027           ; $38e2: $ad $3a $40
           clc                  ; $38e5: $18
l_0197     adc #$01             ; $38e6: $69 $01
           cmp #$ba             ; $38e8: $c9 $ba
           bcc l_0208           ; $38ea: $90 $15
           jsr l_0377           ; $38ec: $20 $a1 $3a
           lda l_1073           ; $38ef: $ad $f6 $40
           sta l_1028           ; $38f2: $8d $3b $40
           lda #$00             ; $38f5: $a9 $00
           sta l_1027           ; $38f7: $8d $3a $40
           lda l_1074 + 1       ; $38fa: $ad $f8 $40
           sta l_0197 + 1       ; $38fd: $8d $e7 $38
           rts                  ; $3900: $60
l_0208     sta l_1027           ; $3901: $8d $3a $40
           rts                  ; $3904: $60
l_0210     lda #$00             ; $3905: $a9 $00
           sta l_1011           ; $3907: $8d $29 $40
           sta l_1010           ; $390a: $8d $28 $40
           ldx l_1075           ; $390d: $ae $fb $40
           lda l_1057,x         ; $3910: $bd $cd $40
           sta $07fc            ; $3913: $8d $fc $07
           inx                  ; $3916: $e8
           cpx #$10             ; $3917: $e0 $10
           beq l_0221           ; $3919: $f0 $04
           inc l_1075           ; $391b: $ee $fb $40
           rts                  ; $391e: $60
l_0221     ldx #$00             ; $391f: $a2 $00
           stx l_1075           ; $3921: $8e $fb $40
           jsr l_0377           ; $3924: $20 $a1 $3a
           lda l_1073           ; $3927: $ad $f6 $40
           sta l_1028           ; $392a: $8d $3b $40
           lda #$bc             ; $392d: $a9 $bc
           sta l_1027           ; $392f: $8d $3a $40
           lda #$00             ; $3932: $a9 $00
           sta l_1061           ; $3934: $8d $e7 $40
           sta l_1011           ; $3937: $8d $29 $40
           sta l_1010           ; $393a: $8d $28 $40
           lda #$01             ; $393d: $a9 $01
           sta l_0197 + 1       ; $393f: $8d $e7 $38
           rts                  ; $3942: $60
l_0235     lda l_1062           ; $3943: $ad $e8 $40
           cmp #$01             ; $3946: $c9 $01
           beq l_0255           ; $3948: $f0 $2a
           jsr l_0522           ; $394a: $20 $da $3b
           lda l_1067           ; $394d: $ad $ed $40
           sta $07fd            ; $3950: $8d $fd $07
           lda l_1029           ; $3953: $ad $3c $40
           sec                  ; $3956: $38
l_0243     sbc #$01             ; $3957: $e9 $01
           bcs l_0253           ; $3959: $b0 $15
           jsr l_0377           ; $395b: $20 $a1 $3a
           lda l_1073           ; $395e: $ad $f6 $40
           sta l_1030           ; $3961: $8d $3d $40
           lda l_1074 + 1       ; $3964: $ad $f8 $40
           sta l_0243 + 1       ; $3967: $8d $58 $39
           lda #$ca             ; $396a: $a9 $ca
           sta l_1029           ; $396c: $8d $3c $40
           rts                  ; $396f: $60
l_0253     sta l_1029           ; $3970: $8d $3c $40
           rts                  ; $3973: $60
l_0255     lda #$00             ; $3974: $a9 $00
           sta l_1013           ; $3976: $8d $2b $40
           sta l_1012           ; $3979: $8d $2a $40
           ldx l_1076           ; $397c: $ae $fd $40
           lda l_1057,x         ; $397f: $bd $cd $40
           sta $07fd            ; $3982: $8d $fd $07
           inx                  ; $3985: $e8
           cpx #$10             ; $3986: $e0 $10
           beq l_0266           ; $3988: $f0 $04
           inc l_1076           ; $398a: $ee $fd $40
           rts                  ; $398d: $60
l_0266     ldx #$00             ; $398e: $a2 $00
           stx l_1076           ; $3990: $8e $fd $40
           jsr l_0377           ; $3993: $20 $a1 $3a
           lda l_1073           ; $3996: $ad $f6 $40
           sta l_1030           ; $3999: $8d $3d $40
           lda #$00             ; $399c: $a9 $00
           sta l_1029           ; $399e: $8d $3c $40
           lda #$00             ; $39a1: $a9 $00
           sta l_1062           ; $39a3: $8d $e8 $40
           lda #$00             ; $39a6: $a9 $00
           sta l_1062           ; $39a8: $8d $e8 $40
           sta l_1013           ; $39ab: $8d $2b $40
           sta l_1012           ; $39ae: $8d $2a $40
           lda #$01             ; $39b1: $a9 $01
           sta l_0243 + 1       ; $39b3: $8d $58 $39
           rts                  ; $39b6: $60
l_0282     lda l_1063           ; $39b7: $ad $e9 $40
           cmp #$01             ; $39ba: $c9 $01
           beq l_0303           ; $39bc: $f0 $2c
           jsr l_0558           ; $39be: $20 $33 $3c
           lda l_1067           ; $39c1: $ad $ed $40
           sta $07fe            ; $39c4: $8d $fe $07
           lda l_1031           ; $39c7: $ad $3e $40
           clc                  ; $39ca: $18
l_0290     adc #$01             ; $39cb: $69 $01
           cmp #$ba             ; $39cd: $c9 $ba
           bcc l_0301           ; $39cf: $90 $15
           jsr l_0377           ; $39d1: $20 $a1 $3a
           lda l_1073           ; $39d4: $ad $f6 $40
           sta l_1032           ; $39d7: $8d $3f $40
           lda l_1074 + 1       ; $39da: $ad $f8 $40
           sta l_0290 + 1       ; $39dd: $8d $cc $39
           lda #$00             ; $39e0: $a9 $00
           sta l_1031           ; $39e2: $8d $3e $40
           rts                  ; $39e5: $60
l_0301     sta l_1031           ; $39e6: $8d $3e $40
           rts                  ; $39e9: $60
l_0303     lda #$00             ; $39ea: $a9 $00
           sta l_1014           ; $39ec: $8d $2c $40
           sta l_1015           ; $39ef: $8d $2d $40
           ldx l_1077           ; $39f2: $ae $ff $40
           lda l_1057,x         ; $39f5: $bd $cd $40
           sta $07fe            ; $39f8: $8d $fe $07
           inx                  ; $39fb: $e8
           cpx #$10             ; $39fc: $e0 $10
           beq l_0314           ; $39fe: $f0 $04
           inc l_1077           ; $3a00: $ee $ff $40
           rts                  ; $3a03: $60
l_0314     ldx #$00             ; $3a04: $a2 $00
           stx l_1077           ; $3a06: $8e $ff $40
           jsr l_0377           ; $3a09: $20 $a1 $3a
           lda l_1073           ; $3a0c: $ad $f6 $40
           sta l_1032           ; $3a0f: $8d $3f $40
           lda #$bc             ; $3a12: $a9 $bc
           sta l_1031           ; $3a14: $8d $3e $40
           lda #$00             ; $3a17: $a9 $00
           sta l_1063           ; $3a19: $8d $e9 $40
           lda #$00             ; $3a1c: $a9 $00
           sta l_1063           ; $3a1e: $8d $e9 $40
           sta l_1014           ; $3a21: $8d $2c $40
           sta l_1015           ; $3a24: $8d $2d $40
           lda #$01             ; $3a27: $a9 $01
           sta l_0290 + 1       ; $3a29: $8d $cc $39
           rts                  ; $3a2c: $60
l_0330     lda l_1064           ; $3a2d: $ad $ea $40
           cmp #$01             ; $3a30: $c9 $01
           beq l_0350           ; $3a32: $f0 $2a
           jsr l_0590           ; $3a34: $20 $81 $3c
           lda l_1067           ; $3a37: $ad $ed $40
           sta $07ff            ; $3a3a: $8d $ff $07
           lda l_1033           ; $3a3d: $ad $40 $40
           sec                  ; $3a40: $38
l_0338     sbc #$01             ; $3a41: $e9 $01
           bcs l_0348           ; $3a43: $b0 $15
           jsr l_0377           ; $3a45: $20 $a1 $3a
           lda l_1073           ; $3a48: $ad $f6 $40
           sta l_1034           ; $3a4b: $8d $41 $40
           lda l_1074 + 1       ; $3a4e: $ad $f8 $40
           sta l_0338 + 1       ; $3a51: $8d $42 $3a
           lda #$ca             ; $3a54: $a9 $ca
           sta l_1033           ; $3a56: $8d $40 $40
           rts                  ; $3a59: $60
l_0348     sta l_1033           ; $3a5a: $8d $40 $40
           rts                  ; $3a5d: $60
l_0350     lda #$00             ; $3a5e: $a9 $00
           sta l_1016           ; $3a60: $8d $2e $40
           sta l_1017           ; $3a63: $8d $2f $40
           ldx l_1079           ; $3a66: $ae $01 $41
           lda l_1057,x         ; $3a69: $bd $cd $40
           sta $07ff            ; $3a6c: $8d $ff $07
           inx                  ; $3a6f: $e8
           cpx #$10             ; $3a70: $e0 $10
           beq l_0361           ; $3a72: $f0 $04
           inc l_1079           ; $3a74: $ee $01 $41
           rts                  ; $3a77: $60
l_0361     ldx #$00             ; $3a78: $a2 $00
           stx l_1079           ; $3a7a: $8e $01 $41
           jsr l_0377           ; $3a7d: $20 $a1 $3a
           lda l_1073           ; $3a80: $ad $f6 $40
           sta l_1034           ; $3a83: $8d $41 $40
           lda #$00             ; $3a86: $a9 $00
           sta l_1033           ; $3a88: $8d $40 $40
           lda #$00             ; $3a8b: $a9 $00
           sta l_1064           ; $3a8d: $8d $ea $40
           lda #$00             ; $3a90: $a9 $00
           sta l_1064           ; $3a92: $8d $ea $40
           sta l_1016           ; $3a95: $8d $2e $40
           sta l_1017           ; $3a98: $8d $2f $40
           lda #$01             ; $3a9b: $a9 $01
           sta l_0290 + 1       ; $3a9d: $8d $cc $39
           rts                  ; $3aa0: $60
l_0377     ldx l_1070 + 1       ; $3aa1: $ae $f3 $40
           lda l_1051,x         ; $3aa4: $bd $8b $40
           sta l_1073           ; $3aa7: $8d $f6 $40
           lda l_1052,x         ; $3aaa: $bd $9f $40
           sta l_1074 + 1       ; $3aad: $8d $f8 $40
           inx                  ; $3ab0: $e8
           cpx #$09             ; $3ab1: $e0 $09
           beq l_0387           ; $3ab3: $f0 $04
           inc l_1070 + 1       ; $3ab5: $ee $f3 $40
           rts                  ; $3ab8: $60
l_0387     ldx #$00             ; $3ab9: $a2 $00
           stx l_1070 + 1       ; $3abb: $8e $f3 $40
           rts                  ; $3abe: $60
l_0390     lda $dc00            ; $3abf: $ad $00 $dc
           lsr                  ; $3ac2: $4a
           lsr                  ; $3ac3: $4a
           lsr                  ; $3ac4: $4a
           bcs l_0402           ; $3ac5: $b0 $0e
           ldx l_1019 + 1       ; $3ac7: $ae $32 $40
           dex                  ; $3aca: $ca
           dex                  ; $3acb: $ca
           cpx #$0c             ; $3acc: $e0 $0c
           bcs l_0401           ; $3ace: $b0 $02
           ldx #$0c             ; $3ad0: $a2 $0c
l_0401     stx l_1019 + 1       ; $3ad2: $8e $32 $40
l_0402     lsr                  ; $3ad5: $4a
           bcs l_0411           ; $3ad6: $b0 $0e
           ldx l_1019 + 1       ; $3ad8: $ae $32 $40
           inx                  ; $3adb: $e8
           inx                  ; $3adc: $e8
           cpx #$a0             ; $3add: $e0 $a0
           bcc l_0410           ; $3adf: $90 $02
           ldx #$a0             ; $3ae1: $a2 $a0
l_0410     stx l_1019 + 1       ; $3ae3: $8e $32 $40
l_0411     lsr                  ; $3ae6: $4a
           bcs l_0422           ; $3ae7: $b0 $18
           lda l_1007           ; $3ae9: $ad $24 $40
           cmp #$00             ; $3aec: $c9 $00
           beq l_0422           ; $3aee: $f0 $11
           lda l_1019 + 1       ; $3af0: $ad $32 $40
           sta l_1021           ; $3af3: $8d $34 $40
           lda l_1020           ; $3af6: $ad $33 $40
           sta l_1022           ; $3af9: $8d $35 $40
           lda #$00             ; $3afc: $a9 $00
           sta l_1007           ; $3afe: $8d $24 $40
l_0422     rts                  ; $3b01: $60
l_0423     lda l_1007           ; $3b02: $ad $24 $40
           cmp #$01             ; $3b05: $c9 $01
           beq l_0442           ; $3b07: $f0 $1c
           ldx l_1022           ; $3b09: $ae $35 $40
           dex                  ; $3b0c: $ca
           dex                  ; $3b0d: $ca
           dex                  ; $3b0e: $ca
           dex                  ; $3b0f: $ca
           dex                  ; $3b10: $ca
           dex                  ; $3b11: $ca
           dex                  ; $3b12: $ca
           dex                  ; $3b13: $ca
           cpx #$02             ; $3b14: $e0 $02
           bcs l_0443           ; $3b16: $b0 $0e
           ldx #$fc             ; $3b18: $a2 $fc
           stx l_1022           ; $3b1a: $8e $35 $40
           stx l_1021           ; $3b1d: $8e $34 $40
           lda #$01             ; $3b20: $a9 $01
           sta l_1007           ; $3b22: $8d $24 $40
l_0442     rts                  ; $3b25: $60
l_0443     stx l_1022           ; $3b26: $8e $35 $40
l_0444     lda l_1021           ; $3b29: $ad $34 $40
           sec                  ; $3b2c: $38
           sbc #$06             ; $3b2d: $e9 $06
           sta l_1035           ; $3b2f: $8d $42 $40
           clc                  ; $3b32: $18
           adc #$0c             ; $3b33: $69 $0c
           sta l_1036           ; $3b35: $8d $43 $40
           lda l_1022           ; $3b38: $ad $35 $40
           sec                  ; $3b3b: $38
           sbc #$0c             ; $3b3c: $e9 $0c
           sta l_1037           ; $3b3e: $8d $44 $40
           clc                  ; $3b41: $18
           adc #$18             ; $3b42: $69 $18
           sta l_1038           ; $3b44: $8d $45 $40
           lda l_1023           ; $3b47: $ad $36 $40
           sec                  ; $3b4a: $38
           sbc #$06             ; $3b4b: $e9 $06
           sta l_1039           ; $3b4d: $8d $46 $40
           clc                  ; $3b50: $18
           adc #$0c             ; $3b51: $69 $0c
           sta l_1040           ; $3b53: $8d $47 $40
           lda l_1024           ; $3b56: $ad $37 $40
           sec                  ; $3b59: $38
           sbc #$0c             ; $3b5a: $e9 $0c
           sta l_1041           ; $3b5c: $8d $48 $40
           clc                  ; $3b5f: $18
           adc #$18             ; $3b60: $69 $18
           sta l_1042           ; $3b62: $8d $49 $40
           lda l_1025           ; $3b65: $ad $38 $40
           sec                  ; $3b68: $38
           sbc #$06             ; $3b69: $e9 $06
           sta l_1043           ; $3b6b: $8d $4a $40
           clc                  ; $3b6e: $18
           adc #$0c             ; $3b6f: $69 $0c
           sta l_1044           ; $3b71: $8d $4b $40
           lda l_1026           ; $3b74: $ad $39 $40
           sec                  ; $3b77: $38
           sbc #$0c             ; $3b78: $e9 $0c
           sta l_1045           ; $3b7a: $8d $4c $40
           clc                  ; $3b7d: $18
           adc #$18             ; $3b7e: $69 $18
           sta l_1046           ; $3b80: $8d $4d $40
           rts                  ; $3b83: $60
l_0487     lda l_1027           ; $3b84: $ad $3a $40
           cmp l_1035           ; $3b87: $cd $42 $40
           bcc l_0517           ; $3b8a: $90 $43
           cmp l_1036           ; $3b8c: $cd $43 $40
           bcs l_0517           ; $3b8f: $b0 $3e
           lda l_1028           ; $3b91: $ad $3b $40
           cmp l_1037           ; $3b94: $cd $44 $40
           bcc l_0517           ; $3b97: $90 $36
           cmp l_1038           ; $3b99: $cd $45 $40
           bcs l_0517           ; $3b9c: $b0 $31
           lda #$00             ; $3b9e: $a9 $00
           sta l_1011           ; $3ba0: $8d $29 $40
           sta l_1010           ; $3ba3: $8d $28 $40
           ldx #$fc             ; $3ba6: $a2 $fc
           stx l_1022           ; $3ba8: $8e $35 $40
           stx l_1021           ; $3bab: $8e $34 $40
           lda #$01             ; $3bae: $a9 $01
           sta l_1007           ; $3bb0: $8d $24 $40
           lda #$01             ; $3bb3: $a9 $01
           sta l_1061           ; $3bb5: $8d $e7 $40
           lda #$00             ; $3bb8: $a9 $00
           sta l_1011           ; $3bba: $8d $29 $40
           sta l_1010           ; $3bbd: $8d $28 $40
           lda l_0197 + 1       ; $3bc0: $ad $e7 $38
           cmp #$01             ; $3bc3: $c9 $01
           beq l_0520           ; $3bc5: $f0 $0f
           cmp #$02             ; $3bc7: $c9 $02
           beq l_0519           ; $3bc9: $f0 $08
           cmp #$03             ; $3bcb: $c9 $03
           beq l_0518           ; $3bcd: $f0 $01
l_0517     rts                  ; $3bcf: $60
l_0518     jsr l_0936           ; $3bd0: $20 $87 $3f
l_0519     jsr l_0936           ; $3bd3: $20 $87 $3f
l_0520     jsr l_0936           ; $3bd6: $20 $87 $3f
           rts                  ; $3bd9: $60
l_0522     lda l_1029           ; $3bda: $ad $3c $40
           cmp l_1035           ; $3bdd: $cd $42 $40
           bcc l_0553           ; $3be0: $90 $46
           cmp l_1036           ; $3be2: $cd $43 $40
           bcs l_0553           ; $3be5: $b0 $41
           lda l_1030           ; $3be7: $ad $3d $40
           cmp l_1037           ; $3bea: $cd $44 $40
           bcc l_0553           ; $3bed: $90 $39
           cmp l_1038           ; $3bef: $cd $45 $40
           bcs l_0553           ; $3bf2: $b0 $34
           jsr l_0377           ; $3bf4: $20 $a1 $3a
           ldx #$fc             ; $3bf7: $a2 $fc
           stx l_1022           ; $3bf9: $8e $35 $40
           stx l_1021           ; $3bfc: $8e $34 $40
           lda #$01             ; $3bff: $a9 $01
           sta l_1007           ; $3c01: $8d $24 $40
           lda #$01             ; $3c04: $a9 $01
           sta l_1062           ; $3c06: $8d $e8 $40
           lda #$00             ; $3c09: $a9 $00
           sta l_1013           ; $3c0b: $8d $2b $40
           sta l_1012           ; $3c0e: $8d $2a $40
           lda #$00             ; $3c11: $a9 $00
           sta l_1013           ; $3c13: $8d $2b $40
           sta l_1012           ; $3c16: $8d $2a $40
           lda l_0243 + 1       ; $3c19: $ad $58 $39
           cmp #$01             ; $3c1c: $c9 $01
           beq l_0556           ; $3c1e: $f0 $0f
           cmp #$02             ; $3c20: $c9 $02
           beq l_0555           ; $3c22: $f0 $08
           cmp #$03             ; $3c24: $c9 $03
           beq l_0554           ; $3c26: $f0 $01
l_0553     rts                  ; $3c28: $60
l_0554     jsr l_0936           ; $3c29: $20 $87 $3f
l_0555     jsr l_0936           ; $3c2c: $20 $87 $3f
l_0556     jsr l_0936           ; $3c2f: $20 $87 $3f
           rts                  ; $3c32: $60
l_0558     lda l_1031           ; $3c33: $ad $3e $40
           cmp l_1035           ; $3c36: $cd $42 $40
           bcc l_0585           ; $3c39: $90 $3b
           cmp l_1036           ; $3c3b: $cd $43 $40
           bcs l_0585           ; $3c3e: $b0 $36
           lda l_1032           ; $3c40: $ad $3f $40
           cmp l_1037           ; $3c43: $cd $44 $40
           bcc l_0585           ; $3c46: $90 $2e
           cmp l_1038           ; $3c48: $cd $45 $40
           bcs l_0617           ; $3c4b: $b0 $77
           ldx #$fc             ; $3c4d: $a2 $fc
           stx l_1022           ; $3c4f: $8e $35 $40
           stx l_1021           ; $3c52: $8e $34 $40
           lda #$01             ; $3c55: $a9 $01
           sta l_1007           ; $3c57: $8d $24 $40
           lda #$01             ; $3c5a: $a9 $01
           sta l_1063           ; $3c5c: $8d $e9 $40
           lda #$00             ; $3c5f: $a9 $00
           sta l_1014           ; $3c61: $8d $2c $40
           sta l_1015           ; $3c64: $8d $2d $40
           lda l_0290 + 1       ; $3c67: $ad $cc $39
           cmp #$01             ; $3c6a: $c9 $01
           beq l_0588           ; $3c6c: $f0 $0f
           cmp #$02             ; $3c6e: $c9 $02
           beq l_0587           ; $3c70: $f0 $08
           cmp #$03             ; $3c72: $c9 $03
           beq l_0586           ; $3c74: $f0 $01
l_0585     rts                  ; $3c76: $60
l_0586     jsr l_0936           ; $3c77: $20 $87 $3f
l_0587     jsr l_0936           ; $3c7a: $20 $87 $3f
l_0588     jsr l_0936           ; $3c7d: $20 $87 $3f
           rts                  ; $3c80: $60
l_0590     lda l_1033           ; $3c81: $ad $40 $40
           cmp l_1035           ; $3c84: $cd $42 $40
           bcc l_0617           ; $3c87: $90 $3b
           cmp l_1036           ; $3c89: $cd $43 $40
           bcs l_0617           ; $3c8c: $b0 $36
           lda l_1034           ; $3c8e: $ad $41 $40
           cmp l_1037           ; $3c91: $cd $44 $40
           bcc l_0617           ; $3c94: $90 $2e
           cmp l_1038           ; $3c96: $cd $45 $40
           bcs l_0617           ; $3c99: $b0 $29
           ldx #$fc             ; $3c9b: $a2 $fc
           stx l_1022           ; $3c9d: $8e $35 $40
           stx l_1021           ; $3ca0: $8e $34 $40
           lda #$00             ; $3ca3: $a9 $00
           sta l_1016           ; $3ca5: $8d $2e $40
           sta l_1017           ; $3ca8: $8d $2f $40
           lda #$01             ; $3cab: $a9 $01
           sta l_1064           ; $3cad: $8d $ea $40
           lda #$01             ; $3cb0: $a9 $01
           sta l_1007           ; $3cb2: $8d $24 $40
           lda l_0338 + 1       ; $3cb5: $ad $42 $3a
           cmp #$01             ; $3cb8: $c9 $01
           beq l_0620           ; $3cba: $f0 $0f
           cmp #$02             ; $3cbc: $c9 $02
           beq l_0619           ; $3cbe: $f0 $08
           cmp #$03             ; $3cc0: $c9 $03
           beq l_0618           ; $3cc2: $f0 $01
l_0617     rts                  ; $3cc4: $60
l_0618     jsr l_0936           ; $3cc5: $20 $87 $3f
l_0619     jsr l_0936           ; $3cc8: $20 $87 $3f
l_0620     jsr l_0936           ; $3ccb: $20 $87 $3f
           rts                  ; $3cce: $60
l_0622     inc l_1080           ; $3ccf: $ee $03 $41
           lda l_1080           ; $3cd2: $ad $03 $41
           cmp #$32             ; $3cd5: $c9 $32
           beq l_0627           ; $3cd7: $f0 $01
           rts                  ; $3cd9: $60
l_0627     lda #$00             ; $3cda: $a9 $00
           sta l_1080           ; $3cdc: $8d $03 $41
           inc l_1081           ; $3cdf: $ee $04 $41
           lda l_1081           ; $3ce2: $ad $04 $41
           cmp #$08             ; $3ce5: $c9 $08
           beq l_0634           ; $3ce7: $f0 $01
           rts                  ; $3ce9: $60
l_0634     ldx #$00             ; $3cea: $a2 $00
           stx l_1081           ; $3cec: $8e $04 $41
           jsr l_0638           ; $3cef: $20 $f3 $3c
           rts                  ; $3cf2: $60
l_0638     ldx l_1018           ; $3cf3: $ae $30 $40
           lda l_1048,x         ; $3cf6: $bd $62 $40
           sta l_1009           ; $3cf9: $8d $27 $40
           inx                  ; $3cfc: $e8
           cpx #$14             ; $3cfd: $e0 $14
           beq l_0646           ; $3cff: $f0 $04
           inc l_1018           ; $3d01: $ee $30 $40
           rts                  ; $3d04: $60
l_0646     ldx #$00             ; $3d05: $a2 $00
           stx l_1018           ; $3d07: $8e $30 $40
           rts                  ; $3d0a: $60
l_0649     jsr l_0654           ; $3d0b: $20 $18 $3d
           jsr l_0670           ; $3d0e: $20 $3e $3d
           jsr l_0686           ; $3d11: $20 $64 $3d
           jsr l_0702           ; $3d14: $20 $8a $3d
           rts                  ; $3d17: $60
l_0654     lda l_1009           ; $3d18: $ad $27 $40
           cmp #$01             ; $3d1b: $c9 $01
           beq l_0658           ; $3d1d: $f0 $01
           rts                  ; $3d1f: $60
l_0658     lda l_1027           ; $3d20: $ad $3a $40
           cmp l_1025           ; $3d23: $cd $38 $40
           bne l_0669           ; $3d26: $d0 $15
           lda #$01             ; $3d28: $a9 $01
           sta l_1010           ; $3d2a: $8d $28 $40
           lda #$00             ; $3d2d: $a9 $00
           sta l_1011           ; $3d2f: $8d $29 $40
           lda l_0197 + 1       ; $3d32: $ad $e7 $38
           sta l_1008           ; $3d35: $8d $26 $40
           lda #$00             ; $3d38: $a9 $00
           sta l_0197 + 1       ; $3d3a: $8d $e7 $38
l_0669     rts                  ; $3d3d: $60
l_0670     lda l_1009           ; $3d3e: $ad $27 $40
           cmp #$02             ; $3d41: $c9 $02
           beq l_0674           ; $3d43: $f0 $01
           rts                  ; $3d45: $60
l_0674     lda l_1029           ; $3d46: $ad $3c $40
           cmp l_1023           ; $3d49: $cd $36 $40
           bne l_0685           ; $3d4c: $d0 $15
           lda #$01             ; $3d4e: $a9 $01
           sta l_1012           ; $3d50: $8d $2a $40
           lda #$00             ; $3d53: $a9 $00
           sta l_1013           ; $3d55: $8d $2b $40
           lda l_0243 + 1       ; $3d58: $ad $58 $39
           sta l_1008           ; $3d5b: $8d $26 $40
           lda #$00             ; $3d5e: $a9 $00
           sta l_0243 + 1       ; $3d60: $8d $58 $39
l_0685     rts                  ; $3d63: $60
l_0686     lda l_1009           ; $3d64: $ad $27 $40
           cmp #$03             ; $3d67: $c9 $03
           beq l_0690           ; $3d69: $f0 $01
           rts                  ; $3d6b: $60
l_0690     lda l_1031           ; $3d6c: $ad $3e $40
           cmp l_1025           ; $3d6f: $cd $38 $40
           bne l_0701           ; $3d72: $d0 $15
           lda #$01             ; $3d74: $a9 $01
           sta l_1015           ; $3d76: $8d $2d $40
           lda #$00             ; $3d79: $a9 $00
           sta l_1014           ; $3d7b: $8d $2c $40
           lda l_0290 + 1       ; $3d7e: $ad $cc $39
           sta l_1008           ; $3d81: $8d $26 $40
           lda #$00             ; $3d84: $a9 $00
           sta l_0290 + 1       ; $3d86: $8d $cc $39
l_0701     rts                  ; $3d89: $60
l_0702     lda l_1009           ; $3d8a: $ad $27 $40
           cmp #$04             ; $3d8d: $c9 $04
           beq l_0706           ; $3d8f: $f0 $01
           rts                  ; $3d91: $60
l_0706     lda l_1033           ; $3d92: $ad $40 $40
           cmp l_1023           ; $3d95: $cd $36 $40
           bne l_0717           ; $3d98: $d0 $15
           lda #$01             ; $3d9a: $a9 $01
           sta l_1017           ; $3d9c: $8d $2f $40
           lda #$00             ; $3d9f: $a9 $00
           sta l_1016           ; $3da1: $8d $2e $40
           lda l_0338 + 1       ; $3da4: $ad $42 $3a
           sta l_1008           ; $3da7: $8d $26 $40
           lda #$00             ; $3daa: $a9 $00
           sta l_0338 + 1       ; $3dac: $8d $42 $3a
l_0717     rts                  ; $3daf: $60
l_0718     jsr l_0752           ; $3db0: $20 $fd $3d
           jsr l_0727           ; $3db3: $20 $c9 $3d
           jsr l_0804           ; $3db6: $20 $6c $3e
           jsr l_0779           ; $3db9: $20 $38 $3e
           jsr l_0856           ; $3dbc: $20 $db $3e
           jsr l_0831           ; $3dbf: $20 $a7 $3e
           jsr l_0908           ; $3dc2: $20 $4a $3f
           jsr l_0883           ; $3dc5: $20 $16 $3f
           rts                  ; $3dc8: $60
l_0727     lda l_1010           ; $3dc9: $ad $28 $40
           cmp #$01             ; $3dcc: $c9 $01
           bne l_0751           ; $3dce: $d0 $2c
           lda l_1061           ; $3dd0: $ad $e7 $40
           cmp #$00             ; $3dd3: $c9 $00
           bne l_0751           ; $3dd5: $d0 $25
           lda l_1028           ; $3dd7: $ad $3b $40
           cmp #$40             ; $3dda: $c9 $40
           bcc l_0751           ; $3ddc: $90 $1e
           ldx l_1028           ; $3dde: $ae $3b $40
           inx                  ; $3de1: $e8
           inx                  ; $3de2: $e8
           inx                  ; $3de3: $e8
           inx                  ; $3de4: $e8
           cpx #$ec             ; $3de5: $e0 $ec
           bcc l_0750           ; $3de7: $90 $10
           lda #$00             ; $3de9: $a9 $00
           sta l_1010           ; $3deb: $8d $28 $40
           lda #$01             ; $3dee: $a9 $01
           sta l_1011           ; $3df0: $8d $29 $40
           lda #$00             ; $3df3: $a9 $00
           sta l_1009           ; $3df5: $8d $27 $40
           rts                  ; $3df8: $60
l_0750     stx l_1028           ; $3df9: $8e $3b $40
l_0751     rts                  ; $3dfc: $60
l_0752     lda l_1011           ; $3dfd: $ad $29 $40
           cmp #$01             ; $3e00: $c9 $01
           bne l_0778           ; $3e02: $d0 $33
           lda l_1061           ; $3e04: $ad $e7 $40
           cmp #$00             ; $3e07: $c9 $00
           bne l_0778           ; $3e09: $d0 $2c
           ldx l_1028           ; $3e0b: $ae $3b $40
           dex                  ; $3e0e: $ca
           dex                  ; $3e0f: $ca
           dex                  ; $3e10: $ca
           dex                  ; $3e11: $ca
           cpx #$02             ; $3e12: $e0 $02
           bcs l_0777           ; $3e14: $b0 $1e
           lda #$00             ; $3e16: $a9 $00
           sta l_1011           ; $3e18: $8d $29 $40
           sta l_1010           ; $3e1b: $8d $28 $40
           lda #$02             ; $3e1e: $a9 $02
           sta l_0197 + 1       ; $3e20: $8d $e7 $38
           lda #$00             ; $3e23: $a9 $00
           sta l_1027           ; $3e25: $8d $3a $40
           sta l_1028           ; $3e28: $8d $3b $40
           jsr l_0951           ; $3e2b: $20 $a9 $3f
           lda #$00             ; $3e2e: $a9 $00
           sta l_1009           ; $3e30: $8d $27 $40
           rts                  ; $3e33: $60
l_0777     stx l_1028           ; $3e34: $8e $3b $40
l_0778     rts                  ; $3e37: $60
l_0779     lda l_1012           ; $3e38: $ad $2a $40
           cmp #$01             ; $3e3b: $c9 $01
           bne l_0803           ; $3e3d: $d0 $2c
           lda l_1062           ; $3e3f: $ad $e8 $40
           cmp #$00             ; $3e42: $c9 $00
           bne l_0803           ; $3e44: $d0 $25
           lda l_1030           ; $3e46: $ad $3d $40
           cmp #$40             ; $3e49: $c9 $40
           bcc l_0803           ; $3e4b: $90 $1e
           ldx l_1030           ; $3e4d: $ae $3d $40
           inx                  ; $3e50: $e8
           inx                  ; $3e51: $e8
           inx                  ; $3e52: $e8
           inx                  ; $3e53: $e8
           cpx #$ec             ; $3e54: $e0 $ec
           bcc l_0802           ; $3e56: $90 $10
           lda #$00             ; $3e58: $a9 $00
           sta l_1012           ; $3e5a: $8d $2a $40
           lda #$01             ; $3e5d: $a9 $01
           sta l_1013           ; $3e5f: $8d $2b $40
           lda #$00             ; $3e62: $a9 $00
           sta l_1009           ; $3e64: $8d $27 $40
           rts                  ; $3e67: $60
l_0802     stx l_1030           ; $3e68: $8e $3d $40
l_0803     rts                  ; $3e6b: $60
l_0804     lda l_1013           ; $3e6c: $ad $2b $40
           cmp #$01             ; $3e6f: $c9 $01
           bne l_0830           ; $3e71: $d0 $33
           lda l_1062           ; $3e73: $ad $e8 $40
           cmp #$00             ; $3e76: $c9 $00
           bne l_0830           ; $3e78: $d0 $2c
           ldx l_1030           ; $3e7a: $ae $3d $40
           dex                  ; $3e7d: $ca
           dex                  ; $3e7e: $ca
           dex                  ; $3e7f: $ca
           dex                  ; $3e80: $ca
           cpx #$04             ; $3e81: $e0 $04
           bcs l_0829           ; $3e83: $b0 $1e
           lda #$00             ; $3e85: $a9 $00
           sta l_1013           ; $3e87: $8d $2b $40
           sta l_1012           ; $3e8a: $8d $2a $40
           lda #$02             ; $3e8d: $a9 $02
           sta l_0243 + 1       ; $3e8f: $8d $58 $39
           lda #$00             ; $3e92: $a9 $00
           sta l_1030           ; $3e94: $8d $3d $40
           sta l_1029           ; $3e97: $8d $3c $40
           lda #$00             ; $3e9a: $a9 $00
           sta l_1009           ; $3e9c: $8d $27 $40
           jsr l_0951           ; $3e9f: $20 $a9 $3f
           rts                  ; $3ea2: $60
l_0829     stx l_1030           ; $3ea3: $8e $3d $40
l_0830     rts                  ; $3ea6: $60
l_0831     lda l_1015           ; $3ea7: $ad $2d $40
           cmp #$01             ; $3eaa: $c9 $01
           bne l_0855           ; $3eac: $d0 $2c
           lda l_1063           ; $3eae: $ad $e9 $40
           cmp #$00             ; $3eb1: $c9 $00
           bne l_0855           ; $3eb3: $d0 $25
           lda l_1032           ; $3eb5: $ad $3f $40
           cmp #$40             ; $3eb8: $c9 $40
           bcc l_0855           ; $3eba: $90 $1e
           ldx l_1032           ; $3ebc: $ae $3f $40
           inx                  ; $3ebf: $e8
           inx                  ; $3ec0: $e8
           inx                  ; $3ec1: $e8
           inx                  ; $3ec2: $e8
           cpx #$ec             ; $3ec3: $e0 $ec
           bcc l_0854           ; $3ec5: $90 $10
           lda #$00             ; $3ec7: $a9 $00
           sta l_1015           ; $3ec9: $8d $2d $40
           lda #$01             ; $3ecc: $a9 $01
           sta l_1014           ; $3ece: $8d $2c $40
           lda #$00             ; $3ed1: $a9 $00
           sta l_1009           ; $3ed3: $8d $27 $40
           rts                  ; $3ed6: $60
l_0854     stx l_1032           ; $3ed7: $8e $3f $40
l_0855     rts                  ; $3eda: $60
l_0856     lda l_1014           ; $3edb: $ad $2c $40
           cmp #$01             ; $3ede: $c9 $01
           bne l_0882           ; $3ee0: $d0 $33
           lda l_1063           ; $3ee2: $ad $e9 $40
           cmp #$00             ; $3ee5: $c9 $00
           bne l_0882           ; $3ee7: $d0 $2c
           ldx l_1032           ; $3ee9: $ae $3f $40
           dex                  ; $3eec: $ca
           dex                  ; $3eed: $ca
           dex                  ; $3eee: $ca
           dex                  ; $3eef: $ca
           cpx #$02             ; $3ef0: $e0 $02
           bcs l_0881           ; $3ef2: $b0 $1e
           lda #$00             ; $3ef4: $a9 $00
           sta l_1014           ; $3ef6: $8d $2c $40
           sta l_1015           ; $3ef9: $8d $2d $40
           lda #$02             ; $3efc: $a9 $02
           sta l_1031           ; $3efe: $8d $3e $40
           sta l_1032           ; $3f01: $8d $3f $40
           lda #$02             ; $3f04: $a9 $02
           sta l_0290 + 1       ; $3f06: $8d $cc $39
           lda #$00             ; $3f09: $a9 $00
           sta l_1009           ; $3f0b: $8d $27 $40
           jsr l_0951           ; $3f0e: $20 $a9 $3f
           rts                  ; $3f11: $60
l_0881     stx l_1032           ; $3f12: $8e $3f $40
l_0882     rts                  ; $3f15: $60
l_0883     lda l_1017           ; $3f16: $ad $2f $40
           cmp #$01             ; $3f19: $c9 $01
           bne l_0907           ; $3f1b: $d0 $2c
           lda l_1064           ; $3f1d: $ad $ea $40
           cmp #$00             ; $3f20: $c9 $00
           bne l_0907           ; $3f22: $d0 $25
           lda l_1034           ; $3f24: $ad $41 $40
           cmp #$40             ; $3f27: $c9 $40
           bcc l_0907           ; $3f29: $90 $1e
           ldx l_1034           ; $3f2b: $ae $41 $40
           inx                  ; $3f2e: $e8
           inx                  ; $3f2f: $e8
           inx                  ; $3f30: $e8
           inx                  ; $3f31: $e8
           cpx #$e8             ; $3f32: $e0 $e8
           bcc l_0906           ; $3f34: $90 $10
           lda #$00             ; $3f36: $a9 $00
           sta l_1017           ; $3f38: $8d $2f $40
           lda #$01             ; $3f3b: $a9 $01
           sta l_1016           ; $3f3d: $8d $2e $40
           lda #$00             ; $3f40: $a9 $00
           sta l_1009           ; $3f42: $8d $27 $40
           rts                  ; $3f45: $60
l_0906     stx l_1034           ; $3f46: $8e $41 $40
l_0907     rts                  ; $3f49: $60
l_0908     lda l_1016           ; $3f4a: $ad $2e $40
           cmp #$01             ; $3f4d: $c9 $01
           bne l_0935           ; $3f4f: $d0 $35
           lda l_1064           ; $3f51: $ad $ea $40
           cmp #$00             ; $3f54: $c9 $00
           bne l_0935           ; $3f56: $d0 $2e
           ldx l_1034           ; $3f58: $ae $41 $40
           dex                  ; $3f5b: $ca
           dex                  ; $3f5c: $ca
           dex                  ; $3f5d: $ca
           dex                  ; $3f5e: $ca
           cpx #$08             ; $3f5f: $e0 $08
           bcs l_0934           ; $3f61: $b0 $20
           lda #$00             ; $3f63: $a9 $00
           sta l_1016           ; $3f65: $8d $2e $40
           sta l_1017           ; $3f68: $8d $2f $40
           lda #$02             ; $3f6b: $a9 $02
           sta l_0338 + 1       ; $3f6d: $8d $42 $3a
           ldx #$00             ; $3f70: $a2 $00
           stx l_1034           ; $3f72: $8e $41 $40
           ldx #$00             ; $3f75: $a2 $00
           stx l_1033           ; $3f77: $8e $40 $40
           lda #$00             ; $3f7a: $a9 $00
           sta l_1009           ; $3f7c: $8d $27 $40
           jsr l_0951           ; $3f7f: $20 $a9 $3f
           rts                  ; $3f82: $60
l_0934     stx l_1034           ; $3f83: $8e $41 $40
l_0935     rts                  ; $3f86: $60
l_0936     inc $040a            ; $3f87: $ee $0a $04
           ldx #$04             ; $3f8a: $a2 $04
l_0938     lda $0407,x          ; $3f8c: $bd $07 $04
           cmp #$3a             ; $3f8f: $c9 $3a
           bne l_0944           ; $3f91: $d0 $08
           lda #$30             ; $3f93: $a9 $30
           sta $0407,x          ; $3f95: $9d $07 $04
           inc $0406,x          ; $3f98: $fe $06 $04
l_0944     dex                  ; $3f9b: $ca
           bne l_0938           ; $3f9c: $d0 $ee
           jsr l_0951           ; $3f9e: $20 $a9 $3f
           rts                  ; $3fa1: $60
l_0948     jsr l_0963           ; $3fa2: $20 $c2 $3f
           jsr l_0985           ; $3fa5: $20 $f3 $3f
           rts                  ; $3fa8: $60
l_0951     lda l_1065           ; $3fa9: $ad $eb $40
           cmp #$01             ; $3fac: $c9 $01
           beq l_0955           ; $3fae: $f0 $01
           rts                  ; $3fb0: $60
l_0955     lda l_1066           ; $3fb1: $ad $ec $40
           cmp #$01             ; $3fb4: $c9 $01
           beq l_0959           ; $3fb6: $f0 $01
           rts                  ; $3fb8: $60
l_0959     jsr l_0076           ; $3fb9: $20 $ab $37
           lda #$01             ; $3fbc: $a9 $01
           sta l_1019           ; $3fbe: $8d $31 $40
           rts                  ; $3fc1: $60
l_0963     ldx #$00             ; $3fc2: $a2 $00
l_0964     lda l_1027,x         ; $3fc4: $bd $3a $40
           cmp l_1039           ; $3fc7: $cd $46 $40
           bcc l_0980           ; $3fca: $90 $20
           cmp l_1040           ; $3fcc: $cd $47 $40
           bcs l_0980           ; $3fcf: $b0 $1b
           lda l_1028,x         ; $3fd1: $bd $3b $40
           cmp l_1041           ; $3fd4: $cd $48 $40
           bcc l_0980           ; $3fd7: $90 $13
           cmp l_1042           ; $3fd9: $cd $49 $40
           bcs l_0980           ; $3fdc: $b0 $0e
           lda #$00             ; $3fde: $a9 $00
           sta l_1024           ; $3fe0: $8d $37 $40
           sta l_1023           ; $3fe3: $8d $36 $40
           lda #$01             ; $3fe6: $a9 $01
           sta l_1065           ; $3fe8: $8d $eb $40
           rts                  ; $3feb: $60
l_0980     inx                  ; $3fec: $e8
           inx                  ; $3fed: $e8
           cpx #$08             ; $3fee: $e0 $08
           bne l_0964           ; $3ff0: $d0 $d2
           rts                  ; $3ff2: $60
l_0985     ldx #$00             ; $3ff3: $a2 $00
l_0986     lda l_1027,x         ; $3ff5: $bd $3a $40
           cmp l_1043           ; $3ff8: $cd $4a $40
           bcc l_1002           ; $3ffb: $90 $20
           cmp l_1044           ; $3ffd: $cd $4b $40
           bcs l_1002           ; $4000: $b0 $1b
           lda l_1028,x         ; $4002: $bd $3b $40
           cmp l_1045           ; $4005: $cd $4c $40
           bcc l_1002           ; $4008: $90 $13
           cmp l_1046           ; $400a: $cd $4d $40
           bcs l_1002           ; $400d: $b0 $0e
           lda #$00             ; $400f: $a9 $00
           sta l_1026           ; $4011: $8d $39 $40
           sta l_1025           ; $4014: $8d $38 $40
           lda #$01             ; $4017: $a9 $01
           sta l_1066           ; $4019: $8d $ec $40
           rts                  ; $401c: $60
l_1002     inx                  ; $401d: $e8
           inx                  ; $401e: $e8
           cpx #$08             ; $401f: $e0 $08
           bne l_0986           ; $4021: $d0 $d2
           rts                  ; $4023: $60
firebutton !byte 0           
l_1007     !byte $01,$00        ; $4024: $01 $00
l_1008     !byte $00            ; $4026: $00
l_1009     !byte $00            ; $4027: $00
l_1010     !byte $00            ; $4028: $00
l_1011     !byte $00            ; $4029: $00
l_1012     !byte $00            ; $402a: $00
l_1013     !byte $00            ; $402b: $00
l_1014     !byte $00            ; $402c: $00
l_1015     !byte $00            ; $402d: $00
l_1016     !byte $00            ; $402e: $00
l_1017     !byte $00            ; $402f: $00
l_1018     !byte $00            ; $4030: $00
l_1019     !byte $01,$00        ; $4031: $01 $00
l_1020     !byte $00            ; $4033: $00
l_1021     !byte $00            ; $4034: $00
l_1022     !byte $00            ; $4035: $00
l_1023     !byte $00            ; $4036: $00
l_1024     !byte $00            ; $4037: $00
l_1025     !byte $00            ; $4038: $00
l_1026     !byte $00            ; $4039: $00
l_1027     !byte $00            ; $403a: $00
l_1028     !byte $00            ; $403b: $00
l_1029     !byte $00            ; $403c: $00
l_1030     !byte $00            ; $403d: $00
l_1031     !byte $00            ; $403e: $00
l_1032     !byte $00            ; $403f: $00
l_1033     !byte $00            ; $4040: $00
l_1034     !byte $00            ; $4041: $00
l_1035     !byte $00            ; $4042: $00
l_1036     !byte $00            ; $4043: $00
l_1037     !byte $00            ; $4044: $00
l_1038     !byte $00            ; $4045: $00
l_1039     !byte $00            ; $4046: $00
l_1040     !byte $00            ; $4047: $00
l_1041     !byte $00            ; $4048: $00
l_1042     !byte $00            ; $4049: $00
l_1043     !byte $00            ; $404a: $00
l_1044     !byte $00            ; $404b: $00
l_1045     !byte $00            ; $404c: $00
l_1046     !byte $00,$00,$00,$00,$00 ; $404d: $00 $00 $00 $00 $00
l_1047     !byte $58,$e0,$fc,$fc,$28,$e0,$88,$e0,$30,$00,$60,$00,$90,$00,$b0,$00 
l_1048     !byte $00,$01,$02,$03,$04,$03,$00,$02,$01,$04,$03,$02,$00,$04,$01,$04,$03,$02,$01,$00,$03,$00,$01,$04,$02 
l_1049     !byte $0f,$0f,$08,$08,$0a,$0e,$0d,$03 ; $407b: $0f $0f $08 $08 $0a $0e $0d $03
l_1050     !byte $01,$07,$04,$02,$00,$02,$04,$07 ; $4083: $01 $07 $04 $02 $00 $02 $04 $07
l_1051     !byte $40,$a0,$60,$90,$70,$d0,$c0,$50,$80,$90,$c0,$90,$80,$40,$d0,$70,$a0,$60,$90,$b0,$b0
l_1052     !byte $01,$02,$01,$03,$02,$01,$02,$03,$01,$02,$03,$01,$02,$02,$03,$01,$01,$02,$01,$03,$03
l_1053     !byte $c5,$c6        
l_1054     !byte $c0,$c0,$c0,$c0,$c1,$c1,$c1,$c1 ; $40b5: $c0 $c0 $c0 $c0 $c1 $c1 $c1 $c1
l_1055     !byte $c2,$c2,$c2,$c2,$c3,$c3,$c3,$c3 ; $40bd: $c2 $c2 $c2 $c2 $c3 $c3 $c3 $c3
l_1056     !byte $c7,$c7,$c8,$c8,$c9,$c9,$ca,$ca ; $40c5: $c7 $c7 $c8 $c8 $c9 $c9 $ca $ca
l_1057     !byte $cb,$cb,$cc,$cc,$cd,$cd,$ce,$ce,$cf,$cf,$d0,$d0,$d1,$d1,$d2,$d2 
l_1058     !byte $00,$06,$04,$03,$01,$03,$04 
l_1059     !byte $06,$00        ; $40e4: $06 $00
l_1060     !byte $00            ; $40e6: $00
l_1061     !byte $00            ; $40e7: $00
l_1062     !byte $00            ; $40e8: $00
l_1063     !byte $00            ; $40e9: $00
l_1064     !byte $00            ; $40ea: $00
l_1065     !byte $00            ; $40eb: $00
l_1066     !byte $00            ; $40ec: $00
l_1067     !byte $c7            ; $40ed: $c7
l_1068     !byte $c0,$c2,$00    ; $40ee: $c0 $c2 $00
l_1069     !byte $02            ; $40f1: $02
l_1070     !byte $01,$00        ; $40f2: $01 $00
l_1071     !byte $00            ; $40f4: $00
l_1072     !byte $01            ; $40f5: $01
l_1073     !byte $00            ; $40f6: $00
l_1074     !byte $01,$01,$00,$00 ; $40f7: $01 $01 $00 $00
l_1075     !byte $00,$00        ; $40fb: $00 $00
l_1076     !byte $00,$00        ; $40fd: $00 $00
l_1077     !byte $00            ; $40ff: $00
           !byte $00            ; $4100: $00
l_1079     !byte $00,$00        ; $4101: $00 $00
l_1080     !byte $00            ; $4103: $00
l_1081     !byte $00,$00,$00,$00,$00,$00,$00 ; $4104: $00 $00 $00 $00 $00 $00 $00
           !byte $00            ; $410b: $00
           !byte $00            ; $410c: $00
           !byte $00            ; $410d: $00
           !byte $00            ; $410e: $00
           !byte $00            ; $410f: $00
           !byte $00            ; $4110: $00
           !byte $00            ; $4111: $00
           !byte $00            ; $4112: $00
           !byte $00            ; $4113: $00
           !byte $00            ; $4114: $00
           !byte $00            ; $4115: $00
           !byte $00            ; $4116: $00
           !byte $00            ; $4117: $00
           !byte $00            ; $4118: $00
           !byte $00            ; $4119: $00
           !byte $00            ; $411a: $00
           !byte $00            ; $411b: $00
           !byte $00            ; $411c: $00
           !byte $00            ; $411d: $00
           !byte $00            ; $411e: $00
           !byte $00            ; $411f: $00
           !byte $00            ; $4120: $00
           !byte $00            ; $4121: $00
           !byte $00            ; $4122: $00
           !byte $00            ; $4123: $00
           !byte $00            ; $4124: $00
           !byte $00            ; $4125: $00
           !byte $00            ; $4126: $00
           !byte $00            ; $4127: $00
           !byte $00            ; $4128: $00
           !byte $00            ; $4129: $00
           !byte $00            ; $412a: $00
           !byte $00            ; $412b: $00
           !byte $00            ; $412c: $00
           !byte $00            ; $412d: $00
           !byte $00            ; $412e: $00
           !byte $00            ; $412f: $00
           !byte $00            ; $4130: $00
           !byte $00            ; $4131: $00
           !byte $00            ; $4132: $00
           !byte $00            ; $4133: $00
           !byte $00            ; $4134: $00
           !byte $00            ; $4135: $00
           !byte $00            ; $4136: $00
           !byte $00            ; $4137: $00
           !byte $00            ; $4138: $00
           !byte $00            ; $4139: $00
           !byte $00            ; $413a: $00
           !byte $00            ; $413b: $00
           !byte $00            ; $413c: $00
           !byte $00            ; $413d: $00
           !byte $00            ; $413e: $00
           !byte $00            ; $413f: $00
           !byte $ff            ; $4140: $ff
           !byte $ff            ; $4141: $ff
           !byte $ff            ; $4142: $ff
           !byte $ff            ; $4143: $ff
           !byte $ff            ; $4144: $ff
           !byte $ff            ; $4145: $ff
           !byte $ff            ; $4146: $ff
           !byte $ff            ; $4147: $ff
           !byte $ff            ; $4148: $ff
           !byte $ff            ; $4149: $ff
           !byte $ff            ; $414a: $ff
           !byte $ff            ; $414b: $ff
           !byte $ff            ; $414c: $ff
           !byte $ff            ; $414d: $ff
           !byte $ff            ; $414e: $ff
           !byte $ff            ; $414f: $ff
           !byte $ff            ; $4150: $ff
           !byte $ff            ; $4151: $ff
           !byte $ff            ; $4152: $ff
           !byte $ff            ; $4153: $ff
           !byte $ff            ; $4154: $ff
           !byte $ff            ; $4155: $ff
           !byte $ff            ; $4156: $ff
           !byte $ff            ; $4157: $ff
           !byte $ff            ; $4158: $ff
           !byte $ff            ; $4159: $ff
           !byte $ff            ; $415a: $ff
           !byte $ff            ; $415b: $ff
           !byte $ff            ; $415c: $ff
           !byte $ff            ; $415d: $ff
           !byte $ff            ; $415e: $ff
           !byte $ff            ; $415f: $ff
           !byte $ff            ; $4160: $ff
           !byte $ff            ; $4161: $ff
           !byte $ff            ; $4162: $ff
           !byte $ff            ; $4163: $ff
           !byte $ff            ; $4164: $ff
           !byte $ff            ; $4165: $ff
           !byte $ff            ; $4166: $ff
           !byte $ff            ; $4167: $ff
           !byte $ff            ; $4168: $ff
           !byte $ff            ; $4169: $ff
           !byte $ff            ; $416a: $ff
           !byte $ff            ; $416b: $ff
           !byte $ff            ; $416c: $ff
           !byte $ff            ; $416d: $ff
           !byte $ff            ; $416e: $ff
           !byte $ff            ; $416f: $ff
           !byte $ff            ; $4170: $ff
           !byte $ff            ; $4171: $ff
           !byte $ff            ; $4172: $ff
           !byte $ff            ; $4173: $ff
           !byte $ff            ; $4174: $ff
           !byte $ff            ; $4175: $ff
           !byte $ff            ; $4176: $ff
           !byte $ff            ; $4177: $ff
           !byte $ff            ; $4178: $ff
           !byte $ff            ; $4179: $ff
           !byte $ff            ; $417a: $ff
           !byte $ff            ; $417b: $ff
           !byte $ff            ; $417c: $ff
           !byte $ff            ; $417d: $ff
           !byte $ff            ; $417e: $ff
           !byte $ff            ; $417f: $ff
           !byte $00            ; $4180: $00
           !byte $00            ; $4181: $00
           !byte $00            ; $4182: $00
           !byte $00            ; $4183: $00
           !byte $00            ; $4184: $00
           !byte $00            ; $4185: $00
           !byte $00            ; $4186: $00
           !byte $00            ; $4187: $00
           !byte $00            ; $4188: $00
           !byte $00            ; $4189: $00
           !byte $00            ; $418a: $00
           !byte $00            ; $418b: $00
           !byte $00            ; $418c: $00
           !byte $00            ; $418d: $00
           !byte $00            ; $418e: $00
           !byte $00            ; $418f: $00
           !byte $00            ; $4190: $00
           !byte $00            ; $4191: $00
           !byte $00            ; $4192: $00
           !byte $00            ; $4193: $00
           !byte $00            ; $4194: $00
           !byte $00            ; $4195: $00
           !byte $00            ; $4196: $00
           !byte $00            ; $4197: $00
           !byte $00            ; $4198: $00
           !byte $00            ; $4199: $00
           !byte $00            ; $419a: $00
           !byte $00            ; $419b: $00
           !byte $00            ; $419c: $00
           !byte $00            ; $419d: $00
           !byte $00            ; $419e: $00
           !byte $00            ; $419f: $00
           !byte $00            ; $41a0: $00
           !byte $00            ; $41a1: $00
           !byte $00            ; $41a2: $00
           !byte $00            ; $41a3: $00
           !byte $00            ; $41a4: $00
           !byte $00            ; $41a5: $00
           !byte $00            ; $41a6: $00
           !byte $00            ; $41a7: $00
           !byte $00            ; $41a8: $00
           !byte $00            ; $41a9: $00
           !byte $00            ; $41aa: $00
           !byte $00            ; $41ab: $00
           !byte $00            ; $41ac: $00
           !byte $00            ; $41ad: $00
           !byte $00            ; $41ae: $00
           !byte $00            ; $41af: $00
           !byte $00            ; $41b0: $00
           !byte $00            ; $41b1: $00
           !byte $00            ; $41b2: $00
           !byte $00            ; $41b3: $00
           !byte $00            ; $41b4: $00
           !byte $00            ; $41b5: $00
           !byte $00            ; $41b6: $00
           !byte $00            ; $41b7: $00
           !byte $00            ; $41b8: $00
           !byte $00            ; $41b9: $00
           !byte $00            ; $41ba: $00
           !byte $00            ; $41bb: $00
           !byte $00            ; $41bc: $00
           !byte $00            ; $41bd: $00
           !byte $00            ; $41be: $00
           !byte $00            ; $41bf: $00
           !byte $ff            ; $41c0: $ff
           !byte $ff            ; $41c1: $ff
           !byte $ff            ; $41c2: $ff
           !byte $ff            ; $41c3: $ff
           !byte $ff            ; $41c4: $ff
           !byte $ff            ; $41c5: $ff
           !byte $ff            ; $41c6: $ff
           !byte $ff            ; $41c7: $ff
           !byte $ff            ; $41c8: $ff
           !byte $ff            ; $41c9: $ff
           !byte $ff            ; $41ca: $ff
           !byte $ff            ; $41cb: $ff
           !byte $ff            ; $41cc: $ff
           !byte $ff            ; $41cd: $ff
           !byte $ff            ; $41ce: $ff
           !byte $ff            ; $41cf: $ff
           !byte $ff            ; $41d0: $ff
           !byte $ff            ; $41d1: $ff
           !byte $ff            ; $41d2: $ff
           !byte $ff            ; $41d3: $ff
           !byte $ff            ; $41d4: $ff
           !byte $ff            ; $41d5: $ff
           !byte $ff            ; $41d6: $ff
           !byte $ff            ; $41d7: $ff
           !byte $ff            ; $41d8: $ff
           !byte $ff            ; $41d9: $ff
           !byte $ff            ; $41da: $ff
           !byte $ff            ; $41db: $ff
           !byte $ff            ; $41dc: $ff
           !byte $ff            ; $41dd: $ff
           !byte $ff            ; $41de: $ff
           !byte $ff            ; $41df: $ff
           !byte $ff            ; $41e0: $ff
           !byte $ff            ; $41e1: $ff
           !byte $ff            ; $41e2: $ff
           !byte $ff            ; $41e3: $ff
           !byte $ff            ; $41e4: $ff
           !byte $ff            ; $41e5: $ff
           !byte $ff            ; $41e6: $ff
           !byte $ff            ; $41e7: $ff
           !byte $ff            ; $41e8: $ff
           !byte $ff            ; $41e9: $ff
           !byte $ff            ; $41ea: $ff
           !byte $ff            ; $41eb: $ff
           !byte $ff            ; $41ec: $ff
           !byte $ff            ; $41ed: $ff
           !byte $ff            ; $41ee: $ff
           !byte $ff            ; $41ef: $ff
           !byte $ff            ; $41f0: $ff
           !byte $ff            ; $41f1: $ff
           !byte $ff            ; $41f2: $ff
           !byte $ff            ; $41f3: $ff
           !byte $ff            ; $41f4: $ff
           !byte $ff            ; $41f5: $ff
           !byte $ff            ; $41f6: $ff
           !byte $ff            ; $41f7: $ff
           !byte $ff            ; $41f8: $ff
           !byte $ff            ; $41f9: $ff
           !byte $ff            ; $41fa: $ff
           !byte $ff            ; $41fb: $ff
           !byte $ff            ; $41fc: $ff
           !byte $ff            ; $41fd: $ff
           !byte $ff            ; $41fe: $ff
           !byte $ff            ; $41ff: $ff

