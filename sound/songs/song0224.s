	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0224_1
song0224_1:	@ 0x08C82540
	.byte	VOL	, v100
	.byte	KEYSH	, 0
	.byte	TEMPO	, 63
	.byte	VOICE	, 24
	.byte	LFOS	, 60
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte	MOD	, 0
	.byte		N06	, Gn5, v127
	.byte	W06
	.byte		TIE	, Cn6
	.byte	W18
song0224_1_1:
	.byte	W72
	.byte	W48
	.byte	GOTO	
		.word	song0224_1_1
	.byte	W24
	.byte		EOT	, Cn6
	.byte	FINE

	.align 2
	.global song0224
song0224:	@ 0x08C82564
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0224_1		@ track
