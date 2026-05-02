	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song030_1
song030_1:	@ 0x087B0834
	.byte	KEYSH	, 0
	.byte	TEMPO	, 80
	.byte	VOICE	, 89
	.byte	VOL	, v099
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W12
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song030_1_1:
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte		N06	
	.byte	W12
song030_1_4:
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song030_1_2:
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song030_1_2
	.byte	PATT	
		mPtr	song030_1_2
	.byte	PATT	
		mPtr	song030_1_2
	.byte	PATT	
		mPtr	song030_1_2
	.byte	PATT	
		mPtr	song030_1_2
	.byte	PATT	
		mPtr	song030_1_2
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte	PATT	
		mPtr	song030_1_1
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
song030_1_3:
	.byte		N06	, Ds2, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song030_1_3
	.byte	PATT	
		mPtr	song030_1_3
	.byte		N06	, Ds2, v127
	.byte	W12
	.byte		N12	, Fn2, v124
	.byte	W36
	.byte		N12	
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte	PATT	
		mPtr	song030_1_1
	.byte		N06	, Bn1, v127
	.byte	W12
	.byte	GOTO	
		mPtr	song030_1_4
	.byte	FINE

	@********************** Track  2 **********************@

	.global song030_2
song030_2:	@ 0x087B097E
	.byte	KEYSH	, 0
	.byte	VOICE	, 95
	.byte	VOL	, v081
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W96
	.byte	W96
	.byte	W12
