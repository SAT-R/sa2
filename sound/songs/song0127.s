	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0127_1
song0127_1:	@ 0x08C8135C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 19
	.byte	VOL	, v120
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte	BEND	, c_v-28
	.byte		N02	, Cn3, v127
	.byte	W01
	.byte	VOL	, v119
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v117
	.byte	BEND	, c_v-26
	.byte	W01
	.byte	VOL	, v115
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v113
	.byte	BEND	, c_v-24
	.byte		N02	, Gs3
	.byte	W01
	.byte	VOL	, v111
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v109
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v107
	.byte	BEND	, c_v-21
	.byte		N02	, Gs2
	.byte	W01
	.byte	VOL	, v105
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v103
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v102
	.byte	BEND	, c_v-17
	.byte		N02	, Ds3
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v098
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v093
	.byte	BEND	, c_v-12
	.byte		N09	, Fs3
	.byte	W01
	.byte	VOL	, v091
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v089
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v087
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v069
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v-19
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-19
	.byte	W03
	.byte	VOL	, v044
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v022
	.byte	W06
	.byte		v011
	.byte	W06
	.byte		v000
	.byte	FINE

	.align 2
	.global song0127
song0127:	@ 0x08C81444
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0127_1		@ track
