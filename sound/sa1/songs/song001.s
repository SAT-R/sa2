	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song001_1
song001_1:	@ 0x0879C304
	.byte	KEYSH	, 0
	.byte	TEMPO	, 90
	.byte	VOICE	, 127
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	TEMPO	, 84
	.byte		N05	, Cs1, v124
	.byte	W06
	.byte			Cs1, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Gs1, v127
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte			Cn1, v108
	.byte	W06
	.byte		N11	, Cs1
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song001_1_1:
	.byte		N12	, Cn1, v127
	.byte		N96	, Cs2
	.byte	W12
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v028
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, En1, v080
	.byte	W12
	.byte	PEND
song001_1_2:
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v056
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte	PEND
song001_1_3:
	.byte		N12	, Cn1, v127
	.byte		N96	, Cs2
	.byte	W12
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v028
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, En1, v080
	.byte	W12
	.byte	PEND
	.byte			Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, En1, v080
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v056
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte	PATT	
		mPtr	song001_1_1
	.byte	PATT	
		mPtr	song001_1_2
	.byte	PATT	
		mPtr	song001_1_3
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, En1, v080
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v056
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N96	, Cs2
	.byte	W12
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v028
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v036
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
song001_1_4:
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v056
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v028
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte	PEND
	.byte			Cn1, v127
	.byte		N68	, Cs2
	.byte	W24
	.byte		N12	, Cs1
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, En1, v056
	.byte	W24
	.byte		N12	, Gn1, v127
	.byte	W12
	.byte			Cn1
	.byte		N92	, Cs2
	.byte	W12
	.byte		N12	, Gs1
	.byte	W12
	.byte			Cs1
	.byte	W12
	.byte			Cn1
	.byte		N24	, En1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N12	, En1, v056
	.byte	W24
	.byte			Cn1, v127
	.byte		N96	, Cs2
	.byte	W24
	.byte		N12	, Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v028
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte	PATT	
		mPtr	song001_1_4
	.byte	PATT	
		mPtr	song001_1_4
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v056
	.byte	W12
	.byte			Dn1
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v068
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v056
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, En1, v056
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N12	, Cn1
	.byte		N36	, En1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N36	, En1, v056
	.byte	W24
	.byte		N12	, Gn1, v127
	.byte	W12
	.byte			Cn1
	.byte		N36	, En1, v056
	.byte	W24
	.byte	W12
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Cn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte			Cn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cs1
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cn1
	.byte		N36	, En1, v056
	.byte	W24
	.byte		N12	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N36	, En1, v056
	.byte	W24
	.byte		N12	, Gn1, v127
	.byte	W12
	.byte			Cn1
	.byte		N12	, En1, v056
	.byte	W12
	.byte			Cn1, v127
	.byte		TIE	, Cs2
	.byte	W12
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  2 **********************@

	.global song001_2
song001_2:	@ 0x0879C5AD
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 11
	.byte	VOL	, v047
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 3
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W36
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOL	, v055
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N15	, Gs3, v120
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W14
	.byte		c_v-12
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Gs3, v104
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N11	, Cn4, v120
	.byte	W12
	.byte		N10	, Gs3, v112
	.byte	W12
	.byte		TIE	, Dn4, v127
	.byte	W12
	.byte	W02
	.byte	VOL	, v053
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v021
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
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W32
	.byte	W02
	.byte		EOT	
	.byte	W10
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N18	, Gs3, v120
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W11
	.byte		c_v
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Gs3, v096
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N10	, Cn4, v116
	.byte	W12
	.byte		N09	, Gs3, v108
	.byte	W12
	.byte		N10	, Ds4, v120
	.byte	W10
	.byte	BEND	, c_v
	.byte	W02
	.byte	W12
	.byte		N32	, Dn4, v127
	.byte	W09
	.byte	VOL	, v050
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v016
	.byte	W03
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v022
	.byte	W02
	.byte		v023
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v032
	.byte		N11	
	.byte	W01
	.byte	VOL	, v033
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v041
	.byte		N11	, Ds4
	.byte	W02
	.byte	VOL	, v042
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v049
	.byte	W02
	.byte		v050
	.byte		N23	, En4
	.byte	W01
	.byte	VOL	, v051
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W18
	.byte		TIE	, Fn3
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N44	, Gs3
	.byte	W48
	.byte		N92	, Gn3
	.byte	W96
	.byte	BEND	, c_v
	.byte		N30	, Cn4
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte		N30	
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte		N30	
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		N23	
	.byte	W24
	.byte		N11	, Bn3
	.byte	W12
	.byte			As3
	.byte	W12
	.byte			An3
	.byte	W12
	.byte		N68	, Gs3
	.byte	W24
	.byte	W96
	.byte	W48
	.byte		N44	
	.byte	W48
	.byte		N96	, Bn3
	.byte	W96
	.byte	W24
	.byte		N09	, Fn3
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N08	, As3
	.byte	W12
	.byte		N32	, Ds4
	.byte	W36
	.byte			Gn3
	.byte	W36
	.byte		N28	, Gs3
	.byte	W36
	.byte		N76	, Cs4
	.byte	W24
	.byte	W60
	.byte		N10	, As3
	.byte	W12
	.byte		N20	, Bn3
	.byte	W22
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v-27
	.byte		N72	, Cn4
	.byte	W01
	.byte	BEND	, c_v-55
	.byte	W01
	.byte		c_v-59
	.byte	W12
	.byte		c_v-59
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
	.byte		c_v-37
	.byte	W01
	.byte		c_v-33
	.byte	W02
	.byte		c_v-29
	.byte	W01
	.byte		c_v-25
	.byte	W02
	.byte		c_v-21
	.byte	W01
	.byte		c_v-18
	.byte	W02
	.byte		c_v-14
	.byte	W01
	.byte		c_v-10
	.byte	W02
	.byte		c_v-6
	.byte	W01
	.byte		c_v-2
	.byte	W01
	.byte		c_v
	.byte	W13
	.byte		c_v
	.byte	W02
	.byte		c_v+4
	.byte	W01
	.byte		c_v+9
	.byte	W02
	.byte		c_v+13
	.byte	W01
	.byte		c_v+18
	.byte	W02
	.byte		c_v+22
	.byte	W01
	.byte		c_v+27
	.byte	W02
	.byte		c_v+31
	.byte	W01
	.byte		c_v+36
	.byte	W02
	.byte		c_v+40
	.byte	W01
	.byte		c_v+45
	.byte	W02
	.byte		c_v+50
	.byte	W01
	.byte		c_v+54
	.byte	W02
	.byte		c_v+60
	.byte	W02
	.byte		N12	
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	FINE

	@********************** Track  3 **********************@

	.global song001_3
