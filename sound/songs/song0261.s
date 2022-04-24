	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0261_1
song0261_1:	@ 0x08C836EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 61
	.byte	VOL	, v100
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, Gs6, v104
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6, v112
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte			As6
	.byte	W02
	.byte			Gs6, v104
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6, v112
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte			As6
	.byte	W01
	.byte			Gs6, v104
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6, v112
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte			Gs6
	.byte	W01
	.byte			As6
	.byte	W01
	.byte			Gs6, v104
	.byte	W01
	.byte			As6, v108
	.byte	W01
	.byte	FINE

	.align 2
	.global song0261
song0261:	@ 0x08C83730
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0261_1		@ track
