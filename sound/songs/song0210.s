	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0210_1
song0210_1:	@ 0x08C82020
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x25
	.byte	0xBD
	.byte	0x0A
	.byte	0xBE
	.byte	0x7F
	.byte	0xFB
	.byte	0x3C
	.byte	0x7F
	.byte	0xAC
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0210
song0210:	@ 0x08C82030
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0210_1		@ track
