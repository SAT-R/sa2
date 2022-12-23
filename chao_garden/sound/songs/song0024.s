	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0024_1
song0024_1:	@ 0x0201F4E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N02	, Cn4, v100
	.byte	W02
	.byte			Dn4, v096
	.byte	W02
	.byte			En4, v108
	.byte	W02
	.byte			Gn4, v116
	.byte	W02
	.byte			Cn5, v096
	.byte	W02
	.byte			En4, v104
	.byte	W02
	.byte			Gn4, v112
	.byte	W02
	.byte			An4, v100
	.byte	W02
	.byte			Cn5, v096
	.byte	W02
	.byte			En5, v088
	.byte	W02
	.byte			Gn5, v104
	.byte	W02
	.byte			Cn5
	.byte	W02
	.byte			En5, v096
	.byte	W02
	.byte			Gn5
	.byte	W02
	.byte		N16	, Cn6, v112
	.byte	W16
	.byte	FINE

	.align 2
	.global song0024
song0024:	@ 0x0201F524
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0024_1		@ track
