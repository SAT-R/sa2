	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0264_1
song0264_1:	@ 0x08C83834
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 64
	.byte	VOL	, v098
	.byte	LFOS	, 25
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 48
	.byte	BEND	, c_v-64
	.byte		N02	, En2, v127
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v-56
	.byte	W01
	.byte	VOL	, v093
	.byte	BEND	, c_v-48
	.byte	W01
	.byte	VOL	, v091
	.byte	BEND	, c_v-39
	.byte		N03	, En3
	.byte	W01
	.byte	VOL	, v089
	.byte	BEND	, c_v-31
	.byte	W01
	.byte	VOL	, v089
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v-14
	.byte		N48	, Bn2
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v069
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte	FINE

	.align 2
	.global song0264
song0264:	@ 0x08C838E4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0264_1		@ track
