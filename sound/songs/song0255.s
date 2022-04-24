	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0255_1
song0255_1:	@ 0x08C83484
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 55
	.byte	VOL	, v090
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, Gs4, v108
	.byte	W02
	.byte		N01	
	.byte	W02
	.byte		N01	
	.byte	W08
	.byte		N01	
	.byte	W02
	.byte		N01	
	.byte	W02
	.byte		N01	
	.byte	W01
	.byte	FINE

	.align 2
	.global song0255
song0255:	@ 0x08C834A0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0255_1		@ track
