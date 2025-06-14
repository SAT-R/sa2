	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song012_1
song012_1:	@ 0x0201C63C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 51
	.byte	VOL	, v075
	.byte	BENDR	, 26
	.byte	LFOS	, 127
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	BEND	, c_v+63
	.byte		N48	, Gs1, v127
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+62
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+58
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v069
	.byte	BEND	, c_v+55
	.byte	W01
	.byte	VOL	, v067
	.byte	BEND	, c_v+53
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+52
	.byte	W01
	.byte	VOL	, v064
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v063
	.byte	BEND	, c_v+48
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+46
	.byte	W01
	.byte	VOL	, v061
	.byte	BEND	, c_v+45
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v059
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v057
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v+38
	.byte	W01
	.byte	VOL	, v054
	.byte	BEND	, c_v+36
	.byte	W01
	.byte	VOL	, v053
	.byte	BEND	, c_v+34
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v049
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v+26
	.byte	W01
	.byte	VOL	, v046
	.byte	BEND	, c_v+24
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v038
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v031
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v029
	.byte	BEND	, c_v+16
	.byte	W01
	.byte	VOL	, v026
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v024
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v005
	.byte	W12
	.byte	FINE

	.align 2
	.global song012
song012:	@ 0x0201C6FC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song012_1		@ track
