	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song039_1
song039_1:	@ 0x087B4B90
	.byte	KEYSH	, 0
	.byte	TEMPO	, 56
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W06
	.byte	TEMPO	, 56
	.byte	W06
	.byte	TEMPO	, 56
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 55
	.byte	W06
	.byte	TEMPO	, 54
	.byte	W06
	.byte	TEMPO	, 53
	.byte	W06
	.byte	TEMPO	, 52
	.byte	W06
	.byte	TEMPO	, 51
	.byte	W06
	.byte	TEMPO	, 51
	.byte	W06
	.byte	TEMPO	, 50
	.byte	W06
	.byte	TEMPO	, 49
	.byte	W06
	.byte	TEMPO	, 48
	.byte	W06
	.byte	TEMPO	, 47
	.byte	W06
	.byte	TEMPO	, 46
	.byte	W06
	.byte	TEMPO	, 45
	.byte	W06
	.byte	TEMPO	, 44
	.byte	W06
	.byte	TEMPO	, 43
	.byte	W06
	.byte	TEMPO	, 42
	.byte	W06
	.byte	TEMPO	, 41
	.byte	W06
	.byte	TEMPO	, 40
	.byte	W06
	.byte	TEMPO	, 39
	.byte	W06
	.byte	TEMPO	, 38
	.byte	W06
	.byte	TEMPO	, 37
	.byte	W06
	.byte	TEMPO	, 36
	.byte	W06
	.byte	TEMPO	, 35
	.byte	W06
	.byte	TEMPO	, 34
	.byte	W06
	.byte	TEMPO	, 33
	.byte	W48
	.byte	W72
	.byte	W72
	.byte	TEMPO	, 96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 127
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W72
song039_1_1:
	.byte	W24
	.byte		N08	, Dn1, v048
	.byte	W48
	.byte		N08	
	.byte	W24
	.byte	PEND
	.byte	PATT	
		mPtr	song039_1_1
	.byte	PATT	
		mPtr	song039_1_1
	.byte		N08	, An1, v127
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Cn1
	.byte	W08
	.byte			Dn1, v048
	.byte		N08	, Gs1, v127
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Cn1
	.byte	W08
	.byte			Cs1
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte			Cn1
	.byte	W08
	.byte		N15	, Cs1
	.byte		N08	, Dn1, v048
	.byte	W16
	.byte		N16	, Cn1, v127
	.byte		TIE	, Cs2
	.byte	W08
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N08	, Dn1, v044
	.byte	W08
	.byte		EOT	, Cs2
song039_1_2:
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N08	, Dn1, v044
	.byte	W08
	.byte	PEND
	.byte	PATT	
		mPtr	song039_1_2
song039_1_3:
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cs1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W08
	.byte	PEND
song039_1_4:
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N08	, Dn1, v044
	.byte	W08
	.byte	PEND
	.byte	PATT	
		mPtr	song039_1_2
	.byte	PATT	
		mPtr	song039_1_2
	.byte	PATT	
		mPtr	song039_1_3
	.byte	PATT	
		mPtr	song039_1_4
	.byte	PATT	
		mPtr	song039_1_3
	.byte	PATT	
		mPtr	song039_1_4
	.byte	PATT	
		mPtr	song039_1_3
	.byte	PATT	
		mPtr	song039_1_4
	.byte	PATT	
		mPtr	song039_1_2
	.byte	PATT	
		mPtr	song039_1_2
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte		N15	, Ds1, v072
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Cn1, v127
	.byte		N15	, Ds1, v072
	.byte	W08
	.byte		N08	, Cs1, v127
	.byte	W08
	.byte		N08	
	.byte	W08
	.byte		N08	
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Gs1, v127
	.byte	W08
	.byte			Gn1
	.byte	W08
	.byte			Cs1
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N07	, Dn1, v044
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte	W08
	.byte		N08	
	.byte		N23	, Ds1, v080
	.byte	W16
	.byte		N08	, Gn1, v127
	.byte	W08
	.byte			Cs1
	.byte		N07	, Dn1, v044
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N23	, Ds1, v080
	.byte	W08
	.byte	W16
	.byte		N08	, Cs1, v127
	.byte	W08
	.byte		N08	
	.byte		N07	, Dn1, v044
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N23	, Ds1, v080
	.byte	W16
	.byte		N08	, Gs1, v127
	.byte	W08
	.byte			An1
	.byte	W08
	.byte			Cs1
	.byte		N07	, Dn1, v044
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N23	, Ds1, v080
	.byte	W08
	.byte	W16
	.byte		N08	, Cs1, v127
	.byte	W08
	.byte		N08	
	.byte		N07	, Dn1, v044
	.byte	W08
	.byte		N08	, Gs1, v127
	.byte	W08
	.byte			Gn1
	.byte	W08
	.byte			Cs1
	.byte		N07	, Dn1, v044
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte	W08
	.byte		N08	
	.byte		N15	, Ds1, v080
	.byte	W16
	.byte		N08	, Cn1, v127
	.byte		N23	, Ds1, v080
	.byte	W08
	.byte	W15
	.byte	FINE

	@********************** Track  2 **********************@

	.global song039_2
