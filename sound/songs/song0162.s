	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0162_1
song0162_1:	@ 0x08C81CF0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 38
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N12	, As4, v100
	.byte	W12
	.byte			Fn4, v092
	.byte	W12
	.byte	FINE

	.align 2
	.global song0162
song0162:	@ 0x08C81D04
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0162_1		@ track
