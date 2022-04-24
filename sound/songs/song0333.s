	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0333_1
song0333_1:	@ 0x08C84F00
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 105
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	MOD	, 45
	.byte	BENDR	, 15
	.byte	LFOS	, 60
	.byte	MODT	, 0
	.byte		TIE	, As2, v084
	.byte	W03
	.byte	BEND	, c_v-6
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v+35
	.byte	W03
	.byte		c_v+8
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v+8
	.byte	W03
	.byte		c_v+40
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v+17
	.byte	W03
	.byte		c_v+14
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v+11
	.byte	W03
	.byte		c_v+7
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v+4
	.byte	W03
	.byte		c_v+1
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v-3
	.byte	W03
	.byte		c_v-6
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v-10
	.byte	W03
	.byte		c_v-13
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v-16
	.byte	W03
	.byte		c_v-20
	.byte	W03
	.byte	VOL	, v120
	.byte	BEND	, c_v-23
	.byte	W03
	.byte		c_v-26
	.byte	W03
	.byte	VOL	, v109
	.byte	BEND	, c_v-30
	.byte	W03
	.byte		c_v-33
	.byte	W03
	.byte	VOL	, v098
	.byte	BEND	, c_v-37
	.byte	W03
	.byte		c_v-40
	.byte	W03
	.byte	VOL	, v087
	.byte	BEND	, c_v-43
	.byte	W03
	.byte		c_v-47
	.byte	W03
	.byte	VOL	, v076
	.byte	BEND	, c_v-50
	.byte	W03
	.byte		c_v-53
	.byte	W03
	.byte	VOL	, v066
	.byte	BEND	, c_v-57
	.byte	W03
	.byte		c_v-60
	.byte	W03
	.byte	VOL	, v054
	.byte	BEND	, c_v-64
	.byte	W06
	.byte	VOL	, v044
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v022
	.byte	W06
	.byte		v011
	.byte	W06
	.byte		v000
	.byte	W24
	.byte	W01
	.byte		EOT	
	.byte	FINE

	.align 2
	.global song0333
song0333:	@ 0x08C84F90
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0333_1		@ track
