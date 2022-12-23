	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0022_1
song0022_1:	@ 0x0201F408
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N03	, Dn5, v116
	.byte	W03
	.byte			Cn5, v096
	.byte	W03
	.byte			Gs4, v112
	.byte	W03
	.byte	FINE

	.align 2
	.global song0022
song0022:	@ 0x0201F420
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0022_1		@ track
