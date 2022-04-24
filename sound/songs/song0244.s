	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0244_1
song0244_1:	@ 0x08C83008
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 46
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	LFOS	, 103
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 87
	.byte	BEND	, c_v-33
	.byte		TIE	, Fn3, v127
	.byte	W01
	.byte	BEND	, c_v-32
	.byte	W01
	.byte		c_v-31
	.byte	W04
	.byte		c_v+44
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-42
	.byte	W03
song0244_1_1:
	.byte	BEND	, c_v+44
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+26
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+17
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v-28
	.byte	W03
	.byte		c_v-33
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-31
	.byte	W04
	.byte		c_v+44
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v+44
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+49
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+26
	.byte	W03
	.byte		c_v-37
	.byte	W03
	.byte		c_v+17
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte		c_v+22
	.byte	W03
	.byte		c_v-28
	.byte	W15
	.byte	GOTO	
		.word	song0244_1_1
	.byte	W64
	.byte	W01
	.byte		EOT	, Fn3
	.byte	W01
	.byte	FINE

	.align 2
	.global song0244
song0244:	@ 0x08C83078
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0244_1		@ track
