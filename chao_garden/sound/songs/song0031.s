	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0031_1
song0031_1:	@ 0x0201F65C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 65
	.byte	MOD	, 2
	.byte	PAN	, c_v
	.byte	BENDR	, 10
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	VOL	, v127
	.byte	BEND	, c_v-64
	.byte		N54	, Dn4, v127
	.byte	W01
	.byte	BEND	, c_v-61
	.byte	W02
	.byte		c_v-58
	.byte	W01
	.byte		c_v-54
	.byte	W02
	.byte		c_v-51
	.byte	W01
	.byte		c_v-48
	.byte	W02
	.byte		c_v-44
	.byte	W01
	.byte		c_v-41
	.byte	W02
	.byte		c_v-37
	.byte	W01
	.byte		c_v-34
	.byte	W02
	.byte		c_v-31
	.byte	W01
	.byte		c_v-27
	.byte	W02
	.byte		c_v-24
	.byte	W01
	.byte		c_v-20
	.byte	W02
	.byte		c_v-17
	.byte	W01
	.byte		c_v-14
	.byte	W02
	.byte		c_v-10
	.byte	W01
	.byte		c_v-7
	.byte	W02
	.byte		c_v-3
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte		c_v+3
	.byte	W01
	.byte		c_v+7
	.byte	W02
	.byte		c_v+10
	.byte	W01
	.byte		c_v+13
	.byte	W02
	.byte		c_v+17
	.byte	W01
	.byte		c_v+20
	.byte	W02
	.byte		c_v+24
	.byte	W01
	.byte		c_v+27
	.byte	W02
	.byte		c_v+30
	.byte	W01
	.byte		c_v+34
	.byte	W02
	.byte		c_v+37
	.byte	W01
	.byte		c_v+41
	.byte	W02
	.byte		c_v+44
	.byte	W01
	.byte		c_v+47
	.byte	W02
	.byte		c_v+51
	.byte	W01
	.byte		c_v+54
	.byte	W02
	.byte		c_v+58
	.byte	W01
	.byte		c_v+61
	.byte	W01
	.byte		c_v+63
	.byte	FINE

	.align 2
	.global song0031
song0031:	@ 0x0201F6C4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0031_1		@ track
