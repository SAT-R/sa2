	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0313_1
song0313_1:	@ 0x08C84C2C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 14
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N68	, Gs2, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0313
song0313:	@ 0x08C84C44
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0313_1		@ track
