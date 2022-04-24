	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0254_1
song0254_1:	@ 0x08C8341C
	.byte	KEYSH	, 0
song0254_1_1:
	.byte	TEMPO	, 75
	.byte	VOICE	, 54
	.byte	VOL	, v100
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, An5, v104
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5, v112
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			En5
	.byte	W02
	.byte			Dn5, v104
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5, v112
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Dn5, v104
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5, v112
	.byte	W01
	.byte			En5, v108
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Dn5, v104
	.byte	W01
	.byte			En5, v108
	.byte	W03
	.byte			Dn6
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
	.byte	W08
	.byte		N01	
	.byte	W02
	.byte		N01	
	.byte	W02
	.byte		N01	
	.byte	W03
	.byte	GOTO	
		.word	song0254_1_1
	.byte	FINE

	.align 2
	.global song0254
song0254:	@ 0x08C83478
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0254_1		@ track
