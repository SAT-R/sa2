	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0119_1
song0119_1:	@ 0x08C810EC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x34
	.byte	0xBE
	.byte	0x7F
	.byte	0xBF
	.byte	0x40
	.byte	0xC1
	.byte	0x0F
	.byte	0xD5
	.byte	0x25
	.byte	0x7F
	.byte	0x87
	.byte	0xEA
	.byte	0x24
	.byte	0x70
	.byte	0x9B
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0119
song0119:	@ 0x08C81104
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	40		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0119_1		@ track
