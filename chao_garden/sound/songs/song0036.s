	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0036_1
song0036_1:	@ 0x0201F860
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 0
	.byte	VOL	, v078
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	VOL	, v105
	.byte	BEND	, c_v
	.byte		N24	, En4, v112
	.byte	W01
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	MOD	, 5
	.byte	W01
	.byte	BEND	, c_v-5
	.byte	W01
	.byte		c_v-8
	.byte	W02
	.byte		c_v-12
	.byte	W20
	.byte	FINE

	.align 2
	.global song0036
song0036:	@ 0x0201F888
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0036_1		@ track