song039_2:	@ 0x087B4DEB
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 12
	.byte	VOL	, v050
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N08	, Bn5, v100
	.byte	W08
	.byte			An5, v108
	.byte	W08
	.byte			Gn5, v112
	.byte	W08
	.byte			Dn5, v104
	.byte	W08
	.byte			Bn4
	.byte	W08
	.byte			Gn4, v100
	.byte	W08
	.byte			Bn4, v096
	.byte	W08
	.byte			An4, v104
	.byte	W08
	.byte			Gn4, v112
	.byte	W08
	.byte			Dn4, v104
	.byte	W08
	.byte			Bn3, v108
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Bn3, v100
	.byte	W08
	.byte			An3, v108
	.byte	W08
	.byte			Gn3, v112
	.byte	W08
	.byte			Dn3, v108
	.byte	W08
	.byte			Bn2, v100
	.byte	W08
	.byte			Gn2, v096
	.byte	W08
	.byte			Bn2, v104
	.byte	W08
	.byte			An2
	.byte	W08
	.byte			Gn2, v108
	.byte	W08
	.byte			Dn2
	.byte	W08
	.byte			Bn1, v104
	.byte	W08
	.byte			Gn1, v124
	.byte	W08
	.byte			En1, v108
	.byte	W08
	.byte			An1, v100
	.byte	W08
	.byte			Bn1, v112
	.byte	W08
	.byte			Cs2, v104
	.byte	W08
	.byte			En2, v096
	.byte	W08
	.byte			An2, v104
	.byte	W08
	.byte			En2, v100
	.byte	W08
	.byte			An2, v104
	.byte	W08
	.byte			Bn2, v096
	.byte	W08
	.byte			Cs3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			An3, v088
	.byte	W08
	.byte			Bn3
	.byte	W08
	.byte			Cs4, v100
	.byte	W08
	.byte			En4
	.byte	W08
	.byte			An4, v104
	.byte	W08
	.byte			En4, v084
	.byte	W08
	.byte			An4, v104
	.byte	W08
	.byte			Bn4, v100
	.byte	W08
	.byte			Cs5, v112
	.byte	W08
	.byte			En5, v104
	.byte	W08
	.byte			An5, v108
	.byte	W08
	.byte			Dn6, v100
	.byte	W08
	.byte			Cn6, v108
	.byte	W08
	.byte			As5, v112
	.byte	W08
	.byte			Fn5, v104
	.byte	W08
	.byte			Dn5
	.byte	W08
	.byte			As4, v100
	.byte	W08
	.byte			Dn5, v096
	.byte	W08
	.byte			Cn5, v104
	.byte	W08
	.byte			As4, v112
	.byte	W08
	.byte			Fn4, v104
	.byte	W08
	.byte			Dn4, v108
	.byte	W08
	.byte			As3
	.byte	W08
	.byte			Dn4, v100
	.byte	W08
	.byte			Cn4, v108
	.byte	W08
	.byte			As3, v112
	.byte	W08
	.byte			Fn3, v108
	.byte	W08
	.byte			Dn3, v100
	.byte	W08
	.byte			As2, v096
	.byte	W08
	.byte			Dn3, v104
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			As2, v108
	.byte	W08
	.byte			Fn2
	.byte	W08
	.byte			Dn2, v104
	.byte	W08
	.byte			As1, v124
	.byte	W08
	.byte			Gn1, v108
	.byte	W08
	.byte			Cn2, v100
	.byte	W08
	.byte			Dn2, v112
	.byte	W08
	.byte			En2, v104
	.byte	W08
	.byte			Gn2, v096
	.byte	W08
	.byte			Cn3, v104
	.byte	W08
	.byte			Gn2, v100
	.byte	W08
	.byte			Cn3, v104
	.byte	W08
	.byte			Dn3, v096
	.byte	W08
	.byte			En3
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Cn4
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Cn4, v088
	.byte	W08
	.byte			Dn4
	.byte	W08
	.byte			En4, v100
	.byte	W08
	.byte			Gn4
	.byte	W08
	.byte			Cn5, v104
	.byte	W08
	.byte			Gn4, v084
	.byte	W08
	.byte			Cn5, v104
	.byte	W08
	.byte			Dn5, v100
	.byte	W08
	.byte			En5, v112
	.byte	W08
	.byte			Gn5, v104
	.byte	W08
	.byte			Cn6, v108
	.byte	W08
	.byte			Cs6
	.byte	W08
	.byte			Gs5, v100
	.byte	W08
	.byte			Fs5
	.byte	W08
	.byte			Fn5, v096
	.byte	W08
	.byte			Cs5, v104
	.byte	W08
	.byte			Gs4
	.byte	W08
	.byte			Fn5, v100
	.byte	W08
	.byte			Ds5, v104
	.byte	W08
	.byte			Cs5, v112
	.byte	W08
	.byte			Gs4, v124
	.byte	W08
	.byte			Fn4, v096
	.byte	W08
	.byte			Cs4, v112
	.byte	W08
	.byte			Gs4, v108
	.byte	W08
	.byte			Fn4, v096
	.byte	W08
	.byte			Ds4, v112
	.byte	W08
	.byte			Cs4, v116
	.byte	W08
	.byte			Gs3, v104
	.byte	W08
	.byte			Fn3, v096
	.byte	W08
	.byte			Cs4, v112
	.byte	W08
	.byte			Gs3, v108
	.byte	W08
	.byte			Fs3, v096
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			Cs3, v088
	.byte	W08
	.byte			Gs2, v060
	.byte	W08
	.byte			Ds6, v108
	.byte	W08
	.byte			As5, v100
	.byte	W08
	.byte			Gs5
	.byte	W08
	.byte			Gn5, v096
	.byte	W08
	.byte			Ds5, v104
	.byte	W08
	.byte			As4
	.byte	W08
	.byte			Gn5, v100
	.byte	W08
	.byte			Fn5, v104
	.byte	W08
	.byte			Ds5, v112
	.byte	W08
	.byte			As4, v124
	.byte	W08
	.byte			Gn4, v096
	.byte	W08
	.byte			Ds4, v112
	.byte	W08
	.byte			As4, v108
	.byte	W08
	.byte			Gn4, v096
	.byte	W08
	.byte			Fn4, v112
	.byte	W08
	.byte			Ds4, v116
	.byte	W08
	.byte			As3, v104
	.byte	W08
	.byte			Gn3, v096
	.byte	W08
	.byte			Ds4, v112
	.byte	W08
	.byte			As3, v108
	.byte	W08
	.byte			Gs3, v096
	.byte	W08
	.byte			Gn3
	.byte	W08
	.byte			Ds3, v088
	.byte	W08
	.byte			As2, v060
	.byte	W08
	.byte			Fn6, v108
	.byte	W08
	.byte			Cn6, v100
	.byte	W08
	.byte			As5
	.byte	W08
	.byte			An5, v096
	.byte	W08
	.byte			Fn5, v104
	.byte	W08
	.byte			Cn5
	.byte	W08
	.byte			An5, v100
	.byte	W08
	.byte			Gn5, v104
	.byte	W08
	.byte			Fn5, v112
	.byte	W08
	.byte			Cn5, v124
	.byte	W08
	.byte			An4, v096
	.byte	W08
	.byte			Fn4, v112
	.byte	W08
	.byte			Cn5, v108
	.byte	W08
	.byte			An4, v096
	.byte	W08
	.byte			Gn4, v112
	.byte	W08
	.byte			Fn4, v116
	.byte	W08
	.byte			Cn4, v104
	.byte	W08
	.byte			An3, v096
	.byte	W08
	.byte			Fn4, v112
	.byte	W08
	.byte			Cn4, v108
	.byte	W08
	.byte			As3, v096
	.byte	W08
	.byte			An3
	.byte	W08
	.byte			Fn3, v088
	.byte	W08
	.byte			Cn3, v060
	.byte	W08
	.byte			Fn2, v104
	.byte	W08
	.byte			Gn2
	.byte	W08
	.byte			An2, v096
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte			Fn3
	.byte	W08
	.byte			An3, v104
	.byte	W08
	.byte			Cn3, v084
	.byte	W08
	.byte			Fn3, v104
	.byte	W08
	.byte			Gn3, v092
	.byte	W08
	.byte			An3, v100
	.byte	W08
	.byte			Cn4, v104
	.byte	W08
	.byte			Fn4, v108
	.byte	W08
	.byte		N06	, Fn3, v100
	.byte	W06
	.byte			Gn3, v104
	.byte	W06
	.byte			An3, v108
	.byte	W06
	.byte			Cn4, v096
	.byte	W06
	.byte			Fn4, v104
	.byte	W06
	.byte			Gn4, v108
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			Cn5
	.byte	W06
	.byte			Fn4, v112
	.byte	W06
	.byte			Gn4, v104
	.byte	W06
	.byte			An4, v108
	.byte	W06
	.byte			Cn5, v084
	.byte	W06
	.byte			Fn5, v088
	.byte	W06
	.byte			Gn5, v104
	.byte	W06
	.byte			An5, v108
	.byte	W06
	.byte			Cn6, v100
	.byte	W06
	.byte			Fn6, v108
	.byte	W96
	.byte	W92
	.byte	W01
	.byte	BEND	, c_v-64
	.byte	W03
	.byte		N68	, Cn4, v127
	.byte	W20
	.byte	BEND	, c_v-64
	.byte	W02
	.byte		c_v-60
	.byte	W01
	.byte		c_v-56
	.byte	W02
	.byte		c_v-52
	.byte	W01
	.byte		c_v-48
	.byte	W02
	.byte		c_v-44
	.byte	W01
	.byte		c_v-40
	.byte	W02
	.byte		c_v-36
	.byte	W01
	.byte		c_v-32
	.byte	W02
	.byte		c_v-28
	.byte	W01
	.byte		c_v-24
	.byte	W02
	.byte		c_v-20
	.byte	W01
	.byte		c_v-16
	.byte	W02
	.byte		c_v-12
	.byte	W01
	.byte		c_v-8
	.byte	W02
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte	W28
	.byte		N08	, Fn4
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte	FINE

	@********************** Track  3 **********************@

	.global song039_3
