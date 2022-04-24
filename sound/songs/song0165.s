	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0165_1
song0165_1:	@ 0x08C81D50
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 38
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N12	, Cs5, v100
	.byte	W12
	.byte			Gs4, v092
	.byte	W12
	.byte	FINE

	.align 2
	.global song0165
song0165:	@ 0x08C81D64
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0165_1		@ track
