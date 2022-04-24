	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0121_1
song0121_1:	@ 0x08C81178
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 34
	.byte	VOL	, v107
	.byte	LFOS	, 2
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N05	, Dn4, v092
	.byte	W06
	.byte		N04	, Fs3
	.byte	W04
	.byte	FINE

	.align 2
	.global song0121
song0121:	@ 0x08C81190
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0121_1		@ track
