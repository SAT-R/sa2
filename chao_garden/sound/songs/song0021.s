	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0021_1
song0021_1:	@ 0x0201F3E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N04	, En5, v096
	.byte	W04
	.byte			Gs5, v112
	.byte	W04
	.byte	FINE

	.align 2
	.global song0021
song0021:	@ 0x0201F3FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0021_1		@ track
