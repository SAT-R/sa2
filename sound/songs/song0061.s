	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0061_1
song0061_1:	@ 0x08C7FC28
	.byte	KEYSH	, 0
	.byte	TEMPO	, 63
	.byte	VOICE	, 18
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0061_1_2:
	.byte	MOD	, 0
	.byte		N06	, Dn4, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn5
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn5
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N24	, Cn5
	.byte	W24
	.byte		N06	, Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fs4
	.byte	W12
song0061_1_1:
	.byte		N06	, Dn4, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn5
	.byte	W12
	.byte			An4
	.byte	W12
	.byte	PEND
	.byte			Cn5
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_1_1
	.byte		N06	, Cn5, v127
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N18	, Cn5
	.byte	W24
	.byte		N06	, Bn4
	.byte	W12
	.byte		N12	, An4
	.byte	W24
	.byte		N06	, Gn4
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	, Fs4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte	W23
	.byte	MOD	, 2
	.byte	W01
	.byte		N42	, Dn5, v096
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0061_1_2
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0061_2
song0061_2:	@ 0x08C7FCAC
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0061_2_2:
	.byte	W24
	.byte		N06	, An3, v127
	.byte	W48
	.byte		N18	, Gn3
	.byte	W24
	.byte	PEND
song0061_2_1:
	.byte	W24
	.byte		N06	, An3, v127
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N18	, Gn3
	.byte	W24
	.byte	PEND
	.byte	W24
	.byte		N06	, An3
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			Gn3
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_2_1
	.byte	PATT	
		.word	song0061_2_1
	.byte		N06	, Bn3, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	, Gn3
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			En3
	.byte	W12
	.byte	W24
	.byte		N54	, An3
	.byte	W72
	.byte	PATT	
		.word	song0061_2_2
	.byte	PATT	
		.word	song0061_2_1
song0061_2_3:
	.byte	W24
	.byte		N06	, An3, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gn3
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song0061_2_1
	.byte	PATT	
		.word	song0061_2_3
	.byte	GOTO	
		.word	song0061_2_2
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0061_3
song0061_3:	@ 0x08C7FD1D
	.byte	KEYSH	, 0
	.byte	VOICE	, 61
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0061_3_2:
	.byte	W24
	.byte		N06	, Fs3, v127
	.byte	W48
	.byte		N18	, En3
	.byte	W24
	.byte	PEND
song0061_3_1:
	.byte	W24
	.byte		N06	, Fs3, v127
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte		N18	, En3
	.byte	W24
	.byte	PEND
	.byte	W24
	.byte		N06	, Fs3
	.byte	W12
	.byte		N06	
	.byte	W36
	.byte			En3
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_3_1
	.byte	PATT	
		.word	song0061_3_1
	.byte		N06	, Dn3, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N18	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Cs3
	.byte	W12
	.byte	W24
	.byte		N54	, Fs3
	.byte	W72
	.byte	PATT	
		.word	song0061_3_2
	.byte	PATT	
		.word	song0061_3_1
song0061_3_3:
	.byte	W24
	.byte		N06	, Fs3, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			En3
	.byte	W48
	.byte	PEND
	.byte	PATT	
		.word	song0061_3_1
	.byte	PATT	
		.word	song0061_3_3
	.byte	GOTO	
		.word	song0061_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0061_4
song0061_4:	@ 0x08C7FD8D
	.byte	KEYSH	, 0
	.byte	VOICE	, 19
	.byte	VOL	, v051
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0061_4_2:
	.byte	MOD	, 0
	.byte		N06	, Dn4, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn5
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn5
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn5
	.byte	W24
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Fs4
	.byte	W12
song0061_4_1:
	.byte		N06	, Dn4, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Dn5
	.byte	W12
	.byte			An4
	.byte	W12
	.byte	PEND
	.byte			Cn5
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_4_1
	.byte		N06	, Cn5, v127
	.byte	W12
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte			Cn5
	.byte	W24
	.byte			Bn4
	.byte	W12
	.byte			An4
	.byte	W24
	.byte			Gn4
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte			Fs4
	.byte	W12
	.byte			Gn4
	.byte	W12
	.byte			An4
	.byte	W12
	.byte	W23
	.byte	MOD	, 3
	.byte	W01
	.byte		N06	, Dn5
	.byte	W72
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0061_4_2
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0061_5
song0061_5:	@ 0x08C7FE07
	.byte	KEYSH	, 0
	.byte	VOICE	, 17
	.byte	VOL	, v066
	.byte	PAN	, c_v
	.byte		N06	, Dn2, v127
	.byte	W24
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cn2
	.byte	W12
