	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song017_1
song017_1:	@ 0x087A6C04
	.byte	KEYSH	, 0
song017_1_4:
	.byte	TEMPO	, 45
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte		N04	, Cn1, v127
	.byte		N03	, Dn1, v056
	.byte	W07
	.byte		N04	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, Gn1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
	.byte		N04	, Cn1
	.byte		N03	, Ds1, v056
	.byte	W07
	.byte		N04	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, An1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
	.byte		N04	, Cn1
	.byte		N19	, En1, v056
	.byte	W07
	.byte		N04	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, Gn1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
song017_1_2:
	.byte		N08	, Cs1, v127
	.byte		N03	, En1, v056
	.byte	W12
	.byte		N04	, Cn1, v127
	.byte		N16	, En1, v052
	.byte	W24
	.byte	PEND
song017_1_1:
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N04	, Dn1, v060
	.byte	W08
	.byte		N04	
	.byte	W04
	.byte		N12	, Ds1, v044
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
song017_1_3:
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N04	, Cn1, v127
	.byte	W08
	.byte			Cs1
	.byte	W04
	.byte			Cn1
	.byte	W04
	.byte			Gn1
	.byte	W04
	.byte			Cs1
	.byte	W04
	.byte	PEND
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W07
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, Gn1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
	.byte		N04	, Cn1
	.byte		N03	, Ds1, v056
	.byte	W12
	.byte		N04	, Cs1, v127
	.byte	W07
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, An1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
	.byte		N04	, Cn1
	.byte		N19	, En1, v056
	.byte	W12
	.byte		N04	, Cs1, v127
	.byte	W07
	.byte			Cn1
	.byte		N16	, En1, v056
	.byte	W05
	.byte		N08	, Gn1, v127
	.byte	W07
	.byte			Gs1
	.byte	W05
	.byte	PATT	
		mPtr	song017_1_2
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_1
	.byte	PATT	
		mPtr	song017_1_3
	.byte	GOTO	
		mPtr	song017_1_4
	.byte	FINE

	@********************** Track  2 **********************@

	.global song017_2
song017_2:	@ 0x087A6E0D
	.byte	KEYSH	, 0
song017_2_33:
	.byte	VOICE	, 125
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte		N04	, Bn2, v104
	.byte	W19
	.byte		N16	, Bn1, v096
	.byte	W17
	.byte		N04	, Bn2, v104
	.byte	W19
	.byte		N16	, Bn1, v100
	.byte	W17
	.byte		N04	, Bn2, v108
	.byte	W19
	.byte		N16	, Bn1, v104
	.byte	W17
	.byte		N04	, Bn2, v100
	.byte	W12
	.byte		N16	, Bn1, v108
	.byte	W24
song017_2_1:
	.byte		N19	, En2, v116
	.byte	W30
	.byte	W01
	.byte		N04	, En2, v096
	.byte	W05
	.byte	PEND
song017_2_2:
	.byte		N18	, Bn1, v084
	.byte	W19
	.byte		N04	, En2, v088
	.byte	W05
	.byte		N10	, Bn1, v084
	.byte	W12
	.byte	PEND
song017_2_3:
	.byte		N17	, Fn2, v112
	.byte	W24
	.byte		N08	, Fn2, v104
	.byte	W12
	.byte	PEND
song017_2_4:
	.byte		N12	, Bn1, v096
	.byte	W19
	.byte		N04	, Fn2, v064
	.byte	W05
	.byte		N07	, Bn1, v088
	.byte	W12
	.byte	PEND
song017_2_5:
	.byte		N17	, Fs2, v112
	.byte	W24
	.byte		N11	, An2, v104
	.byte	W12
	.byte	PEND
song017_2_6:
	.byte		N16	, Bn2, v096
	.byte	W19
	.byte		N04	, Bn2, v088
	.byte	W05
	.byte		N11	, An2, v104
	.byte	W12
	.byte	PEND
song017_2_7:
	.byte		N18	, Gs2, v104
	.byte	W24
	.byte		N10	, Gn2, v100
	.byte	W12
	.byte	PEND
song017_2_8:
	.byte		N14	, Fs2, v112
	.byte	W19
	.byte		N03	, Fs2, v092
	.byte	W05
	.byte		N11	, Bn1, v100
	.byte	W12
	.byte	PEND
song017_2_9:
	.byte		N15	, En2, v096
	.byte	W24
	.byte		N11	, En2, v108
	.byte	W12
	.byte	PEND
song017_2_10:
	.byte		N12	, Bn1, v084
	.byte	W19
	.byte		N04	, En2, v092
	.byte	W05
	.byte		N10	, Bn1, v088
	.byte	W12
	.byte	PEND
song017_2_11:
	.byte		N18	, Fn2, v108
	.byte	W24
	.byte		N10	, Fn2, v112
	.byte	W12
	.byte	PEND
song017_2_12:
	.byte		N12	, Bn1, v076
	.byte	W19
	.byte		N04	, Fn2, v104
	.byte	W05
	.byte		N11	, Bn1, v084
	.byte	W12
	.byte	PEND
song017_2_13:
	.byte		N14	, Fs2, v116
	.byte	W19
	.byte		N04	, Fs2, v084
	.byte	W05
	.byte		N11	, An2, v104
	.byte	W12
	.byte	PEND
song017_2_14:
	.byte		N11	, Bn2, v096
	.byte	W12
	.byte			Bn1, v084
	.byte	W12
	.byte			Fs2, v104
	.byte	W12
	.byte	PEND
song017_2_15:
	.byte		N20	, En2, v108
	.byte	W24
	.byte		N09	, En2, v088
	.byte	W12
	.byte	PEND
song017_2_16:
	.byte		N10	, Bn2, v080
	.byte	W19
	.byte		N04	, En2, v084
	.byte	W05
	.byte		N11	, As2, v100
	.byte	W12
	.byte	PEND
song017_2_17:
	.byte		N11	, An2, v104
	.byte	W12
	.byte			Bn2, v096
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte	PEND
song017_2_18:
	.byte		N11	, Bn2, v088
	.byte	W12
	.byte			An2, v104
	.byte	W12
	.byte			Gs2, v076
	.byte	W12
	.byte	PEND
song017_2_19:
	.byte		N11	, An2, v104
	.byte	W12
	.byte			Bn2, v080
	.byte	W12
	.byte			Cn3, v096
	.byte	W12
	.byte	PEND
song017_2_20:
	.byte		N11	, Dn3, v096
	.byte	W12
	.byte			Dn2, v076
	.byte	W12
	.byte			An2, v088
	.byte	W12
	.byte	PEND
song017_2_21:
	.byte		N11	, Gn2, v096
	.byte	W12
	.byte			An2, v104
	.byte	W12
	.byte			Bn2, v084
	.byte	W12
	.byte	PEND
