	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0259_1
song0259_1:	@ 0x08C83650
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 59
	.byte	MOD	, 30
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	MOD	, 21
	.byte	BENDR	, 19
	.byte	LFOS	, 60
	.byte	MODT	, 0
	.byte		TIE	, Gs2, v080
	.byte	W24
song0259_1_1:
	.byte	W72
	.byte	W96
	.byte	GOTO	
		.word	song0259_1_1
	.byte	W13
	.byte		EOT	, Gs2
	.byte	FINE

	.align 2
	.global song0259
song0259:	@ 0x08C83674
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0259_1		@ track
