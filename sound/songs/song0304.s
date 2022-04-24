	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0304_1
song0304_1:	@ 0x08C84AE8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 5
	.byte	VOL	, v127
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 12
	.byte	BENDR	, 20
	.byte		N68	, Cn3, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0304
song0304:	@ 0x08C84B00
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0304_1		@ track