song039_3:	@ 0x087B506C
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 76
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W72
	.byte	W96
	.byte		N96	, Gn3, v108
	.byte	W96
	.byte			An3
	.byte	W96
	.byte			Gn3, v112
	.byte	W96
	.byte	FINE

	@********************** Track  4 **********************@

	.global song039_4
song039_4:	@ 0x087B509C
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 80
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W72
	.byte		N96	, An2, v120
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N05	, Dn3, v100
	.byte	W06
	.byte			Cn3, v064
	.byte	W03
	.byte			Bn2, v092
	.byte	W03
	.byte		N06	, An2, v084
	.byte	W04
	.byte		N05	, Gn2, v088
	.byte	W02
	.byte			Fn2, v096
	.byte	W03
	.byte		N06	, En2, v088
	.byte	W04
	.byte		N05	, Dn2, v092
	.byte	W03
	.byte			Cn2, v084
	.byte	W03
	.byte			Bn1, v088
	.byte	W03
	.byte			An1, v092
	.byte	W02
	.byte			Gn1, v096
	.byte	W03
	.byte		N06	, Fn1, v084
	.byte	W04
	.byte		N05	, En1, v044
	.byte	W02
	.byte		N07	, Dn1, v076
	.byte	W09
	.byte		N05	, Fn1, v084
	.byte	W03
	.byte			Gn1, v100
	.byte	W02
	.byte			An1, v096
	.byte	W03
	.byte			Bn1
	.byte	W02
	.byte			Cn2, v092
	.byte	W03
	.byte			Dn2, v084
	.byte	W03
	.byte			En2, v088
	.byte	W02
	.byte			Fn2, v084
	.byte	W03
	.byte			Gn2, v088
	.byte	W03
	.byte			An2
	.byte	W02
	.byte			Bn2, v084
	.byte	W03
	.byte		N06	, Cn3, v080
	.byte	W05
	.byte		TIE	, Dn3, v100
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte		N17	, Dn3, v127
	.byte	W24
	.byte		N15	, Dn3, v116
	.byte	W16
	.byte		TIE	, En3, v112
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N15	, Dn3, v116
	.byte	W16
	.byte		N07	, Ds3, v092
	.byte	W08
	.byte		N15	, En3, v104
	.byte	W16
	.byte		TIE	, Fn3, v116
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte		N18	, Fn3, v096
	.byte	W24
	.byte		N14	
	.byte	W16
	.byte		TIE	, Gn3, v124
	.byte	W08
	.byte	W96
	.byte	W20
	.byte		EOT	
	.byte		N05	, Fs3, v100
	.byte	W06
	.byte			En3, v064
	.byte	W03
	.byte			Ds3, v092
	.byte	W03
	.byte		N06	, Cs3, v084
	.byte	W04
	.byte		N05	, Bn2, v088
	.byte	W02
	.byte			An2, v096
	.byte	W03
	.byte		N06	, Gs2, v088
	.byte	W04
	.byte		N05	, Fs2, v092
	.byte	W03
	.byte		N14	, Fn2, v108
	.byte	W16
	.byte		N07	, Fs2
	.byte	W08
	.byte		N15	, Gn2, v116
	.byte	W16
	.byte		TIE	, Gs2, v112
	.byte	W08
	.byte	W96
	.byte	W44
	.byte		EOT	
	.byte	W04
	.byte		N20	
	.byte	W24
	.byte		N12	
	.byte	W16
	.byte		TIE	, As2
	.byte	W08
	.byte	W96
	.byte	W42
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte		N19	
	.byte	W24
	.byte		N11	
	.byte	W16
	.byte		TIE	, Cn3
	.byte	W08
	.byte	W96
	.byte	W80
	.byte	W01
	.byte		EOT	
	.byte		N05	, Dn3, v100
	.byte	W02
	.byte			En3, v096
	.byte	W03
	.byte			Fs3
	.byte	W02
	.byte			Gn3, v092
	.byte	W03
	.byte			An3, v084
	.byte	W03
	.byte			Bn3, v088
	.byte	W02
	.byte		N42	, Cn4, v112
	.byte	W48
	.byte		N11	
	.byte	W16
	.byte		N05	
	.byte	W24
	.byte		N48	
	.byte	W08
	.byte	W40
	.byte	W01
	.byte		N05	, Bn3, v032
	.byte	W06
	.byte			An3, v060
	.byte	W03
	.byte			Gs3, v056
	.byte	W03
	.byte		N06	, Fs3, v052
	.byte	W04
	.byte		N05	, En3, v048
	.byte	W02
	.byte			Dn3, v044
	.byte	W03
	.byte		N06	, Cs3, v040
	.byte	W04
	.byte		N05	, Bn2, v036
	.byte	W03
	.byte			An2, v032
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fs2, v028
	.byte	W02
	.byte			En2, v024
	.byte	W03
	.byte		N06	, Dn2, v020
	.byte	W04
	.byte		N05	, Cs2, v016
	.byte	W05
	.byte	FINE

	@********************** Track  5 **********************@

	.global song039_5
