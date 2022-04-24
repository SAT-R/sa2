	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0050_1
song0050_1:	@ 0x08C7CCC0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 65
	.byte	VOICE	, 127
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N06	, Cn1, v127
	.byte		N48	, Cs2
	.byte	W06
	.byte		N07	, Cs1
	.byte	W03
	.byte		N03	, An1
	.byte	W03
	.byte		N10	
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte		N04	, Gn1
	.byte	W04
	.byte		N08	
	.byte	W04
	.byte			Fs1
	.byte	W04
	.byte			Cs1
	.byte	W04
	.byte		N04	, Cn1
	.byte	W04
	.byte		N08	
	.byte	W04
	.byte		N06	, Cs1
	.byte	W06
	.byte		N12	, Cn1
	.byte		N18	, Ds1, v076
	.byte	W12
	.byte			Gn1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N18	, Ds1, v076
	.byte	W06
	.byte		N06	, Cs1, v080
	.byte	W06
	.byte			Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N18	, Ds1, v076
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N18	, An1
	.byte	W06
	.byte		N06	, Cn1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N05	, Cs1
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0050_2
song0050_2:	@ 0x08C7CD1B
	.byte	KEYSH	, 0
	.byte	VOICE	, 45
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte		N09	, Bn2, v120
	.byte	W54
	.byte		N06	, An2, v104
	.byte	W18
	.byte		N19	, As2, v112
	.byte	W18
	.byte		N06	, Bn2, v124
	.byte	W06
	.byte	W24
	.byte		N05	, An3, v127
	.byte	W06
	.byte		N05	
	.byte	W05
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0050_3
song0050_3:	@ 0x08C7CD3D
	.byte	KEYSH	, 0
	.byte	VOICE	, 87
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte		N09	, Bn2, v120
	.byte	W54
	.byte		N06	, An2, v104
	.byte	W18
	.byte		N19	, As2, v112
	.byte	W18
	.byte		N06	, Bn2, v124
	.byte	W06
	.byte	W24
	.byte		N05	, Ds3, v127
	.byte		N05	, Gs3
	.byte		N05	, Dn4
	.byte	W06
	.byte		N08	, Ds3
	.byte		N08	, Gs3
	.byte		N08	, Dn4
	.byte	W08
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0050_4
song0050_4:	@ 0x08C7CD70
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 4
	.byte	MODT	, 0
	.byte		N09	, Bn2, v120
	.byte		N09	, Bn3
	.byte	W54
	.byte		N06	, An2, v104
	.byte		N06	, An3
	.byte	W18
	.byte		N19	, As2, v112
	.byte		N19	, As3
	.byte	W18
	.byte		N06	, Bn2, v124
	.byte		N06	, Bn3
	.byte	W06
	.byte	W24
	.byte		N05	, Dn4, v127
	.byte	W06
	.byte		N04	
	.byte	W04
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0050_5
song0050_5:	@ 0x08C7CDA2
	.byte	KEYSH	, 0
	.byte	VOICE	, 12
	.byte	VOL	, v062
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 4
	.byte	MODT	, 0
	.byte		N09	, Bn3, v120
	.byte	W54
	.byte		N06	, An3, v104
	.byte	W18
	.byte		N19	, As3, v112
	.byte	W18
	.byte		N06	, Bn3, v124
	.byte	W06
	.byte	W24
	.byte		N05	, An4, v127
	.byte	W06
	.byte		N04	
	.byte	W04
	.byte	FINE

	.align 2
	.global song0050
song0050:	@ 0x08C7CDCC
	.byte	5		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song0050_1		@ track
	.word	song0050_2		@ track
	.word	song0050_3		@ track
	.word	song0050_4		@ track
	.word	song0050_5		@ track
