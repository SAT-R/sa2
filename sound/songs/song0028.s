	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0028_1
song0028_1:	@ 0x08C6C260
	.byte	KEYSH	, 0
	.byte	TEMPO	, 80
	.byte	VOICE	, 67
	.byte	VOL	, v088
	.byte	PAN	, c_v
	.byte	W03
song0028_1_1:
	.byte		N18	, Dn2, v120
	.byte	W18
	.byte		N06	, Cs2
	.byte	W18
	.byte		N18	, Cn2
	.byte	W18
	.byte		N06	, Bn1
	.byte	W18
	.byte			As1
	.byte	W12
	.byte		N09	, An1
	.byte	W12
	.byte	PEND
song0028_1_2:
	.byte		N18	, Dn2, v120
	.byte	W18
	.byte		N06	, Cs2
	.byte	W18
	.byte		N18	, Cn2
	.byte	W18
	.byte		N09	, Bn1
	.byte	W18
	.byte		N06	, As1
	.byte	W12
	.byte		N09	, An1
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0028_1_1
	.byte	PATT	
		.word	song0028_1_2
song0028_1_5:
	.byte	PATT	
		.word	song0028_1_1
	.byte	PATT	
		.word	song0028_1_2
	.byte	PATT	
		.word	song0028_1_1
	.byte	PATT	
		.word	song0028_1_2
song0028_1_3:
	.byte		N06	, Dn2, v127
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	PEND
song0028_1_4:
	.byte		N06	, Dn2, v127
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_3
	.byte	PATT	
		.word	song0028_1_4
	.byte	PATT	
		.word	song0028_1_1
	.byte	PATT	
		.word	song0028_1_2
	.byte	PATT	
		.word	song0028_1_1
	.byte	PATT	
		.word	song0028_1_2
	.byte	GOTO	
		.word	song0028_1_5
	.byte	W96
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0028_2
song0028_2:	@ 0x08C6C37F
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v092
	.byte	PAN	, c_v
	.byte	W03
song0028_2_1:
	.byte		N18	, Ds2, v120
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte	PEND
song0028_2_2:
	.byte		N18	, Ds2, v120
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W18
	.byte		N06	, Ds2, v112
	.byte	W06
	.byte		N12	, Ds2, v120
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0028_2_1
song0028_2_5:
	.byte		N18	, Ds2, v120
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W18
	.byte		N06	, Ds2, v112
	.byte	W06
	.byte			Bn2, v120
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte	PEND
song0028_2_6:
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
song0028_2_4:
	.byte		N18	, Ds2, v120
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	, Cs1
	.byte	W06
	.byte			Cs1, v112
	.byte	W06
	.byte			Cs1, v120
	.byte	W06
	.byte			Cs1, v100
	.byte	W06
	.byte			Cs1, v120
	.byte	W06
	.byte			Cs1, v112
	.byte	W06
	.byte			Cs1, v116
	.byte	W06
	.byte			Cs1, v120
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_2_1
song0028_2_3:
	.byte		N18	, Ds2, v120
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N18	
	.byte	W18
	.byte		N06	, Ds2, v112
	.byte	W06
	.byte			Cs1, v120
	.byte	W06
	.byte			Cs1, v112
	.byte	W06
	.byte			Cs1, v116
	.byte	W06
	.byte			Cs1, v120
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_3
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_3
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_3
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_4
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_2
	.byte	PATT	
		.word	song0028_2_1
	.byte	PATT	
		.word	song0028_2_5
	.byte	GOTO	
		.word	song0028_2_6
	.byte	W96
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0028_3
song0028_3:	@ 0x08C6C496
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v088
	.byte	W03
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
song0028_3_1:
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_1
song0028_3_7:
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			En1, v052
	.byte	W06
	.byte	PEND
song0028_3_2:
	.byte		N24	, Cs2, v127
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_1
	.byte	PATT	
		.word	song0028_3_1
song0028_3_3:
	.byte		N11	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_2
song0028_3_4:
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			En1, v080
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Ds1, v072
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			En1, v080
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Ds1, v072
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_3
	.byte	PATT	
		.word	song0028_3_4
	.byte		N36	, Fs2, v120
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v080
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v072
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v080
	.byte	W12
