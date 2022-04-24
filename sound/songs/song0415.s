	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0415_1
song0415_1:	@ 0x08C86618
	.byte	KEYSH	, 0
	.byte	TEMPO	, 40
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
	.byte	TEMPO	, 38
	.byte			Cn1
	.byte		N05	, Ds1, v076
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte	TEMPO	, 36
	.byte		N02	
	.byte		N04	, Dn1, v076
	.byte	W06
	.byte		N05	, Ds1
	.byte	W06
	.byte		N84	, Cs2, v127
	.byte	W48
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0415_2
song0415_2:	@ 0x08C86650
	.byte	KEYSH	, 0
	.byte	VOICE	, 86
	.byte	MOD	, 0
	.byte	BENDR	, 0
	.byte	VOL	, v105
	.byte	PAN	, c_v
	.byte	W06
	.byte		N05	, Cn2, v127
	.byte		N04	, En2
	.byte	W06
	.byte		N05	
	.byte		N04	, Gn2
	.byte	W06
	.byte		N05	
	.byte		N04	, Cn3
	.byte	W06
	.byte		N05	
	.byte		N05	, En3
	.byte	W12
	.byte		N09	, Gn2
	.byte		N09	, Cn3
	.byte	W12
	.byte	VOL	, v037
	.byte		TIE	, Ds2
	.byte		TIE	, Fs3
	.byte	W06
	.byte	VOL	, v042
	.byte	W06
	.byte		v047
	.byte	W06
	.byte		v052
	.byte	W06
	.byte		v057
	.byte	W06
	.byte		v062
	.byte	W06
	.byte		v066
	.byte	W06
	.byte		v071
	.byte	W06
	.byte		v076
	.byte	W06
	.byte		v081
	.byte	W06
	.byte		v085
	.byte	W06
	.byte		v090
	.byte	W06
	.byte		v095
	.byte	W24
	.byte		v105
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
	.byte		v006
	.byte	W06
	.byte		v000
	.byte	W30
	.byte		EOT	, Ds2
	.byte			Fs3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0415_3
