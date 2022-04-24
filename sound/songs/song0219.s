	.include "MPlayDef.s"
	.section .rodata
	.align 2
	@********************** Track  1 **********************@

	.global song0219_1
song0219_1:	@ 0x08C82384
	.byte	0xBC
	.byte	0x00
	.byte	0xBB
	.byte	0x25
	.byte	0xBD
	.byte	0x13
	.byte	0xBE
	.byte	0x64
	.byte	0xC2
	.byte	0x33
	.byte	0xC1
	.byte	0x0F
	.byte	0xC5
	.byte	0x00
	.byte	0xBF
	.byte	0x40
	.byte	0xC4
	.byte	0x7F
	.byte	0xD1
	.byte	0x43
	.byte	0x7F
	.byte	0x83
	.byte	0xE7
	.byte	0x40
	.byte	0x83
	.byte	0xBE
	.byte	0x4B
	.byte	0x86
	.byte	0x32
	.byte	0x86
	.byte	0x19
	.byte	0x86
	.byte	0x00
	.byte	0x85
	.byte	0xB1
	.byte	0x00

	.align 2
	.global song0219
song0219:	@ 0x08C823A8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0219_1		@ track