song001_3:	@ 0x0879C804
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 80
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 0
	.byte	MOD	, 32
	.byte	MODT	, 2
	.byte	W96
	.byte	W96
	.byte	W36
	.byte		N22	, Ds3, v127
	.byte	W24
	.byte		N17	
	.byte	W18
	.byte		N05	, Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N07	, Ds3
	.byte	W24
	.byte		TIE	, Fn3
	.byte	W12
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
song001_3_1:
	.byte	W24
	.byte		N17	, Ds3, v127
	.byte	W18
	.byte		N05	, Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N07	, Ds3
	.byte	W24
	.byte		N18	, Fn3
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N78	
	.byte	W84
	.byte	W24
	.byte		N17	, Ds3
	.byte	W18
	.byte		N05	, Dn3
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte		N07	, Ds3
	.byte	W24
	.byte		TIE	, Fn3
	.byte	W12
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	PATT	
		mPtr	song001_3_1
	.byte	W12
	.byte		N32	, Fn3, v127
	.byte	W36
	.byte		N11	, Fn3, v104
	.byte	W12
	.byte			Fs3, v112
	.byte	W12
	.byte		N19	, Gn3, v108
	.byte	W24
	.byte		TIE	, Gs3, v120
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N92	, Gn3, v104
	.byte	W96
	.byte		N28	
	.byte	W36
	.byte		N30	, Gn3, v084
	.byte	W36
	.byte			Gn3, v116
	.byte	W24
	.byte	W12
	.byte		N21	, Gn3, v120
	.byte	W24
	.byte		N11	, Fs3, v112
	.byte	W12
	.byte			Fn3, v104
	.byte	W12
	.byte			En3, v092
	.byte	W12
	.byte		TIE	, Ds3, v096
	.byte	W24
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Dn3, v108
	.byte	W96
	.byte	W32
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N14	, Dn3, v112
	.byte	W24
	.byte		N30	, Dn3, v108
	.byte	W30
	.byte	FINE

	@********************** Track  4 **********************@

	.global song001_4
