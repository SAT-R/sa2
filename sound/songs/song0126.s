	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0126_1
song0126_1:	@ 0x08C8127C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 19
	.byte	VOL	, v110
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte	BEND	, c_v-28
	.byte		N01	, Gs3, v127
	.byte	W01
	.byte	VOL	, v110
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v110
	.byte	BEND	, c_v-26
	.byte		N06	, Ds3
	.byte	W01
	.byte	VOL	, v110
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v101
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v097
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v075
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v053
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v049
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v036
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v023
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v022
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v-3
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v016
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v015
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v013
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v011
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v010
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v008
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v006
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v004
	.byte	BEND	, c_v+12
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+15
	.byte	FINE

	.align 2
	.global song0126
song0126:	@ 0x08C81350
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0126_1		@ track
