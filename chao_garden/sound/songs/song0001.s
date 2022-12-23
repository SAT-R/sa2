	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0001_1
song0001_1:	@ 0x0201DF00
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	VOICE	, 72
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 18
	.byte	MOD	, 3
	.byte	MODT	, 0
	.byte	W60
	.byte		N07	, Gn2, v127
	.byte	W08
	.byte		N03	, Fs2
	.byte	W04
	.byte		N05	, Gn2
	.byte	W12
	.byte		N06	, Gn1
	.byte	W12
song0001_1_1:
	.byte		N44	, Gn2, v127
	.byte		N44	, En3
	.byte	W48
	.byte			Fs2
	.byte		N44	, Ds3
	.byte	W48
	.byte	PEND
song0001_1_2:
	.byte		N44	, Gn2, v127
	.byte		N44	, En3
	.byte	W48
	.byte			En2
	.byte		N44	, Cn3
	.byte	W48
	.byte	PEND
	.byte			Fn2
	.byte		N44	, Dn3
	.byte	W48
	.byte			En2
	.byte		N44	, Cs3
	.byte	W48
	.byte		N76	, Fn2
	.byte		N76	, Dn3
	.byte	W96
	.byte		N44	, Fn2
	.byte		N44	, Dn3
	.byte	W48
	.byte		N48	, Gn2
	.byte		N44	, En3
	.byte	W48
	.byte			An2
	.byte		N44	, Fn3
	.byte	W48
	.byte			Fn2
	.byte		N44	, Dn3
	.byte	W48
	.byte			Gn2
	.byte		N44	, En3
	.byte	W48
	.byte		N23	, An2
	.byte		N23	, Fn3
	.byte	W24
	.byte			Bn2
	.byte		N23	, Fs3
	.byte	W24
	.byte		N72	, Cn3
	.byte		N72	, Gn3
	.byte	W96
	.byte	PATT	
		.word	song0001_1_1
	.byte	PATT	
		.word	song0001_1_2
	.byte		N44	, Fn2, v127
	.byte		N44	, Dn3
	.byte	W48
	.byte			Gn2
	.byte		N44	, En3
	.byte	W48
	.byte		N78	, An2
	.byte		N78	, Fn3
	.byte	W96
	.byte		N60	, Gn2
	.byte		N60	, En3
	.byte	W60
	.byte		N12	, Cn2
	.byte		N12	, Gn2
	.byte	W12
	.byte			En2
	.byte		N12	, Cn3
	.byte	W12
	.byte			Gn2
	.byte		N12	, En3
	.byte	W12
	.byte		N68	, Fn2
	.byte		N68	, Dn3
	.byte	W72
	.byte		N12	, Dn2
	.byte		N12	, Bn2
	.byte	W12
	.byte			Fn2
	.byte		N12	, Dn3
	.byte	W12
	.byte		N96	, En2
	.byte		N96	, Cn3
	.byte	W96
	.byte	W80
	.byte	W03
	.byte		N03	, Fs2
	.byte		N03	, Dn3
	.byte	W04
	.byte		N02	, Gn2
	.byte		N02	, Ds3
	.byte	W03
	.byte		N03	, Gs2
	.byte		N03	, En3
	.byte	W04
	.byte		N48	, An2
	.byte		N48	, Fn3
	.byte	W02
	.byte	W44
	.byte	W03
	.byte		N20	, Gs2
	.byte		N20	, En3
	.byte	W21
	.byte		N02	, Gs2
	.byte		N03	, An2
	.byte		N02	, Fn3
	.byte		N03	, Fs3
	.byte	W04
	.byte		N22	, As2
	.byte		N22	, Gn3
	.byte	W23
	.byte		N44	, An2
	.byte		N44	, Fn3
	.byte	W01
	.byte	W44
	.byte	W03
	.byte		N40	, Fn2
	.byte		N40	, Cn3
	.byte	W44
	.byte	W03
	.byte		N03	, Fn2
	.byte		N03	, Dn3
	.byte	W01
	.byte		N02	, Fs2
	.byte		N02	, Ds3
	.byte	W01
	.byte	W01
	.byte		N44	, Gn2
	.byte		N44	, En3
	.byte	W44
	.byte	W02
	.byte		N23	, Fn2
	.byte		N23	, Dn3
	.byte	W24
	.byte			Fs2
	.byte		N23	, Ds3
	.byte	W24
	.byte		N80	, Gn2
	.byte		N80	, En3
	.byte	W01
	.byte	W92
	.byte		N01	, Fs2
	.byte		N01	, Dn3
	.byte	W02
	.byte			Gn2
	.byte		N01	, Ds3
	.byte	W02
	.byte		N02	, Gs2
	.byte		N02	, En3
	.byte	W02
	.byte		N44	, An2
	.byte		N44	, Fn3
	.byte	W44
	.byte	W02
	.byte		N22	, Gs2
	.byte		N22	, En3
	.byte	W23
	.byte		N02	, Gs2
	.byte		N02	, Fn3
	.byte	W01
	.byte			An2
	.byte		N02	, Fs3
	.byte	W03
	.byte		N20	, As2
	.byte		N20	, Gn3
	.byte	W21
	.byte		N60	, An2
	.byte		N60	, Fn3
	.byte	W60
	.byte	W01
	.byte		N11	, Fn2
	.byte		N11	, Cn3
	.byte	W12
	.byte			An2
	.byte		N11	, Fn3
	.byte	W11
	.byte			As2
	.byte		N11	, Fs3
	.byte	W12
	.byte		N56	, Bn2
	.byte		N56	, Gn3
	.byte	W60
	.byte		N06	, An2
	.byte		N06	, Fn3
	.byte	W12
	.byte			An2
	.byte		N06	, Fn3
	.byte	W07
	.byte		N17	, As2
	.byte		N17	, Fs3
	.byte	W17
	.byte	W01
	.byte		N05	, Bn2
	.byte		N05	, Gn3
	.byte	W56
	.byte	W03
	.byte		N07	, Gn2
	.byte	W08
	.byte		N03	, Fs2
	.byte	W04
	.byte		N05	, Gn2
	.byte	W12
	.byte		N06	, Gn1
	.byte	W12
	.byte	GOTO	
		.word	song0001_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0001_2
