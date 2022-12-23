	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0032_1
song0032_1:	@ 0x0201F6D0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 52
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 10
	.byte	LFOS	, 33
	.byte	MOD	, 25
	.byte	MODT	, 0
	.byte	BEND	, c_v+63
	.byte		N42	, Fn3, v127
	.byte	W01
	.byte	BEND	, c_v+61
	.byte	W02
	.byte		c_v+58
	.byte	W01
	.byte		c_v+56
	.byte	W02
	.byte		c_v+53
	.byte	W01
	.byte		c_v+51
	.byte	W02
	.byte		c_v+48
	.byte	W01
	.byte		c_v+46
	.byte	W02
	.byte		c_v+43
	.byte	W01
	.byte		c_v+41
	.byte	W02
	.byte		c_v+38
	.byte	W01
	.byte		c_v+36
	.byte	W02
	.byte		c_v+33
	.byte	W01
	.byte		c_v+31
	.byte	W02
	.byte		c_v+28
	.byte	W01
	.byte		c_v+26
	.byte	W02
	.byte		c_v+23
	.byte	W01
	.byte		c_v+21
	.byte	W02
	.byte		c_v+18
	.byte	W01
	.byte		c_v+16
	.byte	W02
	.byte		c_v+13
	.byte	W01
	.byte		c_v+11
	.byte	W02
	.byte		c_v+8
	.byte	W01
	.byte		c_v+6
	.byte	W02
	.byte		c_v+3
	.byte	W01
	.byte		c_v+1
	.byte	W02
	.byte		c_v-2
	.byte	W01
	.byte		c_v-4
	.byte	W02
	.byte		c_v-7
	.byte	W01
	.byte		c_v-10
	.byte	W02
	.byte		c_v-12
	.byte	W01
	.byte		c_v-15
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-20
	.byte	W02
	.byte		c_v-22
	.byte	W01
	.byte		c_v-25
	.byte	W02
	.byte		c_v-27
	.byte	W01
	.byte		c_v-30
	.byte	W02
	.byte		c_v-32
	.byte	W01
	.byte		c_v-35
	.byte	W02
	.byte		c_v-37
	.byte	W01
	.byte		c_v-40
	.byte	W02
	.byte		c_v-42
	.byte	W01
	.byte		c_v-45
	.byte	W02
	.byte		c_v-47
	.byte	W01
	.byte		c_v-50
	.byte	W02
	.byte		c_v-52
	.byte	W01
	.byte		c_v-55
	.byte	W02
	.byte		c_v-57
	.byte	W01
	.byte		c_v-60
	.byte	W02
	.byte		c_v-64
	.byte	FINE

	.align 2
	.global song0032
song0032:	@ 0x0201F750
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0032_1		@ track
