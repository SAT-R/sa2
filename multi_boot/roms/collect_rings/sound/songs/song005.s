	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song005_1
song005_1:	@ 0x0201C224
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 127
	.byte	VOL	, v105
	.byte		N11	, Ds1, v100
	.byte		N06	, Ds2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v100
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N11	, Ds1, v100
	.byte		N06	, Ds2, v127
	.byte	W12
	.byte			Dn1, v100
	.byte		N06	, En2, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte		N28	, Ds1
	.byte		N06	, Ds2
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			Dn1, v060
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte			Ds2, v127
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Ds2, v127
	.byte	W06
	.byte			Dn1, v036
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v060
	.byte	W06
	.byte			Ds2, v127
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte			Ds2, v127
	.byte	W06
	.byte			Dn1, v060
	.byte		N06	, En2, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte			Ds2, v127
	.byte	W06
	.byte			Dn1, v060
	.byte		N06	, En2, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Dn1, v036
	.byte	W12
	.byte		N05	, Ds1, v100
	.byte		N06	, Ds2, v127
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte			En2, v127
	.byte	W06
	.byte		N32	, Ds1
	.byte		N06	, Ds2
	.byte	W32
	.byte	W03
	.byte	FINE

	@********************** Track  2 **********************@

	.global song005_2
song005_2:	@ 0x0201C2A6
	.byte	KEYSH	, 0
	.byte	VOICE	, 90
	.byte	VOL	, v105
	.byte		N17	, Bn2, v127
	.byte	W18
	.byte		N23	, Dn3
	.byte	W24
	.byte		N40	, Cs3
	.byte	W42
	.byte		N05	, Cs3, v112
	.byte	W06
	.byte			Gs2, v100
	.byte	W06
	.byte		N44	, Cs2, v116
	.byte	W48
	.byte		N23	, Cs3, v120
	.byte	W24
	.byte			Cs2, v112
	.byte	W24
	.byte		N06	, Cs3
	.byte	W12
	.byte		N05	, Cs3, v096
	.byte	W06
	.byte		TIE	, Ds3, v124
	.byte	W78
	.byte	W24
	.byte	W02
	.byte		EOT	
	.byte	FINE

	@********************** Track  3 **********************@

	.global song005_3
song005_3:	@ 0x0201C2D7
	.byte	KEYSH	, 0
	.byte	VOICE	, 100
	.byte	VOL	, v074
	.byte	BENDR	, 59
	.byte		N17	, An3, v072
	.byte	W18
	.byte		N23	, Cn4, v080
	.byte	W24
	.byte		TIE	, Bn3, v076
	.byte	W15
	.byte	VOL	, v062
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v032
	.byte	W06
	.byte		v033
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v053
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v056
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v062
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v066
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v068
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v071
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v072
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		N08	, Bn3, v088
	.byte	W12
	.byte		N05	, Bn3, v068
	.byte	W06
	.byte		TIE	, Cs4
	.byte	W66
	.byte	VOL	, v071
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v015
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v007
	.byte	W03
	.byte		v004
	.byte	W03
	.byte		v000
	.byte	FINE

	@********************** Track  4 **********************@

	.global song005_4
song005_4:	@ 0x0201C37C
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	VOL	, v074
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte		N17	, Cs3, v072
	.byte	W18
	.byte		N23	, En3, v080
	.byte	W24
	.byte		TIE	, Ds3, v076
	.byte	W15
	.byte	VOL	, v062
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v032
	.byte	W06
	.byte		v033
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v053
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v056
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v062
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v066
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v068
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v071
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v072
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		N08	, Ds3, v088
	.byte	W12
	.byte		N05	, Ds3, v068
	.byte	W06
	.byte		TIE	, Fn3
	.byte	W66
	.byte	VOL	, v071
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v015
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v007
	.byte	W03
	.byte		v004
	.byte	W03
	.byte		v000
	.byte	FINE

	@********************** Track  5 **********************@

	.global song005_5
song005_5:	@ 0x0201C425
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	VOL	, v074
	.byte		N17	, En3, v072
	.byte	W18
	.byte		N23	, Gn3, v080
	.byte	W24
	.byte		TIE	, Fs3, v076
	.byte	W15
	.byte	VOL	, v062
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v032
	.byte	W06
	.byte		v033
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v053
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v056
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v062
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v066
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v068
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v071
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v072
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		N08	, Fs3, v088
	.byte	W12
	.byte		N05	, Fs3, v068
	.byte	W06
	.byte		TIE	, Gs3
	.byte	W66
	.byte	VOL	, v071
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v015
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v007
	.byte	W03
	.byte		v004
	.byte	W03
	.byte		v000
	.byte	FINE

	@********************** Track  6 **********************@

	.global song005_6
song005_6:	@ 0x0201C4C8
	.byte	KEYSH	, 0
	.byte	VOICE	, 91
	.byte	VOL	, v082
	.byte	BENDR	, 12
	.byte	MOD	, 3
	.byte		N17	, Cs4, v112
	.byte	W18
	.byte		N23	, En4, v120
	.byte	W24
	.byte		TIE	, Ds4, v116
	.byte	W54
	.byte	W88
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		N08	, Ds4, v127
	.byte	W12
	.byte		N05	, Ds4, v108
	.byte	W06
	.byte		TIE	, Fn4
	.byte	W78
	.byte	W32
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	FINE

	@********************** Track  7 **********************@

	.global song005_7
song005_7:	@ 0x0201C4F2
	.byte	KEYSH	, 0
	.byte	VOICE	, 99
	.byte	VOL	, v074
	.byte	BENDR	, 12
	.byte		N17	, An3, v112
	.byte	W18
	.byte		N23	, Cn4, v120
	.byte	W24
	.byte		N28	, Bn3, v116
	.byte	W30
	.byte		N03	, Fs2, v036
	.byte	W03
	.byte			Bn2
	.byte	W03
	.byte			Cs3, v040
	.byte	W03
	.byte			Ds3, v044
	.byte	W03
	.byte			Fs3, v048
	.byte	W03
	.byte			Bn3, v052
	.byte	W03
	.byte			Cs4, v056
	.byte	W03
	.byte			Ds4, v060
	.byte	W03
	.byte			Fs4, v064
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Cs5, v068
	.byte	W03
	.byte			Ds5, v072
	.byte	W03
	.byte			Fs5, v076
	.byte	W03
	.byte			Bn5, v080
	.byte	W03
	.byte			Fs5, v068
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5, v064
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Ds5, v060
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Bn4, v056
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Bn3, v052
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Fs4, v048
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4, v044
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			Ds4, v040
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Bn3, v036
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Bn2, v032
	.byte	W03
	.byte			Fs2
	.byte	W03
	.byte			Ds2, v028
	.byte	W03
	.byte			Bn1
	.byte	W03
	.byte		N08	, Bn3, v108
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		TIE	, Cs4
	.byte	W78
	.byte	W32
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	FINE

	.align 2
	.global song005
song005:	@ 0x0201C57C
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song005_1		@ track
	.word	song005_2		@ track
	.word	song005_3		@ track
	.word	song005_4		@ track
	.word	song005_5		@ track
	.word	song005_6		@ track
	.word	song005_7		@ track
