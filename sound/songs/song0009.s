	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0009_1
song0009_1:	@ 0x08C56194
	.byte	KEYSH	, 0
	.byte	TEMPO	, 55
	.byte	VOICE	, 67
	.byte	VOL	, v078
	.byte	W24
song0009_1_1:
	.byte		N06	, Cn2, v120
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	, As2
	.byte	W12
	.byte		N06	, An2
	.byte	W06
	.byte			Ds2
	.byte	W18
	.byte		N12	, As1
	.byte	W18
	.byte			Fn2
	.byte	W18
	.byte	PEND
song0009_1_2:
	.byte		N06	, Cn2, v120
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	, As2
	.byte	W12
	.byte		N06	, An2
	.byte	W06
	.byte			Ds2
	.byte	W18
	.byte		N12	, Gn2
	.byte	W18
	.byte			Cs2
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song0009_1_1
	.byte	PATT	
		.word	song0009_1_2
song0009_1_3:
	.byte		N06	, Cn2, v120
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	, As2
	.byte	W12
	.byte		N06	, An2
	.byte	W06
	.byte			Ds2
	.byte	W18
	.byte		N12	, As1
	.byte	W12
	.byte		N06	, Fn2
	.byte	W06
	.byte		N12	, Cn2
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song0009_1_2
	.byte	PATT	
		.word	song0009_1_1
	.byte	PATT	
		.word	song0009_1_2
	.byte	PATT	
		.word	song0009_1_3
	.byte	PATT	
		.word	song0009_1_2
	.byte		N06	, Fn2, v120
	.byte	W06
	.byte			Fn3
	.byte	W18
	.byte		N12	, Ds3
	.byte	W12
	.byte		N06	, Dn3
	.byte	W06
	.byte			Fn2
	.byte	W18
	.byte		N12	, As2
	.byte	W18
	.byte			Fn2
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte			Fn3
	.byte	W18
	.byte		N12	, Ds3
	.byte	W12
	.byte		N06	, Dn3
	.byte	W06
	.byte			An2
	.byte	W18
	.byte		N12	, As2
	.byte	W18
	.byte			Bn2
	.byte	W18
	.byte	PATT	
		.word	song0009_1_3
	.byte	PATT	
		.word	song0009_1_2
	.byte	PATT	
		.word	song0009_1_1
	.byte		N06	, Cn2, v120
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	, As2
	.byte	W12
	.byte		N06	, An2
	.byte	W06
	.byte			Ds2
	.byte	W18
	.byte		N12	, Cn3
	.byte	W18
	.byte			As2
	.byte	W18
song0009_1_4:
	.byte		N06	, Gs2, v120
	.byte	W06
	.byte		N06	
	.byte	W18
	.byte		N12	, Gs3
	.byte	W12
	.byte		N06	, Gn3
	.byte	W06
	.byte			Cs3
	.byte	W18
	.byte		N12	, Fs2
	.byte	W12
	.byte		N06	, Cs3
	.byte	W06
	.byte		N12	, Gs2
	.byte	W18
	.byte	PEND
	.byte		N06	, As2
	.byte	W06
	.byte			As3
	.byte	W18
	.byte		N12	, Gs3
	.byte	W12
	.byte		N06	, Gn3
	.byte	W06
	.byte			Cs3
	.byte	W18
	.byte		N12	, Fn3
	.byte	W18
	.byte			Bn2
	.byte	W18
	.byte	PATT	
		.word	song0009_1_4
	.byte		N06	, As2, v120
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N12	, Fn3
	.byte	W18
	.byte			As2
	.byte	W18
	.byte	PATT	
		.word	song0009_1_3
	.byte	PATT	
		.word	song0009_1_2
	.byte	PATT	
		.word	song0009_1_1
	.byte	PATT	
		.word	song0009_1_2
	.byte	PATT	
		.word	song0009_1_3
	.byte	PATT	
		.word	song0009_1_2
	.byte		N06	, Bn2, v120
	.byte	W06
	.byte			Cn3
	.byte	W12
	.byte		N12	
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N12	
	.byte	W18
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	
	.byte	W12
	.byte		N06	, Ds3
	.byte	W06
	.byte			Cn3
	.byte	W18
	.byte		N12	, Gn2
	.byte	W18
	.byte			Cs2
	.byte	W18
	.byte	PATT	
		.word	song0009_1_3
	.byte	PATT	
		.word	song0009_1_2
	.byte	GOTO	
		.word	song0009_1_3
	.byte	W96
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0009_2
song0009_2:	@ 0x08C562DB
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v094
	.byte	W24
