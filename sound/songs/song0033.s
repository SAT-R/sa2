	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0033_1
song0033_1:	@ 0x08C6F4E8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 126
	.byte	VOL	, v086
	.byte	W96
	.byte	W96
song0033_1_1:
	.byte		N06	, Gs3, v127
	.byte	W07
	.byte		N05	, An3
	.byte	W05
	.byte		N06	, As3
	.byte	W07
	.byte		N05	, Bn3
	.byte	W05
	.byte		N12	, Cn4
	.byte	W12
	.byte		N06	, Cs4
	.byte	W07
	.byte		N05	, Dn4
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			En4
	.byte	W06
	.byte		N06	, Fn4
	.byte	W06
	.byte		N05	, Fs4
	.byte	W05
	.byte		N06	, Gn4
	.byte	W07
	.byte		N05	, Gs4
	.byte	W05
	.byte			An4
	.byte	W06
	.byte			As4
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	PATT	
		.word	song0033_1_1
	.byte	GOTO	
		.word	song0033_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0033_2
song0033_2:	@ 0x08C6F56E
	.byte	KEYSH	, 0
	.byte	VOICE	, 0
	.byte	VOL	, v110
	.byte	BENDR	, 13
	.byte	LFOS	, 26
	.byte	MODT	, 0
	.byte	MOD	, 8
	.byte	W96
	.byte	W96
song0033_2_1:
	.byte	VOL	, v001
	.byte	BEND	, c_v-60
	.byte		TIE	, Cn4, v080
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v069
	.byte	W72
	.byte	BEND	, c_v-60
	.byte	W02
	.byte		c_v-56
	.byte	W01
	.byte		c_v-51
	.byte	W02
	.byte		c_v-46
	.byte	W01
	.byte		c_v-41
	.byte	W02
	.byte		c_v-36
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte	PEND
song0033_2_2:
	.byte	W01
	.byte	BEND	, c_v-26
	.byte	W01
	.byte		c_v-21
	.byte	W02
	.byte		c_v-16
	.byte	W01
	.byte		c_v-12
	.byte	W02
	.byte		c_v-7
	.byte	W01
	.byte		c_v-2
	.byte	W01
	.byte		c_v
	.byte	W68
	.byte		c_v
	.byte	W04
	.byte		c_v-1
	.byte	W04
	.byte		c_v-2
	.byte	W03
	.byte		c_v-3
	.byte	W04
	.byte		c_v-4
	.byte	W03
	.byte		c_v-5
	.byte	W01
	.byte	PEND
song0033_2_3:
	.byte	W03
	.byte	BEND	, c_v-6
	.byte	W72
	.byte	W02
	.byte		c_v-6
	.byte	W02
	.byte		c_v-9
	.byte	W01
	.byte		c_v-12
	.byte	W02
	.byte		c_v-15
	.byte	W01
	.byte		c_v-19
	.byte	W02
	.byte		c_v-22
	.byte	W01
	.byte		c_v-25
	.byte	W02
	.byte		c_v-29
	.byte	W01
	.byte		c_v-32
	.byte	W02
	.byte		c_v-35
	.byte	W01
	.byte		c_v-38
	.byte	W02
	.byte		c_v-42
	.byte	W01
	.byte		c_v-45
	.byte	W01
	.byte	PEND
song0033_2_4:
	.byte	W01
	.byte	BEND	, c_v-48
	.byte	W01
	.byte		c_v-52
	.byte	W02
	.byte		c_v-55
	.byte	W01
	.byte		c_v-58
	.byte	W02
	.byte		c_v-62
	.byte	W01
	.byte		c_v-64
	.byte	W88
	.byte	PEND
	.byte		EOT	, Cn4
	.byte	PATT	
		.word	song0033_2_1
	.byte	PATT	
		.word	song0033_2_2
	.byte	PATT	
		.word	song0033_2_3
	.byte	PATT	
		.word	song0033_2_4
	.byte		EOT	, Cn4
song0033_2_5:
	.byte	VOL	, v001
	.byte	BEND	, c_v-60
	.byte		TIE	, Ds4, v080
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v069
	.byte	W72
	.byte	BEND	, c_v-60
	.byte	W02
	.byte		c_v-56
	.byte	W01
	.byte		c_v-51
	.byte	W02
	.byte		c_v-46
	.byte	W01
	.byte		c_v-41
	.byte	W02
	.byte		c_v-36
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0033_2_2
	.byte	PATT	
		.word	song0033_2_3
	.byte	PATT	
		.word	song0033_2_4
	.byte		EOT	, Ds4
	.byte	PATT	
		.word	song0033_2_5
	.byte	PATT	
		.word	song0033_2_2
	.byte	PATT	
		.word	song0033_2_3
	.byte	PATT	
		.word	song0033_2_4
	.byte		EOT	, Ds4
	.byte	GOTO	
		.word	song0033_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0033_3
