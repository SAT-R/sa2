	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0111_1
song0111_1:	@ 0x08C80EA0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x0F
	.byte	0xBE
	.byte	0x78
	.byte	0xC2
	.byte	0x2D
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x1B
	.byte	0xE0
	.byte	0x3F
	.byte	0x5C
	.byte	0x91
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0111
song0111:	@ 0x08C80EB8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0111_1		@ track
