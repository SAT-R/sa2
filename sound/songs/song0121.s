	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0121_1
song0121_1:	@ 0x08C81178
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x22
	.byte	0xBE
	.byte	0x6B
	.byte	0xC2
	.byte	0x02
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xD4
	.byte	0x4A
	.byte	0x5C
	.byte	0x86
	.byte	0xD3
	.byte	0x42
	.byte	0x84
	.byte	0xB1

	.align 2
	.global song0121
song0121:	@ 0x08C81190
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0121_1		@ track
