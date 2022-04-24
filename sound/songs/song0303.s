	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0303_1
song0303_1:	@ 0x08C84AC4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 1
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 12
	.byte	BENDR	, 20
	.byte		N68	, Cn4, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0303
song0303:	@ 0x08C84ADC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0303_1		@ track
