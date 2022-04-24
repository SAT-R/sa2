	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0108_1
song0108_1:	@ 0x08C80D94
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x01
	.byte	0xBE
	.byte	0x5A
	.byte	0xBF
	.byte	0x40
	.byte	0xC1
	.byte	0x0F
	.byte	0xD3
	.byte	0x69
	.byte	0x70
	.byte	0x84
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0108
song0108:	@ 0x08C80DA8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0108_1		@ track