song001_4:	@ 0x0879C8B6
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 87
	.byte	VOL	, v093
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 0
	.byte	MOD	, 32
	.byte	MODT	, 2
	.byte	W96
	.byte	W96
	.byte	W36
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N02	, Dn2, v040
	.byte	W03
	.byte			Ds2, v092
	.byte	W02
	.byte			Fn2, v044
	.byte	W03
	.byte		N01	, Gn2, v068
	.byte	W02
	.byte			An2, v096
	.byte	W02
	.byte			As2, v108
	.byte	W02
	.byte			Dn3, v120
	.byte	W01
	.byte		N02	, Ds3, v112
	.byte	W04
	.byte		N01	, An3, v116
	.byte	W01
	.byte			As3, v104
	.byte	W01
	.byte			Cn4, v092
	.byte	W02
	.byte		N02	, Dn4, v080
	.byte	W01
	.byte	W02
	.byte		N01	, Ds4, v020
	.byte	W01
	.byte		N04	, En4, v096
	.byte	W05
	.byte		N48	, Fn4, v092
	.byte	W48
	.byte	W03
	.byte		N04	, En4, v100
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte		N05	, Cs4, v084
	.byte	W08
	.byte		N02	, As3, v032
	.byte	W04
	.byte		N05	, Ds4, v116
	.byte	W06
	.byte			Cs4, v096
	.byte	W07
	.byte		N04	, As3, v060
	.byte	W07
	.byte		N03	, Gs3, v068
	.byte	W05
	.byte		N06	, Cs4, v116
	.byte	W06
	.byte		N05	, As3, v096
	.byte	W06
	.byte			Gs3, v104
	.byte	W07
	.byte			Fn3, v084
	.byte	W16
	.byte			Gs3, v108
	.byte	W08
	.byte		N02	, Fn3, v056
	.byte	W05
	.byte		N05	, As3, v100
	.byte	W09
	.byte		N02	, Fn3, v028
	.byte	W03
	.byte		N05	, Bn3, v116
	.byte	W06
	.byte			As3, v088
	.byte	W06
	.byte		N06	, Gs3, v104
	.byte	W07
	.byte		N04	, Fn3, v084
	.byte	W05
	.byte		N06	, Bn3, v096
	.byte	W06
	.byte		N07	, Cn4, v104
	.byte	W12
	.byte		N05	, Bn3, v120
	.byte	W12
	.byte			As3, v096
	.byte	W11
	.byte			Gs3, v116
	.byte	W06
	.byte			Gn3, v092
	.byte	W07
	.byte		N04	, Fn3, v100
	.byte	W06
	.byte		N05	, En3, v088
	.byte	W06
	.byte			Gn3, v116
	.byte	W07
	.byte			Cs3, v108
	.byte	W11
	.byte		N09	, Ds3, v116
	.byte	W10
	.byte		N04	, Cs3, v104
	.byte	W02
	.byte	W04
	.byte		N03	, Cn3, v076
	.byte	W04
	.byte		N04	, Ds3, v084
	.byte	W05
	.byte		N03	, Dn3, v088
	.byte	W03
	.byte		N05	, Cs3, v072
	.byte	W06
	.byte			Cn3, v100
	.byte	W06
	.byte			Bn2, v092
	.byte	W05
	.byte		N03	, As2, v060
	.byte	W06
	.byte		N05	, Gs2, v084
	.byte	W06
	.byte			Gn2
	.byte	W07
	.byte		N02	, Fn2, v068
	.byte	W06
	.byte		N04	, Gs2, v108
	.byte	W06
	.byte		N02	, Fn2, v048
	.byte	W05
	.byte		N05	, Gn2, v076
	.byte	W06
	.byte			Gs2, v096
	.byte	W07
	.byte			As2, v064
	.byte	W06
	.byte			Bn2, v072
	.byte	W06
	.byte		N06	, Cn3
	.byte	W02
	.byte	W05
	.byte		N05	, Ds3, v092
	.byte	W06
	.byte			Gn3, v080
	.byte	W07
	.byte		N06	, As3, v108
	.byte	W08
	.byte		N04	, Gn3, v024
	.byte	W04
	.byte		N07	, Gs3, v100
	.byte	W08
	.byte		N05	, Gn3, v072
	.byte	W05
	.byte		N03	, Fs3, v076
	.byte	W05
	.byte		N04	, Fn3, v084
	.byte	W06
	.byte		N05	, En3, v080
	.byte	W06
	.byte		N03	, Ds3, v068
	.byte	W06
	.byte		N06	, Cs3
	.byte	W30
	.byte	W08
	.byte		N01	, Bn2, v080
	.byte	W02
	.byte		N02	, As2, v040
	.byte	W04
	.byte		N10	, Cn3, v096
	.byte	W12
	.byte		N23	, Ds3, v124
	.byte	W24
	.byte		N03	, Cn3, v092
	.byte	W05
	.byte		N04	, Ds3, v084
	.byte	W05
	.byte		N12	, Fs3, v124
	.byte	W13
	.byte		N04	, Ds3, v072
	.byte	W06
	.byte			Fs3, v100
	.byte	W05
	.byte		N12	, Gs3, v124
	.byte	W12
	.byte		N03	, Fs3, v080
	.byte	W04
	.byte		N06	, Gs3, v064
	.byte	W07
	.byte		N12	, As3, v116
	.byte	W12
	.byte		N05	, Gs3, v096
	.byte	W07
	.byte			As3, v080
	.byte	W05
	.byte		N10	, Cn4, v120
	.byte	W12
	.byte		N02	, As3, v076
	.byte	W06
	.byte		N05	, Cn4, v100
	.byte	W06
	.byte		N11	, Ds4, v120
	.byte	W13
	.byte		N03	, Cn4, v052
	.byte	W06
	.byte		N05	, Ds4, v096
	.byte	W06
	.byte			Fn4, v120
	.byte	W06
	.byte		N06	, Fs4, v124
	.byte	W06
	.byte		N22	, Gn4, v112
	.byte	W24
	.byte	W01
	.byte		N04	, Fs4
	.byte	W06
	.byte			Fn4
	.byte	W05
	.byte			Ds4, v096
	.byte	W06
	.byte		N05	, Dn4
	.byte	W06
	.byte		N04	, Cn4, v084
	.byte	W07
	.byte			As3, v068
	.byte	W06
	.byte		N02	, Bn3, v104
	.byte	W05
	.byte		N06	, Gn4, v124
	.byte	W07
	.byte		N04	, Bn3, v092
	.byte	W06
	.byte		N02	, As3, v072
	.byte	W06
	.byte		N04	, Gs3, v104
	.byte	W05
	.byte			Gn3, v076
	.byte	W06
	.byte		N05	, Fn3, v084
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte		N06	, Cn4, v108
	.byte	W07
	.byte		N04	, Gn3, v076
	.byte	W05
	.byte			Fn3, v092
	.byte	W06
	.byte		N02	, En3, v088
	.byte	W05
	.byte			Ds3, v092
	.byte	W05
	.byte		N05	, Cs3
	.byte	W06
	.byte		N02	, Bn2, v048
	.byte	W02
	.byte		N04	, As2, v088
	.byte	W05
	.byte		N05	, Ds3, v120
	.byte	W06
	.byte		N04	, Cs3, v112
	.byte	W05
	.byte		N02	, Bn2, v080
	.byte	W03
	.byte			As2, v096
	.byte	W02
	.byte		N05	, An2, v072
	.byte	W06
	.byte		N03	, Gn2, v056
	.byte	W04
	.byte		N02	, Fn2, v060
	.byte	W03
	.byte		N08	, Ds2, v088
	.byte	W08
	.byte		N04	, As1, v084
	.byte	W06
	.byte	W96
	.byte	W96
	.byte		N36	, As1, v124
	.byte		N36	, As2, v104
	.byte	W36
	.byte			Bn1, v124
	.byte		N36	, Bn2, v104
	.byte	W36
	.byte		N12	, Cn2, v124
	.byte		N12	, Cn3, v104
	.byte	W12
	.byte			Cn2, v124
	.byte		N12	, Cn3, v104
	.byte	W12
	.byte	FINE

	@********************** Track  5 **********************@

	.global song001_5