song039_5:	@ 0x087B51F2
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 45
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte		N92	, Dn2, v072
	.byte	W96
	.byte			Dn3
	.byte	W96
	.byte			Dn2
	.byte	W96
	.byte		N44	, Dn3
	.byte	W48
	.byte		N15	, Dn2, v088
	.byte	W16
	.byte		N07	, En2, v084
	.byte	W08
	.byte		N15	, Fs2, v088
	.byte	W16
	.byte		N24	, Gn2
	.byte	W08
	.byte	W24
	.byte		N13	
	.byte	W24
	.byte		N16	, Gn2, v084
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N16	, Gn2, v088
	.byte	W24
	.byte		N13	, Gn2, v084
	.byte	W16
	.byte		N03	
	.byte	W08
	.byte		N11	, Gn2, v092
	.byte	W16
	.byte		N24	
	.byte	W08
	.byte	W24
	.byte		N15	, Gn2, v084
	.byte	W24
	.byte			Gn2, v088
	.byte	W24
	.byte		N14	, Gn2, v084
	.byte	W24
	.byte		N11	, Gn2, v088
	.byte	W24
	.byte		N16	, Gn2, v084
	.byte	W24
	.byte		N14	
	.byte	W16
	.byte		N07	, Gs2
	.byte	W08
	.byte		N11	, An2, v088
	.byte	W16
	.byte		N30	, As2, v092
	.byte	W08
	.byte	W24
	.byte		N15	, As2, v088
	.byte	W24
	.byte		N16	, As2, v084
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte			As2, v088
	.byte	W24
	.byte			As2, v084
	.byte	W24
	.byte		N13	
	.byte	W16
	.byte		N06	, As2, v076
	.byte	W08
	.byte		N11	
	.byte	W16
	.byte		N28	, As2, v092
	.byte	W08
	.byte	W24
	.byte		N13	, As2, v088
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N14	
	.byte	W24
	.byte			As2, v084
	.byte	W24
	.byte		N13	, As2, v088
	.byte	W24
	.byte		N14	
	.byte	W16
	.byte		N07	, Bn2, v080
	.byte	W08
	.byte		N13	, Cn3, v088
	.byte	W16
	.byte		N30	, Cs3, v092
	.byte	W08
	.byte	W24
	.byte		N15	, Cs3, v088
	.byte	W24
	.byte		N14	
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N16	, Cs3, v084
	.byte	W24
	.byte		N14	, Cs3, v088
	.byte	W24
	.byte		N13	
	.byte	W16
	.byte		N07	, Gs2, v084
	.byte	W08
	.byte		N15	, Cs2, v088
	.byte	W16
	.byte		N28	, Ds2
	.byte	W08
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N17	, Ds2, v084
	.byte	W24
	.byte		N18	, Ds2, v088
	.byte	W24
	.byte		N19	
	.byte	W24
	.byte		N12	, Ds3, v084
	.byte	W16
	.byte		N07	, As2
	.byte	W08
	.byte		N14	, Ds2, v088
	.byte	W16
	.byte		N24	, Fn2
	.byte	W08
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N15	
	.byte	W24
	.byte		N14	, Fn2, v084
	.byte	W24
	.byte		N17	, Fn2, v088
	.byte	W24
	.byte		N18	, Fn2, v084
	.byte	W24
	.byte		N13	, Cn2, v088
	.byte	W16
	.byte		N07	, Ds2, v080
	.byte	W08
	.byte		N15	, En2, v088
	.byte	W16
	.byte		N28	, Fn2
	.byte	W08
	.byte	W24
	.byte		N12	
	.byte	W24
	.byte		N16	
	.byte	W24
	.byte		N18	, Fn2, v084
	.byte	W24
	.byte		N16	, Fn2, v088
	.byte	W24
	.byte		N16	
	.byte	W24
	.byte		N19	, Fn2, v084
	.byte	W24
	.byte		N14	
	.byte	W24
	.byte		N12	, Fn2, v088
	.byte	W16
	.byte		N07	
	.byte	W32
	.byte		N36	
	.byte	W40
	.byte		N20	, Gs2
	.byte	W08
	.byte	W16
	.byte		N06	, Fn2
	.byte	W08
	.byte		N12	, Gs2
	.byte	W16
	.byte		N20	, As2
	.byte	W24
	.byte		N06	, Gs2
	.byte	W08
	.byte		N12	, As2
	.byte	W16
	.byte		N36	, Cn3
	.byte	W08
	.byte	W48
	.byte		N23	, Cn2
	.byte	W24
	.byte		N12	, Fn2
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte	FINE

	@********************** Track  6 **********************@

	.global song039_6
