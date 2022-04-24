	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0114_1
song0114_1:	@ 0x08C80FD0
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x44
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x0F
	.byte	0xC1
	.byte	0x0F
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x2E
	.byte	0xD3
	.byte	0x49
	.byte	0x7F
	.byte	0x85
	.byte	0xD1
	.byte	0x43
	.byte	0x83
	.byte	0xD0
	.byte	0x59
	.byte	0x82
	.byte	0xD2
	.byte	0x57
	.byte	0x8A
	.byte	0xCF
	.byte	0x47
	.byte	0x48
	.byte	0xA9
gUnknown_08C80FF3:
	.byte	0xB0
	.byte	0xB2
	.word	gUnknown_08C80FF3
	.byte	0x8C
	.byte	0xCE
	.byte	0x47
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0114
song0114:	@ 0x08C81000
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0114_1		@ track
