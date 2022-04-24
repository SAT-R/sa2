	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0029_1
song0029_1:	@ 0x08C6D520
	.byte	KEYSH	, 0
	.byte	TEMPO	, 125
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 127
	.byte		N11	, Cn1, v127
	.byte		N92	, Cs2
	.byte	W24
	.byte		N11	, An1
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			Fs1
	.byte	W12
song0029_1_3:
	.byte		N12	, Cn1, v127
	.byte		N23	, Ds1, v056
	.byte		N92	, Cs2, v127
	.byte	W24
	.byte		N12	, Cs1
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte		N12	, Cn1, v127
	.byte		N11	, Dn1, v056
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte	W12
	.byte			Cs1
	.byte		N11	, Dn1, v056
	.byte	W24
song0029_1_1:
	.byte		N12	, Cn1, v127
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte		N11	, Dn1, v056
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte	W12
	.byte		N11	, Dn1, v056
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte	W12
	.byte			Cs1
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte	PEND
song0029_1_2:
	.byte		N12	, Cn1, v127
	.byte		N23	, Ds1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte		N12	, Cn1, v127
	.byte		N11	, Dn1, v056
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte	W12
	.byte			Cs1
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte	PATT	
		.word	song0029_1_1
	.byte	PATT	
		.word	song0029_1_2
	.byte		N12	, Cn1, v127
	.byte		N11	, Dn1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte		N11	, Dn1, v056
	.byte	W12
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte		N11	, Dn1, v056
	.byte		N12	, An1, v127
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N11	, Dn1, v056
	.byte		N12	, Gs1, v127
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte	GOTO	
		.word	song0029_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0029_2