song0009_2_1:
	.byte		N24	, Ds2, v120
	.byte	W24
	.byte		N18	, En2, v100
	.byte	W20
	.byte		N04	, Ds2
	.byte	W04
	.byte		N12	, Ds2, v120
	.byte	W12
	.byte		N06	, Ds2, v100
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N18	, En2
	.byte	W19
	.byte		N05	, Ds2
	.byte	W05
	.byte	PEND
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
song0009_2_2:
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte		N24	, Ds2, v120
	.byte	W24
	.byte		N18	, En2, v100
	.byte	W20
	.byte		N04	, Ds2
	.byte	W04
	.byte		N06	, Ds2, v120
	.byte	W06
	.byte			En2, v100
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte		N12	, Ds2, v120
	.byte	W12
	.byte			En2, v112
	.byte	W12
	.byte		N06	, En2, v116
	.byte	W06
	.byte			En2, v120
	.byte	W06
	.byte		N08	, En2, v127
	.byte	W08
	.byte		N04	, Ds2, v100
	.byte	W04
	.byte		N06	, An1, v120
	.byte	W06
	.byte		N12	, Gn1
	.byte	W12
	.byte		N06	, Ds2, v100
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte		N24	, Ds2, v120
	.byte	W24
	.byte		N18	, En2, v100
	.byte	W24
	.byte		N06	, Ds2, v120
	.byte	W06
	.byte			En2, v100
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N18	, Ds2
	.byte	W20
	.byte		N04	
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Gn1
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte		N06	, An1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N04	, Gs1
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte			Fs1
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte	PATT	
		.word	song0009_2_1
	.byte	PATT	
		.word	song0009_2_1
	.byte	GOTO	
		.word	song0009_2_2
	.byte	W96
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0009_3
song0009_3:	@ 0x08C5640A
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v094
	.byte		N05	, Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N24	, Fs2, v120
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
song0009_3_1:
	.byte		N05	, Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0009_3_1
	.byte		N05	, Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
