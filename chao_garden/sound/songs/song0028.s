	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0028_1
song0028_1:	@ 0x0201F5D4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 1
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N04	, Gs2, v116
	.byte	W04
	.byte		N24	, Dn2, v108
	.byte	W24
	.byte	FINE

	.align 2
	.global song0028
song0028:	@ 0x0201F5EC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0028_1		@ track
