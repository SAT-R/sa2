	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0104_1
song0104_1:	@ 0x08C80CF0
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 64
	.byte	VOL	, v120
	.byte	LFOS	, 15
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N03	, Gn4, v096
	.byte	W03
	.byte			Cn5, v092
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte		N12	, En5
	.byte	W12
	.byte	FINE

	.align 2
	.global song0104
song0104:	@ 0x08C80D14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0104_1		@ track
