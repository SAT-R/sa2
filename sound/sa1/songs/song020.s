	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song020_1
song020_1:	@ 0x087A954C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 67
	.byte	VOICE	, 38
	.byte	MOD	, 0
	.byte	VOL	, v042
	.byte	PAN	, c_v
	.byte	W24
song020_1_1:
	.byte		N06	, Dn3, v127
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Cs5
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song020_1_1
song020_1_2:
	.byte		N06	, Cn3, v127
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			En5
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Gn5
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song020_1_2
song020_1_3:
	.byte		N06	, Dn3, v127
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Dn4
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Dn5
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Fs5
	.byte	W06
	.byte			An5
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song020_1_3
song020_1_4:
	.byte		N06	, Cn3, v127
	.byte	W06
	.byte			Gn5
	.byte	W06
	.byte			En5
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Bn4
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En4
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song020_1_4
song020_1_5:
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_4
	.byte	PATT	
		mPtr	song020_1_4
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_4
	.byte	PATT	
		mPtr	song020_1_4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_4
	.byte	PATT	
		mPtr	song020_1_4
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
	.byte	PATT	
		mPtr	song020_1_1
	.byte	PATT	
		mPtr	song020_1_1
	.byte	PATT	
		mPtr	song020_1_2
	.byte	PATT	
		mPtr	song020_1_2
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_3
	.byte	PATT	
		mPtr	song020_1_4
	.byte	PATT	
		mPtr	song020_1_4
	.byte	GOTO	
		mPtr	song020_1_5
	.byte	FINE

	@********************** Track  2 **********************@

	.global song020_2
song020_2:	@ 0x087A9677
	.byte	KEYSH	, 0
	.byte	VOICE	, 39
	.byte	MOD	, 2
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song020_2_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Cs3, v112
	.byte	W36
	.byte		N60	, Dn3
	.byte	W60
	.byte	W96
	.byte		N78	, En3
	.byte	W84
	.byte		N06	
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	, An3, v088
	.byte	W96
	.byte			Cs4
	.byte	W96
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W90
	.byte		EOT	
	.byte	W06
	.byte		N92	, An3
	.byte	W96
	.byte			Cs4
	.byte	W96
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W90
	.byte		EOT	
	.byte	W06
	.byte		N92	, An3
	.byte	W96
	.byte			Cs4
	.byte	W96
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W90
	.byte		EOT	
	.byte	W06
	.byte		N92	, An3
	.byte	W96
	.byte			Cs4
	.byte	W96
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W90
	.byte		EOT	
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		mPtr	song020_2_1
	.byte	FINE

	@********************** Track  3 **********************@

	.global song020_3
song020_3:	@ 0x087A96DF
	.byte	KEYSH	, 0
	.byte	VOICE	, 40
	.byte	MOD	, 0
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	W02
	.byte		N02	, En3, v088
	.byte	W02
	.byte		N03	, Fn3
	.byte	W02
	.byte		N02	, Gn3
	.byte	W03
	.byte			An3
	.byte	W02
	.byte			Bn3
	.byte	W02
	.byte			Cn4
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			En4
	.byte	W03
	.byte		N01	, Fn4
	.byte	W02
song020_3_3:
	.byte		N32	, Fs4, v088
	.byte	W36
	.byte		N03	, En4
	.byte		N02	, Fn4
	.byte	W02
	.byte		N03	, Ds4
	.byte	W02
	.byte			Cs4
	.byte		N01	, Dn4
	.byte	W01
	.byte		N02	, Cn4
	.byte	W02
	.byte		N04	, Bn3
	.byte	W03
	.byte		N03	, An3
	.byte	W01
	.byte		N01	, As3
	.byte	W01
	.byte		N03	, Gn3
	.byte	W02
	.byte			Fn3
	.byte	W02
	.byte			En3
	.byte	W01
	.byte		N02	, Dn3
	.byte	W02
	.byte			Cn3
	.byte	W01
	.byte		N03	, Bn2
	.byte	W02
	.byte			An2
	.byte	W02
	.byte		N02	, Gn2, v004
	.byte	W36
	.byte	PEND
