	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0115_1
song0115_1:	@ 0x08C8100C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 2
	.byte	VOL	, v075
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, Gs4, v104
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4, v112
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4
	.byte	W01
	.byte			As4
	.byte	W02
	.byte			Gs4, v104
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4, v112
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Gs4, v104
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4, v112
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Gs4, v104
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4, v112
	.byte	W01
	.byte			As4, v108
	.byte	W01
	.byte			Gs4
	.byte	W01
	.byte			As4
	.byte	W01
	.byte	FINE

	.align 2
	.global song0115
song0115:	@ 0x08C8105C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	15		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0115_1		@ track
