	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0298_1
song0298_1:	@ 0x08C84A34
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 98
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	LFOS	, 103
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 100
	.byte		N60	, Cs7, v127
	.byte	W60
	.byte	W02
	.byte	FINE

	.align 2
	.global song0298
song0298:	@ 0x08C84A4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	40		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0298_1		@ track