song020_3_4:
	.byte	W24
	.byte		N22	, Fs4, v088
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte		N19	
	.byte	W24
	.byte		N92	, Gn4
	.byte	W12
	.byte	PEND
song020_3_5:
	.byte	W84
	.byte		N03	, Fn4, v088
	.byte	W02
	.byte			En4
	.byte	W04
	.byte		N02	, Dn4
	.byte	W02
	.byte			Cn4
	.byte	W02
	.byte		N01	, Bn3
	.byte	W02
	.byte	PEND
song020_3_6:
	.byte	W01
	.byte		N01	, An3, v088
	.byte	W01
	.byte			Gn3
	.byte	W01
	.byte			Fn3
	.byte	W03
	.byte			En3, v004
	.byte	W66
	.byte		N02	, En3, v088
	.byte	W02
	.byte		N03	, Fn3
	.byte	W02
	.byte		N02	, Gn3
	.byte	W03
	.byte			An3
	.byte	W02
	.byte			Bn3
	.byte	W02
	.byte			Cn4
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			En4
	.byte	W03
	.byte		N01	, Fn4
	.byte	W02
	.byte			Gn4
	.byte	W02
	.byte	PEND
song020_3_7:
	.byte		N56	, Fs4, v088
	.byte	W54
	.byte	W01
	.byte		N06	, En4
	.byte	W01
	.byte		N07	, Dn4
	.byte	W03
	.byte		N06	, Cn4
	.byte	W03
	.byte		N05	, Bn3
	.byte	W02
	.byte		N04	, An3
	.byte	W02
	.byte			Gn3
	.byte	W02
	.byte			Fn3
	.byte	W01
	.byte		N03	, En3
	.byte	W03
	.byte		N02	, Dn3
	.byte	W02
	.byte			Cn3
	.byte	W01
	.byte		N01	, Bn2
	.byte	W02
	.byte			Gn2, v004
	.byte	W19
	.byte	PEND
song020_3_8:
	.byte	W24
	.byte		N13	, An4, v088
	.byte	W18
	.byte		N01	
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N20	
	.byte	W24
	.byte		N60	, Cn5
	.byte	W12
	.byte	PEND
	.byte	W96
	.byte	W96
song020_3_9:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N32	, An4, v108
	.byte	W24
	.byte	W12
	.byte		N36	, Fs4, v116
	.byte	W36
	.byte		N24	, Gn4
	.byte	W24
	.byte		N11	, Fs4, v104
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N68	, An4
	.byte	W96
	.byte	W12
	.byte		N14	, Gn5, v116
	.byte	W12
	.byte		N12	, Fs5, v092
	.byte	W12
	.byte		N13	, Dn5, v108
	.byte	W12
	.byte		N14	, Cs5, v092
	.byte	W12
	.byte		N12	, An4, v108
	.byte	W12
	.byte		N15	, Cs5
	.byte	W12
	.byte		N09	, An5
	.byte	W12
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N06	, An2, v127
	.byte	W06
	.byte			Bn2, v120
	.byte	W06
	.byte			Cs3, v124
	.byte	W06
	.byte			Bn2, v127
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte		N92	, Fs4, v112
	.byte	W96
	.byte			An4
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
	.byte	W01
	.byte		N22	, Cn5, v120
	.byte	W01
	.byte		EOT	, Gn4
	.byte	W23
	.byte		N20	, En4, v127
	.byte	W24
	.byte		N22	, Gn4, v120
	.byte	W24
	.byte		N19	, Cn4
	.byte	W23