song0415_3:	@ 0x08C866B8
	.byte	KEYSH	, 0
	.byte	VOICE	, 41
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	W06
	.byte		N05	, Gn2, v120
	.byte	W06
	.byte			Cn3, v108
	.byte	W06
	.byte			En3
	.byte	W06
	.byte		N07	, Gn3, v127
	.byte	W12
	.byte		N08	, En3, v116
	.byte	W12
	.byte		TIE	, An3, v127
	.byte	W48
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
	.byte		v006
	.byte	W06
	.byte		v000
	.byte	W30
	.byte		EOT	
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0415_4
song0415_4:	@ 0x08C866FA
	.byte	KEYSH	, 0
	.byte	VOICE	, 105
	.byte	MOD	, 0
	.byte	BENDR	, 0
	.byte	VOL	, v095
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
	.byte		N08	, Gn3, v080
	.byte	W12
	.byte		N54	, Fs3, v048
	.byte	W28
	.byte		N02	, Fs6, v092
	.byte	W03
	.byte			Cn6
	.byte	W03
	.byte			Ds6
	.byte	W03
	.byte			An5, v080
	.byte	W03
	.byte			Cn6, v092
	.byte	W03
	.byte			Fs5
	.byte	W03
	.byte			An5, v080
	.byte	W02
	.byte	W01
	.byte			Ds5, v092
	.byte	W03
	.byte			Fs5
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			An4, v080
	.byte	W03
	.byte			Cn5, v092
	.byte	W03
	.byte			Fs4, v080
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Ds4, v092
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			An3, v080
	.byte	W03
	.byte			Cn4, v092
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			An3, v080
	.byte	W02
	.byte	VOL	, v105
	.byte	W01
	.byte		N02	, Ds3, v092
	.byte	W03
	.byte			Fs3
	.byte	W02
	.byte	VOL	, v099
	.byte	W01
	.byte		N02	, An3, v080
	.byte	W03
	.byte			Ds3, v092
	.byte	W02
	.byte	VOL	, v092
	.byte	W01
	.byte		N02	, Fs3
	.byte	W03
	.byte			Cn3
	.byte	W02
	.byte	VOL	, v085
	.byte	W01
	.byte		N02	, Ds3
	.byte	W03
	.byte			An2, v080
	.byte	W02
	.byte	VOL	, v079
	.byte	W01
	.byte		N02	, Cn3, v092
	.byte	W03
	.byte			An2, v080
	.byte	W02
	.byte	VOL	, v072
	.byte	W01
	.byte		N02	, Cn3, v092
	.byte	W03
	.byte			Fs2, v080
	.byte	W02
	.byte	VOL	, v066
	.byte	W01
	.byte		N02	, An2
	.byte	W03
	.byte			Ds2, v092
	.byte	W02
	.byte	VOL	, v059
	.byte	W01
	.byte		N02	, Fs2
	.byte	W03
	.byte			Cn2
	.byte	W02
	.byte	VOL	, v052
	.byte	W01
	.byte		N02	, Ds2
	.byte	W03
	.byte			An1, v080
	.byte	W02
	.byte	VOL	, v046
	.byte	W01
	.byte		N02	, Cn2, v092
	.byte	W03
	.byte			Fs1
	.byte	W02
	.byte	VOL	, v039
	.byte	W01
	.byte		N02	, An1, v080
	.byte	W03
	.byte			Ds1, v092
	.byte	W02
	.byte	VOL	, v033
	.byte	W01
	.byte		N02	, Fs1
	.byte	W03
	.byte			An1, v080
	.byte	W02
	.byte	VOL	, v026
	.byte	W01
	.byte		N02	, Ds1, v092
	.byte	W03
	.byte			Fs1
	.byte	W02
	.byte	VOL	, v019
	.byte	W01
	.byte		N02	, Cn1
	.byte	W03
	.byte			Ds1
	.byte	W02
	.byte	VOL	, v006
	.byte	W01
	.byte		N02	, An0, v080
	.byte	W03
	.byte			Cn1, v092
	.byte	W02
	.byte	VOL	, v000
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0415_5
song0415_5:	@ 0x08C867E4
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
	.byte		N09	, Cn3, v096
	.byte	W12
	.byte		TIE	, An2, v116
	.byte	W48
	.byte	W48
	.byte	VOL	, v089
	.byte	W06
	.byte		v083
	.byte	W06
	.byte		v076
	.byte	W06
	.byte		v070
	.byte	W06
	.byte		v064
	.byte	W06
	.byte		v057
	.byte	W06
	.byte		v051
	.byte	W06
	.byte		v044
	.byte	W06
	.byte		v038
	.byte	W06
	.byte		v032
	.byte	W06
	.byte		v025
	.byte	W06
	.byte		v019
	.byte	W06
	.byte		v013
	.byte	W06
	.byte		v006
	.byte	W06
	.byte		v005
	.byte	W36
	.byte		EOT	
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0415_6
song0415_6:	@ 0x08C8682B
	.byte	KEYSH	, 0
	.byte	VOICE	, 64
	.byte	MOD	, 0
	.byte	BENDR	, 0
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	W72
	.byte		N02	, Fs5, v127
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			An4, v124
	.byte	W03
	.byte			Cn5, v127
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			An4, v124
	.byte	W03
	.byte			Ds4, v127
	.byte	W03
	.byte	VOL	, v093
	.byte		N02	, Fs4
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte	VOL	, v087
	.byte		N02	, Ds4
	.byte	W03
	.byte			An3, v124
	.byte	W03
	.byte	VOL	, v081
	.byte		N02	, Cn4, v127
	.byte	W03
	.byte			Fs3, v124
	.byte	W03
	.byte	VOL	, v076
	.byte		N02	, An3
	.byte	W03
	.byte			Ds3, v127
	.byte	W03
	.byte	VOL	, v070
	.byte		N02	, Fs3
	.byte	W03
	.byte			Cn3
	.byte	W03
	.byte	VOL	, v064
	.byte		N02	, Ds3
	.byte	W03
	.byte			An2, v124
	.byte	W03
	.byte	VOL	, v058
	.byte		N02	, Cn3, v127
	.byte	W03
	.byte			Fs2
	.byte	W03
	.byte	VOL	, v052
	.byte		N02	, An2, v124
	.byte	W03
	.byte			Ds2, v127
	.byte	W03
	.byte	VOL	, v047
	.byte		N02	, Fs2
	.byte	W03
	.byte			An2, v124
	.byte	W03
	.byte	VOL	, v041
	.byte		N02	, Ds2, v127
	.byte	W03
	.byte			Fs2
	.byte	W03
	.byte	VOL	, v035
	.byte		N02	, Cn2
	.byte	W03
	.byte			Ds2
	.byte	W03
	.byte	VOL	, v029
	.byte		N02	, An1, v124
	.byte	W03
	.byte			Cn2, v127
	.byte	W03
	.byte	VOL	, v023
	.byte		N02	, An1, v124
	.byte	W03
	.byte			Cn2, v127
	.byte	W03
	.byte	VOL	, v018
	.byte		N02	, Fs1, v124
	.byte	W03
	.byte			An1
	.byte	W03
	.byte	VOL	, v012
	.byte		N02	, Ds1, v127
	.byte	W03
	.byte			Fs1
	.byte	W03
	.byte	VOL	, v006
	.byte		N02	, Cn1
	.byte	W03
	.byte			Ds1
	.byte	W03
	.byte			An0, v124
	.byte	W03
	.byte			Cn1, v127
	.byte	W03
	.byte			Fs0
	.byte	W03
	.byte			An0, v124
	.byte	W03
	.byte			Ds0, v127
	.byte	W03
	.byte			Fs0
	.byte	W03
	.byte			An0, v124
	.byte	W03
	.byte			Ds0, v127
	.byte	W03
	.byte			Fs0
	.byte	W03
	.byte			Cn0
	.byte	W03
	.byte			Ds0
	.byte	W03
	.byte			AnM1, v124
	.byte	W03
	.byte	VOL	, v006
	.byte		N02	, Cn0, v127
	.byte	W06
	.byte	VOL	, v000
	.byte	FINE

	.align 2
	.global song0415
song0415:	@ 0x08C868F8
	.byte	6		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup013		@ voicegroup/tone

	.word	song0415_1		@ track
	.word	song0415_2		@ track
	.word	song0415_3		@ track
	.word	song0415_4		@ track
	.word	song0415_5		@ track
	.word	song0415_6		@ track
