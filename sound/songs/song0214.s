	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0214_1
song0214_1:	@ 0x08C82108
	.byte	KEYSH	, 0
	.byte	TEMPO	, 54
	.byte	VOICE	, 14
	.byte	VOL	, v098
	.byte	LFOS	, 45
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte		N03	, An5, v127
	.byte	W01
	.byte	VOL	, v096
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v080
	.byte		N03	
	.byte	W01
	.byte	VOL	, v078
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
	.byte		N03	
	.byte	W01
	.byte	VOL	, v060
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
	.byte		N03	
	.byte	W01
	.byte	VOL	, v043
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
	.byte		N03	
	.byte	W01
	.byte	VOL	, v029
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
	.byte		N03	
	.byte	W01
	.byte	VOL	, v020
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
	.byte		N03	
	.byte	W01
	.byte	VOL	, v011
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
	.byte		N03	
	.byte	W03
	.byte	FINE

	.align 2
	.global song0214
song0214:	@ 0x08C8219C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0214_1		@ track