song020_3_1:
	.byte		N92	, Fs4, v112
	.byte	W01
	.byte		N44	, Dn4, v108
	.byte	W92
	.byte	W03
	.byte	PEND
	.byte		N92	, An4, v112
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
song020_3_2:
	.byte	W01
	.byte		N22	, Cn5, v120
	.byte	W24
	.byte		N20	, En4, v127
	.byte	W24
	.byte	PEND
	.byte		EOT	, Gn4
	.byte		N42	, Gn4, v120
	.byte	W24
	.byte		N19	, Cn4
	.byte	W23
	.byte	PATT	
		mPtr	song020_3_1
	.byte		N92	, An4, v112
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
	.byte	PATT	
		mPtr	song020_3_2
	.byte		EOT	, Gn4
	.byte		N42	, Gn4, v120
	.byte	W24
	.byte		N19	, Cn4
	.byte	W23
	.byte	PATT	
		mPtr	song020_3_1
	.byte		N92	, An4, v112
	.byte	W96
	.byte			Gn4
	.byte	W96
	.byte		N48	, Dn5
	.byte	W48
	.byte		N24	, En5
	.byte	W24
	.byte	W02
	.byte		N02	, En3, v088
	.byte	W02
	.byte		N03	, Fn3
	.byte	W02
	.byte		N02	, Gn3
	.byte	W03
	.byte			An3
	.byte	W02
	.byte			Bn3
	.byte	W02
	.byte			Cn4
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			En4
	.byte	W03
	.byte		N01	, Fn4
	.byte	W02
	.byte	PATT	
		mPtr	song020_3_3
	.byte	PATT	
		mPtr	song020_3_4
	.byte	PATT	
		mPtr	song020_3_5
	.byte	PATT	
		mPtr	song020_3_6
	.byte	PATT	
		mPtr	song020_3_7
	.byte	PATT	
		mPtr	song020_3_8
	.byte	W96
	.byte	W96
	.byte	GOTO	
		mPtr	song020_3_9
	.byte	FINE

	@********************** Track  4 **********************@

	.global song020_4
song020_4:	@ 0x087A98B8
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v069
	.byte	PAN	, c_v
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song020_4_2:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Fs3, v127
	.byte		N32	, An3
	.byte	W36
	.byte		TIE	, Gn3
	.byte		TIE	, Bn3
	.byte	W60
	.byte	W96
	.byte		EOT	
	.byte		N72	, An3
	.byte		N72	, Cs4
	.byte	W01
	.byte		EOT	, Gn3
	.byte	W80
	.byte	W03
	.byte		N12	, An3
	.byte		N12	, Cs4
	.byte	W12
	.byte	W96
	.byte		TIE	, An4, v104
	.byte	W96
	.byte	W48
	.byte	W01
	.byte		EOT	
	.byte		N24	, Gn4
	.byte	W22
	.byte			Fs4, v096
	.byte	W24
	.byte	W01
	.byte			Gn4, v092
	.byte	W24
	.byte		N12	, Fs4, v100
	.byte	W11
	.byte		TIE	, En4, v104
	.byte	W60
	.byte	W01
	.byte	W84
	.byte		EOT	
	.byte	W12
	.byte		N92	, Dn4, v112
	.byte		N92	, Fs4
	.byte	W96
	.byte			En4
	.byte		N92	, An4
	.byte	W96
