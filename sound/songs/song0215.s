	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0215_1
song0215_1:	@ 0x08C821A8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 15
	.byte	VOL	, v098
	.byte	LFOS	, 48
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 20
	.byte	BEND	, c_v+63
	.byte		N48	, Ds2, v104
	.byte	W01
	.byte	VOL	, v096
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v069
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
	.byte	FINE

	.align 2
	.global song0215
song0215:	@ 0x08C82230
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0215_1		@ track
