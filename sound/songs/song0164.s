	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0164_1
song0164_1:	@ 0x08C81D30
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 38
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N12	, Cn5, v100
	.byte	W12
	.byte			Gn4, v092
	.byte	W12
	.byte	FINE

	.align 2
	.global song0164
song0164:	@ 0x08C81D44
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0164_1		@ track
