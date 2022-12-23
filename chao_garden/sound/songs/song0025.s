	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0025_1
song0025_1:	@ 0x0201F530
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N02	, Fn5, v127
	.byte	W02
	.byte			Bn4, v120
	.byte	W02
	.byte			Gs4, v116
	.byte	W02
	.byte			Dn5, v108
	.byte	W02
	.byte			Fn4, v100
	.byte	W02
	.byte			Dn4, v092
	.byte	W02
	.byte			Bn4, v088
	.byte	W02
	.byte			Fn4, v080
	.byte	W02
	.byte			Bn3, v072
	.byte	W02
	.byte			Gs4, v064
	.byte	W02
	.byte			Dn4, v060
	.byte	W02
	.byte			Gs3, v052
	.byte	W02
	.byte			Fn4, v044
	.byte	W02
	.byte			Fn3, v036
	.byte	W02
	.byte			Gs3, v032
	.byte	W02
	.byte			Dn3, v024
	.byte	W02
	.byte	FINE

	.align 2
	.global song0025
song0025:	@ 0x0201F570
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0025_1		@ track