song0033_3:	@ 0x08C6F679
	.byte	KEYSH	, 0
	.byte	VOICE	, 49
	.byte	VOL	, v110
	.byte	BENDR	, 59
	.byte		N08	, Fs1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Fs2
	.byte	W12
	.byte			Fs1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Cs2
	.byte	W06
	.byte		N05	, Fs2
	.byte	W06
	.byte		N08	, Fs1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Fs2
	.byte	W12
	.byte			Fs1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Cs2
	.byte	W06
	.byte		N05	, Fs2
	.byte	W06
song0033_3_1:
	.byte		N08	, Gs1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Gs2
	.byte	W12
	.byte			Gs1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Ds2
	.byte	W06
	.byte		N05	, Gs2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_3_1
song0033_3_2:
	.byte		N08	, Gn1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Gn2
	.byte	W12
	.byte			Gn1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Dn2
	.byte	W06
	.byte		N05	, Gn2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_3_2
	.byte	PATT	
		.word	song0033_3_1
	.byte	PATT	
		.word	song0033_3_1
	.byte	PATT	
		.word	song0033_3_2
	.byte		N08	, Gn1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Gn2
	.byte	W12
	.byte			Gn1
	.byte	W18
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			An1
	.byte	W06
song0033_3_3:
	.byte		N08	, Bn1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, Bn2
	.byte	W12
	.byte			Bn1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Fs2
	.byte	W06
	.byte		N05	, Bn2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_3_3
song0033_3_4:
	.byte		N08	, As1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte			As1
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N07	, Fn2
	.byte	W06
	.byte		N05	, As2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_3_4
	.byte	PATT	
		.word	song0033_3_3
	.byte	PATT	
		.word	song0033_3_3
	.byte	PATT	
		.word	song0033_3_4
	.byte		N08	, As1, v127
	.byte	W18
	.byte		N17	
	.byte	W18
	.byte		N06	, As2
	.byte	W12
	.byte			As1
	.byte	W18
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte	GOTO	
		.word	song0033_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0033_4
song0033_4:	@ 0x08C6F754
	.byte	KEYSH	, 0
	.byte	VOICE	, 93
	.byte	VOL	, v086
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte		N24	, Fs2, v127
	.byte		N24	, Fs3, v116
	.byte	W96
	.byte	W54
	.byte		N06	, Fs2
	.byte		N06	, Fs3
	.byte	W06
	.byte			Gn2
	.byte		N06	, Gn3
	.byte	W06
	.byte			Gs2
	.byte		N06	, Gs3
	.byte	W06
	.byte			An2
	.byte		N06	, An3
	.byte	W12
	.byte			As2
	.byte		N06	, As3
	.byte	W06
	.byte			Bn2
	.byte		N06	, Bn3
	.byte	W06
song0033_4_1:
	.byte		N12	, Cn3, v116
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte			Bn2, v127
	.byte	W24
	.byte			Cn3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte			Dn3
	.byte	W24
	.byte			Ds3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte			Dn3
	.byte	W24
	.byte			Ds3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte			Bn2
	.byte	W24
	.byte	GOTO	
		.word	song0033_4_1
	.byte		N12	, Cn3, v127
	.byte	W12
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0033_5
song0033_5:	@ 0x08C6F7AA
	.byte	KEYSH	, 0
	.byte	VOICE	, 84
	.byte	VOL	, v110
	.byte	MOD	, 0
	.byte	LFOS	, 58
	.byte	MODT	, 1
	.byte	W96
	.byte	W96
song0033_5_3:
	.byte	W96
song0033_5_1:
	.byte	W48
	.byte		N23	, Cn3, v127
	.byte	W24
	.byte			Cn4
	.byte	W24
	.byte	PEND
	.byte		N92	, Bn3
	.byte	W96
	.byte			Gn3
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0033_5_1
	.byte		N80	, Bn3, v127
	.byte	W84
	.byte		N05	
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte		N84	, Dn4
	.byte	W96
	.byte	W96
song0033_5_2:
	.byte	W48
	.byte		N23	, Ds3, v127
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte	PEND
	.byte		N92	, Dn4
	.byte	W96
	.byte		N90	, As3
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0033_5_2
	.byte		N80	, Dn4, v127
	.byte	W84
	.byte		N05	
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte		N80	, Fn4
	.byte	W96
	.byte	GOTO	
		.word	song0033_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0033_6