song0028_3_6:
	.byte		N24	, Cs2, v120
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_1
	.byte	PATT	
		.word	song0028_3_1
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Ds1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Ds1
	.byte	W06
	.byte		N24	, Fs2, v120
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
song0028_3_5:
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0028_3_5
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			En1, v060
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte			En1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte			En1
	.byte	W06
	.byte	PATT	
		.word	song0028_3_2
	.byte	PATT	
		.word	song0028_3_1
	.byte	PATT	
		.word	song0028_3_1
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N24	, Gn2, v127
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte	PATT	
		.word	song0028_3_1
	.byte		N24	, Cs2, v127
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v060
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte		N12	, En1, v072
	.byte	W12
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Ds1, v080
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Ds1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Ds1
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte	PATT	
		.word	song0028_3_6
	.byte	PATT	
		.word	song0028_3_1
	.byte	PATT	
		.word	song0028_3_1
	.byte	PATT	
		.word	song0028_3_7
	.byte	GOTO	
		.word	song0028_3_2
	.byte	W96
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0028_4
song0028_4:	@ 0x08C6C841
	.byte	KEYSH	, 0
	.byte	VOICE	, 86
	.byte	VOL	, v088
	.byte	MOD	, 50
	.byte	LFOS	, 40
	.byte	MODT	, 1
	.byte	PRIO	, 10
	.byte	PAN	, c_v-30
	.byte	W03
song0028_4_1:
	.byte		N18	, Dn3, v120
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N06	, Bn2
	.byte	W18
	.byte			As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	PEND
song0028_4_9:
	.byte		N18	, Dn3, v120
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W11
	.byte	PAN	, c_v+30
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0028_4_1
song0028_4_2:
	.byte		N18	, Dn3, v120
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	PEND
song0028_4_10:
	.byte	PATT	
		.word	song0028_4_1
	.byte	PATT	
		.word	song0028_4_2
	.byte	PATT	
		.word	song0028_4_1
	.byte	PATT	
		.word	song0028_4_2
song0028_4_4:
	.byte		TIE	, Dn4, v120
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
song0028_4_3:
	.byte	MOD	, 72
	.byte	W04
	.byte		73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W05
	.byte		84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte	PEND
	.byte		EOT	, Dn4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v120
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
song0028_4_5:
	.byte		TIE	, Ds4, v120
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0028_4_3
	.byte		EOT	, Ds4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v120
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PATT	
		.word	song0028_4_4
	.byte	PATT	
		.word	song0028_4_3
	.byte		EOT	, Dn4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v120
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PATT	
		.word	song0028_4_5
	.byte	PATT	
		.word	song0028_4_3
	.byte		EOT	, Ds4
	.byte	MOD	, 50
	.byte		N12	, Fn4, v120
	.byte	W12
	.byte			Gn4
	.byte	W12
song0028_4_6:
	.byte		N36	, An4, v120
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W03
	.byte		N06	, Gn4
	.byte	W01
	.byte	MOD	, 58
	.byte	W05
	.byte		59
	.byte		N06	, Fn4
	.byte	W04
	.byte	MOD	, 60
	.byte	W02
	.byte		TIE	, Dn4
	.byte	W02
	.byte	MOD	, 61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
song0028_4_7:
	.byte	MOD	, 72
	.byte	W04
	.byte		73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W05
	.byte		84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte	PEND
	.byte		EOT	, Dn4
