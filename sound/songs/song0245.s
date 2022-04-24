	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0245_1
song0245_1:	@ 0x08C83084
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x27
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x3C
	.byte	0xC1
	.byte	0x0F
	.byte	0xC4
	.byte	0x09
	.byte	0xBF
	.byte	0x40
	.byte	0xC5
	.byte	0x00
	.byte	0xD1
	.byte	0x3A
	.byte	0x7F
	.byte	0x82
	.byte	0xD0
	.byte	0x45
	.byte	0x82
	.byte	0xD8
	.byte	0x3F
	.byte	0x89
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0245
song0245:	@ 0x08C830A4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0245_1		@ track
