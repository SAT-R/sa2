	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0012_1
song0012_1:	@ 0x0201F160
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 6
	.byte	BEND	, c_v+37
	.byte		N01	, Dn3, v036
	.byte	W01
	.byte	BEND	, c_v+11
	.byte		N01	, En3, v048
	.byte	W01
	.byte	BEND	, c_v-16
	.byte	W01
	.byte		c_v-64
	.byte		N01	, Fs3, v060
	.byte	W01
	.byte	BEND	, c_v-55
	.byte		N01	, An3, v072
	.byte	W01
	.byte	BEND	, c_v-36
	.byte	W01
	.byte		c_v-26
	.byte		N01	, Dn4, v084
	.byte	W01
	.byte	BEND	, c_v-16
	.byte		N01	, An3, v092
	.byte	W01
	.byte	BEND	, c_v+3
	.byte	W01
	.byte		c_v+12
	.byte		N01	, Dn4, v104
	.byte	W01
	.byte	BEND	, c_v+22
	.byte		N01	, Fs4, v116
	.byte	W01
	.byte	BEND	, c_v+41
	.byte	W01
	.byte		c_v+51
	.byte		N01	, An4, v127
	.byte	W01
	.byte	BEND	, c_v+63
	.byte		N24	, Dn5
	.byte	W24
	.byte	W03
	.byte	FINE

	.align 2
	.global song0012
song0012:	@ 0x0201F1B4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0012_1		@ track
