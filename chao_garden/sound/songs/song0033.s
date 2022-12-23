	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0033_1
song0033_1:	@ 0x0201F75C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 10
	.byte	LFOS	, 33
	.byte	MOD	, 55
	.byte	MODT	, 0
	.byte	BEND	, c_v-64
	.byte		N66	, Fn3, v127
	.byte	W01
	.byte	BEND	, c_v-62
	.byte	W02
	.byte		c_v-59
	.byte	W01
	.byte		c_v-56
	.byte	W02
	.byte		c_v-53
	.byte	W01
	.byte		c_v-50
	.byte	W02
	.byte		c_v-48
	.byte	W01
	.byte		c_v-45
	.byte	W02
	.byte		c_v-42
	.byte	W01
	.byte		c_v-39
	.byte	W02
	.byte		c_v-36
	.byte	W01
	.byte		c_v-34
	.byte	W02
	.byte		c_v-31
	.byte	W01
	.byte		c_v-28
	.byte	W02
	.byte		c_v-25
	.byte	W01
	.byte		c_v-22
	.byte	W02
	.byte		c_v-20
	.byte	W01
	.byte		c_v-17
	.byte	W02
	.byte		c_v-14
	.byte	W01
	.byte		c_v-11
	.byte	W02
	.byte		c_v-8
	.byte	W01
	.byte		c_v-6
	.byte	W02
	.byte		c_v-3
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v+3
	.byte	W01
	.byte		c_v+6
	.byte	W02
	.byte		c_v+8
	.byte	W01
	.byte		c_v+11
	.byte	W02
	.byte		c_v+14
	.byte	W01
	.byte		c_v+17
	.byte	W02
	.byte		c_v+20
	.byte	W01
	.byte		c_v+22
	.byte	W02
	.byte		c_v+25
	.byte	W01
	.byte		c_v+28
	.byte	W02
	.byte		c_v+31
	.byte	W01
	.byte		c_v+34
	.byte	W02
	.byte		c_v+36
	.byte	W01
	.byte		c_v+39
	.byte	W02
	.byte		c_v+42
	.byte	W01
	.byte		c_v+45
	.byte	W02
	.byte		c_v+48
	.byte	W01
	.byte		c_v+50
	.byte	W02
	.byte		c_v+53
	.byte	W01
	.byte		c_v+56
	.byte	W02
	.byte		c_v+59
	.byte	W01
	.byte		c_v+62
	.byte	W01
	.byte	MOD	, 1
	.byte	BEND	, c_v+63
	.byte		N04	, Fs3, v108
	.byte	W04
	.byte			Bn3, v112
	.byte	W04
	.byte			Fs4
	.byte	W04
	.byte	FINE

	.align 2
	.global song0033
song0033:	@ 0x0201F7E0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0033_1		@ track
