	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0026_1
song0026_1:	@ 0x0201F57C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v078
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	VOL	, v105
	.byte		N08	, En4, v112
	.byte	W16
	.byte			Fs4, v124
	.byte	W12
	.byte		N16	, Fs4, v116
	.byte	W04
	.byte	MOD	, 2
	.byte	W24
	.byte		N40	, Gs4, v112
	.byte	W40
	.byte	FINE

	.align 2
	.global song0026
song0026:	@ 0x0201F5A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0026_1		@ track