song039_6:	@ 0x087B5340
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 74
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N12	, Bn2, v124
	.byte		N12	, Dn3
	.byte	W36
	.byte		N19	, Bn2, v127
	.byte		N19	, Dn3
	.byte	W12
	.byte	W05
	.byte		N05	, As2, v068
	.byte	W02
	.byte			An2, v064
	.byte	W03
	.byte		N06	, Gn2, v060
	.byte	W04
	.byte		N05	, Fn2, v052
	.byte	W03
	.byte			Ds2, v048
	.byte	W03
	.byte		N03	, Dn2, v040
	.byte	W04
	.byte		N07	, Bn1, v116
	.byte		N07	, Dn2
	.byte	W16
	.byte		N09	
	.byte		N09	, Gn2
	.byte	W24
	.byte		N07	, Gn2, v120
	.byte		N07	, Bn2
	.byte	W08
	.byte		N10	, Bn2, v112
	.byte		N10	, Dn3
	.byte	W24
	.byte		N40	, Cs3
	.byte		N40	, En3
	.byte	W48
	.byte		N14	, Cs3, v100
	.byte		N14	, En3
	.byte	W24
	.byte		N13	, An2, v108
	.byte		N13	, Cs3
	.byte	W16
	.byte		N42	, En2, v112
	.byte		N42	, An2
	.byte	W08
	.byte	W96
	.byte	W48
	.byte		N12	, Dn3, v124
	.byte		N12	, Fn3
	.byte	W36
	.byte		N19	, Dn3, v127
	.byte		N19	, Fn3
	.byte	W12
	.byte	W05
	.byte		N05	, Cs3, v068
	.byte	W02
	.byte			Cn3, v064
	.byte	W03
	.byte		N06	, As2, v060
	.byte	W04
	.byte		N05	, Gs2, v052
	.byte	W03
	.byte			Fs2, v048
	.byte	W03
	.byte		N03	, Fn2, v040
	.byte	W04
	.byte		N07	, Dn2, v116
	.byte		N07	, Fn2
	.byte	W16
	.byte		N09	
	.byte		N09	, As2
	.byte	W24
	.byte		N07	, As2, v120
	.byte		N07	, Dn3
	.byte	W08
	.byte		N10	, Dn3, v112
	.byte		N10	, Fn3
	.byte	W24
	.byte		N40	, En3
	.byte		N40	, Gn3
	.byte	W48
	.byte		N14	, En3, v100
	.byte		N14	, Gn3
	.byte	W24
	.byte		N13	, Cn3, v108
	.byte		N13	, En3
	.byte	W16
	.byte		N42	, Gn2, v112
	.byte		N42	, Cn3
	.byte	W08
	.byte	W96
	.byte	W48
	.byte		N12	, Fn3, v124
	.byte		N12	, Gs3
	.byte	W36
	.byte		N19	, Fn3, v127
	.byte		N19	, Gs3
	.byte	W12
	.byte	W05
	.byte		N05	, En3, v068
	.byte	W02
	.byte			Ds3, v064
	.byte	W03
	.byte		N06	, Cs3, v060
	.byte	W04
	.byte		N05	, Bn2, v052
	.byte	W03
	.byte			An2, v048
	.byte	W03
	.byte		N03	, Gs2, v040
	.byte	W04
	.byte		N07	, Fn2, v116
	.byte		N07	, Gs2
	.byte	W16
	.byte		N09	
	.byte		N09	, Cs3
	.byte	W24
	.byte		N07	, Cs3, v120
	.byte		N07	, Fn3
	.byte	W08
	.byte		N15	, Fn3, v112
	.byte		N15	, Gs3
	.byte	W16
	.byte	VOL	, v127
	.byte		TIE	, Gn3
	.byte		TIE	, As3
	.byte	W08
	.byte	W03
	.byte	VOL	, v125
	.byte	W01
	.byte		v122
	.byte	W01
	.byte		v118
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v059
	.byte	W03
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W02
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v065
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W02
	.byte		v070
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W02
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v075
	.byte	W02
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W02
	.byte		v079
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v081
	.byte	W02
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W02
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W02
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v090
	.byte	W02
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
	.byte		v096
	.byte	W02
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W02
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
	.byte	W02
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v109
	.byte	W02
	.byte		v110
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v112
	.byte	W02
	.byte		v113
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v115
	.byte	W02
	.byte		v116
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v118
	.byte	W02
	.byte		v119
	.byte	W01
	.byte		EOT	, Gn3
	.byte			As3
	.byte	VOL	, v120
	.byte	W01
	.byte		v121
	.byte	W02
	.byte		v122
	.byte	W01
	.byte		v123
	.byte	W01
	.byte		v124
	.byte	W02
	.byte		v125
	.byte	W01
	.byte		v127
	.byte		N08	, Gn2, v108
	.byte		N08	, As2
	.byte	W08
	.byte		N16	, As2, v116
	.byte		N16	, Ds3
	.byte	W16
	.byte		N08	, As2, v112
	.byte	W08
	.byte		N16	, As2, v116
	.byte		N16	, Ds3
	.byte	W16
	.byte		N08	, Ds3, v108
	.byte		N08	, Gn3
	.byte	W08
	.byte		N16	, Gn3, v124
	.byte		N16	, As3
	.byte	W16
	.byte		TIE	, An3, v116
	.byte		TIE	, Cn4
	.byte	W08
	.byte	W06
	.byte	VOL	, v126
	.byte	W01
	.byte		v120
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v058
	.byte	W03
	.byte		v059
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W02
	.byte		v064
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W02
	.byte		v070
	.byte	W01
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
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v080
	.byte	W02
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W02
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W02
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W02
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v103
	.byte	W02
	.byte		v104
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v109
	.byte	W02
	.byte		v110
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v113
	.byte	W01
	.byte		v114
	.byte	W01
	.byte		v115
	.byte	W02
	.byte		v116
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v118
	.byte	W01
	.byte		v119
	.byte	W03
	.byte		v120
	.byte	W01
	.byte		v121
	.byte	W01
	.byte		v122
	.byte	W01
	.byte		v123
	.byte	W01
	.byte		v124
	.byte	W01
	.byte		v125
	.byte	W02
	.byte		v127
	.byte	W01
	.byte		EOT	, An3
	.byte			Cn4
	.byte	W08
	.byte		N08	, An2, v100
	.byte		N08	, Cn3
	.byte	W08
	.byte			Cn3, v112
	.byte		N08	, Fn3
	.byte	W08
	.byte			An2, v100
	.byte		N08	, Cn3
	.byte	W08
	.byte			Cn3, v104
	.byte		N08	, Fn3
	.byte	W08
	.byte			Fn3, v100
	.byte		N08	, An3
	.byte	W08
	.byte			Cn3, v104
	.byte		N08	, Fn3
	.byte	W08
	.byte			Fn3, v108
	.byte		N08	, An3
	.byte	W08
	.byte			An3, v104
	.byte		N08	, Cn4
	.byte	W08
	.byte			Fn3, v108
	.byte		N08	, An3
	.byte	W08
	.byte			An3, v116
	.byte		N08	, Cn4
	.byte	W08
	.byte	W05
	.byte	VOL	, v127
	.byte	FINE

	@********************** Track  7 **********************@

	.global song039_7
