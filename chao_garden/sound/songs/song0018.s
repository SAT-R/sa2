	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0018_1
song0018_1:	@ 0x0201F2B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 66
	.byte	BENDR	, 11
	.byte	PAN	, c_v
	.byte	MOD	, 3
	.byte	VOL	, v080
	.byte	LFODL	, 0
	.byte	LFOS	, 35
	.byte	MODT	, 0
	.byte	BEND	, c_v-62
	.byte		N36	, Gn4, v120
	.byte	W01
	.byte	BEND	, c_v-59
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-53
	.byte	W01
	.byte		c_v-48
	.byte	W01
	.byte		c_v-45
	.byte	W01
	.byte		c_v-42
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-23
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+22
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte		c_v+33
	.byte	W01
	.byte		c_v+36
	.byte	W01
	.byte		c_v+39
	.byte	W01
	.byte		c_v+41
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+50
	.byte	W01
	.byte		c_v+52
	.byte	W01
	.byte		c_v+55
	.byte	W01
	.byte		c_v+58
	.byte	W01
	.byte		c_v+63
	.byte	FINE

	.align 2
	.global song0018
song0018:	@ 0x0201F320
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0018_1		@ track
