	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0307_1
song0307_1:	@ 0x08C84B54
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 6
	.byte	VOL	, v127
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N68	, En2, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0307
song0307:	@ 0x08C84B6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0307_1		@ track
