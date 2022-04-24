	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0403_1
song0403_1:	@ 0x08C85298
	.byte	KEYSH	, 0
	.byte	TEMPO	, 72
	.byte	VOICE	, 19
	.byte	VOL	, v073
	.byte	PAN	, c_v
	.byte	W48
	.byte		N06	, Gs3, v127
	.byte	W18
	.byte			As3
	.byte	W18
	.byte		N54	, Cn4
	.byte	W12
	.byte	W48
	.byte		N06	
	.byte	W18
	.byte			Dn4
	.byte	W18
	.byte		N48	, Ds4
	.byte	W12
	.byte	W48
	.byte		N06	, Fn4
	.byte	W06
	.byte		TIE	
	.byte	W42
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0403_2
song0403_2:	@ 0x08C852BD
	.byte	KEYSH	, 0
	.byte	VOICE	, 20
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	W48
	.byte		N06	, Gs2, v127
	.byte	W18
	.byte			As2
	.byte	W18
	.byte		N54	, Cn3
	.byte	W12
	.byte	W48
	.byte		N06	
	.byte	W18
	.byte			Dn3
	.byte	W18
	.byte		N48	, Ds3
	.byte	W12
	.byte	W48
	.byte		N06	, Fn3
	.byte	W06
	.byte		N12	
	.byte	W12
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0403_3
song0403_3:	@ 0x08C852DE
	.byte	KEYSH	, 0
	.byte	VOICE	, 21
	.byte	VOL	, v060
	.byte	PAN	, c_v
	.byte	W48
	.byte		N06	, Ds2, v127
	.byte	W18
	.byte			Fn2
	.byte	W18
	.byte		N54	, Gs2
	.byte	W12
	.byte	W48
	.byte		N06	
	.byte	W18
	.byte			As2, v120
	.byte	W18
	.byte		N48	, Bn2, v127
	.byte	W12
	.byte	W48
	.byte		N06	, Cs3
	.byte	W06
	.byte		TIE	
	.byte	W42
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0403_4
song0403_4:	@ 0x08C85303
	.byte	KEYSH	, 0
	.byte	VOICE	, 22
	.byte	VOL	, v093
	.byte	PAN	, c_v
	.byte	W48
	.byte		N06	, Cn3, v127
	.byte	W18
	.byte			Dn3
	.byte	W18
	.byte		N54	, Ds3, v124
	.byte	W12
	.byte	W48
	.byte		N06	, Ds3, v127
	.byte	W18
	.byte			Fn3
	.byte	W18
	.byte		N48	, Fs3
	.byte	W12
	.byte	W48
	.byte		N06	, Gs3
	.byte	W06
	.byte		TIE	
	.byte	W42
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0403_5
song0403_5:	@ 0x08C85329
	.byte	KEYSH	, 0
	.byte	VOICE	, 23
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	W48
	.byte		N06	, Gs2, v127
	.byte	W18
	.byte			Gn2
	.byte	W18
	.byte		N54	, Fn2
	.byte	W12
	.byte	W48
	.byte		N06	
	.byte	W18
	.byte			Ds2
	.byte	W18
	.byte		N48	, Cs2
	.byte	W12
	.byte	W48
	.byte		N06	, Ds2
	.byte	W06
	.byte		TIE	
	.byte	W42
	.byte	W96
	.byte		EOT	
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0403_6
song0403_6:	@ 0x08C8534C
	.byte	KEYSH	, 0
	.byte	VOICE	, 24
	.byte	VOL	, v063
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N03	, Ds2, v120
	.byte	W03
	.byte			Fn2, v127
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Cs6
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W04
	.byte			Cs6, v072
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W05
	.byte			Cs6, v028
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0403_7
song0403_7:	@ 0x08C853D5
	.byte	KEYSH	, 0
	.byte	VOICE	, 25
	.byte	VOL	, v025
	.byte	PAN	, c_v
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N03	, Ds2, v120
	.byte	W03
	.byte			Fn2, v127
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Cs6
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W04
	.byte			Cs6, v072
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W05
	.byte			Cs6, v028
	.byte	W03
	.byte			Gs5
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Ds5
	.byte	W03
	.byte			Cs5
	.byte	W03
	.byte			Gs4
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Ds4
	.byte	W03
	.byte			Cs4
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Ds3
	.byte	W03
	.byte			Cs3
	.byte	W03
	.byte			Gs2
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0403_8
song0403_8:	@ 0x08C8545E
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v103
	.byte	PAN	, c_v
	.byte		N03	, Cs1, v120
	.byte	W04
	.byte			Cs1, v108
	.byte	W04
	.byte		N24	, Cs1, v064
	.byte	W04
	.byte		N05	, Gs1, v100
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Gn1, v096
	.byte	W06
	.byte			Gn1, v092
	.byte	W06
	.byte			Fs1, v108
	.byte	W06
	.byte			Fs1, v104
	.byte	W06
	.byte		N17	, Cn1, v108
	.byte		N72	, Fs2
	.byte	W18
	.byte		N17	, Cs1, v104
	.byte	W18
	.byte		N23	, Cn1, v127
	.byte	W12
	.byte	W12
	.byte		N05	, Cn1, v108
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, Cs1, v127
	.byte	W12
	.byte		N05	, Cn1, v116
	.byte	W06
	.byte			Cs1, v096
	.byte	W06
	.byte		N17	, Cn1, v120
	.byte		N72	, Fs2, v108
	.byte	W18
	.byte		N17	, Cs1
	.byte	W18
	.byte		N23	, Cn1, v116
	.byte	W12
	.byte	W12
	.byte		N03	, An1, v120
	.byte	W04
	.byte		N19	
	.byte	W02
	.byte		N23	, Gs1
	.byte	W06
	.byte		N11	, Cs1
	.byte	W12
	.byte			Cn1, v096
	.byte	W12
	.byte		N05	, Cs1, v116
	.byte		N05	, Fs2, v108
	.byte	W06
	.byte		N76	, Cs1, v100
	.byte		N72	, Fs2, v108
	.byte	W42
	.byte	W36
	.byte		N05	, Cs1, v100
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N30	, Cn1
	.byte		TIE	, Fs2, v108
	.byte	W48
	.byte	W48
	.byte	W01
	.byte		EOT	
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0403_9
song0403_9:	@ 0x08C854E0
	.byte	VOL	, v110
	.byte	KEYSH	, 0
	.byte	W48
	.byte		N09	, Dn1, v040
	.byte	W18
	.byte		N09	
	.byte	W18
	.byte		N09	
	.byte	W12
	.byte	W24
	.byte		N21	, Ds1
	.byte	W24
	.byte		N09	, Dn1
	.byte	W18
	.byte		N09	
	.byte	W18
	.byte		N09	
	.byte	W12
	.byte	W24
	.byte		N24	, Ds1
	.byte	W30
	.byte		N24	
	.byte	W24
	.byte	W03
	.byte	FINE

	.align 2
	.global song0403
song0403:	@ 0x08C85500
	.byte	9		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup008		@ voicegroup/tone

	.word	song0403_1		@ track
	.word	song0403_2		@ track
	.word	song0403_3		@ track
	.word	song0403_4		@ track
	.word	song0403_5		@ track
	.word	song0403_6		@ track
	.word	song0403_7		@ track
	.word	song0403_8		@ track
	.word	song0403_9		@ track
