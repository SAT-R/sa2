	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song003_1
song003_1:	@ 0x0201BA88
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	VOICE	, 127
	.byte	VOL	, v105
	.byte	W24
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
song003_1_1:
	.byte		N06	, Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Ds1, v060
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
song003_1_2:
	.byte		N06	, Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PEND
song003_1_3:
	.byte		N06	, Ds1, v060
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_1
	.byte	PATT	
		.word	song003_1_2
	.byte	GOTO	
		.word	song003_1_3
	.byte	FINE

	@********************** Track  2 **********************@

	.global song003_2
song003_2:	@ 0x0201BB7B
	.byte	KEYSH	, 0
	.byte	VOICE	, 44
	.byte	VOL	, v105
	.byte		N24	, Fn2, v120
	.byte	W24
	.byte		N03	, As2, v124
	.byte	W12
	.byte			As2, v112
	.byte	W12
	.byte			As2, v104
	.byte	W12
	.byte			As2, v092
	.byte	W12
	.byte			As2, v084
	.byte	W12
	.byte			As2, v072
	.byte	W12
song003_2_1:
	.byte		N03	, As2, v064
	.byte	W12
	.byte		N02	, As2, v052
	.byte	W12
	.byte		N03	, As1, v124
	.byte	W12
	.byte			As1, v112
	.byte	W12
	.byte			As1, v104
	.byte	W12
	.byte			As1, v092
	.byte	W12
	.byte			As1, v084
	.byte	W12
	.byte			As1, v072
	.byte	W12
	.byte	PEND
song003_2_2:
	.byte		N03	, As1, v064
	.byte	W12
	.byte		N02	, As1, v052
	.byte	W12
	.byte		N03	, As2, v124
	.byte	W12
	.byte			As2, v112
	.byte	W12
	.byte			As2, v104
	.byte	W12
	.byte			As2, v092
	.byte	W12
	.byte			As2, v084
	.byte	W12
	.byte			As2, v072
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song003_2_1
song003_2_5:
	.byte		N03	, As1, v064
	.byte	W12
	.byte		N02	, As1, v052
	.byte	W12
	.byte	PEND
song003_2_6:
	.byte		N03	, As2, v124
	.byte	W12
	.byte			As2, v112
	.byte	W12
	.byte			As2, v104
	.byte	W12
	.byte			As2, v092
	.byte	W12
	.byte			As2, v084
	.byte	W12
	.byte			As2, v072
	.byte	W12
	.byte	PATT	
		.word	song003_2_1
	.byte	PATT	
		.word	song003_2_2
	.byte	PATT	
		.word	song003_2_1
	.byte	PATT	
		.word	song003_2_2
	.byte		N03	, As2, v064
	.byte	W12
	.byte		N02	, As2, v052
	.byte	W12
	.byte		N03	, As1, v124
	.byte	W12
	.byte			As1, v112
	.byte	W12
	.byte			As1, v104
	.byte	W12
	.byte			As1, v092
	.byte	W12
	.byte			As1, v084
	.byte	W12
	.byte			Bn1, v072
	.byte	W12
	.byte			Cn2, v064
	.byte	W12
	.byte		N20	, Cs2, v052
	.byte	W24
	.byte		N03	, Cs3, v112
	.byte	W12
	.byte			Cs3, v104
	.byte	W12
	.byte			Cs3, v092
	.byte	W12
	.byte			Cs3, v084
	.byte	W12
	.byte			Cs3, v072
	.byte	W12
song003_2_3:
	.byte		N03	, Cs3, v064
	.byte	W12
	.byte		N02	, Cs3, v052
	.byte	W12
	.byte		N03	, Cs2, v124
	.byte	W12
	.byte			Cs2, v112
	.byte	W12
	.byte			Cs2, v104
	.byte	W12
	.byte			Cs2, v092
	.byte	W12
	.byte			Cs2, v084
	.byte	W12
	.byte			Cs2, v072
	.byte	W12
	.byte	PEND
song003_2_4:
	.byte		N03	, Cs2, v064
	.byte	W12
	.byte		N02	, Cs2, v052
	.byte	W12
	.byte		N03	, Cs3, v124
	.byte	W12
	.byte			Cs3, v112
	.byte	W12
	.byte			Cs3, v104
	.byte	W12
	.byte			Cs3, v092
	.byte	W12
	.byte			Cs3, v084
	.byte	W12
	.byte			Cs3, v072
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song003_2_3
	.byte	PATT	
		.word	song003_2_4
	.byte	PATT	
		.word	song003_2_3
	.byte	PATT	
		.word	song003_2_4
	.byte		N03	, Cs3, v064
	.byte	W12
	.byte		N02	, Cs3, v052
	.byte	W12
	.byte		N03	, Cs2, v124
	.byte	W12
	.byte			Cs2, v112
	.byte	W12
	.byte			Cs2, v104
	.byte	W12
	.byte			Cs2, v092
	.byte	W12
	.byte			Cs2, v084
	.byte	W12
	.byte			Cn2, v072
	.byte	W12
	.byte			Bn1, v064
	.byte	W12
	.byte		N23	, As1, v052
	.byte	W24
	.byte		N03	, As2, v112
	.byte	W12
	.byte			As2, v104
	.byte	W12
	.byte			As2, v092
	.byte	W12
	.byte			As2, v084
	.byte	W12
	.byte			As2, v072
	.byte	W12
	.byte	PATT	
		.word	song003_2_1
	.byte	PATT	
		.word	song003_2_5
	.byte	GOTO	
		.word	song003_2_6
	.byte	FINE

	@********************** Track  3 **********************@

	.global song003_3
