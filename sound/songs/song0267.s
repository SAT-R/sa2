	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0267_1
song0267_1:	@ 0x08C83A18
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x43
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x54
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x4D
	.byte	0xE1
	.byte	0x37
	.byte	0x7F
	.byte	0x92
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0267
song0267:	@ 0x08C83A30
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0267_1		@ track
