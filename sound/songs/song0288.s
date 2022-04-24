	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0288_1
song0288_1:	@ 0x08C84578
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 88
	.byte	BENDR	, 11
	.byte	LFOS	, 73
	.byte	MODT	, 0
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	MOD	, 15
	.byte	BEND	, c_v-59
	.byte		TIE	, Dn2, v127
	.byte	W02
	.byte	BEND	, c_v-52
	.byte	W01
	.byte		c_v-48
	.byte	W01
	.byte		c_v-44
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-24
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v+28
	.byte	W01
	.byte		c_v+32
	.byte	W01
	.byte		c_v+36
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v+44
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+49
	.byte	W01
	.byte		c_v+49
	.byte	W19
song0288_1_1:
	.byte	W48
	.byte	W96
	.byte	GOTO	
		.word	song0288_1_1
	.byte	W22
	.byte		EOT	, Dn2
	.byte	FINE

	.align 2
	.global song0288
song0288:	@ 0x08C845D4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0288_1		@ track
