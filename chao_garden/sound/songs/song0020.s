	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0020_1
song0020_1:	@ 0x0201F36C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v095
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	BEND	, c_v+45
	.byte		N56	, As2, v104
	.byte	W01
	.byte	BEND	, c_v+43
	.byte	W02
	.byte		c_v+41
	.byte	W01
	.byte		c_v+38
	.byte	W02
	.byte		c_v+36
	.byte	W01
	.byte		c_v+33
	.byte	W02
	.byte		c_v+31
	.byte	W01
	.byte		c_v+29
	.byte	W02
	.byte		c_v+26
	.byte	W01
	.byte		c_v+24
	.byte	W02
	.byte		c_v+21
	.byte	W01
	.byte		c_v+19
	.byte	W02
	.byte		c_v+17
	.byte	W01
	.byte		c_v+14
	.byte	W02
	.byte		c_v+12
	.byte	W01
	.byte		c_v+9
	.byte	W02
	.byte		c_v+7
	.byte	W01
	.byte		c_v+5
	.byte	W02
	.byte		c_v+2
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v-3
	.byte	W01
	.byte		c_v-5
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
	.byte		c_v-19
	.byte	W02
	.byte		c_v-22
	.byte	W01
	.byte		c_v-24
	.byte	W02
	.byte		c_v-27
	.byte	W01
	.byte		c_v-29
	.byte	W02
	.byte		c_v-31
	.byte	W01
	.byte		c_v-34
	.byte	W02
	.byte		c_v-36
	.byte	W01
	.byte		c_v-39
	.byte	W02
	.byte		c_v-41
	.byte	W01
	.byte		c_v-43
	.byte	W02
	.byte		c_v-46
	.byte	W01
	.byte		c_v-48
	.byte	W02
	.byte		c_v-51
	.byte	W01
	.byte		c_v-53
	.byte	W02
	.byte		c_v-55
	.byte	W01
	.byte		c_v-58
	.byte	W02
	.byte		c_v-60
	.byte	W01
	.byte		c_v-63
	.byte	W01
	.byte		c_v-64
	.byte	FINE

	.align 2
	.global song0020
song0020:	@ 0x0201F3DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0020_1		@ track