song0009_3_2:
	.byte		N24	, Fs2, v112
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte	PATT	
		.word	song0009_3_1
	.byte	PATT	
		.word	song0009_3_1
	.byte	PATT	
		.word	song0009_3_1
	.byte	PATT	
		.word	song0009_3_1
	.byte	PATT	
		.word	song0009_3_1
	.byte	PATT	
		.word	song0009_3_1
	.byte		N05	, Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N24	, Fs2, v112
	.byte	W12
	.byte		N05	, Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			En1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v040
	.byte	W06
	.byte		N24	, Cn2, v092
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			En1, v040
	.byte	W54
	.byte		N24	, Cs2, v120
	.byte	W12
	.byte		N05	, Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v064
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v064
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v064
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v056
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v064
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v056
	.byte	W06
	.byte			Ds1, v044
	.byte	W06
	.byte			Ds1, v068
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			En1, v056
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v068
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			En1, v056
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v068
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v068
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			En1, v068
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			En1, v072
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			En1, v072
	.byte	W06
	.byte			En1, v052
	.byte	W06
	.byte			En1, v060
	.byte	W06
	.byte			En1, v052
	.byte	W06
	.byte			En1, v072
	.byte	W06
	.byte			En1, v052
	.byte	W06
	.byte			En1, v064
	.byte	W06
	.byte			En1, v072
	.byte	W54
	.byte		N24	, Cs2, v127
	.byte	W12
	.byte		N05	, Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N24	, Fs2, v100
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte	PATT	
		.word	song0009_3_1
	.byte		N24	, Fs2, v100
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N24	, Fn2, v100
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v040
	.byte	W06
	.byte		N24	, Fs2, v120
	.byte	W12
	.byte		N05	, Ds1, v052
	.byte	W06
	.byte			Ds1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v040
	.byte	W06
	.byte		N24	, Fn2, v120
	.byte	W48
	.byte			Cs2
	.byte	W06
	.byte		N05	, Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N18	, Fs2, v100
	.byte	W18
	.byte			Fn2
	.byte	W18
	.byte		N24	, Gn2, v112
	.byte	W12
	.byte		N05	, Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte	GOTO	
		.word	song0009_3_2
	.byte	W96
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0009_4
song0009_4:	@ 0x08C56827
	.byte	KEYSH	, 0
	.byte	VOICE	, 108
	.byte	VOL	, v100
	.byte	PRIO	, 10
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_4_1:
	.byte	W23
	.byte		N01	, Fn3, v096
	.byte	W01
	.byte		N03	, Fs3, v116
	.byte	W06
	.byte		N07	
	.byte	W12
	.byte		N11	, Fs3, v120
	.byte	W12
	.byte		N05	, Fn3, v096
	.byte	W06
	.byte		N09	, Ds3, v116
	.byte	W12
	.byte		N04	, Cn3, v096
	.byte	W06
	.byte		N11	, Ds3
	.byte	W12
	.byte		N05	, Cn3, v092
	.byte	W06
	.byte	PEND
	.byte		N08	, Fs3, v124
	.byte	W12
	.byte		N09	, Fn3, v112
	.byte	W12
	.byte		N05	, Cn3
	.byte	W06
	.byte			Ds3, v120
	.byte	W12
	.byte		N10	, Cn3, v116
	.byte	W17
	.byte		N02	, An3, v088
	.byte	W01
	.byte		N15	, As3
	.byte	W18
	.byte		N12	, Bn3, v092
	.byte	W18
	.byte		N08	, Cn4, v076
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0009_4_1
	.byte		N08	, Ds3, v124
	.byte	W12
	.byte		N09	, Cn3, v112
	.byte	W12
	.byte		N05	, Ds3
	.byte	W06
	.byte			Fn3, v120
	.byte	W12
	.byte		N10	, Fs3, v116
	.byte	W17
	.byte		N02	, Fn3, v092
	.byte	W01
	.byte		N11	, Fs3, v100
	.byte	W12
	.byte		N05	, Fn3, v084
	.byte	W06
	.byte		N11	, Ds3, v100
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0009_4_1
	.byte		N08	, Fs3, v124
	.byte	W11
	.byte		N09	, Fn3, v112
	.byte	W12
	.byte		N05	, Cn3
	.byte	W06
	.byte			Ds3, v120
	.byte	W12
	.byte		N10	, Cn3, v116
	.byte	W54
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_4_1
	.byte	W96
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0009_5
song0009_5:	@ 0x08C568D1
	.byte	KEYSH	, 0
	.byte	VOICE	, 107
	.byte	VOL	, v066
	.byte	W24
song0009_5_1:
	.byte		N06	, Cn4, v100
	.byte		N05	, Fs4
	.byte	W05
	.byte		N06	, Gn4
	.byte	W19
	.byte		N12	, An3
	.byte		N12	, Ds4
	.byte	W18
	.byte		N05	, An3
	.byte		N05	, Ds4
	.byte	W18
	.byte		N06	, Dn4
	.byte	W12
	.byte			Cs4
	.byte	W06
	.byte		N12	, Cn4
	.byte	W18
	.byte	PEND
