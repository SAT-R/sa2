	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0262_1
song0262_1:	@ 0x08C8373C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 62
	.byte	VOL	, v100
	.byte	LFOS	, 90
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 49
	.byte		N04	, An3, v127
	.byte	W04
	.byte		N32	, Dn3, v120
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
	.byte		v050
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
	.byte	W03
	.byte	FINE

	.align 2
	.global song0262
song0262:	@ 0x08C83784
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0262_1		@ track
