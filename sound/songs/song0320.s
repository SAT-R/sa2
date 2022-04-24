	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0320_1
song0320_1:	@ 0x08C84D28
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
	.byte	0xD1
	.byte	0x35
	.byte	0x7F
	.byte	0x83
	.byte	0xD1
	.byte	0x84
	.byte	0xD2
	.byte	0x85
	.byte	0xEB
	.byte	0x3A
	.byte	0x9C
	.byte	0x81
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0320
song0320:	@ 0x08C84D48
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0320_1		@ track