song0061_5_1:
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cn2
	.byte	W48
	.byte	PEND
song0061_5_2:
	.byte		N06	, Dn2, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0061_5_1
song0061_5_3:
	.byte		N06	, Dn2, v127
	.byte	W24
	.byte			Fs2
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0061_5_1
	.byte	PATT	
		.word	song0061_5_2
	.byte		N06	, Cn2, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_5_2
	.byte	PATT	
		.word	song0061_5_2
	.byte		N06	, Gn1, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte	W24
	.byte		N06	
	.byte	W72
	.byte	PATT	
		.word	song0061_5_3
	.byte	PATT	
		.word	song0061_5_2
	.byte	PATT	
		.word	song0061_5_1
	.byte	PATT	
		.word	song0061_5_3
	.byte	PATT	
		.word	song0061_5_1
	.byte	GOTO	
		.word	song0061_5_3
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0061_6
song0061_6:	@ 0x08C7FEA3
	.byte	KEYSH	, 0
	.byte	VOICE	, 63
	.byte	VOL	, v058
	.byte	PAN	, c_v
	.byte		N06	, Dn3, v127
	.byte	W24
	.byte		N09	, Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N09	, Bn2
	.byte	W12
	.byte			Cn3
	.byte	W12
song0061_6_1:
	.byte		N06	, Dn3, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N09	, Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W48
	.byte	PEND
song0061_6_2:
	.byte		N06	, Dn3, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N09	, Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N09	, Bn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0061_6_1
song0061_6_3:
	.byte		N06	, Dn3, v127
	.byte	W24
	.byte		N09	, Fs3
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte		N06	, Cn3
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N09	, Bn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0061_6_1
	.byte	PATT	
		.word	song0061_6_2
	.byte		N06	, Cn3, v127
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W60
	.byte	PATT	
		.word	song0061_6_2
	.byte	PATT	
		.word	song0061_6_2
	.byte		N06	, Gn2, v127
	.byte	W12
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W24
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			An2
	.byte	W12
	.byte	W24
	.byte		N06	
	.byte	W72
	.byte	PATT	
		.word	song0061_6_3
	.byte	PATT	
		.word	song0061_6_2
	.byte	PATT	
		.word	song0061_6_1
	.byte	PATT	
		.word	song0061_6_3
	.byte	PATT	
		.word	song0061_6_1
	.byte	GOTO	
		.word	song0061_6_3
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0061_7
song0061_7:	@ 0x08C7FF4A
	.byte	VOL	, v110
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	PAN	, c_v
	.byte	W96
	.byte	W60
	.byte		N04	, Dn1, v044
	.byte	W12
	.byte		N21	, Ds1
	.byte	W24
	.byte		N04	, Dn1
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N10	, Ds1
	.byte	W24
song0061_7_3:
	.byte		N04	, Dn1, v044
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N03	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N05	
	.byte	W24
song0061_7_1:
	.byte		N04	, Dn1, v044
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte	PEND
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N28	, Ds1
	.byte	W60
	.byte	PATT	
		.word	song0061_7_1
	.byte	PATT	
		.word	song0061_7_1
	.byte		N04	, Dn1, v044
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte	W24
	.byte		N48	, Ds1
	.byte	W72
	.byte		N04	, Dn1
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N23	, Ds1
	.byte	W24
song0061_7_2:
	.byte		N04	, Dn1, v044
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N22	, Ds1
	.byte	W24
	.byte	PEND
	.byte		N04	, Dn1
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W48
	.byte	PATT	
		.word	song0061_7_2
	.byte		N04	, Dn1, v044
	.byte	W24
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte		N04	
	.byte	W24
	.byte		N12	, Ds1
	.byte	W24
	.byte	GOTO	
		.word	song0061_7_3
	.byte	FINE

	.align 2
	.global song0061
song0061:	@ 0x08C7FFF4
	.byte	7		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song0061_1		@ track
	.word	song0061_2		@ track
	.word	song0061_3		@ track
	.word	song0061_4		@ track
	.word	song0061_5		@ track
	.word	song0061_6		@ track
	.word	song0061_7		@ track