song020_4_1:
	.byte		TIE	, En4, v112
	.byte		TIE	, Gn4
	.byte	W96
	.byte	PEND
	.byte	W92
	.byte		EOT	, En4
	.byte			Gn4
	.byte	W04
	.byte		N92	, Dn4
	.byte		N92	, Fs4
	.byte	W96
	.byte			En4
	.byte		N92	, An4
	.byte	W96
	.byte	PATT	
		mPtr	song020_4_1
	.byte	W92
	.byte		EOT	, En4
	.byte			Gn4
	.byte	W04
	.byte		N92	, Dn4, v112
	.byte		N92	, Fs4
	.byte	W96
	.byte			En4
	.byte		N92	, An4
	.byte	W96
	.byte	PATT	
		mPtr	song020_4_1
	.byte	W92
	.byte		EOT	, En4
	.byte			Gn4
	.byte	W04
	.byte		N92	, Dn4, v112
	.byte		N92	, Fs4
	.byte	W96
	.byte			En4
	.byte		N92	, An4
	.byte	W96
	.byte	PATT	
		mPtr	song020_4_1
	.byte	W92
	.byte		EOT	, En4
	.byte			Gn4
	.byte	W04
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		mPtr	song020_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song020_5
song020_5:	@ 0x087A9969
	.byte	KEYSH	, 0
	.byte	VOICE	, 39
	.byte	PAN	, c_v
	.byte	VOL	, v094
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song020_5_1:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 62
	.byte	PAN	, c_v
	.byte	VOL	, v103
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N32	, An3, v108
	.byte	W24
	.byte	W12
	.byte		N36	, Fs3, v116
	.byte	W36
	.byte		N24	, Gn3
	.byte	W24
	.byte		N11	, Fs3, v104
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N68	, An3
	.byte	W96
	.byte	W12
	.byte		N14	, Gn4, v116
	.byte	W12
	.byte		N12	, Fs4, v092
	.byte	W12
	.byte		N13	, Dn4, v108
	.byte	W12
	.byte		N14	, Cs4, v092
	.byte	W12
	.byte		N12	, An3, v108
	.byte	W12
	.byte		N15	, Cs4
	.byte	W12
	.byte		N68	, An4
	.byte	W12
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		mPtr	song020_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song020_6
song020_6:	@ 0x087A99DB
	.byte	KEYSH	, 0
	.byte	VOICE	, 37
	.byte	VOL	, v096
	.byte	PAN	, c_v
	.byte	W24
song020_6_1:
	.byte		N03	, Dn2, v120
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte		N08	, Fs2
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N22	, Gn2
	.byte	W24
	.byte		N15	
	.byte	W12
	.byte		N19	, An2
	.byte	W24
	.byte	PEND
song020_6_2:
	.byte	W12
	.byte		N10	, Dn2, v120
	.byte	W12
	.byte		N17	, An2
	.byte	W18
	.byte		N03	, Dn2
	.byte	W06
	.byte		N09	, Fs2
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N21	, An2
	.byte	W24
	.byte	PEND
song020_6_3:
	.byte		N02	, Cn2, v120
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte		N10	, Gn2
	.byte	W12
	.byte		N04	, Cn2
	.byte	W06
	.byte		N24	, Bn2
	.byte	W24
	.byte		N14	, Cn3
	.byte	W12
	.byte		N36	, Gn2
	.byte	W24
	.byte	PEND
song020_6_4:
	.byte	W12
	.byte		N07	, Cn2, v120
	.byte	W12
	.byte		N16	, Gn2
	.byte	W18
	.byte		N03	, Cn2
	.byte	W06
	.byte		N05	, Cn3
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N11	, En3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte	PEND
song020_6_5:
	.byte		N03	, Dn2, v120
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte		N11	, Fs2
	.byte	W12
	.byte		N04	, Dn2
	.byte	W06
	.byte		N24	, Fs2
	.byte	W24
	.byte		N08	, An2
	.byte	W12
	.byte		N32	
	.byte	W24
	.byte	PEND
song020_6_6:
	.byte	W12
	.byte		N04	, Dn2, v120
	.byte	W12
	.byte		N18	, Fs2
	.byte	W18
	.byte		N03	, Dn2
	.byte	W06
	.byte		N07	, An2
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N12	, Dn3
	.byte	W12
	.byte		N11	, An2
	.byte	W12
	.byte	PEND
song020_6_7:
	.byte		N03	, Cn2, v120
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte		N14	, Gn2
	.byte	W12
	.byte		N04	, Cn2
	.byte	W06
	.byte		N24	, Fs2
	.byte	W24
	.byte		N23	, Gn2
	.byte	W24
	.byte		N08	
	.byte	W12
	.byte	PEND
song020_6_8:
	.byte	W12
	.byte		N04	, Cn2, v120
	.byte	W12
	.byte		N18	, Gn2
	.byte	W18
	.byte		N03	, Cn2
	.byte	W06
	.byte		N05	, Fs2
	.byte	W12
	.byte		N04	, Gn2
	.byte	W12
	.byte		N22	, Cn3
	.byte	W24
	.byte	PEND
