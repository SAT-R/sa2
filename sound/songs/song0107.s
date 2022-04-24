	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0107_1
song0107_1:	@ 0x08C80D70
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
	.byte	0x4C
	.byte	0x60
	.byte	0x84
	.byte	0x47
	.byte	0x84
	.byte	0x42
	.byte	0x64
	.byte	0x84
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0107
song0107:	@ 0x08C80D88
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0107_1		@ track
