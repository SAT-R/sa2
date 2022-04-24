	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0256_1
song0256_1:	@ 0x08C834AC
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 56
	.byte	VOL	, v092
	.byte	MOD	, 78
	.byte	PAN	, c_v
	.byte	BENDR	, 16
	.byte	BEND	, c_v-64
	.byte		N17	, Dn3, v127
	.byte	W01
	.byte	BEND	, c_v-59
	.byte	W01
	.byte		c_v-54
	.byte	W01
	.byte		c_v-49
	.byte	W01
	.byte		c_v-43
	.byte	W01
	.byte		c_v-38
	.byte	W01
	.byte		c_v-33
	.byte	W01
	.byte		c_v-27
	.byte	W01
	.byte		c_v-22
	.byte	W01
	.byte		c_v-17
	.byte	W01
	.byte		c_v-12
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+31
	.byte		N09	, Ds2
	.byte	W01
	.byte	BEND	, c_v+36
	.byte	W01
	.byte		c_v+41
	.byte	W01
	.byte		c_v+47
	.byte	W01
	.byte		c_v+52
	.byte	W01
	.byte		c_v+57
	.byte	W04
	.byte	FINE

	.align 2
	.global song0256
song0256:	@ 0x08C834F4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0256_1		@ track