song0001_2:	@ 0x0201E063
	.byte	KEYSH	, 0
	.byte	VOICE	, 9
	.byte	VOL	, v078
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N08	, Gn1, v127
	.byte	W96
song0001_2_2:
	.byte		N08	, Cn2, v127
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Bn1
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte	PEND
song0001_2_3:
	.byte		N08	, Cn2, v127
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte	PEND
song0001_2_1:
	.byte		N08	, Dn2, v127
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cs2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte	PEND
	.byte			Dn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Dn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte	PATT	
		.word	song0001_2_1
	.byte		N08	, Dn2, v127
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Dn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Bn1
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte	PATT	
		.word	song0001_2_2
	.byte	PATT	
		.word	song0001_2_3
	.byte		N08	, Fn1, v127
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn1
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn1
	.byte	W12
	.byte		N08	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte	PATT	
		.word	song0001_2_3
song0001_2_4:
	.byte		N08	, Fn2, v127
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			En2
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte	PEND
song0001_2_5:
	.byte		N08	, Fn2, v127
	.byte	W24
	.byte			Cn2
	.byte	W24
	.byte			Fn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0001_2_2
	.byte	PATT	
		.word	song0001_2_3
	.byte	PATT	
		.word	song0001_2_4
	.byte	PATT	
		.word	song0001_2_5
	.byte		N08	, Gn2, v127
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn2
	.byte	W24
	.byte			Dn2
	.byte	W24
	.byte			Gn1
	.byte	W96
	.byte	GOTO	
		.word	song0001_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0001_3
