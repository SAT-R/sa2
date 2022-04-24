	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0408_1
song0408_1:	@ 0x08C85D98
	.byte	KEYSH	, 0
	.byte	TEMPO	, 50
	.byte	VOICE	, 127
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N05	, An1, v127
	.byte	W06
	.byte		N04	, Dn1, v076
	.byte		N05	, Gn1, v127
	.byte	W06
	.byte		N04	, Dn1, v076
	.byte		N08	, Fs1, v127
	.byte	W06
	.byte			Cn1
	.byte		N05	, Ds1, v076
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N02	
	.byte		N04	, Dn1, v076
	.byte	W06
	.byte		N05	, Ds1
	.byte		N84	, Cs2, v127
	.byte	W54
	.byte	W30
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0408_2
song0408_2:	@ 0x08C85DCB
	.byte	KEYSH	, 0
	.byte	VOICE	, 34
	.byte	MOD	, 0
	.byte	BENDR	, 0
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N04	, Cn1, v127
	.byte		N04	, En1
	.byte	W06
	.byte		N03	
	.byte		N04	, Gn1
	.byte	W06
	.byte		N04	
	.byte		N04	, Cn2
	.byte	W06
	.byte		N06	
	.byte		N06	, En2
	.byte	W12
	.byte		N03	, Gn1
	.byte		N04	, Cn2
	.byte	W06
	.byte		TIE	, Dn2
	.byte		TIE	, Fn2
	.byte	W54
	.byte	W48
	.byte	VOL	, v105
	.byte	W06
	.byte		v099
	.byte	W06
	.byte		v092
	.byte	W06
	.byte		v085
	.byte	W06
	.byte		v079
	.byte	W06
	.byte		v072
	.byte	W06
	.byte		v066
	.byte	W06
	.byte		v059
	.byte	W06
	.byte		v052
	.byte	W06
	.byte		v046
	.byte	W06
	.byte		v039
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v026
	.byte	W06
	.byte		v019
	.byte	W06
	.byte		v013
	.byte	W06
	.byte		v006
	.byte	W06
	.byte		EOT	, Dn2
	.byte			Fn2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0408_3
