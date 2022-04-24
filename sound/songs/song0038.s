	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0038_1
song0038_1:	@ 0x08C75C4C
	.byte	KEYSH	, 0
song0038_1_4:
	.byte	TEMPO	, 70
	.byte	VOICE	, 127
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N44	, Cn2, v100
	.byte		N44	, Ds2
	.byte	W96
song0038_1_1:
	.byte		N11	, Cn2, v100
	.byte		N11	, Ds2
	.byte	W12
	.byte		N44	, Cn2
	.byte		N44	, Ds2
	.byte	W84
	.byte	PEND
	.byte			Cn2
	.byte		N44	, Ds2
	.byte	W96
	.byte	PATT	
		.word	song0038_1_1
	.byte		N44	, Cn2, v100
	.byte		N44	, Ds2
	.byte	W96
	.byte	PATT	
		.word	song0038_1_1
	.byte		N44	, Cn2, v100
	.byte		N44	, Ds2
	.byte	W96
	.byte	PATT	
		.word	song0038_1_1
	.byte		N44	, Cn2, v100
	.byte		N44	, Ds2
	.byte	W96
	.byte	PATT	
		.word	song0038_1_1
	.byte		N44	, Cn2, v100
	.byte		N44	, Ds2
	.byte	W96
	.byte	PATT	
		.word	song0038_1_1
song0038_1_2:
	.byte		N06	, Dn1, v052
	.byte		N06	, Ds2, v104
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Ds1, v092
	.byte		N06	, Ds2, v116
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte		N06	, Ds2, v108
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte		N06	, Ds2, v108
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PEND
song0038_1_3:
	.byte		N06	, Dn1, v052
	.byte		N06	, Ds2, v104
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte		N06	, Ds2, v100
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Ds1, v052
	.byte		N06	, Ds2, v108
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte		N06	, Ds2, v116
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Ds1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	PATT	
		.word	song0038_1_2
	.byte	PATT	
		.word	song0038_1_3
	.byte	GOTO	
		.word	song0038_1_4
	.byte	PATT	
		.word	song0038_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0038_2
song0038_2:	@ 0x08C75D6C
	.byte	KEYSH	, 0
song0038_2_6:
	.byte	VOICE	, 29
	.byte	VOL	, v081
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte		N72	, Cn1, v120
	.byte	W24
	.byte		N19	, Cn2, v104
	.byte		N18	, Gn2
	.byte	W24
	.byte			Cs2
	.byte		N18	, Gs2
	.byte	W24
	.byte		N21	, As1
	.byte		N22	, Fn2, v108
	.byte	W24
song0038_2_1:
	.byte		N10	, Cn1, v127
	.byte	W12
	.byte		N66	, Cn1, v120
	.byte	W12
	.byte		N18	, Cn2, v108
	.byte		N17	, Gn2, v116
	.byte	W24
	.byte			Cs2, v108
	.byte		N19	, Gs2
	.byte	W24
	.byte		N21	, Ds2, v100
	.byte		N22	, As2, v116
	.byte	W24
	.byte	PEND
	.byte		N72	, Cn1, v120
	.byte	W24
	.byte		N19	, Cn2, v104
	.byte		N18	, Gn2
	.byte	W24
	.byte			Cs2
	.byte		N18	, Gs2
	.byte	W24
	.byte		N21	, As1
	.byte		N22	, Fn2, v108
	.byte	W24
	.byte	PATT	
		.word	song0038_2_1
song0038_2_2:
	.byte	W24
	.byte		N19	, Dn2, v104
	.byte		N18	, An2
	.byte	W24
	.byte			Ds2
	.byte		N18	, As2
	.byte	W24
	.byte		N21	, Cn2
	.byte		N22	, Gn2, v108
	.byte	W24
	.byte	PEND
song0038_2_3:
	.byte	W24
	.byte		N18	, Dn2, v108
	.byte		N17	, An2, v116
	.byte	W24
	.byte			Ds2, v108
	.byte		N19	, As2
	.byte	W24
	.byte		N21	, Fn2, v100
	.byte		N22	, Cn3, v116
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song0038_2_2
	.byte	PATT	
		.word	song0038_2_3
