	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0505_1
song0505_1:	@ 0x08C86A70
	.byte	KEYSH	, 0
	.byte	TEMPO	, 55
	.byte	VOICE	, 63
	.byte	VOL	, v098
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Fn2, v112
	.byte	W12
	.byte		N06	, Fs2, v108
	.byte	W06
	.byte			Gs2, v127
	.byte	W12
	.byte			As2, v120
	.byte	W12
	.byte		N30	, Bn2
	.byte	W30
	.byte		N12	, Bn2, v127
	.byte	W12
	.byte		N06	, Cs3, v116
	.byte	W06
	.byte			Dn3, v124
	.byte	W12
	.byte			En3, v100
	.byte	W12
	.byte		N30	, Fn3, v088
	.byte	W30
	.byte		N04	, Fs3, v108
	.byte	W06
	.byte		N96	
	.byte	W36
	.byte	W60
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0505_2
song0505_2:	@ 0x08C86AA6
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Cs3, v120
	.byte	W12
	.byte		N06	, Ds3, v116
	.byte	W06
	.byte			En3, v124
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N30	, Gn3, v116
	.byte	W30
	.byte		N12	, Gn3, v096
	.byte	W12
	.byte		N06	, An3, v108
	.byte	W06
	.byte			As3
	.byte	W12
	.byte			Cn4, v100
	.byte	W12
	.byte		N30	, Cs4
	.byte	W30
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0505_3
song0505_3:	@ 0x08C86AD1
	.byte	KEYSH	, 0
	.byte	VOICE	, 90
	.byte	VOL	, v091
	.byte	PAN	, c_v
	.byte	W08
	.byte		N66	, Cn3, v120
	.byte	W72
	.byte	W01
	.byte		N56	, Fn2
	.byte	W15
	.byte	W56
	.byte		N15	, Cn3, v127
	.byte	W16
	.byte		N13	, Gn2
	.byte	W16
	.byte		N12	, Cn3
	.byte	W08
	.byte	W08
	.byte		N14	, Gn2
	.byte	W15
	.byte		N15	, Cn3
	.byte	W17
	.byte			Gn2, v120
	.byte	W18
	.byte		N24	, Cn3, v127
	.byte	W24
	.byte	W03
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0505_4
song0505_4:	@ 0x08C86AFD
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v091
	.byte	PAN	, c_v
	.byte	W96
	.byte	W54
	.byte		N04	, Dn4, v108
	.byte	W06
	.byte		N96	
	.byte	W36
	.byte	W60
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0505_5
song0505_5:	@ 0x08C86B0F
	.byte	KEYSH	, 0
	.byte	VOICE	, 60
	.byte	VOL	, v096
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Gs2, v127
	.byte	W12
	.byte		N06	, As2, v092
	.byte	W06
	.byte			Bn2, v124
	.byte	W12
	.byte			Cs3, v116
	.byte	W12
	.byte		N30	, Dn3, v124
	.byte	W30
	.byte		N12	, Dn3, v112
	.byte	W12
	.byte		N06	, En3
	.byte	W06
	.byte			Fn3
	.byte	W12
	.byte			Gn3, v096
	.byte	W12
	.byte		N30	, Gs3, v088
	.byte	W30
	.byte		N04	, An3, v096
	.byte	W06
	.byte		N96	
	.byte	W36
	.byte	W60
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0505_6
song0505_6:	@ 0x08C86B42
	.byte	KEYSH	, 0
	.byte	VOICE	, 5
	.byte	VOL	, v099
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Cs3, v127
	.byte	W12
	.byte		N06	, Bn2, v124
	.byte	W06
	.byte			En2, v096
	.byte	W12
	.byte			Ds2, v127
	.byte	W12
	.byte		N30	, Dn2
	.byte	W30
	.byte		N12	, Gn2, v112
	.byte	W12
	.byte		N06	, Fs2
	.byte	W06
	.byte			Fn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N30	, Ds2
	.byte	W30
	.byte		N04	, Dn2, v124
	.byte	W06
	.byte		N96	
	.byte	W36
	.byte	W60
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0505_7
song0505_7:	@ 0x08C86B72
	.byte	KEYSH	, 0
	.byte	VOICE	, 6
	.byte	VOL	, v078
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Fn2, v112
	.byte	W12
	.byte		N04	, Fs2, v108
	.byte	W06
	.byte			Gs2, v127
	.byte	W12
	.byte			As2, v120
	.byte	W12
	.byte		N30	, Bn2
	.byte	W30
	.byte		N10	, Bn2, v127
	.byte	W12
	.byte		N04	, Cs3, v116
	.byte	W06
	.byte			Dn3, v124
	.byte	W12
	.byte			En3, v100
	.byte	W12
	.byte		N30	, Fn3, v088
	.byte	W30
	.byte		N03	, Fs5, v072
	.byte	W03
	.byte			Dn5, v092
	.byte	W03
	.byte			An4, v104
	.byte	W03
	.byte			Fs4, v096
	.byte	W03
	.byte			Dn4, v108
	.byte	W03
	.byte			An3, v104
	.byte	W03
	.byte			An4, v100
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Dn4, v104
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			Fs3, v100
	.byte	W03
	.byte			Dn3, v104
	.byte	W03
	.byte			An3, v100
	.byte	W03
	.byte			Fs3, v092
	.byte	W03
	.byte			Dn3, v116
	.byte	W03
	.byte			An2, v108
	.byte	W03
	.byte			Fs2, v104
	.byte	W03
	.byte		N09	, Dn2, v120
	.byte	W09
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0505_8
song0505_8:	@ 0x08C86BD5
	.byte	KEYSH	, 0
	.byte	VOICE	, 7
	.byte	VOL	, v078
	.byte	PAN	, c_v
	.byte	W06
	.byte		N12	, Cs3, v120
	.byte	W12
	.byte		N04	, Ds3, v116
	.byte	W06
	.byte			En3, v124
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N30	, Gn3, v116
	.byte	W30
	.byte		N10	, Gn3, v096
	.byte	W12
	.byte		N04	, An3, v108
	.byte	W06
	.byte			As3
	.byte	W12
	.byte			Cn4, v100
	.byte	W12
	.byte		N30	, Cs4
	.byte	W30
	.byte		N04	, Dn4, v108
	.byte	W06
	.byte		N96	
	.byte	W36
	.byte	W60
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0505_9
song0505_9:	@ 0x08C86C07
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	W06
	.byte		N72	, Bn1, v127
	.byte		N72	, Cn2
	.byte	W72
	.byte			Bn1
	.byte		N72	, Cn2
	.byte	W18
	.byte	W54
	.byte		N05	, As1
	.byte		N92	, Cn2
	.byte	W06
	.byte		N88	, Bn1, v112
	.byte	W36
	.byte	W56
	.byte	W02
	.byte		TIE	, As1, v127
	.byte		TIE	, Cn2
	.byte	W36
	.byte	W02
	.byte	W78
	.byte		EOT	, As1
	.byte			Cn2
	.byte	W01
	.byte	FINE

	.align 2
	.global song0505
song0505:	@ 0x08C86C34
	.byte	9		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song0505_1		@ track
	.word	song0505_2		@ track
	.word	song0505_3		@ track
	.word	song0505_4		@ track
	.word	song0505_5		@ track
	.word	song0505_6		@ track
	.word	song0505_7		@ track
	.word	song0505_8		@ track
	.word	song0505_9		@ track