song0028_4_8:
	.byte		N84	, Ds4, v120
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte		N06	, En4
	.byte	W04
	.byte	MOD	, 70
	.byte	W02
	.byte		N06	, Fn4
	.byte	W02
	.byte	MOD	, 71
	.byte	W04
	.byte	PEND
	.byte		72
	.byte		N48	, Gn4
	.byte	W04
	.byte	MOD	, 73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W02
	.byte		N48	, As4
	.byte	W03
	.byte	MOD	, 84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte	PATT	
		.word	song0028_4_6
	.byte	PATT	
		.word	song0028_4_7
	.byte		EOT	, Dn4
	.byte	PATT	
		.word	song0028_4_8
	.byte	MOD	, 72
	.byte		N48	, Gn4, v120
	.byte	W04
	.byte	MOD	, 73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W02
	.byte		N48	, Ds5
	.byte	W03
	.byte	MOD	, 84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte		TIE	, Dn5
	.byte	W06
	.byte	MOD	, 51
	.byte	W06
	.byte		52
	.byte	W07
	.byte		53
	.byte	W06
	.byte		54
	.byte	W07
	.byte		55
	.byte	W06
	.byte		56
	.byte	W06
	.byte		57
	.byte	W07
	.byte		58
	.byte	W06
	.byte		59
	.byte	W07
	.byte		60
	.byte	W06
	.byte		61
	.byte	W06
	.byte		62
	.byte	W07
	.byte		63
	.byte	W06
	.byte		64
	.byte	W07
	.byte		65
	.byte	W06
	.byte		66
	.byte	W06
	.byte		67
	.byte	W07
	.byte		68
	.byte	W06
	.byte		69
	.byte	W07
	.byte		70
	.byte	W06
	.byte		71
	.byte	W06
	.byte		72
	.byte	W07
	.byte		73
	.byte	W06
	.byte		74
	.byte	W07
	.byte		75
	.byte	W06
	.byte		76
	.byte	W06
	.byte		77
	.byte	W07
	.byte		78
	.byte	W06
	.byte		79
	.byte	W07
	.byte		EOT	
	.byte	MOD	, 80
	.byte		N96	, Ds5
	.byte	W06
	.byte	MOD	, 81
	.byte	W06
	.byte		82
	.byte	W07
	.byte		83
	.byte	W06
	.byte		84
	.byte	W07
	.byte		85
	.byte	W06
	.byte		86
	.byte	W06
	.byte		87
	.byte	W07
	.byte		88
	.byte	W06
	.byte		89
	.byte	W07
	.byte		90
	.byte	W06
	.byte		91
	.byte	W06
	.byte		92
	.byte	W07
	.byte		93
	.byte	W06
	.byte		94
	.byte	W07
	.byte		95
	.byte		N48	, As5
	.byte	W06
	.byte	MOD	, 96
	.byte	W06
	.byte		97
	.byte	W07
	.byte		98
	.byte	W06
	.byte		99
	.byte	W07
	.byte		100
	.byte	W06
	.byte		101
	.byte	W06
	.byte		102
	.byte	W04
	.byte		N48	, Gn5
	.byte	W03
	.byte	MOD	, 103
	.byte	W06
	.byte		104
	.byte	W07
	.byte		105
	.byte	W06
	.byte		106
	.byte	W06
	.byte		107
	.byte	W07
	.byte		108
	.byte	W06
	.byte		109
	.byte	W07
	.byte		TIE	, Dn5
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N84	, Ds5
	.byte	W84
	.byte		N04	, En5
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			Fs5
	.byte	W04
	.byte		N48	, Gn5
	.byte	W48
	.byte			Ds6
	.byte	W48
	.byte		N24	, Dn6
	.byte	W96
	.byte	PATT	
		.word	song0028_4_9
	.byte	PATT	
		.word	song0028_4_1
	.byte	PATT	
		.word	song0028_4_2
	.byte	GOTO	
		.word	song0028_4_10
	.byte	W96
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0028_5
song0028_5:	@ 0x08C6CB30
	.byte	KEYSH	, 0
	.byte	VOICE	, 85
	.byte	VOL	, v071
	.byte	MOD	, 50
	.byte	LFOS	, 40
	.byte	MODT	, 1
	.byte	PRIO	, 5
	.byte	PAN	, c_v-30
	.byte	W03
	.byte	W96
	.byte	W96
song0028_5_1:
	.byte		N18	, Dn3, v112
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N06	, Bn2
	.byte	W18
	.byte			As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	PEND
song0028_5_2:
	.byte		N18	, Dn3, v112
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	PEND
song0028_5_9:
	.byte	PATT	
		.word	song0028_5_1
	.byte	PATT	
		.word	song0028_5_2
	.byte	PATT	
		.word	song0028_5_1
	.byte	PATT	
		.word	song0028_5_2
song0028_5_4:
	.byte		TIE	, Dn4, v100
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
song0028_5_3:
	.byte	MOD	, 72
	.byte	W04
	.byte		73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W05
	.byte		84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte	PEND
	.byte		EOT	, Dn4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v100
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
song0028_5_5:
	.byte		TIE	, Ds4, v100
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0028_5_3
	.byte		EOT	, Ds4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v100
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PATT	
		.word	song0028_5_4
	.byte	PATT	
		.word	song0028_5_3
	.byte		EOT	, Dn4
	.byte	MOD	, 50
	.byte		N06	, Fn4, v100
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PATT	
		.word	song0028_5_5
	.byte	PATT	
		.word	song0028_5_3
	.byte		EOT	, Ds4
	.byte	MOD	, 50
	.byte		N12	, Fn4, v100
	.byte	W12
	.byte			Gn4
	.byte	W12