song017_2_22:
	.byte		N11	, Cn3, v100
	.byte	W12
	.byte			Bn2, v104
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte	PEND
song017_2_23:
	.byte		N11	, Fs2, v100
	.byte	W12
	.byte		N07	, Gs2, v080
	.byte	W07
	.byte		N04	, Fs2, v076
	.byte	W05
	.byte		N11	, An2, v112
	.byte	W12
	.byte	PEND
song017_2_24:
	.byte		N11	, Bn2, v096
	.byte	W12
	.byte		N07	, Cs3, v084
	.byte	W07
	.byte		N04	, Bn2
	.byte	W05
	.byte		N11	, Ds3, v096
	.byte	W12
	.byte	PEND
song017_2_25:
	.byte		N16	, En3, v104
	.byte	W19
	.byte		N04	, En3, v100
	.byte	W05
	.byte		N09	, Bn2, v096
	.byte	W12
	.byte	PEND
song017_2_26:
	.byte		N13	, En2, v116
	.byte	W19
	.byte		N04	, Bn2, v088
	.byte	W05
	.byte		N11	, En2, v096
	.byte	W12
	.byte	PEND
song017_2_27:
	.byte		N13	, Fn2, v100
	.byte	W19
	.byte		N04	, Fn2, v088
	.byte	W05
	.byte		N10	, Bn2, v092
	.byte	W12
	.byte	PEND
song017_2_28:
	.byte		N12	, Fn2, v096
	.byte	W19
	.byte		N04	, Bn2, v072
	.byte	W05
	.byte		N07	, Fn2, v108
	.byte	W12
	.byte	PEND
song017_2_29:
	.byte		N11	, Fs2, v100
	.byte	W12
	.byte			Cs3, v096
	.byte	W12
	.byte			An2, v112
	.byte	W12
	.byte	PEND
song017_2_30:
	.byte		N10	, Bn2, v088
	.byte	W12
	.byte		N11	, Bn1, v092
	.byte	W12
	.byte			Fs2, v100
	.byte	W12
	.byte	PEND
song017_2_31:
	.byte		N13	, En2, v104
	.byte	W24
	.byte		N11	, En2, v084
	.byte	W12
	.byte	PEND
song017_2_32:
	.byte		N15	, Bn1, v100
	.byte	W19
	.byte		N03	, En2, v096
	.byte	W05
	.byte		N06	, Bn1
	.byte	W12
	.byte	PEND
song017_2_34:
	.byte		N08	, Bn2, v080
	.byte	W19
	.byte		N03	, Bn2, v076
	.byte	W05
	.byte		N11	, Bn1, v096
	.byte	W12
	.byte	PEND
song017_2_35:
	.byte		N05	, Bn2, v100
	.byte	W19
	.byte		N04	, Bn2, v088
	.byte	W05
	.byte		N11	, Bn1, v092
	.byte	W12
	.byte	PEND
song017_2_36:
	.byte		N04	, Bn2, v108
	.byte	W19
	.byte			Bn2, v084
	.byte	W05
	.byte		N11	, Bn1, v096
	.byte	W12
	.byte	PEND
	.byte		N03	, Bn2, v112
	.byte	W12
	.byte		N21	, Bn1, v108
	.byte	W24
	.byte	PATT	
		mPtr	song017_2_1
	.byte	PATT	
		mPtr	song017_2_2
	.byte	PATT	
		mPtr	song017_2_3
	.byte	PATT	
		mPtr	song017_2_4
	.byte	PATT	
		mPtr	song017_2_5
	.byte	PATT	
		mPtr	song017_2_6
	.byte	PATT	
		mPtr	song017_2_7
	.byte	PATT	
		mPtr	song017_2_8
	.byte	PATT	
		mPtr	song017_2_9
	.byte	PATT	
		mPtr	song017_2_10
	.byte	PATT	
		mPtr	song017_2_11
	.byte	PATT	
		mPtr	song017_2_12
	.byte	PATT	
		mPtr	song017_2_13
	.byte	PATT	
		mPtr	song017_2_14
	.byte	PATT	
		mPtr	song017_2_15
	.byte	PATT	
		mPtr	song017_2_16
	.byte	PATT	
		mPtr	song017_2_17
	.byte	PATT	
		mPtr	song017_2_18
	.byte	PATT	
		mPtr	song017_2_19
	.byte	PATT	
		mPtr	song017_2_20
	.byte	PATT	
		mPtr	song017_2_21
	.byte	PATT	
		mPtr	song017_2_22
	.byte	PATT	
		mPtr	song017_2_23
	.byte	PATT	
		mPtr	song017_2_24
	.byte	PATT	
		mPtr	song017_2_25
	.byte	PATT	
		mPtr	song017_2_26
	.byte	PATT	
		mPtr	song017_2_27
	.byte	PATT	
		mPtr	song017_2_28
	.byte	PATT	
		mPtr	song017_2_29
	.byte	PATT	
		mPtr	song017_2_30
	.byte	PATT	
		mPtr	song017_2_31
	.byte	PATT	
		mPtr	song017_2_32
	.byte	GOTO	
		mPtr	song017_2_33
	.byte	PATT	
		mPtr	song017_2_34
	.byte	PATT	
		mPtr	song017_2_35
	.byte	PATT	
		mPtr	song017_2_36
	.byte		N03	, Bn2, v112
	.byte	W12
	.byte		N21	, Bn1, v108
	.byte	W21
	.byte	FINE

	@********************** Track  3 **********************@

	.global song017_3
song017_3:	@ 0x087A709D
	.byte	KEYSH	, 0
song017_3_6:
	.byte	VOICE	, 88
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	MOD	, 1
	.byte	W07
	.byte		N06	, Bn1, v104
	.byte		N06	, Ds2
	.byte		N06	, Gs2
	.byte	W12
	.byte		N04	, Bn1, v096
	.byte		N04	, Ds2
	.byte		N04	, Gs2
	.byte	W05
	.byte		N06	, En2, v100
	.byte		N06	, Gs2
	.byte		N06	, Bn2
	.byte	W07
	.byte		N04	, En2
	.byte		N04	, Gs2
	.byte		N04	, Cs3
	.byte	W05
song017_3_1:
	.byte		N12	, Gs2, v108
	.byte		N12	, Cs3
	.byte		N12	, En3
	.byte	W19
	.byte		N04	, En2, v088
	.byte		N04	, Gs2
	.byte		N04	, Cs3
	.byte	W05
	.byte		N06	, Gs2, v108
	.byte		N06	, Cs3
	.byte		N06	, En3
	.byte	W07
	.byte		N04	, As2, v104
	.byte		N04	, En3
	.byte		N04	, Gn3
	.byte	W05
	.byte	PEND