song039_7:	@ 0x087B560C
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 87
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
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
	.byte		N09	, An3, v084
	.byte		N08	, Cn4, v108
	.byte	W16
	.byte		N07	, An3, v068
	.byte		N06	, Cn4, v080
	.byte	W32
	.byte		N30	, An3, v092
	.byte		N30	, Cn4, v100
	.byte	W40
	.byte		N20	, Cn4, v116
	.byte		N20	, Ds4
	.byte	W08
	.byte	W16
	.byte		N09	, Gs3, v092
	.byte	W08
	.byte		N10	, Cn4, v084
	.byte		N12	, Ds4, v092
	.byte	W16
	.byte		N18	, As3, v108
	.byte		N20	, Dn4
	.byte	W24
	.byte		N13	, Fn3, v056
	.byte	W08
	.byte		N09	, As3, v108
	.byte		N08	, Dn4, v092
	.byte	W16
	.byte		N32	, Fn3, v072
	.byte		N24	, Gn3, v124
	.byte		N24	, Cn4, v108
	.byte	W08
	.byte	W24
	.byte	W01
	.byte		N04	, En3, v004
	.byte	W03
	.byte			Dn3, v092
	.byte	W03
	.byte		N03	, Cn3, v072
	.byte	W02
	.byte		N04	, Bn2, v100
	.byte	W02
	.byte			An2, v072
	.byte	W02
	.byte		N05	, Gn2, v092
	.byte	W03
	.byte		N13	, Fn2, v080
	.byte	W03
	.byte		N08	, En2, v084
	.byte	W07
	.byte		N04	, Gn2, v020
	.byte	W03
	.byte		N03	, An2, v052
	.byte	W01
	.byte			Bn2, v084
	.byte	W02
	.byte			Cn3, v080
	.byte	W02
	.byte			Dn3, v056
	.byte	W01
	.byte			En3, v044
	.byte	W03
	.byte			Fn3, v028
	.byte	W02
	.byte			Gn3, v020
	.byte	W02
	.byte			An3, v068
	.byte	W03
	.byte		N04	, Bn3, v080
	.byte	W03
	.byte		N09	, An3, v108
	.byte		N09	, Fn4
	.byte	W16
	.byte			An3
	.byte		N09	, Fn4
	.byte	W08
	.byte	W01
	.byte	FINE

	@********************** Track  8 **********************@

	.global song039_8
song039_8:	@ 0x087B56D4
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 118
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	W96
	.byte		N07	, Cn3, v127
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Dn3
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Cn3
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W07
	.byte	FINE

	@********************** Track  9 **********************@

	.global song039_9
song039_9:	@ 0x087B5745
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 124
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte		N07	, Cn3, v127
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte		N07	
	.byte	W07
	.byte	FINE

	@********************** Track  10 **********************@

	.global song039_10
song039_10:	@ 0x087B5785
	.byte	KEYSH	, 0
	.byte	VOICE	, 94
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N23	, An1, v124
	.byte	W12
	.byte			En2, v092
	.byte	W12
	.byte			An2, v112
	.byte	W12
	.byte			Bn2, v096
	.byte	W12
	.byte		N20	, En3, v100
	.byte	W12
	.byte		N23	, Cs3, v108
	.byte	W12