song030_2_2:
	.byte	W84
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W15
	.byte	VOL	, v076
	.byte	W80
	.byte	W01
	.byte	W06
	.byte		N06	, Gn2, v127
	.byte		N06	, Cn3
	.byte		N07	, Fn3
	.byte	W24
	.byte			Gn2
	.byte		N07	, Cn3
	.byte		N08	, Fn3
	.byte	W12
	.byte		N28	, Gs2
	.byte		N28	, Cs3
	.byte		N30	, Fs3
	.byte	W36
	.byte		N05	, Gn2
	.byte		N04	, Cn3
	.byte		N07	, Fn3
	.byte	W18
	.byte	W06
	.byte		N08	, Gn2
	.byte		N07	, Cn3
	.byte		N09	, Fn3
	.byte	W12
	.byte		N32	, Fs2
	.byte		N30	, Bn2
	.byte		N32	, En3
	.byte	W54
	.byte		N05	, Fs2
	.byte		N04	, Bn2
	.byte		N09	, En3
	.byte	W24
	.byte		N04	, Fs2
	.byte		N06	, Bn2
	.byte		N10	, En3
	.byte	W12
	.byte		N08	, Gn2
	.byte		N08	, Cn3
	.byte		N11	, Fn3
	.byte	W24
	.byte		N07	, Gn2
	.byte		N10	, Cn3
	.byte		N11	, Fn3
	.byte	W12
	.byte		N08	, Fs2
	.byte		N09	, Bn2
	.byte		N10	, En3
	.byte	W24
	.byte		N06	, Fs2
	.byte		N08	, Bn2
	.byte		N07	, En3
	.byte	W12
	.byte		TIE	, Fn2
	.byte		TIE	, As2
	.byte		TIE	, Ds3
	.byte	W12
	.byte	W12
	.byte	VOL	, v076
	.byte	W06
	.byte		v075
	.byte	W04
	.byte		v074
	.byte	W03
	.byte		v073
	.byte	W03
	.byte		v072
	.byte	W04
	.byte		v071
	.byte	W03
	.byte		v070
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v068
	.byte	W04
	.byte		v067
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v066
	.byte	W04
	.byte		v065
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v063
	.byte	W04
	.byte		v062
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v059
	.byte	W04
	.byte		v058
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v057
	.byte	W04
	.byte		v056
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v054
	.byte	W02
	.byte	W02
	.byte		v053
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v050
	.byte	W04
	.byte		v049
	.byte	W03
	.byte		v048
	.byte	W03
	.byte		v047
	.byte	W04
	.byte		v047
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v045
	.byte	W04
	.byte		v044
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W08
	.byte		v039
	.byte	W04
	.byte		v038
	.byte	W04
	.byte		v038
	.byte	W04
	.byte		v037
	.byte	W04
	.byte		v036
	.byte	W05
	.byte		v035
	.byte	W04
	.byte		v034
	.byte	W04
	.byte		v033
	.byte	W04
	.byte		v032
	.byte	W04
	.byte		v031
	.byte	W04
	.byte		v030
	.byte	W02
	.byte		EOT	, Fn2
	.byte	W02
	.byte	VOL	, v029
	.byte	W01
	.byte		EOT	, As2
	.byte	W02
	.byte			Ds3
	.byte	W01
	.byte	VOL	, v028
	.byte	W05
	.byte		v028
	.byte	W04
	.byte		v027
	.byte	W04
	.byte		v026
	.byte	W04
	.byte		v025
	.byte	W04
	.byte		v024
	.byte	W04
	.byte		v023
	.byte	W04
	.byte		v022
	.byte	W04
	.byte		v021
	.byte	W05
	.byte		v020
	.byte	W04
	.byte		v019
	.byte	W04
	.byte		v019
	.byte	W04
	.byte		v018
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		v016
	.byte	W04
	.byte		v015
	.byte	W04
	.byte		v014
	.byte	W05
	.byte		v013
	.byte	W04
	.byte		v012
	.byte	W04
	.byte		v011
	.byte	W04
	.byte		v010
	.byte	W04
	.byte		v009
	.byte	W03
	.byte	W01
	.byte		v009
	.byte	W04
	.byte		v008
	.byte	W04
	.byte		v007
	.byte	W05
	.byte		v006
	.byte	W04
	.byte		v005
	.byte	W04
	.byte		v004
	.byte	W04
	.byte		v003
	.byte	W04
	.byte		v002
	.byte	W04
	.byte		v001
	.byte	W04
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W56
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		v081
	.byte	W84
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N07	, An2, v116
	.byte		N07	, Dn3
	.byte		N07	, Gn3
	.byte	W12
	.byte	W12
	.byte		N11	, An2, v124
	.byte		N11	, Dn3
	.byte		N11	, Gn3
	.byte	W12
	.byte		N20	, As2, v120
	.byte		N20	, Ds3
	.byte		N20	, Gs3
	.byte	W24
	.byte		N11	, Cs3, v112
	.byte		N11	, Fs3
	.byte		N11	, Bn3
	.byte	W12
	.byte			Cn3, v127
	.byte		N11	, Fn3
	.byte		N11	, As3
	.byte	W12
	.byte			As2, v120
	.byte		N11	, Ds3
	.byte		N11	, Gs3
	.byte	W12
	.byte		N07	, An2, v116
	.byte		N07	, Dn3
	.byte		N07	, Gn3
	.byte	W12
	.byte	W12
	.byte		N11	, An2
	.byte		N11	, Dn3
	.byte		N11	, Gn3
	.byte	W12
	.byte		N24	, As2, v127
	.byte		N24	, Ds3
	.byte		N24	, Gs3
	.byte	W36
	.byte		N10	, Cn3
	.byte		N10	, Fn3
	.byte		N10	, As3
	.byte	W24
	.byte		N11	, Cn3, v116
	.byte		N11	, Fn3
	.byte		N11	, As3
	.byte	W12
	.byte		N24	, Cs3, v120
	.byte		N24	, Fs3
	.byte	W36
	.byte		N32	, Ds3, v127
	.byte		N32	, Gs3
	.byte	W36
	.byte			En3
	.byte		N32	, An3
	.byte	W24
	.byte	W12
	.byte	VOL	, v115
	.byte	W60
	.byte		N84	, Gs2
	.byte		N84	, Dn3
	.byte		N84	, Gn3
	.byte	W08
	.byte	VOL	, v115
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
song030_2_1:
	.byte	VOL	, v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v104
	.byte	W08
	.byte		v105
	.byte	W04
	.byte		v105
	.byte	W04
	.byte		v106
	.byte	W04
	.byte		v107
	.byte	W04
	.byte		v108
	.byte	W04
	.byte		v109
	.byte	W05
	.byte		v110
	.byte	W04
	.byte		v111
	.byte	W02
	.byte	PEND
	.byte	W02
	.byte		v112
	.byte	W04
	.byte		v113
	.byte	W04
	.byte		v115
	.byte	W02
	.byte		N96	, Fn2, v127
	.byte		N96	, Bn2
	.byte		N96	, En3
	.byte	W10
	.byte	VOL	, v115
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v100
	.byte	W02
	.byte	W04
	.byte		v101
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v103
	.byte	W02
	.byte		v115
	.byte	W60
	.byte		N84	, An2
	.byte		N84	, Ds3
	.byte		N84	, Gs3
	.byte	W08
	.byte	VOL	, v115
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte	PATT	
		mPtr	song030_2_1
	.byte	W02
	.byte	VOL	, v112
	.byte	W04
	.byte		v113
	.byte	W04
	.byte		v115
	.byte	W12
	.byte		v115
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v100
	.byte	W02
	.byte	W04
	.byte		v101
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v103
	.byte	W84
	.byte	W02
	.byte	W96
	.byte	W12
	.byte	GOTO	
		mPtr	song030_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song030_3
song030_3:	@ 0x087B0D48
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W12
	.byte		N12	, Ds1, v044
	.byte		N96	, Cn2, v116
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
song030_3_1:
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v036
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte	PEND
	.byte		N12	, Ds1
	.byte	W12
song030_3_8:
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1
	.byte	W06
song030_3_2:
	.byte	W06
	.byte		N06	, Dn1, v048
	.byte	W06
	.byte			Dn1, v056
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte		N12	, Ds1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte	PEND
song030_3_3:
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte		N12	, Ds1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song030_3_1
song030_3_4:
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song030_3_2
	.byte	PATT	
		mPtr	song030_3_3
	.byte	PATT	
		mPtr	song030_3_1