song017_3_2:
	.byte		N06	, Bn2, v116
	.byte		N06	, Fn3
	.byte		N06	, Gs3
	.byte	W07
	.byte		N03	, As2, v096
	.byte		N03	, En3
	.byte		N03	, Gn3
	.byte	W05
	.byte		N06	, Bn2, v116
	.byte		N06	, Fn3
	.byte		N06	, Gs3
	.byte	W07
	.byte		N32	, Fn2, v100
	.byte		N32	, Gs2
	.byte		N32	, Cs3
	.byte	W17
	.byte	PEND
	.byte	W30
	.byte	BEND	, c_v
	.byte	W06
	.byte	W07
	.byte		N07	, Cs3, v124
	.byte		N07	, En3
	.byte		N07	, An3
	.byte	W12
	.byte		N04	, Cs3, v108
	.byte		N04	, En3
	.byte		N04	, An3
	.byte	W05
	.byte		N09	, En2, v104
	.byte		N09	, An2
	.byte		N09	, Cs3
	.byte	W12
	.byte		N07	, An2, v108
	.byte		N07	, Cs3
	.byte		N07	, En3
	.byte	W12
	.byte		N06	, Fn2
	.byte		N06	, As2
	.byte		N06	, Dn3
	.byte	W07
	.byte		N04	, Fs2, v068
	.byte		N04	, Bn2
	.byte		N04	, Ds3
	.byte	W05
	.byte		N07	, An2, v096
	.byte		N07	, Cs3
	.byte		N07	, En3
	.byte	W07
	.byte		N04	, An2
	.byte		N04	, Ds3
	.byte		N04	, Fs3
	.byte	W05
	.byte		N19	, Ds3, v116
	.byte		N19	, Fs3
	.byte		N44	, Bn3
	.byte	W19
	.byte		N14	, Dn3
	.byte		N14	, Fn3
	.byte	W17
	.byte		N04	, Cs3, v112
	.byte		N04	, En3
	.byte	W07
	.byte			Cs3, v116
	.byte		N04	, En3
	.byte	W13
	.byte		N16	, An2, v096
	.byte		N16	, Ds3
	.byte		N16	, Fs3
	.byte	W16
	.byte		N04	, Gs2
	.byte		N04	, Bn2
	.byte		N04	, Ds3
	.byte	W07
	.byte		N15	, Bn1
	.byte		N15	, Ds2
	.byte		N15	, Gs2
	.byte	W17
	.byte		N05	, En2, v092
	.byte		N05	, Gs2
	.byte		N05	, Bn2
	.byte	W07
	.byte		N04	, En2, v100
	.byte		N04	, Gs2
	.byte		N04	, Cs3
	.byte	W05
	.byte		N13	, Gs2, v104
	.byte		N13	, Cs3
	.byte		N13	, En3
	.byte	W19
	.byte		N04	, En2, v068
	.byte		N04	, Gs2
	.byte		N04	, Cs3
	.byte	W05
	.byte		N06	, Gs2, v104
	.byte		N06	, Cs3
	.byte		N06	, En3
	.byte	W07
	.byte		N04	, As2, v096
	.byte		N04	, En3
	.byte		N04	, Gn3
	.byte	W05
	.byte		N06	, Bn2, v108
	.byte		N06	, Fn3
	.byte		N06	, Gs3
	.byte	W07
	.byte		N04	, As2, v088
	.byte		N04	, En3
	.byte		N04	, Gn3
	.byte	W05
	.byte		N06	, Bn2, v108
	.byte		N06	, Fn3
	.byte		N06	, Gs3
	.byte	W07
	.byte		N40	, Fn2, v096
	.byte		N40	, Gs2
	.byte		N40	, Cs3
	.byte	W17
	.byte	W36
song017_3_3:
	.byte	W07
	.byte		N10	, Cs3, v116
	.byte		N10	, En3
	.byte		N10	, An3
	.byte	W12
	.byte		N04	, Cs3
	.byte		N04	, En3
	.byte		N04	, An3
	.byte	W05
	.byte		N08	, En2, v084
	.byte		N08	, An2
	.byte		N08	, Cs3
	.byte	W12
	.byte	PEND
song017_3_4:
	.byte		N08	, An2, v096
	.byte		N08	, Cs3
	.byte		N08	, En3
	.byte	W12
	.byte		N06	, En2, v100
	.byte		N06	, An2
	.byte		N06	, Cs3
	.byte	W07
	.byte		N04	, Fs2, v080
	.byte		N04	, Bn2
	.byte		N04	, Ds3
	.byte	W05
	.byte		N05	, An2, v088
	.byte		N05	, Cs3
	.byte		N05	, En3
	.byte	W07
	.byte		N04	, An2, v100
	.byte		N04	, Ds3
	.byte		N04	, Fs3
	.byte	W05
	.byte	PEND
song017_3_5:
	.byte		N48	, Gs2, v100
	.byte		N17	, Cs3
	.byte		N48	, En3
	.byte	W19
	.byte		N04	, Cs3
	.byte	W05
	.byte		N05	, Cn3
	.byte	W12
	.byte	PEND
	.byte		N13	, Bn2
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W07
	.byte		N06	, Bn1, v104
	.byte		N06	, Ds2
	.byte		N06	, Gs2
	.byte	W12
	.byte		N04	, Bn1, v096
	.byte		N04	, Ds2
	.byte		N04	, Gs2
	.byte	W05
	.byte		N06	, En2, v100
	.byte		N06	, Gs2
	.byte		N06	, Bn2
	.byte	W07
	.byte		N04	, En2
	.byte		N04	, Gs2
	.byte		N04	, Cs3
	.byte	W05
	.byte	PATT	
		mPtr	song017_3_1
	.byte	PATT	
		mPtr	song017_3_2
	.byte	W36
	.byte	PATT	
		mPtr	song017_3_3
	.byte	PATT	
		mPtr	song017_3_4
	.byte	PATT	
		mPtr	song017_3_5
	.byte		N13	, Bn2, v100
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	GOTO	
		mPtr	song017_3_6
	.byte	FINE

	@********************** Track  4 **********************@

	.global song017_4
song017_4:	@ 0x087A729B
	.byte	KEYSH	, 0
song017_4_5:
	.byte	VOICE	, 117
	.byte	PAN	, c_v
	.byte	VOL	, v059
	.byte	PRIO	, 30
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	MOD	, 1
	.byte	W07
	.byte		N06	, Gs3, v104
	.byte	W12
	.byte		N04	, Gs3, v096
	.byte	W05
	.byte		N06	, Bn3, v100
	.byte	W07
	.byte		N04	, Cs4
	.byte	W05
song017_4_1:
	.byte		N12	, En4, v108
	.byte	W19
	.byte		N04	, Cs4, v088
	.byte	W05
	.byte		N06	, En4, v108
	.byte	W07
	.byte		N04	, Gn4, v104
	.byte	W05
	.byte	PEND