song039_10_1:
	.byte		N23	, An1, v100
	.byte	W12
	.byte			En2, v112
	.byte	W12
	.byte			An2, v104
	.byte	W12
	.byte		N24	, Bn2, v108
	.byte	W12
	.byte		N23	, Cs3
	.byte	W12
	.byte			En2, v112
	.byte	W12
	.byte	PEND
	.byte			An1, v124
	.byte	W12
	.byte			En2, v092
	.byte	W12
	.byte			An2, v112
	.byte	W12
	.byte			Bn2, v096
	.byte	W12
	.byte		N20	, En3, v100
	.byte	W12
	.byte		N23	, Cs3, v108
	.byte	W12
	.byte	PATT	
		mPtr	song039_10_1
	.byte		N23	, Dn1, v096
	.byte	W12
	.byte			An1, v084
	.byte	W12
	.byte			Fs2, v120
	.byte	W12
	.byte			An2, v104
	.byte	W12
	.byte			En3, v088
	.byte	W12
	.byte			Cs3, v096
	.byte	W12
	.byte			Dn1, v112
	.byte	W12
	.byte			An1, v127
	.byte	W12
	.byte			Fs2, v084
	.byte	W12
	.byte			An2, v096
	.byte	W12
	.byte			Bn2, v108
	.byte	W12
	.byte			Dn2, v104
	.byte	W12
	.byte			En1, v112
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte		N68	, Dn3
	.byte	W24
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOL	, v000
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v030
	.byte		N04	, Ds3, v104
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v035
	.byte		N04	, Gn3, v112
	.byte	W01
	.byte	VOL	, v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v040
	.byte		N04	, Fn3, v100
	.byte	W01
	.byte	VOL	, v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte		N04	, An3, v104
	.byte	W01
	.byte	VOL	, v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte		N04	, Gn3, v100
	.byte	W01
	.byte	VOL	, v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte		N04	, Bn3, v112
	.byte	W01
	.byte	VOL	, v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v060
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte		N04	, Fn3, v100
	.byte	W01
	.byte	VOL	, v065
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v069
	.byte		N04	, Gn3
	.byte	W01
	.byte	VOL	, v070
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte		N04	, Ds3, v096
	.byte	W01
	.byte	VOL	, v075
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte		N04	, Fn3, v108
	.byte	W01
	.byte	VOL	, v080
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte		N04	, An3, v104
	.byte	W01
	.byte	VOL	, v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v089
	.byte		N04	, Gn3, v100
	.byte	W01
	.byte	VOL	, v090
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte		N04	, Bn3, v108
	.byte	W01
	.byte	VOL	, v095
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v104
	.byte		N04	, Fn3, v096
	.byte	W01
	.byte	VOL	, v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v109
	.byte		N04	, Gn3, v104
	.byte	W01
	.byte	VOL	, v110
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v112
	.byte	W01
	.byte		v114
	.byte		N04	, Ds3, v088
	.byte	W01
	.byte	VOL	, v115
	.byte	W01
	.byte		v116
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v119
	.byte		N04	, Fn3, v100
	.byte	W01
	.byte	VOL	, v120
	.byte	W01
	.byte		v121
	.byte	W01
	.byte		v122
	.byte	W01
	.byte		v124
	.byte		N04	, An3, v104
	.byte	W01
	.byte	VOL	, v125
	.byte	W01
	.byte		v126
	.byte	W01
	.byte		v127
	.byte	W01
	.byte		N04	, Gn3, v100
	.byte	W04
	.byte			Bn3, v104
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			Gn3, v108
	.byte	W04
	.byte			Ds3, v092
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			An3, v108
	.byte	W04
	.byte			Gn3, v100
	.byte	W04
	.byte			Bn3, v108
	.byte	W04
	.byte			An3, v104
	.byte	W04
	.byte			Fn3, v112
	.byte	W04
	.byte			Gn3, v104
	.byte	W04
	.byte			Ds3, v092
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			Bn3, v104
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Fn3, v108
	.byte	W04
	.byte			Gn3, v104
	.byte	W04
	.byte			Ds3, v088
	.byte	W04
	.byte			Fn3, v108
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			Bn3, v104
	.byte	W04
	.byte			An3, v096
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			Ds3, v088
	.byte	W04
	.byte			Fn3, v100
	.byte	W04
	.byte			An3, v108
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			Bn3, v104
	.byte	W04
	.byte			An3, v100
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte	VOL	, v127
	.byte		N04	, Ds3, v088
	.byte	W02
	.byte	VOL	, v126
	.byte	W01
	.byte		v125
	.byte	W01
	.byte		v124
	.byte		N04	, Fn3, v100
	.byte	W01
	.byte	VOL	, v123
	.byte	W01
	.byte		v122
	.byte	W01
	.byte		v121
	.byte	W01
	.byte		v120
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v119
	.byte	W01
	.byte		v118
	.byte	W01
	.byte		v117
	.byte	W01
	.byte		v116
	.byte		N04	, Gn3, v096
	.byte	W01
	.byte	VOL	, v115
	.byte	W02
	.byte		v114
	.byte	W01
	.byte		v113
	.byte		N04	, Bn3, v104
	.byte	W01
	.byte	VOL	, v112
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v109
	.byte		N04	, An3, v108
	.byte	W01
	.byte	VOL	, v108
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v105
	.byte		N04	, Fn3, v104
	.byte	W01
	.byte	VOL	, v104
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		N04	, Gn3
	.byte	W01
	.byte	VOL	, v101
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v098
	.byte		N04	, Ds3, v092
	.byte	W01
	.byte	VOL	, v097
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v094
	.byte		N04	, Fn3, v104
	.byte	W01
	.byte	VOL	, v093
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v090
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v089
	.byte	W02
	.byte		v088
	.byte	W01
	.byte		v087
	.byte		N04	, Gn3, v092
	.byte	W01
	.byte	VOL	, v086
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v083
	.byte		N04	, Bn3, v100
	.byte	W01
	.byte	VOL	, v082
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v079
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v078
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v075
	.byte		N04	, Fn3, v108
	.byte	W02
	.byte	VOL	, v074
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v072
	.byte		N04	, Gn3, v104
	.byte	W01
	.byte	VOL	, v071
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v068
	.byte		N04	, Ds3, v092
	.byte	W01
	.byte	VOL	, v067
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v064
	.byte		N04	, Fn3, v108
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v062
	.byte	W02
	.byte		v061
	.byte		N04	, An3, v104
	.byte	W01
	.byte	VOL	, v060
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte		N04	, Gn3, v100
	.byte	W01
	.byte	VOL	, v056
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte		N04	, Bn3, v096
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte		N04	, An3, v100
	.byte	W02
	.byte	VOL	, v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v046
	.byte		N04	, Fn3, v104
	.byte	W01
	.byte	VOL	, v045
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte		N04	, Gn3
	.byte	W01
	.byte	VOL	, v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte		N04	, Ds3, v092
	.byte	W01
	.byte	VOL	, v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		N04	, Fn3, v104
	.byte	W02
	.byte	VOL	, v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte		N04	, An3
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte		N04	, Gn3, v088
	.byte	W01
	.byte	VOL	, v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte		N04	, Bn3, v100
	.byte	W01
	.byte	VOL	, v023
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte		N04	, An3, v108
	.byte	W01
	.byte	VOL	, v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte		N04	, Fn3, v104
	.byte	W01
	.byte	VOL	, v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte		N04	, Gn3, v108
	.byte	W01
	.byte	VOL	, v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		N04	, Ds3, v084
	.byte	W01
	.byte	VOL	, v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte		N04	, Fn3, v108
	.byte	W01
	.byte	VOL	, v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte		N04	, An3, v104
	.byte	W01
	.byte	VOL	, v001
	.byte	W01
	.byte		v000
	.byte	W02
	.byte		N04	, Gn3, v096
	.byte	W04
	.byte			Bn3, v108
	.byte	W04
	.byte			An3, v100
	.byte	W04
	.byte			Fn3, v104
	.byte	W04
	.byte			Gn3, v096
	.byte	W04
	.byte			Ds3, v092
	.byte	W04
	.byte			Fn3, v096
	.byte	W04
	.byte			An3, v104
	.byte	W04
	.byte			Gn3, v100
	.byte	W32
	.byte	W96
	.byte	W96
	.byte	VOL	, v127
	.byte	FINE

	@********************** Track  11 **********************@

	.global song039_11
