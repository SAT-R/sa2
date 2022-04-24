	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0222_1
song0222_1:	@ 0x08C8247C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x3C
	.byte	0xBD
	.byte	0x16
	.byte	0xBE
	.byte	0x64
	.byte	0xC4
	.byte	0x06
	.byte	0xC1
	.byte	0x0C
	.byte	0xC2
	.byte	0x67
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC0
	.byte	0x04
	.byte	0xCF
	.byte	0x45
	.byte	0x7F
	.byte	0x81
	.byte	0xC0
	.byte	0x0E
	.byte	0x81
	.byte	0x18
	.byte	0x81
	.byte	0x22
	.byte	0x83
	.byte	0x41
	.byte	0x83
	.byte	0x60
	.byte	0x8F
gUnknown_08C8249F:
	.byte	0xA8
	.byte	0x98
	.byte	0xB2
	.word	gUnknown_08C8249F
	.byte	0xA5
	.byte	0x81
	.byte	0xCE
	.byte	0x45
	.byte	0x81
	.byte	0xB1

	.align 2
	.global song0222
song0222:	@ 0x08C824AC
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0222_1		@ track
