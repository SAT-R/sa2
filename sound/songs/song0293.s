	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0293_1
song0293_1:	@ 0x08C84848
	.byte	KEYSH	, 0
song0293_1_1:
	.byte	TEMPO	, 72
	.byte	VOICE	, 93
	.byte	BENDR	, 11
	.byte	LFOS	, 73
	.byte	MODT	, 0
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	MOD	, 15
	.byte	BEND	, c_v-12
	.byte		N32	, Cn1, v127
	.byte	W02
	.byte	BEND	, c_v+6
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte		c_v+38
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v+39
	.byte	W01
	.byte		c_v+37
	.byte	W01
	.byte		c_v+35
	.byte	W01
	.byte		c_v+33
	.byte	W01
	.byte		c_v+31
	.byte	W01
	.byte		c_v+29
	.byte	W01
	.byte		c_v+27
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v-3
	.byte	W01
	.byte		c_v-5
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-18
	.byte		N32	, Gs1
	.byte	W01
	.byte	BEND	, c_v-20
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-24
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-38
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-42
	.byte	W24
	.byte	GOTO	
		.word	song0293_1_1
	.byte	FINE

	.align 2
	.global song0293
song0293:	@ 0x08C848C8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0293_1		@ track
