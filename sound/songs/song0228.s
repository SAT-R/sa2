	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0228_1
song0228_1:	@ 0x08C82768
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 28
	.byte	VOL	, v100
	.byte	LFOS	, 51
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v092
	.byte	MOD	, 60
	.byte		TIE	, As5, v127
	.byte	W24
song0228_1_1:
	.byte	W72
	.byte	GOTO	
		.word	song0228_1_1
	.byte	W01
	.byte		EOT	, As5
	.byte	W01
	.byte	FINE

	.align 2
	.global song0228
song0228:	@ 0x08C8278C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0228_1		@ track
