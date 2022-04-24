	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0238_1
song0238_1:	@ 0x08C82DAC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 38
	.byte	VOL	, v100
	.byte	LFOS	, 2
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N05	, Dn4, v092
	.byte	W06
	.byte		N10	, Bn2
	.byte	W10
	.byte	FINE

	.align 2
	.global song0238
song0238:	@ 0x08C82DC4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0238_1		@ track
