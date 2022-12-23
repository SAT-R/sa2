	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0027_1
song0027_1:	@ 0x0201F5B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N04	, Fs5, v116
	.byte	W04
	.byte			An5, v108
	.byte	W04
	.byte		N24	, Dn6
	.byte	W24
	.byte	FINE

	.align 2
	.global song0027
song0027:	@ 0x0201F5C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0027_1		@ track