song001_5:	@ 0x0879CADA
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 3
	.byte	VOL	, v066
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N06	, Gs3, v112
	.byte	W06
	.byte			Cn4, v108
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Gs4, v096
	.byte	W06
	.byte			As4, v108
	.byte	W06
	.byte			Cn5, v104
	.byte	W06
	.byte			Fn3, v108
	.byte	W06
	.byte			Gs3, v116
	.byte	W06
	.byte			Cs4
	.byte	W06
	.byte			Ds4, v096
	.byte	W06
	.byte			Fn4, v116
	.byte	W06
	.byte			Gs4, v124
	.byte	W06
	.byte			Cs3, v096
	.byte	W06
	.byte			Fs3, v116
	.byte	W06
	.byte			Gs3, v112
	.byte	W06
	.byte			As3, v104
	.byte	W06
	.byte			Cs4, v108
	.byte	W06
	.byte			Fs4, v120
	.byte	W06
	.byte			Gs4, v108
	.byte	W06
	.byte			As4, v116
	.byte	W06
	.byte			Cs5
	.byte	W06
	.byte			As4, v108
	.byte	W06
	.byte			Fs4, v112
	.byte	W06
	.byte			Cs4, v104
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			Fs4, v124
	.byte	W06
	.byte			Cs4, v112
	.byte	W06
	.byte			As3, v088
	.byte	W06
	.byte			Cs4, v124
	.byte	W06
	.byte			As3, v108
	.byte	W06
	.byte			Fs3, v116
	.byte	W06
	.byte			Cs3, v127
	.byte	W06
	.byte		N36	, Cn4, v112
	.byte	W36
	.byte		N36	
	.byte	W36
	.byte		N12	, Cn4, v108
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte	FINE

	@********************** Track  6 **********************@

	.global song001_6
song001_6:	@ 0x0879CB72
	.byte	KEYSH	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 72
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 0
	.byte	MOD	, 32
	.byte	MODT	, 2
	.byte	W96
	.byte	W96
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
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N36	, Cn3, v096
	.byte	W36
	.byte			Fn3
	.byte	W36
	.byte		TIE	, As2
	.byte	W24
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  7 **********************@

	.global song001_7
