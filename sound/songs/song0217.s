	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0217_1
song0217_1:	@ 0x08C822E4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 17
	.byte	VOL	, v098
	.byte	LFOS	, 48
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 16
	.byte	BEND	, c_v-55
	.byte		N30	, Gs1, v104
	.byte	W01
	.byte	VOL	, v096
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v091
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v089
	.byte	W01
	.byte		v087
	.byte	W01
	.byte	BEND	, c_v-10
	.byte	W03
	.byte		c_v+35
	.byte	W03
	.byte		c_v+58
	.byte	W03
	.byte		c_v+58
	.byte	W03
	.byte		c_v+53
	.byte	W03
	.byte		c_v+31
	.byte	W03
	.byte		c_v-19
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v-24
	.byte	W03
	.byte		c_v+4
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+63
	.byte	W03
	.byte		c_v+58
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v-37
	.byte	FINE

	.align 2
	.global song0217
song0217:	@ 0x08C82334
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0217_1		@ track
