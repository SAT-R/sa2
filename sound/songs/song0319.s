	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0319_1
song0319_1:	@ 0x08C84D04
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x26
	.byte	0xBD
	.byte	0x16
	.byte	0xBE
	.byte	0x78
	.byte	0xC5
	.byte	0x00
	.byte	0xC2
	.byte	0x16
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xC1
	.byte	0x14
	.byte	0xFD
	.byte	0x3A
	.byte	0x7F
	.byte	0xAE
	.byte	0x81
	.byte	0xB1

	.align 2
	.global song0319
song0319:	@ 0x08C84D1C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0319_1		@ track