song001_7:	@ 0x0879CBAC
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	VOL	, v070
	.byte		TIE	, Fn1, v120
	.byte	W24
	.byte	W24
	.byte			As2
	.byte	W48
	.byte			Ds3
	.byte	W24
	.byte	W23
	.byte		EOT	, Fn1
	.byte	W01
	.byte		TIE	, Fn2
	.byte		TIE	, Gs3
	.byte	W08
	.byte	VOL	, v070
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W04
	.byte		v038
	.byte	W02
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v043
	.byte	W03
	.byte		v044
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v046
	.byte	W03
	.byte		v047
	.byte	W02
	.byte		v048
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v052
	.byte	W02
	.byte		v053
	.byte	W03
	.byte		v054
	.byte	W02
	.byte		v055
	.byte	W01
	.byte	W01
	.byte		v056
	.byte	W03
	.byte		v057
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v059
	.byte	W02
	.byte		v060
	.byte	W03
	.byte		v061
	.byte	W02
	.byte		v062
	.byte	W02
	.byte		v063
	.byte	W02
	.byte		v064
	.byte	W03
	.byte		v065
	.byte	W02
	.byte		v066
	.byte	W02
	.byte		v067
	.byte	W03
	.byte		v068
	.byte	W02
	.byte		v068
	.byte	W02
	.byte		v069
	.byte	W02
	.byte		v070
	.byte	W03
	.byte		v071
	.byte	W02
	.byte		v072
	.byte	W02
	.byte		v073
	.byte	W03
	.byte		v074
	.byte	W02
	.byte		v075
	.byte	W02
	.byte		v076
	.byte	W02
	.byte		v077
	.byte	W03
	.byte		v078
	.byte	W02
	.byte		v079
	.byte	W02
	.byte		v080
	.byte	W02
	.byte		v081
	.byte	W03
	.byte		v082
	.byte	W02
	.byte		v083
	.byte	W02
	.byte		v084
	.byte	W03
	.byte		v085
	.byte	W02
	.byte		v085
	.byte	W02
	.byte		v086
	.byte	W02
	.byte		v087
	.byte	W03
	.byte		v088
	.byte	W02
	.byte		v089
	.byte	W02
	.byte		v090
	.byte	W02
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W17
	.byte		EOT	, Fn2
	.byte			As2
	.byte			Ds3
	.byte			Gs3
	.byte	W01
	.byte		N04	, Fn2, v060
	.byte		N04	, Fn3
	.byte	W04
	.byte			Gn2, v068
	.byte		N04	, Gn3
	.byte	W04
	.byte			Gs2, v080
	.byte		N04	, Gs3
	.byte	W04
	.byte			As2, v088
	.byte		N04	, As3
	.byte	W04
	.byte			Cn3, v100
	.byte		N04	, Cn4
	.byte	W04
	.byte			Dn3, v108
	.byte		N04	, Dn4
	.byte	W04
	.byte			En3, v120
	.byte		N04	, En4
	.byte	W04
	.byte	VOL	, v094
	.byte		N16	, Fn2, v127
	.byte		N16	, Fn3
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N16	, Gs2, v100
	.byte		N16	, Cn3
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W14
	.byte		c_v-12
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Gs2, v104
	.byte		N11	, Cn3
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N11	, Cn3, v116
	.byte		N11	, Ds3
	.byte	W12
	.byte		N09	, Gs2, v112
	.byte		N09	, Cn3
	.byte	W12
	.byte		TIE	, Dn3, v124
	.byte		TIE	, Fn3
	.byte	W12
	.byte	W02
	.byte	VOL	, v092
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
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
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W40
	.byte	W01
	.byte		EOT	, Dn3
	.byte			Fn3
	.byte	W03
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N15	, Gs2, v104
	.byte		N15	, Cn3
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W11
	.byte		c_v
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Gs2, v108
	.byte		N11	, Cn3
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N11	, Cn3, v112
	.byte		N11	, Ds3
	.byte	W12
	.byte		N10	, Gs2, v096
	.byte		N10	, Cn3
	.byte	W12
	.byte			Ds3, v120
	.byte		N10	, Gn3
	.byte	W10
	.byte	BEND	, c_v
	.byte	W02
	.byte	W12
	.byte		N80	, Dn3
	.byte		N80	, Fn3
	.byte	W09
	.byte	VOL	, v088
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W02
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
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v068
	.byte	W02
	.byte		v069
	.byte	W01
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
	.byte	W01
	.byte		v076
	.byte	W02
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
	.byte	W02
	.byte		v085
	.byte	W01
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
	.byte	W01
	.byte		v091
	.byte	W02
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W18
	.byte		v094
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N15	, Cn3
	.byte		N15	, Fn3
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W14
	.byte		c_v-12
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Cn3, v104
	.byte		N11	, Fn3
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N11	, Ds3, v120
	.byte		N11	, Gs3
	.byte	W12
	.byte		N10	, Cn3, v112
	.byte		N10	, Fn3
	.byte	W12
	.byte		TIE	, Fn3, v127
	.byte		TIE	, As3
	.byte	W12
	.byte	W02
	.byte	VOL	, v092
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
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
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W32
	.byte	W02
	.byte		EOT	, Fn3
	.byte			As3
	.byte	W10
	.byte	W23
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		N18	, Cn3, v120
	.byte		N18	, Fn3
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v
	.byte	W11
	.byte		c_v
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-25
	.byte		N11	, Cn3, v096
	.byte		N11	, Fn3
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v
	.byte	W10
	.byte		N10	, Fn3, v116
	.byte		N10	, Gs3
	.byte	W12
	.byte		N09	, Cn3, v108
	.byte		N09	, Fn3
	.byte	W12
	.byte		N10	, Gs3, v120
	.byte		N10	, Cn4
	.byte	W10
	.byte	BEND	, c_v
	.byte	W02
	.byte	W12
	.byte		N32	, Fn3, v127
	.byte		N32	, As3
	.byte	W09
	.byte	VOL	, v088
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W02
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
	.byte	W02
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v068
	.byte	W02
	.byte		v069
	.byte	W01
	.byte		v070
	.byte		N11	, Fn3
	.byte		N11	, As3
	.byte	W01
	.byte	VOL	, v071
	.byte	W01
	.byte		v072
	.byte	W02
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v076
	.byte	W02
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v080
	.byte		N11	, Fs3
	.byte		N11	, Bn3
	.byte	W02
	.byte	VOL	, v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W02
	.byte		v085
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W02
	.byte		v088
	.byte		N23	, Gn3
	.byte		N23	, Cn4
	.byte	W01
	.byte	VOL	, v089
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v091
	.byte	W02
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W18
	.byte		N36	, Gs3
	.byte		N36	, Cs4
	.byte	W01
	.byte	BEND	, c_v
	.byte	W16
	.byte		c_v
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v-10
	.byte	W01
	.byte		c_v-15
	.byte	W02
	.byte		c_v-20
	.byte	W01
	.byte		c_v-25
	.byte	W02
	.byte		c_v-30
	.byte	W01
	.byte		c_v-36
	.byte	W02
	.byte		c_v-41
	.byte	W01
	.byte		c_v-46
	.byte	W02
	.byte		c_v-51
	.byte	W01
	.byte		c_v-56
	.byte	W02
	.byte		c_v-64
	.byte	W09
	.byte		c_v-30
	.byte	W01
	.byte		c_v
	.byte	W03
	.byte		N92	, Gs2
	.byte	W48
	.byte			Cs3
	.byte	W48
	.byte		N44	, Fn3
	.byte	W48
	.byte		N92	, Cn3
	.byte		N92	, En3
	.byte	W96
	.byte	BEND	, c_v
	.byte		N30	
	.byte		N30	, Gn3
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte		N30	, En3
	.byte		N30	, Gn3
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v
	.byte		N30	, En3
	.byte		N30	, Gn3
	.byte	W18
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-26
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		N23	, En3
	.byte		N23	, Gn3
	.byte	W24
	.byte		N11	, Ds3
	.byte		N11	, Fs3
	.byte	W12
	.byte			Dn3
	.byte		N11	, Fn3
	.byte	W12
	.byte			Cs3
	.byte		N11	, En3
	.byte	W12
	.byte		N68	, Cn3
	.byte		N68	, Ds3
	.byte	W24
	.byte	W48
	.byte		N92	, Gs2
	.byte	W48
	.byte			Cn3
	.byte	W48
	.byte		N44	, Ds3
	.byte	W48
	.byte		N96	, Dn3
	.byte		N96	, Gn3
	.byte	W96
	.byte	W24
	.byte		N09	, Fn2
	.byte		N09	, Fn3
	.byte	W12
	.byte			Gn2
	.byte		N09	, Gn3
	.byte	W12
	.byte		N08	, As2
	.byte		N08	, As3
	.byte	W12
	.byte		N32	, Ds3
	.byte		N32	, Ds4
	.byte	W36
	.byte			Ds3
	.byte		N32	, Cn4
	.byte	W36
	.byte		N28	, Fn3
	.byte		N28	, Cn4
	.byte	W36
	.byte		N76	, Fn3
	.byte		N76	, Cn4
	.byte	W24
	.byte	W60
	.byte		N10	, As2
	.byte		N10	, As3
	.byte	W12
	.byte		N20	, Bn2
	.byte		N20	, Bn3
	.byte	W24
	.byte		N36	, Cn3
	.byte		N36	, Cn4
	.byte	W36
	.byte			Cn3
	.byte		N36	, Cn4
	.byte	W36
	.byte		N12	, Cn3
	.byte		N12	, Cn4
	.byte	W12
	.byte			Cn3
	.byte		N12	, Cn4
	.byte	W12
	.byte	FINE

	@********************** Track  8 **********************@

	.global song001_8
