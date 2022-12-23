	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0035_1
song0035_1:	@ 0x0201F81C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte		N03	, As3, v088
	.byte	W03
	.byte			Dn4, v112
	.byte	W03
	.byte			Fn4, v108
	.byte	W03
	.byte			Dn4, v112
	.byte	W03
	.byte			Fn4, v108
	.byte	W03
	.byte			As4, v104
	.byte	W03
	.byte			Fn4, v108
	.byte	W03
	.byte			As4, v104
	.byte	W03
	.byte			Dn5, v108
	.byte	W03
	.byte			As4, v096
	.byte	W03
	.byte			Dn5, v112
	.byte	W03
	.byte			Fn5, v108
	.byte	W03
	.byte		N24	, As5, v112
	.byte	W24
	.byte	W03
	.byte	FINE

	.align 2
	.global song0035
song0035:	@ 0x0201F854
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0035_1		@ track