song0029_2:	@ 0x08C6D604
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v103
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte	W96
song0029_2_1:
	.byte		N18	, An1, v104
	.byte	W24
	.byte		N22	, An1, v108
	.byte	W24
	.byte		N06	, En1, v104
	.byte	W12
	.byte		N08	, En1, v112
	.byte	W12
	.byte		N21	, En1, v108
	.byte	W24
	.byte		N17	, Gn1, v120
	.byte	W24
	.byte		N13	, Gn1, v096
	.byte	W12
	.byte		N19	, Dn1, v112
	.byte	W24
	.byte		N07	, Dn1, v096
	.byte	W12
	.byte		N20	, Dn1, v112
	.byte	W24
	.byte		N15	, An1, v108
	.byte	W24
	.byte		N22	, An1, v092
	.byte	W24
	.byte		N06	, En1, v108
	.byte	W12
	.byte		N07	, En1, v100
	.byte	W12
	.byte		N23	, En1, v108
	.byte	W24
	.byte		N18	, Gn1, v112
	.byte	W24
	.byte		N14	, Gn1, v096
	.byte	W12
	.byte		N18	, Dn1, v104
	.byte	W24
	.byte		N08	, Dn1, v096
	.byte	W12
	.byte		N22	, Dn1, v116
	.byte	W24
	.byte		N18	, An1, v104
	.byte	W24
	.byte		N20	, An1, v096
	.byte	W24
	.byte		N08	, En1
	.byte	W12
	.byte			En1, v112
	.byte	W12
	.byte		N22	, En1, v116
	.byte	W24
	.byte		N16	, Gn1, v120
	.byte	W24
	.byte		N14	, Gn1, v104
	.byte	W12
	.byte		N19	, Dn1
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte		N17	, Dn1, v112
	.byte	W24
	.byte		N16	, Cn1, v100
	.byte	W24
	.byte		N24	, Cn1, v096
	.byte	W24
	.byte		N07	, Gn1, v104
	.byte	W12
	.byte		N10	, Gn1, v112
	.byte	W12
	.byte		N18	, Cn1, v096
	.byte	W24
	.byte		N19	, Dn1, v112
	.byte	W24
	.byte		N13	
	.byte	W12
	.byte		N14	, An1, v104
	.byte	W24
	.byte		N11	, An1, v084
	.byte	W12
	.byte		N22	, Dn1, v108
	.byte	W24
	.byte		N21	, Ds1, v112
	.byte	W24
	.byte		N08	, Ds1, v100
	.byte	W12
	.byte			Ds1, v096
	.byte	W12
	.byte			Ds1, v048
	.byte	W12
	.byte		N07	, Ds1, v100
	.byte	W12
	.byte		N08	, Ds1, v096
	.byte	W12
	.byte		N07	, Ds1, v108
	.byte	W12
	.byte			Ds1, v104
	.byte	W12
	.byte		N08	, Ds1, v112
	.byte	W12
	.byte		N07	, Ds1, v104
	.byte	W12
	.byte		N08	
	.byte	W12
	.byte		N08	
	.byte	W12
	.byte			Ds1, v112
	.byte	W12
	.byte		N07	, Ds1, v080
	.byte	W12
	.byte		N09	, Ds1, v104
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N07	, Fn1, v112
	.byte	W12
	.byte		N06	, Fn1, v100
	.byte	W12
	.byte		N07	, Fn1, v096
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	, Fn1, v108
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N08	, Fn1, v084
	.byte	W12
	.byte		N07	, Fn1, v092
	.byte	W12
	.byte			Fn1, v096
	.byte	W12
	.byte			Fn1, v104
	.byte	W12
	.byte		N06	, Fn1, v108
	.byte	W12
	.byte		N07	, Fn1, v104
	.byte	W12
	.byte		N06	, Fn1, v100
	.byte	W12
	.byte		N07	, Fn1, v104
	.byte	W12
	.byte		N11	, Fn1, v092
	.byte	W12
	.byte		N09	, Fs1, v108
	.byte	W12
	.byte		N08	, Fs1, v112
	.byte	W12
	.byte			Fs1, v116
	.byte	W12
	.byte		N07	, Fs1, v112
	.byte	W12
	.byte			Fs1, v116
	.byte	W12
	.byte		N06	, Fs1, v092
	.byte	W12
	.byte		N07	, Fs1, v104
	.byte	W12
	.byte			Fs1, v112
	.byte	W12
	.byte			Fs1, v104
	.byte	W12
	.byte		N08	
	.byte	W12
	.byte		N07	, Fs1, v108
	.byte	W12
	.byte			Fs1, v092
	.byte	W12
	.byte			Fs1, v108
	.byte	W12
	.byte			Fs1, v084
	.byte	W12
	.byte		N05	, Fs1, v080
	.byte	W12
	.byte		N10	, Fs1, v108
	.byte	W12
	.byte		N09	, Gs1, v104
	.byte	W12
	.byte		N07	, Gs1, v112
	.byte	W12
	.byte			Gs1, v108
	.byte	W12
	.byte			Gs1, v116
	.byte	W12
	.byte		N08	, Gs1, v112
	.byte	W12
	.byte		N07	, Gs1, v108
	.byte	W12
	.byte		N08	, Gs1, v092
	.byte	W12
	.byte		N06	, Gs1, v112
	.byte	W12
	.byte		N07	, Gs1, v104
	.byte	W12
	.byte			Gs1, v108
	.byte	W12
	.byte		N08	, Gs1, v100
	.byte	W12
	.byte		N07	, Gs1, v092
	.byte	W12
	.byte			Gs1, v104
	.byte	W12
	.byte		N08	, Gs1, v100
	.byte	W12
	.byte		N07	, Gs1, v108
	.byte	W12
	.byte		N09	, Gs1, v120
	.byte	W12
	.byte	GOTO	
		.word	song0029_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0029_3
song0029_3:	@ 0x08C6D78D
	.byte	KEYSH	, 0
	.byte	VOICE	, 75
	.byte	VOL	, v030
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte	W96
song0029_3_1:
	.byte	W24
	.byte		N11	, An3, v127
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte			Cs4
	.byte	W12
	.byte			En4
	.byte	W12
	.byte		N23	, An4
	.byte	W24
	.byte	PEND
