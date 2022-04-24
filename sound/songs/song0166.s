	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0166_1
song0166_1:	@ 0x08C81D70
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
	.byte	0x56
	.byte	0x64
	.byte	0x8C
	.byte	0x51
	.byte	0x5C
	.byte	0x8C
	.byte	0xB1

	.align 2
	.global song0166
song0166:	@ 0x08C81D84
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0166_1		@ track
