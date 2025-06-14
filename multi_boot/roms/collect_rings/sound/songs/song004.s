	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song004_1
song004_1:	@ 0x0201C010
	.byte	KEYSH	, 0
	.byte	TEMPO	, 82
	.byte	VOICE	, 127
	.byte	PRIO	, 127
	.byte	VOL	, v000
	.byte		N18	, En1, v056
	.byte		N23	, Ds2, v127
	.byte	W18
	.byte		N06	, En1, v056
	.byte	W06
	.byte			Dn1
	.byte		N05	, En2, v127
	.byte	W06
	.byte		N06	, En1, v056
	.byte		N05	, En2, v127
	.byte	W06
	.byte		N06	, Dn1, v056
	.byte		N05	, Ds2, v127
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N17	, En2
	.byte	W18
	.byte		N18	, Ds1, v068
	.byte		N24	, Ds2, v127
	.byte	W24
	.byte	FINE

	@********************** Track  2 **********************@

	.global song004_2
song004_2:	@ 0x0201C045
	.byte	KEYSH	, 0
	.byte	VOICE	, 44
	.byte	PRIO	, 127
	.byte	VOL	, v105
	.byte		N12	, An2, v124
	.byte	W12
	.byte		N06	, Cn2, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			An2, v096
	.byte	W06
	.byte			An2, v124
	.byte	W06
	.byte			Cn2, v004
	.byte	W06
	.byte			Gn3, v120
	.byte	W06
	.byte			Cn2, v004
	.byte	W06
	.byte			Gn3, v127
	.byte	W06
	.byte			Cn2, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, An2, v124
	.byte	W12
	.byte		N06	, Cn2, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	FINE

	@********************** Track  3 **********************@

	.global song004_3
song004_3:	@ 0x0201C079
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	PRIO	, 127
	.byte	VOL	, v105
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte		N12	, Cs3, v096
	.byte	W24
	.byte		N06	
	.byte	W06
	.byte			En3, v124
	.byte	W42
	.byte			Cs4
	.byte	W06
	.byte	FINE

	@********************** Track  4 **********************@

	.global song004_4
song004_4:	@ 0x0201C093
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	PRIO	, 127
	.byte	VOL	, v105
	.byte		N12	, En3, v120
	.byte	W13
	.byte		N01	, Ds3, v072
	.byte	W02
	.byte			Cs3, v084
	.byte	W02
	.byte			Bn2, v076
	.byte	W02
	.byte			An2, v072
	.byte	W02
	.byte			Gs2, v056
	.byte	W02
	.byte			Fs2, v044
	.byte	W02
	.byte		N03	, En2, v028
	.byte	W17
	.byte		N06	, Cs3, v120
	.byte	W12
	.byte		N06	
	.byte	W18
	.byte			Cs3, v127
	.byte	W07
	.byte		N01	, Cn3, v072
	.byte	W02
	.byte			As2, v084
	.byte	W02
	.byte			Gs2, v076
	.byte	W02
	.byte			Fs2, v072
	.byte	W02
	.byte			Fn2, v056
	.byte	W02
	.byte			Ds2, v044
	.byte	W02
	.byte		N03	, Cs2, v028
	.byte	W03
	.byte	FINE

	@********************** Track  5 **********************@

	.global song004_5
song004_5:	@ 0x0201C0D7
	.byte	KEYSH	, 0
	.byte	VOICE	, 95
	.byte	PRIO	, 127
	.byte	VOL	, v074
	.byte	BENDR	, 12
	.byte		N12	, An4, v096
	.byte	W12
	.byte		N06	, Cn3, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Gn3, v096
	.byte	W06
	.byte			Cs4, v124
	.byte	W06
	.byte			Cn3, v004
	.byte	W06
	.byte			En4, v120
	.byte	W06
	.byte			Cn3, v004
	.byte	W06
	.byte			An4, v127
	.byte	W06
	.byte		N05	, Cn3, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cs5, v096
	.byte	W12
	.byte	FINE

	@********************** Track  6 **********************@

	.global song004_6
song004_6:	@ 0x0201C108
	.byte	KEYSH	, 0
	.byte	VOICE	, 99
	.byte	PRIO	, 127
	.byte	VOL	, v085
	.byte	BENDR	, 12
	.byte		N12	, An4, v096
	.byte	W12
	.byte		N06	, Cn3, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En4, v096
	.byte	W06
	.byte			Gn4, v124
	.byte	W06
	.byte			Cn3, v004
	.byte	W06
	.byte			An4, v120
	.byte	W06
	.byte			Cn3, v004
	.byte	W06
	.byte			Cn5, v127
	.byte	W06
	.byte			Cn3, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, An4, v127
	.byte	W12
	.byte		N06	, Cn3, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	FINE

	@********************** Track  7 **********************@

	.global song004_7
song004_7:	@ 0x0201C13E
	.byte	KEYSH	, 0
	.byte	VOICE	, 101
	.byte	PRIO	, 127
	.byte	VOL	, v000
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte		N06	, Cs3, v004
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte			Cs3
	.byte		N06	, Dn3
	.byte		N06	, Ds3
	.byte		N06	, En3
	.byte	W06
	.byte	FINE

	@********************** Track  8 **********************@

	.global song004_8
song004_8:	@ 0x0201C1CF
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	PRIO	, 120
	.byte	VOL	, v000
	.byte		N06	, Dn1, v004
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	FINE

	.align 2
	.global song004
song004:	@ 0x0201C1FC
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	255		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song004_1		@ track
	.word	song004_2		@ track
	.word	song004_3		@ track
	.word	song004_4		@ track
	.word	song004_5		@ track
	.word	song004_6		@ track
	.word	song004_7		@ track
	.word	song004_8		@ track
