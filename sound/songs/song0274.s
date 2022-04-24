	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0274_1
song0274_1:	@ 0x08C83DDC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 103
	.byte	VOL	, v070
	.byte	BENDR	, 12
	.byte	LFOS	, 103
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 100
	.byte		N60	, Cs7, v127
	.byte	W60
	.byte	W02
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0274_2
song0274_2:	@ 0x08C83DF4
	.byte	KEYSH	, 0
	.byte	VOICE	, 102
	.byte	VOL	, v100
	.byte	BENDR	, 12
	.byte	LFOS	, 103
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N60	, Fs3, v127
	.byte	W60
	.byte	W02
	.byte	FINE

	.align 2
	.global song0274
song0274:	@ 0x08C83E0C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0274_1		@ track
	.word	song0274_2		@ track