song001_8:	@ 0x0879D05A
	.byte	KEYSH	, 0
	.byte	VOICE	, 46
	.byte	VOL	, v066
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W24
	.byte		TIE	, Cn2, v120
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W36
	.byte	W01
song001_8_1:
	.byte		N20	, Fn2, v127
	.byte	W24
	.byte		N14	
	.byte	W18
	.byte		N04	
	.byte	W06
	.byte		N09	
	.byte	W12
	.byte		N10	, Gs2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte		N16	, As2
	.byte	W12
	.byte	PEND
song001_8_2:
	.byte	W12
	.byte		N07	, As2, v127
	.byte	W12
	.byte		N05	, Dn2
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N07	, Ds2
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N08	, En2
	.byte	W12
	.byte		N10	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song001_8_1
	.byte	W12
	.byte		N10	, As2, v127
	.byte	W12
	.byte		N05	, Dn2
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N07	, Ds2
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N08	, En2
	.byte	W12
	.byte		N10	
	.byte	W12
	.byte	PATT	
		mPtr	song001_8_1
	.byte	PATT	
		mPtr	song001_8_2
	.byte	PATT	
		mPtr	song001_8_1
	.byte	W12
	.byte		N10	, As2, v127
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N04	
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte		N10	, Gs2
	.byte	W12
song001_8_3:
	.byte		N07	, Cs3, v127
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song001_8_3
	.byte		N07	, Cn3, v127
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N24	
	.byte	W36
	.byte		N30	
	.byte	W36
	.byte		N24	
	.byte	W24
	.byte	W12
	.byte		N23	
	.byte	W24
	.byte		N11	, Bn2
	.byte	W12
	.byte			As2
	.byte	W12
	.byte		N10	, An2
	.byte	W12
	.byte		N20	, Gs2
	.byte	W24
song001_8_4:
	.byte		N07	, Gs2, v127
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song001_8_4
	.byte		N07	, Gn2, v127
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N07	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N19	
	.byte	W24
	.byte		N28	, Gs2
	.byte	W36
	.byte			Cs2
	.byte	W36
	.byte		TIE	, Fs2
	.byte	W24
	.byte	W84
	.byte	W01
	.byte		EOT	
	.byte	W11
	.byte		N30	, As1
	.byte	W36
	.byte			Bn1
	.byte	W36
	.byte		N07	, Cn2
	.byte	W12
	.byte		N09	
	.byte	W09
	.byte	FINE

	@********************** Track  9 **********************@

	.global song001_9
