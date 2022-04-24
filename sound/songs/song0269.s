	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0269_1
song0269_1:	@ 0x08C83AC4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 69
	.byte	VOL	, v100
	.byte	LFOS	, 30
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 60
	.byte	BEND	, c_v-64
	.byte		N02	, Gn2, v127
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-59
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-54
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-49
	.byte		N02	, Gs3
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-43
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-38
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v-27
	.byte		N11	, En4
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+25
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v+36
	.byte		N36	, Cn4
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v+52
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W21
	.byte	FINE

	.align 2
	.global song0269
song0269:	@ 0x08C83B6C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0269_1		@ track
