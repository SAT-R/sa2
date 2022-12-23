	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0014_1
song0014_1:	@ 0x0201F1F0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		N08	, Gn5, v127
	.byte	W09
	.byte		N24	, Ds5
	.byte	W24
	.byte	FINE

	.align 2
	.global song0014
song0014:	@ 0x0201F204
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0014_1		@ track
