	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0142_1
song0142_1:	@ 0x08C815E4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x19
	.byte	0xC4
	.byte	0x03
	.byte	0xBE
	.byte	0x6E
	.byte	0xBF
	.byte	0x3F
	.byte	0xC1
	.byte	0x01
	.byte	0xD2
	.byte	0x49
	.byte	0x7F
	.byte	0x83
	.byte	0x4E
	.byte	0x74
	.byte	0x83
	.byte	0x50
	.byte	0x78
	.byte	0x83
	.byte	0xEE
	.byte	0x55
	.byte	0x7F
	.byte	0x9F
	.byte	0x81
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0142
song0142:	@ 0x08C81604
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0142_1		@ track
