	.include "sound/MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song011_1
song011_1:	@ 0x0201C5C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 75
	.byte	VOICE	, 70
	.byte	VOL	, v100
	.byte	PAN	, c_v
	.byte	BENDR	, 16
	.byte	BEND	, c_v-37
	.byte		N96	, Ds4, v112
	.byte	W01
	.byte	BEND	, c_v-40
	.byte	W02
	.byte		c_v-43
	.byte	W01
	.byte		c_v-46
	.byte	W02
	.byte		c_v-50
	.byte	W01
	.byte		c_v-53
	.byte	W02
	.byte		c_v-56
	.byte	W01
	.byte		c_v-60
	.byte	W02
	.byte		c_v-64
	.byte	W03
	.byte		c_v-62
	.byte	W03
	.byte		c_v-60
	.byte	W03
	.byte		c_v-58
	.byte	W03
	.byte		c_v-56
	.byte	W03
	.byte		c_v-53
	.byte	W03
	.byte		c_v-51
	.byte	W03
	.byte		c_v-49
	.byte	W03
	.byte		c_v-47
	.byte	W03
	.byte		c_v-45
	.byte	W03
	.byte		c_v-42
	.byte	W03
	.byte		c_v-40
	.byte	W03
	.byte		c_v-38
	.byte	W03
	.byte		c_v-36
	.byte	W03
	.byte		c_v-34
	.byte	W03
	.byte		c_v-31
	.byte	W03
	.byte		c_v-29
	.byte	W03
	.byte		c_v-27
	.byte	W03
	.byte		c_v-25
	.byte	W03
	.byte		c_v-23
	.byte	W03
	.byte		c_v-20
	.byte	W03
	.byte		c_v-18
	.byte	W03
	.byte		c_v-16
	.byte	W03
	.byte		c_v-14
	.byte	W03
	.byte		c_v-12
	.byte	W03
	.byte		c_v-9
	.byte	W03
	.byte		c_v-7
	.byte	W03
	.byte		c_v-5
	.byte	W03
	.byte		c_v-3
	.byte	W03
	.byte		c_v-1
	.byte	W03
	.byte		c_v+2
	.byte	W03
	.byte		c_v+4
	.byte	W01
	.byte		c_v+14
	.byte	W01
	.byte		c_v+23
	.byte	W01
	.byte		c_v+27
	.byte	FINE

	.align 2
	.global song011
song011:	@ 0x0201C630
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song011_1		@ track