song017_4_2:
	.byte		N06	, Gs4, v116
	.byte	W07
	.byte		N03	, Gn4, v096
	.byte	W05
	.byte		N06	, Gs4, v116
	.byte	W07
	.byte		N32	, Cs4, v100
	.byte	W17
	.byte	PEND
	.byte	W30
	.byte	BEND	, c_v
	.byte	W06
	.byte	W07
	.byte		N07	, An4, v124
	.byte	W12
	.byte		N04	, An4, v108
	.byte	W05
	.byte		N09	, Cs4, v104
	.byte	W12
	.byte		N07	, En4, v108
	.byte	W12
	.byte		N06	, Dn4
	.byte	W07
	.byte		N04	, Ds4, v068
	.byte	W05
	.byte		N07	, En4, v096
	.byte	W07
	.byte		N04	, Fs4
	.byte	W05
	.byte		N44	, Bn4, v116
	.byte	W36
	.byte	W36
	.byte	W07
	.byte		N15	, Gs3, v096
	.byte	W17
	.byte		N05	, Bn3, v092
	.byte	W07
	.byte		N04	, Cs4, v100
	.byte	W05
	.byte		N13	, En4, v104
	.byte	W19
	.byte		N04	, Cs4, v068
	.byte	W05
	.byte		N06	, En4, v104
	.byte	W07
	.byte		N04	, Gn4, v096
	.byte	W05
	.byte		N06	, Gs4, v108
	.byte	W07
	.byte		N04	, Gn4, v088
	.byte	W05
	.byte		N06	, Gs4, v108
	.byte	W07
	.byte		N40	, Cs4, v096
	.byte	W17
	.byte	W36
song017_4_3:
	.byte	W07
	.byte		N10	, An4, v116
	.byte	W12
	.byte		N04	
	.byte	W05
	.byte		N08	, Cs4, v084
	.byte	W12
	.byte	PEND
song017_4_4:
	.byte		N08	, En4, v096
	.byte	W12
	.byte		N06	, Cs4, v100
	.byte	W07
	.byte		N04	, Ds4, v080
	.byte	W05
	.byte		N05	, En4, v088
	.byte	W07
	.byte		N04	, Fs4, v100
	.byte	W05
	.byte	PEND
	.byte		N48	, En4
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W07
	.byte		N06	, Gs3, v104
	.byte	W12
	.byte		N04	, Gs3, v096
	.byte	W05
	.byte		N06	, Bn3, v100
	.byte	W07
	.byte		N04	, Cs4
	.byte	W05
	.byte	PATT	
		mPtr	song017_4_1
	.byte	PATT	
		mPtr	song017_4_2
	.byte	W36
	.byte	PATT	
		mPtr	song017_4_3
	.byte	PATT	
		mPtr	song017_4_4
	.byte		N48	, En4, v100
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	GOTO	
		mPtr	song017_4_5
	.byte	FINE

	@********************** Track  5 **********************@

	.global song017_5
song017_5:	@ 0x087A73B4
	.byte	KEYSH	, 0
song017_5_4:
	.byte	VOICE	, 75
	.byte	VOL	, v064
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte	PRIO	, 30
	.byte	W06
	.byte		N04	, En2, v108
	.byte		N04	, Gs2
	.byte		N04	, Bn2
	.byte	W17
	.byte		N10	, En2, v112
	.byte		N10	, Gs2
	.byte		N10	, Bn2
	.byte	W13
song017_5_1:
	.byte	W06
	.byte		N04	, Fn2, v112
	.byte		N04	, Gs2
	.byte		N04	, Bn2
	.byte	W17
	.byte		N10	, Fn2, v104
	.byte		N10	, Gs2
	.byte		N10	, Bn2
	.byte	W13
	.byte	PEND
song017_5_2:
	.byte	W06
	.byte		N04	, Fs2, v100
	.byte		N04	, An2
	.byte		N04	, Bn2
	.byte	W17
	.byte		N10	, Fs2, v108
	.byte		N10	, An2
	.byte		N10	, Bn2
	.byte	W12
	.byte		N03	, Ds2, v112
	.byte		N03	, Fs2
	.byte		N03	, Bn2
	.byte	W01
	.byte	PEND
song017_5_3:
	.byte	W11
	.byte		N22	, Bn1, v120
	.byte	W24
	.byte	W01
	.byte	PEND
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W06
	.byte		N04	, En2, v108
	.byte		N04	, Gs2
	.byte		N04	, Bn2
	.byte	W17
	.byte		N10	, En2, v112
	.byte		N10	, Gs2
	.byte		N10	, Bn2
	.byte	W13
	.byte	PATT	
		mPtr	song017_5_1
	.byte	PATT	
		mPtr	song017_5_2
	.byte	PATT	
		mPtr	song017_5_3
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	GOTO	
		mPtr	song017_5_4
	.byte	FINE

	@********************** Track  6 **********************@

	.global song017_6
song017_6:	@ 0x087A7470
	.byte	KEYSH	, 0
