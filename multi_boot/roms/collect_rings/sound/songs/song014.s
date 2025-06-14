	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song014_1
song014_1:	@ 0x0201C764
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
	.byte	VOL	, v075
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N04	, Fn3, v112
	.byte	W04
	.byte	BEND	, c_v-64
	.byte		N20	, Bn4, v120
	.byte	W01
	.byte	BEND	, c_v-60
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-47
	.byte	W01
	.byte		c_v-43
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+22
	.byte	FINE

	.align 2
	.global song014
song014:	@ 0x0201C7A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song014_1		@ track
