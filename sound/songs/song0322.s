	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0322_1
song0322_1:	@ 0x08C84D78
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 25
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N02	, Cs4, v116
	.byte	W01
	.byte		N06	, Dn4, v108
	.byte	W07
	.byte		N03	, Cn4, v100
	.byte	W08
	.byte			As3, v116
	.byte	W07
	.byte		N02	, Fn3, v108
	.byte	W05
	.byte		N12	, Cn3, v116
	.byte	W11
	.byte		N01	, Cs3, v108
	.byte	W02
	.byte		N18	, Dn3, v116
	.byte	W19
	.byte	FINE

	.align 2
	.global song0322
song0322:	@ 0x08C84DAC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0322_1		@ track
