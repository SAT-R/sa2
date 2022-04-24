	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0152_1
song0152_1:	@ 0x08C8197C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 64
	.byte	VOL	, v090
	.byte	LFOS	, 15
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N05	, Cn5, v127
	.byte	W05
	.byte		N24	, An4
	.byte	W24
	.byte	W01
	.byte	FINE

	.align 2
	.global song0152
song0152:	@ 0x08C81998
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0152_1		@ track
