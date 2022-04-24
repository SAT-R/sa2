	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0113_1
song0113_1:	@ 0x08C80F28
	.byte	KEYSH	, 0
	.byte	TEMPO	, 60
	.byte	VOICE	, 51
	.byte	VOL	, v075
	.byte	BENDR	, 26
	.byte	LFOS	, 127
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	BEND	, c_v+47
	.byte		N05	, Fn1, v127
	.byte	W01
	.byte	VOL	, v072
	.byte	BEND	, c_v+46
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v+44
	.byte	W01
	.byte	VOL	, v067
	.byte	BEND	, c_v+42
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v+41
	.byte		N15	, Ds2
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v+39
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v057
	.byte	BEND	, c_v+36
	.byte	W01
	.byte	VOL	, v055
	.byte	BEND	, c_v+34
	.byte	W01
	.byte	VOL	, v052
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v+30
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v+27
	.byte	W01
	.byte	VOL	, v042
	.byte	BEND	, c_v+25
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+24
	.byte	W01
	.byte	VOL	, v037
	.byte	BEND	, c_v+22
	.byte	W01
	.byte	VOL	, v035
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v033
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v030
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v027
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v025
	.byte	BEND	, c_v+13
	.byte	W01
	.byte	VOL	, v023
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v+8
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte		c_v+5
	.byte	W01
	.byte		c_v+3
	.byte	W01
	.byte		c_v+1
	.byte	W01
	.byte		c_v
	.byte	W01
	.byte		c_v-2
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v-5
	.byte	FINE

	.align 2
	.global song0113
song0113:	@ 0x08C80FC4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0113_1		@ track
