	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0125_1
song0125_1:	@ 0x08C8119C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 50
	.byte	VOL	, v100
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte	BEND	, c_v-28
	.byte		N01	, As3, v127
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-26
	.byte		N03	, Fn3
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v-3
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v015
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v011
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v010
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v006
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v004
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v003
	.byte	BEND	, c_v+12
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+15
	.byte	FINE

	.align 2
	.global song0125
song0125:	@ 0x08C81270
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0125_1		@ track
