	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0296_1
song0296_1:	@ 0x08C84980
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 96
	.byte	BENDR	, 10
	.byte	MOD	, 109
	.byte	LFOS	, 7
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	VOL	, v000
	.byte		TIE	, Gs4, v127
	.byte	W01
	.byte	VOL	, v012
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v100
	.byte	W10
song0296_1_1:
	.byte	W72
	.byte	GOTO	
		.word	song0296_1_1
	.byte	W96
	.byte		EOT	, Gs4
	.byte	FINE

	.align 2
	.global song0296
song0296:	@ 0x08C849C0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0296_1		@ track
