	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song001_1
song001_1:	@ 0x0201A6D8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 87
	.byte	VOICE	, 127
	.byte	VOL	, v105
	.byte		N14	, Ds2, v124
	.byte	W15
	.byte		N07	, En2
	.byte	W09
	.byte		N14	
	.byte	W15
	.byte		N08	, Ds2
	.byte	W09
	.byte		N14	, En2
	.byte	W15
	.byte		N08	, Ds2
	.byte	W09
	.byte		N14	, En2
	.byte	W15
	.byte		N32	, Ds1, v076
	.byte		N06	, Ds2, v124
	.byte	W09
	.byte	W15
	.byte		N08	
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte			Ds1, v076
	.byte	W15
	.byte		N08	, Ds2, v124
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N15	, En2, v124
	.byte	W24
	.byte		N23	, Ds1, v076
	.byte		N14	, Ds2, v124
	.byte	W15
	.byte		N08	
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
song001_1_2:
	.byte		N23	, Ds1, v076
	.byte	W15
	.byte		N08	, Ds2, v124
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
song001_1_1:
	.byte		N23	, Ds1, v076
	.byte		N14	, Ds2, v124
	.byte	W15
	.byte		N08	
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte			Ds1, v076
	.byte	W15
	.byte		N08	, Ds2, v124
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte	PEND
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte	PATT	
		.word	song001_1_1
	.byte		N23	, Ds1, v076
	.byte		N14	, Ds2, v124
	.byte	W15
	.byte		N08	, En2
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N14	, En2, v124
	.byte	W15
	.byte		N08	, Ds2
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N07	, En2, v124
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte		N15	, Ds1, v076
	.byte		N15	, En2, v124
	.byte	W16
	.byte		N23	, Ds1, v076
	.byte		N23	, Ds2, v124
	.byte	W08
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N15	, En2
	.byte	W16
	.byte		N23	, Ds1, v076
	.byte		N23	, Ds2, v124
	.byte	W24
	.byte		N07	, En2
	.byte	W08
	.byte		N15	, Ds2
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N23	, Ds1, v076
	.byte		N15	, Ds2, v124
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N15	, En2
	.byte	W16
	.byte		N23	, Ds1, v076
	.byte		N23	, Ds2, v124
	.byte	W24
	.byte		N07	, En2
	.byte	W08
	.byte		N15	
	.byte	W16
	.byte		N23	, Ds1, v076
	.byte		N07	, Ds2, v124
	.byte	W08
	.byte	W24
	.byte		N23	, Ds1, v076
	.byte	W24
	.byte		N07	, Dn1, v040
	.byte	W24
	.byte		N23	, Ds1, v076
	.byte	W24
	.byte		N07	, Dn1, v040
	.byte	W24
	.byte		N23	, Ds1, v076
	.byte	W24
	.byte		N07	, En2, v124
	.byte	W08
	.byte		N07	
	.byte	W08
	.byte			Ds2
	.byte	W08
	.byte			En2
	.byte	W16
	.byte		N23	, Ds1, v076
	.byte		N14	, Ds2, v124
	.byte	W08
	.byte	W15
	.byte		N08	
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte			Ds1, v076
	.byte	W15
	.byte		N08	, Ds2, v124
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte			Ds1, v076
	.byte		N23	, Ds2, v124
	.byte	W24
	.byte			Ds1, v076
	.byte		N23	, En2, v124
	.byte	W24
	.byte	GOTO	
		.word	song001_1_2
	.byte		N23	, Ds1, v076
	.byte		N14	, Ds2, v124
	.byte	W15
	.byte		N08	, En2
	.byte	W09
	.byte		N23	, Ds1, v076
	.byte		N14	, En2, v124
	.byte	W15
	.byte		N08	, Ds2
	.byte	W09
	.byte	FINE

	@********************** Track  2 **********************@

	.global song001_2
song001_2:	@ 0x0201A853
	.byte	KEYSH	, 0
	.byte	VOICE	, 44
	.byte	VOL	, v105
	.byte	W16
	.byte		N07	, As1, v088
	.byte	W08
	.byte		N10	, Ds2
	.byte	W16
	.byte		N07	, Gs2, v108
	.byte	W08
	.byte		N11	, Fn2, v084
	.byte	W16
	.byte		N07	, Gs2, v096
	.byte	W08
	.byte		N11	, Cs3
	.byte	W16
	.byte		N20	, Ds2, v127
	.byte	W08
