	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0231_1
song0231_1:	@ 0x08C82858
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x1F
	.byte	0xBE
	.byte	0x64
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x3C
	.byte	0xC1
	.byte	0x13
	.byte	0xC2
	.byte	0x3C
	.byte	0xC5
	.byte	0x00
	.byte	0xCF
	.byte	0x41
	.byte	0x50
	.byte	0x98
gUnknown_08C8286E:
	.byte	0xA8
	.byte	0xB0
	.byte	0xB2
	.word	gUnknown_08C8286E
	.byte	0x8D
	.byte	0xCE
	.byte	0x41
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0231
song0231:	@ 0x08C8287C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0231_1		@ track
