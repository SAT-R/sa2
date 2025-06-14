	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song024_1
song024_1:	@ 0x0201CA58
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 100
	.byte	VOL	, v108
	.byte	LFOS	, 45
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 41
	.byte	BEND	, c_v-57
	.byte		N48	, Ds3, v127
	.byte	W01
	.byte	VOL	, v106
	.byte	BEND	, c_v-50
	.byte	W01
	.byte	VOL	, v103
	.byte	BEND	, c_v-42
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v-35
	.byte	W01
	.byte	VOL	, v098
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v098
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v093
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v086
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v+25
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v076
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v037
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
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	FINE

	.align 2
	.global song024
song024:	@ 0x0201CB04
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup002		@ voicegroup/tone

	.word	song024_1		@ track