song030_3_5:
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte		N96	, Cn2, v116
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1
	.byte	W06
	.byte	PEND
	.byte	PATT	
		mPtr	song030_3_2
	.byte	PATT	
		mPtr	song030_3_3
	.byte	PATT	
		mPtr	song030_3_1
	.byte	PATT	
		mPtr	song030_3_4
	.byte	PATT	
		mPtr	song030_3_2
	.byte	PATT	
		mPtr	song030_3_3
	.byte	PATT	
		mPtr	song030_3_1
	.byte	PATT	
		mPtr	song030_3_5
	.byte	PATT	
		mPtr	song030_3_2
	.byte	PATT	
		mPtr	song030_3_3
	.byte	PATT	
		mPtr	song030_3_1
	.byte	PATT	
		mPtr	song030_3_4
	.byte	PATT	
		mPtr	song030_3_2
	.byte	PATT	
		mPtr	song030_3_3
	.byte	PATT	
		mPtr	song030_3_1
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v048
	.byte	W06
	.byte			Dn1, v056
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W06
	.byte	W06
	.byte		N06	, Dn1
	.byte	W06
	.byte		N12	, Ds1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Dn1, v036
	.byte	W06
	.byte		N12	, Ds1, v044
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N06	, Dn1
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Dn1, v036
	.byte	W06
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte		N12	, Ds1, v040
	.byte	W06
	.byte	W06
	.byte		N06	, Dn1
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte		N06	, En4, v020
	.byte	W06
	.byte			Cn2, v116
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
song030_3_6:
	.byte		N06	, Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v056
	.byte	W12
	.byte		N06	, Dn1, v064
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v052
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte	PEND
song030_3_7:
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte		N12	, Ds1, v056
	.byte	W06
	.byte	PEND
	.byte	W06
	.byte		N06	, Dn1, v064
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v052
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte			Dn1, v052
	.byte	W06
	.byte			Ds1, v048
	.byte	W06
	.byte		N12	, Ds1, v072
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte	PATT	
		mPtr	song030_3_6
	.byte	PATT	
		mPtr	song030_3_7
	.byte	W06
	.byte		N06	, Dn1, v064
	.byte	W06
	.byte		N12	, Ds1, v044
	.byte		N96	, Cn2, v116
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v048
	.byte	W06
	.byte		N12	, Ds1
	.byte	W12
	.byte		N06	, Dn1, v040
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte			Dn1, v040
	.byte	W06
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte		N06	, Dn1, v044
	.byte	W06
	.byte			Dn1, v032
	.byte	W06
	.byte	PATT	
		mPtr	song030_3_1
	.byte		N12	, Ds1, v048
	.byte	W12
	.byte	GOTO	
		mPtr	song030_3_8
	.byte	FINE

	@********************** Track  4 **********************@

	.global song030_4
song030_4:	@ 0x087B108E
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	VOL	, v108
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	PRIO	, 30
	.byte	W96
	.byte	W96
	.byte	W12
song030_4_8:
	.byte	W84
song030_4_1:
	.byte	W12
	.byte	VOL	, v115
	.byte		N32	, Cs2, v116
	.byte	W36
	.byte			Dn2, v108
	.byte	W36
	.byte			Bn1, v104
	.byte	W12
	.byte	PEND
song030_4_2:
	.byte	W24
	.byte		N32	, Cs2, v100
	.byte	W36
	.byte		N08	, Dn2, v108
	.byte	W24
	.byte		N32	, En2, v116
	.byte	W12
	.byte	PEND
song030_4_3:
	.byte	W24
	.byte		N32	, Fs2, v108
	.byte	W36
	.byte			Dn2, v096
	.byte	W36
	.byte	PEND
song030_4_4:
	.byte		N32	, En2, v108
	.byte	W36
	.byte		N09	, Fs2
	.byte	W24
	.byte		N32	, Gn2, v120
	.byte	W36
	.byte	PEND
song030_4_5:
	.byte		N32	, En2, v096
	.byte		N32	, An2
	.byte	W36
	.byte			Cs2, v112
	.byte		N32	, Fs2
	.byte	W36
	.byte			Dn2, v116
	.byte		N32	, Gn2
	.byte	W24
	.byte	PEND
song030_4_6:
	.byte	W12
	.byte		N08	, En2, v112
	.byte		N08	, An2
	.byte	W12
	.byte			En2
	.byte		N08	, Bn2
	.byte	W12
	.byte		N32	, An2, v120
	.byte		N32	, Cs3
	.byte	W36
	.byte			An2, v112
	.byte		N32	, Dn3
	.byte	W24
	.byte	PEND
