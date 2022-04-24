	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0274_1
song0274_1:	@ 0x08C83DDC
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x67
	.byte	0xBE
	.byte	0x46
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

	@********************** Track  2 **********************@

	.global song0274_2
song0274_2:	@ 0x08C83DF4
	.byte	0xBC
	.byte	0x00
	.byte	0xBD
	.byte	0x66
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
	.byte	0x00
	.byte	0xF3
	.byte	0x42
	.byte	0x7F
	.byte	0xA4
	.byte	0x82
	.byte	0xB1
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0274
song0274:	@ 0x08C83E0C
	.byte	2		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0274_1		@ track
	.word	song0274_2		@ track