song0038_2_4:
	.byte	W24
	.byte		N19	, En2, v104
	.byte		N18	, Bn2
	.byte	W24
	.byte			Fn2
	.byte		N18	, Cn3
	.byte	W24
	.byte		N21	, Dn2
	.byte		N22	, An2, v108
	.byte	W24
	.byte	PEND
song0038_2_5:
	.byte	W24
	.byte		N18	, En2, v108
	.byte		N17	, Bn2, v116
	.byte	W24
	.byte			Fn2, v108
	.byte		N19	, Cn3
	.byte	W24
	.byte		N21	, Gn2, v100
	.byte		N22	, Dn3, v116
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song0038_2_4
	.byte	PATT	
		.word	song0038_2_5
	.byte		N92	, Dn1, v127
	.byte		N92	, An1
	.byte	W96
	.byte			Cs1
	.byte		N92	, Gs1
	.byte	W96
	.byte			Cn1
	.byte		N92	, Gn1
	.byte	W96
	.byte			Bn0
	.byte		N92	, Fs1
	.byte	W96
	.byte			Dn1
	.byte		N92	, An1
	.byte	W96
	.byte			Cs1
	.byte		N92	, Gs1
	.byte	W96
	.byte			Cn1
	.byte		N92	, Gn1
	.byte	W96
	.byte			Bn0
	.byte		N92	, Fs1
	.byte	W96
	.byte			Dn1
	.byte		N92	, An1
	.byte	W96
	.byte			Cs1
	.byte		N92	, Gs1
	.byte	W96
	.byte			Cn1
	.byte		N92	, Gn1
	.byte	W96
	.byte			Bn0
	.byte		N92	, Fs1
	.byte	W96
	.byte			Dn1
	.byte		N92	, An1
	.byte	W96
	.byte			Cs1
	.byte		N92	, Gs1
	.byte	W96
	.byte			Cn1
	.byte		N92	, Gn1
	.byte	W96
	.byte			Bn0
	.byte		N92	, Fs1
	.byte	W96
	.byte	GOTO	
		.word	song0038_2_6
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0038_3
song0038_3:	@ 0x08C75E73
	.byte	KEYSH	, 0
song0038_3_8:
	.byte	VOICE	, 20
	.byte	VOL	, v086
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte		N64	, Cn2, v120
	.byte	W96
song0038_3_1:
	.byte		N08	, Cn2, v127
	.byte	W12
	.byte		N56	, Cn2, v120
	.byte	W84
	.byte	PEND
	.byte		N64	
	.byte	W96
	.byte	PATT	
		.word	song0038_3_1
	.byte		N64	, Dn2, v120
	.byte	W96
song0038_3_2:
	.byte		N08	, Dn2, v127
	.byte	W12
	.byte		N56	, Dn2, v120
	.byte	W84
	.byte	PEND
	.byte		N64	
	.byte	W96
	.byte	PATT	
		.word	song0038_3_2
	.byte		N64	, En2, v120
	.byte	W96
song0038_3_3:
	.byte		N08	, En2, v127
	.byte	W12
	.byte		N56	, En2, v120
	.byte	W84
	.byte	PEND
	.byte		N64	
	.byte	W96
	.byte	PATT	
		.word	song0038_3_3
song0038_3_4:
	.byte		N05	, Dn2, v100
	.byte	W06
	.byte			Dn3, v096
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn2, v100
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn2, v100
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Dn2, v100
	.byte	W06
	.byte			Dn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song0038_3_5:
	.byte		N05	, Cs2, v100
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cs2, v100
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cs2, v100
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cs2, v100
	.byte	W06
	.byte			Cs2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song0038_3_6:
	.byte		N05	, Cn2, v100
	.byte	W06
	.byte			Cn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cn2, v100
	.byte	W06
	.byte			Cn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cn2, v100
	.byte	W06
	.byte			Cn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Cn2, v100
	.byte	W06
	.byte			Cn2, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