song0028_5_6:
	.byte		N36	, An4, v100
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W03
	.byte		N06	, Gn4
	.byte	W01
	.byte	MOD	, 58
	.byte	W05
	.byte		59
	.byte		N06	, Fn4
	.byte	W04
	.byte	MOD	, 60
	.byte	W02
	.byte		TIE	, Dn4
	.byte	W02
	.byte	MOD	, 61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte	W04
	.byte		70
	.byte	W04
	.byte		71
	.byte	W04
	.byte	PEND
song0028_5_7:
	.byte	MOD	, 72
	.byte	W04
	.byte		73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W05
	.byte		84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte	PEND
	.byte		EOT	, Dn4
song0028_5_8:
	.byte		N84	, Ds4, v100
	.byte	W08
	.byte	MOD	, 51
	.byte	W04
	.byte		52
	.byte	W04
	.byte		53
	.byte	W05
	.byte		54
	.byte	W04
	.byte		55
	.byte	W04
	.byte		56
	.byte	W04
	.byte		57
	.byte	W04
	.byte		58
	.byte	W05
	.byte		59
	.byte	W04
	.byte		60
	.byte	W04
	.byte		61
	.byte	W04
	.byte		62
	.byte	W04
	.byte		63
	.byte	W05
	.byte		64
	.byte	W04
	.byte		65
	.byte	W04
	.byte		66
	.byte	W04
	.byte		67
	.byte	W04
	.byte		68
	.byte	W05
	.byte		69
	.byte		N06	, En4
	.byte	W04
	.byte	MOD	, 70
	.byte	W02
	.byte		N06	, Fn4
	.byte	W02
	.byte	MOD	, 71
	.byte	W04
	.byte	PEND
	.byte		72
	.byte		N48	, Gn4
	.byte	W04
	.byte	MOD	, 73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W02
	.byte		N48	, As4
	.byte	W03
	.byte	MOD	, 84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte	PATT	
		.word	song0028_5_6
	.byte	PATT	
		.word	song0028_5_7
	.byte		EOT	, Dn4
	.byte	PATT	
		.word	song0028_5_8
	.byte	MOD	, 72
	.byte		N48	, Gn4, v100
	.byte	W04
	.byte	MOD	, 73
	.byte	W05
	.byte		74
	.byte	W04
	.byte		75
	.byte	W04
	.byte		76
	.byte	W04
	.byte		77
	.byte	W04
	.byte		78
	.byte	W05
	.byte		79
	.byte	W04
	.byte		80
	.byte	W04
	.byte		81
	.byte	W04
	.byte		82
	.byte	W04
	.byte		83
	.byte	W02
	.byte		N48	, Ds5
	.byte	W03
	.byte	MOD	, 84
	.byte	W04
	.byte		85
	.byte	W04
	.byte		86
	.byte	W04
	.byte		87
	.byte	W04
	.byte		88
	.byte	W05
	.byte		50
	.byte	W24
	.byte		TIE	, Dn5
	.byte	W06
	.byte	MOD	, 51
	.byte	W06
	.byte		52
	.byte	W07
	.byte		53
	.byte	W06
	.byte		54
	.byte	W07
	.byte		55
	.byte	W06
	.byte		56
	.byte	W06
	.byte		57
	.byte	W07
	.byte		58
	.byte	W06
	.byte		59
	.byte	W07
	.byte		60
	.byte	W06
	.byte		61
	.byte	W06
	.byte		62
	.byte	W07
	.byte		63
	.byte	W06
	.byte		64
	.byte	W07
	.byte		65
	.byte	W06
	.byte		66
	.byte	W06
	.byte		67
	.byte	W07
	.byte		68
	.byte	W06
	.byte		69
	.byte	W07
	.byte		70
	.byte	W06
	.byte		71
	.byte	W06
	.byte		72
	.byte	W07
	.byte		73
	.byte	W06
	.byte		74
	.byte	W07
	.byte		75
	.byte	W06
	.byte		76
	.byte	W06
	.byte		77
	.byte	W07
	.byte		78
	.byte	W06
	.byte		79
	.byte	W07
	.byte		EOT	
	.byte		TIE	, Ds5, v112
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	, Dn5, v100
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	, Ds5
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N24	, Dn5
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_5_1
	.byte	PATT	
		.word	song0028_5_2
	.byte	GOTO	
		.word	song0028_5_9
	.byte	W96
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0028_6
song0028_6:	@ 0x08C6CDB7
	.byte	KEYSH	, 0
	.byte	VOICE	, 0
	.byte	VOL	, v064
	.byte	MOD	, 2
	.byte	LFOS	, 20
	.byte	PAN	, c_v-30
	.byte	MODT	, 0
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_6_9:
	.byte	W12
	.byte		N03	, Dn5, v112
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
song0028_6_1:
	.byte		N03	, Fn4, v112
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn3
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn3
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn3
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn2
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn2
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn2
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte	PEND
	.byte	VOICE	, 2
	.byte	W12
	.byte		N03	, Dn5
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	PATT	
		.word	song0028_6_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N12	, Fn4, v120
	.byte	W12
	.byte			Gn4
	.byte	W12