song0009_5_2:
	.byte		N06	, Cn4, v100
	.byte		N06	, Fs4
	.byte	W06
	.byte			Gn4
	.byte	W18
	.byte		N12	, An3
	.byte		N12	, Ds4
	.byte	W18
	.byte		N05	, An3
	.byte		N05	, Ds4
	.byte	W18
	.byte		N06	, As3
	.byte	W16
	.byte		N03	
	.byte	W02
	.byte		N12	, Bn3
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
song0009_5_3:
	.byte		N06	, Cn4, v100
	.byte		N05	, Fs4
	.byte	W05
	.byte		N06	, Gn4
	.byte	W19
	.byte		N12	, An3
	.byte		N12	, Ds4
	.byte	W18
	.byte		N05	, An3
	.byte		N05	, Ds4
	.byte	W18
	.byte		N06	, Cn4
	.byte	W12
	.byte			Ds4
	.byte	W06
	.byte		N12	, Cn4
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_3
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_3
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_1
	.byte		N06	, Cn4, v100
	.byte		N06	, Fs4
	.byte	W06
	.byte			Gn4
	.byte	W18
	.byte		N12	, An3
	.byte		N12	, Ds4
	.byte	W18
	.byte		N05	, An3
	.byte		N05	, Ds4
	.byte	W18
	.byte		N06	, Cn4
	.byte	W16
	.byte		N03	, An3
	.byte	W02
	.byte		N12	, As3
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0009_5_1
	.byte		N06	, Cn4, v100
	.byte		N05	, Fs4
	.byte	W05
	.byte		N06	, Gn4
	.byte	W19
	.byte		N12	, An3
	.byte		N12	, Ds4
	.byte	W18
	.byte		N05	, An3
	.byte		N05	, Ds4
	.byte	W18
	.byte		N06	, As3
	.byte	W16
	.byte		N03	
	.byte	W02
	.byte		N12	, Bn3
	.byte	W18
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
	.byte	PATT	
		.word	song0009_5_1
	.byte	PATT	
		.word	song0009_5_2
	.byte	GOTO	
		.word	song0009_5_3
	.byte	W96
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0009_6
song0009_6:	@ 0x08C569CD
	.byte	KEYSH	, 0
	.byte	VOICE	, 2
	.byte	PAN	, c_v+50
	.byte	VOL	, v055
	.byte	MOD	, 5
	.byte	LFODL	, 0
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_6_1:
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		N01	, Bn4, v080
	.byte	W01
	.byte		N09	, Cn5
	.byte	W12
	.byte		N06	, As4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte		N04	, Fn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N10	, Cn4
	.byte	W11
	.byte		N01	, Bn3, v060
	.byte	W01
	.byte		N06	, Cn4, v080
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N04	, Fs4
	.byte	W06
	.byte		N06	, Fn4
	.byte	W06
	.byte		N04	, Ds4
	.byte	W06
	.byte		N06	, Cn4
	.byte	W06
	.byte		N04	, As3
	.byte	W05
	.byte		N01	, Bn3, v060
	.byte	W01
	.byte		N24	, Cn4, v072
	.byte	W96
	.byte	W96
	.byte	W88
	.byte	W01
	.byte		N01	, Fn4
	.byte	W01
	.byte		N09	, Fs4, v080
	.byte	W06
	.byte	W06
	.byte		N06	, Fn4
	.byte	W06
	.byte		N04	, Ds4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N09	, Bn3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Ds4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Gn4
	.byte	W11
	.byte		N01	, Bn4, v092
	.byte	W01
	.byte		N09	, Cn5, v080
	.byte	W06
	.byte	W06
	.byte		N06	, As4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte		N04	, Fn4
	.byte	W05
	.byte		N01	, Fs4, v072
	.byte	W01
	.byte		N04	, Gn4, v080
	.byte	W06
	.byte		N09	, As4
	.byte	W11
	.byte		N01	, Bn4, v072
	.byte	W01
	.byte		N04	, Cn5, v080
	.byte	W12
	.byte			Ds5
	.byte	W11
	.byte		N01	, En5, v072
	.byte	W01
	.byte		N04	, Fn5, v080
	.byte	W12
	.byte		N09	, Gn5
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N07	, Gs2, v120
	.byte	W12
	.byte		N11	, Gs2, v108
	.byte	W12
	.byte		N05	, Gn2, v104
	.byte	W06
	.byte		N12	, Gs2, v120
	.byte	W16
	.byte		N07	, As2
	.byte	W13
	.byte		N10	, Bn2, v108
	.byte	W13
	.byte		N07	, Cn3
	.byte	W11
	.byte		N05	, Dn3
	.byte	W01
	.byte	W11
	.byte		N04	, Dn3, v120
	.byte	W13
	.byte		N10	, Dn3, v112
	.byte	W11
	.byte		N05	, Cs3, v108
	.byte	W05
	.byte		N13	, Dn3, v092
	.byte	W13
	.byte		N05	, Cn3, v080
	.byte	W06
	.byte		N28	, As2, v116
	.byte	W36
	.byte	W01
	.byte	W11
	.byte		N04	, Gs2
	.byte	W05
	.byte		N07	, Gn2, v080
	.byte	W06
	.byte		N14	, Gs2, v108
	.byte	W14
	.byte		N05	, Gn2, v092
	.byte	W05
	.byte		N12	, Gs2, v108
	.byte	W16
	.byte		N11	, As2, v124
	.byte	W14
	.byte		N10	, Bn2, v104
	.byte	W12
	.byte		N09	, Cn3, v116
	.byte	W12
	.byte		N03	, Dn3, v108
	.byte	W01
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte		N03	
	.byte	W11
	.byte			Dn3, v108
	.byte	W12
	.byte		N07	, Dn3, v120
	.byte	W48
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		N01	, Fn3, v072
	.byte	W01
	.byte		N06	, Fs3, v080
	.byte	W06
	.byte		N04	, Gn3
	.byte	W06
	.byte		N12	, Cn4
	.byte	W23
	.byte		N01	, Dn4, v072
	.byte	W01
	.byte		N06	, Ds4, v080
	.byte	W06
	.byte		N04	, Cn4
	.byte	W06
	.byte		N06	, As3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N04	, Fs3
	.byte	W06
	.byte		N06	, Fn3
	.byte	W06
	.byte		N04	, Ds3
	.byte	W06
	.byte		N06	, Cn3
	.byte	W06
	.byte		N04	, Ds3
	.byte	W05
	.byte		N01	, Fn3, v072
	.byte	W01
	.byte		N09	, Fs3, v080
	.byte	W12
	.byte		N06	, Fn3
	.byte	W06
	.byte		N09	, Ds3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N04	, Cn3
	.byte	W05
	.byte		N01	, An2, v072
	.byte	W01
	.byte		N06	, As2, v080
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N04	, Gn2
	.byte	W05
	.byte		N01	, Dn3, v072
	.byte	W01
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte		N18	, Cn3
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_6_1
	.byte	W96
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0009_7
song0009_7:	@ 0x08C56B46
	.byte	KEYSH	, 0
	.byte	VOICE	, 10
	.byte	PAN	, c_v-50
	.byte	VOL	, v055
	.byte	MOD	, 0
	.byte	LFODL	, 0
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_7_1:
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		N01	, Bn4, v080
	.byte	W01
	.byte		N09	, Cn5
	.byte	W12
	.byte		N06	, As4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte		N04	, Fn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N10	, Cn4
	.byte	W11
	.byte		N01	, Bn3, v060
	.byte	W01
	.byte		N06	, Cn4, v080
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N04	, Fs4
	.byte	W06
	.byte		N06	, Fn4
	.byte	W06
	.byte		N04	, Ds4
	.byte	W06
	.byte		N06	, Cn4
	.byte	W06
	.byte		N04	, As3
	.byte	W05
	.byte		N01	, Bn3, v060
	.byte	W01
	.byte		N24	, Cn4, v072
	.byte	W96
	.byte	W96
	.byte	W88
	.byte	W01
	.byte		N01	, Fn4
	.byte	W01
	.byte		N09	, Fs4, v080
	.byte	W06
	.byte	W06
	.byte		N06	, Fn4
	.byte	W06
	.byte		N04	, Ds4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N09	, Bn3
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			Ds4
	.byte	W12
	.byte			Fn4
	.byte	W12
	.byte			Gn4
	.byte	W11
	.byte		N01	, Bn4, v092
	.byte	W01
	.byte		N09	, Cn5, v080
	.byte	W06
	.byte	W06
	.byte		N06	, As4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte		N04	, Fn4
	.byte	W05
	.byte		N01	, Fs4, v072
	.byte	W01
	.byte		N04	, Gn4, v080
	.byte	W06
	.byte		N09	, As4
	.byte	W11
	.byte		N01	, Bn4, v072
	.byte	W01
	.byte		N04	, Cn5, v080
	.byte	W12
	.byte			Ds5
	.byte	W11
	.byte		N01	, En5, v072
	.byte	W01
	.byte		N04	, Fn5, v080
	.byte	W12
	.byte		N09	, Gn5
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N07	, Gs2, v120
	.byte	W12
	.byte		N11	, Gs2, v108
	.byte	W12
	.byte		N05	, Gn2, v104
	.byte	W06
	.byte		N12	, Gs2, v120
	.byte	W16
	.byte		N07	, As2
	.byte	W13
	.byte		N10	, Bn2, v108
	.byte	W13
	.byte		N07	, Cn3
	.byte	W11
	.byte		N05	, Dn3
	.byte	W01
	.byte	W11
	.byte		N04	, Dn3, v120
	.byte	W13
	.byte		N10	, Dn3, v112
	.byte	W11
	.byte		N05	, Cs3, v108
	.byte	W05
	.byte		N13	, Dn3, v092
	.byte	W13
	.byte		N05	, Cn3, v080
	.byte	W06
	.byte		N28	, As2, v116
	.byte	W36
	.byte	W01
	.byte	W11
	.byte		N04	, Gs2
	.byte	W05
	.byte		N07	, Gn2, v080
	.byte	W06
	.byte		N14	, Gs2, v108
	.byte	W14
	.byte		N05	, Gn2, v092
	.byte	W05
	.byte		N12	, Gs2, v108
	.byte	W16
	.byte		N11	, As2, v124
	.byte	W14
	.byte		N10	, Bn2, v104
	.byte	W12
	.byte		N09	, Cn3, v116
	.byte	W12
	.byte		N03	, Dn3, v108
	.byte	W01
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte		N03	
	.byte	W11
	.byte			Dn3, v108
	.byte	W12
	.byte		N07	, Dn3, v120
	.byte	W48
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		N01	, Fn3, v072
	.byte	W01
	.byte		N06	, Fs3, v080
	.byte	W06
	.byte		N04	, Gn3
	.byte	W06
	.byte		N12	, Cn4
	.byte	W23
	.byte		N01	, Dn4, v072
	.byte	W01
	.byte		N06	, Ds4, v080
	.byte	W06
	.byte		N04	, Cn4
	.byte	W06
	.byte		N06	, As3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N04	, Fs3
	.byte	W06
	.byte		N06	, Fn3
	.byte	W06
	.byte		N04	, Ds3
	.byte	W06
	.byte		N06	, Cn3
	.byte	W06
	.byte		N04	, Ds3
	.byte	W05
	.byte		N01	, Fn3, v072
	.byte	W01
	.byte		N09	, Fs3, v080
	.byte	W12
	.byte		N06	, Fn3
	.byte	W06
	.byte		N09	, Ds3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte		N04	, Cn3
	.byte	W05
	.byte		N01	, An2, v072
	.byte	W01
	.byte		N06	, As2, v080
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N04	, Gn2
	.byte	W05
	.byte		N01	, Dn3, v072
	.byte	W01
	.byte		N06	, Ds3, v080
	.byte	W06
	.byte		N18	, Cn3
	.byte	W18
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_7_1
	.byte	W96
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0009_8
song0009_8:	@ 0x08C56CBF
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	PAN	, c_v+40
	.byte	VOL	, v070
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_8_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N07	, Gs2, v120
	.byte	W12
	.byte		N11	, Gs2, v108
	.byte	W12
	.byte		N05	, Gn2, v104
	.byte	W06
	.byte		N12	, Gs2, v120
	.byte	W16
	.byte		N07	, As2
	.byte	W13
	.byte		N10	, Bn2, v108
	.byte	W13
	.byte		N07	, Cn3
	.byte	W11
	.byte		N05	, Dn3
	.byte	W01
	.byte	W11
	.byte		N04	, Dn3, v120
	.byte	W13
	.byte		N10	, Dn3, v112
	.byte	W11
	.byte		N05	, Cs3, v108
	.byte	W05
	.byte		N13	, Dn3, v092
	.byte	W13
	.byte		N05	, Cn3, v080
	.byte	W06
	.byte		N28	, As2, v116
	.byte	W36
	.byte	W01
	.byte	W11
	.byte		N04	, Gs2
	.byte	W05
	.byte		N07	, Gn2, v080
	.byte	W06
	.byte		N14	, Gs2, v108
	.byte	W14
	.byte		N05	, Gn2, v092
	.byte	W05
	.byte		N12	, Gs2, v108
	.byte	W16
	.byte		N11	, As2, v124
	.byte	W14
	.byte		N10	, Bn2, v104
	.byte	W12
	.byte		N09	, Cn3, v116
	.byte	W12
	.byte		N03	, Dn3, v108
	.byte	W01
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte		N03	
	.byte	W11
	.byte			Dn3, v108
	.byte	W12
	.byte		N07	, Dn3, v120
	.byte	W48
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_8_1
	.byte	W96
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0009_9
song0009_9:	@ 0x08C56D53
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	PAN	, c_v-40
	.byte	VOL	, v078
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_9_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N07	, Gs3, v120
	.byte	W12
	.byte		N11	, Gs3, v108
	.byte	W12
	.byte		N05	, Gn3, v104
	.byte	W06
	.byte		N12	, Gs3, v120
	.byte	W16
	.byte		N07	, As3
	.byte	W13
	.byte		N10	, Bn3, v108
	.byte	W13
	.byte		N07	, Cn4
	.byte	W11
	.byte		N05	, Dn4
	.byte	W01
	.byte	W11
	.byte		N04	, Dn4, v120
	.byte	W13
	.byte		N10	, Dn4, v112
	.byte	W11
	.byte		N05	, Cs4, v108
	.byte	W05
	.byte		N13	, Dn4, v092
	.byte	W13
	.byte		N05	, Cn4, v080
	.byte	W06
	.byte		N28	, As3, v116
	.byte	W36
	.byte	W01
	.byte	W11
	.byte		N04	, Gs3
	.byte	W05
	.byte		N07	, Gn3, v080
	.byte	W06
	.byte		N14	, Gs3, v108
	.byte	W14
	.byte		N05	, Gn3, v092
	.byte	W05
	.byte		N12	, Gs3, v108
	.byte	W16
	.byte		N11	, As3, v124
	.byte	W14
	.byte		N10	, Bn3, v104
	.byte	W12
	.byte		N09	, Cn4, v116
	.byte	W12
	.byte		N03	, Dn4, v108
	.byte	W01
	.byte	W12
	.byte			Dn4, v112
	.byte	W12
	.byte		N03	
	.byte	W11
	.byte			Dn4, v108
	.byte	W12
	.byte		N07	, Dn4, v120
	.byte	W48
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_9_1
	.byte	W96
	.byte	FINE

	@********************** Track  10 **********************@

	.global song0009_10