song0038_3_7:
	.byte		N05	, Bn1, v100
	.byte	W06
	.byte			Bn1, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Bn1, v100
	.byte	W06
	.byte			Bn1, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Bn1, v100
	.byte	W06
	.byte			Bn1, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Bn1, v100
	.byte	W06
	.byte			Bn1, v096
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0038_3_4
	.byte	PATT	
		.word	song0038_3_5
	.byte	PATT	
		.word	song0038_3_6
	.byte	PATT	
		.word	song0038_3_7
	.byte	PATT	
		.word	song0038_3_4
	.byte	PATT	
		.word	song0038_3_5
	.byte	PATT	
		.word	song0038_3_6
	.byte	PATT	
		.word	song0038_3_7
	.byte	PATT	
		.word	song0038_3_4
	.byte	PATT	
		.word	song0038_3_5
	.byte	PATT	
		.word	song0038_3_6
	.byte	PATT	
		.word	song0038_3_7
	.byte	GOTO	
		.word	song0038_3_8
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0038_4
song0038_4:	@ 0x08C75FAB
	.byte	KEYSH	, 0
song0038_4_2:
	.byte	VOICE	, 26
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
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
song0038_4_1:
	.byte	W48
	.byte		N06	, An3, v120
	.byte	W06
	.byte			An4, v104
	.byte	W06
	.byte			An3, v080
	.byte	W06
	.byte			Dn4, v092
	.byte	W06
	.byte			An3, v104
	.byte	W06
	.byte			An3, v096
	.byte	W06
	.byte			An3, v100
	.byte	W12
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0038_4_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0038_4_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0038_4_1
	.byte	W96
	.byte	GOTO	
		.word	song0038_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0038_5
song0038_5:	@ 0x08C76002
	.byte	KEYSH	, 0
song0038_5_5:
	.byte	VOICE	, 19
	.byte	PRIO	, 30
	.byte	VOL	, v075
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
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
song0038_5_1:
	.byte		N24	, An3, v127
	.byte	W24
	.byte			En4, v116
	.byte	W24
	.byte			Dn4, v100
	.byte	W24
	.byte			An3, v104
	.byte	W24
	.byte	PEND
song0038_5_2:
	.byte		N24	, Gs3, v104
	.byte	W24
	.byte			Ds4, v116
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte			Gs3, v092
	.byte	W24
	.byte	PEND
song0038_5_3:
	.byte		N24	, Gn3, v096
	.byte	W24
	.byte			Dn4, v116
	.byte	W24
	.byte			Cn4, v100
	.byte	W24
	.byte			Gn3, v096
	.byte	W24
	.byte	PEND
song0038_5_4:
	.byte		N24	, Fs3, v096
	.byte	W24
	.byte			Cn4, v080
	.byte	W24
	.byte			Bn3, v116
	.byte	W24
	.byte			Fs3
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song0038_5_1
	.byte	PATT	
		.word	song0038_5_2
	.byte	PATT	
		.word	song0038_5_3
	.byte	PATT	
		.word	song0038_5_4
	.byte	GOTO	
		.word	song0038_5_5
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0038_6
song0038_6:	@ 0x08C7607C
	.byte	KEYSH	, 0
song0038_6_6:
	.byte	VOICE	, 28
	.byte	PRIO	, 30
	.byte	VOL	, v075
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N05	, Dn2, v116
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		TIE	, An3, v108
	.byte	W84
	.byte	W90
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte	W96
	.byte	W96
song0038_6_1:
	.byte		N05	, En2, v116
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		TIE	, Bn3, v108
	.byte	W84
	.byte	PEND
	.byte	W90
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte	PATT	
		.word	song0038_6_1
	.byte	W90
	.byte	W01
	.byte		EOT	, Bn3
	.byte	W05
song0038_6_2:
	.byte	W24
	.byte		N13	, An1, v127
	.byte	W19
	.byte		N03	
	.byte	W05
	.byte		N14	, Dn2
	.byte	W20
	.byte		N02	
	.byte	W04
	.byte		N12	, An2
	.byte	W20
	.byte		N01	
	.byte	W04
	.byte	PEND