song001_9:	@ 0x0879D173
	.byte	KEYSH	, 0
	.byte	VOICE	, 120
	.byte	VOL	, v085
	.byte	PAN	, c_v+63
	.byte	BENDR	, 3
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		TIE	, Cn3, v127
	.byte	W24
	.byte	W72
	.byte			Fs3
	.byte	W24
	.byte	W96
	.byte	W72
	.byte		EOT	, Cn3
	.byte	W24
	.byte	W72
	.byte			Fs3
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W36
	.byte	FINE

	@********************** Track  10 **********************@

	.global song001_10
song001_10:	@ 0x0879D194
	.byte	KEYSH	, 0
	.byte	VOICE	, 120
	.byte	VOL	, v085
	.byte	PAN	, c_v-64
	.byte	BENDR	, 3
	.byte	W96
	.byte	W96
	.byte	W72
	.byte	W01
	.byte		TIE	, Cn3, v127
	.byte	W23
	.byte	W72
	.byte	W01
	.byte			Fs3
	.byte	W23
	.byte	W96
	.byte	W72
	.byte	W01
	.byte		EOT	, Cn3
	.byte	W23
	.byte	W72
	.byte	W01
	.byte			Fs3
	.byte	W23
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W36
	.byte	FINE

	@********************** Track  11 **********************@

	.global song001_11
song001_11:	@ 0x0879D1B9
	.byte	KEYSH	, 0
	.byte	VOICE	, 121
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	BEND	, c_v
	.byte		TIE	, Cn3, v127
	.byte	W08
	.byte	VOL	, v119
	.byte	W04
	.byte		v118
	.byte	W04
	.byte		v117
	.byte	W04
	.byte		v116
	.byte	W04
	.byte		v115
	.byte	W04
	.byte		v114
	.byte	W04
	.byte		v113
	.byte	W04
	.byte		v112
	.byte	W04
	.byte		v111
	.byte	W04
	.byte		v110
	.byte	W04
	.byte		v109
	.byte	W04
	.byte		v108
	.byte	W04
	.byte		v107
	.byte	W04
	.byte		v106
	.byte	W04
	.byte		v105
	.byte	W04
	.byte		v104
	.byte	W04
	.byte		v103
	.byte	W04
	.byte		v102
	.byte	W05
	.byte		v102
	.byte	W04
	.byte		v101
	.byte	W04
	.byte		v100
	.byte	W04
	.byte		v099
	.byte	W03
	.byte	W01
	.byte		v098
	.byte	W04
	.byte		v097
	.byte	W04
	.byte		v096
	.byte	W04
	.byte		v095
	.byte	W04
	.byte		v094
	.byte	W04
	.byte		v093
	.byte	W04
	.byte		v092
	.byte	W04
	.byte		v091
	.byte	W04
	.byte		v090
	.byte	W04
	.byte		v089
	.byte	W04
	.byte		v088
	.byte	W04
	.byte		v087
	.byte	W04
	.byte		v086
	.byte	W04
	.byte		v085
	.byte	W04
	.byte		v085
	.byte	W04
	.byte		v084
	.byte	W05
	.byte		v083
	.byte	W04
	.byte		v082
	.byte	W04
	.byte		v081
	.byte	W04
	.byte		v080
	.byte	W04
	.byte		v079
	.byte	W04
	.byte		v078
	.byte	W04
	.byte		v077
	.byte	W04
	.byte		v076
	.byte	W02
	.byte	W02
	.byte		v075
	.byte	W04
	.byte		v074
	.byte	W04
	.byte		v073
	.byte	W04
	.byte		v072
	.byte	W04
	.byte		v071
	.byte	W04
	.byte		v070
	.byte	W04
	.byte		v069
	.byte	W04
	.byte		v068
	.byte	W04
	.byte		v068
	.byte	W04
	.byte		v067
	.byte	W04
	.byte		v066
	.byte	W04
	.byte		v065
	.byte	W05
	.byte		v064
	.byte	W04
	.byte		v063
	.byte	W04
	.byte		v062
	.byte	W04
	.byte		v061
	.byte	W04
	.byte		v060
	.byte	W04
	.byte		v059
	.byte	W04
	.byte		v058
	.byte	W04
	.byte		v057
	.byte	W04
	.byte		v056
	.byte	W04
	.byte		v055
	.byte	W04
	.byte		v054
	.byte	W04
	.byte		v053
	.byte	W01
	.byte	W03
	.byte		v052
	.byte	W04
	.byte		v051
	.byte	W04
	.byte		v051
	.byte	W04
	.byte		v050
	.byte	W04
	.byte		v049
	.byte	W04
	.byte		v048
	.byte	W04
	.byte		v047
	.byte	W04
	.byte		v046
	.byte	W05
	.byte		v045
	.byte	W04
	.byte		v044
	.byte	W04
	.byte		v043
	.byte	W04
	.byte		v042
	.byte	W04
	.byte		v041
	.byte	W04
	.byte		v040
	.byte	W04
	.byte		v039
	.byte	W04
	.byte		v038
	.byte	W04
	.byte		v037
	.byte	W04
	.byte		v036
	.byte	W04
	.byte		v035
	.byte	W04
	.byte		v034
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
	.byte	W04
	.byte		v029
	.byte	W04
	.byte		v028
	.byte	W04
	.byte		v027
	.byte	W05
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
	.byte	W04
	.byte		v020
	.byte	W04
	.byte		v019
	.byte	W04
	.byte		v018
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		v017
	.byte	W04
	.byte		v016
	.byte	W04
	.byte		v015
	.byte	W04
	.byte		v014
	.byte	W04
	.byte		v013
	.byte	W04
	.byte		v012
	.byte	W03
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v011
	.byte	W04
	.byte		v010
	.byte	W04
	.byte		v009
	.byte	W03
	.byte	W01
	.byte		v008
	.byte	W05
	.byte		v007
	.byte	W04
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
	.byte	W60
	.byte	W02
	.byte	W96
	.byte	W92
	.byte		EOT	
	.byte	W04
	.byte	W96
	.byte	W96
	.byte	W36
	.byte	FINE

	@********************** Track  12 **********************@

	.global song001_12
