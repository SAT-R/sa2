	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0407_1
song0407_1:	@ 0x08C85C78
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 127
	.byte	BENDR	, 127
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte		N08	, Cn1, v120
	.byte		N48	, Cn2
	.byte	W44
	.byte	W02
	.byte	VOL	, v000
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v005
	.byte		N48	, Bn1
	.byte	W01
	.byte	VOL	, v007
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v111
	.byte	W01
	.byte		v113
	.byte	W01
	.byte		v116
	.byte	W01
	.byte		v118
	.byte	W01
	.byte	W16
	.byte		N04	, As1
	.byte	W04
	.byte		N04	
	.byte	W20
	.byte		N04	
	.byte	W04
	.byte		N04	
	.byte	W04
	.byte		N48	, Cn2
	.byte	W48
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0407_2
song0407_2:	@ 0x08C85D01
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	BENDR	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v056
	.byte	W12
	.byte		N06	, An2, v127
	.byte		N06	, Dn3
	.byte	W06
	.byte			An2
	.byte		N06	, Dn3
	.byte	W06
	.byte			Dn3, v120
	.byte		N06	, Fs3
	.byte	W06
	.byte		N06	
	.byte		N06	, An3
	.byte	W06
	.byte			An3, v124
	.byte		N06	, Dn4
	.byte	W12
	.byte		N18	, An3, v120
	.byte		N18	, Cn4
	.byte	W18
	.byte			Gn3, v124
	.byte		N18	, Bn3
	.byte	W18
	.byte		N11	, En3
	.byte		N11	, Gn3
	.byte	W12
	.byte		N48	, Fs3, v120
	.byte		N48	, An3
	.byte	W48
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0407_3
song0407_3:	@ 0x08C85D3B
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	BENDR	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v075
	.byte		N12	, An2, v127
	.byte	W48
	.byte		N18	, Gn3
	.byte	W18
	.byte			Dn3
	.byte	W18
	.byte		N11	, Gn2
	.byte	W12
	.byte		N48	, An2
	.byte	W48
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0407_4
song0407_4:	@ 0x08C85D55
	.byte	KEYSH	, 0
	.byte	VOICE	, 90
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v120
	.byte	LFOS	, 10
	.byte	LFODL	, 0
	.byte	BENDR	, 2
	.byte		N24	, Cn3, v127
	.byte	W84
	.byte		N03	, Gn2
	.byte	W04
	.byte		N03	
	.byte	W04
	.byte		N03	
	.byte	W04
	.byte		N12	, Cn3
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte		N24	, Cn3
	.byte	W24
	.byte	FINE

	.align 2
	.global song0407
song0407:	@ 0x08C85D80
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song0407_1		@ track
	.word	song0407_2		@ track
	.word	song0407_3		@ track
	.word	song0407_4		@ track