song001_2_1:
	.byte	W16
	.byte		N08	, Ds2, v127
	.byte	W08
	.byte		N10	, Ds3
	.byte	W16
	.byte		N07	, Ds2
	.byte	W08
	.byte		N13	
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N08	, Ds2
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte	PEND
song001_2_3:
	.byte		N11	, Ds3, v127
	.byte	W16
	.byte		N07	, Ds2
	.byte	W08
	.byte		N10	
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte	PEND
song001_2_4:
	.byte		N10	, Ds2, v127
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N08	, Ds2
	.byte	W16
	.byte		N20	
	.byte	W08
	.byte	PATT	
		.word	song001_2_1
song001_2_2:
	.byte		N11	, Ds3, v127
	.byte	W16
	.byte		N07	, Ds2
	.byte	W08
	.byte		N10	
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N10	, Ds2
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N08	, Ds2
	.byte	W16
	.byte		N20	
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte	PATT	
		.word	song001_2_2
	.byte	PATT	
		.word	song001_2_1
	.byte		N11	, Ds3, v127
	.byte	W16
	.byte		N07	, Ds2
	.byte	W08
	.byte		N10	
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N09	, Ds2
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte		N14	, Fn2
	.byte	W16
	.byte		N21	, Fs2
	.byte	W08
	.byte	W16
	.byte		N07	, Cs2
	.byte	W08
	.byte		N12	, Fs2
	.byte	W16
	.byte		N28	, Gs2
	.byte	W32
	.byte		N13	
	.byte	W24
	.byte			An2
	.byte	W16
	.byte		N07	, En2
	.byte	W08
	.byte		N15	, An2
	.byte	W16
	.byte		N24	, Bn2
	.byte	W32
	.byte		N14	
	.byte	W16
	.byte		N60	, Cs3
	.byte	W08
	.byte	W64
	.byte		N07	
	.byte	W08
	.byte		N14	, Gs2
	.byte	W16
	.byte		N42	, Cs2
	.byte	W08
	.byte	W48
	.byte		N11	, Cs3
	.byte	W16
	.byte		N07	, Gs2
	.byte	W08
	.byte		N11	, Cs2
	.byte	W16
	.byte		N17	, Ds2
	.byte	W08
	.byte	W16
	.byte		N11	
	.byte	W08
	.byte		N10	, Ds3
	.byte	W16
	.byte		N07	, Ds2
	.byte	W08
	.byte		N13	
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N08	, Ds2
	.byte	W16
	.byte		N07	
	.byte	W08
	.byte	PATT	
		.word	song001_2_3
	.byte	GOTO	
		.word	song001_2_4
	.byte		N10	, Ds2, v127
	.byte	W16
	.byte		N07	, Ds3
	.byte	W08
	.byte		N08	, Ds2
	.byte	W16
	.byte		N20	
	.byte	W08
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte	FINE

	@********************** Track  3 **********************@

	.global song001_3
song001_3:	@ 0x0201A96D
	.byte	KEYSH	, 0
	.byte	VOICE	, 103
	.byte	VOL	, v082
	.byte	BENDR	, 59
	.byte	W88
	.byte		TIE	, Ds3, v112
	.byte	W08
	.byte	W96
	.byte	W20
	.byte		EOT	
	.byte	W28
song001_3_1:
	.byte		N36	, Ds3, v127
	.byte	W40
	.byte		TIE	, Cs3, v116
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Cs3, v124
	.byte	W40
	.byte		TIE	, Ds3, v116
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N36	, Ds3, v120
	.byte	W40
	.byte		TIE	, Cs3, v124
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Cs3, v120
	.byte	W40
	.byte		TIE	, Ds3, v116
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Ds3, v112
	.byte	W24
	.byte		N15	, Ds3, v108
	.byte	W16
	.byte		TIE	, Cs3, v124
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Cs3, v108
	.byte	W24
	.byte		N15	, Gs3, v116
	.byte	W16
	.byte		TIE	, Ds3, v124
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N23	, Ds3, v116
	.byte	W48
	.byte	W96
	.byte	W48
	.byte			Cs3, v127
	.byte	W24
	.byte		N15	, Cs3, v116
	.byte	W16
	.byte		N30	, Fs3, v124
	.byte	W08
	.byte	W24
	.byte		N15	
	.byte	W16
	.byte		N30	, Gs3
	.byte	W32
	.byte		N23	, Gs3, v116
	.byte	W24
	.byte			An3, v124
	.byte	W24
	.byte		N15	
	.byte	W16
	.byte		N30	
	.byte	W32
	.byte		N15	, An3, v116
	.byte	W16
	.byte		N68	, Bn3
	.byte	W08
	.byte	W64
	.byte		N14	
	.byte	W32
	.byte	W48
	.byte		N16	, Cs3
	.byte	W24
	.byte		N12	
	.byte	W16
	.byte		TIE	, Ds3
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	GOTO	
		.word	song001_3_1
	.byte	FINE

	@********************** Track  4 **********************@

	.global song001_4
