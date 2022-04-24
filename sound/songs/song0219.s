	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0219_1
song0219_1:	@ 0x08C82384
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 19
	.byte	VOL	, v100
	.byte	LFOS	, 51
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 127
	.byte		N02	, Gn3, v127
	.byte	W03
	.byte		N24	, En3
	.byte	W03
	.byte	VOL	, v075
	.byte	W06
	.byte		v050
	.byte	W06
	.byte		v025
	.byte	W06
	.byte		v000
	.byte	W05
	.byte	FINE

	.align 2
	.global song0219
song0219:	@ 0x08C823A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0219_1		@ track