song020_6_14:
	.byte	PATT	
		mPtr	song020_6_1
	.byte	PATT	
		mPtr	song020_6_2
	.byte	PATT	
		mPtr	song020_6_3
	.byte	PATT	
		mPtr	song020_6_4
	.byte	PATT	
		mPtr	song020_6_5
	.byte	PATT	
		mPtr	song020_6_6
	.byte	PATT	
		mPtr	song020_6_7
	.byte	PATT	
		mPtr	song020_6_8
	.byte		N32	, Fs2, v120
	.byte	W36
	.byte		N64	, Gn2
	.byte	W60
	.byte	W12
	.byte		N15	
	.byte	W12
	.byte		N17	, Dn3
	.byte	W18
	.byte		N05	, Gn2
	.byte	W06
	.byte		N10	, Gn3
	.byte	W12
	.byte		N20	
	.byte	W12
	.byte		N12	, Gn2
	.byte	W12
	.byte		N11	, Dn3
	.byte	W12
	.byte		N84	, An2
	.byte	W84
	.byte		N11	, Gn2
	.byte	W12
	.byte	W96
	.byte	PATT	
		mPtr	song020_6_1
	.byte	PATT	
		mPtr	song020_6_2
	.byte	PATT	
		mPtr	song020_6_3
	.byte	PATT	
		mPtr	song020_6_4
song020_6_9:
	.byte		N17	, Dn2, v120
	.byte	W18
	.byte			An2
	.byte	W18
	.byte		N23	, Dn3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N11	, Fs3
	.byte	W12
	.byte	PEND
song020_6_10:
	.byte		N17	, Dn2, v120
	.byte	W18
	.byte			An2
	.byte	W18
	.byte		N23	, Dn3
	.byte	W24
	.byte		N11	, Fs3
	.byte	W03
	.byte		N23	, Gn3
	.byte	W21
	.byte		N11	, Fs3
	.byte	W12
	.byte	PEND
song020_6_11:
	.byte		N17	, Cn2, v120
	.byte	W18
	.byte			Gn2
	.byte	W18
	.byte		N23	, Cn3
	.byte	W24
	.byte			Gn3
	.byte	W24
	.byte		N11	, Fs3
	.byte	W12
	.byte	PEND
song020_6_12:
	.byte		N17	, Cn2, v120
	.byte	W18
	.byte			Gn2
	.byte	W18
	.byte		N23	, Cn3
	.byte	W24
	.byte		N11	, Fn3
	.byte	W03
	.byte			Fs3
	.byte	W04
	.byte		N23	, Gn3
	.byte	W17
	.byte		N14	, Fs3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song020_6_9
	.byte	PATT	
		mPtr	song020_6_10
	.byte	PATT	
		mPtr	song020_6_11
song020_6_13:
	.byte		N17	, Cn2, v120
	.byte	W18
	.byte			Gn2
	.byte	W18
	.byte		N23	, Cn3
	.byte	W20
	.byte		N11	, Fn3
	.byte	W04
	.byte		N23	, Gn3
	.byte	W24
	.byte		N14	, Fs3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song020_6_9
	.byte	PATT	
		mPtr	song020_6_10
	.byte	PATT	
		mPtr	song020_6_11
	.byte	PATT	
		mPtr	song020_6_12
	.byte	PATT	
		mPtr	song020_6_9
	.byte	PATT	
		mPtr	song020_6_10
	.byte	PATT	
		mPtr	song020_6_11
	.byte	PATT	
		mPtr	song020_6_13
	.byte	PATT	
		mPtr	song020_6_1
	.byte	PATT	
		mPtr	song020_6_2
	.byte	PATT	
		mPtr	song020_6_3
	.byte	PATT	
		mPtr	song020_6_4
	.byte	PATT	
		mPtr	song020_6_5
	.byte	PATT	
		mPtr	song020_6_6
	.byte	PATT	
		mPtr	song020_6_7
	.byte	PATT	
		mPtr	song020_6_8
	.byte	GOTO	
		mPtr	song020_6_14
	.byte	FINE

	@********************** Track  7 **********************@

	.global song020_7