song030_4_7:
	.byte	W12
	.byte		N32	, An2, v116
	.byte		N32	, En3
	.byte	W36
	.byte			Bn2, v120
	.byte		N32	, Fs3
	.byte	W36
	.byte		N10	, Bn2, v112
	.byte		N10	, Gn3
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N11	, Ds3
	.byte		N11	, Gn3
	.byte	W12
	.byte		N10	, Fn3, v104
	.byte		N10	, Gs3
	.byte	W24
	.byte		TIE	, Cn3, v108
	.byte		TIE	, Fn3
	.byte	W48
	.byte	W32
	.byte	W02
	.byte	VOL	, v115
	.byte	W03
	.byte		v114
	.byte	W01
	.byte		v113
	.byte	W02
	.byte		v112
	.byte	W01
	.byte		v111
	.byte	W02
	.byte		v110
	.byte	W01
	.byte		v109
	.byte	W02
	.byte		v108
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v106
	.byte	W02
	.byte		v105
	.byte	W01
	.byte		v105
	.byte	W02
	.byte		v104
	.byte	W01
	.byte		v103
	.byte	W02
	.byte		v102
	.byte	W01
	.byte		v101
	.byte	W02
	.byte		v100
	.byte	W01
	.byte		v099
	.byte	W02
	.byte		v098
	.byte	W01
	.byte		v097
	.byte	W02
	.byte		v096
	.byte	W01
	.byte		v095
	.byte	W02
	.byte		v095
	.byte	W01
	.byte		v094
	.byte	W02
	.byte		v093
	.byte	W01
	.byte		v092
	.byte	W02
	.byte		v091
	.byte	W01
	.byte		v090
	.byte	W02
	.byte		v089
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v087
	.byte	W02
	.byte		v086
	.byte	W01
	.byte		v086
	.byte	W02
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	W02
	.byte		v083
	.byte	W01
	.byte		v082
	.byte	W02
	.byte		v081
	.byte	W01
	.byte		v080
	.byte	W02
	.byte		v079
	.byte	W01
	.byte		v078
	.byte	W02
	.byte		v077
	.byte	W01
	.byte		v076
	.byte	W02
	.byte		v076
	.byte	W01
	.byte		v075
	.byte	W02
	.byte		v074
	.byte	W01
	.byte		v073
	.byte	W02
	.byte		v072
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v070
	.byte	W02
	.byte		v069
	.byte	W01
	.byte		v068
	.byte	W02
	.byte		v067
	.byte	W01
	.byte		v067
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v065
	.byte	W02
	.byte		v064
	.byte	W01
	.byte		v063
	.byte	W02
	.byte		v062
	.byte	W01
	.byte		v061
	.byte	W02
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W02
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		EOT	, Cn3
	.byte			Fn3
	.byte	VOL	, v009
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W66
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_4_1
	.byte	PATT	
		mPtr	song030_4_2
	.byte	PATT	
		mPtr	song030_4_3
	.byte	PATT	
		mPtr	song030_4_4
	.byte	PATT	
		mPtr	song030_4_5
	.byte	PATT	
		mPtr	song030_4_6
	.byte	PATT	
		mPtr	song030_4_7
	.byte	W12
	.byte		N10	, Cs3, v112
	.byte		N10	, An3
	.byte	W24
	.byte		N11	, Fn3
	.byte		N11	, An3
	.byte	W12
	.byte		N10	, Gn3, v104
	.byte		N10	, As3
	.byte	W24
	.byte		TIE	, Dn3, v108
	.byte		TIE	, Gn3
	.byte	W24
	.byte	W40
	.byte	VOL	, v115
	.byte	W03
	.byte		v114
	.byte	W01
	.byte		v113
	.byte	W02
	.byte		v112
	.byte	W01
	.byte		v111
	.byte	W02
	.byte		v110
	.byte	W01
	.byte		v109
	.byte	W02
	.byte		v108
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v106
	.byte	W02
	.byte		v105
	.byte	W01
	.byte		v105
	.byte	W02
	.byte		v104
	.byte	W01
	.byte		v103
	.byte	W02
	.byte		v102
	.byte	W01
	.byte		v101
	.byte	W02
	.byte		v100
	.byte	W01
	.byte		v099
	.byte	W02
	.byte		v098
	.byte	W01
	.byte		v097
	.byte	W02
	.byte		v096
	.byte	W01
	.byte		v095
	.byte	W02
	.byte		v095
	.byte	W01
	.byte		v094
	.byte	W02
	.byte		v093
	.byte	W01
	.byte		v092
	.byte	W02
	.byte		v091
	.byte	W01
	.byte		v090
	.byte	W02
	.byte		v089
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v087
	.byte	W02
	.byte		v086
	.byte	W01
	.byte		v086
	.byte	W02
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	W02
	.byte		v083
	.byte	W01
	.byte		v082
	.byte	W02
	.byte		v081
	.byte	W01
	.byte		v080
	.byte	W02
	.byte		v079
	.byte	W01
	.byte		v078
	.byte	W02
	.byte		v077
	.byte	W01
	.byte		v076
	.byte	W02
	.byte		v076
	.byte	W01
	.byte		v075
	.byte	W02
	.byte		v074
	.byte	W01
	.byte		v073
	.byte	W02
	.byte		v072
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v070
	.byte	W02
	.byte		v069
	.byte	W01
	.byte		v068
	.byte	W02
	.byte		v067
	.byte	W01
	.byte		v067
	.byte	W01
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v065
	.byte	W02
	.byte		v064
	.byte	W01
	.byte		v063
	.byte	W02
	.byte		v062
	.byte	W01
	.byte		v061
	.byte	W02
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W02
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W01
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W02
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W04
	.byte		EOT	, Dn3
	.byte			Gn3
	.byte	W80
	.byte	VOL	, v027
	.byte		N24	, Bn2, v120
	.byte	W01
	.byte	VOL	, v028
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v054
	.byte		N32	, Cs3, v127
	.byte	W01
	.byte	VOL	, v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	W02
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v066
	.byte	W02
	.byte		v067
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v070
	.byte	W02
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v075
	.byte	W02
	.byte		v076
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W02
	.byte		v080
	.byte	W01
	.byte		v081
	.byte		N32	, Dn3
	.byte	W01
	.byte	VOL	, v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W02
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W02
	.byte		v089
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v093
	.byte	W02
	.byte		v094
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W02
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W02
	.byte		v103
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W02
	.byte		v107
	.byte	W01
	.byte		v108
	.byte		N12	, Fn2, v104
	.byte		N12	, Bn2
	.byte		N12	, En3, v108
	.byte	W36
	.byte			Fn2, v104
	.byte		N12	, Bn2
	.byte		N12	, En3, v112
	.byte	W48
	.byte	W60
	.byte	VOL	, v108
	.byte		N12	, Fn2, v104
	.byte		N12	, Bn2
	.byte		N12	, En3, v108
	.byte	W36
	.byte			Fn2, v104
	.byte		N12	, Bn2
	.byte		N12	, En3, v112
	.byte	W96
	.byte	W12
	.byte	VOL	, v108
	.byte		N12	, Fs2, v104
	.byte		N12	, Cn3
	.byte		N12	, Fn3, v108
	.byte	W36
	.byte			Fs2, v104
	.byte		N12	, Cn3
	.byte		N12	, Fn3, v112
	.byte	W48
	.byte	W60
	.byte	VOL	, v108
	.byte		N12	, Gn2, v104
	.byte		N12	, Cs3
	.byte		N12	, Fs3, v108
	.byte	W36
	.byte			Gn2, v104
	.byte		N12	, Cs3
	.byte		N12	, Fs3, v112
	.byte	W36
	.byte		N72	, Fs2
	.byte		N72	, Cs3
	.byte		N72	, As3
	.byte	W08
	.byte	VOL	, v104
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v107
	.byte		N12	, Bn2
	.byte		N12	, Bn3
	.byte	W01
	.byte	VOL	, v108
	.byte	W80
	.byte	W03
	.byte	W96
	.byte	W12
	.byte	GOTO	
		mPtr	song030_4_8
	.byte	FINE

	@********************** Track  5 **********************@

	.global song030_5
