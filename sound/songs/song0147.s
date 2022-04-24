	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0147_1
song0147_1:	@ 0x08C81828
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x00
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xC1
	.byte	0x06
	.byte	0xCF
	.byte	0x3C
	.byte	0x7F
	.byte	0xB0
	.byte	0xA0
	.byte	0xCE
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0147
song0147:	@ 0x08C8183C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0147_1		@ track