song020_7:	@ 0x087A9BAA
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v102
	.byte	W02
	.byte		N02	, En2, v120
	.byte	W02
	.byte		N03	, Fn2
	.byte	W02
	.byte		N02	, Gn2
	.byte	W03
	.byte			An2
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			En3
	.byte	W03
	.byte		N01	, Fn3
	.byte	W02
song020_7_1:
	.byte		N32	, Dn3, v120
	.byte		N32	, Fs3
	.byte	W36
	.byte		N03	, En3
	.byte		N02	, Fn3
	.byte	W02
	.byte		N03	, Ds3
	.byte	W02
	.byte			Cs3
	.byte		N01	, Dn3
	.byte	W01
	.byte		N02	, Cn3
	.byte	W02
	.byte		N04	, Bn2
	.byte	W03
	.byte		N03	, An2
	.byte	W01
	.byte		N01	, As2
	.byte	W01
	.byte		N03	, Gn2
	.byte	W02
	.byte			Fn2
	.byte	W02
	.byte			En2
	.byte	W01
	.byte		N02	, Dn2
	.byte	W02
	.byte			Cn2
	.byte	W01
	.byte		N03	, Bn1
	.byte	W02
	.byte			An1
	.byte	W02
	.byte		N02	, Gn1
	.byte	W36
	.byte	PEND
song020_7_2:
	.byte	W24
	.byte		N22	, Dn3, v120
	.byte		N22	, Fs3
	.byte	W24
	.byte		N08	, Dn3
	.byte		N08	, Fs3
	.byte	W12
	.byte		N19	, Dn3
	.byte		N19	, Fs3
	.byte	W24
	.byte		N92	, En3
	.byte		N92	, Gn3
	.byte	W12
	.byte	PEND
song020_7_3:
	.byte	W84
	.byte		N03	, Fn3, v120
	.byte	W02
	.byte			En3
	.byte	W04
	.byte		N02	, Dn3
	.byte	W02
	.byte			Cn3
	.byte	W02
	.byte		N01	, Bn2
	.byte	W02
	.byte	PEND
song020_7_4:
	.byte	W01
	.byte		N01	, An2, v120
	.byte	W01
	.byte			Gn2
	.byte	W01
	.byte			Fn2
	.byte	W03
	.byte			En2
	.byte	W66
	.byte		N02	
	.byte	W02
	.byte		N03	, Fn2
	.byte	W02
	.byte		N02	, Gn2
	.byte	W03
	.byte			An2
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			En3
	.byte	W03
	.byte		N01	, Fn3
	.byte	W02
	.byte			Gn3
	.byte	W02
	.byte	PEND
song020_7_5:
	.byte		N52	, Dn3, v120
	.byte		N56	, Fs3
	.byte	W54
	.byte	W01
	.byte		N06	, En3
	.byte	W01
	.byte		N07	, Dn3
	.byte	W03
	.byte		N06	, Cn3
	.byte	W03
	.byte		N05	, Bn2
	.byte	W02
	.byte		N04	, An2
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Fn2
	.byte	W01
	.byte		N03	, En2
	.byte	W03
	.byte		N02	, Dn2
	.byte	W02
	.byte			Cn2
	.byte	W01
	.byte		N01	, Bn1
	.byte	W02
	.byte			Gn1
	.byte	W19
	.byte	PEND
song020_7_6:
	.byte	W24
	.byte		N14	, Fs3, v120
	.byte		N13	, An3
	.byte	W18
	.byte		N01	, Fs3
	.byte		N01	, An3
	.byte	W06
	.byte		N11	, Fs3
	.byte		N11	, An3
	.byte	W12
	.byte		N19	, Fs3
	.byte		N20	, An3
	.byte	W24
	.byte		N60	, Gn3
	.byte		N60	, Cn4
	.byte	W12
	.byte	PEND