song001_4:	@ 0x0201AA10
	.byte	KEYSH	, 0
	.byte	VOICE	, 104
	.byte	VOL	, v082
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte	W96
	.byte	W96
	.byte	W48
song001_4_1:
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W88
	.byte		TIE	, Fn3, v124
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Fn3, v120
	.byte	W40
	.byte		TIE	, Gn3, v116
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W30
	.byte		N15	, Gn3, v108
	.byte	W16
	.byte		TIE	, Fn3, v124
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Fn3, v108
	.byte	W40
	.byte		TIE	, Gn3, v124
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N23	, Gn3, v116
	.byte	W24
	.byte		N15	
	.byte	W16
	.byte		TIE	, Fn3, v124
	.byte	W08
	.byte	W96
	.byte	W28
	.byte	W01
	.byte		EOT	
	.byte	W66
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte	GOTO	
		.word	song001_4_1
	.byte	FINE

	@********************** Track  5 **********************@

	.global song001_5
song001_5:	@ 0x0201AA6D
	.byte	KEYSH	, 0
	.byte	VOICE	, 105
	.byte	VOL	, v082
	.byte	W88
	.byte		TIE	, As2, v112
	.byte	W08
	.byte	W96
	.byte	W20
	.byte		EOT	
	.byte	W28
song001_5_1:
	.byte		N36	, As2, v127
	.byte	W40
	.byte		TIE	, Gs2, v116
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Gs2, v124
	.byte	W40
	.byte		TIE	, As2, v116
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N36	, As2, v120
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N23	, As2, v112
	.byte	W40
	.byte		TIE	, Gs3, v124
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Gs3, v108
	.byte	W24
	.byte		N15	, Ds3, v116
	.byte	W24
	.byte	W96
	.byte	W72
	.byte			As3
	.byte	W16
	.byte		TIE	, Gs3, v124
	.byte	W08
	.byte	W96
	.byte	W28
	.byte	W01
	.byte		EOT	
	.byte	W19
	.byte		N14	, Gs3, v116
	.byte	W24
	.byte		N14	
	.byte	W16
	.byte		N44	, Cs3, v124
	.byte	W08
	.byte	W40
	.byte		N30	, Ds3
	.byte	W32
	.byte		N23	, Ds3, v116
	.byte	W24
	.byte		N36	, En3, v124
	.byte	W40
	.byte		N30	
	.byte	W32
	.byte		N15	, En3, v116
	.byte	W16
	.byte		N68	, Fs3
	.byte	W08
	.byte	W64
	.byte		N14	
	.byte	W24
	.byte		N54	, Cs3
	.byte		N54	, Gs3
	.byte	W08
	.byte	W48
	.byte		N16	
	.byte	W24
	.byte		N12	
	.byte	W16
	.byte		TIE	, As3
	.byte	W08
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	GOTO	
		.word	song001_5_1
	.byte	FINE

	@********************** Track  6 **********************@

	.global song001_6
song001_6:	@ 0x0201AAF8
	.byte	KEYSH	, 0
	.byte	VOICE	, 97
	.byte	VOL	, v062
	.byte	BENDR	, 12
	.byte	W16
	.byte		N07	, As3, v088
	.byte	W08
	.byte		N12	, Ds4, v096
	.byte	W16
	.byte		N07	, Gs4, v108
	.byte	W08
	.byte		N08	, Fn4, v084
	.byte	W16
	.byte		N07	, Gs4, v100
	.byte	W08
	.byte		N12	, Cs5
	.byte	W16
	.byte		TIE	, Ds5, v112
	.byte	W08
	.byte	W96
	.byte	W20
	.byte		EOT	
	.byte	W28