song0029_3_2:
	.byte		N32	, Gn4, v127
	.byte	W36
	.byte			Fs4
	.byte	W36
	.byte		N23	, Dn4
	.byte	W24
	.byte	PEND
	.byte		TIE	, En4
	.byte	W96
	.byte	W68
	.byte	W01
	.byte		EOT	
	.byte	W24
	.byte	W03
	.byte	PATT	
		.word	song0029_3_1
	.byte	PATT	
		.word	song0029_3_2
	.byte		N92	, En4, v127
	.byte	W96
	.byte		N56	, Fs4
	.byte	W60
	.byte		N11	, En4
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		TIE	, Gn4
	.byte	W12
	.byte	W96
	.byte	W56
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N11	, Fn4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte		TIE	, An4
	.byte	W12
	.byte	W96
	.byte	W56
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N11	, Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		TIE	, As4
	.byte	W12
	.byte	W96
	.byte	W56
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N11	, An4
	.byte	W12
	.byte			As4
	.byte	W12
	.byte		TIE	, Cn5
	.byte	W12
	.byte	W96
	.byte	W13
	.byte		EOT	
	.byte	W80
	.byte	W03
	.byte	GOTO	
		.word	song0029_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0029_4
song0029_4:	@ 0x08C6D804
	.byte	KEYSH	, 0
	.byte	VOICE	, 2
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v041
	.byte	LFOS	, 10
	.byte	LFODL	, 0
	.byte	BENDR	, 2
	.byte	W96
