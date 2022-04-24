	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0298_1
song0298_1:	@ 0x08C84A34
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x62
	.byte	0xBE
	.byte	0x64
	.byte	0xC1
	.byte	0x0C
	.byte	0xC2
	.byte	0x67
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x64
	.byte	0xF3
	.byte	0x6D
	.byte	0x7F
	.byte	0xA4
	.byte	0x82
	.byte	0xB1

	.align 2
	.global song0298
song0298:	@ 0x08C84A4C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	40		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0298_1		@ track
