	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0323_1
song0323_1:	@ 0x08C84DB8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 25
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N02	, Cs3, v104
	.byte		N06	, Dn3, v100
	.byte	W05
	.byte		N04	, Cn3
	.byte	W07
	.byte		N02	, As2, v116
	.byte	W05
	.byte		N01	, En3, v127
	.byte		N24	, Fn3, v120
	.byte	W24
	.byte	W03
	.byte	FINE

	.align 2
	.global song0323
song0323:	@ 0x08C84DE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0323_1		@ track
