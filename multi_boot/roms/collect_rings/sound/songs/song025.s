	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song025_1
song025_1:	@ 0x0201CB10
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 76
	.byte	VOL	, v100
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte	BEND	, c_v+63
	.byte		N02	, Gn2, v127
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v100
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v+50
	.byte		N44	
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v084
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v+30
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v+27
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v+23
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+7
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v-3
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v019
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v018
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v-17
	.byte	W01
	.byte	VOL	, v015
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v-30
	.byte	W01
	.byte	VOL	, v011
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v010
	.byte	BEND	, c_v-37
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v-40
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v-43
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v-47
	.byte	W01
	.byte	VOL	, v006
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
	.global song025
song025:	@ 0x0201CBE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup002		@ voicegroup/tone

	.word	song025_1		@ track