song017_6_1:
	.byte	VOICE	, 93
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte	PRIO	, 30
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W12
	.byte		N24	, Bn3, v100
	.byte		N03	, As4, v096
	.byte		N24	, Bn4, v108
	.byte	W24
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W01
	.byte		N03	, Bn4, v104
	.byte	W04
	.byte		N02	, As4, v084
	.byte	W03
	.byte		N03	, An4, v092
	.byte	W03
	.byte			Gs4, v108
	.byte	W09
	.byte			Fs4, v104
	.byte	W04
	.byte		N02	, Fn4, v092
	.byte	W03
	.byte			Gs4, v068
	.byte	W03
	.byte			Fn4, v060
	.byte	W03
	.byte			Cs4, v068
	.byte	W03
	.byte		N05	, Fs4, v104
	.byte	W07
	.byte		N02	, Cs4, v088
	.byte	W11
	.byte		N03	, An3, v084
	.byte	W04
	.byte		N11	, Fs3, v080
	.byte	W14
	.byte	W36
	.byte	W13
	.byte		N03	, Gn3, v112
	.byte	W04
	.byte			Gs3, v088
	.byte	W04
	.byte			Bn3
	.byte	W03
	.byte		N04	, Ds4, v116
	.byte	W08
	.byte			Fs4, v112
	.byte	W04
	.byte		N06	, Fn4, v096
	.byte	W07
	.byte		N03	, Ds4, v056
	.byte	W05
	.byte		N04	, En4, v120
	.byte	W07
	.byte		N03	, Cs4, v080
	.byte	W05
	.byte		N02	, An3, v088
	.byte	W03
	.byte			Cs4, v060
	.byte	W03
	.byte			An3, v088
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte		N07	, Gs3, v096
	.byte	W08
	.byte		N16	, Bn3, v084
	.byte	W28
	.byte	W36
	.byte	W36
	.byte		N04	, Cs5, v112
	.byte	W08
	.byte			Cn5, v108
	.byte	W04
	.byte			Bn4, v104
	.byte	W08
	.byte		N03	, An4, v108
	.byte	W04
	.byte		N02	, Gs4, v096
	.byte	W03
	.byte			An4, v040
	.byte	W03
	.byte			Gs4, v068
	.byte	W03
	.byte		N03	, Fn4, v092
	.byte	W03
	.byte		N07	, Fs4, v120
	.byte	W09
	.byte		N02	, Cs4, v104
	.byte	W11
	.byte		N03	, An3, v100
	.byte	W04
	.byte		N12	, Fs3, v096
	.byte	W12
	.byte	W36
	.byte	W13
	.byte		N03	, Gn3, v108
	.byte	W03
	.byte			Gs3, v084
	.byte	W04
	.byte		N02	, Bn3, v068
	.byte	W03
	.byte		N03	, Ds4, v100
	.byte	W07
	.byte		N04	, Fs4, v116
	.byte	W06
	.byte		N05	, Ds4, v092
	.byte	W07
	.byte		N03	, En4, v080
	.byte	W05
	.byte		N06	, Gs4, v100
	.byte	W08
	.byte		N04	, Bn3, v096
	.byte		N04	, Bn4
	.byte	W11
	.byte		N07	, Cn4, v120
	.byte		N07	, Cn5
	.byte	W05
	.byte		N11	, Cs4, v116
	.byte		N11	, An4
	.byte		N11	, Cs5
	.byte	W19
	.byte		N04	, Cn4, v100
	.byte		N04	, Gs4
	.byte		N04	, Cn5
	.byte	W05
	.byte		N05	, Cs4, v116
	.byte		N05	, An4
	.byte		N05	, Cs5
	.byte	W07
	.byte		N04	, Cn4, v084
	.byte		N04	, Gs4
	.byte		N04	, Cn5
	.byte	W05
	.byte		N14	, Cs4, v112
	.byte		N14	, An4
	.byte		N14	, Cs5
	.byte	W19
	.byte		N03	, Cn4, v100
	.byte		N03	, Gs4
	.byte		N03	, Cn5
	.byte	W05
	.byte		N06	, Cs4, v108
	.byte		N06	, An4
	.byte		N06	, Cs5
	.byte	W07
	.byte		N03	, Cn4, v060
	.byte		N03	, Gs4
	.byte		N03	, Cn5
	.byte	W05
	.byte		N07	, Cs4, v108
	.byte		N07	, An4
	.byte		N07	, Cs5
	.byte	W07
	.byte		N04	, En3, v104
	.byte		N04	, Cs4
	.byte		N04	, En4
	.byte	W12
	.byte		N12	, En3, v096
	.byte		N12	, Cs4
	.byte		N12	, En4
	.byte	W17
	.byte	W07
	.byte		N05	, En4, v112
	.byte		N05	, Cn5
	.byte		N05	, En5
	.byte	W12
	.byte			Dn4, v104
	.byte		N05	, Bn4
	.byte		N05	, Dn5
	.byte	W12
	.byte		N03	, Cn4, v080
	.byte		N03	, An4
	.byte		N03	, Cn5
	.byte	W05
	.byte		N16	, Bn3, v096
	.byte		N16	, Gn4
	.byte		N16	, Bn4
	.byte	W19
	.byte		N04	, An3, v084
	.byte		N04	, Fs4
	.byte		N04	, An4
	.byte	W05
	.byte		N05	, Bn3, v104
	.byte		N05	, Gn4
	.byte		N05	, Bn4
	.byte	W07
	.byte		N04	, An3, v068
	.byte		N04	, Fs4
	.byte		N04	, An4
	.byte	W05
	.byte		N07	, Bn3, v104
	.byte		N07	, Gn4
	.byte		N07	, Bn4
	.byte	W07
	.byte		N03	, Dn3, v092
	.byte		N03	, Bn3
	.byte		N03	, Dn4
	.byte	W12
	.byte		N06	, Gn3, v112
	.byte		N06	, Dn4
	.byte		N06	, Gn4
	.byte	W12
	.byte		N04	, Bn3, v100
	.byte		N04	, Gn4
	.byte		N04	, Bn4
	.byte	W05
	.byte		N08	, An3, v108
	.byte		N08	, Fs4
	.byte		N08	, An4
	.byte	W12
	.byte		N04	, An3, v100
	.byte		N04	, Fs4
	.byte		N04	, An4
	.byte	W07
	.byte			Gs3, v096
	.byte		N04	, Fn4
	.byte		N04	, Gs4
	.byte	W05
	.byte		N03	, An3, v104
	.byte		N03	, Fs4
	.byte		N03	, An4
	.byte	W07
	.byte			As3
	.byte		N03	, Gn4
	.byte		N03	, As4
	.byte	W05
	.byte		N04	, Bn3, v108
	.byte		N04	, Gn4
	.byte		N04	, Bn4
	.byte	W07
	.byte		N03	, Gn4, v120
	.byte	W05
	.byte		N01	, Ds4, v092
	.byte	W03
	.byte		N02	, Gn4, v096
	.byte	W03
	.byte			Ds4, v084
	.byte	W03
	.byte		N03	, Bn3, v096
	.byte	W03
	.byte		N07	, An3, v120
	.byte	W07
	.byte		N03	, Gn3, v080
	.byte	W05
	.byte		N12	, Gs3, v096
	.byte	W36
	.byte	W36
	.byte	W36
	.byte		N03	, En3, v100
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			Gs3, v104
	.byte	W04
	.byte			Bn3
	.byte	W04
	.byte			Cs4, v096
	.byte	W04
	.byte			Dn4, v100
	.byte	W04
	.byte			En4, v096
	.byte	W04
	.byte			Fn4, v084
	.byte	W04
	.byte			Gs4, v088
	.byte	W04
	.byte		N05	, Bn4, v108
	.byte	W08
	.byte		N03	, An4, v104
	.byte	W12
	.byte			Fs4, v096
	.byte	W04
	.byte		N10	, Cs4, v084
	.byte	W12
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W13
	.byte		N18	, Ds2, v060
	.byte		N15	, An2, v084
	.byte	W23
	.byte	W02
	.byte		N01	, Ds2, v080
	.byte	W01
	.byte			Gs2, v060
	.byte	W28
	.byte	W01
	.byte		N30	, Gs2, v068
	.byte	W01
	.byte			Ds2, v060
	.byte	W03
	.byte	W36
	.byte		N04	, Fn2, v052
	.byte	W02
	.byte		N02	, Bn2, v020
	.byte	W32
	.byte	W02
	.byte		N01	, Fn2, v076
	.byte		N01	, Gs2, v068
	.byte		N03	, Bn2, v072
	.byte	W20
	.byte		N16	, Fn2
	.byte		N16	, Bn2, v076
	.byte	W16
	.byte		N24	, An2, v080
	.byte	W01
	.byte			En2, v076
	.byte	W32
	.byte	W03
	.byte		N03	, An2, v104
	.byte	W01
	.byte		N02	, En2, v084
	.byte	W17
	.byte		N17	, An2, v120
	.byte	W01
	.byte		N19	, Ds2, v100
	.byte	W17
	.byte	W01
	.byte		N11	, Gs2, v068
	.byte		N08	, Bn2, v060
	.byte	W17
	.byte		N14	, Fn2, v088
	.byte	W02
	.byte		N03	, Bn2, v084
	.byte	W16
	.byte	W01
	.byte			En2
	.byte		N03	, An2, v100
	.byte	W15
	.byte		N01	, Cs3, v076
	.byte	W08
	.byte		N36	, Ds2
	.byte		N13	, An2, v084
	.byte	W12
	.byte	W01
	.byte		N24	, Gs2, v064
	.byte		N28	, Bn2, v072
	.byte	W32
	.byte	W03
	.byte	W07
	.byte		N08	, Gs2, v100
	.byte		N03	, Bn2
	.byte		N04	, Ds3, v108
	.byte	W05
	.byte			Cs3, v080
	.byte		N05	, En3, v072
	.byte	W12
	.byte		N08	, Gs2
	.byte		N09	, Bn2, v088
	.byte		N09	, Ds3
	.byte	W12
	.byte		N28	, Bn2, v084
	.byte	W01
	.byte		N24	, Fn2, v048
	.byte		N23	, Gs2, v020
	.byte	W32
	.byte	W03
	.byte	W01
	.byte		N09	, Fn2, v112
	.byte		N06	, Bn2, v116
	.byte		N07	, Dn3
	.byte	W08
	.byte		N03	, Fs2, v084
	.byte		N04	, Cs3, v076
	.byte	W01
	.byte			En3, v072
	.byte	W10
	.byte		N14	, Bn2, v076
	.byte	W01
	.byte		N17	, Fn2, v088
	.byte	W15
	.byte		N28	, An2, v080
	.byte	W01
	.byte		N24	, En2, v056
	.byte		N30	, Cs3, v068
	.byte	W32
	.byte	W02
	.byte		N04	, An2
	.byte	W01
	.byte			Cs3
	.byte		N03	, En3, v096
	.byte	W19
	.byte		N11	, Ds2, v060
	.byte		N13	, An2, v072
	.byte		N13	, Ds3, v088
	.byte	W16
	.byte		N02	, Ds2, v060
	.byte		N02	, Gs2, v084
	.byte		N03	, Bn2
	.byte	W01
	.byte	W32
	.byte			Gs2
	.byte	W04
	.byte		N06	, Ds3, v096
	.byte		N10	, Gs3
	.byte	W08
	.byte		N02	, En3, v076
	.byte	W11
	.byte		N03	, En3, v104
	.byte	W01
	.byte			Gs3, v100
	.byte	W12
	.byte		N01	, En3, v096
	.byte		N03	, Gs3
	.byte	W04
	.byte	W21
	.byte			Cs3, v108
	.byte	W15
	.byte		N18	, Cs3, v096
	.byte		N19	, En3, v112
	.byte	W20
	.byte		N02	, Cs3, v096
	.byte		N03	, En3, v092
	.byte	W16
	.byte		N02	, Cs3, v096
	.byte		N03	, En3, v104
	.byte	W20
	.byte		N02	, Cs3, v092
	.byte		N03	, En3
	.byte	W11
	.byte			Cn3
	.byte	W01
	.byte		N02	, En3, v080
	.byte	W04
	.byte	W20
	.byte		N16	, Bn2, v100
	.byte		N16	, En3, v108
	.byte	W16
	.byte		N03	, Cn3, v112
	.byte	W19
	.byte			Bn2, v088
	.byte		N03	, Dn3, v104
	.byte	W12
	.byte		N30	, Bn2, v084
	.byte		N30	, Dn3, v100
	.byte	W05
	.byte	W36
	.byte		N03	, An2, v084
	.byte		N03	, Cs3, v104
	.byte	W01
	.byte		N01	, En2, v044
	.byte	W18
	.byte		N03	, Cs3, v108
	.byte	W17
	.byte	W07
	.byte			An2, v100
	.byte		N03	, Cn3, v104
	.byte	W12
	.byte		N13	, An2
	.byte		N14	, Cn3
	.byte	W17
	.byte		N03	, Gs2, v084
	.byte		N04	, Bn2
	.byte	W36
	.byte	W21
	.byte		N03	, Gs3, v104
	.byte	W01
	.byte		N02	, Gs2, v076
	.byte		N02	, Bn2, v088
	.byte	W14
	.byte	W01
	.byte		N32	, Fn2, v092
	.byte		N32	, Bn2, v080
	.byte	W32
	.byte	W03
	.byte	W10
	.byte		N02	, Dn3, v088
	.byte	W02
	.byte		N03	, Gs2, v084
	.byte		N03	, Fn3, v080
	.byte		N04	, Bn3
	.byte	W08
	.byte			Gs2, v052
	.byte		N04	, Dn3, v084
	.byte		N04	, Fn3, v080
	.byte		N03	, Bn3, v056
	.byte	W08
	.byte		N04	, Fn2, v080
	.byte		N02	, Bn2, v056
	.byte		N04	, Dn3, v068
	.byte		N04	, Gs3, v088
	.byte	W08
	.byte		N07	, Fn2, v044
	.byte		N02	, Bn2, v052
	.byte		N04	, Dn3, v080
	.byte		N04	, Gs3, v076
	.byte	W08
	.byte		N21	, En2, v040
	.byte		N20	, An2, v056
	.byte		N21	, Cs3, v088
	.byte		N20	, An3, v100
	.byte	W28
	.byte		N02	, An2, v076
	.byte		N03	, Cs3, v088
	.byte	W02
	.byte		N01	, En2, v056
	.byte	W17
	.byte		N12	, Ds2, v092
	.byte	W01
	.byte		N15	, An2, v108
	.byte	W16
	.byte		N03	, Ds2, v072
	.byte		N02	, Gs2, v088
	.byte		N03	, Bn2, v076
	.byte	W19
	.byte		N20	, Ds2, v084
	.byte		N19	, Gs2, v092
	.byte		N19	, Bn2, v080
	.byte	W17
	.byte	W11
	.byte		N23	, Bn2, v120
	.byte		N24	, Bn3
	.byte	W24
	.byte	W01
	.byte	GOTO	
		mPtr	song017_6_1
	.byte	W01
	.byte	FINE

	@********************** Track  7 **********************@

	.global song017_7
