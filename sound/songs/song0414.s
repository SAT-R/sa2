	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0414_1
song0414_1:	@ 0x08C86598
	.byte	KEYSH	, 0
	.byte	TEMPO	, 38
	.byte	VOICE	, 108
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N02	, Bn4, v108
	.byte	W02
	.byte			Gn4
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte		N05	, Bn4
	.byte	W05
	.byte			Gn5
	.byte	W05
	.byte		N10	, Dn5
	.byte	W11
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0414_2
song0414_2:	@ 0x08C865B3
	.byte	KEYSH	, 0
	.byte	VOICE	, 109
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N02	, Dn4, v108
	.byte	W02
	.byte			Bn3
	.byte	W03
	.byte			Fs4
	.byte	W03
	.byte		N05	, Dn4
	.byte	W05
	.byte			Bn4
	.byte	W05
	.byte		N10	, Fs4
	.byte	W11
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0414_3
song0414_3:	@ 0x08C865CC
	.byte	KEYSH	, 0
	.byte	VOICE	, 63
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N02	, Bn3, v108
	.byte	W02
	.byte			Gn3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte		N05	, Bn3
	.byte	W05
	.byte			Gn4
	.byte	W05
	.byte		N10	, Dn4
	.byte	W11
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0414_4
song0414_4:	@ 0x08C865E5
	.byte	KEYSH	, 0
	.byte	VOICE	, 64
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N02	, Dn3, v108
	.byte	W02
	.byte			Bn2
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte		N05	, Dn3
	.byte	W05
	.byte			Bn3
	.byte	W05
	.byte		N10	, Fs3
	.byte	W11
	.byte	FINE

	.align 2
	.global song0414
song0414:	@ 0x08C86600
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song0414_1		@ track
	.word	song0414_2		@ track
	.word	song0414_3		@ track
	.word	song0414_4		@ track