song030_5:	@ 0x087B151A
	.byte	KEYSH	, 0
	.byte	VOICE	, 11
	.byte	VOL	, v063
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 3
	.byte	MODT	, 0
	.byte	W12
	.byte		N03	, Bn5, v127
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fs5, v124
	.byte	W03
	.byte			Dn5, v120
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Gs4, v116
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Dn4, v112
	.byte	W03
	.byte			Bn3, v108
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Fs4, v104
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Bn4, v100
	.byte	W03
	.byte			Gs4, v096
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Dn4, v092
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Gs3, v088
	.byte	W03
	.byte			Fs3, v084
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Bn2, v080
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fs3, v076
	.byte	W03
	.byte			Gs3, v072
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Gs3, v068
	.byte	W03
	.byte			Fs3, v064
	.byte	W03
	.byte			Dn3
	.byte	W03
song030_5_8:
	.byte		N03	, Bn2, v060
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fs2, v056
	.byte	W03
	.byte			Dn2, v052
	.byte	W03
	.byte			Bn1
	.byte	W03
	.byte			Dn2, v048
	.byte	W03
	.byte			Fs2
	.byte	W03
	.byte			Gs2, v044
	.byte	W03
	.byte			Bn2, v040
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fs2, v036
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Bn1, v032
	.byte	W03
	.byte			Gs1, v028
	.byte	W03
	.byte			Fs1
	.byte	W03
	.byte			Dn1, v024
	.byte	W03
	.byte			Bn0
	.byte	W48
	.byte	PEND
	.byte	W12
song030_5_9:
	.byte	W84
song030_5_1:
	.byte	W12
	.byte	VOL	, v063
	.byte		N32	, Fs2, v116
	.byte	W36
	.byte			Gn2, v108
	.byte	W36
	.byte			Fs2, v104
	.byte	W12
	.byte	PEND
song030_5_2:
	.byte	W24
	.byte		N32	, Gn2, v100
	.byte	W36
	.byte		N08	, Gn2, v108
	.byte	W24
	.byte		N32	, An2, v116
	.byte	W12
	.byte	PEND
song030_5_3:
	.byte	W24
	.byte		N32	, Bn2, v108
	.byte	W36
	.byte			Gn2, v096
	.byte	W36
	.byte	PEND
song030_5_4:
	.byte		N32	, An2, v108
	.byte	W36
	.byte		N09	, Bn2
	.byte	W24
	.byte		N32	, Bn2, v120
	.byte	W36
	.byte	PEND
song030_5_5:
	.byte		N32	, Bn2, v096
	.byte	W36
	.byte			Gs2, v112
	.byte	W36
	.byte			An2, v116
	.byte	W24
	.byte	PEND
song030_5_6:
	.byte	W12
	.byte		N08	, Bn2, v112
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte		N32	, Cs3, v120
	.byte	W36
	.byte			Fs3, v112
	.byte	W24
	.byte	PEND
