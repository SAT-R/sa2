	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song010_1
song010_1:	@ 0x0201C5A0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N04	, Fs4, v127
	.byte	W04
	.byte			Bn4, v120
	.byte	W04
	.byte			En5, v112
	.byte	W04
	.byte			An5, v104
	.byte	W04
	.byte	FINE

	.align 2
	.global song010
song010:	@ 0x0201C5BC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song010_1		@ track
