	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0329_1
song0329_1:	@ 0x08C84EA4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 29
	.byte	VOL	, v120
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N68	, Cn4, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0329
song0329:	@ 0x08C84EBC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0329_1		@ track
