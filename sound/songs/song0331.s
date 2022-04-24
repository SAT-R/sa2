	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0331_1
song0331_1:	@ 0x08C84EC8
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x25
	.byte	0xBD
	.byte	0x1F
	.byte	0xBE
	.byte	0x78
	.byte	0xBF
	.byte	0x40
	.byte	0xD8
	.byte	0x3C
	.byte	0x7F
	.byte	0x89
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0331
song0331:	@ 0x08C84ED8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup006		@ voicegroup/tone

	.word	song0331_1		@ track