song0028_6_2:
	.byte		N36	, An4, v120
	.byte	W36
	.byte		N06	, Gn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn5, v100
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte	PEND
song0028_6_3:
	.byte		N06	, An4, v100
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte	PEND
song0028_6_4:
	.byte		N84	, Ds4, v120
	.byte	W84
	.byte		N06	, En4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte	PEND
	.byte		N48	, Gn4
	.byte	W48
	.byte			As4
	.byte	W48
	.byte	PATT	
		.word	song0028_6_2
	.byte	PATT	
		.word	song0028_6_3
	.byte	PATT	
		.word	song0028_6_4
	.byte		N48	, Gn4, v120
	.byte	W48
	.byte			Ds5
	.byte	W48
song0028_6_5:
	.byte		N04	, Dn4, v100
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn6
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Dn3
	.byte	W04
	.byte			An2
	.byte	W04
	.byte	PEND
song0028_6_6:
	.byte		N04	, Dn2, v100
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Dn3
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Dn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Dn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn6
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Dn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte	PEND
song0028_6_7:
	.byte		N04	, Ds4, v100
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds6
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			As2
	.byte	W04
	.byte	PEND
song0028_6_8:
	.byte		N04	, Ds2, v100
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds6
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0028_6_5
	.byte	PATT	
		.word	song0028_6_6
	.byte	PATT	
		.word	song0028_6_7
	.byte	PATT	
		.word	song0028_6_8
	.byte		N03	, Dn6, v100
	.byte	W03
	.byte			An5
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			Dn2
	.byte	W72
	.byte	W96
	.byte	VOICE	, 0
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0028_6_9
	.byte	W96
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0028_7
song0028_7:	@ 0x08C6CFF9
	.byte	KEYSH	, 0
	.byte	VOICE	, 10
	.byte	VOL	, v073
	.byte	MOD	, 50
	.byte	LFOS	, 40
	.byte	PAN	, c_v+30
	.byte	MODT	, 1
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_7_10:
	.byte	W12
	.byte		N03	, An3, v100
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
song0028_7_1:
	.byte		N03	, Dn3, v100
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte	PEND
	.byte	VOICE	, 12
	.byte	W12
	.byte		N03	, An3
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte	PATT	
		.word	song0028_7_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N12	, Dn4, v100
	.byte	W12
	.byte			Ds4
	.byte	W12
song0028_7_2:
	.byte		N36	, Fn4, v100
	.byte	W36
	.byte		N06	, En4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte	PEND
song0028_7_3:
	.byte		N06	, Fn4, v100
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte	PEND
song0028_7_4:
	.byte		N84	, As3, v100
	.byte	W84
	.byte		N06	, Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte	PEND
song0028_7_5:
	.byte		N48	, Ds4, v100
	.byte	W48
	.byte		N48	
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song0028_7_2
	.byte	PATT	
		.word	song0028_7_3
	.byte	PATT	
		.word	song0028_7_4
	.byte	PATT	
		.word	song0028_7_5
