	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0252_1
song0252_1:	@ 0x08C832F4
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 52
	.byte	VOL	, v100
	.byte	BENDR	, 15
	.byte	PAN	, c_v
	.byte		N01	, As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			As2, v104
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2, v112
	.byte	W01
	.byte			Fn4, v108
	.byte	W01
	.byte			As2
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte	FINE

	.align 2
	.global song0252
song0252:	@ 0x08C83384
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0252_1		@ track