song0029_4_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N04	, Ds2, v100
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			Gn2, v104
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Ds3, v108
	.byte	W04
	.byte			Fn3, v096
	.byte	W04
	.byte			Gn3, v100
	.byte	W04
	.byte			Fn3, v096
	.byte	W04
	.byte			Ds3, v084
	.byte	W04
	.byte			As2, v096
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			Fn3, v088
	.byte	W04
	.byte			Gn3, v084
	.byte	W04
	.byte			As3, v112
	.byte	W04
	.byte			Ds4, v096
	.byte	W04
	.byte			Fn4, v100
	.byte	W04
	.byte			Gn4, v108
	.byte	W04
	.byte			Fn4, v100
	.byte	W04
	.byte			Ds4, v092
	.byte	W04
	.byte			Fn4, v096
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4, v108
	.byte	W04
	.byte			Ds5, v104
	.byte	W04
	.byte			Gn5, v100
	.byte	W04
	.byte			As5, v104
	.byte	W04
	.byte			Gn5, v100
	.byte	W04
	.byte			Fn5, v080
	.byte	W04
	.byte			Ds5, v104
	.byte	W04
	.byte			As4, v088
	.byte	W04
	.byte			Gn4, v092
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			Gn4, v088
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Ds5, v084
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4, v100
	.byte	W04
	.byte			Ds4, v080
	.byte	W04
	.byte			As3, v100
	.byte	W04
	.byte			Gn3, v092
	.byte	W04
	.byte			Fn3, v084
	.byte	W04
	.byte			Ds3, v100
	.byte	W04
	.byte			Fn3, v096
	.byte	W04
	.byte			Gn3, v100
	.byte	W04
	.byte			As3, v108
	.byte	W04
	.byte			Gn3, v100
	.byte	W04
	.byte			Fn3, v092
	.byte	W04
	.byte			Ds3, v104
	.byte	W04
	.byte			As2, v112
	.byte	W04
	.byte			Fn2, v100
	.byte	W04
	.byte			Gn2
	.byte	W04
	.byte			An2, v104
	.byte	W04
	.byte			Cn3
	.byte	W04
	.byte			Fn3, v108
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			An3, v100
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			Fn3, v084
	.byte	W04
	.byte			Cn3, v096
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			Gn3, v088
	.byte	W04
	.byte			An3, v084
	.byte	W04
	.byte			Cn4, v112
	.byte	W04
	.byte			Fn4, v096
	.byte	W04
	.byte			Gn4, v100
	.byte	W04
	.byte			An4, v108
	.byte	W04
	.byte			Gn4, v100
	.byte	W04
	.byte			Fn4, v092
	.byte	W04
	.byte			Gn4, v096
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			Cn5, v108
	.byte	W04
	.byte			Fn5, v104
	.byte	W04
	.byte			An5, v100
	.byte	W04
	.byte			Cn6, v104
	.byte	W04
	.byte			An5, v100
	.byte	W04
	.byte			Gn5, v080
	.byte	W04
	.byte			Fn5, v104
	.byte	W04
	.byte			Cn5, v088
	.byte	W04
	.byte			An4, v092
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			An4, v088
	.byte	W04
	.byte			Cn5
	.byte	W04
	.byte			Fn5, v084
	.byte	W04
	.byte			Cn5
	.byte	W04
	.byte			An4, v100
	.byte	W04
	.byte			Fn4, v080
	.byte	W04
	.byte			Cn4, v100
	.byte	W04
	.byte			An3, v092
	.byte	W04
	.byte			Gn3, v084
	.byte	W04
	.byte			Fn3, v100
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			An3, v100
	.byte	W04
	.byte			Cn4, v108
	.byte	W04
	.byte			An3, v100
	.byte	W04
	.byte			Gn3, v092
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			Cn3, v112
	.byte	W04
	.byte			Fs2, v100
	.byte	W04
	.byte			Gs2
	.byte	W04
	.byte			As2, v104
	.byte	W04
	.byte			Cs3
	.byte	W04
	.byte			Fs3, v108
	.byte	W04
	.byte			Gs3, v096
	.byte	W04
	.byte			As3, v100
	.byte	W04
	.byte			Gs3, v096
	.byte	W04
	.byte			Fs3, v084
	.byte	W04
	.byte			Cs3, v096
	.byte	W04
	.byte			Fs3
	.byte	W04
	.byte			Gs3, v088
	.byte	W04
	.byte			As3, v084
	.byte	W04
	.byte			Cs4, v112
	.byte	W04
	.byte			Fs4, v096
	.byte	W04
	.byte			Gs4, v100
	.byte	W04
	.byte			As4, v108
	.byte	W04
	.byte			Gs4, v100
	.byte	W04
	.byte			Fs4, v092
	.byte	W04
	.byte			Gs4, v096
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Cs5, v108
	.byte	W04
	.byte			Fs5, v104
	.byte	W04
	.byte			As5, v100
	.byte	W04
	.byte			Cs6, v104
	.byte	W04
	.byte			As5, v100
	.byte	W04
	.byte			Gs5, v080
	.byte	W04
	.byte			Fs5, v104
	.byte	W04
	.byte			Cs5, v088
	.byte	W04
	.byte			As4, v092
	.byte	W04
	.byte			Gs4
	.byte	W04
	.byte			As4, v088
	.byte	W04
	.byte			Cs5
	.byte	W04
	.byte			Fs5, v084
	.byte	W04
	.byte			Cs5
	.byte	W04
	.byte			As4, v100
	.byte	W04
	.byte			Fs4, v080
	.byte	W04
	.byte			Cs4, v100
	.byte	W04
	.byte			As3, v092
	.byte	W04
	.byte			Gs3, v084
	.byte	W04
	.byte			Fs3, v100
	.byte	W04
	.byte			Gs3, v096
	.byte	W04
	.byte			As3, v100
	.byte	W04
	.byte			Cs4, v108
	.byte	W04
	.byte			As3, v100
	.byte	W04
	.byte			Gs3, v092
	.byte	W04
	.byte			Fs3, v104
	.byte	W04
	.byte			Cs3, v112
	.byte	W04
	.byte			Gs2, v100
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Cn3, v104
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			Gs3, v108
	.byte	W04
	.byte			As3, v096
	.byte	W04
	.byte			Cn4, v100
	.byte	W04
	.byte			As3, v096
	.byte	W04
	.byte			Gs3, v084
	.byte	W04
	.byte			Ds3, v096
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte			As3, v088
	.byte	W04
	.byte			Cn4, v084
	.byte	W04
	.byte			Ds4, v112
	.byte	W04
	.byte			Gs4, v096
	.byte	W04
	.byte			As4, v100
	.byte	W04
	.byte			Cn5, v108
	.byte	W04
	.byte			As4, v100
	.byte	W04
	.byte			Gs4, v092
	.byte	W04
	.byte			As4, v096
	.byte	W04
	.byte			Cn5
	.byte	W04
	.byte			Ds5, v108
	.byte	W04
	.byte			Gs5, v104
	.byte	W04
	.byte			Cn6, v100
	.byte	W04
	.byte			Ds6, v104
	.byte	W04
	.byte			Cn6, v100
	.byte	W04
	.byte			As5, v080
	.byte	W04
	.byte			Gs5, v104
	.byte	W04
	.byte			Ds5, v088
	.byte	W04
	.byte			Cn5, v092
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Cn5, v088
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			Gs5, v084
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			Cn5, v100
	.byte	W04
	.byte			Gs4, v080
	.byte	W04
	.byte			Ds4, v100
	.byte	W04
	.byte			Cn4, v092
	.byte	W04
	.byte			As3, v084
	.byte	W04
	.byte			Gs3, v100
	.byte	W04
	.byte			As3, v096
	.byte	W04
	.byte			Cn4, v100
	.byte	W04
	.byte			Ds4, v108
	.byte	W04
	.byte			Cn4, v100
	.byte	W04
	.byte			As3, v092
	.byte	W04
	.byte			Gs3, v104
	.byte	W04
	.byte			Ds3, v112
	.byte	W04
	.byte	GOTO	
		.word	song0029_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0029_5
