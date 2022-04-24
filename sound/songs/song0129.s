	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0129_1
song0129_1:	@ 0x08C8146C
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x4B
	.byte	0xBD
	.byte	0x75
	.byte	0xBE
	.byte	0x78
	.byte	0xFB
	.byte	0x3C
	.byte	0x7F
	.byte	0xAC
	.byte	0xB1
	.byte	0x00
	.byte	0x00
	.byte	0x00

	.align 2
	.global song0129
song0129:	@ 0x08C8147C
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup003		@ voicegroup/tone

	.word	song0129_1		@ track