song001_6_1:
	.byte		N36	, Gn4, v127
	.byte	W40
	.byte		TIE	, Fn4, v116
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Fn4, v124
	.byte	W40
	.byte		TIE	, Gn4, v116
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N36	, Gn4, v120
	.byte	W40
	.byte		TIE	, Gs4, v124
	.byte	W08
	.byte	W96
	.byte	W36
	.byte	W03
	.byte		EOT	
	.byte	W09
	.byte		N36	, Gs4, v120
	.byte	W40
	.byte		TIE	, As4, v116
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Gn4, v112
	.byte	W24
	.byte		N15	, As4, v108
	.byte	W16
	.byte		TIE	, Gs4, v124
	.byte	W08
	.byte	W96
	.byte	W42
	.byte		EOT	
	.byte	W06
	.byte		N23	, Gs4, v108
	.byte	W24
	.byte		N15	, Cn5, v116
	.byte	W16
	.byte		TIE	, As4, v124
	.byte	W08
	.byte	W96
	.byte	W40
	.byte		EOT	
	.byte	W08
	.byte		N23	, As4, v116
	.byte	W24
	.byte		N15	, Ds5
	.byte	W16
	.byte		TIE	, Cs5, v124
	.byte	W08
	.byte	W96
	.byte	W28
	.byte	W01
	.byte		EOT	
	.byte	W19
	.byte		N08	, Cs5, v060
	.byte	W16
	.byte		N07	, Ds5, v100
	.byte	W08
	.byte		N15	, Fn5, v116
	.byte	W16
	.byte		N30	, Fs5, v124
	.byte	W08
	.byte	W24
	.byte		N15	, Fn5
	.byte	W16
	.byte		N24	, Ds5
	.byte	W32
	.byte		N07	, Ds5, v116
	.byte	W24
	.byte		N23	, En5, v124
	.byte	W24
	.byte		N15	, Ds5
	.byte	W16
	.byte		N24	, Cs5
	.byte	W32
	.byte		N13	, Cs5, v116
	.byte	W16
	.byte		N54	, Ds5
	.byte	W08
	.byte	W64
	.byte		N14	
	.byte	W24
	.byte		N54	, Cs5
	.byte	W08
	.byte	W48
	.byte		N16	
	.byte	W24
	.byte		N12	
	.byte	W16
	.byte		N30	, Ds5
	.byte	W08
	.byte	W96
	.byte	W48
	.byte	GOTO	
		.word	song001_6_1
	.byte	FINE

	@********************** Track  7 **********************@

	.global song001_7
song001_7:	@ 0x0201ABC4
	.byte	KEYSH	, 0
	.byte	VOICE	, 11
	.byte	VOL	, v074
	.byte	BENDR	, 12
	.byte	W96
song001_7_1:
	.byte		N08	, Ds2, v028
	.byte	W08
	.byte			Gn2, v032
	.byte	W08
	.byte			As2, v040
	.byte	W08
	.byte			Ds3, v044
	.byte	W08
	.byte			Gn3, v048
	.byte	W08
	.byte			As3, v052
	.byte	W08
	.byte			As2, v060
	.byte	W08
	.byte			Ds3, v064
	.byte	W08
	.byte			Gn3, v068
	.byte	W08
	.byte			As3, v072
	.byte	W08
	.byte			Ds4, v080
	.byte	W08
	.byte			Gn4, v084
	.byte	W08
	.byte	PEND
song001_7_5:
	.byte		N08	, As4, v088
	.byte	W08
	.byte			Gn4, v080
	.byte	W08
	.byte			Ds4, v076
	.byte	W08
	.byte			Gn4, v072
	.byte	W08
	.byte			Ds4, v068
	.byte	W08
	.byte			As3, v064
	.byte	W08
	.byte	PEND
song001_7_6:
	.byte		N08	, Ds4, v060
	.byte	W08
	.byte			As3, v056
	.byte	W08
	.byte			Gn3, v052
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			As2, v044
	.byte	W08
	.byte			Gn2, v036
	.byte	W08
song001_7_2:
	.byte		N08	, Cs2, v028
	.byte	W08
	.byte			Fn2, v032
	.byte	W08
	.byte			Gs2, v040
	.byte	W08
	.byte			Cs3, v044
	.byte	W08
	.byte			Fn3, v048
	.byte	W08
	.byte			Gs3, v052
	.byte	W08
	.byte			Gs2, v060
	.byte	W08
	.byte			Cs3, v064
	.byte	W08
	.byte			Fn3, v068
	.byte	W08
	.byte			Gs3, v072
	.byte	W08
	.byte			Cs4, v080
	.byte	W08
	.byte			Fn4, v084
	.byte	W08
	.byte	PEND
