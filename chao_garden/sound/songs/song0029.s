	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0029_1
song0029_1:	@ 0x0201F5F8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 50
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 33
	.byte	BEND	, c_v+37
	.byte		N09	, As4, v127
	.byte	W01
	.byte	BEND	, c_v+11
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v-55
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+22
	.byte	W01
	.byte		c_v+41
	.byte	W01
	.byte		c_v+51
	.byte	W01
	.byte		c_v+63
	.byte	FINE

	.align 2
	.global song0029
song0029:	@ 0x0201F628
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0029_1		@ track
