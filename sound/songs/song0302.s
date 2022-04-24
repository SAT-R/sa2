	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0302_1
song0302_1:	@ 0x08C84AA0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 1
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 12
	.byte	BENDR	, 20
	.byte		N68	, Gn3, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0302
song0302:	@ 0x08C84AB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0302_1		@ track
