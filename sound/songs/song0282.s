	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0282_1
song0282_1:	@ 0x08C8425C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 82
	.byte	MOD	, 13
	.byte	VOL	, v090
	.byte	LFOS	, 84
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte		TIE	, An3, v127
	.byte	W96
song0282_1_1:
	.byte	W96
	.byte	GOTO	
		.word	song0282_1_1
	.byte	W06
	.byte		EOT	, An3
	.byte	FINE

	.align 2
	.global song0282
song0282:	@ 0x08C8427C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0282_1		@ track
