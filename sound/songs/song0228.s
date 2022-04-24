	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0228_1
song0228_1:	@ 0x08C82768
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x25
	.byte	0xBD
	.byte	0x1C
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x33
	.byte	0xC1
	.byte	0x0F
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xBE
	.byte	0x5C
	.byte	0xC4
	.byte	0x3C
	.byte	0xCF
	.byte	0x5E
	.byte	0x7F
	.byte	0x98
gUnknown_08C82780:
	.byte	0xA8
	.byte	0xB2
	.word	gUnknown_08C82780
	.byte	0x81
	.byte	0xCE
	.byte	0x5E
	.byte	0x81
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0228
song0228:	@ 0x08C8278C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0228_1		@ track
