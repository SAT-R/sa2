	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0235_1
song0235_1:	@ 0x08C82B28
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 35
	.byte	MOD	, 49
	.byte	VOL	, v100
	.byte	BENDR	, 26
	.byte	LFOS	, 127
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	BEND	, c_v+63
	.byte		N05	, Gs2, v127
	.byte	W01
	.byte	VOL	, v098
	.byte	BEND	, c_v+62
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v095
	.byte	BEND	, c_v+58
	.byte	W01
	.byte	VOL	, v093
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v+55
	.byte	W01
	.byte	VOL	, v090
	.byte	BEND	, c_v+53
	.byte		N05	, En2
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v+52
	.byte	W01
	.byte	VOL	, v086
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v+48
	.byte	W01
	.byte	VOL	, v083
	.byte	BEND	, c_v+46
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v+45
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v+43
	.byte		N30	, Gs2
	.byte	W01
	.byte	VOL	, v078
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v+38
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+36
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v+34
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+33
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v063
	.byte	BEND	, c_v+26
	.byte	W01
	.byte	VOL	, v061
	.byte	BEND	, c_v+24
	.byte	W01
	.byte	VOL	, v059
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v053
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v+19
	.byte	W01
	.byte	VOL	, v042
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v039
	.byte	BEND	, c_v+16
	.byte	W01
	.byte	VOL	, v035
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v028
	.byte	BEND	, c_v+11
	.byte	W01
	.byte	VOL	, v025
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
	.byte	W06
	.byte	FINE

	.align 2
	.global song0235
song0235:	@ 0x08C82BF0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0235_1		@ track
