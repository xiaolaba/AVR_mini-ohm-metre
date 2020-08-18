	.file	"lcd.c"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
 ;  GNU C (WinAVR 20100110) version 4.3.3 (avr)
 ; 	compiled by GNU C version 3.4.5 (mingw-vista special r3), GMP version 4.2.3, MPFR version 2.4.1.
 ;  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ;  options passed:  -imultilib avr5 -iprefix
 ;  c:\winavr-20100110\bin\../lib/gcc/avr/4.3.3/ lcd.c -mmcu=atmega16
 ;  -auxbase-strip lcd.s -gdwarf-2 -g0 -Os -Wall -fverbose-asm
 ;  options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
 ;  -fbranch-count-reg -fcaller-saves -fcommon -fcprop-registers
 ;  -fcrossjumping -fcse-follow-jumps -fdefer-pop -fearly-inlining
 ;  -feliminate-unused-debug-types -fexpensive-optimizations
 ;  -fforward-propagate -ffunction-cse -fgcse -fgcse-lm
 ;  -fguess-branch-probability -fident -fif-conversion -fif-conversion2
 ;  -finline-functions -finline-functions-called-once
 ;  -finline-small-functions -fipa-pure-const -fipa-reference -fivopts
 ;  -fkeep-static-consts -fleading-underscore -fmath-errno
 ;  -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
 ;  -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
 ;  -fpeephole -fpeephole2 -freg-struct-return -fregmove
 ;  -freorder-functions -frerun-cse-after-loop -fsched-interblock
 ;  -fsched-spec -fsched-stalled-insns-dep -fsigned-zeros
 ;  -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
 ;  -fstrict-overflow -fthread-jumps -ftoplevel-reorder -ftrapping-math
 ;  -ftree-ccp -ftree-copy-prop -ftree-copyrename -ftree-dce
 ;  -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
 ;  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 ;  -ftree-reassoc -ftree-salias -ftree-scev-cprop -ftree-sink -ftree-sra
 ;  -ftree-store-ccp -ftree-ter -ftree-vect-loop-version -ftree-vrp
 ;  -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss

 ;  Compiler executable checksum: 61d68a374065d489330774d2533cbbdf

	.text
.global	LCD_Write_Str
	.type	LCD_Write_Str, @function
LCD_Write_Str:
	push r16	 ; 
	push r17	 ; 
	push r28	 ; 
	push r29	 ; 
/* prologue: function */
/* frame size = 0 */
	movw r16,r24	 ;  str, str
	sts (frame)+1,__zero_reg__	 ;  frame,
	sts frame,__zero_reg__	 ;  frame,
	sts (frame+2)+1,__zero_reg__	 ;  frame,
	sts frame+2,__zero_reg__	 ;  frame,
	sts (frame+4)+1,__zero_reg__	 ;  frame,
	sts frame+4,__zero_reg__	 ;  frame,
	sts (frame+6)+1,__zero_reg__	 ;  frame,
	sts frame+6,__zero_reg__	 ;  frame,
	ldi r23,lo8(0)	 ;  Show_Char,
	ldi r20,lo8(0)	 ;  ivtmp.13,
	ldi r21,hi8(0)	 ;  ivtmp.13,
	ldi r28,lo8(1)	 ;  tmp163,
	ldi r29,hi8(1)	 ;  tmp163,
	ldi r26,lo8(2)	 ;  tmp164,
	ldi r27,hi8(2)	 ;  tmp164,
.L13:
	movw r30,r16	 ;  tmp84, str
	add r30,r20	 ;  tmp84, ivtmp.13
	adc r31,r21	 ;  tmp84, ivtmp.13
	ld r30,Z	 ;  D.1227,
	mov r24,r30	 ;  tmp85, D.1227
	subi r24,lo8(-(-48))	 ;  tmp85,
	cpi r24,lo8(10)	 ;  tmp85,
	brsh .L2	 ; ,
	ldi r31,lo8(0)	 ;  D.1227,
	subi r30,lo8(-(number-48))	 ;  D.1227,
	sbci r31,hi8(-(number-48))	 ;  D.1227,
	rjmp .L16	 ; 