song039_11:	@ 0x087B5B50
	.byte	KEYSH	, 0
	.byte	VOICE	, 97
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	W64
	.byte	VOL	, v000
	.byte	W04
	.byte		v001
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		v003
	.byte		TIE	, En3, v127
	.byte		TIE	, En4
	.byte	W01
	.byte	VOL	, v004
	.byte	W02
	.byte		v005
	.byte	W02
	.byte		v006
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v015
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W01
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W05
	.byte		v054
	.byte	W03
	.byte		v053
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v048
	.byte	W03
	.byte		v047
	.byte	W03
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W03
	.byte		v044
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		EOT	, En3
	.byte		TIE	, An3
	.byte	W01
	.byte	VOL	, v039
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W03
	.byte		v034
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v031
	.byte	W03
	.byte		v030
	.byte	W03
	.byte		v029
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v027
	.byte	W03
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W08
	.byte		v025
	.byte	W05
	.byte		v026
	.byte	W04
	.byte		v027
	.byte	W04
	.byte		v028
	.byte	W05
	.byte		v029
	.byte	W04
	.byte		EOT	, En4
	.byte	VOL	, v030
	.byte		N72	, Dn4
	.byte	W05
	.byte	VOL	, v031
	.byte	W04
	.byte		v032
	.byte	W04
	.byte		v033
	.byte	W05
	.byte		v034
	.byte	W04
	.byte		v035
	.byte	W04
	.byte		v036
	.byte	W05
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W02
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		EOT	, An3
	.byte	VOL	, v004
	.byte		TIE	, Gs3
	.byte		TIE	, Bn3
	.byte		TIE	, Dn4
	.byte	W13
	.byte	VOL	, v005
	.byte	W06
	.byte		v006
	.byte	W07
	.byte		v007
	.byte	W06
	.byte		v008
	.byte	W07
	.byte		v009
	.byte	W06
	.byte		v010
	.byte	W07
	.byte		v011
	.byte	W06
	.byte		v012
	.byte	W07
	.byte		v013
	.byte	W06
	.byte		v014
	.byte	W01
	.byte	W06
	.byte		v015
	.byte	W06
	.byte		v016
	.byte	W07
	.byte		v017
	.byte	W06
	.byte		v018
	.byte	W07
	.byte		v019
	.byte	W06
	.byte		v020
	.byte	W07
	.byte		v021
	.byte	W06
	.byte		v022
	.byte	W07
	.byte		v023
	.byte	W06
	.byte		v024
	.byte	W07
	.byte		v025
	.byte	W01
	.byte	W05
	.byte		v026
	.byte	W01
	.byte		v027
	.byte	W08
	.byte		v026
	.byte	W04
	.byte		v025
	.byte	W04
	.byte		v024
	.byte	W05
	.byte		v023
	.byte	W04
	.byte		v022
	.byte	W04
	.byte		v021
	.byte	W04
	.byte		v020
	.byte	W04
	.byte		v019
	.byte	W05
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
	.byte	W03
	.byte	W01
	.byte		v012
	.byte	W04
	.byte		v011
	.byte	W04
	.byte		v010
	.byte	W04
	.byte		v009
	.byte	W05
	.byte		v008
	.byte	W04
	.byte		v007
	.byte	W04
	.byte		v006
	.byte	W04
	.byte		v005
	.byte	W04
	.byte		v004
	.byte	W05
	.byte		v003
	.byte	W04
	.byte		v002
	.byte	W04
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W24
	.byte		EOT	, Gs3
	.byte			Bn3
	.byte			Dn4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 0
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	FINE

	@********************** Track  12 **********************@

	.global song039_12
song039_12:	@ 0x087B5D13
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	VOICE	, 57
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 33
	.byte	LFOS	, 65
	.byte	LFODL	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	MOD	, 64
	.byte	VOL	, v000
	.byte		TIE	, Gs2, v127
	.byte	W06
	.byte	VOL	, v001
	.byte	W03
	.byte		v002
	.byte	W04
	.byte		v003
	.byte	W03
	.byte		v004
	.byte	W03
	.byte		v005
	.byte	W03
	.byte		v006
	.byte	W04
	.byte		v007
	.byte	W03
	.byte		v008
	.byte	W03
	.byte		v009
	.byte	W03
	.byte		v010
	.byte	W04
	.byte		v011
	.byte	W03
	.byte		v012
	.byte	W03
	.byte		v013
	.byte	W03
	.byte		v014
	.byte	W04
	.byte		v015
	.byte	W03
	.byte		v016
	.byte	W03
	.byte		v017
	.byte	W03
	.byte		v018
	.byte	W04
	.byte		v019
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v021
	.byte	W01
	.byte	W02
	.byte		v022
	.byte	W04
	.byte		v023
	.byte	W03
	.byte		v024
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v026
	.byte	W04
	.byte		v027
	.byte	W03
	.byte		v028
	.byte	W03
	.byte		v029
	.byte	W03
	.byte		v030
	.byte	W04
	.byte		v031
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v033
	.byte	W03
	.byte		v034
	.byte	W04
	.byte		v035
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W04
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W04
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W22
	.byte		v044
	.byte	W04
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v027
	.byte	W02
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W02
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W03
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W02
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W08
	.byte		EOT	
	.byte	FINE

	@********************** Track  13 **********************@

	.global song039_13
song039_13:	@ 0x087B5DF2
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 78
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
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
	.byte		N42	, Cn4, v116
	.byte	W48
	.byte		N13	
	.byte	W16
	.byte		N08	
	.byte	W24
	.byte		N44	
	.byte	W08
	.byte	W96
	.byte		N10	, Cn3, v096
	.byte		N11	, Cn4, v116
	.byte	W16
	.byte		N10	, Cn3, v076
	.byte		N08	, Cn4, v112
	.byte	W32
	.byte		N32	, Cn3, v108
	.byte		N32	, Cn4, v116
	.byte	W40
	.byte		N44	, Ds3, v127
	.byte		N42	, Ds4, v124
	.byte	W08
	.byte	W40
	.byte		N44	, Fn3, v120
	.byte		N44	, Fn4, v116
	.byte	W48
	.byte		N72	, Gn3, v112
	.byte		N76	, Gn4, v116
	.byte	W08
	.byte	W72
	.byte		N11	, Cn4, v112
	.byte		N12	, Cn5
	.byte	W16
	.byte			Cn4, v120
	.byte		N14	, Cn5, v112
	.byte	W08
	.byte	W06
	.byte	FINE

	@********************** Track  14 **********************@

	.global song039_14
song039_14:	@ 0x087B5E6E
	.byte	KEYSH	, 0
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 77
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N23	, En3, v127
	.byte		N23	, En4
	.byte	W24
	.byte			An3, v120
	.byte		N23	, An4
	.byte	W24
	.byte		N15	, Cs4
	.byte		N15	, Cs5
	.byte	W16
	.byte		N68	, Dn4, v127
	.byte		N68	, Dn5
	.byte	W08
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		N23	, Gn3, v116
	.byte		N23	, Gn4
	.byte	W24
	.byte			Cn4, v112
	.byte		N23	, Cn5
	.byte	W24
	.byte		N15	, En4, v124
	.byte		N15	, En5
	.byte	W16
	.byte		N64	, Fn4, v116
	.byte		N64	, Fn5
	.byte	W08
	.byte	W56
	.byte	FINE

	mAlignWord
	.global C_DECL(song039)
C_DECL(song039):	@ 0x087B5ED0
	.byte	14		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

mAlignWord
	mPtr	voicegroup000		@ voicegroup/tone

	mPtr	song039_1		@ track
	mPtr	song039_2		@ track
	mPtr	song039_3		@ track
	mPtr	song039_4		@ track
	mPtr	song039_5		@ track
	mPtr	song039_6		@ track
	mPtr	song039_7		@ track
	mPtr	song039_8		@ track
	mPtr	song039_9		@ track
	mPtr	song039_10		@ track
	mPtr	song039_11		@ track
	mPtr	song039_12		@ track
	mPtr	song039_13		@ track
	mPtr	song039_14		@ track