song003_3:	@ 0x0201BCC5
	.byte	KEYSH	, 0
	.byte	VOICE	, 103
	.byte	VOL	, v082
	.byte	BENDR	, 59
	.byte		N24	, Fn3, v120
	.byte	W24
	.byte		N06	, As3
	.byte	W72
	.byte	W96
	.byte	W24
	.byte		N68	, As2, v127
	.byte	W72
song003_3_1:
	.byte		N04	, As2, v127
	.byte	W12
	.byte		N96	, Gs2
	.byte	W84
	.byte	PEND
	.byte	W24
song003_3_5:
	.byte		N64	, As2, v127
	.byte	W72
song003_3_2:
	.byte		N06	, As2, v108
	.byte	W12
	.byte		N88	, Gs2, v124
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N68	, As2, v127
	.byte	W72
	.byte	PATT	
		.word	song003_3_1
	.byte	W24
	.byte		N64	, As2, v127
	.byte	W72
	.byte	PATT	
		.word	song003_3_2
	.byte	W24
	.byte		N68	, Cs3, v127
	.byte	W72
song003_3_3:
	.byte		N04	, Cs3, v127
	.byte	W12
	.byte		N96	, Bn2
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N64	, Cs3
	.byte	W72
song003_3_4:
	.byte		N06	, Cs3, v108
	.byte	W12
	.byte		N88	, Bn2, v124
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N68	, Cs3, v127
	.byte	W72
	.byte	PATT	
		.word	song003_3_3
	.byte	W24
	.byte		N64	, Cs3, v127
	.byte	W72
	.byte	PATT	
		.word	song003_3_4
	.byte	W24
	.byte		N68	, As2, v127
	.byte	W72
	.byte	PATT	
		.word	song003_3_1
	.byte	W24
	.byte	GOTO	
		.word	song003_3_5
	.byte	FINE

	@********************** Track  4 **********************@

	.global song003_4
song003_4:	@ 0x0201BD43
	.byte	KEYSH	, 0
	.byte	VOICE	, 104
	.byte	VOL	, v082
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte		N24	, An3, v120
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N68	, Dn3, v127
	.byte	W72
song003_4_1:
	.byte		N04	, Dn3, v127
	.byte	W12
	.byte		N96	, Cn3
	.byte	W84
	.byte	PEND
	.byte	W24
song003_4_3:
	.byte	W72
	.byte	W96
	.byte	W24
	.byte		N68	, Dn3, v127
	.byte	W72
	.byte	PATT	
		.word	song003_4_1
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N68	, Fn3, v127
	.byte	W72
song003_4_2:
	.byte		N04	, Fn3, v127
	.byte	W12
	.byte		N96	, Ds3
	.byte	W84
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N68	, Fn3
	.byte	W72
	.byte	PATT	
		.word	song003_4_2
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N68	, Dn3, v127
	.byte	W72
	.byte	PATT	
		.word	song003_4_1
	.byte	W24
	.byte	GOTO	
		.word	song003_4_3
	.byte	FINE

	@********************** Track  5 **********************@

	.global song003_5
song003_5:	@ 0x0201BD9B
	.byte	KEYSH	, 0
	.byte	VOICE	, 105
	.byte	VOL	, v082
	.byte	W24
	.byte		N06	, Fn3, v120
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
song003_5_3:
	.byte		N64	, Fn2, v127
	.byte	W72
song003_5_1:
	.byte		N06	, Fn2, v108
	.byte	W12
	.byte		N88	, Ds2, v124
	.byte	W84
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N64	, Fn2, v127
	.byte	W72
	.byte	PATT	
		.word	song003_5_1
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N64	, Gs2, v127
	.byte	W72
song003_5_2:
	.byte		N06	, Gs2, v108
	.byte	W12
	.byte		N88	, Fs2, v124
	.byte	W84
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N64	, Gs2, v127
	.byte	W72
	.byte	PATT	
		.word	song003_5_2
	.byte	W96
	.byte	W96
	.byte	W24
	.byte	GOTO	
		.word	song003_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song003_6
song003_6:	@ 0x0201BDE8
	.byte	KEYSH	, 0
	.byte	VOICE	, 95
	.byte	VOL	, v074
	.byte	BENDR	, 12
	.byte	W04
	.byte		N02	, Fn3, v108
	.byte	W02
	.byte			Gn3, v112
	.byte	W02
	.byte			An3
	.byte	W02
	.byte			As3, v124
	.byte	W02
	.byte			Cn4, v112
	.byte	W02
	.byte			Dn4, v108
	.byte	W02
	.byte			Ds4, v112
	.byte	W02
	.byte			Fn4, v108
	.byte	W02
	.byte			Gn4, v112
	.byte	W02
	.byte			An4, v124
	.byte	W02
	.byte		N10	, As4
	.byte	W72
	.byte	W96
	.byte	W24
	.byte		N68	, Fn4, v108
	.byte	W72