song0033_6:	@ 0x08C6F7FD
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte		N06	, Dn1, v044
	.byte	W12
	.byte		N12	, En1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N12	, En1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N12	, En1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N12	, En1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N12	, En1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W12
	.byte		N12	, En1
	.byte		N06	, En2, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Dn1, v044
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, En1, v044
	.byte		N06	, Ds2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v044
	.byte		N06	, Ds2, v127
	.byte	W06
	.byte		N03	, En2
	.byte	W03
	.byte		N03	
	.byte	W03
	.byte		N12	, En1, v044
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
song0033_6_2:
	.byte		N06	, Dn1, v044
	.byte		N12	, Ds2, v124
	.byte		N48	, Fs2
	.byte	W12
	.byte		N12	, En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte	PEND
song0033_6_1:
	.byte		N06	, Dn1, v044
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_2
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte	PATT	
		.word	song0033_6_1
	.byte		N06	, Dn1, v044
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N12	, Ds2, v124
	.byte	W12
	.byte			En1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte		N05	, Ds2, v124
	.byte	W06
	.byte		N06	, En2
	.byte	W06
	.byte		N12	, En1, v044
	.byte	W06
	.byte		N06	, Ds2, v124
	.byte	W06
	.byte			Dn1, v044
	.byte		N06	, En2, v124
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte		N12	, En1, v044
	.byte		N06	, En2, v124
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	GOTO	
		.word	song0033_6_2
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0033_7
song0033_7:	@ 0x08C6F91D
	.byte	KEYSH	, 0
	.byte	VOICE	, 68
	.byte	VOL	, v047
	.byte	W96
	.byte	W96
song0033_7_1:
	.byte		N05	, As2, v120
	.byte	W06
	.byte			As2, v068
	.byte	W06
	.byte			As2, v072
	.byte	W06
	.byte		N11	, As2, v120
	.byte	W12
	.byte		N05	, As2, v048
	.byte	W06
	.byte			As2, v108
	.byte	W06
	.byte			As2, v072
	.byte	W06
	.byte			As2, v068
	.byte	W06
	.byte		N11	, As2, v120
	.byte	W12
	.byte		N05	, As2, v068
	.byte	W06
	.byte			As2, v120
	.byte	W06
	.byte			As2, v068
	.byte	W06
	.byte			As2, v108
	.byte	W06
	.byte			As2, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_7_1
song0033_7_2:
	.byte		N05	, An2, v120
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte		N11	, An2, v120
	.byte	W12
	.byte		N05	, An2, v048
	.byte	W06
	.byte			An2, v108
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte		N11	, An2, v120
	.byte	W12
	.byte		N05	, An2, v068
	.byte	W06
	.byte			An2, v120
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v108
	.byte	W06
	.byte			An2, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_7_2
	.byte	PATT	
		.word	song0033_7_1
	.byte	PATT	
		.word	song0033_7_1
	.byte	PATT	
		.word	song0033_7_2
	.byte		N05	, An2, v120
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte		N11	, An2, v120
	.byte	W12
	.byte		N05	, An2, v048
	.byte	W06
	.byte			An2, v108
	.byte	W06
	.byte			An2, v072
	.byte	W06
	.byte			An2, v068
	.byte	W06
	.byte		N11	, An2, v120
	.byte	W12
	.byte		N05	, An2, v068
	.byte	W06
	.byte			An2, v120
	.byte	W06
	.byte			As2, v127
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cn3
	.byte	W06
song0033_7_3:
	.byte		N05	, Cs3, v120
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte		N11	, Cs3, v120
	.byte	W12
	.byte		N05	, Cs3, v048
	.byte	W06
	.byte			Cs3, v108
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte		N11	, Cs3, v120
	.byte	W12
	.byte		N05	, Cs3, v068
	.byte	W06
	.byte			Cs3, v120
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte			Cs3, v108
	.byte	W06
	.byte			Cs3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_7_3
song0033_7_4:
	.byte		N05	, Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v048
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v068
	.byte	W06
	.byte			Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_7_4
	.byte	PATT	
		.word	song0033_7_3
	.byte	PATT	
		.word	song0033_7_3
	.byte	PATT	
		.word	song0033_7_4
	.byte		N05	, Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v048
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v068
	.byte	W06
	.byte			Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Bn2, v127
	.byte	W06
	.byte			As2
	.byte	W06
	.byte	GOTO	
		.word	song0033_7_1
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0033_8
song0033_8:	@ 0x08C6FA78
	.byte	KEYSH	, 0
	.byte	VOICE	, 58
	.byte	VOL	, v077
	.byte	BENDR	, 12
	.byte	LFOS	, 38
	.byte	MODT	, 0
	.byte	MOD	, 0
	.byte	BEND	, c_v
	.byte	W96
	.byte	W96