song0009_10:	@ 0x08C56DE7
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	PAN	, c_v
	.byte	VOL	, v094
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0009_10_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W76
	.byte		N01	, Dn2, v076
	.byte		N03	, En2
	.byte	W03
	.byte			Fn2, v028
	.byte	W02
	.byte		N02	, Gn2, v052
	.byte	W02
	.byte		N03	, An2, v064
	.byte	W02
	.byte			Bn2, v068
	.byte	W03
	.byte			Cn3, v064
	.byte	W02
	.byte		N04	, Dn3, v076
	.byte	W03
	.byte		TIE	, Ds3, v120
	.byte		N01	, En3, v072
	.byte	W03
	.byte	W92
	.byte	W02
	.byte		EOT	, Ds3
	.byte	W01
	.byte		N88	, Fn3, v108
	.byte	W01
	.byte	W80
	.byte	W02
	.byte		N04	, Fn2, v072
	.byte	W02
	.byte			Gn2, v044
	.byte	W03
	.byte		N03	, An2
	.byte	W02
	.byte			Bn2, v048
	.byte	W02
	.byte			Cn3, v056
	.byte	W02
	.byte		N02	, Dn3, v044
	.byte		TIE	, Ds3, v100
	.byte	W03
	.byte		N01	, En3, v052
	.byte	W92
	.byte	W02
	.byte		EOT	, Ds3
	.byte	W01
	.byte		N54	, Fn3, v100
	.byte	W01
	.byte	W52
	.byte	W01
	.byte		N03	, En3, v048
	.byte	W02
	.byte			Dn3, v064
	.byte	W03
	.byte			Cn3, v044
	.byte	W02
	.byte		N02	, Bn2, v052
	.byte	W01
	.byte		N01	, An2, v064
	.byte	W32
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0009_10_1
	.byte	W96
	.byte	FINE

	.align 2
	.global song0009
song0009:	@ 0x08C56E78
	.byte	10		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup022		@ voicegroup/tone

	.word	song0009_1		@ track
	.word	song0009_2		@ track
	.word	song0009_3		@ track
	.word	song0009_4		@ track
	.word	song0009_5		@ track
	.word	song0009_6		@ track
	.word	song0009_7		@ track
	.word	song0009_8		@ track
	.word	song0009_9		@ track
	.word	song0009_10		@ track