song017_7:	@ 0x087A7861
	.byte	KEYSH	, 0
song017_7_1:
	.byte	VOICE	, 122
	.byte	PAN	, c_v
	.byte	VOL	, v110
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W13
	.byte		N03	, Fs2, v092
	.byte	W03
	.byte		N02	, Gs2, v088
	.byte	W03
	.byte		N03	, An2, v096
	.byte	W04
	.byte			Bn2, v104
	.byte	W04
	.byte			Cs3
	.byte	W03
	.byte			Dn3, v108
	.byte	W04
	.byte		N09	, Ds3, v112
	.byte	W02
	.byte	W09
	.byte			Ds3, v120
	.byte	W10
	.byte		N04	, Cs3, v092
	.byte	W04
	.byte			Ds3
	.byte	W05
	.byte		N05	, Bn2, v084
	.byte	W08
	.byte		N10	, Bn2, v076
	.byte	W11
	.byte		N05	, Gs2, v072
	.byte	W05
	.byte		N12	, Bn2, v060
	.byte	W16
	.byte		N02	, Bn2, v084
	.byte	W03
	.byte		N03	, Cs3, v092
	.byte	W01
	.byte	W02
	.byte		N08	, Dn3, v120
	.byte	W10
	.byte		N07	, Dn3, v127
	.byte	W09
	.byte		N03	, Cs3, v088
	.byte	W03
	.byte		N04	, Dn3, v100
	.byte	W05
	.byte		N06	, Bn2, v076
	.byte	W07
	.byte	W02
	.byte		N07	, Bn2, v096
	.byte	W10
	.byte		N08	, Gs2, v072
	.byte	W09
	.byte		N06	, Bn2, v076
	.byte	W09
	.byte		N04	, Bn2, v084
	.byte	W05
	.byte		N06	, An2, v056
	.byte	W01
	.byte	W06
	.byte			Gs2, v072
	.byte	W08
	.byte		N05	, Bn2, v064
	.byte	W06
	.byte		N10	, An2, v040
	.byte	W16
	.byte	W12
	.byte		N04	, An2, v068
	.byte	W07
	.byte			Bn2, v060
	.byte	W05
	.byte		N05	, Cs3, v100
	.byte	W07
	.byte		N03	, En3, v104
	.byte	W05
	.byte		N06	, Gn3, v127
	.byte	W08
	.byte		N05	, Gs3, v120
	.byte	W05
	.byte		N04	, Gn3, v112
	.byte	W06
	.byte			En3, v084
	.byte	W05
	.byte			Bn2, v096
	.byte	W07
	.byte		N05	, As2, v084
	.byte	W05
	.byte			An2, v112
	.byte	W07
	.byte		N04	, Gn2, v068
	.byte	W05
	.byte			Gs2, v088
	.byte	W07
	.byte		N03	, Bn2, v072
	.byte	W05
	.byte		N05	, Cs3, v092
	.byte	W07
	.byte			En3, v108
	.byte	W05
	.byte	W01
	.byte			Ds3, v060
	.byte	W07
	.byte		N03	, En3
	.byte	W04
	.byte		N06	, Fs3, v124
	.byte	W08
	.byte			Gs3
	.byte	W11
	.byte		N05	, Gs3, v096
	.byte	W05
	.byte	W01
	.byte		N08	, Bn2, v076
	.byte	W12
	.byte		N11	
	.byte	W20
	.byte		N03	
	.byte	W03
	.byte	W01
	.byte		N06	, Gs3, v116
	.byte	W08
	.byte			An3, v127
	.byte	W11
	.byte		N08	, Bn3, v116
	.byte	W09
	.byte		N06	, An3, v127
	.byte	W07
	.byte	W01
	.byte			Gs3, v104
	.byte	W09
	.byte		N08	, Gs3, v108
	.byte	W09
	.byte		N07	, Fn3, v076
	.byte	W08
	.byte		N05	, Gs3, v056
	.byte	W07
	.byte			Fs3, v080
	.byte	W02
	.byte	W07
	.byte		N17	, Fs3, v068
	.byte	W28
	.byte	W01
	.byte		N02	, An3, v124
	.byte	W03
	.byte			Cs4, v096
	.byte	W03
	.byte			An3, v124
	.byte	W03
	.byte		N01	, Fs3, v096
	.byte	W03
	.byte			Gs3, v076
	.byte	W03
	.byte		N02	, Bn3, v084
	.byte	W03
	.byte		N01	, Gs3, v040
	.byte	W03
	.byte		N02	, En3, v084
	.byte	W03
	.byte			Fs3, v088
	.byte	W03
	.byte		N01	, An3, v092
	.byte	W03
	.byte			Fs3, v068
	.byte	W03
	.byte		N02	, Ds3, v080
	.byte	W02
	.byte		N05	, En3, v068
	.byte	W01
	.byte	W07
	.byte		N04	, En3, v092
	.byte	W11
	.byte			Bn2, v056
	.byte	W05
	.byte		N05	, Ds3, v096
	.byte	W07
	.byte		N04	, Fs3, v120
	.byte	W06
	.byte			Ds3, v068
	.byte	W07
	.byte		N03	, En3, v076
	.byte	W05
	.byte		N05	, Gs3, v100
	.byte	W08
	.byte		N04	, Bn3, v104
	.byte	W11
	.byte			Cn4, v116
	.byte	W05
	.byte		N08	, Cs4
	.byte	W17
	.byte		N05	, En3, v096
	.byte	W06
	.byte		N06	, Ds3, v088
	.byte	W09
	.byte		N03	, En3, v084
	.byte	W04
	.byte	W01
	.byte		N05	, Bn3, v124
	.byte	W07
	.byte		N04	, An3, v096
	.byte	W05
	.byte			Gs3, v072
	.byte	W06
	.byte			Bn3, v116
	.byte	W06
	.byte		N05	, An3, v104
	.byte	W07
	.byte		N04	, En3, v036
	.byte	W04
	.byte		N05	, Cn3, v084
	.byte	W08
	.byte		N02	, An2, v040
	.byte	W04
	.byte		N04	, Dn3, v120
	.byte	W08
	.byte		N02	, Cs3, v060
	.byte	W03
	.byte		N05	, Cn3, v096
	.byte	W07
	.byte			Dn3, v127
	.byte	W06
	.byte	W01
	.byte		N03	, Bn2, v064
	.byte	W04
	.byte		N02	, Dn3, v080
	.byte	W04
	.byte			Fs3, v092
	.byte	W03
	.byte		N06	, An3, v127
	.byte	W07
	.byte		N04	, Gn3, v096
	.byte	W05
	.byte		N05	, Fs3
	.byte	W07
	.byte		N03	, Gn3, v120
	.byte	W05
	.byte		N05	, An3, v124
	.byte	W07
	.byte		N04	, Bn3, v116
	.byte	W05
	.byte			Cn4, v127
	.byte	W07
	.byte		N05	, Dn4
	.byte	W12
	.byte		N04	, Bn3, v120
	.byte	W05
	.byte	W08
	.byte		N02	, Fs3, v084
	.byte	W04
	.byte		N07	, An3, v127
	.byte	W08
	.byte		N01	, Fs3, v052
	.byte	W03
	.byte		N05	, Gn3, v124
	.byte	W08
	.byte		N03	, Gn3, v068
	.byte	W03
	.byte		N06	, Fs3, v084
	.byte	W02
	.byte	W07
	.byte		N03	, En3, v096
	.byte	W05
	.byte		N05	, Ds3, v068
	.byte	W08
	.byte		N03	, En3, v088
	.byte	W04
	.byte		N06	, Fs3, v120
	.byte	W08
	.byte		N04	, Gn3, v112
	.byte	W04
	.byte	W01
	.byte		N05	, Gs3
	.byte	W07
	.byte		N04	, An3, v120
	.byte	W06
	.byte		N05	, Bn3, v096
	.byte	W07
	.byte		N04	, Cs4, v124
	.byte	W09
	.byte		N05	, Ds4, v116
	.byte	W06
	.byte	W02
	.byte		N04	, En3, v088
	.byte		N07	, En4, v116
	.byte	W10
	.byte		N03	, En3, v076
	.byte	W02
	.byte		N04	, En4, v096
	.byte	W08
	.byte		N03	, Dn3, v124
	.byte		N06	, Dn4, v108
	.byte	W08
	.byte		N03	, Dn3, v080
	.byte	W01
	.byte			Dn4
	.byte	W05
	.byte	W03
	.byte		N02	, Bn2, v076
	.byte		N02	, Bn3
	.byte	W09
	.byte		N04	, Bn2, v092
	.byte		N04	, Bn3, v084
	.byte	W09
	.byte		N03	, As2
	.byte		N05	, As3, v104
	.byte	W07
	.byte		N03	, An2, v084
	.byte		N04	, An3, v104
	.byte	W07
	.byte		N03	, En3, v080
	.byte	W01
	.byte		N06	, En2, v068
	.byte	W06
	.byte		N02	, Gn2, v072
	.byte		N02	, Gn3, v080
	.byte	W02
	.byte		N04	, Gs3, v092
	.byte	W01
	.byte		N03	, Gs2
	.byte	W08
	.byte		N02	, Gs2, v080
	.byte		N06	, Gs3, v096
	.byte	W08
	.byte		N05	, Gs2, v072
	.byte		N07	, Gs3, v100
	.byte	W08
	.byte		N02	, An2, v080
	.byte		N03	, An3, v072
	.byte	W03
	.byte	W02
	.byte		N04	, Gs3, v056
	.byte	W01
	.byte		N07	, Gs2, v060
	.byte	W09
	.byte		N06	, Gs3, v084
	.byte	W01
	.byte		N02	, Gs2, v052
	.byte	W06
	.byte		N11	, Fn2, v060
	.byte		N11	, Fn3, v072
	.byte	W17
	.byte	W09
	.byte		N03	, Fs2, v100
	.byte		N02	, Fs3, v120
	.byte	W10
	.byte		N03	, Fs2, v080
	.byte	W01
	.byte		N04	, Fs3, v116
	.byte	W05
	.byte			An2, v108
	.byte		N06	, Cs3
	.byte	W09
	.byte		N08	, An2, v092
	.byte	W01
	.byte		N07	, Cs3, v084
	.byte	W01
	.byte	W11
	.byte		N06	, En3, v112
	.byte	W08
	.byte		N03	, Cs3, v052
	.byte	W04
	.byte		N05	, Ds3, v104
	.byte	W08
	.byte		N04	, En3, v108
	.byte	W04
	.byte		N05	, Fs3, v100
	.byte	W01
	.byte	W07
	.byte		N06	, En3, v120
	.byte	W11
	.byte		N04	, Bn2, v084
	.byte	W05
	.byte		N06	, Gs2
	.byte	W07
	.byte		N04	, En2, v076
	.byte	W05
	.byte		N06	, An2, v108
	.byte		N06	, Cs3
	.byte	W01
	.byte	W07
	.byte		N03	, En2, v052
	.byte	W05
	.byte			Gs2, v092
	.byte		N05	, Bn2, v084
	.byte	W07
	.byte		N02	, Gs2, v088
	.byte		N05	, Bn2, v084
	.byte	W07
	.byte		N08	, En2, v072
	.byte	W10
	.byte	GOTO	
		mPtr	song017_7_1
	.byte	FINE

	@********************** Track  8 **********************@

	.global song017_8
