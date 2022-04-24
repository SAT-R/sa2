	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0151_1
song0151_1:	@ 0x08C81954
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x34
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x34
	.byte	0xC1
	.byte	0x02
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x0A
	.byte	0xD2
	.byte	0x25
	.byte	0x60
	.byte	0x84
	.byte	0xEF
	.byte	0x26
	.byte	0x7F
	.byte	0xA0
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0151
song0151:	@ 0x08C81970
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0151_1		@ track
