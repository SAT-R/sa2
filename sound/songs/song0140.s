	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0140_1
song0140_1:	@ 0x08C815A4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 90
	.byte	VOICE	, 1
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N04	, Fs6, v112
	.byte	W04
	.byte	FINE

	.align 2
	.global song0140
song0140:	@ 0x08C815B8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0140_1		@ track
