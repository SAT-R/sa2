	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0015_1
song0015_1:	@ 0x0201F210
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 3
	.byte	VOL	, v080
	.byte	PAN	, c_v
	.byte	BENDR	, 7
	.byte	BEND	, c_v+9
	.byte		N07	, As4, v104
	.byte	W01
	.byte	BEND	, c_v-14
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v+50
	.byte	W01
	.byte		c_v+63
	.byte	FINE

	.align 2
	.global song0015
song0015:	@ 0x0201F238
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0015_1		@ track
