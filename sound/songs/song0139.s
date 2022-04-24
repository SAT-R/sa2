	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0139_1
song0139_1:	@ 0x08C8157C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x40
	.byte	0xBE
	.byte	0x46
	.byte	0xC2
	.byte	0x0F
	.byte	0xC1
	.byte	0x0F
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x00
	.byte	0xD2
	.byte	0x52
	.byte	0x7F
	.byte	0x84
	.byte	0xEA
	.byte	0x9B
	.byte	0x83
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0139
song0139:	@ 0x08C81598
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0139_1		@ track