song020_7_7:
	.byte	W48
	.byte	W02
	.byte		N02	, Bn3, v120
	.byte	W02
	.byte			An3
	.byte	W01
	.byte			Gn3
	.byte	W02
	.byte			Fn3
	.byte	W02
	.byte		N01	, En3
	.byte	W02
	.byte			Dn3
	.byte	W01
	.byte			Cn3
	.byte	W01
	.byte			Bn2
	.byte	W02
	.byte			An2
	.byte	W01
	.byte			Gn2
	.byte	W01
	.byte			Fn2
	.byte	W01
	.byte			En2
	.byte	W30
	.byte	PEND
	.byte	W96
song020_7_8:
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N13	, Dn4, v076
	.byte		N13	, Gn4
	.byte	W18
	.byte		N01	, Dn4, v068
	.byte		N02	, Gn4, v076
	.byte	W06
	.byte		N06	, Dn4
	.byte		N07	, Gn4, v068
	.byte	W12
	.byte		N12	, Dn4
	.byte		N12	, Gn4, v076
	.byte	W24
	.byte		N44	, Dn4
	.byte		N44	, Fs4, v080
	.byte	W12
	.byte	W32
	.byte	W01
	.byte		N01	, Fn4, v056
	.byte	W01
	.byte		N04	, En4, v064
	.byte	W04
	.byte		N01	, Dn4, v072
	.byte	W02
	.byte			Cn4, v068
	.byte	W01
	.byte			Bn3, v064
	.byte	W02
	.byte			An3
	.byte	W02
	.byte			Gn3, v068
	.byte	W01
	.byte			Fn3
	.byte	W02
	.byte			En3, v036
	.byte	W48
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	W02
	.byte		N02	, En2, v120
	.byte	W02
	.byte		N03	, Fn2
	.byte	W02
	.byte		N02	, Gn2
	.byte	W03
	.byte			An2
	.byte	W02
	.byte			Bn2
	.byte	W02
	.byte			Cn3
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			En3
	.byte	W03
	.byte		N01	, Fn3
	.byte	W02
	.byte	PATT	
		mPtr	song020_7_1
	.byte	PATT	
		mPtr	song020_7_2
	.byte	PATT	
		mPtr	song020_7_3
	.byte	PATT	
		mPtr	song020_7_4
	.byte	PATT	
		mPtr	song020_7_5
	.byte	PATT	
		mPtr	song020_7_6
	.byte	PATT	
		mPtr	song020_7_7
	.byte	W96
	.byte	GOTO	
		mPtr	song020_7_8
	.byte	FINE

	@********************** Track  8 **********************@

	.global song020_8
song020_8:	@ 0x087A9D46
	.byte	KEYSH	, 0
	.byte	VOICE	, 63
	.byte	PAN	, c_v
	.byte	VOL	, v089
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song020_8_8:
	.byte		N32	, An3, v120
	.byte	W36
	.byte			Gn3
	.byte	W36
	.byte		N56	, Fs3
	.byte	W24
	.byte	W36
	.byte		N11	, Dn3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte		N23	, Dn3
	.byte	W24
	.byte		N32	, En3
	.byte	W36
	.byte			Bn3
	.byte	W36
	.byte		TIE	, Cn4
	.byte	W24
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N32	, An3
	.byte	W36
	.byte			Gn3
	.byte	W36
	.byte		N11	, Fs3
	.byte	W12
	.byte		N23	, Dn3
	.byte	W12
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N32	, Fs4
	.byte	W36
	.byte			Gn4
	.byte	W36
	.byte		N72	, En4
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N06	, An2, v127
	.byte	W06
	.byte			Bn2, v120
	.byte	W06
	.byte			Cs3, v124
	.byte	W06
	.byte			Bn2, v127
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			An3
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Cs4
	.byte	W06
song020_8_1:
	.byte		N32	, Dn3, v120
	.byte	W36
	.byte			An3
	.byte	W36
	.byte		N11	, Gn3
	.byte	W12
	.byte		N44	, Fs3
	.byte	W12
	.byte	PEND
