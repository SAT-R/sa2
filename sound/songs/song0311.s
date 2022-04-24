	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0311_1
song0311_1:	@ 0x08C84BE4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 45
	.byte	VOICE	, 6
	.byte	VOL	, v127
	.byte	MODT	, 0
	.byte	LFOS	, 22
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BENDR	, 20
	.byte		N68	, Bn2, v127
	.byte	W68
	.byte	W01
	.byte	FINE

	.align 2
	.global song0311
song0311:	@ 0x08C84BFC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0311_1		@ track