.L2:
	mov r24,r30	 ;  tmp90, D.1227
	subi r24,lo8(-(-65))	 ;  tmp90,
	cpi r24,lo8(6)	 ;  tmp90,
	brsh .L4	 ; ,
	ldi r31,lo8(0)	 ;  D.1227,
	subi r30,lo8(-(number-55))	 ;  D.1227,
	sbci r31,hi8(-(number-55))	 ;  D.1227,
	rjmp .L16	 ; 
.L4:
	mov r24,r30	 ;  tmp95, D.1227
	subi r24,lo8(-(-97))	 ;  tmp95,
	cpi r24,lo8(6)	 ;  tmp95,
	brsh .L3	 ; ,
	ldi r31,lo8(0)	 ;  D.1227,
	subi r30,lo8(-(number-87))	 ;  D.1227,
	sbci r31,hi8(-(number-87))	 ;  D.1227,
.L16:
	ld r23,Z	 ;  Show_Char, number
.L3:
	mov r22,r23	 ;  D.1235, Show_Char
	sbrs r23,0	 ;  D.1235,
	rjmp .L5	 ; 
	movw r24,r20	 ;  tmp102, ivtmp.13
	lsl r24	 ;  tmp102
	rol r25	 ;  tmp102
	movw r18,r28	 ; , tmp163
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp102
	brpl 1b
	movw r24,r18	 ;  tmp103,
	lds r18,frame	 ;  frame, frame
	lds r19,(frame)+1	 ;  frame, frame
	or r24,r18	 ;  tmp103, frame
	or r25,r19	 ;  tmp103, frame
	sts (frame)+1,r25	 ;  frame, tmp103
	sts frame,r24	 ;  frame, tmp103
.L5:
	sbrs r22,4	 ;  D.1235,
	rjmp .L6	 ; 
	movw r24,r20	 ;  tmp110, ivtmp.13
	lsl r24	 ;  tmp110
	rol r25	 ;  tmp110
	movw r18,r26	 ; , tmp164
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp110
	brpl 1b
	movw r24,r18	 ;  tmp111,
	lds r18,frame	 ;  frame, frame
	lds r19,(frame)+1	 ;  frame, frame
	or r24,r18	 ;  tmp111, frame
	or r25,r19	 ;  tmp111, frame
	sts (frame)+1,r25	 ;  frame, tmp111
	sts frame,r24	 ;  frame, tmp111
.L6:
	sbrs r22,1	 ;  D.1235,
	rjmp .L7	 ; 
	movw r24,r20	 ;  tmp118, ivtmp.13
	lsl r24	 ;  tmp118
	rol r25	 ;  tmp118
	movw r18,r28	 ; , tmp163
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp118
	brpl 1b
	movw r24,r18	 ;  tmp119,
	lds r18,frame+2	 ;  frame, frame
	lds r19,(frame+2)+1	 ;  frame, frame
	or r24,r18	 ;  tmp119, frame
	or r25,r19	 ;  tmp119, frame
	sts (frame+2)+1,r25	 ;  frame, tmp119
	sts frame+2,r24	 ;  frame, tmp119
.L7:
	sbrs r22,5	 ;  D.1235,
	rjmp .L8	 ; 
	movw r24,r20	 ;  tmp126, ivtmp.13
	lsl r24	 ;  tmp126
	rol r25	 ;  tmp126
	movw r18,r26	 ; , tmp164
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp126
	brpl 1b
	movw r24,r18	 ;  tmp127,
	lds r18,frame+2	 ;  frame, frame
	lds r19,(frame+2)+1	 ;  frame, frame
	or r24,r18	 ;  tmp127, frame
	or r25,r19	 ;  tmp127, frame
	sts (frame+2)+1,r25	 ;  frame, tmp127
	sts frame+2,r24	 ;  frame, tmp127
