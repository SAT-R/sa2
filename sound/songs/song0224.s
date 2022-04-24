	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0224_1
song0224_1:	@ 0x08C82540
	.byte	0xBE
	.byte	0x64
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3F
	.byte	0xBD
	.byte	0x18
	.byte	0xC2
	.byte	0x3C
	.byte	0xC1
	.byte	0x0F
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xD5
	.byte	0x5B
	.byte	0x7F
	.byte	0x86
	.byte	0xCF
	.byte	0x60
	.byte	0x92
gUnknown_08C82557:
	.byte	0xA8
	.byte	0xA0
	.byte	0xB2
	.word	gUnknown_08C82557
	.byte	0x98
	.byte	0xCE
	.byte	0x60
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0224
song0224:	@ 0x08C82564
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0224_1		@ track