song0408_3:	@ 0x08C85E1A
	.byte	KEYSH	, 0
	.byte	VOICE	, 41
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N05	, En2, v120
	.byte	W06
	.byte			Gn2, v108
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N12	, En3, v127
	.byte	W12
	.byte		N05	, Cn3, v116
	.byte	W06
	.byte		TIE	, Fn3, v127
	.byte	W54
	.byte	W48
	.byte	VOL	, v105
	.byte	W06
	.byte		v099
	.byte	W06
	.byte		v092
	.byte	W06
	.byte		v085
	.byte	W06
	.byte		v079
	.byte	W06
	.byte		v072
	.byte	W06
	.byte		v066
	.byte	W06
	.byte		v059
	.byte	W06
	.byte		v052
	.byte	W06
	.byte		v046
	.byte	W06
	.byte		v039
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v026
	.byte	W06
	.byte		v019
	.byte	W06
	.byte		v013
	.byte	W06
	.byte		v006
	.byte	W06
	.byte		EOT	
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0408_4
song0408_4:	@ 0x08C85E5C
	.byte	KEYSH	, 0
	.byte	VOICE	, 105
	.byte	MOD	, 1
	.byte	BENDR	, 0
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N05	, Cn3, v088
	.byte	W06
	.byte			En3, v076
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N06	, Cn4, v096
	.byte	W12
	.byte		N05	, Gn3, v080
	.byte	W06
	.byte		N54	, As3, v048
	.byte	W36
	.byte		N02	, Fn6, v092
	.byte	W03
	.byte			As5
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Gn5, v080
	.byte	W03
	.byte			As5, v092
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gn5, v080
	.byte	W03
	.byte			Dn5, v092
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			As4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Gn4, v080
	.byte	W03
	.byte			As4, v092
	.byte	W03
	.byte			Fn4, v080
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Dn4, v092
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte			As3, v092
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	VOL	, v105
	.byte		N02	, Gn3, v080
	.byte	W03
	.byte			Dn3, v092
	.byte	W03
	.byte	VOL	, v099
	.byte		N02	, Fn3
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte	VOL	, v092
	.byte		N02	, Dn3, v092
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	VOL	, v085
	.byte		N02	, As2
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte	VOL	, v079
	.byte		N02	, Gn2, v080
	.byte	W03
	.byte			As2, v092
	.byte	W03
	.byte	VOL	, v072
	.byte		N02	, Gn2, v080
	.byte	W03
	.byte			As2, v092
	.byte	W03
	.byte	VOL	, v066
	.byte		N02	, Fn2, v080
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte	VOL	, v059
	.byte		N02	, Dn2, v092
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte	VOL	, v052
	.byte		N02	, As1
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte	VOL	, v046
	.byte		N02	, Gn1, v080
	.byte	W03
	.byte			As1, v092
	.byte	W03
	.byte	VOL	, v039
	.byte		N02	, Fn1
	.byte	W03
	.byte			Gn1, v080
	.byte	W03
	.byte	VOL	, v033
	.byte		N02	, Dn1, v092
	.byte	W03
	.byte			Fn1
	.byte	W03
	.byte	VOL	, v026
	.byte		N02	, Gn1, v080
	.byte	W03
	.byte			Dn1, v092
	.byte	W03
	.byte	VOL	, v019
	.byte		N02	, Fn1
	.byte	W03
	.byte			As0
	.byte	W03
	.byte	VOL	, v013
	.byte		N02	, Dn1
	.byte	W03
	.byte			Gn0, v080
	.byte	W03
	.byte	VOL	, v006
	.byte		N02	, As0, v092
	.byte	W02
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0408_5
song0408_5:	@ 0x08C85F37
	.byte	KEYSH	, 0
	.byte	VOICE	, 107
	.byte	MOD	, 1
	.byte	BENDR	, 0
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N06	, Cn2, v108
	.byte	W06
	.byte			Gn2, v104
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			En3, v096
	.byte	W06
	.byte			En2, v092
	.byte	W06
	.byte			Cn3, v096
	.byte	W06
	.byte		TIE	, Gn2, v116
	.byte	W54
	.byte	W48
	.byte	VOL	, v105
	.byte	W06
	.byte		v099
	.byte	W06
	.byte		v092
	.byte	W06
	.byte		v085
	.byte	W06
	.byte		v079
	.byte	W06
	.byte		v072
	.byte	W06
	.byte		v066
	.byte	W06
	.byte		v059
	.byte	W06
	.byte		v052
	.byte	W06
	.byte		v046
	.byte	W06
	.byte		v039
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v026
	.byte	W06
	.byte		v019
	.byte	W06
	.byte		v013
	.byte	W06
	.byte		v006
	.byte	W06
	.byte		EOT	
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0408_6
song0408_6:	@ 0x08C85F7F
	.byte	KEYSH	, 0
	.byte	VOICE	, 64
	.byte	MOD	, 1
	.byte	BENDR	, 0
	.byte	VOL	, v093
	.byte	PAN	, c_v
	.byte	W06
	.byte		N03	, En2, v120
	.byte	W06
	.byte			Gn2, v108
	.byte	W06
	.byte		N02	, Cn3
	.byte	W06
	.byte		N04	, En3, v127
	.byte	W12
	.byte		N02	, Cn3, v116
	.byte	W06
	.byte		N30	, Fn3, v127
	.byte	W30
	.byte		N02	, Fn6, v092
	.byte	W03
	.byte			As5
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Gn5, v080
	.byte	W03
	.byte			As5, v092
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gn5, v080
	.byte	W03
	.byte			Dn5, v092
	.byte	W03
	.byte	VOL	, v093
	.byte		N02	, Fn5
	.byte	W03
	.byte			As4
	.byte	W03
	.byte	VOL	, v087
	.byte		N02	, Dn5
	.byte	W03
	.byte			Gn4, v080
	.byte	W03
	.byte	VOL	, v081
	.byte		N02	, As4, v092
	.byte	W03
	.byte			Fn4, v080
	.byte	W03
	.byte	VOL	, v076
	.byte		N02	, Gn4
	.byte	W03
	.byte			Dn4, v092
	.byte	W03
	.byte	VOL	, v070
	.byte		N02	, Fn4
	.byte	W03
	.byte			As3
	.byte	W03
	.byte	VOL	, v064
	.byte		N02	, Dn4
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte	VOL	, v058
	.byte		N02	, As3, v092
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	VOL	, v052
	.byte		N02	, Gn3, v080
	.byte	W03
	.byte			Dn3, v092
	.byte	W03
	.byte	VOL	, v047
	.byte		N02	, Fn3
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte	VOL	, v041
	.byte		N02	, Dn3, v092
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	VOL	, v035
	.byte		N02	, As2
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte	VOL	, v029
	.byte		N02	, Gn2, v080
	.byte	W03
	.byte			As2, v092
	.byte	W03
	.byte	VOL	, v023
	.byte		N02	, Gn2, v080
	.byte	W03
	.byte			As2, v092
	.byte	W03
	.byte	VOL	, v018
	.byte		N02	, Fn2, v080
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte	VOL	, v012
	.byte		N02	, Dn2, v092
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte	VOL	, v006
	.byte		N02	, As1
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Gn1, v080
	.byte	W03
	.byte			As1, v092
	.byte	W03
	.byte			Fn1
	.byte	W03
	.byte			Gn1, v080
	.byte	W03
	.byte			Dn1, v092
	.byte	W03
	.byte			Fn1
	.byte	W03
	.byte			Gn1, v080
	.byte	W03
	.byte			Dn1, v092
	.byte	W03
	.byte			Fn1
	.byte	W03
	.byte			As0
	.byte	W03
	.byte			Dn1
	.byte	W03
	.byte			Gn0, v080
	.byte	W03
	.byte			As0, v092
	.byte	W02
	.byte	FINE

	.align 2
	.global song0408
song0408:	@ 0x08C8605C
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup013		@ voicegroup/tone

	.word	song0408_1		@ track
	.word	song0408_2		@ track
	.word	song0408_3		@ track
	.word	song0408_4		@ track
	.word	song0408_5		@ track
	.word	song0408_6		@ track
