	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0103_1
song0103_1:	@ 0x08C80CA4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 119
	.byte	VOL	, v120
	.byte	LFOS	, 60
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte	MOD	, 127
	.byte		N08	, Ds6, v127
	.byte	W01
	.byte	VOL	, v115
	.byte	W01
	.byte		v110
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v037
	.byte	W01
	.byte		v033
	.byte	W03
	.byte		v018
	.byte	W03
	.byte		v003
	.byte	FINE

	.align 2
	.global song0103
song0103:	@ 0x08C80CE4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0103_1		@ track
