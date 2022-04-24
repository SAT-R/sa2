	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0401_1
song0401_1:	@ 0x08C84F9C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 65
	.byte	VOICE	, 11
	.byte	VOL	, v075
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte		N06	, As2, v112
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Bn2
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N18	, En2
	.byte	W18
	.byte		N06	, Ds2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			En3
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Ds3
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N60	, Cs3
	.byte	W54
	.byte	W06
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0401_2
song0401_2:	@ 0x08C84FCD
	.byte	KEYSH	, 0
	.byte	VOICE	, 12
	.byte	VOL	, v048
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte		N06	, Fs2, v112
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Gs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N18	, Bn1
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Gs2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N60	, Fs2
	.byte	W54
	.byte	W06
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0401_3
song0401_3:	@ 0x08C84FFB
	.byte	KEYSH	, 0
	.byte	VOICE	, 13
	.byte	VOL	, v065
	.byte	PAN	, c_v
	.byte	BENDR	, 0
	.byte		N06	, Cs3, v100
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			En3
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N18	, Gs2
	.byte	W18
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte			En2
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gs2
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte		N60	, Fs2
	.byte	W54
	.byte	W06
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0401_4
song0401_4:	@ 0x08C85029
	.byte	KEYSH	, 0
	.byte	VOICE	, 127
	.byte	VOL	, v103
	.byte	PAN	, c_v
	.byte	BENDR	, 127
	.byte		N06	, Cs1, v127
	.byte		N78	, Cs2, v056
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte	W12
	.byte		N06	
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v036
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte	W06
	.byte			Cs1
	.byte	W06
	.byte			Cn1
	.byte		N06	, Dn1, v036
	.byte	W06
	.byte			Cs1, v127
	.byte	W06
	.byte			Dn1, v036
	.byte		N06	, Gn1, v127
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte		N05	, Cs1
	.byte		N12	, Ds1, v036
	.byte		N40	, Cs2, v056
	.byte	W06
	.byte		N05	, Cn1, v127
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N11	, Cs1
	.byte		N12	, Ds1, v036
	.byte	W12
	.byte		N11	, Cn1, v127
	.byte	W12
	.byte		N52	, Cs1
	.byte		N12	, Ds1, v036
	.byte		N54	, Cs2, v056
	.byte	W54
	.byte	FINE

	.align 2
	.global song0401
song0401:	@ 0x08C8508C
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup008		@ voicegroup/tone

	.word	song0401_1		@ track
	.word	song0401_2		@ track
	.word	song0401_3		@ track
	.word	song0401_4		@ track
