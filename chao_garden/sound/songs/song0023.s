	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0023_1
song0023_1:	@ 0x0201F42C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 64
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 77
	.byte	LFODL	, 0
	.byte	MODT	, 0
	.byte	MOD	, 17
	.byte	BEND	, c_v-64
	.byte		N96	, Fs3, v116
	.byte	W01
	.byte	BEND	, c_v-59
	.byte	W02
	.byte		c_v-53
	.byte	W01
	.byte		c_v-47
	.byte	W02
	.byte		c_v-41
	.byte	W01
	.byte		c_v-35
	.byte	W02
	.byte		c_v-29
	.byte	W01
	.byte		c_v-24
	.byte	W02
	.byte		c_v-18
	.byte	W01
	.byte		c_v-12
	.byte	W02
	.byte		c_v-6
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v+6
	.byte	W01
	.byte		c_v+11
	.byte	W02
	.byte		c_v+19
	.byte	W01
	.byte		c_v+17
	.byte	W02
	.byte		c_v+15
	.byte	W01
	.byte		c_v+13
	.byte	W02
	.byte		c_v+11
	.byte	W01
	.byte		c_v+9
	.byte	W02
	.byte		c_v+7
	.byte	W01
	.byte		c_v+5
	.byte	W02
	.byte		c_v+3
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v-2
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-6
	.byte	W01
	.byte		c_v-8
	.byte	W02
	.byte		c_v-10
	.byte	W01
	.byte		c_v-12
	.byte	W02
	.byte		c_v-14
	.byte	W01
	.byte		c_v-16
	.byte	W02
	.byte		c_v-19
	.byte	W01
	.byte		c_v-17
	.byte	W02
	.byte		c_v-15
	.byte	W01
	.byte		c_v-13
	.byte	W02
	.byte		c_v-11
	.byte	W01
	.byte		c_v-9
	.byte	W02
	.byte		c_v-7
	.byte	W01
	.byte		c_v-5
	.byte	W02
	.byte		c_v-3
	.byte	W01
	.byte		c_v-1
	.byte	W02
	.byte		c_v+2
	.byte	W01
	.byte		c_v+4
	.byte	W02
	.byte		c_v+6
	.byte	W01
	.byte		c_v+8
	.byte	W02
	.byte		c_v+10
	.byte	W01
	.byte		c_v+12
	.byte	W02
	.byte		c_v+14
	.byte	W01
	.byte		c_v+16
	.byte	W02
	.byte		c_v+18
	.byte	W01
	.byte		c_v+20
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-38
	.byte	W01
	.byte		c_v-44
	.byte	W01
	.byte		c_v-47
	.byte	W01
	.byte		c_v-50
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-59
	.byte	W01
	.byte		c_v-64
	.byte	FINE

	.align 2
	.global song0023
song0023:	@ 0x0201F4DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0023_1		@ track
