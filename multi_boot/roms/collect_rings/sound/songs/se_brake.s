	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global se_brake_1
se_brake_1:	@ 0x0201C708
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 12
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
	.global se_brake
se_brake:	@ 0x0201C758
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	se_brake_1		@ track
