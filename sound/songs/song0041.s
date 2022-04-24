	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0041_1
song0041_1:	@ 0x08C76358
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 127
	.byte	W24
	.byte		N06	, Fn1, v104
	.byte	W24
	.byte		N08	, Dn2, v096
	.byte	W16
	.byte		N07	, Dn2, v112
	.byte	W08
	.byte		N06	, Fn1, v104
	.byte	W24
	.byte		N08	, Dn2, v116
	.byte	W16
	.byte		N08	
	.byte	W08
	.byte		N11	, Fn1, v108
	.byte	W40
	.byte		N12	, Dn2, v116
	.byte	W32
	.byte		N10	, Dn2, v112
	.byte	W24
	.byte		N10	
	.byte	W10
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0041_2
song0041_2:	@ 0x08C7638A
	.byte	KEYSH	, 0
	.byte	VOICE	, 82
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte	LFOS	, 27
	.byte	MODT	, 0
	.byte	LFODL	, 0
	.byte	W48
	.byte		N06	, Fs2, v112
	.byte	W16
	.byte		N09	, Fs2, v104
	.byte	W08
	.byte		N08	, As2, v120
	.byte	W16
	.byte			Cs3, v112
	.byte	W08
	.byte		N09	, Fs3, v096
	.byte	W24
	.byte		N36	, En3, v127
	.byte	W20
	.byte	MOD	, 4
	.byte	W01
	.byte		7
	.byte	W01
	.byte		9
	.byte	W01
	.byte		10
	.byte	W01
	.byte		14
	.byte	W02
	.byte		16
	.byte	W01
	.byte		17
	.byte	W01
	.byte		18
	.byte	W05
	.byte		16
	.byte	W01
	.byte		14
	.byte	W01
	.byte		12
	.byte	W01
	.byte		10
	.byte	W01
	.byte		7
	.byte	W01
	.byte		0
	.byte	W02
	.byte		N30	, Ds3, v108
	.byte	W23
	.byte	MOD	, 5
	.byte	W02
	.byte		6
	.byte	W04
	.byte		7
	.byte	W02
	.byte		8
	.byte	W01
	.byte		9
	.byte		N23	, Bn2, v112
	.byte	W02
	.byte	MOD	, 10
	.byte	W05
	.byte		9
	.byte	W01
	.byte		4
	.byte	W01
	.byte		0
	.byte	W15
	.byte		TIE	, An2, v124
	.byte	W42
	.byte	MOD	, 1
	.byte	W01
	.byte		7
	.byte	W02
	.byte		9
	.byte	W03
	.byte		10
	.byte	W05
	.byte		11
	.byte	W01
	.byte		12
	.byte	W02
	.byte		13
	.byte	W01
	.byte		14
	.byte	W01
	.byte		16
	.byte	W01
	.byte		17
	.byte	W01
	.byte		18
	.byte	W01
	.byte		19
	.byte	W04
	.byte		20
	.byte	W02
	.byte		21
	.byte	W01
	.byte		22
	.byte	W04
	.byte		23
	.byte	W36
	.byte		EOT	
	.byte	W44
	.byte	W03
	.byte	MOD	, 21
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0041_3
song0041_3:	@ 0x08C76413
	.byte	KEYSH	, 0
	.byte	VOICE	, 62
	.byte	VOL	, v086
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte		N07	, Cs1, v112
	.byte	W08
	.byte			Ds1, v124
	.byte	W08
	.byte			Fn1, v120
	.byte	W08
	.byte		N09	, Fs1, v116
	.byte	W40
	.byte		N07	, Fs1, v112
	.byte	W08
	.byte		N12	, Cs1
	.byte	W24
	.byte	W16
	.byte		N07	, Cs1, v116
	.byte	W08
	.byte		N36	, Gs1, v127
	.byte	W40
	.byte		N30	, Fs1, v124
	.byte	W32
	.byte		N23	, En1, v127
	.byte	W24
	.byte		TIE	, Ds1, v124
	.byte	W72
	.byte	W30
	.byte	W01
	.byte		EOT	
	.byte	W01
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0041_4
song0041_4:	@ 0x08C7644C
	.byte	KEYSH	, 0
	.byte	VOICE	, 81
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte	LFOS	, 21
	.byte	MODT	, 0
	.byte	LFODL	, 0
	.byte	W24
	.byte		N06	, Fs2, v108
	.byte	W16
	.byte		N08	, Fs2, v092
	.byte	W08
	.byte		N07	, As2, v100
	.byte		N06	, Cs3, v092
	.byte	W16
	.byte		N05	, As2, v096
	.byte		N06	, Cs3, v084
	.byte	W08
	.byte		N07	, Cs2, v108
	.byte	W24
	.byte		N09	, Fs2, v112
	.byte		N08	, Cs3, v104
	.byte	W16
	.byte		N07	, As2, v112
	.byte		N07	, Cs3, v104
	.byte	W08
	.byte		N36	, Gs2, v100
	.byte		N36	, Bn2, v084
	.byte	W20
	.byte	MOD	, 4
	.byte	W01
	.byte		7
	.byte	W01
	.byte		9
	.byte	W01
	.byte		10
	.byte	W01
	.byte		14
	.byte	W02
	.byte		16
	.byte	W01
	.byte		17
	.byte	W01
	.byte		18
	.byte	W05
	.byte		16
	.byte	W01
	.byte		14
	.byte	W01
	.byte		12
	.byte	W01
	.byte		10
	.byte	W01
	.byte		7
	.byte	W01
	.byte		0
	.byte	W02
	.byte		N30	, Fs2, v096
	.byte		N30	, Bn2, v088
	.byte	W23
	.byte	MOD	, 5
	.byte	W02
	.byte		6
	.byte	W04
	.byte		7
	.byte	W02
	.byte		8
	.byte	W01
	.byte		9
	.byte		N23	, En2, v084
	.byte		N23	, Gs2, v100
	.byte	W02
	.byte	MOD	, 10
	.byte	W05
	.byte		9
	.byte	W01
	.byte		4
	.byte	W01
	.byte		0
	.byte	W15
	.byte		TIE	, Ds2, v096
	.byte		TIE	, Gn2, v080
	.byte	W42
	.byte	MOD	, 1
	.byte	W01
	.byte		7
	.byte	W02
	.byte		9
	.byte	W03
	.byte		10
	.byte	W05
	.byte		11
	.byte	W01
	.byte		12
	.byte	W02
	.byte		13
	.byte	W01
	.byte		14
	.byte	W01
	.byte		16
	.byte	W01
	.byte		17
	.byte	W01
	.byte		18
	.byte	W01
	.byte		19
	.byte	W04
	.byte		20
	.byte	W02
	.byte		21
	.byte	W01
	.byte		22
	.byte	W04
	.byte		23
	.byte	W32
	.byte	W03
	.byte		EOT	, Ds2
	.byte	W01
	.byte			Gn2
	.byte	W44
	.byte	W03
	.byte	MOD	, 30
	.byte	FINE

	.align 2
	.global song0041
song0041:	@ 0x08C764FC
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup007		@ voicegroup/tone

	.word	song0041_1		@ track
	.word	song0041_2		@ track
	.word	song0041_3		@ track
	.word	song0041_4		@ track
