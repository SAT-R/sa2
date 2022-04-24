	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0104_1
song0104_1:	@ 0x08C80CF0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x40
	.byte	0xBE
	.byte	0x78
	.byte	0xC2
	.byte	0x0F
	.byte	0xC1
	.byte	0x0F
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xD2
	.byte	0x4F
	.byte	0x60
	.byte	0x83
	.byte	0x54
	.byte	0x5C
	.byte	0x83
	.byte	0x4F
	.byte	0x83
	.byte	0x54
	.byte	0x83
	.byte	0x4F
	.byte	0x83
	.byte	0xDB
	.byte	0x58
	.byte	0x8C
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0104
song0104:	@ 0x08C80D14
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0104_1		@ track
