	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0168_1
song0168_1:	@ 0x08C81DB0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x26
	.byte	0xBE
	.byte	0x78
	.byte	0xBF
	.byte	0x40
	.byte	0xC1
	.byte	0x0F
	.byte	0xDB
	.byte	0x58
	.byte	0x64
	.byte	0x8C
	.byte	0x53
	.byte	0x5C
	.byte	0x8C
	.byte	0xB1

	.align 2
	.global song0168
song0168:	@ 0x08C81DC4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0168_1		@ track
