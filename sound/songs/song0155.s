	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0155_1
song0155_1:	@ 0x08C81A64
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 50
	.byte	VOL	, v090
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BEND	, c_v+63
	.byte		N02	, An3, v127
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v082
	.byte	BEND	, c_v+50
	.byte		N44	
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v075
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v061
	.byte	BEND	, c_v+30
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v+27
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v+23
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v043
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v036
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v029
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v-3
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v016
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v015
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v013
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v011
	.byte	BEND	, c_v-30
	.byte	W01
	.byte	VOL	, v010
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v-37
	.byte	W01
	.byte	VOL	, v008
	.byte	BEND	, c_v-40
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v-43
	.byte	W01
	.byte	VOL	, v006
	.byte	BEND	, c_v-47
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v-50
	.byte	W01
	.byte	VOL	, v004
	.byte	BEND	, c_v-53
	.byte	W01
	.byte	VOL	, v003
	.byte	BEND	, c_v-57
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-64
	.byte	W01
	.byte		c_v-57
	.byte	W09
	.byte	FINE

	.align 2
	.global song0155
song0155:	@ 0x08C81B38
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0155_1		@ track