song0038_6_3:
	.byte		N68	, Fn2, v127
	.byte	W68
	.byte	W03
	.byte		N03	, Gs2
	.byte	W06
	.byte		N04	, An2
	.byte	W06
	.byte		N15	, Bn2
	.byte	W13
	.byte	PEND
	.byte	W96
	.byte	W96
song0038_6_4:
	.byte	W24
	.byte		N13	, An2, v127
	.byte	W19
	.byte		N03	
	.byte	W05
	.byte		N14	, Dn3
	.byte	W20
	.byte		N02	
	.byte	W04
	.byte		N12	, An3
	.byte	W20
	.byte		N01	
	.byte	W04
	.byte	PEND
song0038_6_5:
	.byte		N68	, Fn3, v127
	.byte	W68
	.byte	W03
	.byte		N03	, Gs3
	.byte	W06
	.byte		N04	, An3
	.byte	W06
	.byte		N15	, Bn3
	.byte	W13
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0038_6_2
	.byte	PATT	
		.word	song0038_6_3
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0038_6_4
	.byte	PATT	
		.word	song0038_6_5
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0038_6_6
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0038_7
song0038_7:	@ 0x08C76121
	.byte	KEYSH	, 0
song0038_7_5:
	.byte	VOICE	, 23
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 17
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v088
	.byte	W68
	.byte	W03
	.byte	BEND	, c_v+5
	.byte	W02
	.byte		c_v+10
	.byte	W03
	.byte		c_v+18
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+31
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+41
	.byte	W01
	.byte		c_v+46
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+52
	.byte	W02
	.byte		c_v+57
	.byte	W01
	.byte		c_v+59
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W01
song0038_7_1:
	.byte	W72
	.byte	BEND	, c_v+63
	.byte	W03
	.byte		c_v+55
	.byte	W03
	.byte		c_v+47
	.byte	W03
	.byte		c_v+39
	.byte	W04
	.byte		c_v+26
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+14
	.byte	W02
	.byte		c_v+8
	.byte	W02
	.byte		c_v
	.byte	W01
	.byte	PEND
	.byte		EOT	, Cn3
	.byte	W01
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v088
	.byte	W68
	.byte	W03
	.byte	BEND	, c_v+5
	.byte	W02
	.byte		c_v+10
	.byte	W03
	.byte		c_v+18
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+31
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+41
	.byte	W01
	.byte		c_v+46
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+52
	.byte	W02
	.byte		c_v+57
	.byte	W01
	.byte		c_v+59
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W01
	.byte	PATT	
		.word	song0038_7_1
	.byte		EOT	, Cn3
	.byte	W01
song0038_7_2:
	.byte	BEND	, c_v
	.byte		TIE	, Dn3, v088
	.byte	W68
	.byte	W03
	.byte	BEND	, c_v+5
	.byte	W02
	.byte		c_v+10
	.byte	W03
	.byte		c_v+18
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+31
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+41
	.byte	W01
	.byte		c_v+46
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+52
	.byte	W02
	.byte		c_v+57
	.byte	W01
	.byte		c_v+59
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0038_7_1
	.byte		EOT	, Dn3
	.byte	W01
	.byte	PATT	
		.word	song0038_7_2
	.byte	PATT	
		.word	song0038_7_1
	.byte		EOT	, Dn3
	.byte	W01
song0038_7_3:
	.byte	BEND	, c_v
	.byte		TIE	, En3, v088
	.byte	W68
	.byte	W03
	.byte	BEND	, c_v+5
	.byte	W02
	.byte		c_v+10
	.byte	W03
	.byte		c_v+18
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+26
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+31
	.byte	W02
	.byte		c_v+36
	.byte	W02
	.byte		c_v+41
	.byte	W01
	.byte		c_v+46
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+52
	.byte	W02
	.byte		c_v+57
	.byte	W01
	.byte		c_v+59
	.byte	W02
	.byte		c_v+63
	.byte	W02
	.byte		c_v+63
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0038_7_1
	.byte		EOT	, En3
	.byte	W01
	.byte	PATT	
		.word	song0038_7_3
	.byte	PATT	
		.word	song0038_7_1
	.byte		EOT	, En3
	.byte	W01
