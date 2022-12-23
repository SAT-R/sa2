	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0019_1
song0019_1:	@ 0x0201F32C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 4
	.byte	BEND	, c_v+8
	.byte		N17	, Gs4, v104
	.byte	W01
	.byte	BEND	, c_v-4
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-47
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+22
	.byte	W01
	.byte		c_v+31
	.byte	W01
	.byte		c_v+48
	.byte	W01
	.byte		c_v+57
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte	FINE

	.align 2
	.global song0019
song0019:	@ 0x0201F360
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0019_1		@ track