song0028_7_6:
	.byte		N04	, An3, v100
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte	PEND
song0028_7_7:
	.byte		N04	, An1, v100
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			An2
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An5
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte	PEND
song0028_7_8:
	.byte		N04	, As3, v100
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Gn2
	.byte	W04
	.byte	PEND
song0028_7_9:
	.byte		N04	, As1, v100
	.byte	W04
	.byte			Gn2
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Gn2
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Gn5
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0028_7_6
	.byte	PATT	
		.word	song0028_7_7
	.byte	PATT	
		.word	song0028_7_8
	.byte	PATT	
		.word	song0028_7_9
	.byte		N03	, An5, v100
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			An1
	.byte	W72
	.byte	W96
	.byte	VOICE	, 10
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0028_7_10
	.byte	W96
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0028_8
song0028_8:	@ 0x08C6D23B
	.byte	KEYSH	, 0
	.byte	VOICE	, 72
	.byte	VOL	, v088
	.byte	PAN	, c_v
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_8_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W06
	.byte		N04	, An1, v124
	.byte	W03
	.byte		N03	, Bn1, v076
	.byte	W02
	.byte		N02	, Cn2, v080
	.byte	W02
	.byte			Dn2, v112
	.byte	W02
	.byte			En2, v116
	.byte	W02
	.byte			Fn2, v120
	.byte	W01
	.byte			Gn2
	.byte	W02
	.byte			An2
	.byte	W01
	.byte		N03	, Bn2, v112
	.byte	W03
	.byte		N11	, Cn3, v120
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W18
	.byte		N09	, Cn3, v120
	.byte	W18
	.byte			Cn3, v112
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W01
song0028_8_1:
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W12
	.byte			Cn3, v127
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W18
	.byte		N06	, Cn3, v112
	.byte	W12
	.byte		N09	
	.byte	W19
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W06
	.byte		N04	, An1, v124
	.byte	W05
	.byte		N02	, Cn2, v080
	.byte	W02
	.byte			Dn2, v112
	.byte	W02
	.byte			En2, v116
	.byte	W02
	.byte			Fn2, v120
	.byte	W01
	.byte			Gn2
	.byte	W02
	.byte			An2
	.byte	W04
	.byte		N11	, Cn3
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W18
	.byte		N09	, Cn3, v120
	.byte	W18
	.byte			Cn3, v112
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W01
	.byte	PATT	
		.word	song0028_8_1
	.byte	W96
	.byte	W96
song0028_8_2:
	.byte	W06
	.byte		N04	, An1, v124
	.byte	W05
	.byte		N02	, Cn2, v080
	.byte	W02
	.byte			Dn2, v112
	.byte	W02
	.byte			En2, v116
	.byte	W02
	.byte			Fn2, v120
	.byte	W01
	.byte			Gn2
	.byte	W02
	.byte			An2
	.byte	W01
	.byte		N03	, Bn2, v112
	.byte	W03
	.byte		N11	, Cn3, v120
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W18
	.byte		N09	, Cn3, v120
	.byte	W18
	.byte			Cn3, v112
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0028_8_1
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_8_2
	.byte	PATT	
		.word	song0028_8_1
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
		.word	song0028_8_3
	.byte	W96
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0028_9
song0028_9:	@ 0x08C6D315
	.byte	KEYSH	, 0
	.byte	VOICE	, 73
	.byte	VOL	, v088
	.byte	PAN	, c_v
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_9_3:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_9_1:
	.byte	W06
	.byte		N04	, An1, v124
	.byte	W03
	.byte		N03	, Bn1, v076
	.byte	W02
	.byte		N02	, Cn2, v080
	.byte	W02
	.byte			Dn2, v112
	.byte	W02
	.byte			En2, v116
	.byte	W02
	.byte			Fn2, v120
	.byte	W01
	.byte			Gn2
	.byte	W02
	.byte			An2
	.byte	W01
	.byte		N03	, Bn2, v112
	.byte	W03
	.byte		N11	, Cn3, v120
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W18
	.byte		N09	, Cn3, v120
	.byte	W18
	.byte			Cn3, v112
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W01
	.byte	PEND