song0038_7_4:
	.byte	MOD	, 4
	.byte		N92	, An3, v127
	.byte	W96
	.byte	PEND
	.byte			Gs3
	.byte	W96
	.byte			Gn3
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte			An3
	.byte	W96
	.byte			Gs3
	.byte	W96
	.byte			Gn3
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte	PATT	
		.word	song0038_7_4
	.byte		N92	, Gs3, v127
	.byte	W96
	.byte			Gn3
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte			An3
	.byte	W96
	.byte			Gs3
	.byte	W96
	.byte			Gn3
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte	GOTO	
		.word	song0038_7_5
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0038_8
song0038_8:	@ 0x08C76255
	.byte	KEYSH	, 0
song0038_8_4:
	.byte	VOICE	, 24
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 4
	.byte	MODT	, 0
	.byte		N72	, Cn2, v120
	.byte	W96
song0038_8_1:
	.byte		N10	, Cn2, v127
	.byte	W12
	.byte		N66	, Cn2, v120
	.byte	W84
	.byte	PEND
	.byte		N72	
	.byte	W96
	.byte	PATT	
		.word	song0038_8_1
	.byte		N72	, Dn2, v120
	.byte	W96
song0038_8_2:
	.byte		N10	, Dn2, v127
	.byte	W12
	.byte		N66	, Dn2, v120
	.byte	W84
	.byte	PEND
	.byte		N72	
	.byte	W96
	.byte	PATT	
		.word	song0038_8_2
	.byte		N72	, En2, v120
	.byte	W96
song0038_8_3:
	.byte		N10	, En2, v127
	.byte	W12
	.byte		N66	, En2, v120
	.byte	W84
	.byte	PEND
	.byte		N72	
	.byte	W96
	.byte	PATT	
		.word	song0038_8_3
	.byte		N92	, Dn3, v127
	.byte	W96
	.byte			Cs3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte			Bn2
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte			Cs3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte			Bn2
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte			Cs3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte			Bn2
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte			Cs3
	.byte	W96
	.byte			Cn3
	.byte	W96
	.byte			Bn2
	.byte	W96
	.byte	GOTO	
		.word	song0038_8_4
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0038_9
song0038_9:	@ 0x08C762CB
	.byte	KEYSH	, 0
song0038_9_4:
	.byte	VOICE	, 25
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte		N92	, Cn2, v127
	.byte	W96
song0038_9_1:
	.byte		N11	, Cn2, v127
	.byte	W12
	.byte		N80	
	.byte	W84
	.byte	PEND
	.byte		N92	
	.byte	W96
	.byte	PATT	
		.word	song0038_9_1
	.byte		N92	, Dn2, v127
	.byte	W96
song0038_9_2:
	.byte		N11	, Dn2, v127
	.byte	W12
	.byte		N80	
	.byte	W84
	.byte	PEND
	.byte		N92	
	.byte	W96
	.byte	PATT	
		.word	song0038_9_2
	.byte		N92	, En2, v127
	.byte	W96
song0038_9_3:
	.byte		N11	, En2, v127
	.byte	W12
	.byte		N80	
	.byte	W84
	.byte	PEND
	.byte		N92	
	.byte	W96
	.byte	PATT	
		.word	song0038_9_3
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
		.word	song0038_9_4
	.byte	FINE

	.align 2
	.global song0038
song0038:	@ 0x08C7632C
	.byte	9		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup013		@ voicegroup/tone

	.word	song0038_1		@ track
	.word	song0038_2		@ track
	.word	song0038_3		@ track
	.word	song0038_4		@ track
	.word	song0038_5		@ track
	.word	song0038_6		@ track
	.word	song0038_7		@ track
	.word	song0038_8		@ track
	.word	song0038_9		@ track