song030_5_7:
	.byte	W12
	.byte		N32	, En3, v116
	.byte	W36
	.byte			Fs3, v120
	.byte	W36
	.byte		N10	, Fs3, v112
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N11	, As3
	.byte	W12
	.byte		N10	, Cn4, v104
	.byte	W24
	.byte		TIE	, Gs3, v108
	.byte	W48
	.byte	W19
	.byte	VOL	, v063
	.byte	W05
	.byte		v062
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v060
	.byte	W02
	.byte		v059
	.byte	W03
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W03
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W03
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W03
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W03
	.byte		v044
	.byte	W03
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W02
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W03
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W03
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W03
	.byte		v014
	.byte	W03
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W03
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W03
	.byte		v008
	.byte	W03
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W03
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W03
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W03
	.byte		v001
	.byte	W03
	.byte		v000
	.byte	W08
	.byte		EOT	
	.byte	W80
	.byte	W24
	.byte	VOL	, v036
	.byte		N06	, Dn4, v127
	.byte	W36
	.byte		N30	, Ds4
	.byte	W36
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_5_1
	.byte	PATT	
		mPtr	song030_5_2
	.byte	PATT	
		mPtr	song030_5_3
	.byte	PATT	
		mPtr	song030_5_4
	.byte	PATT	
		mPtr	song030_5_5
	.byte	PATT	
		mPtr	song030_5_6
	.byte	PATT	
		mPtr	song030_5_7
	.byte	W12
	.byte		N10	, Fs3, v112
	.byte	W24
	.byte		N11	, Cn4
	.byte	W12
	.byte		N10	, Dn4, v104
	.byte	W24
	.byte		TIE	, As3, v108
	.byte	W24
	.byte	W24
	.byte	W01
	.byte	VOL	, v063
	.byte	W05
	.byte		v062
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v060
	.byte	W02
	.byte		v059
	.byte	W03
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v056
	.byte	W02
	.byte		v055
	.byte	W03
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W03
	.byte		v052
	.byte	W02
	.byte		v051
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		v047
	.byte	W03
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W03
	.byte		v044
	.byte	W03
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W03
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W03
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v031
	.byte	W02
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W03
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W03
	.byte		v014
	.byte	W03
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W03
	.byte		v009
	.byte	W02
	.byte		v009
	.byte	W03
	.byte		v008
	.byte	W03
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W03
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W03
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W03
	.byte		v001
	.byte	W03
	.byte		v000
	.byte	W05
	.byte		v000
	.byte	W02
	.byte		v001
	.byte	W03
	.byte		v002
	.byte	W02
	.byte		v003
	.byte	W03
	.byte		v004
	.byte	W02
	.byte		v005
	.byte	W03
	.byte		v006
	.byte	W02
	.byte		v007
	.byte	W03
	.byte		v008
	.byte	W01
	.byte		EOT	
	.byte	W02
	.byte	VOL	, v009
	.byte	W02
	.byte		v009
	.byte	W03
	.byte		v010
	.byte	W02
	.byte		v011
	.byte	W03
	.byte		v012
	.byte	W02
	.byte		v013
	.byte	W03
	.byte		v014
	.byte	W02
	.byte		v015
	.byte	W03
	.byte		v016
	.byte	W02
	.byte		v017
	.byte	W03
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		v020
	.byte	W03
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W03
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W03
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W03
	.byte		v027
	.byte	W03
	.byte		v028
	.byte	W02
	.byte		v028
	.byte	W03
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W03
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W03
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W03
	.byte		v035
	.byte	W02
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W03
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		v041
	.byte		N04	, Bn1, v112
	.byte	W03
	.byte	VOL	, v042
	.byte	W01
	.byte		N04	, Cs2, v120
	.byte	W01
	.byte	VOL	, v043
	.byte	W03
	.byte		v044
	.byte		N04	, Dn2, v112
	.byte	W03
	.byte	VOL	, v045
	.byte	W01
	.byte		N04	, En2, v108
	.byte	W01
	.byte	VOL	, v046
	.byte	W03
	.byte		v047
	.byte		N04	, Fn2, v100
	.byte	W02
	.byte	VOL	, v047
	.byte	W02
	.byte		N04	, Gn2, v108
	.byte	W01
	.byte	VOL	, v048
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		N04	, Gs2, v112
	.byte	W02
	.byte	VOL	, v050
	.byte	W02
	.byte		v051
	.byte		N04	, As2, v120
	.byte	W03
	.byte	VOL	, v052
	.byte	W01
	.byte		N04	, Bn2, v104
	.byte	W01
	.byte	VOL	, v053
	.byte	W03
	.byte		v054
	.byte		N04	, Cs3, v112
	.byte	W02
	.byte	VOL	, v055
	.byte	W02
	.byte		N04	, Dn3, v108
	.byte	W01
	.byte	VOL	, v056
	.byte	W02
	.byte		v057
	.byte	W01
	.byte		N04	, En3, v116
	.byte	W02
	.byte	VOL	, v057
	.byte	W02
	.byte		v058
	.byte		N04	, Fn3, v108
	.byte	W03
	.byte	VOL	, v059
	.byte	W01
	.byte		N04	, Gn3, v112
	.byte	W01
	.byte	VOL	, v060
	.byte	W03
	.byte		v061
	.byte		N04	, Gs3, v124
	.byte	W02
	.byte	VOL	, v062
	.byte	W02
	.byte		v063
	.byte		N04	, As3, v120
	.byte	W04
	.byte			Bn3, v096
	.byte	W04
	.byte			Cs4, v120
	.byte	W04
	.byte			Dn4, v112
	.byte	W04
	.byte			En4, v104
	.byte	W04
	.byte			Fn4, v108
	.byte	W04
	.byte			Gn4, v112
	.byte	W04
	.byte			Gs4, v116
	.byte	W04
	.byte			As4, v124
	.byte	W04
	.byte	VOL	, v063
	.byte		N12	, Gs3, v104
	.byte	W36
	.byte		N12	
	.byte	W48
	.byte	W60
	.byte	VOL	, v063
	.byte		N12	
	.byte	W36
	.byte		N12	
	.byte	W96
	.byte	W12
	.byte	VOL	, v063
	.byte		N12	, An3
	.byte	W36
	.byte		N12	
	.byte	W48
	.byte	W60
	.byte	VOL	, v063
	.byte		N12	, As3
	.byte	W36
	.byte		N12	
	.byte	W36
	.byte		N04	, Fs1, v112
	.byte	W04
	.byte			Gs1, v120
	.byte	W04
	.byte			As1, v112
	.byte	W04
	.byte			Cs2, v116
	.byte	W04
	.byte			Fs2, v112
	.byte	W04
	.byte			Gs2, v108
	.byte	W04
	.byte			As2, v104
	.byte	W04
	.byte			Cs3
	.byte	W04
	.byte			Fs3
	.byte	W04
	.byte			Gs3, v108
	.byte	W04
	.byte			As3, v104
	.byte	W04
	.byte			Cs4
	.byte	W04
	.byte			Fs4, v108
	.byte	W04
	.byte			Gs4, v100
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Cs5, v108
	.byte	W04
	.byte			Fs5, v112
	.byte	W04
	.byte			Gs5
	.byte	W04
	.byte		N03	, Bn5, v127
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fs5, v124
	.byte	W03
	.byte			Dn5, v120
	.byte	W03
	.byte			Bn4
	.byte	W03
	.byte			Gs4, v116
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Dn4, v112
	.byte	W03
	.byte			Bn3, v108
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Fs4, v104
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Bn4, v100
	.byte	W03
	.byte			Gs4, v096
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte			Dn4, v092
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Gs3, v088
	.byte	W03
	.byte			Fs3, v084
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Bn2, v080
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fs3, v076
	.byte	W03
	.byte			Gs3, v072
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Gs3, v068
	.byte	W03
	.byte			Fs3, v064
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte	PATT	
		mPtr	song030_5_8
	.byte	W12
	.byte	GOTO	
		mPtr	song030_5_9
	.byte	FINE

	@********************** Track  6 **********************@

	.global song030_6
