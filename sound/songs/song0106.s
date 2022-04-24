	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0106_1
song0106_1:	@ 0x08C80D48
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x03
	.byte	0xBE
	.byte	0x5A
	.byte	0xBF
	.byte	0x40
	.byte	0xC1
	.byte	0x0F
	.byte	0xD3
	.byte	0x4E
	.byte	0x7F
	.byte	0x84
	.byte	0x53
	.byte	0x78
	.byte	0x84
	.byte	0x58
	.byte	0x70
	.byte	0x84
	.byte	0x5D
	.byte	0x68
	.byte	0x84
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0106
song0106:	@ 0x08C80D64
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0106_1		@ track