.L8:
	sbrs r22,2	 ;  D.1235,
	rjmp .L9	 ; 
	movw r24,r20	 ;  tmp134, ivtmp.13
	lsl r24	 ;  tmp134
	rol r25	 ;  tmp134
	movw r18,r28	 ; , tmp163
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp134
	brpl 1b
	movw r24,r18	 ;  tmp135,
	lds r18,frame+4	 ;  frame, frame
	lds r19,(frame+4)+1	 ;  frame, frame
	or r24,r18	 ;  tmp135, frame
	or r25,r19	 ;  tmp135, frame
	sts (frame+4)+1,r25	 ;  frame, tmp135
	sts frame+4,r24	 ;  frame, tmp135
.L9:
	sbrs r22,6	 ;  D.1235,
	rjmp .L10	 ; 
	movw r24,r20	 ;  tmp142, ivtmp.13
	lsl r24	 ;  tmp142
	rol r25	 ;  tmp142
	movw r18,r26	 ; , tmp164
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp142
	brpl 1b
	movw r24,r18	 ;  tmp143,
	lds r18,frame+4	 ;  frame, frame
	lds r19,(frame+4)+1	 ;  frame, frame
	or r24,r18	 ;  tmp143, frame
	or r25,r19	 ;  tmp143, frame
	sts (frame+4)+1,r25	 ;  frame, tmp143
	sts frame+4,r24	 ;  frame, tmp143
.L10:
	sbrs r22,3	 ;  D.1235,
	rjmp .L11	 ; 
	movw r24,r20	 ;  tmp150, ivtmp.13
	lsl r24	 ;  tmp150
	rol r25	 ;  tmp150
	movw r18,r28	 ; , tmp163
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp150
	brpl 1b
	movw r24,r18	 ;  tmp151,
	lds r18,frame+6	 ;  frame, frame
	lds r19,(frame+6)+1	 ;  frame, frame
	or r24,r18	 ;  tmp151, frame
	or r25,r19	 ;  tmp151, frame
	sts (frame+6)+1,r25	 ;  frame, tmp151
	sts frame+6,r24	 ;  frame, tmp151
.L11:
	sbrs r23,7	 ;  Show_Char,
	rjmp .L12	 ; 
	movw r24,r20	 ;  tmp157, ivtmp.13
	lsl r24	 ;  tmp157
	rol r25	 ;  tmp157
	movw r18,r26	 ; , tmp164
	rjmp 2f
1:	lsl r18	 ; 
	rol r19	 ; 
2:	dec r24	 ;  tmp157
	brpl 1b
	movw r24,r18	 ;  tmp158,
	lds r18,frame+6	 ;  frame, frame
	lds r19,(frame+6)+1	 ;  frame, frame
	or r24,r18	 ;  tmp158, frame
	or r25,r19	 ;  tmp158, frame
	sts (frame+6)+1,r25	 ;  frame, tmp158
	sts frame+6,r24	 ;  frame, tmp158
.L12:
	subi r20,lo8(-(1))	 ;  ivtmp.13,
	sbci r21,hi8(-(1))	 ;  ivtmp.13,
	cpi r20,6	 ;  ivtmp.13,
	cpc r21,__zero_reg__	 ;  ivtmp.13
	breq .+2	 ; 
	rjmp .L13	 ; 
/* epilogue start */
	pop r29	 ; 
	pop r28	 ; 
	pop r17	 ; 
	pop r16	 ; 
	ret
	.size	LCD_Write_Str, .-LCD_Write_Str
.global	number
	.data
	.type	number, @object
	.size	number, 16
number:
	.byte	-21
	.byte	96
	.byte	-57
	.byte	-27
	.byte	108
	.byte	-83
	.byte	-81
	.byte	-32
	.byte	-17
	.byte	-19
	.byte	-18
	.byte	47
	.byte	-117
	.byte	103
	.byte	-113
	.byte	-114
	.comm frame,8,1
.global __do_copy_data
.global __do_clear_bss
