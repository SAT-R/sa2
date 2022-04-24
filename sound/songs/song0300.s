	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0300_1
song0300_1:	@ 0x08C84A58
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 1
	.byte	VOL	, v120
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
	.global song0300
song0300:	@ 0x08C84A70
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0300_1		@ track
