	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0017_1
song0017_1:	@ 0x0201F294
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 62
	.byte	VOL	, v068
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		N04	, Fn4, v120
	.byte	W08
	.byte			Cn5
	.byte	W04
	.byte			Fs5
	.byte	W04
	.byte	FINE

	.align 2
	.global song0017
song0017:	@ 0x0201F2AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0017_1		@ track