song0033_8_1:
	.byte	W96
	.byte	W48
	.byte		N23	, Gs2, v088
	.byte	W24
	.byte			Gs3, v100
	.byte	W24
	.byte		N92	, Gn3, v124
	.byte	W96
	.byte			Dn3, v100
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N23	, Gs2, v084
	.byte	W24
	.byte			Gs3, v088
	.byte	W24
	.byte		N80	, Gn3, v127
	.byte	W84
	.byte		N05	, Gn3, v112
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte		N84	, Bn3, v124
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N23	, Bn2, v096
	.byte	W24
	.byte			Bn3, v100
	.byte	W24
	.byte		N92	, As3, v124
	.byte	W96
	.byte		N90	, Fn3, v108
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N23	, Bn2, v088
	.byte	W24
	.byte			Bn3
	.byte	W24
	.byte		N80	, As3, v124
	.byte	W84
	.byte		N05	, As3, v084
	.byte	W06
	.byte			Cn4, v092
	.byte	W06
	.byte		N80	, Dn4, v108
	.byte	W96
	.byte	GOTO	
		.word	song0033_8_1
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0033_9
song0033_9:	@ 0x08C6FAE0
	.byte	KEYSH	, 0
	.byte	VOICE	, 66
	.byte	VOL	, v056
	.byte	W96
	.byte	W96
song0033_9_1:
	.byte		N05	, Cs3, v120
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte		N11	, Cs3, v120
	.byte	W12
	.byte		N05	, Cs3, v048
	.byte	W06
	.byte			Cs3, v108
	.byte	W06
	.byte			Cs3, v072
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte		N11	, Cs3, v120
	.byte	W12
	.byte		N05	, Cs3, v068
	.byte	W06
	.byte			Cs3, v120
	.byte	W06
	.byte			Cs3, v068
	.byte	W06
	.byte			Cs3, v108
	.byte	W06
	.byte			Cs3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_9_1
song0033_9_2:
	.byte		N05	, Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v048
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v068
	.byte	W06
	.byte			Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_9_2
	.byte	PATT	
		.word	song0033_9_1
	.byte	PATT	
		.word	song0033_9_1
	.byte	PATT	
		.word	song0033_9_2
	.byte		N05	, Cn3, v120
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v048
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte			Cn3, v068
	.byte	W06
	.byte		N11	, Cn3, v120
	.byte	W12
	.byte		N05	, Cn3, v068
	.byte	W06
	.byte			Cn3, v120
	.byte	W06
	.byte			Cs3, v127
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
song0033_9_3:
	.byte		N05	, En3, v120
	.byte	W06
	.byte			En3, v068
	.byte	W06
	.byte			En3, v072
	.byte	W06
	.byte		N11	, En3, v120
	.byte	W12
	.byte		N05	, En3, v048
	.byte	W06
	.byte			En3, v108
	.byte	W06
	.byte			En3, v072
	.byte	W06
	.byte			En3, v068
	.byte	W06
	.byte		N11	, En3, v120
	.byte	W12
	.byte		N05	, En3, v068
	.byte	W06
	.byte			En3, v120
	.byte	W06
	.byte			En3, v068
	.byte	W06
	.byte			En3, v108
	.byte	W06
	.byte			En3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_9_3
song0033_9_4:
	.byte		N05	, Ds3, v120
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte			Ds3, v072
	.byte	W06
	.byte		N11	, Ds3, v120
	.byte	W12
	.byte		N05	, Ds3, v048
	.byte	W06
	.byte			Ds3, v108
	.byte	W06
	.byte			Ds3, v072
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte		N11	, Ds3, v120
	.byte	W12
	.byte		N05	, Ds3, v068
	.byte	W06
	.byte			Ds3, v120
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte			Ds3, v108
	.byte	W06
	.byte			Ds3, v048
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0033_9_4
	.byte	PATT	
		.word	song0033_9_3
	.byte	PATT	
		.word	song0033_9_3
	.byte	PATT	
		.word	song0033_9_4
	.byte		N05	, Ds3, v120
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte			Ds3, v072
	.byte	W06
	.byte		N11	, Ds3, v120
	.byte	W12
	.byte		N05	, Ds3, v048
	.byte	W06
	.byte			Ds3, v108
	.byte	W06
	.byte			Ds3, v072
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte		N11	, Ds3, v120
	.byte	W12
	.byte		N05	, Ds3, v068
	.byte	W06
	.byte			Ds3, v120
	.byte	W06
	.byte			Ds3, v068
	.byte	W06
	.byte			Dn3, v127
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte	GOTO	
		.word	song0033_9_1
	.byte	FINE

	.align 2
	.global song0033
song0033:	@ 0x08C6FC3C
	.byte	9		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup014		@ voicegroup/tone

	.word	song0033_1		@ track
	.word	song0033_2		@ track
	.word	song0033_3		@ track
	.word	song0033_4		@ track
	.word	song0033_5		@ track
	.word	song0033_6		@ track
	.word	song0033_7		@ track
	.word	song0033_8		@ track
	.word	song0033_9		@ track
