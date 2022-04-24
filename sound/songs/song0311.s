	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0311_1
song0311_1:	@ 0x08C84BE4
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x2D
	.byte	0xBD
	.byte	0x06
	.byte	0xBE
	.byte	0x7F
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
	.byte	0xF6
	.byte	0x3B
	.byte	0x7F
	.byte	0xA7
	.byte	0x81
	.byte	0xB1

	.align 2
	.global song0311
song0311:	@ 0x08C84BFC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0311_1		@ track
