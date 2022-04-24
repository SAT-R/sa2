	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0057_1
song0057_1:	@ 0x08C7EA68
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 74
	.byte	MOD	, 1
	.byte	BENDR	, 0
	.byte	VOL	, v079
	.byte	PAN	, c_v
	.byte	W96
song0057_1_1:
	.byte	W06
	.byte		N06	, En2, v116
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Ds3
	.byte	W48
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Ds3
	.byte	W24
	.byte			Dn3
	.byte	W24
	.byte	GOTO	
		.word	song0057_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0057_2
song0057_2:	@ 0x08C7EA9B
	.byte	KEYSH	, 0
	.byte	VOICE	, 75
	.byte	MOD	, 0
	.byte	BENDR	, 0
	.byte	VOL	, v074
	.byte	PAN	, c_v
	.byte	W96
song0057_2_1:
	.byte	W06
	.byte		N06	, Cn2, v100
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Cn3
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gs2
	.byte	W48
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Cn3
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gs2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte	GOTO	
		.word	song0057_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0057_3
song0057_3:	@ 0x08C7EACC
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	MOD	, 1
	.byte	BENDR	, 0
	.byte	VOL	, v088
	.byte	PAN	, c_v
	.byte	W06
	.byte		N06	, Cn2, v116
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Gn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Ds2
	.byte	W30
song0057_3_1:
	.byte	W06
	.byte		N06	, Cn2, v116
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Gn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Ds2
	.byte	W30
	.byte	W06
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Gn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gs2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte	GOTO	
		.word	song0057_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0057_4
song0057_4:	@ 0x08C7EB0D
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	BENDR	, 0
	.byte	VOL	, v081
	.byte	PAN	, c_v
	.byte	W12
	.byte		N07	, Gn2, v116
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte			Ds2, v127
	.byte	W24
	.byte			Ds2, v120
	.byte	W12
song0057_4_1:
	.byte	W12
	.byte		N07	, Gn2, v116
	.byte	W24
	.byte		N07	
	.byte	W24
	.byte			Ds2, v127
	.byte	W24
	.byte			Ds2, v120
	.byte	W12
	.byte	W12
	.byte		N06	, Gn2
	.byte	W24
	.byte			Gn2, v108
	.byte	W12
	.byte		N23	, Ds3
	.byte	W24
	.byte		N06	, Dn3
	.byte	W24
	.byte	GOTO	
		.word	song0057_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0057_5
song0057_5:	@ 0x08C7EB44
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	BENDR	, 0
	.byte	VOL	, v092
	.byte	PAN	, c_v
	.byte		N05	, Cn1, v116
	.byte	W12
	.byte		N05	
	.byte		N03	, Dn1, v048
	.byte	W06
	.byte		N05	, Cn3, v116
	.byte	W06
	.byte		N28	, Gs2
	.byte	W06
	.byte		N05	, Cn3
	.byte	W06
	.byte		N03	, Dn1, v048
	.byte	W12
	.byte		N05	, Cn1, v116
	.byte	W12
	.byte		N03	, Dn1, v048
	.byte	W12
	.byte		N05	, Cs1, v116
	.byte	W12
	.byte		N03	, Dn1, v048
	.byte	W12
song0057_5_1:
	.byte		N05	, Cn1, v116
	.byte	W12
	.byte		N05	
	.byte		N03	, Dn1, v048
	.byte	W06
	.byte		N05	, Cn3, v116
	.byte	W06
	.byte		N28	, Gs2
	.byte	W06
	.byte		N05	, Cn3
	.byte	W06
	.byte		N03	, Dn1, v048
	.byte	W12
	.byte		N05	, Cn1, v116
	.byte	W12
	.byte		N03	, Dn1, v048
	.byte	W12
	.byte		N05	, Cs1, v116
	.byte	W12
	.byte		N03	, Dn1, v048
	.byte	W12
	.byte		N05	, Cn1, v116
	.byte	W12
	.byte		N05	
	.byte		N03	, Dn1, v048
	.byte	W06
	.byte		N05	, Cn3, v116
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N03	, Dn1, v048
	.byte		N28	, Gs2, v116
	.byte	W12
	.byte		N05	, Cn1
	.byte		N03	, Dn1, v048
	.byte	W24
	.byte		N05	, Cs1, v116
	.byte		N03	, Dn1, v048
	.byte	W24
	.byte	GOTO	
		.word	song0057_5_1
	.byte	FINE

	.align 2
	.global song0057
song0057:	@ 0x08C7EBC8
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song0057_1		@ track
	.word	song0057_2		@ track
	.word	song0057_3		@ track
	.word	song0057_4		@ track
	.word	song0057_5		@ track