song0028_9_2:
	.byte	W17
	.byte		N06	, Cn3, v112
	.byte	W12
	.byte			Cn3, v127
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W18
	.byte		N06	, Cn3, v112
	.byte	W12
	.byte		N09	
	.byte	W19
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_9_1
	.byte	PATT	
		.word	song0028_9_2
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_9_1
	.byte	PATT	
		.word	song0028_9_2
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_9_1
	.byte	PATT	
		.word	song0028_9_2
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
		.word	song0028_9_3
	.byte	W96
	.byte	FINE

	@********************** Track  10 **********************@

	.global song0028_10
song0028_10:	@ 0x08C6D3A4
	.byte	KEYSH	, 0
	.byte	VOICE	, 106
	.byte	VOL	, v088
	.byte	BENDR	, 12
	.byte	PAN	, c_v
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_10_1:
	.byte		N18	, Dn3, v120
	.byte	W18
	.byte		N06	, Cs3, v112
	.byte	W18
	.byte		N12	, Cn3, v120
	.byte	W60
	.byte	PEND
	.byte	PATT	
		.word	song0028_10_1
	.byte	PATT	
		.word	song0028_10_1
	.byte	PATT	
		.word	song0028_10_1
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
song0028_10_2:
	.byte		N24	, Dn3, v120
	.byte	W24
	.byte		N12	
	.byte	W12
	.byte		N03	, Dn3, v100
	.byte	W06
	.byte		N12	, Dn3, v120
	.byte	W12
	.byte		N04	
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte		N06	, Dn3, v120
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte	PEND
song0028_10_3:
	.byte		N06	, Dn3, v120
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte		N06	, Dn3, v120
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte		N12	, Dn3, v120
	.byte	W12
	.byte		N03	, Dn3, v100
	.byte	W06
	.byte		N12	, Dn3, v120
	.byte	W12
	.byte		N03	, Dn3, v100
	.byte	W06
	.byte		N12	, Dn3, v120
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte		N06	, Dn3, v120
	.byte	W06
	.byte		N04	, Dn3, v100
	.byte	W06
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0028_10_2
	.byte	PATT	
		.word	song0028_10_3
	.byte	W96
	.byte	BEND	, c_v+63
	.byte	W96
	.byte		N24	, Dn3, v120
	.byte	W02
	.byte	BEND	, c_v+62
	.byte	W02
	.byte		c_v+57
	.byte	W02
	.byte		c_v+49
	.byte	W02
	.byte		c_v+37
	.byte	W02
	.byte		c_v+23
	.byte	W02
	.byte		c_v+5
	.byte	W02
	.byte		c_v-16
	.byte	W02
	.byte		c_v-41
	.byte	W02
	.byte		c_v-64
	.byte	W54
	.byte		c_v
	.byte	W24
	.byte		N18	, Dn3, v088
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	W96
	.byte		N18	, Dn3
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2, v072
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte	GOTO	
		.word	song0028_10_1
	.byte	W96
	.byte	FINE

	@********************** Track  11 **********************@

	.global song0028_11
song0028_11:	@ 0x08C6D48A
	.byte	KEYSH	, 0
	.byte	VOICE	, 118
	.byte	VOL	, v084
	.byte	PAN	, c_v
	.byte	PRIO	, 20
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0028_11_1:
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N96	, Ds3, v080
	.byte	W96
	.byte		N48	, As3
	.byte	W48
	.byte			Gn3
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N18	, Dn3, v088
	.byte	W18
	.byte		N06	, Cs3
	.byte	W18
	.byte		N18	, Cn3
	.byte	W18
	.byte		N09	, Bn2
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte		N09	, An2
	.byte	W12
	.byte		N18	
	.byte	W18
	.byte		N06	, As2
	.byte	W18
	.byte		N18	, Bn2
	.byte	W18
	.byte		N09	, Cn3
	.byte	W18
	.byte		N06	, Cs3
	.byte	W12
	.byte		N09	, Dn3
	.byte	W12
	.byte	GOTO	
		.word	song0028_11_1
	.byte	W96
	.byte	FINE

	.align 2
	.global song0028
song0028:	@ 0x08C6D4EC
	.byte	11		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup022		@ voicegroup/tone

	.word	song0028_1		@ track
	.word	song0028_2		@ track
	.word	song0028_3		@ track
	.word	song0028_4		@ track
	.word	song0028_5		@ track
	.word	song0028_6		@ track
	.word	song0028_7		@ track
	.word	song0028_8		@ track
	.word	song0028_9		@ track
	.word	song0028_10		@ track
	.word	song0028_11		@ track
