	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0034_1
song0034_1:	@ 0x0201F7EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte	BEND	, c_v-48
	.byte		N08	, Cn5, v108
	.byte	W01
	.byte	BEND	, c_v-31
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+37
	.byte	W01
	.byte		c_v+63
	.byte	W03
	.byte		N24	, Gn4, v127
	.byte	W24
	.byte	FINE

	.align 2
	.global song0034
song0034:	@ 0x0201F810
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0034_1		@ track