song030_6:	@ 0x087B1901
	.byte	KEYSH	, 0
	.byte	VOICE	, 90
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N96	, An2
	.byte	W84
	.byte	W96
	.byte	W12
song030_6_3:
	.byte	W84
song030_6_1:
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N96	, An2
	.byte	W84
	.byte	PEND
	.byte	W96
	.byte	W96
song030_6_2:
	.byte	W48
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N96	, An2
	.byte	W36
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_6_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_6_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_6_1
	.byte	W96
	.byte	W96
	.byte	PATT	
		mPtr	song030_6_2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N06	, En2, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N96	, Cs3
	.byte	W60
	.byte	W96
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte		N11	, Cs2
	.byte	W12
	.byte		N05	, Gs2, v120
	.byte	W06
	.byte			Gs2, v127
	.byte	W06
	.byte		N11	, Gs1, v120
	.byte	W12
	.byte		N36	, Cs2
	.byte	W48
	.byte	W60
	.byte		N11	, Cs2, v127
	.byte	W12
	.byte		N05	, Gs2, v120
	.byte	W06
	.byte			Gs2, v127
	.byte	W06
	.byte		N11	, Gs1, v120
	.byte	W12
	.byte		N36	, Cs2
	.byte	W96
	.byte	W12
	.byte		N11	, Dn2, v127
	.byte	W12
	.byte		N05	, An2, v120
	.byte	W06
	.byte			An2, v127
	.byte	W06
	.byte		N11	, An1, v120
	.byte	W12
	.byte		N36	, Dn2
	.byte	W48
	.byte	W60
	.byte		N11	, Ds2, v127
	.byte	W12
	.byte		N05	, As2, v120
	.byte	W06
	.byte			As2, v127
	.byte	W06
	.byte		N11	, As1, v120
	.byte	W12
	.byte		N36	, Ds2
	.byte	W96
	.byte	PATT	
		mPtr	song030_6_1
	.byte	W96
	.byte	W12
	.byte	GOTO	
		mPtr	song030_6_3
	.byte	FINE

	@********************** Track  7 **********************@

	.global song030_7
song030_7:	@ 0x087B19BF
	.byte	KEYSH	, 0
	.byte	VOICE	, 93
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W12
song030_7_1:
	.byte	W84
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
	.byte	W24
	.byte		N06	, Dn4, v127
	.byte		N06	, Gn4
	.byte	W36
	.byte		N30	, Ds4
	.byte		N30	, Gs4
	.byte	W36
	.byte		N06	, Cn4
	.byte		N06	, Fn4
	.byte	W12
	.byte			Dn4
	.byte		N06	, Gn4
	.byte	W24
	.byte			As3
	.byte		N06	, Ds4
	.byte	W24
	.byte			Cn4
	.byte		N06	, Fn4
	.byte	W36
	.byte		N30	, An3
	.byte		N30	, Dn4
	.byte	W36
	.byte		N06	, An3
	.byte		N06	, Dn4
	.byte	W12
	.byte			An3
	.byte		N06	, Dn4
	.byte	W24
	.byte			As3
	.byte		N06	, Ds4
	.byte	W24
	.byte		N24	, Gn3
	.byte		N24	, Cn4
	.byte	W36
	.byte		N06	, An3
	.byte		N06	, Dn4
	.byte	W12
	.byte			Fn3
	.byte		N06	, As3
	.byte	W24
	.byte		N12	, Gn3, v088
	.byte		N12	, Cn4
	.byte	W24
	.byte			Fn3
	.byte		N12	, As3
	.byte	W12
	.byte		N36	, Fs3
	.byte		N30	, Bn3
	.byte	W84
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
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
	.byte	W12
	.byte	GOTO	
		mPtr	song030_7_1
	.byte	FINE

	@********************** Track  8 **********************@

	.global song030_8
