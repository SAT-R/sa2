	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song015_1
song015_1:	@ 0x0201C7B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v100
	.byte		N48	, Cn3, v127
	.byte	W48
	.byte	FINE

	.align 2
	.global song015
song015:	@ 0x0201C7C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup002		@ voicegroup/tone

	.word	song015_1		@ track
