	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0257_1
song0257_1:	@ 0x08C83500
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 57
	.byte	VOL	, v018
	.byte	LFOS	, 84
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 38
	.byte		N48	, An2, v127
	.byte	W01
	.byte	VOL	, v058
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v003
	.byte	W12
	.byte	FINE

	.align 2
	.global song0257
song0257:	@ 0x08C83560
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0257_1		@ track
