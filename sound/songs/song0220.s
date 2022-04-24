	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0220_1
song0220_1:	@ 0x08C823B4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x51
	.byte	0xBD
	.byte	0x14
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
	.byte	0xE7
	.byte	0x4B
	.byte	0x78
	.byte	0x98
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0220
song0220:	@ 0x08C823CC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0220_1		@ track
