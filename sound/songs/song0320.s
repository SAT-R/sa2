	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0320_1
song0320_1:	@ 0x08C84D28
	.byte	KEYSH	, 0
	.byte	TEMPO	, 38
	.byte	VOICE	, 22
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N02	, Fn2, v127
	.byte	W03
	.byte		N02	
	.byte	W04
	.byte		N03	
	.byte	W05
	.byte		N36	, As2
	.byte	W36
	.byte	W01
	.byte	FINE

	.align 2
	.global song0320
song0320:	@ 0x08C84D48
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0320_1		@ track
