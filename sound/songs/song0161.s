	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0161_1
song0161_1:	@ 0x08C81CD0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 38
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N12	, An4, v100
	.byte	W12
	.byte			En4, v092
	.byte	W12
	.byte	FINE

	.align 2
	.global song0161
song0161:	@ 0x08C81CE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0161_1		@ track