song0001_3:	@ 0x0201E150
	.byte	KEYSH	, 0
	.byte	VOICE	, 71
	.byte	VOL	, v074
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N04	, Gn1, v100
	.byte		N04	, Gn2, v084
	.byte	W12
	.byte		N07	, Bn2, v116
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v108
	.byte		N03	, Fs3
	.byte	W04
	.byte		N07	, Bn2, v096
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v100
	.byte		N03	, Fs3
	.byte	W04
	.byte		N07	, Bn2, v112
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v100
	.byte		N03	, Fs3
	.byte	W04
	.byte		N05	, Bn2, v124
	.byte		N05	, Gn3
	.byte	W48
song0001_3_1:
	.byte	W12
	.byte		N03	, En3, v096
	.byte		N03	, Gn3
	.byte	W08
	.byte			En3
	.byte		N04	, Gn3, v104
	.byte	W16
	.byte			En3
	.byte		N05	, Gn3
	.byte	W24
	.byte		N03	, Ds3, v088
	.byte		N03	, Fs3, v104
	.byte	W08
	.byte		N04	, Ds3, v080
	.byte		N05	, Fs3, v092
	.byte	W16
	.byte		N04	, Ds3, v096
	.byte		N04	, Fs3
	.byte	W12
	.byte	W12
	.byte		N03	, En3, v092
	.byte		N04	, Gn3, v096
	.byte	W08
	.byte		N03	, En3, v084
	.byte		N04	, Gn3, v100
	.byte	W16
	.byte		N03	, En3, v096
	.byte		N03	, Gn3, v100
	.byte	W24
	.byte			En3, v096
	.byte		N03	, Gn3
	.byte	W08
	.byte			En3
	.byte		N04	, Gn3, v104
	.byte	W16
	.byte		N03	, En3, v112
	.byte		N04	, Gn3, v104
	.byte	W12
	.byte	W12
	.byte		N03	, Dn3, v100
	.byte		N04	, Fn3, v096
	.byte	W08
	.byte		N03	, Dn3, v076
	.byte		N02	, Fn3, v072
	.byte	W16
	.byte		N04	, Dn3, v108
	.byte		N04	, Fn3
	.byte	W24
	.byte			Cs3, v100
	.byte		N04	, En3, v104
	.byte	W08
	.byte			Cs3, v080
	.byte		N04	, En3, v076
	.byte	W16
	.byte			Cs3, v088
	.byte		N04	, En3, v092
	.byte	W12
	.byte	W12
	.byte		N03	, Dn3, v096
	.byte		N04	, Fn3, v100
	.byte	W08
	.byte		N03	, Dn3, v096
	.byte		N04	, Fn3
	.byte	W16
	.byte		N03	, Dn3, v100
	.byte		N03	, Fn3, v096
	.byte	W24
	.byte		N04	, Dn3
	.byte		N04	, Fn3
	.byte	W08
	.byte			Dn3, v080
	.byte		N05	, Fn3, v084
	.byte	W16
	.byte		N02	, Dn3, v096
	.byte		N04	, Fn3, v104
	.byte	W12
	.byte	W12
	.byte		N03	, Dn3, v096
	.byte		N04	, Fn3
	.byte	W08
	.byte		N03	, Dn3
	.byte		N04	, Fn3, v084
	.byte	W16
	.byte		N03	, Dn3, v096
	.byte		N04	, Fn3, v092
	.byte	W24
	.byte			Cs3, v088
	.byte		N04	, En3, v092
	.byte	W08
	.byte		N03	, Cs3
	.byte		N03	, En3, v084
	.byte	W16
	.byte		N04	, Cs3, v088
	.byte		N04	, En3, v092
	.byte	W12
	.byte	W12
	.byte			Dn3, v096
	.byte		N04	, Fn3, v088
	.byte	W08
	.byte		N03	, Dn3, v092
	.byte		N04	, Fn3, v088
	.byte	W16
	.byte		N03	, Dn3, v100
	.byte		N03	, Fn3, v096
	.byte	W24
	.byte		N04	, Dn3, v092
	.byte		N04	, Fn3, v088
	.byte	W08
	.byte			Dn3
	.byte		N04	, Fn3
	.byte	W16
	.byte		N03	, Dn3, v104
	.byte		N04	, Fn3
	.byte	W12
	.byte	W12
	.byte			Bn2, v108
	.byte		N04	, Gn3
	.byte	W08
	.byte		N03	, Bn2, v092
	.byte		N03	, Gn3, v104
	.byte	W16
	.byte		N04	, Bn2, v096
	.byte		N05	, Gn3
	.byte	W24
	.byte		N04	, Dn3
	.byte		N03	, Fn3, v100
	.byte	W08
	.byte		N04	, Dn3, v080
	.byte		N05	, Fn3, v072
	.byte	W16
	.byte		N04	, Dn3, v092
	.byte		N04	, Fn3, v088
	.byte	W12
	.byte	W12
	.byte		N03	, En3, v092
	.byte		N04	, Gn3, v096
	.byte	W08
	.byte			En3, v076
	.byte		N05	, Gn3, v088
	.byte	W16
	.byte		N03	, En3, v104
	.byte		N04	, Gn3
	.byte	W24
	.byte		N03	, En3, v088
	.byte		N04	, Gn3, v092
	.byte	W08
	.byte		N03	, En3, v096
	.byte		N04	, Gn3, v100
	.byte	W16
	.byte		N03	, En3, v096
	.byte		N03	, Gn3, v112
	.byte	W12
	.byte	W12
	.byte		N04	, En3, v096
	.byte		N04	, Gn3, v104
	.byte	W08
	.byte			En3, v076
	.byte		N04	, Gn3, v084
	.byte	W16
	.byte		N03	, En3, v100
	.byte		N04	, Gn3, v104
	.byte	W24
	.byte			Ds3, v088
	.byte		N04	, Fs3, v104
	.byte	W08
	.byte			Ds3, v084
	.byte		N04	, Fs3
	.byte	W16
	.byte			Ds3
	.byte		N04	, Fs3, v092
	.byte	W12
	.byte	W12
	.byte		N03	, En3, v104
	.byte		N04	, Gn3
	.byte	W08
	.byte		N03	, En3, v080
	.byte		N04	, Gn3, v088
	.byte	W16
	.byte		N03	, En3, v100
	.byte		N03	, Gn3, v108
	.byte	W24
	.byte		N04	, En3, v096
	.byte		N04	, Gn3, v108
	.byte	W08
	.byte		N03	, En3, v084
	.byte		N04	, Gn3
	.byte	W16
	.byte		N03	, En3, v104
	.byte		N04	, Gn3, v108
	.byte	W12
	.byte	W12
	.byte			Fn3, v092
	.byte		N04	, An3
	.byte	W08
	.byte			Fn3, v080
	.byte		N04	, An3, v084
	.byte	W16
	.byte		N03	, Fn3, v096
	.byte		N03	, An3
	.byte	W24
	.byte		N04	, Dn3, v104
	.byte		N04	, Fn3, v092
	.byte	W08
	.byte			Dn3, v108
	.byte		N04	, Fn3, v096
	.byte	W16
	.byte			Dn3, v104
	.byte		N03	, Fn3, v080
	.byte	W12
	.byte	W12
	.byte			Fn3, v076
	.byte		N04	, An3, v084
	.byte	W08
	.byte			Fn3, v096
	.byte		N04	, An3, v088
	.byte	W16
	.byte		N03	, Fn3, v092
	.byte		N04	, An3, v096
	.byte	W24
	.byte		N03	, Fn3
	.byte		N03	, An3, v092
	.byte	W08
	.byte		N02	, Fn3
	.byte		N03	, An3, v100
	.byte	W16
	.byte			Fn3, v104
	.byte		N04	, An3
	.byte	W12
	.byte	W12
	.byte		N03	, En3, v096
	.byte		N04	, Gn3
	.byte	W08
	.byte		N03	, En3, v072
	.byte		N03	, Gn3
	.byte	W16
	.byte			En3, v096
	.byte		N04	, Gn3
	.byte	W24
	.byte		N03	, Cn3, v080
	.byte		N03	, En3
	.byte	W08
	.byte			Cn3, v088
	.byte		N04	, En3, v096
	.byte	W16
	.byte			Cn3, v100
	.byte		N04	, En3, v092
	.byte	W12
	.byte	W12
	.byte			Dn3, v096
	.byte		N04	, Gn3, v108
	.byte	W08
	.byte		N03	, Dn3, v092
	.byte		N04	, Gn3, v100
	.byte	W16
	.byte		N03	, Dn3
	.byte		N04	, Gn3, v108
	.byte	W24
	.byte		N02	, Bn2, v072
	.byte		N03	, Dn3, v096
	.byte	W08
	.byte		N02	, Bn2, v076
	.byte		N03	, Dn3, v084
	.byte	W16
	.byte			Bn2, v088
	.byte		N04	, Dn3, v100
	.byte	W12
	.byte	W12
	.byte		N02	, En3, v068
	.byte		N05	, Gn3, v096
	.byte	W08
	.byte		N03	, En3, v112
	.byte		N04	, Gn3
	.byte	W16
	.byte		N03	, En3, v084
	.byte		N04	, Gn3, v112
	.byte	W24
	.byte			Ds3, v096
	.byte		N04	, Fs3, v092
	.byte	W08
	.byte			Ds3, v088
	.byte		N04	, Fs3, v092
	.byte	W16
	.byte			Ds3, v096
	.byte		N04	, Fs3, v092
	.byte	W12
	.byte	W12
	.byte			En3, v084
	.byte		N04	, Gn3, v080
	.byte	W08
	.byte		N03	, En3, v092
	.byte		N03	, Gn3, v088
	.byte	W16
	.byte			En3, v100
	.byte		N03	, Gn3
	.byte	W24
	.byte			En3, v096
	.byte		N04	, Gn3, v100
	.byte	W08
	.byte		N03	, En3, v088
	.byte		N04	, Gn3, v096
	.byte	W16
	.byte		N03	, En3, v100
	.byte		N04	, Gn3, v096
	.byte	W12
	.byte	W12
	.byte		N02	, Fn3, v084
	.byte		N04	, An3, v100
	.byte	W08
	.byte		N03	, Fn3, v092
	.byte		N03	, An3
	.byte	W16
	.byte			Fn3, v100
	.byte		N03	, An3, v096
	.byte	W24
	.byte		N04	, En3, v084
	.byte		N04	, Gs3, v100
	.byte	W08
	.byte			En3, v080
	.byte		N04	, Gs3, v100
	.byte	W16
	.byte		N03	, En3, v084
	.byte		N04	, Gs3, v112
	.byte	W12
	.byte	W12
	.byte		N02	, Fn3, v084
	.byte		N04	, An3, v100
	.byte	W08
	.byte		N03	, Fn3, v092
	.byte		N03	, An3
	.byte	W16
	.byte			Fn3, v100
	.byte		N03	, An3, v096
	.byte	W24
	.byte		N02	, Fn3, v084
	.byte		N04	, An3, v100
	.byte	W08
	.byte		N03	, Fn3, v092
	.byte		N03	, An3
	.byte	W16
	.byte		N05	, Fn3, v104
	.byte		N05	, An3, v096
	.byte	W12
	.byte	W12
	.byte		N04	, En3, v088
	.byte		N04	, Gn3, v092
	.byte	W08
	.byte			En3, v080
	.byte		N04	, Gn3, v084
	.byte	W16
	.byte			En3, v096
	.byte		N05	, Gn3
	.byte	W24
	.byte		N04	, Ds3, v088
	.byte		N04	, Fs3, v092
	.byte	W08
	.byte			Ds3, v080
	.byte		N04	, Fs3, v084
	.byte	W16
	.byte			Ds3, v096
	.byte		N05	, Fs3
	.byte	W12
	.byte	W12
	.byte		N03	, En3
	.byte		N04	, Gn3, v088
	.byte	W08
	.byte		N03	, En3, v092
	.byte		N04	, Gn3, v100
	.byte	W16
	.byte		N03	, En3
	.byte		N04	, Gn3, v096
	.byte	W24
	.byte		N03	, En3, v104
	.byte		N03	, Gn3, v100
	.byte	W08
	.byte			En3, v096
	.byte		N04	, Gn3, v092
	.byte	W16
	.byte			En3, v096
	.byte		N04	, Gn3, v112
	.byte	W12
	.byte	W12
	.byte		N03	, Fn3, v084
	.byte		N03	, An3, v100
	.byte	W08
	.byte			Fn3, v088
	.byte		N04	, An3, v080
	.byte	W16
	.byte			Fn3, v096
	.byte		N04	, An3
	.byte	W24
	.byte			En3, v092
	.byte		N04	, Gs3, v108
	.byte	W08
	.byte			En3, v084
	.byte		N04	, Gs3, v104
	.byte	W16
	.byte		N03	, En3, v096
	.byte		N03	, Gs3, v108
	.byte	W12
	.byte	W12
	.byte			Fn3, v096
	.byte		N04	, An3
	.byte	W08
	.byte			Fn3, v076
	.byte		N04	, An3
	.byte	W16
	.byte		N03	, Fn3, v096
	.byte		N04	, An3
	.byte	W24
	.byte		N03	, Fn3, v100
	.byte		N04	, An3, v096
	.byte	W08
	.byte		N03	, Fn3, v092
	.byte		N04	, An3, v096
	.byte	W16
	.byte		N03	, Fn3, v104
	.byte		N04	, An3, v108
	.byte	W12
	.byte	W12
	.byte			Bn2, v096
	.byte		N05	, Gn3, v108
	.byte	W08
	.byte		N04	, Bn2, v088
	.byte		N03	, Gn3, v112
	.byte	W16
	.byte			Bn2, v096
	.byte		N04	, Gn3, v112
	.byte	W24
	.byte		N02	, An2, v072
	.byte		N04	, Fs3, v100
	.byte	W08
	.byte		N03	, An2, v092
	.byte		N04	, Fs3, v108
	.byte	W16
	.byte		N03	, An2, v100
	.byte		N05	, Fs3, v112
	.byte	W12
	.byte		N04	, Bn2, v084
	.byte		N04	, Gn3, v100
	.byte	W12
	.byte		N07	, Bn2, v116
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v108
	.byte		N03	, Fs3
	.byte	W04
	.byte		N07	, Bn2, v096
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v100
	.byte		N03	, Fs3
	.byte	W04
	.byte		N07	, Bn2, v112
	.byte		N07	, Gn3
	.byte	W08
	.byte		N03	, As2, v100
	.byte		N03	, Fs3
	.byte	W04
	.byte		N05	, Bn2, v124
	.byte		N05	, Gn3
	.byte	W48
	.byte	GOTO	
		.word	song0001_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0001_4