song0029_5:	@ 0x08C6DA48
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte	W30
	.byte	W01
	.byte		N11	, Cn1, v044
	.byte	W03
	.byte		N12	, Dn1, v084
	.byte	W06
	.byte		N10	, En1, v016
	.byte	W05
	.byte			Fn1, v080
	.byte	W04
	.byte			Gn1, v084
	.byte	W04
	.byte			An1, v076
	.byte	W04
	.byte		N09	, Bn1, v084
	.byte	W04
	.byte			Cn2, v088
	.byte	W04
	.byte		N08	, Dn2, v100
	.byte	W03
	.byte		N09	, En2, v096
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			Gn2, v100
	.byte	W03
	.byte		N10	, An2, v096
	.byte	W04
	.byte			Bn2, v088
	.byte	W04
	.byte			Cn3, v096
	.byte	W04
	.byte		N11	, Dn3
	.byte	W05
song0029_5_1:
	.byte		N66	, En3, v068
	.byte	W72
	.byte		N21	, En3, v120
	.byte	W24
	.byte		N32	, Dn3, v112
	.byte	W36
	.byte		N11	, Dn3, v108
	.byte	W24
	.byte		N32	, Dn3, v112
	.byte	W36
	.byte		N44	, En3, v120
	.byte	W48
	.byte		N20	, En3, v084
	.byte	W24
	.byte		N23	, En3, v092
	.byte	W24
	.byte		N28	, Dn3, v108
	.byte	W36
	.byte		N10	, Dn3, v112
	.byte	W24
	.byte		N30	
	.byte	W36
	.byte		N68	, En3
	.byte	W72
	.byte		N23	, En3, v096
	.byte	W24
	.byte		N28	, Dn3, v120
	.byte	W36
	.byte		N16	, Dn3, v127
	.byte	W24
	.byte		N32	, Dn3, v124
	.byte	W36
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W30
	.byte	W01
	.byte		N02	, Cn1, v044
	.byte	W03
	.byte		N06	, Dn1, v084
	.byte	W06
	.byte		N04	, En1, v016
	.byte	W05
	.byte		N03	, Fn1, v080
	.byte	W04
	.byte		N04	, Gn1, v084
	.byte	W04
	.byte		N03	, An1, v076
	.byte	W04
	.byte			Bn1, v084
	.byte	W04
	.byte			Cn2, v088
	.byte	W04
	.byte			Dn2, v100
	.byte	W03
	.byte			En2, v096
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			Gn2, v100
	.byte	W03
	.byte			An2, v096
	.byte	W04
	.byte			Bn2, v088
	.byte	W04
	.byte			Cn3, v096
	.byte	W04
	.byte		N04	, Dn3
	.byte	W05
	.byte	GOTO	
		.word	song0029_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0029_6
