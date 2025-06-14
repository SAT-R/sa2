	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song020_1
song020_1:	@ 0x0201C8D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 150
	.byte	VOICE	, 12
	.byte	MOD	, 78
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 4
	.byte		N03	, An2, v127
	.byte	W03
	.byte			Cn3, v120
	.byte	W03
	.byte			Ds3, v112
	.byte	W03
	.byte			Cs3, v104
	.byte	W03
	.byte			En3, v096
	.byte	W03
	.byte			Gn3, v088
	.byte	W03
	.byte			Fn3, v076
	.byte	W03
	.byte			Gs3, v068
	.byte	W03
	.byte			Bn3, v060
	.byte	W03
	.byte			An3, v052
	.byte	W03
	.byte			Cn4, v044
	.byte	W03
	.byte			Ds4, v036
	.byte	W03
	.byte			Cs4, v024
	.byte	W03
	.byte			En4
	.byte	W03
	.byte			Gn4, v016
	.byte	W03
	.byte			Fn4, v012
	.byte	W03
	.byte	FINE

	.align 2
	.global song020
song020:	@ 0x0201C910
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song020_1		@ track
