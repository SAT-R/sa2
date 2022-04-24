	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0410_1
song0410_1:	@ 0x08C8607C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 127
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 127
	.byte	W05
	.byte		N01	, An1, v127
	.byte	W02
	.byte		N04	
	.byte	W05
	.byte		N06	, Gs1
	.byte	W06
	.byte		N04	, Dn1, v052
	.byte		N06	, Gn1, v127
	.byte	W06
	.byte		N04	, Dn1, v052
	.byte		N06	, Fs1, v127
	.byte	W06
	.byte			Cs1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte		N06	, Dn1, v052
	.byte	W06
	.byte			Ds1, v096
	.byte	W18
	.byte			Cs1, v127
	.byte	W06
	.byte		N60	, Cs2
	.byte	W24
	.byte	W36
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0410_2
song0410_2:	@ 0x08C860B4
	.byte	KEYSH	, 0
	.byte	VOICE	, 13
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N03	, Gs3, v127
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Fs3
	.byte	W12
	.byte			Ds3
	.byte	W06
	.byte			Fs3
	.byte	W05
	.byte		N03	
	.byte	W03
	.byte		N18	, Gs3
	.byte	W18
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0410_3
song0410_3:	@ 0x08C860DD
	.byte	KEYSH	, 0
	.byte	VOICE	, 13
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N03	, Ds3, v127
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte			Cs3
	.byte	W12
	.byte		N03	
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N18	, Ds3
	.byte	W18
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0410_4
song0410_4:	@ 0x08C86104
	.byte	KEYSH	, 0
	.byte	VOICE	, 13
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N05	, Gs1, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N11	, As2
	.byte	W12
	.byte		N05	, Cn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte		N18	, Ds3
	.byte	W18
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0410_5
song0410_5:	@ 0x08C8612D
	.byte	KEYSH	, 0
	.byte	VOICE	, 12
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N03	, Gs2, v127
	.byte	W06
	.byte		N03	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N06	, Fs2
	.byte	W12
	.byte		N03	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N18	, Gs2
	.byte	W18
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0410_6
song0410_6:	@ 0x08C86155
	.byte	KEYSH	, 0
	.byte	VOICE	, 30
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W16
	.byte		N04	, Gn2, v064
	.byte	W03
	.byte			An2, v036
	.byte	W03
	.byte		N03	, Bn2, v056
	.byte	W02
	.byte			Cn3, v072
	.byte	W03
	.byte			Dn3, v076
	.byte	W04
	.byte		N05	, Dn3, v108
	.byte		N18	, Ds3, v116
	.byte	W17
	.byte		N06	, Cs3, v104
	.byte	W12
	.byte		N05	, Cs3, v127
	.byte	W12
	.byte		N18	, Ds3
	.byte	W18
	.byte		N05	, Cs3, v048
	.byte	W06
	.byte		N01	, As2
	.byte	W01
	.byte		N02	, Gs2, v088
	.byte	W02
	.byte		N01	, Fs2, v072
	.byte	W02
	.byte			Ds2, v100
	.byte	W04
	.byte			Bn1, v060
	.byte	W01
	.byte			An1, v056
	.byte	W01
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0410_7
song0410_7:	@ 0x08C861A6
	.byte	KEYSH	, 0
	.byte	VOICE	, 37
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N05	, Gs1, v127
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N11	, As2
	.byte	W12
	.byte		N05	, Cn3
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte		N18	, Ds3
	.byte	W18
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0410_8
song0410_8:	@ 0x08C861CF
	.byte	KEYSH	, 0
	.byte	VOICE	, 38
	.byte	VOL	, v085
	.byte	PAN	, c_v
	.byte	BENDR	, 13
	.byte	LFOS	, 18
	.byte	LFODL	, 20
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	BEND	, c_v
	.byte	W30
	.byte		N03	, Cn3, v092
	.byte	W06
	.byte			Cn3, v072
	.byte	W06
	.byte			Cn3, v064
	.byte	W06
	.byte			As2, v096
	.byte	W12
	.byte			As2, v064
	.byte	W06
	.byte			As2, v068
	.byte	W06
	.byte			Cn3, v100
	.byte	W03
	.byte	FINE

	.align 2
	.global song0410
song0410:	@ 0x08C861FC
	.byte	8		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup013		@ voicegroup/tone

	.word	song0410_1		@ track
	.word	song0410_2		@ track
	.word	song0410_3		@ track
	.word	song0410_4		@ track
	.word	song0410_5		@ track
	.word	song0410_6		@ track
	.word	song0410_7		@ track
	.word	song0410_8		@ track