song0029_6:	@ 0x08C6DB0D
	.byte	KEYSH	, 0
	.byte	VOICE	, 76
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte	W96
song0029_6_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N18	, Gn3, v100
	.byte	W24
	.byte		N19	, Gn3, v112
	.byte	W24
	.byte		N07	, Gn3, v084
	.byte	W12
	.byte		N08	, Gn3, v096
	.byte	W12
	.byte		N23	, Gn3, v084
	.byte	W24
	.byte		N21	, An3, v112
	.byte	W24
	.byte		N06	, An3, v100
	.byte	W12
	.byte		N23	
	.byte	W24
	.byte		N11	, Gn3, v104
	.byte	W12
	.byte			An3, v112
	.byte	W12
	.byte		N32	, As3, v124
	.byte	W12
	.byte	W24
	.byte		N40	, As3, v127
	.byte	W48
	.byte		N20	, As3, v104
	.byte	W24
	.byte		N23	
	.byte	W24
	.byte		N28	, As3, v124
	.byte	W36
	.byte		N10	, An3, v060
	.byte	W12
	.byte		N11	, As3, v104
	.byte	W12
	.byte		N32	, Cn4, v100
	.byte	W12
	.byte	W24
	.byte			Cn4, v116
	.byte	W36
	.byte		N07	, Cn4, v076
	.byte	W12
	.byte		N18	, Cn4, v104
	.byte	W24
	.byte		N21	, Cn4, v116
	.byte	W24
	.byte		N06	, Cn4, v096
	.byte	W12
	.byte		N22	, Cn4, v120
	.byte	W24
	.byte		N10	, As3, v100
	.byte	W12
	.byte		N11	, Cn4, v108
	.byte	W12
	.byte		N32	, Cs4, v120
	.byte	W12
	.byte	W24
	.byte		N21	, Cs4, v112
	.byte	W24
	.byte		N07	, Cs4, v096
	.byte	W12
	.byte		N32	, Cs4, v108
	.byte	W36
	.byte			Cs4, v120
	.byte	W36
	.byte		N22	, Cs4, v104
	.byte	W24
	.byte		N09	, Cn4, v096
	.byte	W12
	.byte		N11	, Cs4, v112
	.byte	W12
	.byte		N32	, Ds4
	.byte	W12
	.byte	W24
	.byte		N20	, Ds4, v120
	.byte	W24
	.byte		N08	, Ds4, v080
	.byte	W12
	.byte		N24	, Ds4, v116
	.byte	W36
	.byte		N28	, Ds4, v124
	.byte	W96
	.byte	GOTO	
		.word	song0029_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0029_7
song0029_7:	@ 0x08C6DBBC
	.byte	KEYSH	, 0
	.byte	VOICE	, 78
	.byte	VOL	, v060
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte	W96
song0029_7_3:
	.byte	VOL	, v056
	.byte	W48
	.byte		N14	, En4, v120
	.byte	W48
	.byte		N10	, Dn4, v108
	.byte	W36
	.byte		N10	
	.byte	W24
	.byte		N09	, Dn4, v112
	.byte	W36
	.byte			En4
	.byte	W60
	.byte		N08	, En4, v116
	.byte	W12
	.byte		N07	, En4, v120
	.byte	W24
	.byte		N13	, Dn4, v116
	.byte	W12
	.byte		N14	, Cs4, v108
	.byte	W12
	.byte		N09	, Dn4, v104
	.byte	W12
	.byte		N07	, Dn4, v124
	.byte	W24
	.byte		N10	, Dn4, v112
	.byte	W12
	.byte		N23	, Ds4, v120
	.byte	W24
	.byte		N30	, En4
	.byte	W36
	.byte		N06	, En4, v116
	.byte	W60
	.byte		N09	, Dn4, v120
	.byte	W36
	.byte		N08	, Dn4, v116
	.byte	W60
	.byte		N06	, Gn3, v112
	.byte	W36
	.byte		N48	, Gn3, v116
	.byte	W60
	.byte		N08	, An3, v120
	.byte	W36
	.byte		N36	
	.byte	W48
	.byte	VOL	, v110
	.byte		TIE	, As3, v100
	.byte	W04
	.byte	VOL	, v105
	.byte	W08