song003_6_1:
	.byte		N04	, Fn4, v096
	.byte	W12
	.byte		N96	, Ds4, v104
	.byte	W84
	.byte	PEND
	.byte	W24
song003_6_5:
	.byte		N64	, Dn4, v100
	.byte	W72
song003_6_2:
	.byte		N06	, Dn4, v076
	.byte	W12
	.byte		N88	, Cn4, v096
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N68	, Fn4, v108
	.byte	W72
	.byte	PATT	
		.word	song003_6_1
	.byte	W24
	.byte		N64	, Dn4, v100
	.byte	W72
	.byte	PATT	
		.word	song003_6_2
	.byte	W24
	.byte		N68	, Gs4, v108
	.byte	W72
song003_6_3:
	.byte		N04	, Gs4, v096
	.byte	W12
	.byte		N96	, Fs4, v104
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N64	, Fn4, v100
	.byte	W72
song003_6_4:
	.byte		N06	, Fn4, v076
	.byte	W12
	.byte		N88	, Ds4, v096
	.byte	W84
	.byte	PEND
	.byte	W24
	.byte		N68	, Gs4, v108
	.byte	W72
	.byte	PATT	
		.word	song003_6_3
	.byte	W24
	.byte		N64	, Fn4, v100
	.byte	W72
	.byte	PATT	
		.word	song003_6_4
	.byte	W24
	.byte		N68	, Fn4, v108
	.byte	W72
	.byte	PATT	
		.word	song003_6_1
	.byte	W24
	.byte	GOTO	
		.word	song003_6_5
	.byte	FINE

	@********************** Track  7 **********************@

	.global song003_7
song003_7:	@ 0x0201BE84
	.byte	KEYSH	, 0
	.byte	VOICE	, 13
	.byte	VOL	, v082
	.byte	BENDR	, 12
	.byte	W48
	.byte		N03	, Fn2, v060
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn3, v056
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v052
	.byte	W06
	.byte			Fn5
	.byte	W06
song003_7_1:
	.byte		N03	, Fn5, v052
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v048
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v040
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte			Fn3, v036
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte	PEND
song003_7_2:
	.byte		N03	, Fn2, v032
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn2
	.byte	W36
	.byte			Fn2, v060
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn3, v056
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v052
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song003_7_1
	.byte		N03	, Fn2, v032
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn2
	.byte	W12
song003_7_5:
	.byte	W24
	.byte		N03	, Fn2, v060
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn3, v056
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v052
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte	PATT	
		.word	song003_7_1
	.byte	PATT	
		.word	song003_7_2
	.byte	PATT	
		.word	song003_7_1
	.byte	PATT	
		.word	song003_7_2
	.byte	PATT	
		.word	song003_7_1
	.byte		N03	, Fn2, v032
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn2
	.byte	W36
	.byte			Gs2, v052
	.byte	W06
	.byte			Gs3, v048
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs4, v044
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs4, v040
	.byte	W06
	.byte			Gs5
	.byte	W06
song003_7_3:
	.byte		N03	, Gs5, v040
	.byte	W06
	.byte			Gs3, v036
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs5, v032
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs3, v028
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs4, v024
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs5, v020
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs4, v016
	.byte	W06
	.byte			Gs5
	.byte	W06
	.byte	PEND
song003_7_4:
	.byte		N03	, Gs2, v016
	.byte	W06
	.byte			Gs4, v012
	.byte	W06
	.byte			Gs2
	.byte	W36
	.byte			Gs2, v052
	.byte	W06
	.byte			Gs3, v048
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs4, v044
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Gs4, v040
	.byte	W06
	.byte			Gs5
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song003_7_3
	.byte	PATT	
		.word	song003_7_4
	.byte	PATT	
		.word	song003_7_3
	.byte	PATT	
		.word	song003_7_4
	.byte	PATT	
		.word	song003_7_3
	.byte		N03	, Gs2, v016
	.byte	W06
	.byte			Gs4, v012
	.byte	W06
	.byte			Gs2
	.byte	W36
	.byte			Fn2, v052
	.byte	W06
	.byte			Fn3, v048
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn4, v044
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v040
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3, v036
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn5, v032
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn3, v028
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v024
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn5, v020
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn4, v016
	.byte	W06
	.byte			Fn5
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fn4, v012
	.byte	W06
	.byte			Fn2
	.byte	W12
	.byte	GOTO	
		.word	song003_7_5
	.byte	FINE

	.align 2
	.global song003
song003:	@ 0x0201BFEC
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song003_1		@ track
	.word	song003_2		@ track
	.word	song003_3		@ track
	.word	song003_4		@ track
	.word	song003_5		@ track
	.word	song003_6		@ track
	.word	song003_7		@ track
