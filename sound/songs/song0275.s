	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0275_1
song0275_1:	@ 0x08C83E1C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 75
	.byte	VOL	, v100
	.byte	LFOS	, 90
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte		N01	, Ds3, v127
	.byte		N01	, Gn3
	.byte	W01
	.byte			Cn3, v124
	.byte	W01
	.byte			Gs2, v120
	.byte	W02
	.byte			Cs3, v112
	.byte		N01	, Fn3, v116
	.byte	W01
	.byte			As2, v108
	.byte	W01
	.byte			Fs2, v104
	.byte	W02
	.byte			Bn2, v100
	.byte		N01	, Ds3
	.byte	W01
	.byte			Gs2, v096
	.byte	W01
	.byte			En2, v092
	.byte	W02
	.byte			An2, v084
	.byte		N01	, Cs3, v088
	.byte	W01
	.byte			Fs2, v080
	.byte	W01
	.byte			Dn2, v076
	.byte	W02
	.byte			Gn2, v072
	.byte		N01	, Bn2
	.byte	W01
	.byte			En2, v068
	.byte	W01
	.byte			Cn2, v064
	.byte	W02
	.byte			Fn2, v056
	.byte		N01	, An2, v060
	.byte	W01
	.byte			Dn2, v052
	.byte	W01
	.byte			As1, v048
	.byte	W02
	.byte			Ds2, v044
	.byte		N01	, Gn2
	.byte	W01
	.byte			Cn2, v040
	.byte	W01
	.byte			Gs1, v036
	.byte	W02
	.byte			Cs2, v028
	.byte		N01	, Fn2, v032
	.byte	W01
	.byte			As1, v024
	.byte	W01
	.byte			Fs1, v020
	.byte	W02
	.byte			Bn1, v016
	.byte		N01	, Ds2
	.byte	W01
	.byte			Gs1, v012
	.byte	W01
	.byte			En1, v008
	.byte	W02
	.byte	FINE

	.align 2
	.global song0275
song0275:	@ 0x08C83E94
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0275_1		@ track
