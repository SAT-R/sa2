	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0226_1
song0226_1:	@ 0x08C82674
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 26
	.byte	VOL	, v100
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 36
	.byte	BEND	, c_v+26
	.byte		N23	, Fs2, v127
	.byte	W01
	.byte	BEND	, c_v+26
	.byte	W01
	.byte		c_v+25
	.byte	W01
	.byte		c_v+24
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+22
	.byte	W01
	.byte		c_v+21
	.byte	W01
	.byte		c_v+20
	.byte	W01
	.byte		c_v+19
	.byte	W01
	.byte		c_v+18
	.byte	W01
	.byte		c_v+17
	.byte	W01
	.byte		c_v+16
	.byte	W01
	.byte		c_v+15
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+13
	.byte	W01
	.byte		c_v+12
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+11
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+9
	.byte	W01
	.byte		c_v+8
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+4
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+2
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-1
	.byte	W01
	.byte		c_v-2
	.byte	W01
	.byte		c_v-3
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v-5
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-7
	.byte	W01
	.byte		c_v-8
	.byte	W01
	.byte		c_v-9
	.byte	W01
	.byte		c_v-10
	.byte	FINE

	.align 2
	.global song0226
song0226:	@ 0x08C826DC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0226_1		@ track
