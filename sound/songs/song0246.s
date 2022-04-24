	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0246_1
song0246_1:	@ 0x08C830B0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 46
	.byte	VOL	, v100
	.byte	LFOS	, 90
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 49
	.byte		N04	, An3, v127
	.byte	W04
song0246_1_1:
	.byte		N92	, Dn3, v120
	.byte	W09
	.byte	VOL	, v096
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v054
	.byte	W01
	.byte	GOTO	
		.word	song0246_1_1
	.byte	VOL	, v050
	.byte	W01
	.byte		v046
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v004
	.byte	W60
	.byte	W01
	.byte	W02
	.byte	FINE

	.align 2
	.global song0246
song0246:	@ 0x08C83100
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0246_1		@ track
