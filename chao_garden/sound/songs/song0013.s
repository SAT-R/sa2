	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0013_1
song0013_1:	@ 0x0201F1C0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 50
	.byte	VOL	, v066
	.byte	PAN	, c_v
	.byte	BENDR	, 10
	.byte	BEND	, c_v+51
	.byte		N09	, Fn3, v127
	.byte	W01
	.byte	BEND	, c_v+39
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-46
	.byte	W01
	.byte		c_v-64
	.byte	W02
	.byte	FINE

	.align 2
	.global song0013
song0013:	@ 0x0201F1E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0013_1		@ track
