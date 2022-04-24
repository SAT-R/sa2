	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0234_1
song0234_1:	@ 0x08C82A84
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 34
	.byte	VOL	, v100
	.byte	BENDR	, 18
	.byte	LFOS	, 30
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 60
	.byte	BEND	, c_v+63
	.byte		N30	, Fn4, v127
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v087
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v083
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v+63
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v+56
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+49
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+42
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+35
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v049
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v041
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v024
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v-28
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v-35
	.byte	W01
	.byte	VOL	, v006
	.byte	BEND	, c_v-42
	.byte	W01
	.byte	VOL	, v000
	.byte	BEND	, c_v-49
	.byte	W01
	.byte		c_v-56
	.byte	W01
	.byte		c_v-64
	.byte	W05
	.byte	FINE

	.align 2
	.global song0234
song0234:	@ 0x08C82B1C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0234_1		@ track