song001_7_3:
	.byte		N08	, Gs4, v088
	.byte	W08
	.byte			Fn4, v080
	.byte	W08
	.byte			Cs4, v076
	.byte	W08
	.byte			Fn4, v072
	.byte	W08
	.byte			Cs4, v068
	.byte	W08
	.byte			Gs3, v064
	.byte	W08
	.byte			Cs4, v060
	.byte	W08
	.byte			Gs3, v056
	.byte	W08
	.byte			Fn3, v052
	.byte	W08
	.byte			Cs3, v048
	.byte	W08
	.byte			Gs2, v044
	.byte	W08
	.byte			Fn2, v036
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song001_7_1
song001_7_4:
	.byte		N08	, As4, v088
	.byte	W08
	.byte			Gn4, v080
	.byte	W08
	.byte			Ds4, v076
	.byte	W08
	.byte			Gn4, v072
	.byte	W08
	.byte			Ds4, v068
	.byte	W08
	.byte			As3, v064
	.byte	W08
	.byte			Ds4, v060
	.byte	W08
	.byte			As3, v056
	.byte	W08
	.byte			Gn3, v052
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			As2, v044
	.byte	W08
	.byte			Gn2, v036
	.byte	W08
	.byte	PEND
	.byte	PATT	
		.word	song001_7_2
	.byte	PATT	
		.word	song001_7_3
	.byte	PATT	
		.word	song001_7_1
	.byte	PATT	
		.word	song001_7_4
	.byte	PATT	
		.word	song001_7_2
	.byte	PATT	
		.word	song001_7_3
	.byte	PATT	
		.word	song001_7_1
	.byte	PATT	
		.word	song001_7_4
	.byte	PATT	
		.word	song001_7_2
	.byte	PATT	
		.word	song001_7_3
	.byte		N06	, As2, v092
	.byte	W06
	.byte			Cs3, v084
	.byte	W06
	.byte			Fs3, v096
	.byte	W06
	.byte			As3, v092
	.byte	W06
	.byte			Cs4, v088
	.byte	W06
	.byte			Fs4, v096
	.byte	W06
	.byte			Cn3, v076
	.byte	W06
	.byte			Ds3, v084
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Cn4, v076
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Gs4, v088
	.byte	W06
	.byte			Cn5, v076
	.byte	W06
	.byte			Gs4, v096
	.byte	W06
	.byte			Ds4, v084
	.byte	W06
	.byte			Cn4
	.byte	W06
	.byte			Cs3, v092
	.byte	W06
	.byte			En3, v084
	.byte	W06
	.byte			An3, v096
	.byte	W06
	.byte			Cs4, v092
	.byte	W06
	.byte			En4, v088
	.byte	W06
	.byte			An4, v096
	.byte	W06
	.byte			Ds3, v076
	.byte	W06
	.byte			Fs3, v084
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Ds4, v076
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Bn4, v088
	.byte	W06
	.byte			Ds5, v076
	.byte	W06
	.byte			Bn4, v096
	.byte	W06
	.byte			Fs4, v084
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Ds3
	.byte	W06
	.byte			Fs3, v088
	.byte	W06
	.byte			Bn3, v096
	.byte	W06
	.byte			Ds4, v084
	.byte	W06
	.byte			Fs3, v076
	.byte	W06
	.byte			Bn3, v092
	.byte	W06
	.byte			Ds4, v072
	.byte	W06
	.byte			Fs4, v088
	.byte	W06
	.byte			Bn3
	.byte	W06
	.byte			Ds4
	.byte	W06
	.byte			Fs4, v084
	.byte	W06
	.byte			Bn4, v092
	.byte	W06
	.byte			Ds4, v072
	.byte	W06
	.byte			Fs4, v088
	.byte	W06
	.byte			Bn4, v084
	.byte	W06
	.byte			Ds5, v088
	.byte	W06
	.byte			Fn5, v092
	.byte	W06
	.byte			Cs5, v096
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Fn4, v080
	.byte	W06
	.byte			Cs5
	.byte	W06
	.byte			Gs4, v092
	.byte	W06
	.byte			Fn4, v084
	.byte	W06
	.byte			Cs4, v092
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Cs4, v084
	.byte	W06
	.byte			Gs3, v088
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cs4, v096
	.byte	W06
	.byte			Gs3
	.byte	W06
	.byte			Fn3, v084
	.byte	W06
	.byte			Cs3, v096
	.byte	W06
	.byte	PATT	
		.word	song001_7_1
	.byte	PATT	
		.word	song001_7_5
	.byte	GOTO	
		.word	song001_7_6
	.byte		N08	, Ds4, v060
	.byte	W08
	.byte			As3, v056
	.byte	W08
	.byte			Gn3, v052
	.byte	W08
	.byte			Ds3, v048
	.byte	W08
	.byte			As2, v044
	.byte	W08
	.byte			Gn2, v036
	.byte	W08
	.byte	FINE

	.align 2
	.global song001
song001:	@ 0x0201AD9C
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song001_1		@ track
	.word	song001_2		@ track
	.word	song001_3		@ track
	.word	song001_4		@ track
	.word	song001_5		@ track
	.word	song001_6		@ track
	.word	song001_7		@ track