song030_8:	@ 0x087B1A47
	.byte	KEYSH	, 0
	.byte	VOICE	, 91
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W12
song030_8_1:
	.byte	W84
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
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W60
	.byte		N03	, Bn2, v104
	.byte	W03
	.byte			Cs3, v096
	.byte	W03
	.byte			Dn3, v100
	.byte	W03
	.byte			En3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Gn3, v112
	.byte	W03
	.byte			Gs3, v096
	.byte	W03
	.byte			As3, v108
	.byte	W03
	.byte			Bn3
	.byte	W03
	.byte			Cs4, v116
	.byte	W03
	.byte			Dn4, v108
	.byte	W03
	.byte			As3, v124
	.byte	W03
	.byte			Gs3, v112
	.byte	W03
	.byte			Cs4, v108
	.byte	W03
	.byte			Bn3, v096
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			As3, v112
	.byte	W03
	.byte			Gs3, v100
	.byte	W03
	.byte			En3, v076
	.byte	W03
	.byte			Dn3, v104
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			Fn3, v096
	.byte	W03
	.byte			Cs3, v100
	.byte	W03
	.byte			Bn2, v096
	.byte	W03
	.byte			En3, v100
	.byte	W03
	.byte			Dn3, v108
	.byte	W03
	.byte			As2, v112
	.byte	W03
	.byte			Gs2, v104
	.byte	W03
	.byte			Cs3, v108
	.byte	W03
	.byte			Bn2, v100
	.byte	W03
	.byte			Gn2, v096
	.byte	W36
	.byte	W03
	.byte	W12
	.byte			As3, v116
	.byte	W03
	.byte			Gs3, v104
	.byte	W03
	.byte			Gn3, v096
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			En3, v108
	.byte	W03
	.byte			Dn3, v096
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Bn2, v040
	.byte	W03
	.byte			As2, v100
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Gn2, v096
	.byte	W03
	.byte			Gs2, v104
	.byte	W03
	.byte			Cs3, v088
	.byte	W03
	.byte			Bn2
	.byte	W03
	.byte			As2, v092
	.byte	W03
	.byte			Bn2, v080
	.byte	W03
	.byte			En3, v096
	.byte	W03
	.byte			Dn3, v108
	.byte	W03
	.byte			Cs3, v100
	.byte	W03
	.byte			Dn3, v092
	.byte	W03
	.byte			Gn3, v108
	.byte	W03
	.byte			Fn3, v104
	.byte	W03
	.byte			En3, v076
	.byte	W03
	.byte			Fn3, v100
	.byte	W03
	.byte			As3, v116
	.byte	W03
	.byte			Gs3, v112
	.byte	W03
	.byte			Gn3, v108
	.byte	W03
	.byte			Gs3, v112
	.byte	W03
	.byte			Cs4, v120
	.byte	W03
	.byte			Bn3, v100
	.byte	W03
	.byte			Cs4, v116
	.byte	W03
	.byte			Dn4, v108
	.byte	W48
	.byte	W03
	.byte			Cn3, v104
	.byte	W03
	.byte			Dn3, v096
	.byte	W03
	.byte			Ds3, v100
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			Gs3, v112
	.byte	W03
	.byte			An3, v096
	.byte	W03
	.byte			Bn3, v108
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Dn4, v116
	.byte	W03
	.byte			Ds4, v108
	.byte	W03
	.byte			Bn3, v124
	.byte	W03
	.byte			An3, v112
	.byte	W03
	.byte			Dn4, v108
	.byte	W03
	.byte			Cn4, v096
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			Bn3, v112
	.byte	W03
	.byte			An3, v100
	.byte	W03
	.byte			Fn3, v076
	.byte	W03
	.byte			Ds3, v104
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fs3, v096
	.byte	W03
	.byte			Dn3, v100
	.byte	W03
	.byte			Cn3, v096
	.byte	W03
	.byte			Fn3, v100
	.byte	W03
	.byte			Ds3, v108
	.byte	W03
	.byte			Bn2, v112
	.byte	W03
	.byte			An2, v104
	.byte	W03
	.byte			Dn3, v108
	.byte	W03
	.byte			Cn3, v100
	.byte	W03
	.byte			Gs2, v096
	.byte	W36
	.byte	W03
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W12
	.byte	GOTO	
		mPtr	song030_8_1
	.byte	FINE

	mAlignWord
	.global C_DECL(song030)
C_DECL(song030):	@ 0x087B1B9C
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

mAlignWord
	mPtr	voicegroup000		@ voicegroup/tone

	mPtr	song030_1		@ track
	mPtr	song030_2		@ track
	mPtr	song030_3		@ track
	mPtr	song030_4		@ track
	mPtr	song030_5		@ track
	mPtr	song030_6		@ track
	mPtr	song030_7		@ track
	mPtr	song030_8		@ track