song001_12:	@ 0x0879D2DF
	.byte	KEYSH	, 0
	.byte	VOICE	, 2
	.byte	VOL	, v012
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 42
	.byte	MODT	, 0
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte	VOL	, v067
	.byte	BEND	, c_v-64
	.byte		TIE	, Fs3, v124
	.byte	W04
	.byte	BEND	, c_v-64
	.byte	W03
	.byte		c_v-62
	.byte	W03
	.byte		c_v-59
	.byte	W03
	.byte		c_v-57
	.byte	W03
	.byte		c_v-54
	.byte	W03
	.byte		c_v-51
	.byte	W03
	.byte		c_v-49
	.byte	W03
	.byte		c_v-46
	.byte	W03
	.byte		c_v-43
	.byte	W03
	.byte		c_v-41
	.byte	W03
	.byte		c_v-38
	.byte	W03
	.byte		c_v-35
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v-30
	.byte	W03
	.byte		c_v-27
	.byte	W02
	.byte	W01
	.byte		c_v-25
	.byte	W03
	.byte		c_v-22
	.byte	W03
	.byte		c_v-19
	.byte	W03
	.byte		c_v-17
	.byte	W03
	.byte		c_v-14
	.byte	W03
	.byte		c_v-11
	.byte	W03
	.byte		c_v-9
	.byte	W03
	.byte		c_v-6
	.byte	W03
	.byte		c_v-3
	.byte	W03
	.byte		c_v-1
	.byte	W03
	.byte		c_v+2
	.byte	W03
	.byte		c_v+5
	.byte	W03
	.byte		c_v+7
	.byte	W03
	.byte		c_v+10
	.byte	W03
	.byte		c_v+13
	.byte	W03
	.byte		c_v+15
	.byte	W03
	.byte		c_v+18
	.byte	W03
	.byte		c_v+21
	.byte	W03
	.byte		c_v+23
	.byte	W03
	.byte		c_v+26
	.byte	W03
	.byte		c_v+28
	.byte	W03
	.byte		c_v+31
	.byte	W03
	.byte		c_v+34
	.byte	W03
	.byte		c_v+36
	.byte	W03
	.byte		c_v+39
	.byte	W03
	.byte		c_v+42
	.byte	W03
	.byte		c_v+44
	.byte	W03
	.byte		c_v+47
	.byte	W03
	.byte	VOL	, v067
	.byte	BEND	, c_v+50
	.byte	W03
	.byte		c_v+52
	.byte	W01
	.byte	VOL	, v066
	.byte	W02
	.byte		v065
	.byte	BEND	, c_v+55
	.byte	W01
	.byte	VOL	, v064
	.byte	W02
	.byte		v063
	.byte	BEND	, c_v+58
	.byte	W02
	.byte	VOL	, v062
	.byte	W01
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v061
	.byte	W01
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v060
	.byte	W01
	.byte		v059
	.byte	W02
	.byte		v058
	.byte	W02
	.byte		v057
	.byte	W02
	.byte		v056
	.byte	W01
	.byte		v055
	.byte	W02
	.byte		v054
	.byte	W02
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W02
	.byte		v051
	.byte	W02
	.byte		v050
	.byte	W02
	.byte		v049
	.byte	W02
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W02
	.byte		v045
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W02
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W02
	.byte		v040
	.byte	W02
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W02
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W02
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W02
	.byte		v032
	.byte	W02
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W02
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W02
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W02
	.byte		v024
	.byte	W02
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W02
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W02
	.byte		v017
	.byte	W02
	.byte		v016
	.byte	W02
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W02
	.byte		v011
	.byte	W02
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v008
	.byte	W02
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W01
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
	.byte	W01
	.byte		v000
	.byte	W03
	.byte		EOT	
	.byte	W13
	.byte	FINE

	mAlignWord
	.global C_DECL(song001)
C_DECL(song001):	@ 0x0879D400
	.byte	12		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

mAlignWord
	mPtr	voicegroup000		@ voicegroup/tone

	mPtr	song001_1		@ track
	mPtr	song001_2		@ track
	mPtr	song001_3		@ track
	mPtr	song001_4		@ track
	mPtr	song001_5		@ track
	mPtr	song001_6		@ track
	mPtr	song001_7		@ track
	mPtr	song001_8		@ track
	mPtr	song001_9		@ track
	mPtr	song001_10		@ track
	mPtr	song001_11		@ track
	mPtr	song001_12		@ track
