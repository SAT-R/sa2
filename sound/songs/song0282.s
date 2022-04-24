	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0282_1
song0282_1:	@ 0x08C8425C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x52
	.byte	0xC4
	.byte	0x0D
	.byte	0xBE
	.byte	0x5A
	.byte	0xC2
	.byte	0x54
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xCF
	.byte	0x45
	.byte	0x7F
	.byte	0xB0
gUnknown_08C84270:
	.byte	0xB0
	.byte	0xB2
	.word	gUnknown_08C84270
	.byte	0x86
	.byte	0xCE
	.byte	0x45
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0282
song0282:	@ 0x08C8427C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0282_1		@ track
