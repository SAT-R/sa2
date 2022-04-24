	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0295_1
song0295_1:	@ 0x08C8495C
	.byte	0xBC
	.byte	0x00
gUnknown_08C8495E:
	.byte	0xBB
	.byte	0x25
	.byte	0xBD
	.byte	0x5F
	.byte	0xC4
	.byte	0x5F
	.byte	0xBE
	.byte	0x64
	.byte	0xFB
	.byte	0x65
	.byte	0x7F
	.byte	0xA8
	.byte	0xB2
	.word	gUnknown_08C8495E
	.byte	0x8C
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0295
song0295:	@ 0x08C84974
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0295_1		@ track
