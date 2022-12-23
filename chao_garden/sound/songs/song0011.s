	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0011_1
song0011_1:	@ 0x0201F140
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 10
	.byte		N04	, Fn4, v127
	.byte	W04
	.byte			Cn4, v104
	.byte	W04
	.byte	FINE

	.align 2
	.global song0011
song0011:	@ 0x0201F154
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0011_1		@ track
