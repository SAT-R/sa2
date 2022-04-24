	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0273_1
song0273_1:	@ 0x08C83D24
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 73
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 20
	.byte	BEND	, c_v-64
	.byte		TIE	, Dn4, v080
	.byte	W01
	.byte	BEND	, c_v-63
	.byte	W01
	.byte		c_v-62
	.byte	W01
	.byte		c_v-61
	.byte	W01
	.byte		c_v-60
	.byte	W01
	.byte		c_v-59
	.byte	W01
	.byte		c_v-58
	.byte	W01
	.byte		c_v-57
	.byte	W01
	.byte		c_v-55
	.byte	W01
	.byte		c_v-54
	.byte	W01
	.byte		c_v-53
	.byte	W01
	.byte		c_v-52
	.byte	W01
	.byte		c_v-51
	.byte	W01
	.byte		c_v-50
	.byte	W01
	.byte		c_v-49
	.byte	W01
	.byte		c_v-48
	.byte	W01
	.byte		c_v-46
	.byte	W01
	.byte		c_v-45
	.byte	W01
	.byte		c_v-44
	.byte	W01
	.byte		c_v-43
	.byte	W01
	.byte		c_v-42
	.byte	W01
	.byte		c_v-41
	.byte	W01
	.byte		c_v-40
	.byte	W01
	.byte		c_v-39
	.byte	W01
	.byte		c_v-37
	.byte	W01
	.byte		c_v-36
	.byte	W01
	.byte		c_v-35
	.byte	W01
	.byte		c_v-34
	.byte	W01
	.byte		c_v-33
	.byte	W01
	.byte		c_v-32
	.byte	W01
	.byte		c_v-31
	.byte	W01
	.byte		c_v-30
	.byte	W01
	.byte		c_v-28
	.byte	W01
	.byte		c_v-27
	.byte	W01
	.byte		c_v-26
	.byte	W01
	.byte		c_v-25
	.byte	W01
	.byte		c_v-24
	.byte	W01
	.byte		c_v-23
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-21
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-18
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v-16
	.byte	W01
	.byte		c_v-15
	.byte	W01
	.byte		c_v-14
	.byte	W01
	.byte		c_v-13
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-10
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-8
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-5
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v-3
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+15
	.byte	W01
song0273_1_1:
	.byte	W24
	.byte	W72
	.byte	GOTO	
		.word	song0273_1_1
	.byte	W24
	.byte		EOT	, Dn4
	.byte	FINE

	.align 2
	.global song0273
song0273:	@ 0x08C83DD0
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0273_1		@ track
