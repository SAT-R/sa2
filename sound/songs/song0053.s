	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0053_1
song0053_1:	@ 0x08C7E114
	.byte	KEYSH	, 0
	.byte	TEMPO	, 65
	.byte	VOICE	, 127
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N06	, Cn1, v127
	.byte		N18	, En1, v068
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte			Cn1
	.byte		N23	, En1, v068
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N05	, Gs1, v100
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte		N18	, En1, v068
	.byte	W18
	.byte		N03	, An1, v127
	.byte	W04
	.byte			Gs1
	.byte	W04
	.byte			Fs1
	.byte	W04
	.byte		N06	, Cn1
	.byte	W06
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0053_2
song0053_2:	@ 0x08C7E14B
	.byte	KEYSH	, 0
	.byte	VOICE	, 45
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	BEND	, c_v
	.byte		N17	, Ds2, v112
	.byte	W18
	.byte		N23	, Fn2, v120
	.byte	W24
	.byte		N52	, Gn2
	.byte	W17
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-11
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-33
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-45
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-63
	.byte	W28
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0053_3
song0053_3:	@ 0x08C7E176
	.byte	KEYSH	, 0
	.byte	VOICE	, 87
	.byte	VOL	, v082
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 33
	.byte	MODT	, 2
	.byte		N05	, Ds3, v096
	.byte		N05	, Gn3
	.byte	W06
	.byte			As2, v112
	.byte	W06
	.byte			Ds3, v084
	.byte		N05	, Gn3, v072
	.byte	W06
	.byte		N11	, Fn3, v108
	.byte		N11	, An3, v112
	.byte	W12
	.byte		N05	, Cn3, v100
	.byte	W06
	.byte			Fn3, v108
	.byte		N05	, An3, v104
	.byte	W06
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0053_4
song0053_4:	@ 0x08C7E1A9
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 4
	.byte	MODT	, 0
	.byte		N05	, Gn2, v112
	.byte	W06
	.byte			As2, v108
	.byte	W06
	.byte			Ds3, v116
	.byte	W06
	.byte		N11	, Cn3
	.byte	W12
	.byte		N05	, Fn3, v108
	.byte	W06
	.byte			An3, v120
	.byte	W06
	.byte		N28	, Dn3, v127
	.byte		N28	, Bn3
	.byte	W28
	.byte	W01
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0053_5
song0053_5:	@ 0x08C7E1D7
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 4
	.byte	MODT	, 0
	.byte	W42
	.byte		N28	, Dn3, v127
	.byte	W28
	.byte	W01
	.byte	FINE

	.align 2
	.global song0053
song0053:	@ 0x08C7E1F0
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song0053_1		@ track
	.word	song0053_2		@ track
	.word	song0053_3		@ track
	.word	song0053_4		@ track
	.word	song0053_5		@ track
