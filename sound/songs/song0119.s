	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0119_1
song0119_1:	@ 0x08C810EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 52
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N06	, Cs1, v127
	.byte	W07
	.byte		N32	, Cn1, v112
	.byte	W32
	.byte	FINE

	.align 2
	.global song0119
song0119:	@ 0x08C81104
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	40		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0119_1		@ track
