	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0280_1
song0280_1:	@ 0x08C84170
	.byte	KEYSH	, 0
	.byte	TEMPO	, 63
	.byte	VOICE	, 80
	.byte	VOL	, v100
	.byte	BENDR	, 18
	.byte	LFOS	, 30
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BEND	, c_v+63
	.byte		TIE	, Fn4, v127
	.byte	W01
	.byte	VOL	, v099
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v097
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v-64
	.byte	W01
	.byte	VOL	, v094
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-28
	.byte	W01
	.byte	VOL	, v091
	.byte	BEND	, c_v-26
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v086
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v-9
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v-6
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v-1
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v+1
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v075
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+16
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+21
	.byte	W04
	.byte	VOL	, v062
	.byte	W06
	.byte		v055
	.byte	W06
	.byte		v048
	.byte	W06
song0280_1_1:
	.byte	VOL	, v040
	.byte	W06
	.byte		v033
	.byte	W06
	.byte		v025
	.byte	W06
	.byte		v018
	.byte	W30
	.byte	W48
	.byte	GOTO	
		.word	song0280_1_1
	.byte	W07
	.byte		EOT	, Fn4
	.byte	FINE

	.align 2
	.global song0280
song0280:	@ 0x08C84220
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0280_1		@ track
