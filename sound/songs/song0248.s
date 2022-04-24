	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0248_1
song0248_1:	@ 0x08C8310C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 48
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte	BEND	, c_v+22
	.byte		N54	, Fn5, v127
	.byte	W01
	.byte	VOL	, v098
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v091
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v089
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v075
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+16
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+16
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+16
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v061
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v059
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v057
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v055
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v046
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v043
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v041
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v039
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v036
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v034
	.byte	BEND	, c_v+8
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v030
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v029
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v027
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v025
	.byte	BEND	, c_v+6
	.byte	W01
	.byte	VOL	, v023
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v022
	.byte	BEND	, c_v+5
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v016
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v011
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v+2
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v+1
	.byte	W01
	.byte	VOL	, v000
	.byte	FINE

	.align 2
	.global song0248
song0248:	@ 0x08C8322C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0248_1		@ track
