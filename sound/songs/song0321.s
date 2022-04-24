	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0321_1
song0321_1:	@ 0x08C84D54
	.byte	KEYSH	, 0
	.byte	TEMPO	, 38
	.byte	VOICE	, 25
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N90	, As2, v127
	.byte	W90
	.byte	W01
	.byte	FINE

	.align 2
	.global song0321
song0321:	@ 0x08C84D6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0321_1		@ track