song017_8:	@ 0x087A7B5B
	.byte	KEYSH	, 0
song017_8_3:
	.byte	VOICE	, 80
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	LFOS	, 43
	.byte	MODT	, 2
	.byte	LFODL	, 0
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W12
	.byte		N72	, En3, v127
	.byte	W24
	.byte	W36
song017_8_1:
	.byte	W19
	.byte		N03	, En3, v120
	.byte	W12
	.byte		N03	
	.byte	W05
	.byte	PEND
	.byte		N32	, Gn3, v116
	.byte	W36
	.byte		N66	, Dn3, v120
	.byte	W36
	.byte	W36
	.byte		N30	, En3, v116
	.byte	W36
song017_8_2:
	.byte		N06	, Fs3, v116
	.byte	W07
	.byte		N04	, Fs3, v112
	.byte	W12
	.byte		N16	, Fs3, v120
	.byte	W17
	.byte	PEND
	.byte		N06	, Bn2, v116
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte		N84	, En3, v127
	.byte	W36
	.byte	W36
	.byte	PATT	
		mPtr	song017_8_1
	.byte		N32	, Gn3, v116
	.byte	W36
	.byte		N66	, Dn3, v120
	.byte	W36
	.byte	W36
	.byte		N30	, En3, v116
	.byte	W36
	.byte	PATT	
		mPtr	song017_8_2
	.byte		N06	, Bn2, v116
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	W36
	.byte	GOTO	
		mPtr	song017_8_3
	.byte	FINE

	mAlignWord
	.global C_DECL(song017)
C_DECL(song017):	@ 0x087A7BF4
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

mAlignWord
	mPtr	voicegroup000		@ voicegroup/tone

	mPtr	song017_1		@ track
	mPtr	song017_2		@ track
	mPtr	song017_3		@ track
	mPtr	song017_4		@ track
	mPtr	song017_5		@ track
	mPtr	song017_6		@ track
	mPtr	song017_7		@ track
	mPtr	song017_8		@ track
