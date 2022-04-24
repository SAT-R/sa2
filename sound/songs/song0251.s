	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0251_1
song0251_1:	@ 0x08C832D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 51
	.byte	VOL	, v100
	.byte	LFOS	, 84
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte		N12	, Fn3, v127
	.byte	W12
	.byte	FINE

	.align 2
	.global song0251
song0251:	@ 0x08C832E8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0251_1		@ track
