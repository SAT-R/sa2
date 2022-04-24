	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0295_1
song0295_1:	@ 0x08C8495C
	.byte	KEYSH	, 0
song0295_1_1:
	.byte	TEMPO	, 37
	.byte	VOICE	, 95
	.byte	MOD	, 95
	.byte	VOL	, v100
	.byte		N84	, Fn6, v127
	.byte	W72
	.byte	GOTO	
		.word	song0295_1_1
	.byte	W12
	.byte	FINE

	.align 2
	.global song0295
song0295:	@ 0x08C84974
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0295_1		@ track