song020_8_2:
	.byte	W36
	.byte		N32	, En3, v120
	.byte	W36
	.byte		N23	, Fs3
	.byte	W24
	.byte	PEND
song020_8_3:
	.byte		N32	, Gn3, v120
	.byte	W36
	.byte		N92	, Cn4
	.byte	W60
	.byte	PEND
song020_8_4:
	.byte	W36
	.byte		N32	, Gn4, v120
	.byte	W36
	.byte		N11	, Fs4
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte	PEND
song020_8_5:
	.byte		N32	, Dn3, v120
	.byte	W36
	.byte			An3
	.byte	W36
	.byte		N23	, Fs3
	.byte	W24
	.byte	PEND
song020_8_6:
	.byte		N44	, An3, v120
	.byte	W48
	.byte		N23	
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte	PEND
song020_8_7:
	.byte		N32	, Cn4, v120
	.byte	W36
	.byte			Gn4
	.byte	W36
	.byte		TIE	, En4
	.byte	W24
	.byte	PEND
	.byte	W78
	.byte	W01
	.byte		EOT	
	.byte	W17
	.byte	PATT	
		mPtr	song020_8_1
	.byte	PATT	
		mPtr	song020_8_2
	.byte	PATT	
		mPtr	song020_8_3
	.byte	PATT	
		mPtr	song020_8_4
	.byte	PATT	
		mPtr	song020_8_5
	.byte	PATT	
		mPtr	song020_8_6
	.byte	PATT	
		mPtr	song020_8_7
	.byte	W78
	.byte	W01
	.byte		EOT	, En4
	.byte	W17
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		mPtr	song020_8_8
	.byte	FINE

	@********************** Track  9 **********************@

	.global song020_9
song020_9:	@ 0x087A9E46
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	W24
song020_9_1:
	.byte		N05	, Cn1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N07	, Ds1, v048
	.byte	W06
	.byte		N17	, Cs1, v127
	.byte	W06
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N23	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N05	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W06
	.byte		N17	, Cs1, v127
	.byte	W06
	.byte	PEND
song020_9_2:
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N23	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N21	, Cs1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
song020_9_5:
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte		N17	, Cn1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte		N17	, Cs1, v127
	.byte	W06
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N23	, Cn1, v127
	.byte	W12
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte	W12
	.byte			Cs1
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N80	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte	W72
	.byte		N21	, Cs1, v127
	.byte	W24
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
song020_9_3:
	.byte		N17	, Cn1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte		N17	, Cs1, v127
	.byte	W06
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N23	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte	W12
	.byte		N23	, Cs1
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte	PEND
song020_9_4:
	.byte		N17	, Cn1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N07	, Ds1, v048
	.byte	W06
	.byte		N17	, Cs1, v127
	.byte	W06
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N23	, Cn1, v127
	.byte	W12
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N11	, Cn1, v127
	.byte		N07	, Ds1, v048
	.byte	W12
	.byte		N21	, Cs1, v127
	.byte		N04	, Dn1, v040
	.byte	W06
	.byte		N04	
	.byte	W18
	.byte	PEND
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_3
	.byte	PATT	
		mPtr	song020_9_4
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	PATT	
		mPtr	song020_9_1
	.byte	PATT	
		mPtr	song020_9_2
	.byte	GOTO	
		mPtr	song020_9_5
	.byte	FINE

	mAlignWord
	.global C_DECL(song020)
C_DECL(song020):	@ 0x087AA03C
	.byte	9		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

mAlignWord
	mPtr	voicegroup006		@ voicegroup/tone

	mPtr	song020_1		@ track
	mPtr	song020_2		@ track
	mPtr	song020_3		@ track
	mPtr	song020_4		@ track
	mPtr	song020_5		@ track
	mPtr	song020_6		@ track
	mPtr	song020_7		@ track
	mPtr	song020_8		@ track
	mPtr	song020_9		@ track
