	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global se_life_lost_1
se_life_lost_1:	@ 0x0201C7EC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 52
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 15
	.byte		N06	, Cs1, v127
	.byte	W07
	.byte		N32	, Cn1, v112
	.byte	W32
	.byte	FINE

	.align 2
	.global se_life_lost
se_life_lost:	@ 0x0201C804
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	se_life_lost_1		@ track
