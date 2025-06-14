	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song021_1
song021_1:	@ 0x0201C91C
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 60
	.byte	VOL	, v090
	.byte	PAN	, c_v
	.byte	BENDR	, 5
	.byte		N06	, Fn3, v104
	.byte	W06
	.byte	BEND	, c_v-64
	.byte		N42	, Gs4, v108
	.byte	W01
	.byte	BEND	, c_v-61
	.byte	W01
	.byte		c_v-58
	.byte	W01
	.byte		c_v-55
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-49
	.byte	W01
	.byte		c_v-45
	.byte	W01
	.byte		c_v-42
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-33
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-23
	.byte	W01
	.byte		c_v-20
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v-11
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v+28
	.byte	W02
	.byte		c_v+34
	.byte	W01
	.byte		c_v+37
	.byte	W01
	.byte		c_v+40
	.byte	W01
	.byte		c_v+43
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+50
	.byte	W01
	.byte		c_v+53
	.byte	W01
	.byte		c_v+56
	.byte	W01
	.byte		c_v+59
	.byte	W01
	.byte		c_v+63
	.byte	W02
	.byte	FINE

	.align 2
	.global song021
song021:	@ 0x0201C984
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song021_1		@ track
