	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0152_1
song0152_1:	@ 0x08C8197C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x40
	.byte	0xBE
	.byte	0x5A
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
	.byte	0xD4
	.byte	0x54
	.byte	0x7F
	.byte	0x85
	.byte	0xE7
	.byte	0x51
	.byte	0x98
	.byte	0x81
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0152
song0152:	@ 0x08C81998
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0152_1		@ track
