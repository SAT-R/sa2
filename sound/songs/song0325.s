	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0325_1
song0325_1:	@ 0x08C84E14
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 30
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N68	, As2, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0325
song0325:	@ 0x08C84E2C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0325_1		@ track
