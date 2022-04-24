	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0281_1
song0281_1:	@ 0x08C8422C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x51
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x2B
	.byte	0xC2
	.byte	0x07
	.byte	0xC5
	.byte	0x00
	.byte	0xC1
	.byte	0x0A
	.byte	0xBE
	.byte	0x5A
	.byte	0xCF
	.byte	0x46
	.byte	0x7F
	.byte	0x98
gUnknown_08C84242:
	.byte	0xA8
	.byte	0xA8
	.byte	0xB2
	.word	gUnknown_08C84242
	.byte	0x98
	.byte	0xCE
	.byte	0x46
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0281
song0281:	@ 0x08C84250
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0281_1		@ track
