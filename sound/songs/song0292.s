	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0292_1
song0292_1:	@ 0x08C84738
	.byte	KEYSH	, 0
	.byte	TEMPO	, 66
	.byte	VOICE	, 92
	.byte	MOD	, 43
	.byte	VOL	, v090
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v+16
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte	BEND	, c_v+15
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v+14
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte	BEND	, c_v+13
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v+12
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v+10
	.byte		N01	, Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte	BEND	, c_v+9
	.byte		N01	, Gs6
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v+8
	.byte		N01	, Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte	BEND	, c_v+7
	.byte		N01	, Gs6
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v+6
	.byte		N01	, Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte	BEND	, c_v+5
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v+3
	.byte		N01	, Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte	BEND	, c_v+2
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v+1
	.byte		N01	, Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte			Cn7, v104
	.byte	W01
	.byte	BEND	, c_v
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte	BEND	, c_v-1
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v-2
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte	BEND	, c_v-4
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v-5
	.byte		N01	, Gs6, v108
	.byte	W01
	.byte			Cn7
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte	BEND	, c_v-6
	.byte		N01	, Cn7, v104
	.byte	W01
	.byte			Gs6, v108
	.byte	W01
	.byte			Cn7, v112
	.byte	W01
	.byte	BEND	, c_v-7
	.byte		N01	, Gs6, v108
	.byte	W03
	.byte	BEND	, c_v-8
	.byte	FINE

	.align 2
	.global song0292
song0292:	@ 0x08C8483C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0292_1		@ track