song0001_4:	@ 0x0201E541
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v074
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	VOL	, v100
	.byte		N06	, Cn1, v127
	.byte	W48
	.byte			Dn2
	.byte	W32
	.byte		N03	
	.byte	W04
	.byte		N06	
	.byte	W12
song0001_4_1:
	.byte		N04	, Dn2, v127
	.byte	W12
	.byte			Dn1, v060
	.byte	W08
	.byte		N04	
	.byte	W04
	.byte			Dn2, v127
	.byte	W12
	.byte		N08	, Ds1, v060
	.byte	W12
	.byte		N04	, Dn2, v127
	.byte	W12
	.byte			Dn1, v060
	.byte	W08
	.byte		N04	
	.byte	W04
	.byte			Dn2, v127
	.byte	W12
	.byte		N08	, Ds1, v060
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte	PATT	
		.word	song0001_4_1
	.byte		N06	, Cn1, v127
	.byte	W48
	.byte			Dn2
	.byte	W32
	.byte		N03	
	.byte	W04
	.byte		N06	
	.byte	W12
	.byte	GOTO	
		.word	song0001_4_1
	.byte	FINE

	.align 2
	.global song0001
song0001:	@ 0x0201E5FC
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0001_1		@ track
	.word	song0001_2		@ track
	.word	song0001_3		@ track
	.word	song0001_4		@ track
