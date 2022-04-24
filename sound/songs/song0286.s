	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0286_1
song0286_1:	@ 0x08C84484
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 86
	.byte	BENDR	, 11
	.byte	LFOS	, 73
	.byte	MODT	, 0
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	MOD	, 29
	.byte	BEND	, c_v-55
	.byte		TIE	, En3, v127
	.byte	W01
	.byte	BEND	, c_v-46
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+33
	.byte	W01
	.byte		c_v+43
	.byte	W01
	.byte		c_v+53
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte		c_v+63
	.byte	W32
	.byte	W02
song0286_1_1:
	.byte	W48
	.byte	W96
	.byte	GOTO	
		.word	song0286_1_1
	.byte	W22
	.byte		EOT	, En3
	.byte	FINE

	.align 2
	.global song0286
song0286:	@ 0x08C844C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0286_1		@ track
