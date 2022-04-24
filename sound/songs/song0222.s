	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0222_1
song0222_1:	@ 0x08C8247C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 22
	.byte	VOL	, v100
	.byte	MOD	, 6
	.byte	BENDR	, 12
	.byte	LFOS	, 103
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	BEND	, c_v-60
	.byte		TIE	, An3, v127
	.byte	W01
	.byte	BEND	, c_v-50
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-30
	.byte	W03
	.byte		c_v+1
	.byte	W03
	.byte		c_v+32
	.byte	W15
song0222_1_1:
	.byte	W72
	.byte	W24
	.byte	GOTO	
		.word	song0222_1_1
	.byte	W64
	.byte	W01
	.byte		EOT	, An3
	.byte	W01
	.byte	FINE

	.align 2
	.global song0222
song0222:	@ 0x08C824AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0222_1		@ track
