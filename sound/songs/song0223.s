	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0223_1
song0223_1:	@ 0x08C824B8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 23
	.byte	VOL	, v100
	.byte	LFOS	, 60
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N28	, Bn2, v127
	.byte	W01
	.byte	VOL	, v096
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v044
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	FINE

	.align 2
	.global song0223
song0223:	@ 0x08C82534
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0223_1		@ track