song0029_7_1:
	.byte	VOL	, v097
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v054
	.byte	W04
	.byte		v050
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v038
	.byte	W05
	.byte		v034
	.byte	W40
	.byte		v038
	.byte	W03
	.byte		v042
	.byte	W14
	.byte		v046
	.byte	W07
	.byte		v050
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v058
	.byte	W05
	.byte		v062
	.byte	W01
	.byte	PEND
song0029_7_2:
	.byte	W06
	.byte	VOL	, v066
	.byte	W06
	.byte		v070
	.byte	W03
	.byte		v074
	.byte	W02
	.byte		v077
	.byte	W05
	.byte		v082
	.byte	W06
	.byte		v085
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v101
	.byte	W05
	.byte		v105
	.byte	W17
	.byte		v110
	.byte	W32
	.byte	PEND
	.byte		EOT	, As3
	.byte	VOL	, v110
	.byte		TIE	, Cn4, v100
	.byte	W04
	.byte	VOL	, v105
	.byte	W08
	.byte	PATT	
		.word	song0029_7_1
	.byte	PATT	
		.word	song0029_7_2
	.byte		EOT	, Cn4
	.byte	VOL	, v110
	.byte		TIE	, Cs4, v100
	.byte	W04
	.byte	VOL	, v105
	.byte	W08
	.byte	PATT	
		.word	song0029_7_1
	.byte	PATT	
		.word	song0029_7_2
	.byte		EOT	, Cs4
	.byte	VOL	, v110
	.byte		TIE	, Ds4, v100
	.byte	W04
	.byte	VOL	, v105
	.byte	W08
	.byte	PATT	
		.word	song0029_7_1
	.byte	PATT	
		.word	song0029_7_2
	.byte		EOT	, Ds4
	.byte	W12
	.byte	GOTO	
		.word	song0029_7_3
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0029_8
song0029_8:	@ 0x08C6DCA5
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v051
	.byte	LFOS	, 10
	.byte	LFODL	, 0
	.byte	BENDR	, 2
	.byte	W96
song0029_8_1:
	.byte	W24
	.byte		N11	, Cs4, v076
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte			En4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N23	, Cs5
	.byte	W24
	.byte	PEND
song0029_8_2:
	.byte		N32	, Bn4, v076
	.byte	W36
	.byte			An4
	.byte	W36
	.byte		N23	, Fs4
	.byte	W24
	.byte	PEND
	.byte		TIE	, An4
	.byte	W96
	.byte	W68
	.byte	W01
	.byte		EOT	
	.byte	W24
	.byte	W03
	.byte	PATT	
		.word	song0029_8_1
	.byte	PATT	
		.word	song0029_8_2
	.byte		N92	, Gn4, v076
	.byte	W96
	.byte		N56	, An4
	.byte	W60
	.byte		N11	, Gn4
	.byte	W12
	.byte			An4
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0029_8_1
	.byte	FINE

	.align 2
	.global song0029
song0029:	@ 0x08C6DCFC
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song0029_1		@ track
	.word	song0029_2		@ track
	.word	song0029_3		@ track
	.word	song0029_4		@ track
	.word	song0029_5		@ track
	.word	song0029_6		@ track
	.word	song0029_7		@ track
	.word	song0029_8		@ track
