	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0238_1
song0238_1:	@ 0x08C82DAC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x26
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x02
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xD4
	.byte	0x4A
	.byte	0x5C
	.byte	0x86
	.byte	0xD9
	.byte	0x3B
	.byte	0x8A
	.byte	0xB1

	.align 2
	.global song0238
song0238:	@ 0x08C82DC4
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0238_1		@ track
