.equ AnimCmd_GetTileIndex,		-1
.equ AnimCmd_GetPalette,		-2
.equ AnimCmd_JumpBack,			-3
.equ AnimCmd_4,					-4
.equ AnimCmd_PlaySoundEffect,	-5
.equ AnimCmd_6,					-6
.equ AnimCmd_7,					-7
.equ AnimCmd_8,					-8
.equ AnimCmd_9,					-9
.equ AnimCmd_10,				-10
.equ AnimCmd_11,				-11
.equ AnimCmd_12,				-12

.align 2, 0
	anim_data__0000_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x0, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14, 0x10, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x24, 0x10, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x34, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x44, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x58, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6C, 0x10, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7C, 0x14, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x0, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14, 0x10, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x90, 0x10, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xA0, 0x10, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x44, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x58, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6C, 0x10, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7C, 0x14, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x0, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14, 0x10, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x24, 0x10, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x34, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x44, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x58, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6C, 0x10, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7C, 0x14, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB0, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xC4, 0x14, 0xC, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD8, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC4, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD8, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC4, 0x14, 0xC, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xB0, 0x14, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x0, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x58, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6C, 0x10, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7C, 0x14, 0x6, 0x7
		.4byte	AnimCmd_JumpBack, 0xB5

.align 2, 0
	anim_0000:
		.4byte anim_data__0000_0




.align 2, 0
	anim_data__0001_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x100, 0x14, 0xC, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x114, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x128, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x13C, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x155, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16E, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x155, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x13C, 0x19, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x155, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16E, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x155, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x182, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x128, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x114, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x196, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1AA, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C3, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1DC, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1C3, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1AA, 0x19, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C3, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1DC, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1C3, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x196, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x114, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x100, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F0, 0x14, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x204, 0x14, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x218, 0x1E, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x236, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x254, 0x1E, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x272, 0x18, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x218, 0x1E, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x236, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x254, 0x1E, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28A, 0x18, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x2A2, 0x1E, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x2C0, 0x1E, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x2DE, 0x1E, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x2FC, 0x18, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x2A2, 0x1E, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x2C0, 0x1E, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x2DE, 0x1E, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x2FC, 0x18, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x314, 0x1E, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x236, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x254, 0x1E, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x272, 0x18, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x218, 0x1E, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x236, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x254, 0x1E, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x272, 0x18, 0x4, 0x11
		.4byte	AnimCmd_JumpBack, 0x14
	anim_data__0001_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x218, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x236, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x254, 0x1E, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x332, 0x1E, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x350, 0x1E, 0x4, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x100, 0x14, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEC, 0x14, 0x4, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0001:
		.4byte anim_data__0001_0
		.4byte anim_data__0001_1




.align 2, 0
	anim_data__0002_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x36E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x37E, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x38E, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x39E, 0x10, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0002_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x37E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x36E, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0002:
		.4byte anim_data__0002_0
		.4byte anim_data__0002_1




.align 2, 0
	anim_data__0003_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3AE, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3BE, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3CE, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3DE, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0003_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3EE, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3FE, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x40E, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x41E, 0x10, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0003:
		.4byte anim_data__0003_0
		.4byte anim_data__0003_1




.align 2, 0
	anim_data__0004_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x42E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x43E, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x44E, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x45E, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x42E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x43E, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x44E, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x45E, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x42E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x43E, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x44E, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x45E, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x51

.align 2, 0
	anim_0004:
		.4byte anim_data__0004_0




.align 2, 0
	anim_data__0005_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x46E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x482, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0005:
		.4byte anim_data__0005_0




.align 2, 0
	anim_data__0006_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x496, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4AA, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4BE, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4D7, 0x14, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0006:
		.4byte anim_data__0006_0




.align 2, 0
	anim_data__0007_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4EB, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x504, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x51D, 0x19, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0007_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4EB, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x4, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0007:
		.4byte anim_data__0007_0
		.4byte anim_data__0007_1




.align 2, 0
	anim_data__0008_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x536, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x542, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x552, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x566, 0x18, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0008_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x57E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x592, 0x14, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x5A6, 0x10, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0008:
		.4byte anim_data__0008_0
		.4byte anim_data__0008_1




.align 2, 0
	anim_data__0009_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5B6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5F6, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x636, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x676, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6B6, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6F6, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x736, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x776, 0x40, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0009_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7B6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7F6, 0x40, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x836, 0x40, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x876, 0x40, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x8B6, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x8F6, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x936, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x976, 0x40, 0x8, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0009_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9B6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9F6, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xA36, 0x40, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xA76, 0x40, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xAB6, 0x40, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xAF6, 0x40, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xB36, 0x40, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xB76, 0x40, 0x8, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0009_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBB6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xBF6, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xC36, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xC76, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xCB6, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0xCF6, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0xD36, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0xD76, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0009_4:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0xDF6, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xE36, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0xE76, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0xEB6, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0xEF6, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xF36, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xF76, 0x40, 0x8, 0x27
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0009_5:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0xDF6, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xE36, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0xE76, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0xEB6, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0xEF6, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xF36, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xF76, 0x40, 0x8, 0x27
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0009:
		.4byte anim_data__0009_0
		.4byte anim_data__0009_1
		.4byte anim_data__0009_2
		.4byte anim_data__0009_3
		.4byte anim_data__0009_4
		.4byte anim_data__0009_5




.align 2, 0
	anim_data__0010_0:
		.4byte	AnimCmd_GetPalette, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFB6, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA
		.4byte	AnimCmd_6, 0x1, 0x1006F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFC6, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0010_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFD6, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFE6, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xFF6, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1006, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1016, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1026, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1036, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1046, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0010_2:
		.4byte	AnimCmd_GetPalette, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1056, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406F0FA
		.4byte	AnimCmd_6, 0x1, 0xE08F6F8, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x106F, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1083, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x109C, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0010:
		.4byte anim_data__0010_0
		.4byte anim_data__0010_1
		.4byte anim_data__0010_2




.align 2, 0
	anim_data__0011_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10BA, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA
		.4byte	AnimCmd_6, 0x1, 0x1006F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10CA, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA
		.4byte	AnimCmd_6, 0x1, 0x1206F4FA, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0011_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10DA, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10EA, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10FA, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x110A, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x111A, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x112A, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x113A, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x114A, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0011_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x115A, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406F0FA
		.4byte	AnimCmd_6, 0x1, 0xE08F6F8, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1173, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1187, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x11A0, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0011:
		.4byte anim_data__0011_0
		.4byte anim_data__0011_1
		.4byte anim_data__0011_2




.align 2, 0
	anim_data__0012_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11BE, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11D2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11E2, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x11D2, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0012:
		.4byte anim_data__0012_0




.align 2, 0
	anim_data__0013_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11F2, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1206, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x121A, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x122E, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1242, 0x14, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0013:
		.4byte anim_data__0013_0




.align 2, 0
	anim_data__0014_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1256, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1266, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x100AFAF6
		.4byte	AnimCmd_6, 0x1, 0x1006ECE9, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1284, 0x12, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1296, 0x18, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12AE, 0x1E, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x12CC, 0x1E, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x12EA, 0x24, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x130E, 0x19, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1327, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1345, 0x1E, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1363, 0x14, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0014_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1377, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100EFEF2
		.4byte	AnimCmd_6, 0x1, 0x1203F8EB, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x138F, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x13A7, 0x18, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0x18
	anim_data__0014_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13BF, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x13CF, 0x10, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x13DF, 0x10, 0x1, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0014:
		.4byte anim_data__0014_0
		.4byte anim_data__0014_1
		.4byte anim_data__0014_2




.align 2, 0
	anim_data__0015_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13EF, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1403, 0x12, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1415, 0x18, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1403, 0x12, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x142D, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1446, 0x14
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x145A, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x146E, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x147E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x148E, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x149E, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x14AE, 0x10, 0x2, 0xA
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0015_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14BE, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14D2, 0x10, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14E2, 0x14, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x14F6, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x150A, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x151E, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1532, 0x14, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0015_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1546, 0x10, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1556, 0x10, 0x2, 0x13
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0015:
		.4byte anim_data__0015_0
		.4byte anim_data__0015_1
		.4byte anim_data__0015_2




.align 2, 0
	anim_data__0016_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1566, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1576, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x100EFAF2
		.4byte	AnimCmd_6, 0x1, 0x1006ECE9, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1594, 0x12, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15A6, 0x18, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15BE, 0x1E, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15DC, 0x1E, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15FA, 0x24, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x161E, 0x19, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1637, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1655, 0x1E, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1673, 0x14, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0016_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1687, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100EFEF2
		.4byte	AnimCmd_6, 0x1, 0x1203F8EB, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x169F, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x16B7, 0x18, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0x18
	anim_data__0016_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16CF, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x16DF, 0x10, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x16EF, 0x10, 0x1, 0x10
		.4byte	AnimCmd_4
	anim_data__0016_3:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x16FF, 0x9, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1708, 0xF, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1717, 0xF, 0x1, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x16FF, 0x9, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1708, 0xF, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1717, 0xF, 0x1, 0x13
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0016:
		.4byte anim_data__0016_0
		.4byte anim_data__0016_1
		.4byte anim_data__0016_2
		.4byte anim_data__0016_3




.align 2, 0
	anim_data__0017_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1726, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0xE0EF2F2, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1736, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1742, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1752, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1762, 0x10, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1772, 0xC, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x177E, 0x10, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x178E, 0x14, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17A2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17B2, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17C2, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17D2, 0x10, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0017_1:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x17E2, 0x8, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x17EA, 0x10, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x17FA, 0x10, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x180A, 0x10, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x181A, 0x10, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x182A, 0x10, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x183A, 0xC, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1846, 0x10, 0x2, 0x13
		.4byte	AnimCmd_4

.align 2, 0
	anim_0017:
		.4byte anim_data__0017_0
		.4byte anim_data__0017_1




.align 2, 0
	anim_data__0018_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1856, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1866, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1876, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1886, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1896, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18A6, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x18B6, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x18C6, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x18D6, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x18E6, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x18F6, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1906, 0x10, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x14

.align 2, 0
	anim_0018:
		.4byte anim_data__0018_0




.align 2, 0
	anim_data__0019_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1916, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1926, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1936, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1946, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1956, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x196A, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1982, 0x14, 0x2, 0x6
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0019_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1996, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC06F4FA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x19AF, 0x19, 0x2, 0x8
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0019_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x19C8, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC06F4FA, 0x2, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0019:
		.4byte anim_data__0019_0
		.4byte anim_data__0019_1
		.4byte anim_data__0019_2




.align 2, 0
	anim_data__0028_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x19E1, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19F5, 0x19, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A0E, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A22, 0x19, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A3B, 0x14, 0x8, 0x4
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0028_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1A4F, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1806F8FA, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A6D, 0x18, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A85, 0x18, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A9D, 0x19, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1AB6, 0x19, 0x5, 0x9
		.4byte	AnimCmd_4
	anim_data__0028_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1ACF, 0x10, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1ADF, 0x10, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1AEF, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1B03, 0x14, 0x3, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0028:
		.4byte anim_data__0028_0
		.4byte anim_data__0028_1
		.4byte anim_data__0028_2




.align 2, 0
	anim_data__0029_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1B17, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B2B, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B17, 0x14, 0xC, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B44, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B54, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B68, 0x14, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0029:
		.4byte anim_data__0029_0




.align 2, 0
	anim_data__0030_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1B7C, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B90, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BA4, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BB8, 0x19, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BD1, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BEA, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1BD1, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BB8, 0x19, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BD1, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BEA, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1BD1, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BFE, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1BA4, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B90, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C12, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1C26, 0x19, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1C3F, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C58, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1C3F, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C26, 0x19, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1C3F, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C58, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1C3F, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1C12, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1B90, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B7C, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C6C, 0x14, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1C80, 0xF, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1C8F, 0x14, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1CA3, 0xF, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1CB2, 0xF, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1C80, 0xF, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1C8F, 0x14, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1CA3, 0xF, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1CB2, 0xF, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1C6C, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1B7C, 0x14, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CC1, 0x14, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1CD5, 0x10, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1CE5, 0x10, 0x2, 0x12
		.4byte	AnimCmd_4
	anim_data__0030_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1CE5, 0x10, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1CF5, 0x14, 0x6, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1D09, 0x14, 0x3C, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x1D1D, 0x19, 0x4, 0x15
		.4byte	AnimCmd_4

.align 2, 0
	anim_0030:
		.4byte anim_data__0030_0
		.4byte anim_data__0030_1




.align 2, 0
	anim_data__0031_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D36, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D46, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D5E, 0x19, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0031_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D77, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D90, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1DA4, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1DBD, 0x19, 0x2, 0x6
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0031_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1DD6, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1DEA, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1DFE, 0x14, 0x4, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0031:
		.4byte anim_data__0031_0
		.4byte anim_data__0031_1
		.4byte anim_data__0031_2




.align 2, 0
	anim_data__0032_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1E12, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1E26, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1E3A, 0x14, 0x10, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1E4E, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1E62, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1E76, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1E8A, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1E9E, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1EB7, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1ECB, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1EDF, 0x14, 0xC, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1EF3, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1F07, 0x19, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1F20, 0x19, 0xC, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0032:
		.4byte anim_data__0032_0




.align 2, 0
	anim_data__0033_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F39, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F4D, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F61, 0x14, 0x10, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F75, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F89, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F9D, 0x18, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1FB5, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1FCD, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1FE1, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1FF5, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2009, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x201D, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2031, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2045, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2059, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x206D, 0x19, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x2086, 0x19, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x206D, 0x19, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x209F, 0x14, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x20B3, 0x14, 0xC, 0x12
		.4byte	AnimCmd_4

.align 2, 0
	anim_0033:
		.4byte anim_data__0033_0




.align 2, 0
	anim_data__0034_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20C7, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20DB, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x20F3, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x210B, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2123, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x213B, 0x1C, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2157, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x216F, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2183, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2197, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x21AB, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x21BF, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x21D3, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x21EB, 0x18, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2203, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2217, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x222B, 0x14, 0x3C, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0034:
		.4byte anim_data__0034_0




.align 2, 0
	anim_data__0035_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x223F, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2253, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2267, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2280, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2294, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22A8, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22BC, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22D5, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x22EE, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2307, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2320, 0x19, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2339, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2352, 0x19, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x236B, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x22BC, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2384, 0x19, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0035:
		.4byte anim_data__0035_0




.align 2, 0
	anim_data__0036_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x239D, 0xF, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0036_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23AC, 0xF, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0036_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23BB, 0x19, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0036_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23D4, 0x19, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0036:
		.4byte anim_data__0036_0
		.4byte anim_data__0036_1
		.4byte anim_data__0036_2
		.4byte anim_data__0036_3




.align 2, 0
	anim_data__0037_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23ED, 0xF, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23FC, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2410, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2429, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x243D, 0xF, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x244C, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2460, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2479, 0x14, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0037_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248D, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x24A1, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x24B5, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x24D3, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x24EC, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2500, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2519, 0x1E, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2537, 0x19, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0037:
		.4byte anim_data__0037_0
		.4byte anim_data__0037_1




.align 2, 0
	anim_data__0048_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2550, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2564, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2550, 0x14, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0048_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2578, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x258C, 0x14, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x25A0, 0x12, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x25B2, 0x12, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x25C4, 0x12, 0x3, 0x6
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0048_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x258C, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2578, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x25D6, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x25EA, 0x1E, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2608, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2620, 0x19, 0x2, 0xA
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0048:
		.4byte anim_data__0048_0
		.4byte anim_data__0048_1
		.4byte anim_data__0048_2




.align 2, 0
	anim_data__0049_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2639, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x264D, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2661, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0049_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x267D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA
		.4byte	AnimCmd_6, 0x1, 0xE0EF0F2, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2691, 0x14, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x26A5, 0x19, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x26BE, 0x1E, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x26DC, 0x14, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x26F0, 0x14, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2704, 0x19, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x271D, 0x19, 0x1, 0xA
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0049_2:
		.4byte	AnimCmd_GetPalette, 0x3, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x2736, 0x20, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2756, 0x20, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2776, 0x20, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2796, 0x20, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x27B6, 0x20, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x27D6, 0x20, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27F6, 0x20, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x2816, 0x20, 0x1, 0x12
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0049:
		.4byte anim_data__0049_0
		.4byte anim_data__0049_1
		.4byte anim_data__0049_2




.align 2, 0
	anim_data__0050_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2836, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0050_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2836, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x284E, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2862, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2880, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2899, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x28AD, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x28C1, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x28D9, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x28F2, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2906, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x291A, 0x14, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0050:
		.4byte anim_data__0050_0
		.4byte anim_data__0050_1




.align 2, 0
	anim_data__0051_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x292E, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2942, 0x12, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2954, 0x18, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2942, 0x12, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x296C, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2985, 0x14
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2999, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x29AD, 0x10, 0x2, 0x6
		.4byte	AnimCmd_4
	anim_data__0051_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29BD, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x29CD, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x29DD, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x29ED, 0x10, 0x2, 0xA
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0051_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29FD, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2A11, 0x10, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2A21, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2A35, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2A49, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x2A5D, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A71, 0x14, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0051_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A85, 0x10, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x2A95, 0x10, 0x1, 0x13
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0051:
		.4byte anim_data__0051_0
		.4byte anim_data__0051_1
		.4byte anim_data__0051_2
		.4byte anim_data__0051_3




.align 2, 0
	anim_data__0052_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2AA5, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2ABD, 0x12, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2ACF, 0x12, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2AE1, 0x12, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0052_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2AA5, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2AF3, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2B07, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2B1B, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2B2F, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2B43, 0x14, 0x3, 0x8
		.4byte	AnimCmd_4
	anim_data__0052_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2B57, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2B6B, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2B7F, 0x14, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0052:
		.4byte anim_data__0052_0
		.4byte anim_data__0052_1
		.4byte anim_data__0052_2




.align 2, 0
	anim_data__0053_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2B93, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2BA7, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2BB7, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2BCB, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2BDF, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2BF3, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2C07, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2C1B, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2C2F, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2C43, 0x10, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2C53, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2C67, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2C7B, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2C8F, 0x14, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0053:
		.4byte anim_data__0053_0




.align 2, 0
	anim_data__0054_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2CA3, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1208F2F8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2CBC, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE08F0F8, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2CDA, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2CEE, 0x19, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0054_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2D07, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2D1F, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2D33, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2D47, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2D5B, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2D6F, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2D83, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2D97, 0x14, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0054:
		.4byte anim_data__0054_0
		.4byte anim_data__0054_1




.align 2, 0
	anim_data__0055_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2DAB, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2DEB, 0x40, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0055:
		.4byte anim_data__0055_0




.align 2, 0
	anim_data__0056_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2E2B, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC06EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2E3F, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2E57, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2E2B, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2E3F, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2E57, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2E6B, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2E7F, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2E93, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2EA7, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2EC5, 0x18, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2EDD, 0x15, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2EF2, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2F10, 0x18, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2F28, 0x18, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2F40, 0x24, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2F64, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2F7D, 0x12, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2F8F, 0x1E, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x2FAD, 0x18, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2FC5, 0x18, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x2FDD, 0x1E, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x2FFB, 0x18, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x3013, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x3027, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x303B, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x304F, 0x14, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x3063, 0x14, 0x3, 0x18
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0056:
		.4byte anim_data__0056_0




.align 2, 0
	anim_data__0057_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3077, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0057_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3090, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0057_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30A0, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0057_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30B0, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0057_4:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30C9, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0057_5:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30DD, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0057_6:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30ED, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0057_7:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x30FD, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0057:
		.4byte anim_data__0057_0
		.4byte anim_data__0057_1
		.4byte anim_data__0057_2
		.4byte anim_data__0057_3
		.4byte anim_data__0057_4
		.4byte anim_data__0057_5
		.4byte anim_data__0057_6
		.4byte anim_data__0057_7




.align 2, 0
	anim_data__0058_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3111, 0x40
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3151, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3191, 0x40, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x31D1, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3211, 0x40, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3251, 0x40, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3291, 0x40, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x32D1, 0x40, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0058:
		.4byte anim_data__0058_0




.align 2, 0
	anim_data__0059_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3311, 0x15
		.4byte	AnimCmd_6, 0x0, 0x2A060CFA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0059_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3326, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1EFE0AE4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0059_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3344, 0x18
		.4byte	AnimCmd_6, 0x0, 0x10F802D8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0059_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x335C, 0x19
		.4byte	AnimCmd_6, 0x0, 0xAF2F5DD, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0059_4:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3375, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFEF8EAE6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0059_5:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x338D, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF8FEDCEC, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0059_6:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x339F, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF806DAFA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0059_7:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x33BB, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF610DE00, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0059_8:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x33D7, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE1EEC08, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0059_9:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x33EB, 0x18
		.4byte	AnimCmd_6, 0x0, 0x826F80A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0059_10:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3403, 0x18
		.4byte	AnimCmd_6, 0x0, 0x12240208, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0059_11:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x341B, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x221C0804, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0059:
		.4byte anim_data__0059_0
		.4byte anim_data__0059_1
		.4byte anim_data__0059_2
		.4byte anim_data__0059_3
		.4byte anim_data__0059_4
		.4byte anim_data__0059_5
		.4byte anim_data__0059_6
		.4byte anim_data__0059_7
		.4byte anim_data__0059_8
		.4byte anim_data__0059_9
		.4byte anim_data__0059_10
		.4byte anim_data__0059_11




.align 2, 0
	anim_data__0060_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3439, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF806DAFA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0060_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3455, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF8FEDCEC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0060_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3467, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFEF8EAE6, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0060_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x347F, 0x19
		.4byte	AnimCmd_6, 0x0, 0xAF2F5DD, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0060_4:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3498, 0x18
		.4byte	AnimCmd_6, 0x0, 0x16F802D8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0060_5:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x34B0, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1EFE0AE4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0060_6:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x34CE, 0x15
		.4byte	AnimCmd_6, 0x0, 0x2A060CFA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0060_7:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x34E3, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x221C0804, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0060_8:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3501, 0x18
		.4byte	AnimCmd_6, 0x0, 0x12240208, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0060_9:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3519, 0x18
		.4byte	AnimCmd_6, 0x0, 0x826F80A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0060_10:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3531, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE1EEC08, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0060_11:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3545, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF610DE00, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0060:
		.4byte anim_data__0060_0
		.4byte anim_data__0060_1
		.4byte anim_data__0060_2
		.4byte anim_data__0060_3
		.4byte anim_data__0060_4
		.4byte anim_data__0060_5
		.4byte anim_data__0060_6
		.4byte anim_data__0060_7
		.4byte anim_data__0060_8
		.4byte anim_data__0060_9
		.4byte anim_data__0060_10
		.4byte anim_data__0060_11




.align 2, 0
	anim_data__0061_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3561, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xF06F1FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x357F, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x359D, 0x1E, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x357F, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0061:
		.4byte anim_data__0061_0




.align 2, 0
	anim_data__0062_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x35BB, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1E0600FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x35D7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180600FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x35EF, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100600FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x35FF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3613, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFE06E0FA, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x362F, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E6FA, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3647, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F0FA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3657, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1A06FCFA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x35BB, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1E0400F8, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x35D7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180600FA, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x35EF, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100600FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x35FF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3613, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFE06E0FA, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0062_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x366F, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFC06DEFA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x368B, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E4FA, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x36A3, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x36B3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x36C7, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x200602FA, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x36E3, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180602FA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x36FB, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100600FA, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x370B, 0x18
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x366F, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFC06DEFA, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x368B, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E4FA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x36A3, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x36B3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x36C7, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x200602FA, 0x2, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0062:
		.4byte anim_data__0062_0
		.4byte anim_data__0062_1




.align 2, 0
	anim_data__0063_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3723, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCF6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3733, 0x19
		.4byte	AnimCmd_6, 0x0, 0xEEEF6, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x374C, 0x23
		.4byte	AnimCmd_6, 0x0, 0xFE0EE5F6, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x376F, 0x19
		.4byte	AnimCmd_6, 0x0, 0xEEDF6, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3788, 0xC
		.4byte	AnimCmd_6, 0x0, 0x60EF6F6, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3794, 0x14
		.4byte	AnimCmd_6, 0x0, 0x180E00F6, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x37A8, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x200E02F6, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x37C4, 0x14
		.4byte	AnimCmd_6, 0x0, 0x140E00F6, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x3723, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCF6, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0063_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x37D8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EF6F6, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x37E8, 0x19
		.4byte	AnimCmd_6, 0x0, 0x160E00F6, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x3801, 0x23
		.4byte	AnimCmd_6, 0x0, 0x220E02F6, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x3824, 0x19
		.4byte	AnimCmd_6, 0x0, 0x160E00F6, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x383D, 0xC
		.4byte	AnimCmd_6, 0x0, 0xA0EFAF6, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x3849, 0x14
		.4byte	AnimCmd_6, 0x0, 0x20EEAF6, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x385D, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x20EE4F6, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x3879, 0x14
		.4byte	AnimCmd_6, 0x0, 0x20EEEF6, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x37D8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EF6F6, 0x2, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0063:
		.4byte anim_data__0063_0
		.4byte anim_data__0063_1




.align 2, 0
	anim_data__0064_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x388D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x38A1, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x38BF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFFEFE1E3, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x38D7, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x38F0, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x38FF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFF17E10B, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3917, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFF1FE113, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3933, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF17E10B, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x388D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x38A1, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x38BF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFFEFE1E3, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x38D7, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x38F0, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0064:
		.4byte anim_data__0064_0




.align 2, 0
	anim_data__0065_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3947, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3960, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3979, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3997, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x39AF, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x39CD, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x39EB, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3A09, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0065_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3A21, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x3A39, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x3A4D, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x3A61, 0x14, 0x3, 0xB
		.4byte	AnimCmd_4
	anim_data__0065_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3A75, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x3A89, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x3A9D, 0x14, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0065:
		.4byte anim_data__0065_0
		.4byte anim_data__0065_1
		.4byte anim_data__0065_2




.align 2, 0
	anim_data__0066_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3AB1, 0x23
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3AD4, 0x23, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3AF7, 0x23, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0066_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3B1A, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3B38, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3B50, 0x12, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3B62, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3B7A, 0x1E, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0066_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3B98, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x3BB1, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x3BCA, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0066:
		.4byte anim_data__0066_0
		.4byte anim_data__0066_1
		.4byte anim_data__0066_2




.align 2, 0
	anim_data__0067_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3BE8, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3C0C, 0x19, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3C25, 0x10, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3C35, 0x19, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3C4E, 0x24, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3C72, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3C86, 0x10, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3C96, 0x14, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0067:
		.4byte anim_data__0067_0




.align 2, 0
	anim_data__0068_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3CAA, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0068_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3CBE, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0068_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3CCE, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0068_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3CE2, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0068_4:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3CF6, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0068_5:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D0A, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0068_6:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D1E, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0068_7:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D32, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0068_8:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D46, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0068_9:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D5A, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0068_10:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D6A, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0068:
		.4byte anim_data__0068_0
		.4byte anim_data__0068_1
		.4byte anim_data__0068_2
		.4byte anim_data__0068_3
		.4byte anim_data__0068_4
		.4byte anim_data__0068_5
		.4byte anim_data__0068_6
		.4byte anim_data__0068_7
		.4byte anim_data__0068_8
		.4byte anim_data__0068_9
		.4byte anim_data__0068_10




.align 2, 0
	anim_data__0069_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3D7E, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA0AF8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3D92, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3DA6, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3DBA, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3DCE, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3DE2, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3DF6, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3E0F, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0069_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3E23, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA0AF8F8, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x3E37, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x3E4B, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x3E5F, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x3E73, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x3E87, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x3E9B, 0x19, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x3EB4, 0x14, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0069:
		.4byte anim_data__0069_0
		.4byte anim_data__0069_1




.align 2, 0
	anim_data__0070_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3EC8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3ED8, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3EE8, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3EF8, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3F08, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3F18, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3F28, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3F38, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0070:
		.4byte anim_data__0070_0




.align 2, 0
	anim_data__0071_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x3F48, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x3F61, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x3F7A, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x3F93, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x3FAC, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x3FC0, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x3FD9, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x3FF2, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0071_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x400B, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4029, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4041, 0x18, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x4059, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x4041, 0x18, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x4029, 0x18, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0071:
		.4byte anim_data__0071_0
		.4byte anim_data__0071_1




.align 2, 0
	anim_data__0072_0:
		.4byte	AnimCmd_GetPalette, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4077, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4089, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x12FFF4EE, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x40A7, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x12FAF4E8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x40C5, 0x18
		.4byte	AnimCmd_6, 0x0, 0x12FCF4EA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x40DD, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1206F4F7, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x40F5, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1212F402, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x410D, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1218F406, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x412B, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1212F402, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x43

.align 2, 0
	anim_0072:
		.4byte anim_data__0072_0




.align 2, 0
	anim_data__0073_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4143, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4153, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4163, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4173, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4183, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4193, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x41A3, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x41B3, 0x10, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0073_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x41C3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x41D7, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x41EB, 0x10, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x41FB, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x420F, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x4223, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x4237, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x424B, 0x14, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0073_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x425F, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4273, 0x14, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x4287, 0x19, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x42A0, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x42B4, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x42C8, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x42DC, 0x10, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x42EC, 0x14, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0073:
		.4byte anim_data__0073_0
		.4byte anim_data__0073_1
		.4byte anim_data__0073_2




.align 2, 0
	anim_data__0074_0:
		.4byte	AnimCmd_GetPalette, 0x5, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0074:
		.4byte anim_data__0074_0




.align 2, 0
	anim_data__0075_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4300, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1007F9F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4340, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4380, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0075:
		.4byte anim_data__0075_0




.align 2, 0
	anim_data__0085_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x43C0, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0085_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x43D4, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0085:
		.4byte anim_data__0085_0
		.4byte anim_data__0085_1




.align 2, 0
	anim_data__0086_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x43E8, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4400, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4418, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x442C, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4444, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x445C, 0x14, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0086_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4470, 0x14
		.4byte	AnimCmd_6, 0x0, 0x8E0F8, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4484, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4498, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x44AC, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x44C0, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x44D4, 0x14, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0086_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x44E8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x44FC, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x4510, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x4524, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x4538, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x454C, 0x14, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0086_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4560, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x4574, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x4588, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x459C, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x45B0, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x45C4, 0x14, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0086:
		.4byte anim_data__0086_0
		.4byte anim_data__0086_1
		.4byte anim_data__0086_2
		.4byte anim_data__0086_3




.align 2, 0
	anim_data__0087_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x45D8, 0x24
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x45FC, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0087_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x461A, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0087_2:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x462E, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x464C, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0087_3:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x466A, 0x19
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0087:
		.4byte anim_data__0087_0
		.4byte anim_data__0087_1
		.4byte anim_data__0087_2
		.4byte anim_data__0087_3




.align 2, 0
	anim_data__0088_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4683, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4697, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x46AB, 0x14, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0088_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x46BF, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x46D3, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x46E7, 0x1E, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0088:
		.4byte anim_data__0088_0
		.4byte anim_data__0088_1




.align 2, 0
	anim_data__0089_0:
		.4byte	AnimCmd_GetPalette, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4705, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4715, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4725, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4735, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4745, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4755, 0x10, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0089:
		.4byte anim_data__0089_0




.align 2, 0
	anim_data__0090_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4765, 0x14
		.4byte	AnimCmd_6, 0x0, 0x106E3FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4779, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x478D, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x47A1, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x47B5, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x47C9, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x47DD, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x47F1, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4805, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4819, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x482D, 0x14, 0x3, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0090:
		.4byte anim_data__0090_0




.align 2, 0
	anim_data__0091_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4841, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x484D, 0xC, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4859, 0x10, 0x7, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4869, 0x10, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4879, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4889, 0xC, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x4895, 0xC, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x48A1, 0xC, 0x7, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4841, 0xC, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x48AD, 0xC, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4859, 0x10, 0x7, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4869, 0x10, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x48B9, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x48C9, 0xC, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x48D5, 0xC, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x48E1, 0xC, 0x7, 0xC
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0091:
		.4byte anim_data__0091_0




.align 2, 0
	anim_data__0092_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x48ED, 0xF
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x48FC, 0xF, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x490B, 0xF, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x491A, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x492E, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x493D, 0xC, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x492E, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x491A, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x48ED, 0xF
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x48FC, 0xF, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x490B, 0xF, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x491A, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x492E, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x493D, 0xC, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x492E, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x491A, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x48ED, 0xF
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4949, 0xF
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4958, 0x10, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4968, 0xC, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4974, 0xC, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4968, 0xC, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4974, 0xC, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4968, 0xC, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4974, 0xC, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4980, 0x10, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x4990, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x49A4, 0x19, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x49BD, 0x19, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x49D6, 0x19, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x49EF, 0x19, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x49A4, 0x19, 0xC, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x4A08, 0x14, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4A1C, 0xF, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x4A2B, 0xF, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x4A3A, 0xF, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x4A49, 0xF, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x4A1C, 0xF, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x4A2B, 0xF, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x4A3A, 0xF, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x4A49, 0xF, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x4A1C, 0xF, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x4A2B, 0xF, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x4A3A, 0xF, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x4A49, 0xF, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x4A58, 0xF, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x4A67, 0x14, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x4A7B, 0x14, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x4A8F, 0x14, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x4AA3, 0x14, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x4A67, 0x14, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x4A7B, 0x14, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x4A8F, 0x14, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x4AA3, 0x14, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x4A67, 0x14, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x4A7B, 0x14, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x4A8F, 0x14, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x4AA3, 0x14, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x4A58, 0xF, 0x8, 0x15
		.4byte	AnimCmd_JumpBack, 0x82
	anim_data__0092_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4AB7, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x4, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x4ACB, 0x10, 0x4, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x4ADB, 0x10, 0x1, 0x1C
		.4byte	AnimCmd_4

.align 2, 0
	anim_0092:
		.4byte anim_data__0092_0
		.4byte anim_data__0092_1




.align 2, 0
	anim_data__0093_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4AEB, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4AFB, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4B0B, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4B1B, 0xC, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0093_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4B27, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4B37, 0x10, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0093:
		.4byte anim_data__0093_0
		.4byte anim_data__0093_1




.align 2, 0
	anim_data__0094_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4B47, 0x19
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4B60, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4B7E, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4B97, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4BB0, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4BC9, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x4BE7, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4C00, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0094_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4B47, 0x19
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4B60, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4B7E, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4B97, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4BB0, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4BC9, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x4BE7, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4C00, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0094:
		.4byte anim_data__0094_0
		.4byte anim_data__0094_1




.align 2, 0
	anim_data__0095_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4C19, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4C29, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4C39, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4C49, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0095_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4C59, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4C69, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x4C79, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4C89, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4C99, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4CA9, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4CB9, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x4CC9, 0x10, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0095:
		.4byte anim_data__0095_0
		.4byte anim_data__0095_1




.align 2, 0
	anim_data__0096_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4CD9, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4CE9, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0096:
		.4byte anim_data__0096_0




.align 2, 0
	anim_data__0097_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4CF9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4D0D, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4D1D, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4D2D, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4D3D, 0x10, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0097:
		.4byte anim_data__0097_0




.align 2, 0
	anim_data__0098_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4D4D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4D61, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4D75, 0x19, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0098_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4D8E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4D9E, 0x10, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0098:
		.4byte anim_data__0098_0
		.4byte anim_data__0098_1




.align 2, 0
	anim_data__0099_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4DAE, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4DC2, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4DD2, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4DE6, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4DFE, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4E16, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x4E2E, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x4E42, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4E52, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x4DC2, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4DD2, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4DE6, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4DFE, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x4E66, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x4E7E, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x4E92, 0x10, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x4E52, 0x14, 0x2, 0x8
		.4byte	AnimCmd_JumpBack, 0x50
	anim_data__0099_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4EA2, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x4EB6, 0x10, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x4EC6, 0x10, 0x1, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0099:
		.4byte anim_data__0099_0
		.4byte anim_data__0099_1




.align 2, 0
	anim_data__0100_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x4ED6, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4F16, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4F56, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4F96, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x4FD6, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x5016, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x5056, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x5096, 0x40, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x4ED6, 0x40, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x4F16, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x4F56, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x4F96, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x50D6, 0x40, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x5116, 0x40, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x5156, 0x40, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x5096, 0x40, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0100_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5196, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x51D6, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x5216, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x5256, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x5296, 0x40, 0x8, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x52D6, 0x40, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5316, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x5356, 0x40, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x5196, 0x40, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x51D6, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x5216, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x5256, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x5396, 0x40, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x53D6, 0x40, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x5416, 0x40, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x5356, 0x40, 0x8, 0x12
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0100_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5456, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x5496, 0x40, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x54D6, 0x40, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x5516, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x5556, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x5596, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x55D6, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x5616, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x5456, 0x40, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x5496, 0x40, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x54D6, 0x40, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x5516, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x5656, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x5696, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x56D6, 0x40, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x5616, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0100_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5716, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x5756, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x5796, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x57D6, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0x5816, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0x5856, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0x5896, 0x40, 0x8, 0x27
		.4byte	AnimCmd_GetTileIndex, 0x58D6, 0x40, 0x8, 0x28
		.4byte	AnimCmd_GetTileIndex, 0x5716, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x5756, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x5796, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x57D6, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0x5916, 0x40, 0x8, 0x29
		.4byte	AnimCmd_GetTileIndex, 0x5956, 0x40, 0x8, 0x2A
		.4byte	AnimCmd_GetTileIndex, 0x5996, 0x40, 0x8, 0x2B
		.4byte	AnimCmd_GetTileIndex, 0x59D6, 0x40, 0x8, 0x2C
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0100_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5A16, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x5A56, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x5A96, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x5AD6, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x5B16, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x5B56, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x5B96, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x5BD6, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x5A16, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x5A56, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x5A96, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x5AD6, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x5C16, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x5C56, 0x40, 0x8, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x5C96, 0x40, 0x8, 0x37
		.4byte	AnimCmd_GetTileIndex, 0x5BD6, 0x40, 0x8, 0x34
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0100_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5A16, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x5A56, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x5A96, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x5AD6, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x5B16, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x5B56, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x5B96, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x5BD6, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x5A16, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x5A56, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x5A96, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x5AD6, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x5C16, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x5C56, 0x40, 0x8, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x5C96, 0x40, 0x8, 0x37
		.4byte	AnimCmd_GetTileIndex, 0x5BD6, 0x40, 0x8, 0x34
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0100:
		.4byte anim_data__0100_0
		.4byte anim_data__0100_1
		.4byte anim_data__0100_2
		.4byte anim_data__0100_3
		.4byte anim_data__0100_4
		.4byte anim_data__0100_5




.align 2, 0
	anim_data__0101_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5CD6, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F2FA
		.4byte	AnimCmd_6, 0x1, 0x806F2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5CE6, 0x10, 0x3, 0x1
		.4byte	AnimCmd_4
	anim_data__0101_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5CF6, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x5D06, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x5D16, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x5D26, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x5D36, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x5D46, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x5D56, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x5D66, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0101_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5D76, 0x19
		.4byte	AnimCmd_6, 0x0, 0x806F2FA
		.4byte	AnimCmd_6, 0x1, 0xD0AF9F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x5D8F, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x5DA7, 0x1C, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x5DC3, 0x14, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0101:
		.4byte anim_data__0101_0
		.4byte anim_data__0101_1
		.4byte anim_data__0101_2




.align 2, 0
	anim_data__0102_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5DD7, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F2FA
		.4byte	AnimCmd_6, 0x1, 0x806F2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5DE7, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0102_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5DF7, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x5E07, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x5E17, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x5E27, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x5E37, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x5E47, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x5E57, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x5E67, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0102_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5E77, 0x19
		.4byte	AnimCmd_6, 0x0, 0x806F2FA
		.4byte	AnimCmd_6, 0x1, 0xD0AF9F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x5E90, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x5EA8, 0x1C, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x5EC4, 0x14, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0102:
		.4byte anim_data__0102_0
		.4byte anim_data__0102_1
		.4byte anim_data__0102_2




.align 2, 0
	anim_data__0103_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5ED8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5EE8, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x5EF8, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x5F08, 0xC, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x5EE8, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5ED8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0103:
		.4byte anim_data__0103_0




.align 2, 0
	anim_data__0104_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5F14, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5F28, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x5F40, 0x1C, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x5F5C, 0x1C, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x5F78, 0x1C, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0104:
		.4byte anim_data__0104_0




.align 2, 0
	anim_data__0105_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x5F94, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x5FA4, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x5FB4, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x5FC4, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x5FD4, 0x14, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x5FE8, 0x14, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x5FFC, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6010, 0x19, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6029, 0x19, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6042, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6056, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x606F, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6083, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x6097, 0x10, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x60A7, 0x10, 0x3, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0105:
		.4byte anim_data__0105_0




.align 2, 0
	anim_data__0107_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x60B7, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x60C3, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x60CF, 0x10
		.4byte	AnimCmd_6, 0x1, 0x1010F0F0, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x60DF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x606ECFA
		.4byte	AnimCmd_6, 0x1, 0x810E8F0, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x60F3, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6107, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x611B, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x60F3, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6107, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x611B, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x60F3, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6107, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x612F, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6143, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6157, 0x19, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6170, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6189, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA
		.4byte	AnimCmd_6, 0x1, 0x1010F0F0, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6199, 0x10
		.4byte	AnimCmd_6, 0x1, 0x0, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x61A9, 0x10, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x61B9, 0x10, 0x2, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0107:
		.4byte anim_data__0107_0




.align 2, 0
	anim_data__0108_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x61C9, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA
		.4byte	AnimCmd_6, 0x1, 0x1010F0F0, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x61D9, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x61E9, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x61F9, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6209, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA
		.4byte	AnimCmd_6, 0x1, 0x1010F0F0, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x621D, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6231, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6209, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x621D, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6231, 0x14, 0x2, 0x6
		.4byte	AnimCmd_4
	anim_data__0108_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6245, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6259, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x626D, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x627D, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6291, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x62A5, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x62BD, 0x18, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x62D5, 0x18, 0x2, 0xE
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0108:
		.4byte anim_data__0108_0
		.4byte anim_data__0108_1




.align 2, 0
	anim_data__0109_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x62ED, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806F2FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6305, 0x18, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x631D, 0x14, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6331, 0x19, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x634A, 0x19, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6363, 0x18, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x637B, 0x19, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6394, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x63AD, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x63C1, 0x19, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x63DA, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x63EE, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6402, 0x19, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x641B, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x642F, 0x18, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x6447, 0x1C, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x6463, 0x1C, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x647F, 0x1C, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0109:
		.4byte anim_data__0109_0




.align 2, 0
	anim_data__0110_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x649B, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x64AB, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x64BB, 0x19, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x64D4, 0x18, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x64EC, 0x18, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6504, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6518, 0x18, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6530, 0x10, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x649B, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x64AB, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x64BB, 0x19, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x64D4, 0x18, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6540, 0x18, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6558, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x656C, 0x18, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6530, 0x10, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0110_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6584, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6594, 0x10, 0x1, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0110:
		.4byte anim_data__0110_0
		.4byte anim_data__0110_1




.align 2, 0
	anim_data__0111_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x65A4, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x65BC, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x65D0, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA
		.4byte	AnimCmd_6, 0x1, 0x110607FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x65E8, 0x1C, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6604, 0x14, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0111:
		.4byte anim_data__0111_0




.align 2, 0
	anim_data__0112_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6618, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6628, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6638, 0x10, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6648, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6658, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6668, 0x10, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6678, 0x10, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6688, 0x10, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6698, 0x10, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x66A8, 0x10, 0x6, 0x9
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0112:
		.4byte anim_data__0112_0




.align 2, 0
	anim_data__0113_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x66B8, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x66F8, 0x40, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6738, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6778, 0x40, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x67B8, 0x40, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x67F8, 0x40, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6838, 0x40, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6878, 0x40, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x68B8, 0x40, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x68F8, 0x40, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6938, 0x40, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6978, 0x40, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x69B8, 0x40, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x69F8, 0x40, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x6A38, 0x40, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x6A78, 0x40, 0x2, 0xF
		.4byte	AnimCmd_4

.align 2, 0
	anim_0113:
		.4byte anim_data__0113_0




.align 2, 0
	anim_data__0119_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6AB8, 0x10
		.4byte	AnimCmd_6, 0x0, 0xD06F3FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6AC8, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6ADC, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6AEC, 0xC, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6AF8, 0x10, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0119_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6B08, 0x14
		.4byte	AnimCmd_6, 0x0, 0xD06F3FA, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6B1C, 0xF, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6B2B, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6B3F, 0x14, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6B53, 0x14, 0x5, 0x9
		.4byte	AnimCmd_4
	anim_data__0119_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6B67, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6B77, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6B8B, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x6B9F, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x6BB3, 0x10, 0x2, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0119:
		.4byte anim_data__0119_0
		.4byte anim_data__0119_1
		.4byte anim_data__0119_2




.align 2, 0
	anim_data__0120_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6BC3, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6BD7, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6BEB, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6BFF, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6C17, 0x18, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0120:
		.4byte anim_data__0120_0




.align 2, 0
	anim_data__0121_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6C2F, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6C43, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6C2F, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6C57, 0x14, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6C2F, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6C43, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6C2F, 0x14, 0x1A, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6C6B, 0x10, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6C7B, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6C8F, 0x10, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6C9F, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6CAF, 0x10, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6CBF, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6CD3, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6CE3, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6CBF, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6CD3, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6CE3, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6CBF, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6CD3, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6CE3, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x6CF7, 0x10, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6D07, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x6D17, 0x10, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x6D27, 0x10, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x6D37, 0x10, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x6D47, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6D5B, 0x14, 0x5, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x6D6F, 0x19, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x6D88, 0x10, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x6D98, 0x14, 0xE, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x6DAC, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x6DC0, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x6DD4, 0xF, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x6DE3, 0xC, 0x2, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x6DEF, 0x10, 0x2, 0x19
		.4byte	AnimCmd_4
	anim_data__0121_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6DFF, 0x10, 0x1, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x6E0F, 0x10, 0x6, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x6E1F, 0x10, 0x3C, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x6E2F, 0x14, 0x4, 0x1D
		.4byte	AnimCmd_4

.align 2, 0
	anim_0121:
		.4byte anim_data__0121_0
		.4byte anim_data__0121_1




.align 2, 0
	anim_data__0122_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6E43, 0x19, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6E5C, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6E75, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6E8E, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6E9E, 0x19, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6EB7, 0x19, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6ED0, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6EE9, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x6E43, 0x19, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6E5C, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x6E75, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x6E8E, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x6E9E, 0x19, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x6EB7, 0x19, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x6ED0, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x6EE9, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6EFD, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x6F0D, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x6F21, 0x14, 0x2, 0xA
		.4byte	AnimCmd_4
	anim_data__0122_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6F35, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x6F4E, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x6F62, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x6F7B, 0x14, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0122_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6F8F, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x6FA3, 0x10, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6FB3, 0x10, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x6FC3, 0x10, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x6FD3, 0x10, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x6FE3, 0x10, 0x4, 0x14
		.4byte	AnimCmd_4

.align 2, 0
	anim_0122:
		.4byte anim_data__0122_0
		.4byte anim_data__0122_1
		.4byte anim_data__0122_2




.align 2, 0
	anim_data__0123_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x6FF3, 0xC, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x6FFF, 0xF, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x700E, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7022, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x7036, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x704A, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7036, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7022, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x705E, 0xF, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x706D, 0xC, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7079, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7089, 0x10, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7099, 0x10, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x70A9, 0x18, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x70C1, 0x14, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x70D5, 0x18, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x70ED, 0x10, 0x5, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x70FD, 0x10, 0x5, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x710D, 0x10, 0x5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x711D, 0x18, 0x5, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x7135, 0x14, 0x5, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x7149, 0x18, 0x5, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x70ED, 0x10, 0x5, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x7161, 0x10, 0x5, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x710D, 0x10, 0x5, 0x10
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0123:
		.4byte anim_data__0123_0




.align 2, 0
	anim_data__0124_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7171, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7185, 0x10, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7171, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7195, 0x14, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x71A9, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x71BD, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x71A9, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x71CD, 0x14, 0x6, 0x5
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0124_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x71E1, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x71F1, 0x10, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7201, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7211, 0x10, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7221, 0x10, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7231, 0x10, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x7221, 0x10, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7211, 0x10, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7241, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7241, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7241, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7241, 0x10, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7251, 0x10, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x7261, 0x10, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x7271, 0x10, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x7281, 0xC, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x728D, 0x10, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x729D, 0x10, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x72AD, 0x14, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x72C1, 0x14, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x72C1, 0x14, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x72C1, 0x14, 0x10, 0x14
		.4byte	AnimCmd_4

.align 2, 0
	anim_0124:
		.4byte anim_data__0124_0
		.4byte anim_data__0124_1




.align 2, 0
	anim_data__0125_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x72D5, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x72E9, 0xC, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x72F5, 0xF, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7304, 0xF, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x7313, 0xF, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7322, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7336, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x734F, 0xF, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x735E, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7372, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7382, 0x10, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7392, 0x14, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x73A6, 0x14, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x73BA, 0x14, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x73CE, 0x14, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x73E2, 0x14, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x73F6, 0x14, 0x3C, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0125:
		.4byte anim_data__0125_0




.align 2, 0
	anim_data__0126_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x740A, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x741E, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x742E, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x743E, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x744E, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x745E, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7472, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7482, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7496, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x74AF, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x74C3, 0x10, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x74D3, 0x10, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x74E3, 0x10, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x74F3, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x7472, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7482, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7496, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x74AF, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7507, 0x10, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x7517, 0x10, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x7527, 0x10, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x74F3, 0x14, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0x50

.align 2, 0
	anim_0126:
		.4byte anim_data__0126_0




.align 2, 0
	anim_data__0127_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7537, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0127_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7543, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0127_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7553, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0127_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7563, 0xC, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0127_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x756F, 0xF, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0127_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x757E, 0xF, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x758D, 0xF, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x759C, 0xF, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x75AB, 0xF, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x757E, 0xF, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0127:
		.4byte anim_data__0127_0
		.4byte anim_data__0127_1
		.4byte anim_data__0127_2
		.4byte anim_data__0127_3
		.4byte anim_data__0127_4
		.4byte anim_data__0127_5




.align 2, 0
	anim_data__0129_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x75BA, 0xC, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x75C6, 0xC, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x75D2, 0xC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x75C6, 0xC, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0129:
		.4byte anim_data__0129_0




.align 2, 0
	anim_data__0130_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x75DE, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x75F2, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7606, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x761A, 0x19, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x7633, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7647, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x765B, 0xF, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x766A, 0x14, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0130:
		.4byte anim_data__0130_0




.align 2, 0
	anim_data__0135_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x767E, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7692, 0xF, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x76A1, 0xF, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x76B0, 0xF, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x76A1, 0xF, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7692, 0xF, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0135:
		.4byte anim_data__0135_0




.align 2, 0
	anim_data__0139_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x76BF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x76D7, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x76EB, 0x10, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x76FB, 0x12, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x770D, 0x14, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0139_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x770D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7721, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7739, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x774D, 0x18, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7765, 0x18, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x777D, 0x18, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0139_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7795, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x77AD, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x77C1, 0x10, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x77D1, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x77E5, 0x18, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x77FD, 0x1C, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x7819, 0x1C, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7835, 0x1C, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0139:
		.4byte anim_data__0139_0
		.4byte anim_data__0139_1
		.4byte anim_data__0139_2




.align 2, 0
	anim_data__0140_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7851, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7869, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7881, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7895, 0x18, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0140_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x78AD, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x78BF, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x78D7, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x78F5, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x790D, 0x12, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x791F, 0x1E, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x793D, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7956, 0x18, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0140:
		.4byte anim_data__0140_0
		.4byte anim_data__0140_1




.align 2, 0
	anim_data__0141_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x796E, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7986, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x799A, 0x18, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x79B2, 0xC, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x79BE, 0x18, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0141_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x79D6, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x79EA, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x79FE, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7A12, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7A26, 0x10, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0141_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7A36, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7A4A, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x7A68, 0x1C, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7A84, 0x1C, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x7AA0, 0x1C, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x7ABC, 0x1C, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0141:
		.4byte anim_data__0141_0
		.4byte anim_data__0141_1
		.4byte anim_data__0141_2




.align 2, 0
	anim_data__0142_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7AD8, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7AF0, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7B04, 0x18, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7B1C, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x7B30, 0x18, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0142_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7B48, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7B5C, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7B70, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7B84, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA
		.4byte	AnimCmd_6, 0x1, 0xA0600FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7BA2, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7BC0, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0142:
		.4byte anim_data__0142_0
		.4byte anim_data__0142_1




.align 2, 0
	anim_data__0143_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7BDE, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7BF6, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7C0E, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7C26, 0x18, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0143_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7BDE, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7C3E, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7C56, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7C6A, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7C7A, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7C8E, 0x18, 0x4, 0x8
		.4byte	AnimCmd_4
	anim_data__0143_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7CA6, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7CC2, 0x1C, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7CDE, 0x1C, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0143:
		.4byte anim_data__0143_0
		.4byte anim_data__0143_1
		.4byte anim_data__0143_2




.align 2, 0
	anim_data__0144_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7CFA, 0x14
		.4byte	AnimCmd_6, 0x0, 0x506EFFA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7D0E, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7D22, 0xF, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7D31, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x7D45, 0x18, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7D5D, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7D76, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7D8A, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7D9E, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7DAE, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7DC2, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7DDB, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x7DF3, 0x1C, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x7E0F, 0x1C, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x7E2B, 0x1C, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0144:
		.4byte anim_data__0144_0




.align 2, 0
	anim_data__0145_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7E47, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7E57, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7E6B, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x7E7F, 0x14, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0145_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7E93, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x7EA7, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7EBB, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x7ECB, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x7EDF, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x7EF7, 0x1C, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x7F13, 0x1C, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x7F2F, 0x1C, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0145:
		.4byte anim_data__0145_0
		.4byte anim_data__0145_1




.align 2, 0
	anim_data__0146_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x7F4B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7F8B, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7FCB, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x800B, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x804B, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x808B, 0x40, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x7F4B, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x7F8B, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x7FCB, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x80CB, 0x40, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x810B, 0x40, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x814B, 0x40, 0x2, 0x8
		.4byte	AnimCmd_JumpBack, 0x42

.align 2, 0
	anim_0146:
		.4byte anim_data__0146_0




.align 2, 0
	anim_data__0148_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x818B, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0148_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x819F, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0148_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x81B3, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0148_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x81C7, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0148_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x81DB, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0148_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x81EF, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0148_6:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8203, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0148_7:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8217, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0148:
		.4byte anim_data__0148_0
		.4byte anim_data__0148_1
		.4byte anim_data__0148_2
		.4byte anim_data__0148_3
		.4byte anim_data__0148_4
		.4byte anim_data__0148_5
		.4byte anim_data__0148_6
		.4byte anim_data__0148_7




.align 2, 0
	anim_data__0149_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8227, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA0AFAF6, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x823B, 0x10, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x824B, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x825F, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x826F, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8283, 0x10, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8293, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x82A7, 0x10, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0149:
		.4byte anim_data__0149_0




.align 2, 0
	anim_data__0150_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x82B7, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1F0709F9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0150_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x82C9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x18FE04EC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0150_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x82DD, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFFB00E6, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0150_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x82EC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x8FAFBE5, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0150_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8300, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFCF1E8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0150_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8314, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFC00E8ED, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0150_6:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8323, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFA07E2F8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0150_7:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8335, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFB0EE601, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0150_8:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8349, 0x10
		.4byte	AnimCmd_6, 0x0, 0x215ED03, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0150_9:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8359, 0x12
		.4byte	AnimCmd_6, 0x0, 0x91FF807, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0150_10:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x836B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x121B0305, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0150_11:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x837F, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1B140702, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0150:
		.4byte anim_data__0150_0
		.4byte anim_data__0150_1
		.4byte anim_data__0150_2
		.4byte anim_data__0150_3
		.4byte anim_data__0150_4
		.4byte anim_data__0150_5
		.4byte anim_data__0150_6
		.4byte anim_data__0150_7
		.4byte anim_data__0150_8
		.4byte anim_data__0150_9
		.4byte anim_data__0150_10
		.4byte anim_data__0150_11




.align 2, 0
	anim_data__0151_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8393, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFA07E2F8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0151_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83A5, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFC00E8ED, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0151_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83B4, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFCF1E8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0151_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83C8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x8FAFBE5, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0151_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83DC, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFFB00E6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0151_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83EB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x18FE04EC, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0151_6:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x83FF, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1F0709F9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0151_7:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8411, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1B140702, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0151_8:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8425, 0x14
		.4byte	AnimCmd_6, 0x0, 0x121B0305, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0151_9:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8439, 0x12
		.4byte	AnimCmd_6, 0x0, 0x91FF807, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0151_10:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x844B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x215ED03, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0151_11:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x845B, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFB0EE601, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0151:
		.4byte anim_data__0151_0
		.4byte anim_data__0151_1
		.4byte anim_data__0151_2
		.4byte anim_data__0151_3
		.4byte anim_data__0151_4
		.4byte anim_data__0151_5
		.4byte anim_data__0151_6
		.4byte anim_data__0151_7
		.4byte anim_data__0151_8
		.4byte anim_data__0151_9
		.4byte anim_data__0151_10
		.4byte anim_data__0151_11




.align 2, 0
	anim_data__0152_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x846F, 0xF
		.4byte	AnimCmd_6, 0x0, 0x405EEF9, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x847E, 0xF, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x848D, 0xF, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x847E, 0xF, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0152:
		.4byte anim_data__0152_0




.align 2, 0
	anim_data__0153_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x849C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x18FE04F2, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x84B4, 0x14
		.4byte	AnimCmd_6, 0x0, 0x14FE04F2, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x84C8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x10FE02F2, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x84D8, 0x18
		.4byte	AnimCmd_6, 0x0, 0xCFEFEF2, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x84F0, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x2FEF4F2, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x850C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x2FEF4F2, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8520, 0xC
		.4byte	AnimCmd_6, 0x0, 0x8FEF8F2, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x852C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x14FE04F2, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x849C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x18FE04F2, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x84B4, 0x14
		.4byte	AnimCmd_6, 0x0, 0x14FE04F2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x84C8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x10FE02F2, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x84D8, 0x18
		.4byte	AnimCmd_6, 0x0, 0xCFEFEF2, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x84F0, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x2FEF4F2, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0153_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8544, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFDFEE9F2, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x855C, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFCFEECF2, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x8570, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFEFEEEF2, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x8580, 0x18
		.4byte	AnimCmd_6, 0x0, 0x4FEF6F2, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x8598, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xEFEFCF2, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x85B4, 0x14
		.4byte	AnimCmd_6, 0x0, 0xCFEFEF2, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x85C8, 0xC
		.4byte	AnimCmd_6, 0x0, 0x6FEF8F2, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x85D4, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFEECF2, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x8544, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFDFEE9F2, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x855C, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFCFEECF2, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x8570, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFEFEEEF2, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x8580, 0x18
		.4byte	AnimCmd_6, 0x0, 0x4FEF6F2, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x8598, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xEFEFCF2, 0x2, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0153:
		.4byte anim_data__0153_0
		.4byte anim_data__0153_1




.align 2, 0
	anim_data__0154_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x85EC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x50EF8FE, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x85FC, 0x18
		.4byte	AnimCmd_6, 0x0, 0xEF2FE, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8614, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFC0EECFE, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8630, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFC0EEEFE, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8640, 0x10
		.4byte	AnimCmd_6, 0x0, 0x60EF6FE, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8650, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xE0EFCFE, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x866C, 0x20
		.4byte	AnimCmd_6, 0x0, 0x120E00FE, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x868C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x100EFEFE, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x85EC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x50EF8FE, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0154_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x86A0, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EFAFE, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x86B0, 0x18
		.4byte	AnimCmd_6, 0x0, 0x120E02FE, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x86C8, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x180E04FE, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x86E4, 0x10
		.4byte	AnimCmd_6, 0x0, 0x120E00FE, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x86F4, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFAFE, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x8704, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x40EF4FE, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x8720, 0x20
		.4byte	AnimCmd_6, 0x0, 0x40EEEFE, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x8740, 0x14
		.4byte	AnimCmd_6, 0x0, 0x40EF2FE, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x86A0, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EFAFE, 0x2, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0154:
		.4byte anim_data__0154_0
		.4byte anim_data__0154_1




.align 2, 0
	anim_data__0155_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8754, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF505E3F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8760, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF5FBE3EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x877C, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF5F9E3ED, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8794, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF5FDE3F1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x87A8, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF505E3F9, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x87BC, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF50BE3FF, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x87D4, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF511E305, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x87F0, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF50FE303, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x8754, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF505E3F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8760, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF5FBE3EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x877C, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF5F9E3ED, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8794, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF5FDE3F1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x87A8, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF505E3F9, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0155:
		.4byte anim_data__0155_0




.align 2, 0
	anim_data__0156_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8804, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8818, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x882C, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8845, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x885D, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8875, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x888E, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x88AC, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0156_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x88C0, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x88D4, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x88E8, 0x10, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x88F8, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x890C, 0x18, 0x3, 0xC
		.4byte	AnimCmd_4
	anim_data__0156_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8924, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x8940, 0x1C, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x895C, 0x1C, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0156:
		.4byte anim_data__0156_0
		.4byte anim_data__0156_1
		.4byte anim_data__0156_2




.align 2, 0
	anim_data__0157_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8978, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE06E8FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x898C, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x89A5, 0x14, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0157_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x89B9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6EAFA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x89CD, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x89E1, 0xF, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x89F0, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8A04, 0x19, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0157_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8A1D, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406EEFA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x8A36, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x8A4F, 0x19, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0157:
		.4byte anim_data__0157_0
		.4byte anim_data__0157_1
		.4byte anim_data__0157_2




.align 2, 0
	anim_data__0158_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8A68, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC06F6FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8A7C, 0x10, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8A8C, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8AA0, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8AB0, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8AC4, 0x10, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8AD4, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8AE8, 0x10, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0158:
		.4byte anim_data__0158_0




.align 2, 0
	anim_data__0159_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8AF8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0159_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B0C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0159_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B20, 0xF
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0159_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B2F, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0159_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B43, 0x18
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0159_5:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B5B, 0x19
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0159_6:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B74, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0159_7:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B88, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0159_8:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8B9C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0159_9:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8BAC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0159_10:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8BC0, 0x19
		.4byte	AnimCmd_6, 0x0, 0x604F0FA, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0159:
		.4byte anim_data__0159_0
		.4byte anim_data__0159_1
		.4byte anim_data__0159_2
		.4byte anim_data__0159_3
		.4byte anim_data__0159_4
		.4byte anim_data__0159_5
		.4byte anim_data__0159_6
		.4byte anim_data__0159_7
		.4byte anim_data__0159_8
		.4byte anim_data__0159_9
		.4byte anim_data__0159_10




.align 2, 0
	anim_data__0160_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8BD9, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC04F8FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8BED, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8C01, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8C11, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8C25, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8C39, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8C49, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8C5D, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0160_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8C71, 0x14
		.4byte	AnimCmd_6, 0x0, 0x604F4FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x8C85, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x8C99, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x8CA9, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x8CBD, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x8CD1, 0x10, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x8CE1, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x8CF5, 0x14, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0160:
		.4byte anim_data__0160_0
		.4byte anim_data__0160_1




.align 2, 0
	anim_data__0161_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8D09, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8D19, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8D29, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8D39, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8D49, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8D59, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8D69, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8D79, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0161:
		.4byte anim_data__0161_0




.align 2, 0
	anim_data__0162_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8D89, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8DA2, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8DBB, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8DD4, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8DE4, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8DFD, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8E16, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8E2F, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0162_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8E43, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06ECFA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x8E57, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x8E6B, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x8E7F, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x8E6B, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x8E57, 0x14, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0162:
		.4byte anim_data__0162_0
		.4byte anim_data__0162_1




.align 2, 0
	anim_data__0163_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8E93, 0x18
		.4byte	AnimCmd_6, 0x0, 0x406EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8EAB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x4FEEEF1, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8EBF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x4FCEEEC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8ED3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x4FEEEF0, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8EE7, 0x10
		.4byte	AnimCmd_6, 0x0, 0x406EEF8, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8EF7, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x412EE04, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8F15, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x415EE06, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8F33, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x412EE03, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x43

.align 2, 0
	anim_0163:
		.4byte anim_data__0163_0




.align 2, 0
	anim_data__0164_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8F51, 0x14
		.4byte	AnimCmd_6, 0x0, 0xB06F1FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x8F65, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x8F79, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x8F8D, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x8FA1, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x8FB5, 0x10, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x8FC5, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x8FD5, 0x10, 0x4, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0164_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x8FE5, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x8FFE, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x9017, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x902B, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x903F, 0x19, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x9058, 0x14, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x906C, 0x14, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x9080, 0x19, 0x4, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0164_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9099, 0x19
		.4byte	AnimCmd_6, 0x0, 0x906EDFA, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x90B2, 0x19, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x90CB, 0x14, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x90DF, 0x14, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x90F3, 0x19, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x910C, 0x14, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x9120, 0x14, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x9134, 0x19, 0x4, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0164:
		.4byte anim_data__0164_0
		.4byte anim_data__0164_1
		.4byte anim_data__0164_2




.align 2, 0
	anim_data__0165_0:
		.4byte	AnimCmd_GetPalette, 0x8, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0165:
		.4byte anim_data__0165_0




.align 2, 0
	anim_data__0166_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x914D, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1206FEFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x918D, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x91CD, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0166:
		.4byte anim_data__0166_0




.align 2, 0
	anim_data__0176_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x920D, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0176_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x921D, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0176:
		.4byte anim_data__0176_0
		.4byte anim_data__0176_1




.align 2, 0
	anim_data__0177_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x922D, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9241, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9255, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9269, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x927D, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9291, 0x14, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0177_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x92A5, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x92B9, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x92CD, 0x10, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x92DD, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x92F1, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x9305, 0x10, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0177_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9315, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x9329, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x9342, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x9356, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x936A, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x937E, 0x14, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0177_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9392, 0x10, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x93A2, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x93B6, 0x10, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x93C6, 0x10, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x93D6, 0x10, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x93E6, 0x10, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0177:
		.4byte anim_data__0177_0
		.4byte anim_data__0177_1
		.4byte anim_data__0177_2
		.4byte anim_data__0177_3




.align 2, 0
	anim_data__0178_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x93F6, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9414, 0x19, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0178_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x942D, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0178_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x943D, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9456, 0x19, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0178_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x946F, 0x10, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0178:
		.4byte anim_data__0178_0
		.4byte anim_data__0178_1
		.4byte anim_data__0178_2
		.4byte anim_data__0178_3




.align 2, 0
	anim_data__0179_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x947F, 0x18, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9497, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x94AB, 0x10, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0179_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x94BB, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x94CF, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x94E3, 0x18, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0179:
		.4byte anim_data__0179_0
		.4byte anim_data__0179_1




.align 2, 0
	anim_data__0180_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x94FB, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x950B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x951B, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x952B, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x953B, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x954B, 0x10, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0180:
		.4byte anim_data__0180_0




.align 2, 0
	anim_data__0181_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x955B, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x956B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x957B, 0xC, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9587, 0xC, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9593, 0xC, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x959F, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x95AF, 0xC, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x95BB, 0xC, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x95C7, 0xC, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x95D3, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x95E3, 0x10, 0x3, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0181:
		.4byte anim_data__0181_0




.align 2, 0
	anim_data__0182_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x95F3, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x960B, 0x18, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9623, 0x1E, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9641, 0x18, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9659, 0x18, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9671, 0x18, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9689, 0x1E, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x96A7, 0x18, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x95F3, 0x18, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x96BF, 0x18, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x96D7, 0x1E, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x96F5, 0x18, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x9659, 0x18, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9671, 0x18, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9689, 0x1E, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x96A7, 0x18, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0182:
		.4byte anim_data__0182_0




.align 2, 0
	anim_data__0183_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x970D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9721, 0x19, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x973A, 0x19, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9753, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9767, 0x14, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x977B, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x978F, 0x18, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x97A7, 0x18, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x97BF, 0x18, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x97D7, 0x14, 0x12, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x97EB, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x97FF, 0x19, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x9818, 0x19, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x9831, 0x14, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x9845, 0x14, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x9859, 0x14, 0x6, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x986D, 0x14, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9881, 0x18, 0xA, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x9899, 0x1C, 0xA, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x98B5, 0x18, 0xA, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x98CD, 0x1C, 0xA, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x98E9, 0x18, 0xA, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x9901, 0x18, 0xA, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x9919, 0x18, 0xA, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x9931, 0x18, 0xA, 0x18
		.4byte	AnimCmd_JumpBack, 0x28
	anim_data__0183_1:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9949, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x9961, 0x18, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x9979, 0x14, 0x4, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x998D, 0x14, 0x4, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x99A1, 0x14, 0x4, 0x1D
		.4byte	AnimCmd_4

.align 2, 0
	anim_0183:
		.4byte anim_data__0183_0
		.4byte anim_data__0183_1




.align 2, 0
	anim_data__0184_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x99B5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x99C9, 0x18, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x99E1, 0x12, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x99F3, 0x12, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9A05, 0x12, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9A17, 0x12, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9A29, 0x12, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9A3B, 0x12, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x9A4D, 0x12, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x9A5F, 0x12, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x99E1, 0x12, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x99F3, 0x12, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9A05, 0x12, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9A17, 0x12, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9A71, 0x12, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x9A83, 0x12, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x9A95, 0x12, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x9A5F, 0x12, 0x6, 0x9
		.4byte	AnimCmd_JumpBack, 0x50
	anim_data__0184_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x99C9, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x99B5, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0184:
		.4byte anim_data__0184_0
		.4byte anim_data__0184_1




.align 2, 0
	anim_data__0185_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9AA7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9ABF, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9AD7, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9AEF, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9B07, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9B1F, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9B37, 0x1C, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9B53, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0185_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9AA7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9ABF, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9AD7, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9AEF, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9B07, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9B1F, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9B37, 0x1C, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9B53, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0185:
		.4byte anim_data__0185_0
		.4byte anim_data__0185_1




.align 2, 0
	anim_data__0186_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9B6B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9B7B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9B8B, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9B9B, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9B6B, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9B7B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9B8B, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9B9B, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0186_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9BAB, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9BBB, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9BCB, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9BDB, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x9BEB, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x9BFB, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x9C0B, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x9C1B, 0x10, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0186:
		.4byte anim_data__0186_0
		.4byte anim_data__0186_1




.align 2, 0
	anim_data__0187_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9C2B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9C3F, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0187:
		.4byte anim_data__0187_0




.align 2, 0
	anim_data__0188_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9C53, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9C6B, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9C7F, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9C93, 0x10, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0188:
		.4byte anim_data__0188_0




.align 2, 0
	anim_data__0189_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9CA3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9CB7, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9CCB, 0x14, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0189_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9CDF, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0189:
		.4byte anim_data__0189_0
		.4byte anim_data__0189_1




.align 2, 0
	anim_data__0190_0:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9CF7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9D0F, 0x1C, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9D2B, 0x1C, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0190_1:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9CF7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9D47, 0x18, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0190:
		.4byte anim_data__0190_0
		.4byte anim_data__0190_1




.align 2, 0
	anim_data__0191_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x9D5F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9D9F, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x9DDF, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x9E1F, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x9E5F, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9E9F, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9EDF, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9F1F, 0x40, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x9D5F, 0x40, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x9F5F, 0x40, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x9F9F, 0x40, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x9FDF, 0x40, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x9E5F, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x9E9F, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x9EDF, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x9F1F, 0x40, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0191_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA01F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xA05F, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xA09F, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xA0DF, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xA11F, 0x40, 0x8, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xA15F, 0x40, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA19F, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xA1DF, 0x40, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xA01F, 0x40, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xA21F, 0x40, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xA25F, 0x40, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xA29F, 0x40, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xA11F, 0x40, 0x8, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xA15F, 0x40, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA19F, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xA1DF, 0x40, 0x8, 0x12
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0191_2:
		.4byte	AnimCmd_GetPalette, 0xC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA2DF, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xA31F, 0x40, 0x8, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xA35F, 0x40, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xA39F, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xA3DF, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xA41F, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xA45F, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0xA49F, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0xA2DF, 0x40, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xA4DF, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0xA51F, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0xA55F, 0x40, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0xA3DF, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xA41F, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xA45F, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0xA49F, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0191_3:
		.4byte	AnimCmd_GetPalette, 0xD, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA59F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xA5DF, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0xA61F, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0xA65F, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0xA69F, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xA6DF, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xA71F, 0x40, 0x8, 0x27
		.4byte	AnimCmd_GetTileIndex, 0xA75F, 0x40, 0x8, 0x28
		.4byte	AnimCmd_GetTileIndex, 0xA59F, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xA79F, 0x40, 0x8, 0x29
		.4byte	AnimCmd_GetTileIndex, 0xA7DF, 0x40, 0x8, 0x2A
		.4byte	AnimCmd_GetTileIndex, 0xA81F, 0x40, 0x8, 0x2B
		.4byte	AnimCmd_GetTileIndex, 0xA69F, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xA6DF, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xA71F, 0x40, 0x8, 0x27
		.4byte	AnimCmd_GetTileIndex, 0xA75F, 0x40, 0x8, 0x28
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0191_4:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA85F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0xA89F, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xA91F, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0xA85F, 0x40, 0x8, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0xA95F, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xA99F, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0xA9DF, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0xAA1F, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0xAA5F, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0xAA9F, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0xA9DF, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0xA89F, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xAADF, 0x40, 0x8, 0x36
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0191_5:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xA85F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x8, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0xA89F, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xA91F, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0xA85F, 0x40, 0x8, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0xA95F, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xA99F, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0xA9DF, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0xAA1F, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0xAA5F, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0xAA9F, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0xA9DF, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0xA89F, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0xA8DF, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0xAADF, 0x40, 0x8, 0x36
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0191:
		.4byte anim_data__0191_0
		.4byte anim_data__0191_1
		.4byte anim_data__0191_2
		.4byte anim_data__0191_3
		.4byte anim_data__0191_4
		.4byte anim_data__0191_5




.align 2, 0
	anim_data__0192_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAB1F, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406EEFA
		.4byte	AnimCmd_6, 0x1, 0x406EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xAB33, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1007FAFB
		.4byte	AnimCmd_6, 0x1, 0x1007FAFB, 0x3, 0x1
		.4byte	AnimCmd_4
	anim_data__0192_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAB47, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xAB57, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xAB67, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xAB77, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xAB87, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xAB97, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xABA7, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xABB7, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0192_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xABC7, 0x14
		.4byte	AnimCmd_6, 0x0, 0x606F0FA
		.4byte	AnimCmd_6, 0x1, 0xC0AF8F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xABDB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406EEF8
		.4byte	AnimCmd_6, 0x1, 0x909F7F7, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xABEF, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xAC08, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xAC26, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xAC44, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0192:
		.4byte anim_data__0192_0
		.4byte anim_data__0192_1
		.4byte anim_data__0192_2




.align 2, 0
	anim_data__0193_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAC62, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406EEFA
		.4byte	AnimCmd_6, 0x1, 0x406EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xAC76, 0x14, 0x3, 0x1
		.4byte	AnimCmd_4
	anim_data__0193_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAC8A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xAC9A, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xACAA, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xACBA, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xACCA, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xACDA, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xACEA, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xACFA, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0193_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAD0A, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406EEFA
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xAD1E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406EEF8
		.4byte	AnimCmd_6, 0x1, 0x909F7F7, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xAD32, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xAD4B, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xAD69, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xAD87, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0193:
		.4byte anim_data__0193_0
		.4byte anim_data__0193_1
		.4byte anim_data__0193_2




.align 2, 0
	anim_data__0194_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xADA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1008F6F8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xADB9, 0x18, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xADD1, 0x12, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xADE3, 0x18, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0194:
		.4byte anim_data__0194_0




.align 2, 0
	anim_data__0195_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xADFB, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC06F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xAE0F, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xAE28, 0x23, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xAE4B, 0x23, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xAE6E, 0x23, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0195:
		.4byte anim_data__0195_0




.align 2, 0
	anim_data__0196_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAE91, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xAEA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1002F6F6, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xAEB9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1000F6F4
		.4byte	AnimCmd_PlaySoundEffect, 0x79, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xAECD, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA
		.4byte	AnimCmd_6, 0x1, 0x10FAF6EC, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xAEE1, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x10FEF6F2
		.4byte	AnimCmd_6, 0x1, 0x10F4F6D0, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xAEFD, 0x18
		.4byte	AnimCmd_6, 0x0, 0x10FEF6F2
		.4byte	AnimCmd_6, 0x1, 0x10F2F6D8, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xAF15, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xAF2D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xAF3D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x3, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0196:
		.4byte anim_data__0196_0




.align 2, 0
	anim_data__0198_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xAF51, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xAF65, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xAF79, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xAF8D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8
		.4byte	AnimCmd_6, 0x1, 0x1000FDE9, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xAFA1, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8
		.4byte	AnimCmd_6, 0x1, 0x1000F8DD, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xAFBD, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8
		.4byte	AnimCmd_6, 0x1, 0xF00F7E0, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xAFD5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xAFE9, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1004F6F8, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0198_1:
		.4byte	AnimCmd_GetPalette, 0xE, 0x500010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetTileIndex, 0xAFF9, 0xC, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB005, 0x18, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xB01D, 0x10, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB02D, 0x9, 0x4, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0198:
		.4byte anim_data__0198_0
		.4byte anim_data__0198_1




.align 2, 0
	anim_data__0201_0:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB036, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA05F4F9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB048, 0x19, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB061, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB075, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB089, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB09D, 0x1E, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB0BB, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB0D4, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB0E8, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB0FC, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xB11A, 0x19, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB133, 0x19, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xB14C, 0x14, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xB160, 0x19, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xB179, 0x23, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xB19C, 0x23, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xB1BF, 0x23, 0x2, 0x10
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0201:
		.4byte anim_data__0201_0




.align 2, 0
	anim_data__0202_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB1E2, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA
		.4byte	AnimCmd_6, 0x1, 0xF516E9EB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB1F6, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB20A, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB228, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB241, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB255, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB269, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB287, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB1E2, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB1F6, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB20A, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB228, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB2A0, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB2B4, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xB2C8, 0x1E, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB287, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x59

.align 2, 0
	anim_0202:
		.4byte anim_data__0202_0




.align 2, 0
	anim_data__0203_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB2E6, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA
		.4byte	AnimCmd_6, 0x1, 0xF511EDEF, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB2FF, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA
		.4byte	AnimCmd_6, 0x1, 0xF511EDEF, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0203:
		.4byte anim_data__0203_0




.align 2, 0
	anim_data__0204_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB318, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB331, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB349, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB367, 0x1E, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB385, 0x1E, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB3A3, 0x1E, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB349, 0x1E, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB367, 0x1E, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB385, 0x1E, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB3A3, 0x1E, 0x6, 0x5
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0204:
		.4byte anim_data__0204_0




.align 2, 0
	anim_data__0210_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB3C1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1006F4F6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB3D9, 0x14, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB3ED, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB401, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB415, 0x14, 0x8, 0x4
		.4byte	AnimCmd_4
	anim_data__0210_1:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB429, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1308F7F8, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB43D, 0x10, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB44D, 0xF, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB45C, 0x10, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB46C, 0x10, 0x5, 0x9
		.4byte	AnimCmd_4
	anim_data__0210_2:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB47C, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB490, 0x19, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xB4A9, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xB4BD, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xB4D1, 0x14, 0x2, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0210:
		.4byte anim_data__0210_0
		.4byte anim_data__0210_1
		.4byte anim_data__0210_2




.align 2, 0
	anim_data__0211_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB4E5, 0x19, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB4FE, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB4E5, 0x19, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB512, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB52B, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB53F, 0x14, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0211:
		.4byte anim_data__0211_0




.align 2, 0
	anim_data__0212_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB553, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB563, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB577, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB58B, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB59F, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB5B3, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB5C7, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB563, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB553, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB563, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB577, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB58B, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB59F, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB5B3, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB5DB, 0x14, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB5EF, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB603, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xB61C, 0x14, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB630, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xB644, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xB630, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xB61C, 0x14, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB658, 0x10, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xB668, 0x19, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xB681, 0x14, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xB695, 0x14, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB6A9, 0x14, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xB6BD, 0x14, 0x10, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xB6D1, 0x14, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xB6E5, 0x14, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xB6F9, 0x14, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xB70D, 0x14, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xB721, 0x14, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xB735, 0x14, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xB6F9, 0x14, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xB749, 0x14, 0x6, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xB75D, 0x18, 0x2, 0x1A
		.4byte	AnimCmd_JumpBack, 0xBF
	anim_data__0212_1:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB775, 0x14, 0x1, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xB789, 0x14, 0x6, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0xB79D, 0x18, 0x3C, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0xB7B5, 0x18, 0x4, 0x1E
		.4byte	AnimCmd_4

.align 2, 0
	anim_0212:
		.4byte anim_data__0212_0
		.4byte anim_data__0212_1




.align 2, 0
	anim_data__0213_0:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB7CD, 0x14, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0213_1:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB7E1, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB7F5, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB80E, 0x19, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB7F5, 0x19, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0213_2:
		.4byte	AnimCmd_GetPalette, 0xB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB827, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB83B, 0x18, 0x2, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0213:
		.4byte anim_data__0213_0
		.4byte anim_data__0213_1
		.4byte anim_data__0213_2




.align 2, 0
	anim_data__0214_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB853, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB867, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB87B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB88F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB8A3, 0x14, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB8B7, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB8CB, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB8DF, 0x19, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB8F8, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB90C, 0x14, 0xC, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0214:
		.4byte anim_data__0214_0




.align 2, 0
	anim_data__0215_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xB920, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xB934, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xB952, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xB966, 0xC, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xB972, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xB982, 0x19, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xB99B, 0x18, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xB9B3, 0xC, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xB9BF, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xB9CF, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xB9E3, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xB9F7, 0x10, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xBA07, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xBA17, 0x10, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xBA27, 0x10, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xBA37, 0x14, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xBA4B, 0x14, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBA5F, 0x14, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xBA73, 0x14, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xBA87, 0x19, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xBAA0, 0x14, 0x10, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xBAB4, 0x10, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xBAC4, 0x14, 0x6, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xBAD8, 0x19, 0x5, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xBAF1, 0x19, 0x5, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xBB0A, 0x19, 0x5, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xBB23, 0x14, 0x5, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xBAB4, 0x10, 0x5, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xBB37, 0x14, 0x5, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xBAD8, 0x19, 0x5, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xBAF1, 0x19, 0x5, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xBB0A, 0x19, 0x5, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xBB23, 0x14, 0x5, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xBAB4, 0x10, 0x5, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xBAC4, 0x14, 0x5, 0x16
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0215:
		.4byte anim_data__0215_0




.align 2, 0
	anim_data__0216_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBB4B, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xBB5B, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xBB6B, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xBB7F, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xBB93, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xBBA7, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xBBC0, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xBBD4, 0x19, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xBBED, 0x19, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xBC06, 0x19, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xBC1F, 0x1E, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xBC3D, 0x19, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xBC56, 0x1E, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xBC74, 0x1E, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xBC92, 0x1E, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xBCB0, 0x1E, 0x6, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xBCCE, 0x1E, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBCEC, 0x1E, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xBD0A, 0x1E, 0x6, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xBD28, 0x1E, 0x6, 0x13
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0216:
		.4byte anim_data__0216_0




.align 2, 0
	anim_data__0217_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBD46, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xBD5A, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xBD6E, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xBD86, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xBD9E, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xBDB6, 0x18, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xBDCE, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xBDE6, 0x18, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xBDFE, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xBE12, 0x14, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0217:
		.4byte anim_data__0217_0




.align 2, 0
	anim_data__0218_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBE26, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0218_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBE3A, 0x19, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0218_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBE53, 0x14, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0218_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xBE67, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xBE7B, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xBE8F, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xBEA3, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xBEB7, 0x14, 0x6, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0218:
		.4byte anim_data__0218_0
		.4byte anim_data__0218_1
		.4byte anim_data__0218_2
		.4byte anim_data__0218_3




.align 2, 0
	anim_data__0222_0:
		.4byte	AnimCmd_GetPalette, 0xF, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0xBECB, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xBEE9, 0x1E, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xBF07, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xBF25, 0x1E, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0222_1:
		.4byte	AnimCmd_GetPalette, 0xF, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0xBF43, 0x19, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0222:
		.4byte anim_data__0222_0
		.4byte anim_data__0222_1




.align 2, 0
	anim_data__0223_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0xBF5C, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA
		.4byte	AnimCmd_6, 0x1, 0xF516EDEB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xBF70, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xBF84, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xBFA2, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xBFBB, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xBFCF, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xBFE3, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC001, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xBF5C, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xBF70, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xBF84, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xBFA2, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xC01A, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xC02E, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC042, 0x1E, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xC001, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x59
	anim_data__0223_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0xC060, 0x10, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xC070, 0x18, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC088, 0x18, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xC0A0, 0x18, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xC0B8, 0x24, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xC0DC, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC0FA, 0x18, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xC112, 0x14, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xC126, 0x1E, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xC144, 0x1E, 0x2, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xC162, 0x24, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xC186, 0x19, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xC19F, 0x14, 0x2, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xC1B3, 0x14, 0x2, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xC1C7, 0x1E, 0x2, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xC1E5, 0x19, 0x2, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xC1FE, 0x14, 0x2, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xC212, 0x18, 0x2, 0x1C
		.4byte	AnimCmd_JumpBack, 0x50

.align 2, 0
	anim_0223:
		.4byte anim_data__0223_0
		.4byte anim_data__0223_1




.align 2, 0
	anim_data__0230_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC22A, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC242, 0x14, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xC256, 0x19, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xC26F, 0x14, 0x8, 0x3
		.4byte	AnimCmd_4
	anim_data__0230_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC283, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xC297, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xC2AB, 0x1C, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC2C7, 0x1C, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC2E3, 0x1C, 0x4, 0x8
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0230_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC2FF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC317, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xC330, 0x19, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xC349, 0x23, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC36C, 0x23, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xC38F, 0x23, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0230:
		.4byte anim_data__0230_0
		.4byte anim_data__0230_1
		.4byte anim_data__0230_2




.align 2, 0
	anim_data__0231_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC3B2, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC3CA, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xC3E3, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xC3F7, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xC40B, 0x18, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0231_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC423, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xC437, 0x14, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC44B, 0x19, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC464, 0x14, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xC478, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC491, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xC4A5, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xC4BE, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC4D2, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xC4E6, 0x19, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xC4FF, 0x19, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xC518, 0x14, 0x3, 0x10
		.4byte	AnimCmd_JumpBack, 0x28
	anim_data__0231_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC52C, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xC545, 0x1E, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xC563, 0x1E, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xC581, 0x1E, 0x3, 0x14
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0231:
		.4byte anim_data__0231_0
		.4byte anim_data__0231_1
		.4byte anim_data__0231_2




.align 2, 0
	anim_data__0232_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC59F, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC5BB, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xC5D9, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xC5F7, 0x14, 0x4, 0x3
		.4byte	AnimCmd_4
	anim_data__0232_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC60B, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xC624, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xC642, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC65B, 0x23
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA
		.4byte	AnimCmd_6, 0x1, 0xA1700F2, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC67E, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xC697, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC6B0, 0x19, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0232_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC6C9, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xC6E2, 0x1E, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xC700, 0x19, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xC719, 0x14, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xC72D, 0x18, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xC745, 0x19, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC75E, 0x19, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xC777, 0x1E, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xC795, 0x1E, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xC7B3, 0x1E, 0x3, 0x14
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0232:
		.4byte anim_data__0232_0
		.4byte anim_data__0232_1
		.4byte anim_data__0232_2




.align 2, 0
	anim_data__0233_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC7D1, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC7E9, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xC801, 0x14, 0x4, 0x2
		.4byte	AnimCmd_4
	anim_data__0233_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC815, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xC825, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xC839, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xC84D, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC86B, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC884, 0x1E, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xC8A2, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC84D, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC86B, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC884, 0x1E, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xC8A2, 0x19, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0233:
		.4byte anim_data__0233_0
		.4byte anim_data__0233_1




.align 2, 0
	anim_data__0234_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC8BB, 0x15
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC8D0, 0x15, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xC8E5, 0x15, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0234_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC8FA, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xC90C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806F2FA, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xC924, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xC938, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xC94C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x606F0FA, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xC960, 0x19
		.4byte	AnimCmd_6, 0x0, 0x606F2FA, 0x4, 0x8
		.4byte	AnimCmd_4
	anim_data__0234_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC979, 0x23
		.4byte	AnimCmd_6, 0x0, 0x606F0FA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xC99C, 0x23, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xC9BF, 0x23, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0234:
		.4byte anim_data__0234_0
		.4byte anim_data__0234_1
		.4byte anim_data__0234_2




.align 2, 0
	anim_data__0235_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xC9E2, 0x19
		.4byte	AnimCmd_6, 0x0, 0xB06F5FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xC9FB, 0x19, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xCA14, 0x18, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xCA2C, 0x18, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xCA44, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xCA58, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xCA71, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xCA85, 0x18, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xCA9D, 0x23, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xCAC0, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xCAD4, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xCAED, 0x23, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xCB10, 0x23, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xCB33, 0x23, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0235:
		.4byte anim_data__0235_0




.align 2, 0
	anim_data__0236_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCB56, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xCB6A, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC06F6FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xCB83, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xCB9C, 0x19, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0236_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCBB5, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC06F6FA, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xCBCE, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xCBEC, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xCC05, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xCC1E, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xCC32, 0x19, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xCC4B, 0x1E, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xCC69, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xCC87, 0x1E, 0x2, 0xC
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0236:
		.4byte anim_data__0236_0
		.4byte anim_data__0236_1




.align 2, 0
	anim_data__0237_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCCA5, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xCCE5, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xCD25, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0237:
		.4byte anim_data__0237_0




.align 2, 0
	anim_data__0239_0:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCD65, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0239_1:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCD7D, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0239_2:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCD99, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0239_3:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCDB1, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0239_4:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCDCD, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0239_5:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCDE9, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0239_6:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCE01, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0239_7:
		.4byte	AnimCmd_GetPalette, 0x10, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCE19, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0239:
		.4byte anim_data__0239_0
		.4byte anim_data__0239_1
		.4byte anim_data__0239_2
		.4byte anim_data__0239_3
		.4byte anim_data__0239_4
		.4byte anim_data__0239_5
		.4byte anim_data__0239_6
		.4byte anim_data__0239_7




.align 2, 0
	anim_data__0240_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xCE31, 0x40
		.4byte	AnimCmd_6, 0x0, 0xA0AFAF6, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xCE71, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xCEB1, 0x40, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xCEF1, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xCF31, 0x40, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xCF71, 0x40, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xCFB1, 0x40, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xCFF1, 0x40, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0240:
		.4byte anim_data__0240_0




.align 2, 0
	anim_data__0241_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD031, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1F0709F9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0241_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD04F, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x18FE04EC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0241_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD06D, 0x24
		.4byte	AnimCmd_6, 0x0, 0xFFB00E6, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0241_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD091, 0x18
		.4byte	AnimCmd_6, 0x0, 0x8FAFBE5, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0241_4:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD0A9, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFCF1E8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0241_5:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD0C7, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFC00E8ED, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0241_6:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD0E5, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFA07E2F8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0241_7:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD103, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFB0EE601, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0241_8:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD121, 0x19
		.4byte	AnimCmd_6, 0x0, 0x215ED03, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0241_9:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD13A, 0x19
		.4byte	AnimCmd_6, 0x0, 0x91FF807, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0241_10:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD153, 0x19
		.4byte	AnimCmd_6, 0x0, 0x121B0305, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0241_11:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD16C, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1B140702, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0241:
		.4byte anim_data__0241_0
		.4byte anim_data__0241_1
		.4byte anim_data__0241_2
		.4byte anim_data__0241_3
		.4byte anim_data__0241_4
		.4byte anim_data__0241_5
		.4byte anim_data__0241_6
		.4byte anim_data__0241_7
		.4byte anim_data__0241_8
		.4byte anim_data__0241_9
		.4byte anim_data__0241_10
		.4byte anim_data__0241_11




.align 2, 0
	anim_data__0242_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD190, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFA07E2F8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0242_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD1AC, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFC00E8ED, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0242_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD1CA, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFCF1E8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0242_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD1E8, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x8FAFBE5, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0242_4:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD206, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFFB00E6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0242_5:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD21E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x18FE04EC, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0242_6:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD232, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1F0709F9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0242_7:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD24E, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1B140702, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0242_8:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD272, 0x18
		.4byte	AnimCmd_6, 0x0, 0x121B0305, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0242_9:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD28A, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x91FF807, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0242_10:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD2A6, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x215ED03, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0242_11:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD2C4, 0x15
		.4byte	AnimCmd_6, 0x0, 0xFB0EE601, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0242:
		.4byte anim_data__0242_0
		.4byte anim_data__0242_1
		.4byte anim_data__0242_2
		.4byte anim_data__0242_3
		.4byte anim_data__0242_4
		.4byte anim_data__0242_5
		.4byte anim_data__0242_6
		.4byte anim_data__0242_7
		.4byte anim_data__0242_8
		.4byte anim_data__0242_9
		.4byte anim_data__0242_10
		.4byte anim_data__0242_11




.align 2, 0
	anim_data__0243_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD2D9, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x405EEF9, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD2F5, 0x1C, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD311, 0x1C, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD2F5, 0x1C, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0243:
		.4byte anim_data__0243_0




.align 2, 0
	anim_data__0244_0:
		.4byte	AnimCmd_GetPalette, 0x11, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD32D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180604FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD345, 0x14
		.4byte	AnimCmd_6, 0x0, 0x140604FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD359, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100602FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD371, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC06FEFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD389, 0x18
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xD3A1, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xD3B1, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x806F8FA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xD3CF, 0x18
		.4byte	AnimCmd_6, 0x0, 0x140604FA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xD32D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180604FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD345, 0x14
		.4byte	AnimCmd_6, 0x0, 0x140604FA, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD359, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100602FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD371, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC06FEFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD389, 0x18
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0244_1:
		.4byte	AnimCmd_GetPalette, 0x11, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD3E7, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFD06E9FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xD3FF, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFC06ECFA, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xD413, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06EEFA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xD42B, 0x18
		.4byte	AnimCmd_6, 0x0, 0x406F6FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD443, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06FCFA, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xD45B, 0x10
		.4byte	AnimCmd_6, 0x0, 0xC06FEFA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xD46B, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x606F8FA, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xD489, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6ECFA, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xD3E7, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFD06E9FA, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xD3FF, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFC06ECFA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xD413, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06EEFA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xD42B, 0x18
		.4byte	AnimCmd_6, 0x0, 0x406F6FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD443, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06FCFA, 0x2, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0244:
		.4byte anim_data__0244_0
		.4byte anim_data__0244_1




.align 2, 0
	anim_data__0245_0:
		.4byte	AnimCmd_GetPalette, 0x12, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD4A1, 0x14
		.4byte	AnimCmd_6, 0x0, 0x50EF8FE, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD4B5, 0x12
		.4byte	AnimCmd_6, 0x0, 0xEF2FE, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD4C7, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFC0EECFE, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD4DF, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFC0EEEFE, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD4F8, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE0EFEFE, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xD510, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE10FC00, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xD528, 0x14
		.4byte	AnimCmd_6, 0x0, 0x120E00FE, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xD53C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100EFEFE, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xD4A1, 0x14
		.4byte	AnimCmd_6, 0x0, 0x50EF8FE, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0245_1:
		.4byte	AnimCmd_GetPalette, 0x12, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD54C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x80EFAFE, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xD560, 0x12
		.4byte	AnimCmd_6, 0x0, 0x120E02FE, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xD572, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180E04FE, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xD58A, 0x19
		.4byte	AnimCmd_6, 0x0, 0x120E00FE, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD5A3, 0x18
		.4byte	AnimCmd_6, 0x0, 0x20EF2FE, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xD5BB, 0x18
		.4byte	AnimCmd_6, 0x0, 0x410F400, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xD5D3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x40EEEFE, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xD5E7, 0x10
		.4byte	AnimCmd_6, 0x0, 0x40EF2FE, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xD54C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x80EFAFE, 0x2, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0245:
		.4byte anim_data__0245_0
		.4byte anim_data__0245_1




.align 2, 0
	anim_data__0246_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD5F7, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF405E2F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD60B, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF4FBE2EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD61D, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF4F9E2ED, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD635, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF4FDE2F1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD64E, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF405E2F9, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xD667, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF40BE2FF, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xD67F, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF411E205, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xD697, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF40FE203, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xD5F7, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF405E2F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD60B, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF4FBE2EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD61D, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF4F9E2ED, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD635, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF4FDE2F1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD64E, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF405E2F9, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0246:
		.4byte anim_data__0246_0




.align 2, 0
	anim_data__0247_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD6AB, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD6C3, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD6E1, 0x24, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xD705, 0x24, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD729, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xD741, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xD75F, 0x24, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xD783, 0x1E, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0247_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD7A1, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806F2FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xD7B5, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xD7C9, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xD7DD, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xD7F1, 0x19, 0x3, 0xC
		.4byte	AnimCmd_4
	anim_data__0247_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD80A, 0x23
		.4byte	AnimCmd_6, 0x0, 0xB08F2FA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xD82D, 0x23, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xD850, 0x23, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0247:
		.4byte anim_data__0247_0
		.4byte anim_data__0247_1
		.4byte anim_data__0247_2




.align 2, 0
	anim_data__0248_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD873, 0x23
		.4byte	AnimCmd_6, 0x0, 0xFE06E8FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD896, 0x23, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD8B9, 0x23, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0248_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD8DC, 0x19
		.4byte	AnimCmd_6, 0x0, 0x6EAFA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xD8F5, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xD909, 0x19, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xD922, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xD936, 0x1E, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0248_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD954, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x406EEFA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xD972, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xD990, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0248:
		.4byte anim_data__0248_0
		.4byte anim_data__0248_1
		.4byte anim_data__0248_2




.align 2, 0
	anim_data__0249_0:
		.4byte	AnimCmd_GetPalette, 0x13, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xD9AE, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xC06F6FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xD9CC, 0x18, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xD9E4, 0x1E, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xDA02, 0x18, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xDA1A, 0x1E, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xDA38, 0x1E, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xDA56, 0x1E, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xDA74, 0x1E, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0249:
		.4byte anim_data__0249_0




.align 2, 0
	anim_data__0250_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDA92, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0250_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDAAB, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0250_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDAC4, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0250_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDADC, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0250_4:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDAF4, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0250_5:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB08, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0250_6:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB21, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0250_7:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB35, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0250_8:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB4D, 0x23
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0250_9:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB70, 0x14
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0250_10:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB84, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC04F6FA, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0250:
		.4byte anim_data__0250_0
		.4byte anim_data__0250_1
		.4byte anim_data__0250_2
		.4byte anim_data__0250_3
		.4byte anim_data__0250_4
		.4byte anim_data__0250_5
		.4byte anim_data__0250_6
		.4byte anim_data__0250_7
		.4byte anim_data__0250_8
		.4byte anim_data__0250_9
		.4byte anim_data__0250_10




.align 2, 0
	anim_data__0251_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDB9D, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xC04F8FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xDBBB, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xDBD9, 0x23, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xDBFC, 0x1E, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xDC1A, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xDC38, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xDC56, 0x1C, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xDC72, 0x1E, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0251_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDC90, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x604F4FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xDCAE, 0x1E, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xDCCC, 0x23, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xDCEF, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xDD0D, 0x1E, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xDD2B, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xDD49, 0x1C, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xDD65, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0251:
		.4byte anim_data__0251_0
		.4byte anim_data__0251_1




.align 2, 0
	anim_data__0252_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDD83, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xDD93, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xDDA3, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xDDB3, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xDDC3, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xDDD3, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xDDE3, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xDDF3, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0252:
		.4byte anim_data__0252_0




.align 2, 0
	anim_data__0253_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDE03, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xDE21, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xDE3F, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xDE5D, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xDE71, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xDE8F, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xDEAD, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xDECB, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0253_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDEE3, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA06ECFA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xDEF5, 0x12, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xDF07, 0x12, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xDF19, 0x12, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xDF07, 0x12, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xDEF5, 0x12, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0253:
		.4byte anim_data__0253_0
		.4byte anim_data__0253_1




.align 2, 0
	anim_data__0254_0:
		.4byte	AnimCmd_GetPalette, 0x14, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDF2B, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xDF44, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x4FEEEF1, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xDF62, 0x19
		.4byte	AnimCmd_6, 0x0, 0x4FCEEEC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xDF7B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x4FEEEF0, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xDF8F, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406EEF8, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xDFA8, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x412EE04, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xDFC6, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x415EE06, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xDFE4, 0x19
		.4byte	AnimCmd_6, 0x0, 0x412EE03, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x43

.align 2, 0
	anim_0254:
		.4byte anim_data__0254_0




.align 2, 0
	anim_data__0255_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xDFFD, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE01B, 0x1E, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE039, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE057, 0x23, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE07A, 0x1E, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE098, 0x1E, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE0B6, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE0D4, 0x23, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0255_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE0F7, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1408F8FC, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE115, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE133, 0x1C, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE14F, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xE16D, 0x1E, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE18B, 0x1E, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xE1A9, 0x23, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xE1CC, 0x1E, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0255_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE1EA, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1208F6FC, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE208, 0x1E, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xE226, 0x23, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xE249, 0x1E, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xE267, 0x1E, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xE285, 0x1E, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xE2A3, 0x1C, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xE2BF, 0x1E, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0255:
		.4byte anim_data__0255_0
		.4byte anim_data__0255_1
		.4byte anim_data__0255_2




.align 2, 0
	anim_data__0256_0:
		.4byte	AnimCmd_GetPalette, 0x15, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0256:
		.4byte anim_data__0256_0




.align 2, 0
	anim_data__0257_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE2DD, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1304FFFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE31D, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE35D, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0257:
		.4byte anim_data__0257_0




.align 2, 0
	anim_data__0267_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE39D, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0267_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE3AD, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0267:
		.4byte anim_data__0267_0
		.4byte anim_data__0267_1




.align 2, 0
	anim_data__0268_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE3BD, 0x10, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE3CD, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE3E1, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE3F1, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE405, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE419, 0x10, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0268_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE429, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE43D, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xE456, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE46A, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE47E, 0x19, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE497, 0x14, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0268_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE4AB, 0x10, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE4BB, 0x10, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xE4CB, 0x10, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xE4DB, 0x10, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xE4EB, 0x10, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE4FB, 0x10, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0268_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE50B, 0x14, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xE51F, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xE533, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xE547, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xE55B, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xE56F, 0x14, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0268:
		.4byte anim_data__0268_0
		.4byte anim_data__0268_1
		.4byte anim_data__0268_2
		.4byte anim_data__0268_3




.align 2, 0
	anim_data__0269_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE583, 0x24, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE5A7, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0269_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE5C5, 0x10, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0269_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE5D5, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE5EE, 0x19, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0269_3:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE607, 0x18, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0269:
		.4byte anim_data__0269_0
		.4byte anim_data__0269_1
		.4byte anim_data__0269_2
		.4byte anim_data__0269_3




.align 2, 0
	anim_data__0270_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE61F, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE62F, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE643, 0x14, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0270_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE657, 0x18, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE66F, 0x1E, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE68D, 0x1E, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0270:
		.4byte anim_data__0270_0
		.4byte anim_data__0270_1




.align 2, 0
	anim_data__0271_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE6AB, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE6BB, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE6CB, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE6DB, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE6EB, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE6FB, 0x10, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0271:
		.4byte anim_data__0271_0




.align 2, 0
	anim_data__0272_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE70B, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE71B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE72B, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE73B, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE74B, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE75F, 0xC, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE76B, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE77B, 0x10, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xE78B, 0x10, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE79B, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE7AB, 0x10, 0x3, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0272:
		.4byte anim_data__0272_0




.align 2, 0
	anim_data__0273_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE7BB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE7CF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE7E3, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE7F7, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE807, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE7BB, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE7CF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE7E3, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE7F7, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE807, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE81B, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE7BB, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE7CF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE82F, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE843, 0x10, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xE853, 0x14, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE81B, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE7BB, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE7CF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE7E3, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE7F7, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE807, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1008F3FA, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE867, 0x14, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE87B, 0x14, 0xA, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE88F, 0x14, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xE8A3, 0x14, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE8B7, 0x14, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xE867, 0x14, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE87B, 0x14, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE88F, 0x14, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xE8A3, 0x14, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE8B7, 0x14, 0xC, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xE867, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE81B, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE7BB, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE7CF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE7E3, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE7F7, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE807, 0x14, 0x5, 0x4
		.4byte	AnimCmd_JumpBack, 0xCC

.align 2, 0
	anim_0273:
		.4byte anim_data__0273_0




.align 2, 0
	anim_data__0274_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE8CB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE8DF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE8F3, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE907, 0x14, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE8F3, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE8DF, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE8F3, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE907, 0x14, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xE8F3, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xE8DF, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xE91B, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xE92F, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE943, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE957, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xE943, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE92F, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE943, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE957, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xE943, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xE92F, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xE8CB, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xE96B, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE97F, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE993, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE9A7, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xE9BB, 0x14, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE96B, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xE97F, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xE993, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xE9A7, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xE9BB, 0x14, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xE9CF, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xE9E3, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xE9F7, 0x19, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xEA10, 0x1E
		.4byte	AnimCmd_6, 0x1, 0x10FEEFE9
		.4byte	AnimCmd_PlaySoundEffect, 0x7E, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEA2E, 0x19, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xEA47, 0x19, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xEA60, 0x14, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xEA10, 0x1E
		.4byte	AnimCmd_6, 0x1, 0x10FEEFE9
		.4byte	AnimCmd_PlaySoundEffect, 0x7E, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEA2E, 0x19, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xEA47, 0x19, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xE9E3, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xEA74, 0x14, 0x2, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xEA88, 0x14, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xEA9C, 0x14, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xEAB0, 0x1E
		.4byte	AnimCmd_6, 0x1, 0x10FEF0E7
		.4byte	AnimCmd_PlaySoundEffect, 0x7E, 0x2, 0x17
		.4byte	AnimCmd_GetTileIndex, 0xEACE, 0x1E, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xEA9C, 0x14, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xEA88, 0x14, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xE9CF, 0x14, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0x6E
	anim_data__0274_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xE9CF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0274:
		.4byte anim_data__0274_0
		.4byte anim_data__0274_1




.align 2, 0
	anim_data__0275_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEAEC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEAFC, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEB0C, 0xC, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xEB18, 0x10, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0275_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEAFC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEAEC, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0275:
		.4byte anim_data__0275_0
		.4byte anim_data__0275_1




.align 2, 0
	anim_data__0276_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEB28, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEB38, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEB48, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xEB58, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0276_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEB68, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806F8FA
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xEB78, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xEB88, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xEB98, 0x10, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0276:
		.4byte anim_data__0276_0
		.4byte anim_data__0276_1




.align 2, 0
	anim_data__0277_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEBA8, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEBB8, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEBC8, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xEBD8, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1D

.align 2, 0
	anim_0277:
		.4byte anim_data__0277_0




.align 2, 0
	anim_data__0278_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEBE8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEBFC, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0278:
		.4byte anim_data__0278_0




.align 2, 0
	anim_data__0279_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEC10, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEC24, 0x1E, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEC42, 0x1E, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xEC60, 0x19, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0279:
		.4byte anim_data__0279_0




.align 2, 0
	anim_data__0280_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEC79, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xEC8D, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xECAB, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0280_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xECC9, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xEC79, 0x14, 0x2, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0280:
		.4byte anim_data__0280_0
		.4byte anim_data__0280_1




.align 2, 0
	anim_data__0281_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xECE7, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xECFB, 0x19, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xED14, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xED32, 0x19, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0281_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xECFB, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xECE7, 0x14, 0x2, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0281:
		.4byte anim_data__0281_0
		.4byte anim_data__0281_1




.align 2, 0
	anim_data__0282_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xED4B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xED8B, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xEDCB, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xEE0B, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xEE4B, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xEE8B, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xEECB, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xEF0B, 0x40, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0282_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xEF4B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xEF8B, 0x40, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xEFCB, 0x40, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xF00B, 0x40, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xF04B, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xF08B, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xF0CB, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xF10B, 0x40, 0x8, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0282_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF14B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF18B, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0xF1CB, 0x40, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0xF20B, 0x40, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0xF24B, 0x40, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0xF28B, 0x40, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0xF2CB, 0x40, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0xF30B, 0x40, 0x8, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0282_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF34B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0xF38B, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0xF3CB, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0xF40B, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0xF44B, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0xF48B, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0xF4CB, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0xF50B, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0282_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF54B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0xF58B, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xF5CB, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0xF60B, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0xF64B, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0xF68B, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xF6CB, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xF70B, 0x40, 0x8, 0x27
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0282_5:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF54B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0xF58B, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0xF5CB, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0xF60B, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0xF64B, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0xF68B, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0xF6CB, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0xF70B, 0x40, 0x8, 0x27
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0282:
		.4byte anim_data__0282_0
		.4byte anim_data__0282_1
		.4byte anim_data__0282_2
		.4byte anim_data__0282_3
		.4byte anim_data__0282_4
		.4byte anim_data__0282_5




.align 2, 0
	anim_data__0283_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF74B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA
		.4byte	AnimCmd_6, 0x1, 0x1206F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xF75B, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0283_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF76B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xF77B, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xF78B, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xF79B, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xF7AB, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xF7BB, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xF7CB, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xF7DB, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0283_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF7EB, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406F0FA
		.4byte	AnimCmd_6, 0x1, 0xE08F6F8, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xF804, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xF818, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xF831, 0x19, 0x2, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0283:
		.4byte anim_data__0283_0
		.4byte anim_data__0283_1
		.4byte anim_data__0283_2




.align 2, 0
	anim_data__0284_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF84A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA
		.4byte	AnimCmd_6, 0x1, 0x1006F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xF85A, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0284_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF86A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xF87A, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xF88A, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xF89A, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xF8AA, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xF8BA, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xF8CA, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xF8DA, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0284_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF8EA, 0x19
		.4byte	AnimCmd_6, 0x0, 0x406F0FA
		.4byte	AnimCmd_6, 0x1, 0xE08F6F8, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xF903, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xF917, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xF930, 0x19, 0x2, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0284:
		.4byte anim_data__0284_0
		.4byte anim_data__0284_1
		.4byte anim_data__0284_2




.align 2, 0
	anim_data__0285_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF949, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xF967, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1C06FEFA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xF977, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xF967, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0285:
		.4byte anim_data__0285_0




.align 2, 0
	anim_data__0286_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xF987, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xF9A5, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xF9C3, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xF9E1, 0x1E, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xF9FF, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0286:
		.4byte anim_data__0286_0




.align 2, 0
	anim_data__0287_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFA1D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFA1D, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFA31, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1002F2F0
		.4byte	AnimCmd_6, 0x1, 0x10F2EFDD
		.4byte	AnimCmd_PlaySoundEffect, 0x7E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFA4F, 0x23
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA
		.4byte	AnimCmd_6, 0x1, 0x0, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFA72, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA
		.4byte	AnimCmd_6, 0x1, 0x0, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xFA1D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0287_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFA90, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xFAA4, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xFAB8, 0x23
		.4byte	AnimCmd_6, 0x0, 0x1006F2EF
		.4byte	AnimCmd_6, 0x1, 0x10F3EFDD
		.4byte	AnimCmd_PlaySoundEffect, 0x7E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xFADB, 0x23
		.4byte	AnimCmd_6, 0x0, 0x1006F2EF
		.4byte	AnimCmd_6, 0x1, 0x0, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xFAA4, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xFA90, 0x14, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0287:
		.4byte anim_data__0287_0
		.4byte anim_data__0287_1




.align 2, 0
	anim_data__0288_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFAFE, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA
		.4byte	AnimCmd_6, 0x1, 0x1E0EFEF2, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFB1A, 0x1C, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFB36, 0x1C, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFB52, 0x1C, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xFAFE, 0x1C, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFB1A, 0x1C, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFB36, 0x1C, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFB52, 0x1C, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0288_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFB6E, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xFB87, 0x14, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xFB9B, 0x10, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xFBAB, 0x10, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xFBBB, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xFBAB, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xFB9B, 0x10, 0x2, 0x6
		.4byte	AnimCmd_4
	anim_data__0288_2:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0xFBCB, 0x6, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xFBD1, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xFBE1, 0x19, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xFBFA, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xFC13, 0x18, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xFC2B, 0x12, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xFC3D, 0xF, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xFC4C, 0x4, 0x2, 0x10
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0288:
		.4byte anim_data__0288_0
		.4byte anim_data__0288_1
		.4byte anim_data__0288_2




.align 2, 0
	anim_data__0289_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFC50, 0x20
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA
		.4byte	AnimCmd_6, 0x1, 0x700E9E7, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFC70, 0x20, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFC90, 0x20, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFCB0, 0x20, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xFC50, 0x20, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFC70, 0x20, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFC90, 0x20, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFCB0, 0x20, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0289_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFCD0, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xFCEE, 0x24, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xFD12, 0x1E, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0xFD30, 0x18, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xFD48, 0x14, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0289_2:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0xFD5C, 0x4, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xFD60, 0xC, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xFD6C, 0x19, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0xFD85, 0x1E, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0xFDA3, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0xFDB7, 0x12, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0xFDC9, 0x12, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0xFDDB, 0x6, 0x2, 0x10
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0289:
		.4byte anim_data__0289_0
		.4byte anim_data__0289_1
		.4byte anim_data__0289_2




.align 2, 0
	anim_data__0292_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFDE1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x610F8FA
		.4byte	AnimCmd_6, 0x1, 0x902F4F1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFDF9, 0x18, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x13

.align 2, 0
	anim_0292:
		.4byte anim_data__0292_0




.align 2, 0
	anim_data__0293_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE11, 0x18
		.4byte	AnimCmd_6, 0x0, 0x610F8FA
		.4byte	AnimCmd_6, 0x1, 0x902F4F4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0293_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE29, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60CF8F6
		.4byte	AnimCmd_6, 0x1, 0x9FEF4F0, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0293_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE41, 0x18
		.4byte	AnimCmd_6, 0x0, 0x608F8F2
		.4byte	AnimCmd_6, 0x1, 0x910F402, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0293_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE59, 0x18
		.4byte	AnimCmd_6, 0x0, 0x604F8EE
		.4byte	AnimCmd_6, 0x1, 0x90CF4FE, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0293:
		.4byte anim_data__0293_0
		.4byte anim_data__0293_1
		.4byte anim_data__0293_2
		.4byte anim_data__0293_3




.align 2, 0
	anim_data__0294_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE71, 0xF
		.4byte	AnimCmd_6, 0x0, 0x715FAFB
		.4byte	AnimCmd_6, 0x1, 0xA02F6F5, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFE80, 0xF, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x13

.align 2, 0
	anim_0294:
		.4byte anim_data__0294_0




.align 2, 0
	anim_data__0295_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFE8F, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFEA3, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFEBC, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFEDA, 0x1E, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0xFEF8, 0x1E, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0xFF16, 0x1E, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0xFF34, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0295_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFF52, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0xFF70, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0xFF80, 0x10, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xFF90, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0xFF80, 0x10, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0xFF70, 0x10, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0295:
		.4byte anim_data__0295_0
		.4byte anim_data__0295_1




.align 2, 0
	anim_data__0296_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFFA0, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA0AF2FE, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFFBE, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF0AF6FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFFD2, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF7F7F7F7, 0x2, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0296:
		.4byte anim_data__0296_0




.align 2, 0
	anim_data__0297_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0xFFE2, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF0AF6FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0xFFF6, 0x18
		.4byte	AnimCmd_PlaySoundEffect, 0x7D, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1000E, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10022, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10036, 0x18
		.4byte	AnimCmd_PlaySoundEffect, 0x7D, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1004E, 0x14, 0x4, 0x5
		.4byte	AnimCmd_JumpBack, 0x28
	anim_data__0297_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1004E, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF0AF6FA, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10036, 0x18, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10022, 0x14
		.4byte	AnimCmd_PlaySoundEffect, 0x7D, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1000E, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0xFFF6, 0x18, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0xFFE2, 0x14
		.4byte	AnimCmd_PlaySoundEffect, 0x7D, 0x4, 0x0
		.4byte	AnimCmd_JumpBack, 0x28
	anim_data__0297_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10062, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF0AF6FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0297_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10072, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF07F8F7, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10086, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA01F0F1, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x10098, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6F9ECEF, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x100B0, 0x18, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x100C8, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF9ECED, 0x4, 0xB
		.4byte	AnimCmd_4
	anim_data__0297_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x100DC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x100EC, 0x10, 0x4, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0297:
		.4byte anim_data__0297_0
		.4byte anim_data__0297_1
		.4byte anim_data__0297_2
		.4byte anim_data__0297_3
		.4byte anim_data__0297_4




.align 2, 0
	anim_data__0301_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x100FC, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10115, 0x14, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10129, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1013D, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10151, 0xF, 0x8, 0x4
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0301_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10160, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1806FAFA, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1017E, 0x18, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10196, 0x18, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x101AE, 0x19, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x101C7, 0x19, 0x5, 0x9
		.4byte	AnimCmd_4
	anim_data__0301_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x101E0, 0x14, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x101F4, 0x10, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x10204, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x10218, 0x14, 0x3, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0301:
		.4byte anim_data__0301_0
		.4byte anim_data__0301_1
		.4byte anim_data__0301_2




.align 2, 0
	anim_data__0302_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1022C, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1024A, 0x24, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1022C, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1026E, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10287, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1029B, 0x14, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0302:
		.4byte anim_data__0302_0




.align 2, 0
	anim_data__0303_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x102AF, 0x14, 0x25, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x102C3, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x102D7, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x102EB, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x102FF, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x102EB, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x102D7, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x102EB, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x102FF, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x102EB, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x102D7, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10313, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10327, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1033B, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1034F, 0x14, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1033B, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10327, 0x14, 0xA, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10363, 0x14, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x10377, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10390, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x103A4, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x103B8, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x103CC, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x103E0, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x103F4, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10377, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10390, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x103A4, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x103B8, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x103CC, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x103E0, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x103F4, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10377, 0x19, 0xC, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10363, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x10408, 0x14, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1041C, 0x14, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x10430, 0x10, 0x2, 0x13
		.4byte	AnimCmd_4
	anim_data__0303_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10430, 0x10, 0x1, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x10440, 0x14, 0x6, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x10454, 0x14, 0x3C, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x10468, 0x1E, 0x4, 0x16
		.4byte	AnimCmd_4

.align 2, 0
	anim_0303:
		.4byte anim_data__0303_0
		.4byte anim_data__0303_1




.align 2, 0
	anim_data__0304_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10486, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1049F, 0x19, 0x3, 0x1
		.4byte	AnimCmd_4
	anim_data__0304_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x104B8, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x104D1, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x104EA, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10503, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0304_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10521, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F3FA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1053A, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1054E, 0x14, 0x4, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0304:
		.4byte anim_data__0304_0
		.4byte anim_data__0304_1
		.4byte anim_data__0304_2




.align 2, 0
	anim_data__0305_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10562, 0x14, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10576, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1058A, 0x14, 0x1E, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1059E, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x105B2, 0x19, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x105CB, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x105DF, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x105F3, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1060C, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x10625, 0x19, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1063E, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10657, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1066B, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1067F, 0x18, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x10697, 0x18, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x106AF, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x106C3, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x106D7, 0x14, 0x1E, 0x11
		.4byte	AnimCmd_4

.align 2, 0
	anim_0305:
		.4byte anim_data__0305_0




.align 2, 0
	anim_data__0306_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x106EB, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x106FF, 0xF, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1070E, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10722, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10736, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1074A, 0x14, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1075E, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10772, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10786, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1079A, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x107AE, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x107C2, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1075E, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10772, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10786, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1079A, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x107AE, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x107C2, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1074A, 0x14, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x107D6, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x107EA, 0x14, 0xC, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x107FE, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x10812, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x10826, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1083A, 0x14, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1084E, 0x14, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x10862, 0x14, 0xC, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x10876, 0x14, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x1088A, 0x14, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x1089E, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x108B2, 0x14, 0xC, 0x17
		.4byte	AnimCmd_4

.align 2, 0
	anim_0306:
		.4byte anim_data__0306_0




.align 2, 0
	anim_data__0307_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x108C6, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x108DA, 0x19, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x108F3, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1090B, 0x1C, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10927, 0x1E, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10945, 0x1E, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10963, 0x24, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10987, 0x24, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x109AB, 0x1E, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x109C9, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x109DD, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x109F1, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x10A05, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x10A19, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x10A32, 0x19, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x10A4B, 0x19, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x10A64, 0x14, 0x3C, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0307:
		.4byte anim_data__0307_0




.align 2, 0
	anim_data__0308_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10A78, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10A8C, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10AA0, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10AB9, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10ACD, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10AE1, 0x19, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10AFA, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10B13, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10B2C, 0x18, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x10B44, 0x18, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x10B5C, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10B7A, 0x18, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x10B92, 0x18, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x10BAA, 0x18, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x10BC2, 0x1E, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x10BE0, 0x18, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0308:
		.4byte anim_data__0308_0




.align 2, 0
	anim_data__0309_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10BF8, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0309_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10C0C, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0309_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10C20, 0x14, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0309_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10C34, 0x19, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0309:
		.4byte anim_data__0309_0
		.4byte anim_data__0309_1
		.4byte anim_data__0309_2
		.4byte anim_data__0309_3




.align 2, 0
	anim_data__0315_0:
		.4byte	AnimCmd_GetPalette, 0x18, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x28, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C56, 0x9, 0xC, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C5F, 0x9, 0xC, 0x2
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0315_1:
		.4byte	AnimCmd_GetPalette, 0x18, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x10C5F, 0x9, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C56, 0x9, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C5F, 0x9, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C56, 0x9, 0xC, 0x1
		.4byte	AnimCmd_JumpBack, 0x26
	anim_data__0315_2:
		.4byte	AnimCmd_GetPalette, 0x18, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C68, 0x9, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C68, 0x9, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C68, 0x9, 0x8, 0x3
		.4byte	AnimCmd_4
	anim_data__0315_3:
		.4byte	AnimCmd_GetPalette, 0x18, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x10C4D, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10C71, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10C80, 0xF, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0315:
		.4byte anim_data__0315_0
		.4byte anim_data__0315_1
		.4byte anim_data__0315_2
		.4byte anim_data__0315_3




.align 2, 0
	anim_data__0316_0:
		.4byte	AnimCmd_GetPalette, 0x19, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x10C8F, 0x23, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10CB2, 0x1C, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10CCE, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10CE7, 0x19, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10D00, 0x19, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10D19, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10D2D, 0x19, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10D46, 0x19, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0316:
		.4byte anim_data__0316_0




.align 2, 0
	anim_data__0321_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10D5F, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10D73, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10D5F, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0321_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10D87, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10DA5, 0x1E, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10DC3, 0x20
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA
		.4byte	AnimCmd_6, 0x1, 0xFE0EE4F2, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x10DE3, 0x1C, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10DFF, 0x19, 0x8, 0x6
		.4byte	AnimCmd_4
	anim_data__0321_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10E18, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x7, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x10E36, 0x1E, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x10E54, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x10E72, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x10E90, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0321_3:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x10EAE, 0x6, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x10EB4, 0xC, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x10EC0, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x10ED4, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x10EE8, 0x18, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10F00, 0x18, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x10F18, 0x18, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x10F30, 0x9, 0x3, 0x13
		.4byte	AnimCmd_4

.align 2, 0
	anim_0321:
		.4byte anim_data__0321_0
		.4byte anim_data__0321_1
		.4byte anim_data__0321_2
		.4byte anim_data__0321_3




.align 2, 0
	anim_data__0322_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10F39, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x10F57, 0x24, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x10F7B, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x10F93, 0x1E, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x10FB1, 0x1E, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0322_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x10FCF, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x10FE3, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x10FFC, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x11014, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60EF7F2
		.4byte	AnimCmd_6, 0x1, 0xEFCF0ED, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1102C, 0x18, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0322_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11044, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11062, 0x24, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x11086, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1109A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x110AA, 0x10, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x110BA, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8
		.4byte	AnimCmd_PlaySoundEffect, 0x6D, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x110CA, 0x10, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x110DA, 0x10, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x110EA, 0x10, 0x2, 0x12
		.4byte	AnimCmd_4

.align 2, 0
	anim_0322:
		.4byte anim_data__0322_0
		.4byte anim_data__0322_1
		.4byte anim_data__0322_2




.align 2, 0
	anim_data__0323_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x110FA, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11112, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11130, 0x1E, 0x4, 0x2
		.4byte	AnimCmd_4
	anim_data__0323_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1114E, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x11162, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x11176, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA
		.4byte	AnimCmd_6, 0x1, 0xE12F000, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11194, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0323:
		.4byte anim_data__0323_0
		.4byte anim_data__0323_1




.align 2, 0
	anim_data__0324_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x111B2, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x111D0, 0x1E, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x111EE, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1120C, 0x23, 0x2, 0x3
		.4byte	AnimCmd_4
	anim_data__0324_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1122F, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA
		.4byte	AnimCmd_6, 0x1, 0x1E0E00F2, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1124B, 0x1C, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11267, 0x1C, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11283, 0x1C, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1122F, 0x1C, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1124B, 0x1C, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11267, 0x1C, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11283, 0x1C, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0324_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1129F, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x112B8, 0x14, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x112CC, 0x10, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x112DC, 0x10, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x112EC, 0x10, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x112DC, 0x10, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x112CC, 0x10, 0x2, 0xA
		.4byte	AnimCmd_4
	anim_data__0324_3:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x112FC, 0x6, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x11302, 0x10, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x11312, 0x19, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1132B, 0x19, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11344, 0x18, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1135C, 0x12, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1136E, 0xF, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1137D, 0x4, 0x2, 0x14
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0324:
		.4byte anim_data__0324_0
		.4byte anim_data__0324_1
		.4byte anim_data__0324_2
		.4byte anim_data__0324_3




.align 2, 0
	anim_data__0325_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11381, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11395, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x113A9, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x113BD, 0x14, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0325_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x113D1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x113E5, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x113F9, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1140D, 0x19, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x11426, 0x1E, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x11444, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_4
	anim_data__0325_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11462, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11480, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1149E, 0x1E, 0x3, 0xC
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0325:
		.4byte anim_data__0325_0
		.4byte anim_data__0325_1
		.4byte anim_data__0325_2




.align 2, 0
	anim_data__0326_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x114BC, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x114D0, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x114E4, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x114F8, 0x19, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x11511, 0x19, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1152A, 0x19, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11543, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11557, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1156B, 0x19, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x11584, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x11598, 0x19, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x115B1, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x115CF, 0x1E, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x115ED, 0x1E, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0326:
		.4byte anim_data__0326_0




.align 2, 0
	anim_data__0327_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1160B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1208F2F8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1161F, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE08F1F8, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11638, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1164C, 0x19, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0327_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11665, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1167E, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11697, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x116B0, 0x1E, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x116CE, 0x1E, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x116EC, 0x1E, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1170A, 0x1E, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11728, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0327:
		.4byte anim_data__0327_0
		.4byte anim_data__0327_1




.align 2, 0
	anim_data__0328_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11746, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11786, 0x40, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0328:
		.4byte anim_data__0328_0




.align 2, 0
	anim_data__0330_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x117C6, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0330_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x117DF, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0330_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x117EF, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0330_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x117FF, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0330_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11818, 0x18
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0330_5:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11830, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0330_6:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11844, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0330_7:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11854, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F2FA, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0330:
		.4byte anim_data__0330_0
		.4byte anim_data__0330_1
		.4byte anim_data__0330_2
		.4byte anim_data__0330_3
		.4byte anim_data__0330_4
		.4byte anim_data__0330_5
		.4byte anim_data__0330_6
		.4byte anim_data__0330_7




.align 2, 0
	anim_data__0331_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1186D, 0x40
		.4byte	AnimCmd_6, 0x0, 0xA06F4FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x118AD, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x118ED, 0x40, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1192D, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1196D, 0x40, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x119AD, 0x40, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x119ED, 0x40, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11A2D, 0x40, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0331:
		.4byte anim_data__0331_0




.align 2, 0
	anim_data__0332_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11A6D, 0x23
		.4byte	AnimCmd_6, 0x0, 0x2A060CFA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0332_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11A90, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1EFE0AE4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0332_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11AAE, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x10F802D8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0332_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11ACC, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xAF2F5DD, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0332_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11AEA, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFEF8EAE6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0332_5:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B08, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF8FEDCEC, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0332_6:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B20, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF806DAFA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0332_7:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B3C, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF610DE00, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0332_8:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B58, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE1EEC08, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0332_9:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B6C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x826F80A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0332_10:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B84, 0x18
		.4byte	AnimCmd_6, 0x0, 0x12240208, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0332_11:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11B9C, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x221C0804, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0332:
		.4byte anim_data__0332_0
		.4byte anim_data__0332_1
		.4byte anim_data__0332_2
		.4byte anim_data__0332_3
		.4byte anim_data__0332_4
		.4byte anim_data__0332_5
		.4byte anim_data__0332_6
		.4byte anim_data__0332_7
		.4byte anim_data__0332_8
		.4byte anim_data__0332_9
		.4byte anim_data__0332_10
		.4byte anim_data__0332_11




.align 2, 0
	anim_data__0333_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11BBA, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF806DAFA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0333_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11BD6, 0x18
		.4byte	AnimCmd_6, 0x0, 0xF8FEDCEC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0333_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11BEE, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xFEF8EAE6, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0333_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11C0C, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xAF2F5DD, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0333_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11C2A, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x10F802D8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0333_5:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11C48, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1EFE0AE4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0333_6:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11C66, 0x23
		.4byte	AnimCmd_6, 0x0, 0x2A060CFA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0333_7:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11C89, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x221C0804, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0333_8:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11CA7, 0x18
		.4byte	AnimCmd_6, 0x0, 0x12240208, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0333_9:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11CBF, 0x18
		.4byte	AnimCmd_6, 0x0, 0x826F80A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0333_10:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11CD7, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE1EEC08, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0333_11:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11CEB, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xF610DE00, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0333:
		.4byte anim_data__0333_0
		.4byte anim_data__0333_1
		.4byte anim_data__0333_2
		.4byte anim_data__0333_3
		.4byte anim_data__0333_4
		.4byte anim_data__0333_5
		.4byte anim_data__0333_6
		.4byte anim_data__0333_7
		.4byte anim_data__0333_8
		.4byte anim_data__0333_9
		.4byte anim_data__0333_10
		.4byte anim_data__0333_11




.align 2, 0
	anim_data__0334_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11D07, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11D25, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11D43, 0x1E, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x11D25, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0334:
		.4byte anim_data__0334_0




.align 2, 0
	anim_data__0335_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11D61, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1E0600FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11D7D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180600FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11D95, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100600FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x11DA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x11DB9, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E0FA, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x11DD1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE06E6FA, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11DE5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F0FA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11DF5, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1A06FCFA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x11D61, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x1E0400F8, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11D7D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x180600FA, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11D95, 0x10
		.4byte	AnimCmd_6, 0x0, 0x100600FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x11DA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x11DB9, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E0FA, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0335_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11E07, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFC06DEFA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x11E23, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E4FA, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x11E3B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11E4B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x11E5F, 0x18
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x11E77, 0x14
		.4byte	AnimCmd_6, 0x0, 0x200602FA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x11E8B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x180602FA, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x11E9B, 0x12
		.4byte	AnimCmd_6, 0x0, 0x406ECFA, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x11E07, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFC06DEFA, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x11E23, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFE06E4FA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x11E3B, 0x10
		.4byte	AnimCmd_6, 0x0, 0x206F4FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11E4B, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x11E5F, 0x18
		.4byte	AnimCmd_6, 0x0, 0x200602FA, 0x2, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0335:
		.4byte anim_data__0335_0
		.4byte anim_data__0335_1




.align 2, 0
	anim_data__0336_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11EAD, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCF6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x11EBD, 0x14
		.4byte	AnimCmd_6, 0x0, 0xEEEF6, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x11ED1, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFE0EE5F6, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x11EED, 0x14
		.4byte	AnimCmd_6, 0x0, 0xEEDF6, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x11F01, 0x14
		.4byte	AnimCmd_6, 0x0, 0x60EF6F6, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x11F15, 0x14
		.4byte	AnimCmd_6, 0x0, 0x180E00F6, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x11F29, 0x23
		.4byte	AnimCmd_6, 0x0, 0x200E02F6, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x11F4C, 0x19
		.4byte	AnimCmd_6, 0x0, 0x140E00F6, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x11EAD, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCF6, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0336_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x11F65, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EF6F6, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x11F75, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160E00F6, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x11F89, 0x1C
		.4byte	AnimCmd_6, 0x0, 0x220E02F6, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x11FA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x160E00F6, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x11FB9, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA0EFAF6, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x11FCD, 0x14
		.4byte	AnimCmd_6, 0x0, 0x20EEAF6, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x11FE1, 0x23
		.4byte	AnimCmd_6, 0x0, 0x20EE4F6, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x12004, 0x19
		.4byte	AnimCmd_6, 0x0, 0x20EEEF6, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x11F65, 0x10
		.4byte	AnimCmd_6, 0x0, 0x80EF6F6, 0x2, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0336:
		.4byte anim_data__0336_0
		.4byte anim_data__0336_1




.align 2, 0
	anim_data__0337_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1201D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12031, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12049, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFFEFE1E3, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12065, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12079, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1208D, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFF17E10B, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x120A5, 0x28
		.4byte	AnimCmd_6, 0x0, 0xFF1FE113, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x120CD, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFF17E10B, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1201D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12031, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12049, 0x1C
		.4byte	AnimCmd_6, 0x0, 0xFFEFE1E3, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12065, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFFF7E1EB, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12079, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFF07E1FB, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0337:
		.4byte anim_data__0337_0




.align 2, 0
	anim_data__0338_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x120E6, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12104, 0x1E, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12122, 0x24, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12146, 0x1E, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12164, 0x24, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x12188, 0x24, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x121AC, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x121CA, 0x1E, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0338_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x121E8, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x12206, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1221F, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1223D, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_4
	anim_data__0338_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1225B, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x12279, 0x1E, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x12297, 0x1E, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0338:
		.4byte anim_data__0338_0
		.4byte anim_data__0338_1
		.4byte anim_data__0338_2




.align 2, 0
	anim_data__0339_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x122B5, 0x2A
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x122DF, 0x2A, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12309, 0x2A, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0339_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12333, 0x24
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12357, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1236F, 0x18, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x12387, 0x1E, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x123A5, 0x19, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0339_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x123BE, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x123D7, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x123F0, 0x19, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0339:
		.4byte anim_data__0339_0
		.4byte anim_data__0339_1
		.4byte anim_data__0339_2




.align 2, 0
	anim_data__0340_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12409, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1242D, 0x1E, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1244B, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1245F, 0x1E, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1247D, 0x24, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x124A1, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x124B5, 0x19, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x124CE, 0x14, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0340:
		.4byte anim_data__0340_0




.align 2, 0
	anim_data__0341_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x124E2, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0341_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x124F6, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0341_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1250A, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0341_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1251E, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0341_4:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12537, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0341_5:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12550, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0341_6:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12569, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0341_7:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1257D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0341_8:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12591, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0341_9:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x125AA, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0341_10:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x125BE, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0341:
		.4byte anim_data__0341_0
		.4byte anim_data__0341_1
		.4byte anim_data__0341_2
		.4byte anim_data__0341_3
		.4byte anim_data__0341_4
		.4byte anim_data__0341_5
		.4byte anim_data__0341_6
		.4byte anim_data__0341_7
		.4byte anim_data__0341_8
		.4byte anim_data__0341_9
		.4byte anim_data__0341_10




.align 2, 0
	anim_data__0342_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x125D7, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA0AF8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x125EF, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12607, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1261B, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12633, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1264B, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1265F, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x12678, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0342_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1268C, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA0AF8F8, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x126A4, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x126BC, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x126D0, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x126E8, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x12700, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x12714, 0x19, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1272D, 0x14, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0342:
		.4byte anim_data__0342_0
		.4byte anim_data__0342_1




.align 2, 0
	anim_data__0343_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12741, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8
		.4byte	AnimCmd_6, 0x1, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12751, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12761, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12771, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12781, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x12791, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x127A1, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x127B1, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0343:
		.4byte anim_data__0343_0




.align 2, 0
	anim_data__0344_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x127C1, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x127DA, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x127F3, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1280C, 0x1E, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1282A, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x12848, 0x24, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0344_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1286C, 0x23
		.4byte	AnimCmd_6, 0x0, 0xE06F0FA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1288F, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x128A7, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x128BF, 0x1E, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x128A7, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1288F, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0344:
		.4byte anim_data__0344_0
		.4byte anim_data__0344_1




.align 2, 0
	anim_data__0345_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x128DD, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1206F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x128F5, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x12F5F4EE, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12913, 0x24
		.4byte	AnimCmd_6, 0x0, 0x12FAF4E8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12937, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x12FCF4EA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12955, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1206F4F7, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1296D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1212F402, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x12985, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1218F406, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x129A9, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1212F402, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x43

.align 2, 0
	anim_0345:
		.4byte anim_data__0345_0




.align 2, 0
	anim_data__0346_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x129C7, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x129D7, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x129E7, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x129FB, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12A0B, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x12A1B, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x12A2B, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x12A3B, 0x10, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0346_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12A4B, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x12A69, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x12A82, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x12A96, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x12AAF, 0x1E, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x12ACD, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x12AE6, 0x1E, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x12B04, 0x19, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0346_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12B1D, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1006F0FA, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12B3B, 0x19, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x12B54, 0x1E, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x12B72, 0x19, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x12B8B, 0x1E, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x12BA9, 0x1E, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x12BC7, 0x19, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x12BE0, 0x1E, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0346:
		.4byte anim_data__0346_0
		.4byte anim_data__0346_1
		.4byte anim_data__0346_2




.align 2, 0
	anim_data__0347_0:
		.4byte	AnimCmd_GetPalette, 0x1A, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0347:
		.4byte anim_data__0347_0




.align 2, 0
	anim_data__0348_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12BFE, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1007F7F9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12C3E, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12C7E, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0348:
		.4byte anim_data__0348_0




.align 2, 0
	anim_data__0358_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12CBE, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0358_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12CD2, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0358:
		.4byte anim_data__0358_0
		.4byte anim_data__0358_1




.align 2, 0
	anim_data__0359_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12CE6, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12CFA, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12D0E, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x12D22, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12D36, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12D4A, 0x14, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x27
	anim_data__0359_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12D5E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x8E0F8, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x12D72, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x12D86, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x12D9A, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x12DAE, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x12DC2, 0x14, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0359_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12DD6, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x12DF4, 0x1E, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x12E12, 0x1E, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x12E30, 0x1E, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x12E4E, 0x1E, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12E6C, 0x1E, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0359_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12E8A, 0x19, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x12EA3, 0x19, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x12EBC, 0x19, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x12ED5, 0x19, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x12EEE, 0x19, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x12F07, 0x19, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0359:
		.4byte anim_data__0359_0
		.4byte anim_data__0359_1
		.4byte anim_data__0359_2
		.4byte anim_data__0359_3




.align 2, 0
	anim_data__0360_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12F20, 0x24
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12F44, 0x24, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0360_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12F68, 0x14
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0360_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12F7C, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x12F9A, 0x1E, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0360_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12FB8, 0x19
		.4byte	AnimCmd_6, 0x0, 0x6E2FA, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0360:
		.4byte anim_data__0360_0
		.4byte anim_data__0360_1
		.4byte anim_data__0360_2
		.4byte anim_data__0360_3




.align 2, 0
	anim_data__0361_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x12FD1, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x12FE1, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x12FF5, 0x14, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0361_1:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13009, 0x19, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x13022, 0x19, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1303B, 0x1E, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0361:
		.4byte anim_data__0361_0
		.4byte anim_data__0361_1




.align 2, 0
	anim_data__0362_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13059, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F8F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13069, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x13079, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x13089, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x13099, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x130A9, 0x10, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0362:
		.4byte anim_data__0362_0




.align 2, 0
	anim_data__0363_0:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x130B9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x106E3FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x130CD, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x130E1, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x130F5, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x13109, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1311D, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x13131, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x13145, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x13159, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1316D, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x13181, 0x14, 0x3, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0363:
		.4byte anim_data__0363_0




.align 2, 0
	anim_data__0364_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13195, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x131A9, 0x14, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x131BD, 0x14, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x131D1, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x131E5, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x131F9, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1320D, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x13221, 0x14, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x13195, 0x14, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13235, 0x14, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x13249, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1325D, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x131E5, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x131F9, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1320D, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x13221, 0x14, 0x6, 0x7
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0364:
		.4byte anim_data__0364_0




.align 2, 0
	anim_data__0365_0:
		.4byte	AnimCmd_GetPalette, 0x1C, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13271, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13281, 0x10, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x13291, 0x10, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x132A1, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x132B1, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x132C5, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x132D9, 0xF, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x132E8, 0xF, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x132F7, 0x19, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x13310, 0x19, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x13329, 0x19, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x13342, 0x19, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1335B, 0x19, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x13374, 0x19, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1338D, 0x1E, 0x5, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x133AB, 0x1E, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x133C9, 0x19, 0xC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x133E2, 0xF, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x133F1, 0x14, 0xC, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x13405, 0xF, 0x5, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x13414, 0xF, 0x5, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x13423, 0xF, 0x5, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x13432, 0xF, 0xA, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x13441, 0xF, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x13450, 0x14, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x13464, 0xF, 0x4, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x13473, 0x10, 0x6, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x13483, 0x14, 0x4, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x13497, 0x14, 0x4, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x134AB, 0x14, 0x4, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x134BF, 0xF, 0x4, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x134CE, 0xC, 0x4, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x134DA, 0xF, 0x4, 0x20
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0365_1:
		.4byte	AnimCmd_GetPalette, 0x1C, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x134E9, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x4, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x134F5, 0xF, 0x4, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x13504, 0x14, 0xC, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x13518, 0x14, 0x4, 0x24
		.4byte	AnimCmd_4

.align 2, 0
	anim_0365:
		.4byte anim_data__0365_0
		.4byte anim_data__0365_1




.align 2, 0
	anim_data__0366_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1352C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1353C, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1354C, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0366_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1355C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006FAFA, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1356C, 0x10, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0366:
		.4byte anim_data__0366_0
		.4byte anim_data__0366_1




.align 2, 0
	anim_data__0367_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1357C, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06EEFA
		.4byte	AnimCmd_6, 0x1, 0xA06EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1358C, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1359C, 0x10, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x18
	anim_data__0367_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1357C, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06EEFA
		.4byte	AnimCmd_6, 0x1, 0xA06EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1358C, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1359C, 0x10, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x18

.align 2, 0
	anim_0367:
		.4byte anim_data__0367_0
		.4byte anim_data__0367_1




.align 2, 0
	anim_data__0368_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x135AC, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x135BC, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x135CC, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x135DC, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x135AC, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x135BC, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x135CC, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x135DC, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x135AC, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x135BC, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x135CC, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x135DC, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x135AC, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x135BC, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x135CC, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x135DC, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x59

.align 2, 0
	anim_0368:
		.4byte anim_data__0368_0




.align 2, 0
	anim_data__0369_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x135EC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13600, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0369:
		.4byte anim_data__0369_0




.align 2, 0
	anim_data__0370_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13614, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13624, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x13638, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1364C, 0x10, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0370:
		.4byte anim_data__0370_0




.align 2, 0
	anim_data__0371_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1365C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13670, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x13689, 0x19, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0371_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x136A2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0371:
		.4byte anim_data__0371_0
		.4byte anim_data__0371_1




.align 2, 0
	anim_data__0372_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x136B2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x136C2, 0x14, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x136D6, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x136EF, 0x19, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0372_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13708, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1206F6FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1371C, 0xC, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x13728, 0xC, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0372:
		.4byte anim_data__0372_0
		.4byte anim_data__0372_1




.align 2, 0
	anim_data__0373_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13734, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13774, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x137B4, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x137F4, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x13834, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x13874, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x138B4, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x138F4, 0x40, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x13734, 0x40, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x13934, 0x40, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x13974, 0x40, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x139B4, 0x40, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x13834, 0x40, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x13874, 0x40, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x138B4, 0x40, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x138F4, 0x40, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0373_1:
		.4byte	AnimCmd_GetPalette, 0x1D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x139F4, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x13A34, 0x40, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x13A74, 0x40, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x13AB4, 0x40, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x13AF4, 0x40, 0x8, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x13B34, 0x40, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13B74, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x13BB4, 0x40, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x13BF4, 0x40, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x13C34, 0x40, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x13C74, 0x40, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x13CB4, 0x40, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x13AF4, 0x40, 0x8, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x13B34, 0x40, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13B74, 0x40, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x13CF4, 0x40, 0x8, 0x17
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0373_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13D34, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x13D74, 0x40, 0x8, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x13DB4, 0x40, 0x8, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x13DF4, 0x40, 0x8, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x13E34, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x13E74, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x13EB4, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x13EF4, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x13D34, 0x40, 0x8, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x13F34, 0x40, 0x8, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x13F74, 0x40, 0x8, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x13FB4, 0x40, 0x8, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x13E34, 0x40, 0x8, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x13E74, 0x40, 0x8, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x13EB4, 0x40, 0x8, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x13EF4, 0x40, 0x8, 0x1F
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0373_3:
		.4byte	AnimCmd_GetPalette, 0x1E, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x13FF4, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x14034, 0x40, 0x8, 0x24
		.4byte	AnimCmd_GetTileIndex, 0x14074, 0x40, 0x8, 0x25
		.4byte	AnimCmd_GetTileIndex, 0x140B4, 0x40, 0x8, 0x26
		.4byte	AnimCmd_GetTileIndex, 0x140F4, 0x40, 0x8, 0x27
		.4byte	AnimCmd_GetTileIndex, 0x14134, 0x40, 0x8, 0x28
		.4byte	AnimCmd_GetTileIndex, 0x14174, 0x40, 0x8, 0x29
		.4byte	AnimCmd_GetTileIndex, 0x141B4, 0x40, 0x8, 0x2A
		.4byte	AnimCmd_GetTileIndex, 0x13FF4, 0x40, 0x8, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x141F4, 0x40, 0x8, 0x2B
		.4byte	AnimCmd_GetTileIndex, 0x14234, 0x40, 0x8, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0x14274, 0x40, 0x8, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x140F4, 0x40, 0x8, 0x27
		.4byte	AnimCmd_GetTileIndex, 0x14134, 0x40, 0x8, 0x28
		.4byte	AnimCmd_GetTileIndex, 0x14174, 0x40, 0x8, 0x29
		.4byte	AnimCmd_GetTileIndex, 0x141B4, 0x40, 0x8, 0x2A
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0373_4:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x142B4, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x142F4, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x14334, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x14374, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x143B4, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x143F4, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x14434, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x14474, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x142B4, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x144B4, 0x40, 0x8, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x144F4, 0x40, 0x8, 0x37
		.4byte	AnimCmd_GetTileIndex, 0x14534, 0x40, 0x8, 0x38
		.4byte	AnimCmd_GetTileIndex, 0x143B4, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x143F4, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x14434, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x14474, 0x40, 0x8, 0x35
		.4byte	AnimCmd_JumpBack, 0x56
	anim_data__0373_5:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x142B4, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x142F4, 0x40, 0x8, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x14334, 0x40, 0x8, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x14374, 0x40, 0x8, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x143B4, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x143F4, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x14434, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x14474, 0x40, 0x8, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x142B4, 0x40, 0x8, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x144B4, 0x40, 0x8, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x144F4, 0x40, 0x8, 0x37
		.4byte	AnimCmd_GetTileIndex, 0x14534, 0x40, 0x8, 0x38
		.4byte	AnimCmd_GetTileIndex, 0x143B4, 0x40, 0x8, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x143F4, 0x40, 0x8, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x14434, 0x40, 0x8, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x14474, 0x40, 0x8, 0x35
		.4byte	AnimCmd_JumpBack, 0x56

.align 2, 0
	anim_0373:
		.4byte anim_data__0373_0
		.4byte anim_data__0373_1
		.4byte anim_data__0373_2
		.4byte anim_data__0373_3
		.4byte anim_data__0373_4
		.4byte anim_data__0373_5




.align 2, 0
	anim_data__0374_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14574, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14584, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0374_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14594, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x145A4, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x145B4, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x145C4, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x145D4, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x145E4, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x145F4, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x14604, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0374_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14614, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14624, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA
		.4byte	AnimCmd_6, 0x1, 0xF0BF9F6, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14638, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14651, 0x19, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1466A, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0374:
		.4byte anim_data__0374_0
		.4byte anim_data__0374_1
		.4byte anim_data__0374_2




.align 2, 0
	anim_data__0375_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14688, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14698, 0x10, 0x2, 0x1
		.4byte	AnimCmd_4
	anim_data__0375_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x146A8, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x146B8, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x146C8, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x146D8, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x146E8, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x146F8, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14708, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x14718, 0x10, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x31
	anim_data__0375_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14728, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14738, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA
		.4byte	AnimCmd_6, 0x1, 0xF0BF9F6, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1474C, 0x19, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14765, 0x19, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1477E, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0375:
		.4byte anim_data__0375_0
		.4byte anim_data__0375_1
		.4byte anim_data__0375_2




.align 2, 0
	anim_data__0376_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1479C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x147AC, 0x10, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x147BC, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0376:
		.4byte anim_data__0376_0




.align 2, 0
	anim_data__0377_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x147CC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x147E0, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x147F9, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14811, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x14829, 0x18, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0377:
		.4byte anim_data__0377_0




.align 2, 0
	anim_data__0378_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14841, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14855, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100EF400, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1486D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x100EF402, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14881, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x1012F406, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1489F, 0x23, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x148C2, 0x23, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x148E5, 0x24
		.4byte	AnimCmd_6, 0x0, 0x100EF402, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x14909, 0x18
		.4byte	AnimCmd_6, 0x0, 0x100CF400
		.4byte	AnimCmd_6, 0x1, 0xFE0ADDEC, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14921, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA
		.4byte	AnimCmd_6, 0x1, 0x1000E9E0
		.4byte	AnimCmd_PlaySoundEffect, 0x80, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1494B, 0x23, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1496E, 0x23, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14991, 0x1C, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x149AD, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA
		.4byte	AnimCmd_6, 0x1, 0x0, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x149C1, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x149D5, 0x10, 0x3, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0378:
		.4byte anim_data__0378_0




.align 2, 0
	anim_data__0380_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x149E5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x149F9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1008F8FA, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x14A0D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1008F8FA, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14A25, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1008FEFA, 0x2, 0x3
		.4byte	AnimCmd_4
	anim_data__0380_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14A39, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF0801FA
		.4byte	AnimCmd_6, 0x1, 0x1101FBEE, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x14A4B, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x14A63, 0x14, 0x2, 0x6
		.4byte	AnimCmd_JumpBack, 0x18
	anim_data__0380_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14A77, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1006FCFA, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14A89, 0x19, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x14AA2, 0x10, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x14AB2, 0xF, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14AC1, 0x19, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14ADA, 0x10, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14AEA, 0x14, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x14AFE, 0xF, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x14B0D, 0x10, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x14B1D, 0x10, 0x1, 0x10
		.4byte	AnimCmd_4
	anim_data__0380_3:
		.4byte	AnimCmd_GetPalette, 0xE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x14B2D, 0x9, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x14B36, 0x14, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x14B4A, 0xC, 0x2, 0x13
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0380:
		.4byte anim_data__0380_0
		.4byte anim_data__0380_1
		.4byte anim_data__0380_2
		.4byte anim_data__0380_3




.align 2, 0
	anim_data__0381_0:
		.4byte	AnimCmd_GetPalette, 0x1F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14B56, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xE0EF2F2, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14B6E, 0x23, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x14B91, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14BAF, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x14BC8, 0x14, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x14BDC, 0x1E, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x14BFA, 0x14, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x14C0E, 0x1E, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14C2C, 0xF, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x14C3B, 0x1E, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x14C59, 0x18, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14C71, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14C85, 0x14, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14C99, 0x19, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x14CB2, 0x18, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x14CCA, 0x18, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x14CE2, 0x18, 0x3, 0x10
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0381:
		.4byte anim_data__0381_0




.align 2, 0
	anim_data__0382_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14CFA, 0xF
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14D09, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x14D1D, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14D31, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA
		.4byte	AnimCmd_6, 0x1, 0xE18FAE8, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x14D4F, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x14D63, 0x1E, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x14D81, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x14D99, 0x10, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14DA9, 0x18, 0x2, 0x8
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0382_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14DC1, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA
		.4byte	AnimCmd_6, 0x1, 0x0, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x14DDA, 0x18, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14DF2, 0x18, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14E0A, 0x18, 0x3, 0xC
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0382:
		.4byte anim_data__0382_0
		.4byte anim_data__0382_1




.align 2, 0
	anim_data__0383_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x14E22, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x14E36, 0x14, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x14E4A, 0x19, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x14E63, 0x1E, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x14E81, 0x1E, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x14E9F, 0x24, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x14EC3, 0x24, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x14EE7, 0x23, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x14F0A, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA
		.4byte	AnimCmd_6, 0x1, 0xD6E0, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x14F34, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x10FEF4F2
		.4byte	AnimCmd_6, 0x1, 0x6F9DED8, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x14F5E, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x10FEF4F2
		.4byte	AnimCmd_6, 0x1, 0x10F5E9D4
		.4byte	AnimCmd_PlaySoundEffect, 0x80, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x14F88, 0x2A, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x14FB2, 0x2A, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x14FDC, 0x1C, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x14FF8, 0x1C, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x15014, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1004F4F8
		.4byte	AnimCmd_6, 0x1, 0x0, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x15024, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1008F4FC, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15034, 0xC
		.4byte	AnimCmd_6, 0x0, 0x100AF4FE, 0x3, 0x11
		.4byte	AnimCmd_4

.align 2, 0
	anim_0383:
		.4byte anim_data__0383_0




.align 2, 0
	anim_data__0392_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15040, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15054, 0x19, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1506D, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15081, 0x10, 0x8, 0x3
		.4byte	AnimCmd_4
	anim_data__0392_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15091, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x150AA, 0xF, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x150B9, 0x10, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x150C9, 0x10, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x150D9, 0x14, 0x5, 0x8
		.4byte	AnimCmd_4
	anim_data__0392_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x150ED, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x150FD, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1510D, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15121, 0x10, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x15131, 0x10, 0x2, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0392:
		.4byte anim_data__0392_0
		.4byte anim_data__0392_1
		.4byte anim_data__0392_2




.align 2, 0
	anim_data__0393_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15141, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15155, 0x1E, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x15173, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15191, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x151A5, 0x18, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0393:
		.4byte anim_data__0393_0




.align 2, 0
	anim_data__0394_0:
		.4byte	AnimCmd_GetPalette, 0x20, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x151BD, 0xF, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x151CC, 0x14, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x151E0, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x151F4, 0x14, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15208, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1521C, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15230, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x151F4, 0x14, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15208, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1521C, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15230, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15244, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x15258, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1526C, 0x14, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15280, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15294, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x152A8, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x152BC, 0x14, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x152D0, 0x14, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x15294, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x152A8, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x152BC, 0x14, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x152D0, 0x14, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x152E4, 0x14, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x152F8, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1530C, 0x14, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x15320, 0x14, 0x7, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x15334, 0x14, 0x4, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x15348, 0x14, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x1535C, 0x14, 0x6, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x15370, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x15384, 0x14, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x15398, 0x14, 0x3, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x153AC, 0xF, 0xC, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x153BB, 0x14, 0x4, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x153CF, 0x10, 0x6, 0x1B
		.4byte	AnimCmd_4
	anim_data__0394_1:
		.4byte	AnimCmd_GetPalette, 0x20, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x153DF, 0x10, 0x1, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x153EF, 0x10, 0x6, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x153FF, 0x14, 0x3C, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x15413, 0x14, 0x4, 0x1F
		.4byte	AnimCmd_4

.align 2, 0
	anim_0394:
		.4byte anim_data__0394_0
		.4byte anim_data__0394_1




.align 2, 0
	anim_data__0395_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15427, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F4F8, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15433, 0xC, 0x3, 0x1
		.4byte	AnimCmd_4
	anim_data__0395_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1543F, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15453, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15467, 0x14, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0395_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15433, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x15427, 0xC, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1547B, 0xF, 0x4, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0395:
		.4byte anim_data__0395_0
		.4byte anim_data__0395_1
		.4byte anim_data__0395_2




.align 2, 0
	anim_data__0396_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1548A, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1549E, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x154B2, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x154C2, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x154D2, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x154E2, 0x1E, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15500, 0x2A, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1552A, 0x30, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1555A, 0x23, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1557D, 0x23, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x155A0, 0x23, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x155C3, 0x1E, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x155E1, 0x1E, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x155FF, 0x19, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x15618, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1562C, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x15640, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15654, 0x14, 0xC, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x15668, 0x14, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1567C, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x15690, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x156A4, 0x14, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x156B8, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x156CC, 0x14, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x156E0, 0x14, 0x3, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x156F4, 0x14, 0xC, 0x19
		.4byte	AnimCmd_4

.align 2, 0
	anim_0396:
		.4byte anim_data__0396_0




.align 2, 0
	anim_data__0397_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15708, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1571C, 0xF, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1572B, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1573F, 0x14, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15753, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15767, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1577B, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1578F, 0xF, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1579E, 0x19, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x157B7, 0x19, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x157D0, 0xF, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x157DF, 0xF, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x157EE, 0xF, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x157FD, 0xF, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1580C, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x15820, 0x14, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x15834, 0x14, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15848, 0x14, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1585C, 0x14, 0x6, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x15870, 0xF, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1587F, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x15893, 0xF, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x158A2, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x158B6, 0x19, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x158B6, 0x19, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x158CF, 0x19, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x158E8, 0x19, 0x4, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x15901, 0x19, 0x4, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x1591A, 0x19, 0x4, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x15933, 0x19, 0x4, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x1594C, 0x19, 0x4, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x15965, 0x19, 0x4, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x1597E, 0x19, 0x4, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x15997, 0x19, 0x4, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x15933, 0x19, 0x4, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x1591A, 0x19, 0x4, 0x1B
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0397:
		.4byte anim_data__0397_0




.align 2, 0
	anim_data__0398_0:
		.4byte	AnimCmd_GetPalette, 0x21, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x159B0, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x159C4, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x159D8, 0xF, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x159E7, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x159FB, 0x10, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15A0B, 0x10, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15A1B, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15A2B, 0x10, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x15A3B, 0xF, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x15A4A, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15A5E, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15A72, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15A5E, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15A86, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x15A9A, 0x14, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x15AAE, 0x14, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x15AC2, 0x14, 0x6, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x15AD6, 0x14, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15A4A, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15A5E, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15A72, 0x14, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15A5E, 0x14, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15AEA, 0x14, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x15AFE, 0x14, 0x6, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x15B12, 0x14, 0x6, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x15B26, 0x14, 0x6, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x15B12, 0x14, 0x6, 0x13
		.4byte	AnimCmd_JumpBack, 0x5A

.align 2, 0
	anim_0398:
		.4byte anim_data__0398_0




.align 2, 0
	anim_data__0399_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15B3A, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15B4A, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x15B5A, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15B6E, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15B82, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15B92, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15BA2, 0x14, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15BB6, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x15BCA, 0x10, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x15BDA, 0x10, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15B5A, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15B6E, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15B82, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15B92, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15BEA, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15BFE, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15C12, 0x10, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x15BDA, 0x10, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0x50

.align 2, 0
	anim_0399:
		.4byte anim_data__0399_0




.align 2, 0
	anim_data__0400_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15C22, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0400_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15C36, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0400_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15C4A, 0xF, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0400_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15C59, 0xF, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15C68, 0xF, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15C77, 0xF, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15C86, 0xF, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15C59, 0xF, 0x6, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0400:
		.4byte anim_data__0400_0
		.4byte anim_data__0400_1
		.4byte anim_data__0400_2
		.4byte anim_data__0400_3




.align 2, 0
	anim_data__0412_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15C95, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15CA9, 0x14, 0x6, 0x1
		.4byte	AnimCmd_4
	anim_data__0412_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15CBD, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15CD1, 0x19, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x15CEA, 0x19, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15D03, 0x12, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15D15, 0x12, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15D27, 0x12, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0412_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15D39, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x15D52, 0x14, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15D66, 0x14, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15D7A, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15D8E, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x15DA2, 0x14, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0412:
		.4byte anim_data__0412_0
		.4byte anim_data__0412_1
		.4byte anim_data__0412_2




.align 2, 0
	anim_data__0413_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15DB6, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15DCA, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x15DE3, 0x19, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15DFC, 0x19, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0413_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15E15, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA
		.4byte	AnimCmd_6, 0x1, 0xA0EF0F2, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15E29, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15E3D, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15E51, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x15E65, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x15E79, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15E8D, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15EA1, 0x19, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0413:
		.4byte anim_data__0413_0
		.4byte anim_data__0413_1




.align 2, 0
	anim_data__0414_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15EBA, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0F8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x15ECE, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x15EE2, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x15EF6, 0x10, 0x3, 0x3
		.4byte	AnimCmd_4
	anim_data__0414_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x15F06, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x15F1A, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x15F2E, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x15F46, 0xF, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x15F55, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x15F69, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x15F7D, 0x18, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x15F95, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x15FAD, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x15FC1, 0x19, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x15FDA, 0x18, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x15FF2, 0x19, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1600B, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1601F, 0x14, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x16033, 0x14, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x16047, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1605B, 0x14, 0x3, 0x14
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0414:
		.4byte anim_data__0414_0
		.4byte anim_data__0414_1




.align 2, 0
	anim_data__0415_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1606F, 0xF
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1607E, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16092, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x160A6, 0xF, 0x2, 0x3
		.4byte	AnimCmd_4
	anim_data__0415_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x160B5, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA
		.4byte	AnimCmd_6, 0x1, 0xC1AF2E6, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x160D3, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x160E7, 0x1E, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16105, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1611D, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1612D, 0x18, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x27
	anim_data__0415_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x160B5, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA06F0F8, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16145, 0x19, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1615E, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x16172, 0x10, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x16182, 0x10, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x16192, 0x10, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x161A2, 0x10, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0415:
		.4byte anim_data__0415_0
		.4byte anim_data__0415_1
		.4byte anim_data__0415_2




.align 2, 0
	anim_data__0416_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x161B2, 0x12
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x161C4, 0x12, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x161D6, 0x12, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0416_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x161E8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x161FC, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16210, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16224, 0x14, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16238, 0x14, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1624C, 0x19, 0x4, 0x8
		.4byte	AnimCmd_4
	anim_data__0416_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16265, 0x18
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1627D, 0x18, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16295, 0x18, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0416:
		.4byte anim_data__0416_0
		.4byte anim_data__0416_1
		.4byte anim_data__0416_2




.align 2, 0
	anim_data__0417_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x162AD, 0x14
		.4byte	AnimCmd_6, 0x0, 0xD06F3FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x162C1, 0xF, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x162D0, 0xC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x162DC, 0x10, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x162EC, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16300, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16314, 0x10, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16324, 0x10, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x16334, 0x14, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x16348, 0x19, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x16361, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16375, 0x18, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1638D, 0x18, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x163A5, 0x18, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0417:
		.4byte anim_data__0417_0




.align 2, 0
	anim_data__0418_0:
		.4byte	AnimCmd_GetPalette, 0x1D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x163BD, 0xF
		.4byte	AnimCmd_6, 0x0, 0xC06F0FA, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x163CC, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x163E0, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x163F4, 0x14, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0418_1:
		.4byte	AnimCmd_GetPalette, 0x1D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16408, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1641C, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16430, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16444, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1645D, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x16471, 0x19, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1648A, 0x18, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x164A2, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x164BA, 0x18, 0x2, 0xC
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0418:
		.4byte anim_data__0418_0
		.4byte anim_data__0418_1




.align 2, 0
	anim_data__0419_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x164D2, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16512, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1006F2F8, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x13

.align 2, 0
	anim_0419:
		.4byte anim_data__0419_0




.align 2, 0
	anim_data__0420_0:
		.4byte	AnimCmd_GetPalette, 0x1D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16552, 0x14
		.4byte	AnimCmd_6, 0x0, 0xD06F0FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16566, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1657A, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16552, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16566, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1657A, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1658E, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x165A2, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x165B6, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x165CA, 0x18, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x165E2, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x165F6, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1660E, 0x18, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x16626, 0x1E, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16644, 0x19, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1665D, 0x18, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x16675, 0x1E, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x16693, 0x19, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x166AC, 0x18, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x166C4, 0x18, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x166DC, 0x19, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x166F5, 0x12, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x16707, 0x19, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x16720, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x16734, 0x12, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x16746, 0x18, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x1675E, 0x18, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x16776, 0x18, 0x3, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x1678E, 0x12, 0x3, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x167A0, 0x14, 0x3, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x167B4, 0x19, 0x3, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x167CD, 0x18, 0x3, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x167E5, 0x18, 0x3, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x167FD, 0x18, 0x3, 0x1E
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0420:
		.4byte anim_data__0420_0




.align 2, 0
	anim_data__0421_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16815, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0421_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16825, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0421_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16835, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0421_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16845, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0421_4:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16859, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0421_5:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1686D, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0421_6:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1687D, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0421_7:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1688D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0421:
		.4byte anim_data__0421_0
		.4byte anim_data__0421_1
		.4byte anim_data__0421_2
		.4byte anim_data__0421_3
		.4byte anim_data__0421_4
		.4byte anim_data__0421_5
		.4byte anim_data__0421_6
		.4byte anim_data__0421_7




.align 2, 0
	anim_data__0422_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x168A1, 0x40
		.4byte	AnimCmd_6, 0x0, 0x806F4FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x168E1, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16921, 0x40, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16961, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x169A1, 0x40, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x169E1, 0x40, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16A21, 0x40, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16A61, 0x40, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0422:
		.4byte anim_data__0422_0




.align 2, 0
	anim_data__0423_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16AA1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x23060AF8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0423_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16AB9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1CFD08EA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0423_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16ACD, 0x14
		.4byte	AnimCmd_6, 0x0, 0x11F600E2, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0423_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16AE1, 0xF
		.4byte	AnimCmd_6, 0x0, 0x6F6F6E1, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0423_4:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16AF0, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFFFAEDE7, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0423_5:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B04, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFAFDE4ED, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0423_6:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B18, 0xF
		.4byte	AnimCmd_6, 0x0, 0xF506DFF8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0423_7:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B27, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF912E402, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0423_8:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B39, 0x14
		.4byte	AnimCmd_6, 0x0, 0x21AEF09, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0423_9:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B4D, 0xF
		.4byte	AnimCmd_6, 0x0, 0x822FA0A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0423_10:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B5C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x121E0008, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0423_11:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B74, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1E160600, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0423:
		.4byte anim_data__0423_0
		.4byte anim_data__0423_1
		.4byte anim_data__0423_2
		.4byte anim_data__0423_3
		.4byte anim_data__0423_4
		.4byte anim_data__0423_5
		.4byte anim_data__0423_6
		.4byte anim_data__0423_7
		.4byte anim_data__0423_8
		.4byte anim_data__0423_9
		.4byte anim_data__0423_10
		.4byte anim_data__0423_11




.align 2, 0
	anim_data__0424_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B8D, 0xF
		.4byte	AnimCmd_6, 0x0, 0xF506DFF8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0424_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16B9C, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFAFDE4ED, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0424_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16BB0, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFFFAEDE7, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0424_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16BC4, 0xF
		.4byte	AnimCmd_6, 0x0, 0x6F6F6E1, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0424_4:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16BD3, 0x14
		.4byte	AnimCmd_6, 0x0, 0x11F600E2, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0424_5:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16BE7, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1CFD08EA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0424_6:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16BFB, 0x18
		.4byte	AnimCmd_6, 0x0, 0x23060AF8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0424_7:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C13, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1E160600, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0424_8:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C2C, 0x18
		.4byte	AnimCmd_6, 0x0, 0x121E0008, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0424_9:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C44, 0xF
		.4byte	AnimCmd_6, 0x0, 0x822FA0A, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0424_10:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C53, 0x14
		.4byte	AnimCmd_6, 0x0, 0x21AEF09, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0424_11:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C67, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF912E402, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0424:
		.4byte anim_data__0424_0
		.4byte anim_data__0424_1
		.4byte anim_data__0424_2
		.4byte anim_data__0424_3
		.4byte anim_data__0424_4
		.4byte anim_data__0424_5
		.4byte anim_data__0424_6
		.4byte anim_data__0424_7
		.4byte anim_data__0424_8
		.4byte anim_data__0424_9
		.4byte anim_data__0424_10
		.4byte anim_data__0424_11




.align 2, 0
	anim_data__0425_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16C79, 0x18, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16C91, 0x18, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16CA9, 0x18, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16C91, 0x18, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0425:
		.4byte anim_data__0425_0




.align 2, 0
	anim_data__0426_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16CC1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1A0600FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16CD9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1206FEFA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16CED, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06FEFA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16CFD, 0x10
		.4byte	AnimCmd_6, 0x0, 0x406F7FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x16D0D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6EAFA, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16D25, 0x14
		.4byte	AnimCmd_6, 0x0, 0x606F2FA, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16D39, 0x10
		.4byte	AnimCmd_6, 0x0, 0x806FAFA, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16D49, 0x14
		.4byte	AnimCmd_6, 0x0, 0x140600FA, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x16CC1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1A0600FA, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16CD9, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1206FEFA, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16CED, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA06FEFA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16CFD, 0x10
		.4byte	AnimCmd_6, 0x0, 0x406F7FA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x16D0D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6EAFA, 0x2, 0x4
		.4byte	AnimCmd_4
	anim_data__0426_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16D5D, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x16D75, 0x14
		.4byte	AnimCmd_6, 0x0, 0x206EEFA, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x16D89, 0x10
		.4byte	AnimCmd_6, 0x0, 0x106F2FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16D99, 0x10
		.4byte	AnimCmd_6, 0x0, 0xC06FCFA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x16DA9, 0x18
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x16DC1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06FAFA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x16DD5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x606F6FA, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x16DE5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x106ECFA, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x16D5D, 0x18
		.4byte	AnimCmd_6, 0x0, 0x6E8FA, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x16D75, 0x14
		.4byte	AnimCmd_6, 0x0, 0x206EEFA, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x16D89, 0x10
		.4byte	AnimCmd_6, 0x0, 0x106F2FA, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16D99, 0x10
		.4byte	AnimCmd_6, 0x0, 0xC06FCFA, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x16DA9, 0x18
		.4byte	AnimCmd_6, 0x0, 0x160600FA, 0x2, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_0426:
		.4byte anim_data__0426_0
		.4byte anim_data__0426_1




.align 2, 0
	anim_data__0427_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16DF9, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCFC, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16E09, 0x10
		.4byte	AnimCmd_6, 0x0, 0x20EF2FC, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16E19, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFF0EF1FC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16E31, 0x10
		.4byte	AnimCmd_6, 0x0, 0xEF2FC, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x16E41, 0xC
		.4byte	AnimCmd_6, 0x0, 0x60EFAFC, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16E4D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x100E02FC, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16E61, 0x18
		.4byte	AnimCmd_6, 0x0, 0x140E02FC, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16E79, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE0E00FC, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x16DF9, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0EFCFC, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0427_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16E8D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x60EF8FC, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x16E9D, 0x10
		.4byte	AnimCmd_6, 0x0, 0xC0E00FC, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x16EAD, 0x18
		.4byte	AnimCmd_6, 0x0, 0x130E02FC, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x16EC5, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE0EFEFC, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x16ED5, 0xC
		.4byte	AnimCmd_6, 0x0, 0x80EFAFC, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x16EE1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xEF0FC, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x16EF5, 0x18
		.4byte	AnimCmd_6, 0x0, 0xEECFC, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x16F0D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x20EF2FC, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x16E8D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x60EF8FC, 0x2, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0427:
		.4byte anim_data__0427_0
		.4byte anim_data__0427_1




.align 2, 0
	anim_data__0428_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16F21, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFD07E3FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16F2D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDFBE3EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16F41, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDF5E3E9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16F55, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDFBE3EF, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x16F69, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFD07E3FB, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x16F75, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFD13E307, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x16F89, 0x18
		.4byte	AnimCmd_6, 0x0, 0xFD15E309, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x16FA1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFD0FE303, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x16F21, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFD07E3FB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16F2D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDFBE3EF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16F41, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDF5E3E9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x16F55, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFDFBE3EF, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x16F69, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFD07E3FB, 0x2, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0428:
		.4byte anim_data__0428_0




.align 2, 0
	anim_data__0429_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x16FB5, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x16FCD, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x16FE5, 0x1E, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17003, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1701B, 0x12, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1702D, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17045, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1705D, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0429_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17075, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17089, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1709D, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x170B1, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x170C5, 0x19, 0x3, 0xC
		.4byte	AnimCmd_4
	anim_data__0429_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x170DE, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x170F6, 0x18, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1710E, 0x18, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0429:
		.4byte anim_data__0429_0
		.4byte anim_data__0429_1
		.4byte anim_data__0429_2




.align 2, 0
	anim_data__0430_0:
		.4byte	AnimCmd_GetPalette, 0x22, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17126, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1713A, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1714E, 0x14, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0430_1:
		.4byte	AnimCmd_GetPalette, 0x22, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17162, 0x14
		.4byte	AnimCmd_6, 0x0, 0x806EEFA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17176, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1718A, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1719E, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x171B6, 0x14, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0430_2:
		.4byte	AnimCmd_GetPalette, 0x22, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x171CA, 0x19
		.4byte	AnimCmd_6, 0x0, 0xA06F0FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x171E3, 0x1E, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17201, 0x19, 0x3, 0xA
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0430:
		.4byte anim_data__0430_0
		.4byte anim_data__0430_1
		.4byte anim_data__0430_2




.align 2, 0
	anim_data__0431_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1721A, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1206F8FA, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17233, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17247, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1725B, 0x10, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1726B, 0x19, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17284, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17298, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x172AC, 0x14, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0431:
		.4byte anim_data__0431_0




.align 2, 0
	anim_data__0432_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x172C0, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0432_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x172D4, 0xF
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0432_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x172E3, 0xC
		.4byte	AnimCmd_6, 0x0, 0x1006F6FA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0432_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x172EF, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1406FAFA, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0432_4:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x172FF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1406FAFA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0432_5:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17313, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1606FCFA, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0432_6:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17327, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1406FAFA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0432_7:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17337, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1406FAFA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0432_8:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17347, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1206F8FA, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0432_9:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1735B, 0x19
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0432_10:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17374, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0432:
		.4byte anim_data__0432_0
		.4byte anim_data__0432_1
		.4byte anim_data__0432_2
		.4byte anim_data__0432_3
		.4byte anim_data__0432_4
		.4byte anim_data__0432_5
		.4byte anim_data__0432_6
		.4byte anim_data__0432_7
		.4byte anim_data__0432_8
		.4byte anim_data__0432_9
		.4byte anim_data__0432_10




.align 2, 0
	anim_data__0433_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17388, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1739C, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x173B0, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x173C4, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x173D8, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x173EC, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17400, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17414, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0433_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17428, 0x14
		.4byte	AnimCmd_6, 0x0, 0xE06F4FA, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1743C, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17450, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17464, 0x14, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x17478, 0x14, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1748C, 0x14, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x174A0, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x174B4, 0x14, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0433:
		.4byte anim_data__0433_0
		.4byte anim_data__0433_1




.align 2, 0
	anim_data__0434_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x174C8, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF6F6
		.4byte	AnimCmd_6, 0x1, 0xA0AF6F6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x174D8, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x174E8, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x174F8, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17508, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17518, 0x10, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17528, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17538, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x31

.align 2, 0
	anim_0434:
		.4byte anim_data__0434_0




.align 2, 0
	anim_data__0435_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17548, 0x19
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17561, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1757A, 0x19, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17593, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x175A7, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x175C0, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x175D9, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x175F2, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0435_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17602, 0x18
		.4byte	AnimCmd_6, 0x0, 0xC06F2FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1761A, 0x12, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1762C, 0x12, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1763E, 0xF, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1762C, 0x12, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1761A, 0x12, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0435:
		.4byte anim_data__0435_0
		.4byte anim_data__0435_1




.align 2, 0
	anim_data__0436_0:
		.4byte	AnimCmd_GetPalette, 0x23, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1764D, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA0BF0FE, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1765F, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA00F0F4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17677, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xAFAF0EC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17695, 0x18
		.4byte	AnimCmd_6, 0x0, 0xAFEF0F0, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x176AD, 0x12
		.4byte	AnimCmd_6, 0x0, 0xA04F0F8, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x176BF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA12F004, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x176D7, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xA13F004, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x176F5, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA12F002, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x43

.align 2, 0
	anim_0436:
		.4byte anim_data__0436_0




.align 2, 0
	anim_data__0437_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1770D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x1006F4FA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1771D, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1772D, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1773D, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1774D, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1775D, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1776D, 0x10, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1777D, 0x10, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0437_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1778D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06F6FA, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x177A1, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x177B5, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x177C9, 0x14, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x177DD, 0x14, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x177F1, 0x14, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x17805, 0x14, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x17819, 0x14, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0437_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1782D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA06EEFA, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17841, 0x14, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x17855, 0x14, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x17869, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1787D, 0x14, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x17891, 0x14, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x178A5, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x178B9, 0x14, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x2E

.align 2, 0
	anim_0437:
		.4byte anim_data__0437_0
		.4byte anim_data__0437_1
		.4byte anim_data__0437_2




.align 2, 0
	anim_data__0438_0:
		.4byte	AnimCmd_GetPalette, 0x24, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0438:
		.4byte anim_data__0438_0




.align 2, 0
	anim_data__0439_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x178CD, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1306FDFA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1790D, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1794D, 0x40, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0439:
		.4byte anim_data__0439_0




.align 2, 0
	anim_data__0449_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1798D, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0449_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x179A1, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0449:
		.4byte anim_data__0449_0
		.4byte anim_data__0449_1




.align 2, 0
	anim_data__0450_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x179B5, 0x14, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x179C9, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x179DD, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x179ED, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17A01, 0x19, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17A1A, 0x10, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0450_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17A2A, 0xF, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17A39, 0x14, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17A4D, 0x14, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17A61, 0x14, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17A75, 0x14, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17A89, 0x14, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0450_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17A9D, 0x10, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x17AAD, 0x10, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x17ABD, 0x10, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x17ACD, 0x10, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x17ADD, 0x10, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17AED, 0x10, 0x3, 0x11
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0450_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17AFD, 0x10, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x17B0D, 0x14, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x17B21, 0x10, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x17B31, 0x10, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x17B41, 0x14, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x17B55, 0x10, 0x3, 0x17
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0450:
		.4byte anim_data__0450_0
		.4byte anim_data__0450_1
		.4byte anim_data__0450_2
		.4byte anim_data__0450_3




.align 2, 0
	anim_data__0451_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17B65, 0x24, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17B89, 0x19, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0451_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17BA2, 0x10, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0451_2:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17BB2, 0x19, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17BCB, 0x19, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0451_3:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17BE4, 0x14, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0451:
		.4byte anim_data__0451_0
		.4byte anim_data__0451_1
		.4byte anim_data__0451_2
		.4byte anim_data__0451_3




.align 2, 0
	anim_data__0452_0:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17BF8, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17C08, 0x18, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17C20, 0x14, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0452_1:
		.4byte	AnimCmd_GetPalette, 0x1B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17C34, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17C44, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17C58, 0x19, 0x6, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0452:
		.4byte anim_data__0452_0
		.4byte anim_data__0452_1




.align 2, 0
	anim_data__0453_0:
		.4byte	AnimCmd_GetPalette, 0x25, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17C71, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17C81, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17C91, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17CA1, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17CB1, 0x10, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17CC1, 0x10, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0453:
		.4byte anim_data__0453_0




.align 2, 0
	anim_data__0454_0:
		.4byte	AnimCmd_GetPalette, 0x26, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x17CD1, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17CE5, 0xF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17CF4, 0xF, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17D03, 0xF, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17D12, 0xF, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17D21, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17D35, 0xF, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17D44, 0xF, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17D53, 0xF, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17D62, 0xF, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17D71, 0x14, 0x3, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0454:
		.4byte anim_data__0454_0




.align 2, 0
	anim_data__0455_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17D85, 0x9, 0x9, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17D8E, 0x9, 0x9, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17D97, 0x9, 0x9, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17DA0, 0x9, 0x9, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17DA9, 0x9, 0x9, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17DB2, 0x9, 0x9, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17D97, 0x9, 0x9, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17DBB, 0x9, 0x9, 0x6
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0455:
		.4byte anim_data__0455_0




.align 2, 0
	anim_data__0456_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17DC4, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17DCD, 0x9, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0456:
		.4byte anim_data__0456_0




.align 2, 0
	anim_data__0457_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17DD6, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17DDF, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17DE8, 0x6, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17DEE, 0x6, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17DF4, 0x6, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17DFA, 0x9, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17E03, 0x6, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17E09, 0x6, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__0457_1:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17E0F, 0x9
		.4byte	AnimCmd_6, 0x1, 0x80DEEF3, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17E18, 0x9, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0457:
		.4byte anim_data__0457_0
		.4byte anim_data__0457_1




.align 2, 0
	anim_data__0458_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17E21, 0x9, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17E2A, 0x9, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17E33, 0x9, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17E3C, 0x9, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17E45, 0x9, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17E4E, 0x9, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17E57, 0x9, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17E60, 0x9, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17E69, 0x9, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17E72, 0x9, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17E7B, 0x9, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17E84, 0x9, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x17E8D, 0x9, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x17E96, 0x9, 0x5, 0xD
		.4byte	AnimCmd_JumpBack, 0x49

.align 2, 0
	anim_0458:
		.4byte anim_data__0458_0




.align 2, 0
	anim_data__0459_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17E9F, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17EA8, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17EB1, 0x9, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17EBA, 0x9, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17EC3, 0x9, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17ECC, 0x9, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17ED5, 0x9, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17EDE, 0x9, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0459:
		.4byte anim_data__0459_0




.align 2, 0
	anim_data__0460_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17EE7, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17EF0, 0x9, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17EF9, 0x9, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17F02, 0x9, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17F0B, 0x9, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17F14, 0x9, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17F1D, 0x9, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17F26, 0x9, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17F2F, 0x9, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17F38, 0x9, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17F41, 0x9, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17F38, 0x9, 0x6, 0x9
		.4byte	AnimCmd_JumpBack, 0x14
	anim_data__0460_1:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17F4A, 0x9, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x17F53, 0x9, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x17F5C, 0x9, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x17F53, 0x9, 0x6, 0xC
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0460:
		.4byte anim_data__0460_0
		.4byte anim_data__0460_1




.align 2, 0
	anim_data__0461_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17F65, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17F6E, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17F77, 0x9, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17F6E, 0x9, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0461:
		.4byte anim_data__0461_0




.align 2, 0
	anim_data__0462_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x17F80, 0x9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x17F89, 0x9, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x17F92, 0x9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x17F9B, 0x9, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x17FA4, 0x9, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x17FAD, 0x9, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x17FB6, 0x9, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x17FBF, 0x9, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x17FC8, 0x9, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x17FD1, 0x9, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x17FDA, 0x9, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x17FE3, 0x9, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x17FEC, 0x9, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x17FF5, 0x9, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x17FFE, 0x9, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x18007, 0x9, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x18010, 0x9, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18019, 0x9, 0x4, 0x11
		.4byte	AnimCmd_JumpBack, 0x5D

.align 2, 0
	anim_0462:
		.4byte anim_data__0462_0




.align 2, 0
	anim_data__0463_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18022, 0x6, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x18028, 0x6, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1802E, 0x6, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18034, 0x6, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1803A, 0x6, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18040, 0x6, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x18046, 0x9, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1804F, 0x9, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x18058, 0x9, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x18061, 0x9, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0463_1:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x1806A, 0x9, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x18073, 0x9, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1807C, 0x9, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x18085, 0x6, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1808B, 0x6, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x18091, 0x6, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x18091, 0x6, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x18091, 0x6, 0x4, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x18097, 0x6, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1809D, 0x6, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x180A3, 0x6, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x180A9, 0x6, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x180AF, 0x9, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x180B8, 0x9, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x180C1, 0x9, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x180CA, 0x9, 0x6, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x180D3, 0x9, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x180DC, 0x9, 0x4, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x180E5, 0x9, 0x4, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x180EE, 0x9, 0x4, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x180F7, 0x9, 0x4, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x18100, 0x9, 0x10, 0x1D
		.4byte	AnimCmd_4

.align 2, 0
	anim_0463:
		.4byte anim_data__0463_0
		.4byte anim_data__0463_1




.align 2, 0
	anim_data__0464_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18109, 0x9, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x18112, 0x9, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1811B, 0x9, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18124, 0x9, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1812D, 0x9, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18136, 0x9, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1813F, 0x9, 0x1A, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x18148, 0x6, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1814E, 0x6, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x18154, 0x9, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1815D, 0x9, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x18166, 0x6, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1816C, 0x6, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x18172, 0x6, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x18178, 0x6, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1817E, 0x6, 0x3, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1816C, 0x6, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x18172, 0x6, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x18184, 0x6, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1818A, 0x6, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x18190, 0x6, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x18196, 0x6, 0x6, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1819C, 0x6, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x181A2, 0x6, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x181A8, 0x6, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x181AE, 0x9, 0x2, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x181B7, 0x9, 0x2, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x181C0, 0x9, 0x5, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x181C9, 0x9, 0x3, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x181D2, 0x9, 0x3, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x181DB, 0x6, 0xE, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x181E1, 0x6, 0x3, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x181E7, 0x6, 0x3, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x181ED, 0x6, 0x4, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x181F3, 0x6, 0x2, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x181F9, 0x6, 0x2, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x181FF, 0x6, 0x2, 0x22
		.4byte	AnimCmd_4

.align 2, 0
	anim_0464:
		.4byte anim_data__0464_0




.align 2, 0
	anim_data__0465_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18205, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1820E, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18217, 0x9, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1820E, 0x9, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0465:
		.4byte anim_data__0465_0




.align 2, 0
	anim_data__0466_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18220, 0x9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x18229, 0x9, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18232, 0x9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1823B, 0x9, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0466:
		.4byte anim_data__0466_0




.align 2, 0
	anim_data__0467_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18244, 0x6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1824A, 0x6, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18250, 0x6, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18256, 0x6, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1825C, 0x6, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18262, 0x6, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x18268, 0x6, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1826E, 0x6, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0467:
		.4byte anim_data__0467_0




.align 2, 0
	anim_data__0468_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x18274, 0x6, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1827A, 0x6, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18280, 0x6, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18286, 0x6, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x18280, 0x6, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1827A, 0x6, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0468:
		.4byte anim_data__0468_0




.align 2, 0
	anim_data__0469_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x1828C, 0x4, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x18290, 0x4, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18294, 0x4, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18298, 0x4, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1829C, 0x4, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x182A0, 0x4, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x182A4, 0x4, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x182A8, 0x4, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x182AC, 0x4, 0x8, 0x8
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0469:
		.4byte anim_data__0469_0




.align 2, 0
	anim_data__0470_0:
		.4byte	AnimCmd_GetPalette, 0x27, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x182B0, 0x9, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x182B9, 0x9, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x182C2, 0x9, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x182CB, 0x9, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x182D4, 0x9, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x182DD, 0x9, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x182E6, 0x9, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x182CB, 0x9, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x182EF, 0x9, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x182F8, 0x9, 0x5, 0x8
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0470:
		.4byte anim_data__0470_0




.align 2, 0
	anim_data__0471_0:
		.4byte	AnimCmd_GetPalette, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18301, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x18315, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18329, 0x14, 0x4, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0471:
		.4byte anim_data__0471_0




.align 2, 0
	anim_data__0472_0:
		.4byte	AnimCmd_GetPalette, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1833D, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1834D, 0x10, 0xA, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1835D, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1833D, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1836D, 0x14, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x18381, 0x14, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18395, 0x18, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x183AD, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetPalette, 0x28, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x183C5, 0x18, 0x3, 0x7
		.4byte	AnimCmd_GetPalette, 0x29, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x183DD, 0x18, 0x3, 0x8
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x183F5, 0x18, 0x1, 0x9
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x1840D, 0x18, 0x1, 0xA
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18425, 0x18, 0x1, 0xB
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x1843D, 0x18, 0x1, 0xC
		.4byte	AnimCmd_JumpBack, 0x20
	anim_data__0472_1:
		.4byte	AnimCmd_GetPalette, 0x2C, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x18455, 0x24, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x18479, 0x38, 0x3, 0xE
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0472:
		.4byte anim_data__0472_0
		.4byte anim_data__0472_1




.align 2, 0
	anim_data__0473_0:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x184B1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60DF6F2
		.4byte	AnimCmd_6, 0x1, 0x60DF6F2, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x184C9, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x184E1, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x184F9, 0x18, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x26
	anim_data__0473_1:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18511, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60DF6F2
		.4byte	AnimCmd_6, 0x1, 0xB03F1EC, 0x2, 0x4
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x18529, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18541, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetPalette, 0x2B, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x18559, 0x18, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x26
	anim_data__0473_2:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18571, 0x40, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0473:
		.4byte anim_data__0473_0
		.4byte anim_data__0473_1
		.4byte anim_data__0473_2




.align 2, 0
	anim_data__0474_0:
		.4byte	AnimCmd_GetPalette, 0x2D, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x185B1, 0x28, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x185D9, 0x28, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x18601, 0x28, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x18629, 0x28, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0474_1:
		.4byte	AnimCmd_GetPalette, 0x2D, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18651, 0x28, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x18679, 0x28, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x186A1, 0x28, 0x3, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0474:
		.4byte anim_data__0474_0
		.4byte anim_data__0474_1




.align 2, 0
	anim_data__0475_0:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x186C9, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0475_1:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18709, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60BFAEF, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18721, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18739, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18751, 0x18, 0x2, 0x4
		.4byte	AnimCmd_JumpBack, 0x23
	anim_data__0475_2:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18769, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60BFAEF, 0x2, 0x5
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18781, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18799, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x187B1, 0x18, 0x2, 0x8
		.4byte	AnimCmd_JumpBack, 0x23
	anim_data__0475_3:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x187C9, 0x18
		.4byte	AnimCmd_6, 0x0, 0x60BFAEF, 0x2, 0x9
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x187E1, 0x18, 0x2, 0xA
		.4byte	AnimCmd_GetPalette, 0x2A, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x187F9, 0x18, 0x2, 0xB
		.4byte	AnimCmd_GetPalette, 0x2B, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x18811, 0x18, 0x2, 0xC
		.4byte	AnimCmd_JumpBack, 0x23
	anim_data__0475_4:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18829, 0x30
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0xD00F3E7, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x18859, 0x30, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x18889, 0x30, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x188B9, 0x30, 0x2, 0x10
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_5:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x188E9, 0x30
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0xD00F3E7, 0x2, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x18919, 0x30, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x18949, 0x30, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x18979, 0x18, 0x2, 0x14
		.4byte	AnimCmd_4
	anim_data__0475_6:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18991, 0x31
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0x1405FAEC, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x189C2, 0x31, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x189F3, 0x31, 0x2, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x18A24, 0x31, 0x2, 0x18
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_7:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18A55, 0x31
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0x1405FAEC, 0x2, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x18A86, 0x38, 0x2, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x18ABE, 0x31, 0x2, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x18AEF, 0x1E, 0x2, 0x1C
		.4byte	AnimCmd_4
	anim_data__0475_8:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18B0D, 0x30
		.4byte	AnimCmd_6, 0x0, 0x910F8F4
		.4byte	AnimCmd_6, 0x1, 0x190CFFF3, 0x2, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x18B3D, 0x30, 0x2, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x18B6D, 0x30, 0x2, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x18B9D, 0x30, 0x2, 0x20
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_9:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18BCD, 0x30
		.4byte	AnimCmd_6, 0x0, 0x910F8F4
		.4byte	AnimCmd_6, 0x1, 0x190CFFF3, 0x2, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x18BFD, 0x30, 0x2, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x18C2D, 0x30, 0x2, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x18C5D, 0x18, 0x2, 0x24
		.4byte	AnimCmd_4
	anim_data__0475_10:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18C75, 0x31
		.4byte	AnimCmd_6, 0x0, 0x811F7F5
		.4byte	AnimCmd_6, 0x1, 0x1413FAFA, 0x2, 0x25
		.4byte	AnimCmd_GetTileIndex, 0x18CA6, 0x31, 0x2, 0x26
		.4byte	AnimCmd_GetTileIndex, 0x18CD7, 0x31, 0x2, 0x27
		.4byte	AnimCmd_GetTileIndex, 0x18D08, 0x31, 0x2, 0x28
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_11:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18D39, 0x31
		.4byte	AnimCmd_6, 0x0, 0x811F7F5
		.4byte	AnimCmd_6, 0x1, 0x1413FAFA, 0x2, 0x29
		.4byte	AnimCmd_GetTileIndex, 0x18D6A, 0x38, 0x2, 0x2A
		.4byte	AnimCmd_GetTileIndex, 0x18DA2, 0x31, 0x2, 0x2B
		.4byte	AnimCmd_GetTileIndex, 0x18DD3, 0x1E, 0x2, 0x2C
		.4byte	AnimCmd_4
	anim_data__0475_12:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18DF1, 0x30
		.4byte	AnimCmd_6, 0x0, 0x914F8F8
		.4byte	AnimCmd_6, 0x1, 0xD19F300, 0x2, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x18E21, 0x30, 0x2, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x18E51, 0x30, 0x2, 0x2F
		.4byte	AnimCmd_GetTileIndex, 0x18E81, 0x30, 0x2, 0x30
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_13:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18EB1, 0x30
		.4byte	AnimCmd_6, 0x0, 0x914F8F8
		.4byte	AnimCmd_6, 0x1, 0xD19F300, 0x2, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x18EE1, 0x30, 0x2, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x18F11, 0x30, 0x2, 0x33
		.4byte	AnimCmd_GetTileIndex, 0x18F41, 0x18, 0x2, 0x34
		.4byte	AnimCmd_4
	anim_data__0475_14:
		.4byte	AnimCmd_GetPalette, 0x2F, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x18F59, 0x40
		.4byte	AnimCmd_6, 0x0, 0x90FF8F3
		.4byte	AnimCmd_6, 0x1, 0x613ECFA, 0x2, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x18F99, 0x40, 0x2, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x18FD9, 0x40, 0x2, 0x37
		.4byte	AnimCmd_GetTileIndex, 0x19019, 0x40, 0x2, 0x38
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_15:
		.4byte	AnimCmd_GetPalette, 0x2F, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x19059, 0x40
		.4byte	AnimCmd_6, 0x0, 0x811F7F5
		.4byte	AnimCmd_6, 0x1, 0x613ECFA, 0x2, 0x39
		.4byte	AnimCmd_GetTileIndex, 0x19099, 0x40, 0x2, 0x3A
		.4byte	AnimCmd_GetTileIndex, 0x190D9, 0x40, 0x2, 0x3B
		.4byte	AnimCmd_GetTileIndex, 0x19119, 0x40, 0x2, 0x3C
		.4byte	AnimCmd_4
	anim_data__0475_16:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x19159, 0x40
		.4byte	AnimCmd_6, 0x0, 0x30CF2F0
		.4byte	AnimCmd_6, 0x1, 0xCE6F3, 0x2, 0x3D
		.4byte	AnimCmd_GetTileIndex, 0x19199, 0x40, 0x2, 0x3E
		.4byte	AnimCmd_GetTileIndex, 0x191D9, 0x40, 0x2, 0x3F
		.4byte	AnimCmd_GetTileIndex, 0x19219, 0x40, 0x2, 0x40
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_17:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x19259, 0x40
		.4byte	AnimCmd_6, 0x0, 0x30CF2F0
		.4byte	AnimCmd_6, 0x1, 0xCE6F3, 0x2, 0x41
		.4byte	AnimCmd_GetTileIndex, 0x19299, 0x40, 0x2, 0x42
		.4byte	AnimCmd_GetTileIndex, 0x192D9, 0x40, 0x2, 0x43
		.4byte	AnimCmd_GetTileIndex, 0x19319, 0x40, 0x2, 0x44
		.4byte	AnimCmd_4
	anim_data__0475_18:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x19359, 0x40
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0x605ECEC, 0x2, 0x45
		.4byte	AnimCmd_GetTileIndex, 0x19399, 0x40, 0x2, 0x46
		.4byte	AnimCmd_GetTileIndex, 0x193D9, 0x40, 0x2, 0x47
		.4byte	AnimCmd_GetTileIndex, 0x19419, 0x40, 0x2, 0x48
		.4byte	AnimCmd_JumpBack, 0x1D
	anim_data__0475_19:
		.4byte	AnimCmd_GetPalette, 0x2E, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x19459, 0x40
		.4byte	AnimCmd_6, 0x0, 0x80BF7EF
		.4byte	AnimCmd_6, 0x1, 0x605ECEC, 0x2, 0x49
		.4byte	AnimCmd_GetTileIndex, 0x19499, 0x40, 0x2, 0x4A
		.4byte	AnimCmd_GetTileIndex, 0x194D9, 0x40, 0x2, 0x4B
		.4byte	AnimCmd_GetTileIndex, 0x19519, 0x40, 0x2, 0x4C
		.4byte	AnimCmd_4

.align 2, 0
	anim_0475:
		.4byte anim_data__0475_0
		.4byte anim_data__0475_1
		.4byte anim_data__0475_2
		.4byte anim_data__0475_3
		.4byte anim_data__0475_4
		.4byte anim_data__0475_5
		.4byte anim_data__0475_6
		.4byte anim_data__0475_7
		.4byte anim_data__0475_8
		.4byte anim_data__0475_9
		.4byte anim_data__0475_10
		.4byte anim_data__0475_11
		.4byte anim_data__0475_12
		.4byte anim_data__0475_13
		.4byte anim_data__0475_14
		.4byte anim_data__0475_15
		.4byte anim_data__0475_16
		.4byte anim_data__0475_17
		.4byte anim_data__0475_18
		.4byte anim_data__0475_19




.align 2, 0
	anim_data__0476_0:
		.4byte	AnimCmd_GetPalette, 0x30, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x19559, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x70DF8F3, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19577, 0x1E, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19595, 0x1E, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x195B3, 0x1E, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x195D1, 0x24, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x195F5, 0x24, 0x5, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0476_1:
		.4byte	AnimCmd_GetPalette, 0x31, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x19619, 0x10, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0476_2:
		.4byte	AnimCmd_GetPalette, 0x31, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x19629, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0476:
		.4byte anim_data__0476_0
		.4byte anim_data__0476_1
		.4byte anim_data__0476_2




.align 2, 0
	anim_data__0477_0:
		.4byte	AnimCmd_GetTileIndex, 0x1962D, 0x40
		.4byte	AnimCmd_GetPalette, 0x32, 0x900010
		.4byte	AnimCmd_6, 0x0, 0xFF0EE3F1, 0x6, 0x0
		.4byte	AnimCmd_6, 0x0, 0xFF0EE3F1, 0x6, 0x1
		.4byte	AnimCmd_6, 0x0, 0xFF0EE3F1, 0x6, 0x2
		.4byte	AnimCmd_6, 0x0, 0xFF0EE3F1, 0x6, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0477:
		.4byte anim_data__0477_0




.align 2, 0
	anim_data__0478_0:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1966D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x109EBF8, 0x7, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19681, 0x14
		.4byte	AnimCmd_6, 0x0, 0x109EBF8, 0x7, 0x1
		.4byte	AnimCmd_JumpBack, 0x13
	anim_data__0478_1:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19695, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFA09DCFB, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x196A4, 0x10
		.4byte	AnimCmd_6, 0x0, 0xEF09E0F7, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x196B4, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF40BE2F7, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x196C8, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFA09DFF9, 0x8, 0x5
		.4byte	AnimCmd_4
	anim_data__0478_2:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x196E1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xBF0F4, 0x8, 0x6
		.4byte	AnimCmd_4
	anim_data__0478_3:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x196F5, 0x14
		.4byte	AnimCmd_6, 0x0, 0xBF0F4, 0x5, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0478:
		.4byte anim_data__0478_0
		.4byte anim_data__0478_1
		.4byte anim_data__0478_2
		.4byte anim_data__0478_3




.align 2, 0
	anim_data__0479_0:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19709, 0x14
		.4byte	AnimCmd_6, 0x0, 0xB14F1FF, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1971D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xB14F1FF, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19731, 0x14
		.4byte	AnimCmd_6, 0x0, 0xB14F1FF, 0x5, 0x2
		.4byte	AnimCmd_JumpBack, 0x1B
	anim_data__0479_1:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19745, 0x14
		.4byte	AnimCmd_6, 0x0, 0x814F1FF, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19759, 0x14
		.4byte	AnimCmd_6, 0x0, 0xA19F1FF, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1976D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xD14F1FF, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19781, 0x14
		.4byte	AnimCmd_6, 0x0, 0x814F1FF, 0x5, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0479:
		.4byte anim_data__0479_0
		.4byte anim_data__0479_1




.align 2, 0
	anim_data__0480_0:
		.4byte	AnimCmd_GetPalette, 0x33, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19795, 0x4
		.4byte	AnimCmd_6, 0x0, 0x504FCFC, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0480:
		.4byte anim_data__0480_0




.align 2, 0
	anim_data__0481_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x19799, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA09F9F6, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x197A9, 0x10
		.4byte	AnimCmd_6, 0x0, 0x907FBF8, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x197B9, 0x10
		.4byte	AnimCmd_6, 0x0, 0x606FBFB, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x197C9, 0xC, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0481:
		.4byte anim_data__0481_0




.align 2, 0
	anim_data__0482_0:
		.4byte	AnimCmd_GetPalette, 0x35, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x197D5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x90DFBF6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x197E5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x90DFBF6, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x13
	anim_data__0482_1:
		.4byte	AnimCmd_GetPalette, 0x35, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x197F5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1207FCF6, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19809, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1207FCF6, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x13
	anim_data__0482_2:
		.4byte	AnimCmd_GetPalette, 0x35, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1981D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x907FBFA, 0x5, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0482:
		.4byte anim_data__0482_0
		.4byte anim_data__0482_1
		.4byte anim_data__0482_2




.align 2, 0
	anim_data__0483_0:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1982D, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFF04ECFC
		.4byte	AnimCmd_6, 0x1, 0xFC1AEFEA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0483_1:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19836, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFF04ECFC
		.4byte	AnimCmd_6, 0x1, 0xFC1AEFEA, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1983F, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFF04ECFC
		.4byte	AnimCmd_6, 0x1, 0xFC1AEFEA, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0483:
		.4byte anim_data__0483_0
		.4byte anim_data__0483_1




.align 2, 0
	anim_data__0484_0:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19848, 0x6, 0x4, 0x0
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1984E, 0x6, 0x4, 0x1
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19854, 0x6, 0x4, 0x2
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1985A, 0x6, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x20

.align 2, 0
	anim_0484:
		.4byte anim_data__0484_0




.align 2, 0
	anim_data__0485_0:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19860, 0x8
		.4byte	AnimCmd_6, 0x0, 0xD0BF2F5, 0xC, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19868, 0x8, 0xC, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19870, 0x6, 0xC, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19876, 0x8, 0xC, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0485:
		.4byte anim_data__0485_0




.align 2, 0
	anim_data__0486_0:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1987E, 0x1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0486:
		.4byte anim_data__0486_0




.align 2, 0
	anim_data__0487_0:
		.4byte	AnimCmd_GetPalette, 0x36, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1987F, 0x4
		.4byte	AnimCmd_6, 0x0, 0x504FDFC, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19883, 0x4, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19887, 0x4, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1988B, 0x4, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0487:
		.4byte anim_data__0487_0




.align 2, 0
	anim_data__0488_0:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1988F, 0x10
		.4byte	AnimCmd_6, 0x0, 0x807F7F8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0488_1:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1989F, 0x10
		.4byte	AnimCmd_6, 0x0, 0x808F7F9, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0488:
		.4byte anim_data__0488_0
		.4byte anim_data__0488_1




.align 2, 0
	anim_data__0489_0:
		.4byte	AnimCmd_GetPalette, 0x38, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198AF, 0x4
		.4byte	AnimCmd_6, 0x0, 0x808F8F8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0489:
		.4byte anim_data__0489_0




.align 2, 0
	anim_data__0490_0:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198B3, 0x6
		.4byte	AnimCmd_6, 0x0, 0xCEEF4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0490_1:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198B9, 0x6
		.4byte	AnimCmd_6, 0x0, 0xC00F5EE, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0490:
		.4byte anim_data__0490_0
		.4byte anim_data__0490_1




.align 2, 0
	anim_data__0491_0:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198BF, 0x1
		.4byte	AnimCmd_6, 0x0, 0x303FDFD, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x198C0, 0x1, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0491:
		.4byte anim_data__0491_0




.align 2, 0
	anim_data__0492_0:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198C1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE7EF, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0492_1:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198C1, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE7EF, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x198D5, 0xF, 0x6, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0492_2:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x198E4, 0xF
		.4byte	AnimCmd_6, 0x0, 0xFE7EF, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x198F3, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19907, 0x19, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19920, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19939, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19952, 0x19, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x19939, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x198F3, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x198E4, 0xF, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x198C1, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x198C1, 0x14, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0492_3:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1996B, 0x19
		.4byte	AnimCmd_6, 0x0, 0xFE7EF, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x19984, 0x19, 0x2, 0x9
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0492_4:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1999D, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFE7EF, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x199B1, 0x19, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x199CA, 0x1E, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x199E8, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x19A06, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x19A24, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x19A06, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x199B1, 0x19, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1999D, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x19984, 0x19, 0x2, 0x9
		.4byte	AnimCmd_4
	anim_data__0492_5:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19A42, 0x14
		.4byte	AnimCmd_6, 0x0, 0xEE7F3, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x19A56, 0x14
		.4byte	AnimCmd_6, 0x0, 0xDE7F2, 0x2, 0x11
		.4byte	AnimCmd_4
	anim_data__0492_6:
		.4byte	AnimCmd_GetPalette, 0x37, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19A6A, 0x19
		.4byte	AnimCmd_6, 0x0, 0xEE7F3, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x19A83, 0x19
		.4byte	AnimCmd_6, 0x0, 0xCE7F2, 0x2, 0x13
		.4byte	AnimCmd_4

.align 2, 0
	anim_0492:
		.4byte anim_data__0492_0
		.4byte anim_data__0492_1
		.4byte anim_data__0492_2
		.4byte anim_data__0492_3
		.4byte anim_data__0492_4
		.4byte anim_data__0492_5
		.4byte anim_data__0492_6




.align 2, 0
	anim_data__0493_0:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19A9C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1A0A02F7, 0x5, 0x0
		.4byte	AnimCmd_4
	anim_data__0493_1:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19AB0, 0x14
		.4byte	AnimCmd_6, 0x0, 0x1A0A02F7, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19AC4, 0xF, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19AD3, 0x14, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19AE7, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19AFB, 0xF, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19B0A, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19B1E, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x19B32, 0x14, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x19B46, 0x14, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x19B5A, 0x14, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x19B6E, 0x14, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x19B82, 0x14, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x19B96, 0x14, 0x5, 0xD
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0493:
		.4byte anim_data__0493_0
		.4byte anim_data__0493_1




.align 2, 0
	anim_data__0494_0:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19BAA, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x9D7F8
		.4byte	AnimCmd_6, 0x1, 0xE20BD7FF, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19BC8, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x8E0F6
		.4byte	AnimCmd_6, 0x1, 0xF0F6E4EA, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19BE6, 0x18
		.4byte	AnimCmd_6, 0x0, 0x9E2F7
		.4byte	AnimCmd_6, 0x1, 0xF9F1EEE6, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19BFE, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x7E0F5
		.4byte	AnimCmd_6, 0x1, 0xF0F6E4EA, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19C1C, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x8D7F7
		.4byte	AnimCmd_6, 0x1, 0xE201D7F5, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19C3A, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xBE0F9
		.4byte	AnimCmd_6, 0x1, 0xF016E40A, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19C58, 0x18
		.4byte	AnimCmd_6, 0x0, 0x9E2F7
		.4byte	AnimCmd_6, 0x1, 0xF91AEE0F, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19C70, 0x1E
		.4byte	AnimCmd_6, 0x0, 0xBE0F9
		.4byte	AnimCmd_6, 0x1, 0xF016E40A, 0x6, 0x7
		.4byte	AnimCmd_JumpBack, 0x5B

.align 2, 0
	anim_0494:
		.4byte anim_data__0494_0




.align 2, 0
	anim_data__0495_0:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19C8E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x7E6F9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0495_1:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19C8E, 0x10
		.4byte	AnimCmd_6, 0x0, 0x7E6F9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19C9E, 0xC, 0x6, 0x1
		.4byte	AnimCmd_4
	anim_data__0495_2:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19CAA, 0x12
		.4byte	AnimCmd_6, 0x0, 0x7E6F9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0495_3:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19CBC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x7E6F9, 0x3, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0495:
		.4byte anim_data__0495_0
		.4byte anim_data__0495_1
		.4byte anim_data__0495_2
		.4byte anim_data__0495_3




.align 2, 0
	anim_data__0496_0:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19CD0, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE70AD6F9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0496_1:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19CD0, 0x10
		.4byte	AnimCmd_6, 0x0, 0xE70AD6F9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19CE0, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19CF0, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19D00, 0x10, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0496_2:
		.4byte	AnimCmd_GetPalette, 0x3A, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19D10, 0x10
		.4byte	AnimCmd_6, 0x0, 0x909F8F8, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19D20, 0x10, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19D30, 0x10, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19D40, 0x10, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0496:
		.4byte anim_data__0496_0
		.4byte anim_data__0496_1
		.4byte anim_data__0496_2




.align 2, 0
	anim_data__0497_0:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19D50, 0xC
		.4byte	AnimCmd_6, 0x0, 0xAEDF6, 0x1E, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19D5C, 0xC, 0x5, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0497_1:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19D68, 0xC
		.4byte	AnimCmd_6, 0x0, 0xAEDF6
		.4byte	AnimCmd_6, 0x1, 0xF8F3, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19D74, 0xC, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19D80, 0xC, 0x6, 0x4
		.4byte	AnimCmd_4
	anim_data__0497_2:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19D74, 0xC
		.4byte	AnimCmd_6, 0x0, 0xAEDF6
		.4byte	AnimCmd_6, 0x1, 0xF5F1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19D68, 0xC, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0497_3:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19D8C, 0xC
		.4byte	AnimCmd_6, 0x0, 0xAEDF6, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19D98, 0xC, 0x4, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0497:
		.4byte anim_data__0497_0
		.4byte anim_data__0497_1
		.4byte anim_data__0497_2
		.4byte anim_data__0497_3




.align 2, 0
	anim_data__0498_0:
		.4byte	AnimCmd_GetPalette, 0x39, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19DA4, 0x4
		.4byte	AnimCmd_6, 0x0, 0x404FEFD, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19DA8, 0x4, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0498:
		.4byte anim_data__0498_0




.align 2, 0
	anim_data__0499_0:
		.4byte	AnimCmd_GetPalette, 0x3B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19DAC, 0x24
		.4byte	AnimCmd_6, 0x0, 0xE015D5EC
		.4byte	AnimCmd_6, 0x1, 0xFC0BE0F6, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19DD0, 0x24, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19DAC, 0x24, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19DF4, 0x24, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0x1D

.align 2, 0
	anim_0499:
		.4byte anim_data__0499_0




.align 2, 0
	anim_data__0500_0:
		.4byte	AnimCmd_GetPalette, 0x3B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19E18, 0xA
		.4byte	AnimCmd_6, 0x0, 0x10F3F4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0500_1:
		.4byte	AnimCmd_GetPalette, 0x3B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19E22, 0xC
		.4byte	AnimCmd_6, 0x0, 0xDF2F2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19E2E, 0xC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19E3A, 0xC, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0500_2:
		.4byte	AnimCmd_GetPalette, 0x3B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19E46, 0x8
		.4byte	AnimCmd_6, 0x0, 0xCF2F5, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19E4E, 0x8, 0xA, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19E56, 0x8, 0xA, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19E5E, 0x8
		.4byte	AnimCmd_6, 0x0, 0xCF2F5, 0xA, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0500:
		.4byte anim_data__0500_0
		.4byte anim_data__0500_1
		.4byte anim_data__0500_2




.align 2, 0
	anim_data__0501_0:
		.4byte	AnimCmd_GetPalette, 0x3C, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19E66, 0xA
		.4byte	AnimCmd_6, 0x0, 0x909F2F7, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19E70, 0xA, 0xA, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19E7A, 0xA, 0xA, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19E70, 0xA, 0xA, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0501_1:
		.4byte	AnimCmd_GetPalette, 0x3C, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19E84, 0xA
		.4byte	AnimCmd_6, 0x0, 0x909F2F7, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19E8E, 0xA, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19E98, 0xA, 0xA, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19EA2, 0xA, 0xF, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19EAC, 0xA, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x19EB6, 0xA, 0xA, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0501:
		.4byte anim_data__0501_0
		.4byte anim_data__0501_1




.align 2, 0
	anim_data__0502_0:
		.4byte	AnimCmd_GetPalette, 0x3C, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19EC0, 0x2
		.4byte	AnimCmd_6, 0x0, 0x302FAFE, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19EC2, 0x3, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0502:
		.4byte anim_data__0502_0




.align 2, 0
	anim_data__0503_0:
		.4byte	AnimCmd_GetPalette, 0x3D, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19EC5, 0xC
		.4byte	AnimCmd_6, 0x0, 0x10E9F1, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19ED1, 0xF, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19EE0, 0xF, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19ED1, 0xF, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0503_1:
		.4byte	AnimCmd_GetPalette, 0x3D, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19EC5, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFE0CE6F5, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19EEF, 0xC, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19EFB, 0x10, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19F0B, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFE0CE6F5, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19F1B, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19F2B, 0x10, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0503_2:
		.4byte	AnimCmd_GetPalette, 0x3D, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19F3B, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFF0DE5F4, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x19EFB, 0x10, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19EEF, 0xC, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x19EC5, 0xC, 0x5, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0503:
		.4byte anim_data__0503_0
		.4byte anim_data__0503_1
		.4byte anim_data__0503_2




.align 2, 0
	anim_data__0504_0:
		.4byte	AnimCmd_GetPalette, 0x3D, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x19F4B, 0xC
		.4byte	AnimCmd_6, 0x0, 0xA09F8F7, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19F57, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x19F63, 0xC, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0504:
		.4byte anim_data__0504_0




.align 2, 0
	anim_data__0505_0:
		.4byte	AnimCmd_GetPalette, 0x3E, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19F6F, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA0AF5F4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x19F87, 0x18, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0505_1:
		.4byte	AnimCmd_GetPalette, 0x3E, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19F9F, 0x10
		.4byte	AnimCmd_6, 0x0, 0xA0AF5F4, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x19FAF, 0x10, 0x4, 0x3
		.4byte	AnimCmd_4
	anim_data__0505_2:
		.4byte	AnimCmd_GetPalette, 0x3E, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x19FBF, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA0AF5F4, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x19FD7, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19FEB, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19FFF, 0x10, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A00F, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1A01F, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1A02F, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A00F, 0x10, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1A01F, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1A02F, 0x10, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A03F, 0x10, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1A01F, 0x10, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x19FFF, 0x10, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x19FEB, 0x14, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x19FD7, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x19FBF, 0x18, 0x5, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0505:
		.4byte anim_data__0505_0
		.4byte anim_data__0505_1
		.4byte anim_data__0505_2




.align 2, 0
	anim_data__0506_0:
		.4byte	AnimCmd_GetPalette, 0x3E, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A04F, 0x4
		.4byte	AnimCmd_6, 0x0, 0x202FEFE, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A053, 0x4, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A057, 0x4, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0506:
		.4byte anim_data__0506_0




.align 2, 0
	anim_data__0507_0:
		.4byte	AnimCmd_GetPalette, 0x3F, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A05B, 0x14
		.4byte	AnimCmd_6, 0x0, 0xAE6F6, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A06F, 0x14, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A083, 0x14, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A097, 0x14, 0x5, 0x3
		.4byte	AnimCmd_4
	anim_data__0507_1:
		.4byte	AnimCmd_GetPalette, 0x3F, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A0AB, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFC0AE2F6, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A0BF, 0x14, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0507_2:
		.4byte	AnimCmd_GetPalette, 0x3F, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A0D3, 0x14
		.4byte	AnimCmd_6, 0x0, 0xAE6F6, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A0E7, 0x14, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A0FB, 0x10, 0x5, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0507:
		.4byte anim_data__0507_0
		.4byte anim_data__0507_1
		.4byte anim_data__0507_2




.align 2, 0
	anim_data__0508_0:
		.4byte	AnimCmd_GetPalette, 0x3F, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A10B, 0x8
		.4byte	AnimCmd_6, 0x0, 0x808F8F8, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A113, 0x8, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A11B, 0x8, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A123, 0x8, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0508:
		.4byte anim_data__0508_0




.align 2, 0
	anim_data__0509_0:
		.4byte	AnimCmd_GetPalette, 0x40, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A12B, 0x18
		.4byte	AnimCmd_6, 0x0, 0xA10F9EF, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A15B, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A16F, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A187, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A19F, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A1B3, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A12B, 0x18, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A15B, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A12B, 0x18, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A15B, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A12B, 0x18, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A15B, 0x14, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A143, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A16F, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A187, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A19F, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A1B3, 0x18, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A16F, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A187, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A19F, 0x14, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A1B3, 0x18, 0x3, 0x6
		.4byte	AnimCmd_JumpBack, 0x92

.align 2, 0
	anim_0509:
		.4byte anim_data__0509_0




.align 2, 0
	anim_data__0510_0:
		.4byte	AnimCmd_GetPalette, 0x40, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A1CB, 0x3
		.4byte	AnimCmd_6, 0x0, 0xA02F7FE, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A1CE, 0x3, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A1D1, 0x3, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0510_1:
		.4byte	AnimCmd_GetPalette, 0x40, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1A1D4, 0x3
		.4byte	AnimCmd_6, 0x0, 0xA02F7FE, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A1D7, 0x3, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A1DA, 0x3, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A1DD, 0x3, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A1D1, 0x3, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A1E0, 0x3, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0510:
		.4byte anim_data__0510_0
		.4byte anim_data__0510_1




.align 2, 0
	anim_data__0511_0:
		.4byte	AnimCmd_GetPalette, 0x41, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A1E3, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC0BF4F5, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0511_1:
		.4byte	AnimCmd_GetPalette, 0x41, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A1FC, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC0BF4F5, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A215, 0x19, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A22E, 0x19, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A247, 0x19, 0x5, 0x4
		.4byte	AnimCmd_4
	anim_data__0511_2:
		.4byte	AnimCmd_GetPalette, 0x41, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A247, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC0BF4F5, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A260, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A279, 0x19, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A292, 0x19, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0511_3:
		.4byte	AnimCmd_GetPalette, 0x41, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A247, 0x19
		.4byte	AnimCmd_6, 0x0, 0xC0BF4F5, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A22E, 0x19, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A215, 0x19, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A1FC, 0x19, 0x5, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0511:
		.4byte anim_data__0511_0
		.4byte anim_data__0511_1
		.4byte anim_data__0511_2
		.4byte anim_data__0511_3




.align 2, 0
	anim_data__0512_0:
		.4byte	AnimCmd_GetPalette, 0x42, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A2AB, 0xC
		.4byte	AnimCmd_6, 0x0, 0x908F7F8, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A2B7, 0xC, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A2C3, 0xC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A2CF, 0xC, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A2DB, 0xC, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A2E7, 0xC, 0x4, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0512_1:
		.4byte	AnimCmd_GetPalette, 0x42, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A2F3, 0xC
		.4byte	AnimCmd_6, 0x0, 0x808F7F8, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A2FF, 0xC, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A30B, 0xC, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1A317, 0xC, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1A323, 0xC, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A32F, 0xC, 0x4, 0xB
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0512_2:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A33B, 0x9
		.4byte	AnimCmd_6, 0x0, 0x808F1F8, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1A344, 0x9, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1A34D, 0x9, 0x5, 0xE
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0512_3:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A356, 0x9
		.4byte	AnimCmd_6, 0x0, 0x808F8F1, 0x5, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1A35F, 0x9, 0x5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1A368, 0x9, 0x5, 0x11
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0512:
		.4byte anim_data__0512_0
		.4byte anim_data__0512_1
		.4byte anim_data__0512_2
		.4byte anim_data__0512_3




.align 2, 0
	anim_data__0513_0:
		.4byte	AnimCmd_GetPalette, 0x42, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A371, 0xA
		.4byte	AnimCmd_6, 0x0, 0xBF3F1, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A37B, 0xF, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A38A, 0xA, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A394, 0xF, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0513_1:
		.4byte	AnimCmd_GetPalette, 0x42, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A3A3, 0x8
		.4byte	AnimCmd_6, 0x0, 0xDF3F4, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A3AB, 0x8, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A3B3, 0x8, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A3BB, 0x8, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0513:
		.4byte anim_data__0513_0
		.4byte anim_data__0513_1




.align 2, 0
	anim_data__0514_0:
		.4byte	AnimCmd_GetPalette, 0x42, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1A3C3, 0x10
		.4byte	AnimCmd_6, 0x0, 0xB09F2F7
		.4byte	AnimCmd_6, 0x1, 0x210FFF0, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A3D3, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A3E3, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A3FB, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A413, 0x18, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A42B, 0x10, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x27

.align 2, 0
	anim_0514:
		.4byte anim_data__0514_0




.align 2, 0
	anim_data__0515_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A43B, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A43F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A443, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A43F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0515:
		.4byte anim_data__0515_0




.align 2, 0
	anim_data__0516_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A447, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A44B, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A44F, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A44B, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0516:
		.4byte anim_data__0516_0




.align 2, 0
	anim_data__0517_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A453, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A457, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A45B, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A457, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0517:
		.4byte anim_data__0517_0




.align 2, 0
	anim_data__0518_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A45F, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A463, 0x4, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A467, 0x4, 0xA, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A463, 0x4, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0518:
		.4byte anim_data__0518_0




.align 2, 0
	anim_data__0519_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A46B, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A46F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A473, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A46F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0519:
		.4byte anim_data__0519_0




.align 2, 0
	anim_data__0520_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A477, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A47B, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A47F, 0x4, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0520:
		.4byte anim_data__0520_0




.align 2, 0
	anim_data__0521_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A483, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A487, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A48B, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A487, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0521:
		.4byte anim_data__0521_0




.align 2, 0
	anim_data__0522_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A48F, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A493, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A497, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A493, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0522:
		.4byte anim_data__0522_0




.align 2, 0
	anim_data__0523_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A49B, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A49F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4A3, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A49F, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0523:
		.4byte anim_data__0523_0




.align 2, 0
	anim_data__0524_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4A7, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4AB, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4AF, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4AB, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0524:
		.4byte anim_data__0524_0




.align 2, 0
	anim_data__0525_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4B3, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4B7, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4BB, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4B7, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0525:
		.4byte anim_data__0525_0




.align 2, 0
	anim_data__0526_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4BF, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4C3, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4C7, 0x4, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0526:
		.4byte anim_data__0526_0




.align 2, 0
	anim_data__0527_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4CB, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4CF, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4D3, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4CF, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0527:
		.4byte anim_data__0527_0




.align 2, 0
	anim_data__0528_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4D7, 0x4, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4DB, 0x4, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4DF, 0x4, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4DB, 0x4, 0x6, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0528:
		.4byte anim_data__0528_0




.align 2, 0
	anim_data__0529_0:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1A4E3, 0x4, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4E7, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4EB, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4E7, 0x4, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0529:
		.4byte anim_data__0529_0




.align 2, 0
	anim_data__0530_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A4EF, 0x3, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A4F2, 0x3, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A4F5, 0x5, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A4FA, 0x5, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A4FF, 0xE, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A50D, 0xE, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A51B, 0xE, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A529, 0xE, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A537, 0x9, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1A540, 0x9, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1A549, 0x6, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A54F, 0x9, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0530:
		.4byte anim_data__0530_0




.align 2, 0
	anim_data__0531_0:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A558, 0x4
		.4byte	AnimCmd_6, 0x0, 0x340AFEFE, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A55C, 0x4, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A560, 0x4, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A564, 0x4, 0x18, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A568, 0x4, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A56C, 0x4, 0x8, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0531_1:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A570, 0x4, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A574, 0x4, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A578, 0x4, 0x6, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0531:
		.4byte anim_data__0531_0
		.4byte anim_data__0531_1




.align 2, 0
	anim_data__0532_0:
		.4byte	AnimCmd_GetPalette, 0x45, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A57C, 0x4, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A580, 0x4, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A584, 0x2, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A586, 0x4, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A58A, 0x4, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A58E, 0x4, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A592, 0x2, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A594, 0x4, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0532_1:
		.4byte	AnimCmd_GetPalette, 0x45, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A594, 0x4
		.4byte	AnimCmd_6, 0x0, 0xC28F414, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0532:
		.4byte anim_data__0532_0
		.4byte anim_data__0532_1




.align 2, 0
	anim_data__0533_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1A598, 0x12, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A5AA, 0x12, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A5BC, 0x12, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0533:
		.4byte anim_data__0533_0




.align 2, 0
	anim_data__0534_0:
		.4byte	AnimCmd_GetTileIndex, 0x1A5CE, 0x6
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010, 0xC, 0x0, 0xC, 0x1, 0xC, 0x2
		.4byte	AnimCmd_JumpBack, 0x9

.align 2, 0
	anim_0534:
		.4byte anim_data__0534_0




.align 2, 0
	anim_data__0535_0:
		.4byte	AnimCmd_GetPalette, 0x46, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1A5D4, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0535:
		.4byte anim_data__0535_0




.align 2, 0
	anim_data__0536_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A614, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0536_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A614, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A620, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A62C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5DFFB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A640, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E3FB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A650, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5E0FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0536_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A664, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0536_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A664, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A670, 0xC
		.4byte	AnimCmd_6, 0x0, 0x512FB00, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A67C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x521FB00, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A690, 0x10
		.4byte	AnimCmd_6, 0x0, 0x51DFB00, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1A6A0, 0x14
		.4byte	AnimCmd_6, 0x0, 0x520FB00, 0x3, 0x9
		.4byte	AnimCmd_4
	anim_data__0536_4:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A6B4, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0536_5:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A6B4, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A6C0, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFB10F106, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1A6C9, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF01BE611, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1A6DD, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF417EA0D, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1A6ED, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF11AE710, 0x3, 0xE
		.4byte	AnimCmd_4
	anim_data__0536_6:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A6FD, 0x8
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__0536_7:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A6FD, 0x8
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1A705, 0x6
		.4byte	AnimCmd_6, 0x0, 0x10F906, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1A70B, 0xF
		.4byte	AnimCmd_6, 0x0, 0xF81BEE11, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1A71A, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFC17F20D, 0x5, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1A726, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF91AEF10, 0x3, 0x13
		.4byte	AnimCmd_4

.align 2, 0
	anim_0536:
		.4byte anim_data__0536_0
		.4byte anim_data__0536_1
		.4byte anim_data__0536_2
		.4byte anim_data__0536_3
		.4byte anim_data__0536_4
		.4byte anim_data__0536_5
		.4byte anim_data__0536_6
		.4byte anim_data__0536_7




.align 2, 0
	anim_data__0537_0:
		.4byte	AnimCmd_GetPalette, 0x47, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0537_1:
		.4byte	AnimCmd_GetPalette, 0x47, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A73E, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A74A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A74A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0537_2:
		.4byte	AnimCmd_GetPalette, 0x47, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A73E, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A75A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E4FB, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A76A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E6FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0537_3:
		.4byte	AnimCmd_GetPalette, 0x47, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A732, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A73E, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A77A, 0x18
		.4byte	AnimCmd_6, 0x0, 0x5D3FB, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A74A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A75A, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E4FB, 0x3, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0537:
		.4byte anim_data__0537_0
		.4byte anim_data__0537_1
		.4byte anim_data__0537_2
		.4byte anim_data__0537_3




.align 2, 0
	anim_data__0538_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A792, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF8D0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0538_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A7B6, 0x12, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A7C8, 0x18, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A7E0, 0x14, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A7F4, 0x18, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1A7C8, 0x18, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A80C, 0x12, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A7B6, 0x12, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A81E, 0x12, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A830, 0x12, 0x5, 0x8
		.4byte	AnimCmd_4
	anim_data__0538_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A7B6, 0x12, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A7C8, 0x18, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A80C, 0x12, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A7B6, 0x12, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A81E, 0x12, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A830, 0x12, 0x5, 0x8
		.4byte	AnimCmd_4
	anim_data__0538_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A7B6, 0x12, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1A81E, 0x12, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A7A4, 0x12, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A830, 0x12, 0x5, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0538:
		.4byte anim_data__0538_0
		.4byte anim_data__0538_1
		.4byte anim_data__0538_2
		.4byte anim_data__0538_3




.align 2, 0
	anim_data__0539_0:
		.4byte	AnimCmd_GetPalette, 0x48, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1A842, 0x20
		.4byte	AnimCmd_6, 0x0, 0x20400000, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0539:
		.4byte anim_data__0539_0




.align 2, 0
	anim_data__0540_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A862, 0x8
		.4byte	AnimCmd_6, 0x0, 0x8F2F0, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A86A, 0x8, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A872, 0x8, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0540_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A87A, 0xC
		.4byte	AnimCmd_6, 0x0, 0x209F3F0, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1A886, 0xC, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1A892, 0xC, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0540_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A89E, 0xC
		.4byte	AnimCmd_6, 0x0, 0x209F4F0, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1A8AA, 0xC, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1A8B6, 0xC, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0540_3:
		.4byte	AnimCmd_GetPalette, 0x49, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A8C2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x709EEF0, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1A8D2, 0x10, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1A8E2, 0x10, 0x1, 0xB
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0540_4:
		.4byte	AnimCmd_GetPalette, 0x49, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A8F2, 0xC
		.4byte	AnimCmd_6, 0x0, 0x607F2F0, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1A8FE, 0xC, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1A90A, 0xC, 0x1, 0xE
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0540_5:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A916, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1000F8F2, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1A91E, 0x8, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1A926, 0x8, 0x1, 0x11
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0540:
		.4byte anim_data__0540_0
		.4byte anim_data__0540_1
		.4byte anim_data__0540_2
		.4byte anim_data__0540_3
		.4byte anim_data__0540_4
		.4byte anim_data__0540_5




.align 2, 0
	anim_data__0541_0:
		.4byte	AnimCmd_GetPalette, 0x48, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1A92E, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF818F6E8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0541:
		.4byte anim_data__0541_0




.align 2, 0
	anim_data__0542_0:
		.4byte	AnimCmd_GetPalette, 0x4A, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1A940, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFE8F0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0542_1:
		.4byte	AnimCmd_GetPalette, 0x4A, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1A950, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0542_2:
		.4byte	AnimCmd_GetPalette, 0x4A, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1A954, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0542_3:
		.4byte	AnimCmd_GetPalette, 0x4A, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1A95C, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF18F000, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0542:
		.4byte anim_data__0542_0
		.4byte anim_data__0542_1
		.4byte anim_data__0542_2
		.4byte anim_data__0542_3




.align 2, 0
	anim_data__0543_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A96C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x14E5EC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0543_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A980, 0xF
		.4byte	AnimCmd_6, 0x0, 0x14EAEC, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0543:
		.4byte anim_data__0543_0
		.4byte anim_data__0543_1




.align 2, 0
	anim_data__0544_0:
		.4byte	AnimCmd_GetPalette, 0x4B, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A98F, 0xC, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A99B, 0xC, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1A9A7, 0xC, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0544:
		.4byte anim_data__0544_0




.align 2, 0
	anim_data__0545_0:
		.4byte	AnimCmd_GetPalette, 0x4B, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1A9B3, 0x2D, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1A9E0, 0x2D, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AA0D, 0x2D, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0545:
		.4byte anim_data__0545_0




.align 2, 0
	anim_data__0546_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA3A, 0x9
		.4byte	AnimCmd_6, 0x0, 0xC07F4F9, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0xB
	anim_data__0546_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA43, 0x9, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA4C, 0x9, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA55, 0x9, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_4:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA5E, 0x9, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_5:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA67, 0x9, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_6:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA3A, 0x9, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_7:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA43, 0x9, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_8:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA4C, 0x9, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_9:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA55, 0x9, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_10:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA5E, 0x9, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0546_11:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA67, 0x9, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0546:
		.4byte anim_data__0546_0
		.4byte anim_data__0546_1
		.4byte anim_data__0546_2
		.4byte anim_data__0546_3
		.4byte anim_data__0546_4
		.4byte anim_data__0546_5
		.4byte anim_data__0546_6
		.4byte anim_data__0546_7
		.4byte anim_data__0546_8
		.4byte anim_data__0546_9
		.4byte anim_data__0546_10
		.4byte anim_data__0546_11




.align 2, 0
	anim_data__0547_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA70, 0x4, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AA74, 0x4, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AA78, 0x4, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AA7C, 0x4, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AA80, 0x4, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1AA84, 0x4, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1AA78, 0x4, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AA7C, 0x4, 0x5, 0x3
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0547:
		.4byte anim_data__0547_0




.align 2, 0
	anim_data__0548_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA88, 0x2, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AA8A, 0x2, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AA8C, 0x2, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AA8E, 0x2, 0x5, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0548:
		.4byte anim_data__0548_0




.align 2, 0
	anim_data__0549_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AA90, 0x4, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AA94, 0x4, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AA98, 0x4, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AA9C, 0x4, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AAA0, 0x4, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1AAA4, 0x4, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1AA98, 0x4, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AA9C, 0x4, 0x5, 0x3
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0549:
		.4byte anim_data__0549_0




.align 2, 0
	anim_data__0550_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AAA8, 0x2, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AAAA, 0x2, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AAAC, 0x2, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AAAE, 0x1, 0x5, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0550:
		.4byte anim_data__0550_0




.align 2, 0
	anim_data__0551_0:
		.4byte	AnimCmd_GetPalette, 0x4C, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1AAAF, 0xE, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0551:
		.4byte anim_data__0551_0




.align 2, 0
	anim_data__0552_0:
		.4byte	AnimCmd_GetPalette, 0x4D, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0552:
		.4byte anim_data__0552_0




.align 2, 0
	anim_data__0553_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AABD, 0xC, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AAC9, 0xC, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AAD5, 0xC, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AAE1, 0x6, 0x6, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0553:
		.4byte anim_data__0553_0




.align 2, 0
	anim_data__0554_0:
		.4byte	AnimCmd_GetPalette, 0x4E, 0x100, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0554:
		.4byte anim_data__0554_0




.align 2, 0
	anim_data__0555_0:
		.4byte	AnimCmd_GetPalette, 0x5E, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1AAE7, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0555:
		.4byte anim_data__0555_0




.align 2, 0
	anim_data__0556_0:
		.4byte	AnimCmd_GetPalette, 0x5F, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0556:
		.4byte anim_data__0556_0




.align 2, 0
	anim_data__0557_0:
		.4byte	AnimCmd_GetPalette, 0x60, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0557:
		.4byte anim_data__0557_0




.align 2, 0
	anim_data__0558_0:
		.4byte	AnimCmd_GetPalette, 0x61, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0558:
		.4byte anim_data__0558_0




.align 2, 0
	anim_data__0559_0:
		.4byte	AnimCmd_GetPalette, 0x62, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0559:
		.4byte anim_data__0559_0




.align 2, 0
	anim_data__0560_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AAEB, 0xC, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AAF7, 0xC, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AB03, 0xC, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0560:
		.4byte anim_data__0560_0




.align 2, 0
	anim_data__0561_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB0F, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0561_1:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB13, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0561_2:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB17, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0561_3:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB1B, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0561_4:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0561_5:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB1F, 0x2, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0561_6:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB21, 0x4, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0561:
		.4byte anim_data__0561_0
		.4byte anim_data__0561_1
		.4byte anim_data__0561_2
		.4byte anim_data__0561_3
		.4byte anim_data__0561_4
		.4byte anim_data__0561_5
		.4byte anim_data__0561_6




.align 2, 0
	anim_data__0562_0:
		.4byte	AnimCmd_GetPalette, 0x48, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB25, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018EFE8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0562:
		.4byte anim_data__0562_0




.align 2, 0
	anim_data__0563_0:
		.4byte	AnimCmd_GetPalette, 0x48, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB3D, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0563_1:
		.4byte	AnimCmd_GetPalette, 0x48, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB41, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0563:
		.4byte anim_data__0563_0
		.4byte anim_data__0563_1




.align 2, 0
	anim_data__0564_0:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB42, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0564_1:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB52, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0564_2:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB53, 0x1, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0564:
		.4byte anim_data__0564_0
		.4byte anim_data__0564_1
		.4byte anim_data__0564_2




.align 2, 0
	anim_data__0565_0:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB54, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0565:
		.4byte anim_data__0565_0




.align 2, 0
	anim_data__0566_0:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AB94, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF818F6E8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0566_1:
		.4byte	AnimCmd_GetPalette, 0x64, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1ABA6, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018EFE8, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0566:
		.4byte anim_data__0566_0
		.4byte anim_data__0566_1




.align 2, 0
	anim_data__0567_0:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0567_1:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABCE, 0xC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABDA, 0x8, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1ABE2, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1ABDA, 0x8, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABCE, 0xC, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0567_2:
		.4byte	AnimCmd_GetPalette, 0x43, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ABE2, 0x8, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1ABCE, 0xC, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABDA, 0x8, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABC6, 0x8, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ABBE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0567:
		.4byte anim_data__0567_0
		.4byte anim_data__0567_1
		.4byte anim_data__0567_2




.align 2, 0
	anim_data__0568_0:
		.4byte	AnimCmd_GetPalette, 0x65, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ABEA, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130EF0F2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0568_1:
		.4byte	AnimCmd_GetPalette, 0x65, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ABEA, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130EF0F2, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ABFE, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AC12, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AC2E, 0x18, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AC46, 0x1C, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0568_2:
		.4byte	AnimCmd_GetPalette, 0x65, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AC62, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130EF0F2, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0568_3:
		.4byte	AnimCmd_GetPalette, 0x65, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AC62, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130EF0F2, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1AC76, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1AC8A, 0x1C, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1ACA6, 0x18, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1ACBE, 0x1C, 0x3, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0568:
		.4byte anim_data__0568_0
		.4byte anim_data__0568_1
		.4byte anim_data__0568_2
		.4byte anim_data__0568_3




.align 2, 0
	anim_data__0569_0:
		.4byte	AnimCmd_GetPalette, 0x66, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDA, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0569_1:
		.4byte	AnimCmd_GetPalette, 0x66, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDC, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0569:
		.4byte anim_data__0569_0
		.4byte anim_data__0569_1




.align 2, 0
	anim_data__0570_0:
		.4byte	AnimCmd_GetPalette, 0x67, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDD, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0570_1:
		.4byte	AnimCmd_GetPalette, 0x67, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDD, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ACE9, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ACF5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E2FB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AD05, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5E8FB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AD11, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E6FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0570_2:
		.4byte	AnimCmd_GetPalette, 0x67, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDD, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ACE9, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ACF5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E2FB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AD05, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5E8FB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AD11, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E6FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0570_3:
		.4byte	AnimCmd_GetPalette, 0x67, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1ACDD, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1ACE9, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1ACF5, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E2FB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AD05, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5E8FB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AD11, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E6FB, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0570:
		.4byte anim_data__0570_0
		.4byte anim_data__0570_1
		.4byte anim_data__0570_2
		.4byte anim_data__0570_3




.align 2, 0
	anim_data__0571_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AD21, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130DF0F3, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0571_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AD21, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130DF0F3, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AD35, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AD49, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AD65, 0x1C, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AD81, 0x1C, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0571_2:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AD9D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130DF0F3, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0571_3:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AD9D, 0x14
		.4byte	AnimCmd_6, 0x0, 0x130DF0F3, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1ADB1, 0x14, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1ADC5, 0x1C, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1ADE1, 0x1C, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1ADFD, 0x1C, 0x3, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0571:
		.4byte anim_data__0571_0
		.4byte anim_data__0571_1
		.4byte anim_data__0571_2
		.4byte anim_data__0571_3




.align 2, 0
	anim_data__0572_0:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AE19, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0572_1:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AE19, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AE25, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AE31, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5DFFB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AE45, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E3FB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AE55, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5E0FB, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0572:
		.4byte anim_data__0572_0
		.4byte anim_data__0572_1




.align 2, 0
	anim_data__0573_0:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AE69, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0573_1:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AE69, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1AE75, 0xC
		.4byte	AnimCmd_6, 0x0, 0x512FB00, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1AE81, 0x14
		.4byte	AnimCmd_6, 0x0, 0x521FB00, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1AE95, 0x10
		.4byte	AnimCmd_6, 0x0, 0x51DFB00, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1AEA5, 0x14
		.4byte	AnimCmd_6, 0x0, 0x520FB00, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0573_2:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AEB9, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0573_3:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AEB9, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1AEC9, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFB10F106, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1AED2, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF01BE611, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1AEEB, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF417EA0D, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1AF04, 0x19
		.4byte	AnimCmd_6, 0x0, 0xF11AE710, 0x3, 0x9
		.4byte	AnimCmd_4
	anim_data__0573_4:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AF1D, 0xC
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0573_5:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AF1D, 0xC
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1AF29, 0x6
		.4byte	AnimCmd_6, 0x0, 0x10F906, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1AF2F, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF81BEE11, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1AF43, 0x14
		.4byte	AnimCmd_6, 0x0, 0xFC17F20D, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1AF57, 0x14
		.4byte	AnimCmd_6, 0x0, 0xF91AEF10, 0x3, 0xE
		.4byte	AnimCmd_4

.align 2, 0
	anim_0573:
		.4byte anim_data__0573_0
		.4byte anim_data__0573_1
		.4byte anim_data__0573_2
		.4byte anim_data__0573_3
		.4byte anim_data__0573_4
		.4byte anim_data__0573_5




.align 2, 0
	anim_data__0574_0:
		.4byte	AnimCmd_GetPalette, 0x6A, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AF6B, 0x12
		.4byte	AnimCmd_6, 0x0, 0xF817F6E9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0574_1:
		.4byte	AnimCmd_GetPalette, 0x6B, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AF7D, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0574_2:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1AFA1, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018EFE8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0574:
		.4byte anim_data__0574_0
		.4byte anim_data__0574_1
		.4byte anim_data__0574_2




.align 2, 0
	anim_data__0575_0:
		.4byte	AnimCmd_GetPalette, 0x6C, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AFB9, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0575_1:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AFBD, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0575_2:
		.4byte	AnimCmd_GetPalette, 0x69, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1AFC1, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0575_3:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AFC5, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0575_4:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AFC9, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0575_5:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1AFCD, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0575_6:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1AFD1, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0575_7:
		.4byte	AnimCmd_GetPalette, 0x6C, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1AFD5, 0x6, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0575_8:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1AFDB, 0x6, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0575_9:
		.4byte	AnimCmd_GetPalette, 0x6D, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AFE1, 0x6, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0575_10:
		.4byte	AnimCmd_GetPalette, 0x6D, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1AFE7, 0x6, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0575_11:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AFED, 0x6, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__0575_12:
		.4byte	AnimCmd_GetPalette, 0x68, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1AFF3, 0x6, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__0575_13:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1AFF9, 0x6, 0x1, 0xD
		.4byte	AnimCmd_4
	anim_data__0575_14:
		.4byte	AnimCmd_GetPalette, 0x44, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1AFFF, 0x6, 0x1, 0xE
		.4byte	AnimCmd_4
	anim_data__0575_15:
		.4byte	AnimCmd_GetPalette, 0x6C, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B005, 0x1, 0x1, 0xF
		.4byte	AnimCmd_4

.align 2, 0
	anim_0575:
		.4byte anim_data__0575_0
		.4byte anim_data__0575_1
		.4byte anim_data__0575_2
		.4byte anim_data__0575_3
		.4byte anim_data__0575_4
		.4byte anim_data__0575_5
		.4byte anim_data__0575_6
		.4byte anim_data__0575_7
		.4byte anim_data__0575_8
		.4byte anim_data__0575_9
		.4byte anim_data__0575_10
		.4byte anim_data__0575_11
		.4byte anim_data__0575_12
		.4byte anim_data__0575_13
		.4byte anim_data__0575_14
		.4byte anim_data__0575_15




.align 2, 0
	anim_data__0576_0:
		.4byte	AnimCmd_GetPalette, 0x6C, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B006, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0576_1:
		.4byte	AnimCmd_GetPalette, 0x6C, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B008, 0x2, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0576:
		.4byte anim_data__0576_0
		.4byte anim_data__0576_1




.align 2, 0
	anim_data__0577_0:
		.4byte	AnimCmd_GetPalette, 0x6D, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B00A, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0577:
		.4byte anim_data__0577_0




.align 2, 0
	anim_data__0578_0:
		.4byte	AnimCmd_GetPalette, 0x6E, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1B00E, 0x6, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B014, 0x6, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B01A, 0x6, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B020, 0x6, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0578:
		.4byte anim_data__0578_0




.align 2, 0
	anim_data__0579_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1B026, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0579_1:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1B028, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0579:
		.4byte anim_data__0579_0
		.4byte anim_data__0579_1




.align 2, 0
	anim_data__0580_0:
		.4byte	AnimCmd_GetPalette, 0x6F, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1B029, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFE8F0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0580_1:
		.4byte	AnimCmd_GetPalette, 0x6F, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1B039, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0580_2:
		.4byte	AnimCmd_GetPalette, 0x6F, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1B03D, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0580_3:
		.4byte	AnimCmd_GetPalette, 0x6F, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1B045, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF18F000, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0580:
		.4byte anim_data__0580_0
		.4byte anim_data__0580_1
		.4byte anim_data__0580_2
		.4byte anim_data__0580_3




.align 2, 0
	anim_data__0581_0:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B055, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFC18F6E8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0581_1:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B067, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018F0E8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0581_2:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B07F, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0581:
		.4byte anim_data__0581_0
		.4byte anim_data__0581_1
		.4byte anim_data__0581_2




.align 2, 0
	anim_data__0582_0:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0A3, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0582_1:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0B3, 0x9, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0582_2:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0BC, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0582_3:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0C0, 0x1, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0582_4:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0C1, 0x1, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0582:
		.4byte anim_data__0582_0
		.4byte anim_data__0582_1
		.4byte anim_data__0582_2
		.4byte anim_data__0582_3
		.4byte anim_data__0582_4




.align 2, 0
	anim_data__0583_0:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0C2, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0583_1:
		.4byte	AnimCmd_GetPalette, 0x70, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B0C4, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0583:
		.4byte anim_data__0583_0
		.4byte anim_data__0583_1




.align 2, 0
	anim_data__0584_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B0C5, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0584_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B0D1, 0x6, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0584_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B0D7, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0584_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B0E3, 0x6, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0584_4:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B0E9, 0x24, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0584_5:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B10D, 0x19, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0584:
		.4byte anim_data__0584_0
		.4byte anim_data__0584_1
		.4byte anim_data__0584_2
		.4byte anim_data__0584_3
		.4byte anim_data__0584_4
		.4byte anim_data__0584_5




.align 2, 0
	anim_data__0585_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B126, 0x20, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B146, 0x20, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B166, 0x20, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B186, 0x1C, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B1A2, 0x20, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B1C2, 0x1C, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B1DE, 0x20, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B1FE, 0x20, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0585_1:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B126, 0x20, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B1FE, 0x20, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1B1DE, 0x20, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B1C2, 0x1C, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B1A2, 0x20, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B186, 0x1C, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B166, 0x20, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B146, 0x20, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0585_2:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B126, 0x20, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0585:
		.4byte anim_data__0585_0
		.4byte anim_data__0585_1
		.4byte anim_data__0585_2




.align 2, 0
	anim_data__0586_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B21E, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018EFE8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0586:
		.4byte anim_data__0586_0




.align 2, 0
	anim_data__0587_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B236, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0587_1:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B23A, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0587:
		.4byte anim_data__0587_0
		.4byte anim_data__0587_1




.align 2, 0
	anim_data__0588_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B23B, 0x2, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B23D, 0x2, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B23F, 0x2, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B241, 0x2, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B243, 0x2, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B245, 0x2, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B247, 0x2, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B249, 0x2, 0x5, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0588_1:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B24B, 0x1, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1B24C, 0x1, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1B24D, 0x1, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1B24E, 0x1, 0x5, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1B24F, 0x1, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1B250, 0x1, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1B251, 0x1, 0x5, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1B252, 0x1, 0x5, 0xF
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0588_2:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B253, 0x1, 0x5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1B254, 0x1, 0x5, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1B255, 0x1, 0x5, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1B256, 0x1, 0x5, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1B257, 0x1, 0x5, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x1B258, 0x1, 0x5, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x1B259, 0x1, 0x5, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x1B254, 0x1, 0x5, 0x11
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0588:
		.4byte anim_data__0588_0
		.4byte anim_data__0588_1
		.4byte anim_data__0588_2




.align 2, 0
	anim_data__0589_0:
		.4byte	AnimCmd_GetPalette, 0x71, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B25A, 0x36, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B290, 0x36, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B2C6, 0x2A, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B2F0, 0x36, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0589:
		.4byte anim_data__0589_0




.align 2, 0
	anim_data__0590_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B326, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B33A, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B34E, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B362, 0x14, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0590_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B326, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B376, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B38A, 0x14, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B362, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B39E, 0x14, 0x2, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0590:
		.4byte anim_data__0590_0
		.4byte anim_data__0590_1




.align 2, 0
	anim_data__0591_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B3B2, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0591_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B3B2, 0xC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B3BE, 0xC, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B3CA, 0xC, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B3D6, 0xC, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0591_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B3B2, 0xC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B3BE, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B3CA, 0xC, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B3D6, 0xC, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0591_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1B3B2, 0xC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B3BE, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B3CA, 0xC, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B3D6, 0xC, 0x3, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0591:
		.4byte anim_data__0591_0
		.4byte anim_data__0591_1
		.4byte anim_data__0591_2
		.4byte anim_data__0591_3




.align 2, 0
	anim_data__0592_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B3E2, 0x19, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B3FB, 0xF, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B40A, 0xF, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B419, 0xF, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0592:
		.4byte anim_data__0592_0




.align 2, 0
	anim_data__0593_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B428, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFC18F6E8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0593:
		.4byte anim_data__0593_0




.align 2, 0
	anim_data__0594_0:
		.4byte	AnimCmd_GetPalette, 0x63, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B43A, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0594:
		.4byte anim_data__0594_0




.align 2, 0
	anim_data__0595_0:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B45E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B466, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B46E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B476, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B47E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x4
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0595_1:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B486, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B48E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B496, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1B49E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1B4A6, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x5, 0x9
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0595_2:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B4AE, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_0595:
		.4byte anim_data__0595_0
		.4byte anim_data__0595_1
		.4byte anim_data__0595_2




.align 2, 0
	anim_data__0596_0:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B4B6, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B4E0, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x8, 0x1
		.4byte	AnimCmd_JumpBack, 0x13
	anim_data__0596_1:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B50A, 0x12
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B51C, 0x12
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x8, 0x3
		.4byte	AnimCmd_JumpBack, 0x13
	anim_data__0596_2:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B4B6, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0596_3:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B4E0, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0596_4:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B52E, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0596_5:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B558, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0596_6:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B582, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0596_7:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B5AC, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0596_8:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B50A, 0x12
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0596_9:
		.4byte	AnimCmd_GetPalette, 0x73, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B51C, 0x12
		.4byte	AnimCmd_6, 0x0, 0x15300000, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0596:
		.4byte anim_data__0596_0
		.4byte anim_data__0596_1
		.4byte anim_data__0596_2
		.4byte anim_data__0596_3
		.4byte anim_data__0596_4
		.4byte anim_data__0596_5
		.4byte anim_data__0596_6
		.4byte anim_data__0596_7
		.4byte anim_data__0596_8
		.4byte anim_data__0596_9




.align 2, 0
	anim_data__0597_0:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B5D6, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFC18F6E8, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B5E8, 0x12, 0xA, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B5FA, 0x12, 0xA, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B60C, 0x12, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B61E, 0x12, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B630, 0x12, 0xA, 0x5
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0597_1:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B642, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018F0E8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0597_2:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B65A, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0597:
		.4byte anim_data__0597_0
		.4byte anim_data__0597_1
		.4byte anim_data__0597_2




.align 2, 0
	anim_data__0598_0:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B67E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x810F8F0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0598_1:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B686, 0x8
		.4byte	AnimCmd_6, 0x0, 0x810F8F0, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0598_2:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B68E, 0x8
		.4byte	AnimCmd_6, 0x0, 0x810F8F0, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0598:
		.4byte anim_data__0598_0
		.4byte anim_data__0598_1
		.4byte anim_data__0598_2




.align 2, 0
	anim_data__0599_0:
		.4byte	AnimCmd_GetPalette, 0x72, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B696, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0599:
		.4byte anim_data__0599_0




.align 2, 0
	anim_data__0600_0:
		.4byte	AnimCmd_GetPalette, 0x74, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6BA, 0x9
		.4byte	AnimCmd_6, 0x0, 0xB0BF5F5, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B6C3, 0x9, 0xA, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B6CC, 0x9, 0xA, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B6D5, 0x9, 0xA, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A
	anim_data__0600_1:
		.4byte	AnimCmd_GetPalette, 0x74, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6DE, 0x9
		.4byte	AnimCmd_6, 0x0, 0xB0BF5F5, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B6E7, 0x9, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B6F0, 0x9, 0x6, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0600:
		.4byte anim_data__0600_0
		.4byte anim_data__0600_1




.align 2, 0
	anim_data__0601_0:
		.4byte	AnimCmd_GetPalette, 0x75, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6F9, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0601_1:
		.4byte	AnimCmd_GetPalette, 0x75, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6FB, 0x2, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0601:
		.4byte anim_data__0601_0
		.4byte anim_data__0601_1




.align 2, 0
	anim_data__0602_0:
		.4byte	AnimCmd_GetPalette, 0x76, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6FD, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0602_1:
		.4byte	AnimCmd_GetPalette, 0x76, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B6FF, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0602:
		.4byte anim_data__0602_0
		.4byte anim_data__0602_1




.align 2, 0
	anim_data__0603_0:
		.4byte	AnimCmd_GetPalette, 0x77, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B700, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0603_1:
		.4byte	AnimCmd_GetPalette, 0x77, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B700, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B70C, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B718, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B70C, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B718, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x3, 0x2
		.4byte	AnimCmd_4
	anim_data__0603_2:
		.4byte	AnimCmd_GetPalette, 0x77, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B700, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B70C, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B728, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E4FB, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B700, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B738, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E6FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0603_3:
		.4byte	AnimCmd_GetPalette, 0x77, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B700, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EBFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B70C, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B748, 0x18
		.4byte	AnimCmd_6, 0x0, 0x5D3FB, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B718, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E7FB, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B728, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5E4FB, 0x3, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0603:
		.4byte anim_data__0603_0
		.4byte anim_data__0603_1
		.4byte anim_data__0603_2
		.4byte anim_data__0603_3




.align 2, 0
	anim_data__0604_0:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B760, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0604_1:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B760, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5ECFB, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B76C, 0xC
		.4byte	AnimCmd_6, 0x0, 0x5EEFB, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B778, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5DFFB, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1B78C, 0x10
		.4byte	AnimCmd_6, 0x0, 0x5DFFB, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B79C, 0x14
		.4byte	AnimCmd_6, 0x0, 0x5E0FB, 0x3, 0x4
		.4byte	AnimCmd_4
	anim_data__0604_2:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B7B0, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0604_3:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B7B0, 0xC
		.4byte	AnimCmd_6, 0x0, 0x514FB00, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1B7BC, 0xC
		.4byte	AnimCmd_6, 0x0, 0x512FB00, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B7C8, 0x14
		.4byte	AnimCmd_6, 0x0, 0x521FB00, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1B7DC, 0x10
		.4byte	AnimCmd_6, 0x0, 0x51DFB00, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1B7EC, 0x14
		.4byte	AnimCmd_6, 0x0, 0x520FB00, 0x3, 0x9
		.4byte	AnimCmd_4
	anim_data__0604_4:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B800, 0x9
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0604_5:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B800, 0x9
		.4byte	AnimCmd_6, 0x0, 0xF814EE0A, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1B809, 0x9
		.4byte	AnimCmd_6, 0x0, 0xFB10F106, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1B812, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF01BE611, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1B822, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF417EA0D, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1B832, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF11AE710, 0x3, 0xE
		.4byte	AnimCmd_4
	anim_data__0604_6:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B842, 0x6
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__0604_7:
		.4byte	AnimCmd_GetPalette, 0x78, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B842, 0x6
		.4byte	AnimCmd_6, 0x0, 0x14F60A, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1B848, 0x6
		.4byte	AnimCmd_6, 0x0, 0x10F906, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1B84E, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF81BEE11, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1B85A, 0xC
		.4byte	AnimCmd_6, 0x0, 0xFC17F20D, 0x5, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1B866, 0xC
		.4byte	AnimCmd_6, 0x0, 0xF91AEF10, 0x3, 0x13
		.4byte	AnimCmd_4

.align 2, 0
	anim_0604:
		.4byte anim_data__0604_0
		.4byte anim_data__0604_1
		.4byte anim_data__0604_2
		.4byte anim_data__0604_3
		.4byte anim_data__0604_4
		.4byte anim_data__0604_5
		.4byte anim_data__0604_6
		.4byte anim_data__0604_7




.align 2, 0
	anim_data__0605_0:
		.4byte	AnimCmd_GetPalette, 0x79, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B872, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0605_1:
		.4byte	AnimCmd_GetPalette, 0x79, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B87E, 0x6, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0605_2:
		.4byte	AnimCmd_GetPalette, 0x7A, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B884, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0605_3:
		.4byte	AnimCmd_GetPalette, 0x7A, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B890, 0x6, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0605_4:
		.4byte	AnimCmd_GetPalette, 0x7B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B896, 0x24, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0605_5:
		.4byte	AnimCmd_GetPalette, 0x7B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B8BA, 0x19, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0605:
		.4byte anim_data__0605_0
		.4byte anim_data__0605_1
		.4byte anim_data__0605_2
		.4byte anim_data__0605_3
		.4byte anim_data__0605_4
		.4byte anim_data__0605_5




.align 2, 0
	anim_data__0606_0:
		.4byte	AnimCmd_GetPalette, 0x7C, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B8D3, 0x8
		.4byte	AnimCmd_6, 0x0, 0x8F2F0, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1B8DB, 0x8, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1B8E3, 0x8, 0x5, 0x2
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0606_1:
		.4byte	AnimCmd_GetPalette, 0x7C, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B8EB, 0xC
		.4byte	AnimCmd_6, 0x0, 0x209F3F0, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1B8F7, 0xC, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1B903, 0xC, 0x5, 0x5
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0606_2:
		.4byte	AnimCmd_GetPalette, 0x7C, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B90F, 0xC
		.4byte	AnimCmd_6, 0x0, 0x209F4F0, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1B91B, 0xC, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1B927, 0xC, 0x5, 0x8
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0606_3:
		.4byte	AnimCmd_GetPalette, 0x7D, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B933, 0x10
		.4byte	AnimCmd_6, 0x0, 0x709EEF0, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1B943, 0x10, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1B953, 0x10, 0x5, 0xB
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0606_4:
		.4byte	AnimCmd_GetPalette, 0x7D, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B963, 0x10
		.4byte	AnimCmd_6, 0x0, 0x607F2F0, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1B973, 0x10, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1B983, 0x10, 0x5, 0xE
		.4byte	AnimCmd_JumpBack, 0x15
	anim_data__0606_5:
		.4byte	AnimCmd_GetPalette, 0x7C, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B993, 0x8
		.4byte	AnimCmd_6, 0x0, 0x1000F8F2, 0x5, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1B99B, 0x8, 0x5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1B9A3, 0x8, 0x5, 0x11
		.4byte	AnimCmd_JumpBack, 0x15

.align 2, 0
	anim_0606:
		.4byte anim_data__0606_0
		.4byte anim_data__0606_1
		.4byte anim_data__0606_2
		.4byte anim_data__0606_3
		.4byte anim_data__0606_4
		.4byte anim_data__0606_5




.align 2, 0
	anim_data__0607_0:
		.4byte	AnimCmd_GetPalette, 0x7E, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9AB, 0x10
		.4byte	AnimCmd_6, 0x0, 0xFE8F0, 0x2, 0x0, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0607_1:
		.4byte	AnimCmd_GetPalette, 0x7E, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9BB, 0x4, 0x2, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0607_2:
		.4byte	AnimCmd_GetPalette, 0x7E, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9BF, 0xC, 0x2, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0607_3:
		.4byte	AnimCmd_GetPalette, 0x7E, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9CB, 0x10
		.4byte	AnimCmd_6, 0x0, 0xF18F000, 0x2, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0607:
		.4byte anim_data__0607_0
		.4byte anim_data__0607_1
		.4byte anim_data__0607_2
		.4byte anim_data__0607_3




.align 2, 0
	anim_data__0608_0:
		.4byte	AnimCmd_GetPalette, 0x7B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9DB, 0x14
		.4byte	AnimCmd_6, 0x0, 0x14E5EC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0608_1:
		.4byte	AnimCmd_GetPalette, 0x7B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9EF, 0xF
		.4byte	AnimCmd_6, 0x0, 0x14EAEC, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0608:
		.4byte anim_data__0608_0
		.4byte anim_data__0608_1




.align 2, 0
	anim_data__0609_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1B9FE, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0609_1:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA02, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0609:
		.4byte anim_data__0609_0
		.4byte anim_data__0609_1




.align 2, 0
	anim_data__0610_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA03, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1018EFE8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0610:
		.4byte anim_data__0610_0




.align 2, 0
	anim_data__0611_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA1B, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0611:
		.4byte anim_data__0611_0




.align 2, 0
	anim_data__0612_0:
		.4byte	AnimCmd_GetPalette, 0x80, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA1D, 0x10
		.4byte	AnimCmd_6, 0x0, 0x3020E0E0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0612:
		.4byte anim_data__0612_0




.align 2, 0
	anim_data__0613_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA2D, 0x24
		.4byte	AnimCmd_6, 0x0, 0x1818EAE8, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0xB

.align 2, 0
	anim_0613:
		.4byte anim_data__0613_0




.align 2, 0
	anim_data__0614_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA51, 0xF
		.4byte	AnimCmd_6, 0x0, 0xEEFF2, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0614:
		.4byte anim_data__0614_0




.align 2, 0
	anim_data__0615_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA60, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0615_1:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__0615_2:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0615:
		.4byte anim_data__0615_0
		.4byte anim_data__0615_1
		.4byte anim_data__0615_2




.align 2, 0
	anim_data__0616_0:
		.4byte	AnimCmd_GetPalette, 0x81, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA64, 0x18
		.4byte	AnimCmd_6, 0x0, 0x1818E8E8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0616_1:
		.4byte	AnimCmd_GetPalette, 0x81, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BA7C, 0x40
		.4byte	AnimCmd_6, 0x0, 0xEF0F2E0, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0616:
		.4byte anim_data__0616_0
		.4byte anim_data__0616_1




.align 2, 0
	anim_data__0617_0:
		.4byte	AnimCmd_GetPalette, 0x7F, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BABC, 0x12
		.4byte	AnimCmd_6, 0x0, 0xFC18F6E8, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0xB

.align 2, 0
	anim_0617:
		.4byte anim_data__0617_0




.align 2, 0
	anim_data__0618_0:
		.4byte	AnimCmd_GetPalette, 0x82, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1BACE, 0x12
		.4byte	AnimCmd_6, 0x0, 0x1010F0F0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0618:
		.4byte anim_data__0618_0




.align 2, 0
	anim_data__0619_0:
		.4byte	AnimCmd_GetTileIndex, 0x1BAE0, 0x50
		.4byte	AnimCmd_GetPalette, 0x4B, 0xA00010, 0x4, 0x0, 0x4, 0x1, 0x4, 0x2, 0x4, 0x3, 0x4, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0619:
		.4byte anim_data__0619_0




.align 2, 0
	anim_data__0620_0:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB30, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0620_1:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB34, 0x4, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0620:
		.4byte anim_data__0620_0
		.4byte anim_data__0620_1




.align 2, 0
	anim_data__0621_0:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB38, 0x10, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0621_1:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB48, 0xC, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0621:
		.4byte anim_data__0621_0
		.4byte anim_data__0621_1




.align 2, 0
	anim_data__0622_0:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB54, 0x1, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0622_1:
		.4byte	AnimCmd_GetPalette, 0x83, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB55, 0x1, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0622:
		.4byte anim_data__0622_0
		.4byte anim_data__0622_1




.align 2, 0
	anim_data__0623_0:
		.4byte	AnimCmd_GetPalette, 0x84, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB56, 0x1, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0623:
		.4byte anim_data__0623_0




.align 2, 0
	anim_data__0624_0:
		.4byte	AnimCmd_GetPalette, 0x84, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB57, 0x1, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0624:
		.4byte anim_data__0624_0




.align 2, 0
	anim_data__0625_0:
		.4byte	AnimCmd_GetPalette, 0x84, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB58, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0625:
		.4byte anim_data__0625_0




.align 2, 0
	anim_data__0626_0:
		.4byte	AnimCmd_GetPalette, 0x84, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1BB5C, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0626:
		.4byte anim_data__0626_0




.align 2, 0
	anim_data__0627_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BB60, 0x4, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BB64, 0x4, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BB68, 0x4, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BB6C, 0x4, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BB70, 0x4, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BB74, 0x4, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1BB78, 0x4, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1BB7C, 0x4, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0627:
		.4byte anim_data__0627_0




.align 2, 0
	anim_data__0628_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BB80, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0628:
		.4byte anim_data__0628_0




.align 2, 0
	anim_data__0629_0:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BBC0, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0629_1:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BBC8, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BBD0, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BBC8, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BBD0, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BBC8, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BBD0, 0x8, 0x6, 0x2
		.4byte	AnimCmd_9, 0x275
	anim_data__0629_2:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BBD8, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BBE0, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BBD8, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BBE0, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BBD8, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BBE0, 0x8, 0x4, 0x4
		.4byte	AnimCmd_9, 0x275
	anim_data__0629_3:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BBE8, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0629:
		.4byte anim_data__0629_0
		.4byte anim_data__0629_1
		.4byte anim_data__0629_2
		.4byte anim_data__0629_3




.align 2, 0
	anim_data__0630_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BBF0, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0630:
		.4byte anim_data__0630_0




.align 2, 0
	anim_data__0631_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BC30, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0631:
		.4byte anim_data__0631_0




.align 2, 0
	anim_data__0632_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BC70, 0x48
		.4byte	AnimCmd_6, 0x0, 0x1C18EEE9
		.4byte	AnimCmd_6, 0x1, 0x210A02F7, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BCB8, 0x48, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BD00, 0x48, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x18

.align 2, 0
	anim_0632:
		.4byte anim_data__0632_0




.align 2, 0
	anim_data__0633_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BD48, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0633:
		.4byte anim_data__0633_0




.align 2, 0
	anim_data__0634_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BD4C, 0x9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BD55, 0x9, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BD5E, 0x9, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BD67, 0x9, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0634:
		.4byte anim_data__0634_0




.align 2, 0
	anim_data__0635_0:
		.4byte	AnimCmd_GetPalette, 0x85, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BD70, 0x9, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BD79, 0x9, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BD82, 0x9, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BD8B, 0x9, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0635:
		.4byte anim_data__0635_0




.align 2, 0
	anim_data__0636_0:
		.4byte	AnimCmd_GetPalette, 0x87, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1BD94, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BDB2, 0x24, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0636:
		.4byte anim_data__0636_0




.align 2, 0
	anim_data__0637_0:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BDD6, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0637_1:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BDDE, 0xC, 0x7, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BDEA, 0xC, 0x7, 0x2
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0637_2:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1BDF6, 0x8, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BDFE, 0xC, 0x5, 0x4
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0637:
		.4byte anim_data__0637_0
		.4byte anim_data__0637_1
		.4byte anim_data__0637_2




.align 2, 0
	anim_data__0638_0:
		.4byte	AnimCmd_GetPalette, 0x4B, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1BE0A, 0x31
		.4byte	AnimCmd_6, 0x0, 0x1010F0F0, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BE3B, 0x31
		.4byte	AnimCmd_6, 0x0, 0x1817EDEB, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BE6C, 0x31
		.4byte	AnimCmd_6, 0x0, 0x1615EFEB, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BE9D, 0x31
		.4byte	AnimCmd_6, 0x0, 0x65006500, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BECE, 0x31, 0x4, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0638:
		.4byte anim_data__0638_0




.align 2, 0
	anim_data__0639_0:
		.4byte	AnimCmd_GetPalette, 0x4B, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1BEFF, 0x14
		.4byte	AnimCmd_6, 0x0, 0x408F5F8, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1BF13, 0x20
		.4byte	AnimCmd_6, 0x0, 0x308E6F8, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1BF33, 0x20
		.4byte	AnimCmd_6, 0x0, 0x208D5F8, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1BF53, 0x20
		.4byte	AnimCmd_6, 0x0, 0xEA08D5F8, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1BF73, 0x20
		.4byte	AnimCmd_6, 0x0, 0x45004500, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1BF93, 0x1C, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1BFAF, 0x1C, 0x4, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0639:
		.4byte anim_data__0639_0




.align 2, 0
	anim_data__0640_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1BFCB, 0x64
		.4byte	AnimCmd_6, 0x0, 0xFF10FF1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0640:
		.4byte anim_data__0640_0




.align 2, 0
	anim_data__0641_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C02F, 0x5A
		.4byte	AnimCmd_6, 0x0, 0xFB18C4E3
		.4byte	AnimCmd_6, 0x1, 0x60BE4F3, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C089, 0x63, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C0EC, 0x63, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0x18
	anim_data__0641_1:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C14F, 0x5A
		.4byte	AnimCmd_6, 0x0, 0xFB18C4E3
		.4byte	AnimCmd_6, 0x1, 0x60BE4F3, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C1A9, 0x63, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1C20C, 0x63, 0x4, 0x5
		.4byte	AnimCmd_JumpBack, 0x18

.align 2, 0
	anim_0641:
		.4byte anim_data__0641_0
		.4byte anim_data__0641_1




.align 2, 0
	anim_data__0642_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C26F, 0x2D, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0642_1:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C29C, 0x2D, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0642:
		.4byte anim_data__0642_0
		.4byte anim_data__0642_1




.align 2, 0
	anim_data__0643_0:
		.4byte	AnimCmd_GetPalette, 0x89, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C2C9, 0x1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0643:
		.4byte anim_data__0643_0




.align 2, 0
	anim_data__0644_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C2CA, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C2DA, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C2EA, 0x10, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C2FA, 0x10, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0644:
		.4byte anim_data__0644_0




.align 2, 0
	anim_data__0645_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C30A, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C31A, 0x10, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0645:
		.4byte anim_data__0645_0




.align 2, 0
	anim_data__0646_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1C32A, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0646_1:
		.4byte	AnimCmd_GetPalette, 0x88, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1C36A, 0x40, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C3AA, 0x40, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C3EA, 0x40, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C42A, 0x40, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1C32A, 0x40, 0x8, 0x0
		.4byte	AnimCmd_4
	anim_data__0646_2:
		.4byte	AnimCmd_GetPalette, 0x88, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1C46A, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0646:
		.4byte anim_data__0646_0
		.4byte anim_data__0646_1
		.4byte anim_data__0646_2




.align 2, 0
	anim_data__0647_0:
		.4byte	AnimCmd_GetPalette, 0x88, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C4AA, 0x9
		.4byte	AnimCmd_6, 0x0, 0x808F9F9, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C4B3, 0x9, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C4BC, 0x9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C4C5, 0x9, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0647:
		.4byte anim_data__0647_0




.align 2, 0
	anim_data__0648_0:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1C4CE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0648_1:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1C4D6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C4DE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C4D6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C4DE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C4D6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C4DE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0648_2:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1C4E6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C4EE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1C4E6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C4EE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1C4E6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C4EE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0648_3:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1C4F6, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0648:
		.4byte anim_data__0648_0
		.4byte anim_data__0648_1
		.4byte anim_data__0648_2
		.4byte anim_data__0648_3




.align 2, 0
	anim_data__0649_0:
		.4byte	AnimCmd_GetPalette, 0x8A, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C4FE, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0649:
		.4byte anim_data__0649_0




.align 2, 0
	anim_data__0650_0:
		.4byte	AnimCmd_GetPalette, 0x8A, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C51E, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0650:
		.4byte anim_data__0650_0




.align 2, 0
	anim_data__0651_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C542, 0x78
		.4byte	AnimCmd_6, 0x0, 0xB31A9BE6
		.4byte	AnimCmd_6, 0x1, 0x708B5F8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C5BA, 0x78, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C632, 0x6C, 0x2, 0x2
		.4byte	AnimCmd_JumpBack, 0x18

.align 2, 0
	anim_0651:
		.4byte anim_data__0651_0




.align 2, 0
	anim_data__0652_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C69E, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C6AE, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C6BE, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C6CE, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0652:
		.4byte anim_data__0652_0




.align 2, 0
	anim_data__0653_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C6DE, 0x10, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C6EE, 0x10, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0653:
		.4byte anim_data__0653_0




.align 2, 0
	anim_data__0654_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C6FE, 0x4, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C702, 0x4, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0654:
		.4byte anim_data__0654_0




.align 2, 0
	anim_data__0655_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C706, 0x1E
		.4byte	AnimCmd_6, 0x0, 0x720F8E1
		.4byte	AnimCmd_6, 0x1, 0xDFFFDE
		.4byte	AnimCmd_6, 0x2, 0x23FF22, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C724, 0x1E, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C742, 0x1E, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C760, 0x1E, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x20

.align 2, 0
	anim_0655:
		.4byte anim_data__0655_0




.align 2, 0
	anim_data__0656_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C77E, 0x14
		.4byte	AnimCmd_6, 0x0, 0x8AFC8AFC, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0656:
		.4byte anim_data__0656_0




.align 2, 0
	anim_data__0657_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1C792, 0x6
		.4byte	AnimCmd_6, 0x0, 0x50BFBF5, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0657_1:
		.4byte	AnimCmd_GetPalette, 0x8B, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1C798, 0x3, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0657:
		.4byte anim_data__0657_0
		.4byte anim_data__0657_1




.align 2, 0
	anim_data__0658_0:
		.4byte	AnimCmd_GetTileIndex, 0x1C79B, 0x8
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_6, 0x0, 0x202FEFE, 0x4, 0x0
		.4byte	AnimCmd_6, 0x0, 0x404FCFC, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0658:
		.4byte anim_data__0658_0




.align 2, 0
	anim_data__0659_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1C7A3, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0659:
		.4byte anim_data__0659_0




.align 2, 0
	anim_data__0660_0:
		.4byte	AnimCmd_GetPalette, 0x8B, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C7C1, 0x12, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C7D3, 0x12, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C7E5, 0x12, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C7C1, 0x12, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C7D3, 0x12, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C7E5, 0x12, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C7D3, 0x12, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C7E5, 0x12, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C7F7, 0xF, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C806, 0x9, 0x4, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0660:
		.4byte anim_data__0660_0




.align 2, 0
	anim_data__0661_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C80F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x619E9E7
		.4byte	AnimCmd_6, 0x1, 0x120606F9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0661_1:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C80F, 0x40
		.4byte	AnimCmd_6, 0x0, 0x619E9E7
		.4byte	AnimCmd_6, 0x1, 0x120606F9, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C84F, 0x40, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C88F, 0x40, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C84F, 0x40, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C80F, 0x40, 0x8, 0x4
		.4byte	AnimCmd_4
	anim_data__0661_2:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C8CF, 0x38
		.4byte	AnimCmd_6, 0x0, 0x619E9E7, 0xA, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1C907, 0x38
		.4byte	AnimCmd_6, 0x0, 0x619E9E7
		.4byte	AnimCmd_6, 0x1, 0x120A06F6, 0xA, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1C80F, 0x40, 0xA, 0x0
		.4byte	AnimCmd_4
	anim_data__0661_3:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C8CF, 0x38
		.4byte	AnimCmd_6, 0x0, 0x619E9E7, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0661:
		.4byte anim_data__0661_0
		.4byte anim_data__0661_1
		.4byte anim_data__0661_2
		.4byte anim_data__0661_3




.align 2, 0
	anim_data__0662_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C93F, 0xF
		.4byte	AnimCmd_6, 0x0, 0x90FF9F0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0662_1:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C93F, 0xF
		.4byte	AnimCmd_6, 0x0, 0x912F9ED, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C94E, 0xF
		.4byte	AnimCmd_6, 0x0, 0x910F9EE, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1C95D, 0xF
		.4byte	AnimCmd_6, 0x0, 0x912F9EC, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1C94E, 0xF
		.4byte	AnimCmd_6, 0x0, 0x910F9EE, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1C93F, 0xF
		.4byte	AnimCmd_6, 0x0, 0x911F9EC, 0x8, 0x0
		.4byte	AnimCmd_4
	anim_data__0662_2:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C96C, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1C980, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1C994, 0x19, 0x6, 0x7
		.4byte	AnimCmd_4
	anim_data__0662_3:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1C994, 0x19, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1C980, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1C96C, 0x14, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1C93F, 0xF
		.4byte	AnimCmd_6, 0x0, 0x90FF9F0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0662:
		.4byte anim_data__0662_0
		.4byte anim_data__0662_1
		.4byte anim_data__0662_2
		.4byte anim_data__0662_3




.align 2, 0
	anim_data__0663_0:
		.4byte	AnimCmd_GetPalette, 0x4B, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1C9AD, 0x14
		.4byte	AnimCmd_6, 0x0, 0x808F2F8, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1C9C1, 0x20
		.4byte	AnimCmd_6, 0x0, 0x808D4F8, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1C9E1, 0x20
		.4byte	AnimCmd_6, 0x0, 0x808D0F8, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CA01, 0x20
		.4byte	AnimCmd_6, 0x0, 0xEC08D7F8, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CA21, 0x20
		.4byte	AnimCmd_6, 0x0, 0x47004700, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CA41, 0x1C, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1CA5D, 0x1C, 0x4, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0663:
		.4byte anim_data__0663_0




.align 2, 0
	anim_data__0664_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CA79, 0x8
		.4byte	AnimCmd_6, 0x0, 0xFD05EAFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CA81, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CA89, 0x8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CA91, 0x8, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0664:
		.4byte anim_data__0664_0




.align 2, 0
	anim_data__0665_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CA99, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0665:
		.4byte anim_data__0665_0




.align 2, 0
	anim_data__0666_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CAA1, 0x9
		.4byte	AnimCmd_6, 0x0, 0x505FBFB, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0666:
		.4byte anim_data__0666_0




.align 2, 0
	anim_data__0667_0:
		.4byte	AnimCmd_GetPalette, 0x8C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CAAA, 0x4
		.4byte	AnimCmd_6, 0x0, 0x404FCFC, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0667:
		.4byte anim_data__0667_0




.align 2, 0
	anim_data__0668_0:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CAAE, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0668_1:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CAB6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CABE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CAB6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CABE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CAB6, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CABE, 0x8, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0668_2:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CAC6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CACE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CAC6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CACE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CAC6, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CACE, 0x8, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0668_3:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CAAE, 0x8, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CAD6, 0x8, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1CADE, 0x8, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1CAD6, 0x8, 0x8, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1CAAE, 0x8, 0x8, 0x8
		.4byte	AnimCmd_4
	anim_data__0668_4:
		.4byte	AnimCmd_GetPalette, 0x86, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CAE6, 0x8, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0668:
		.4byte anim_data__0668_0
		.4byte anim_data__0668_1
		.4byte anim_data__0668_2
		.4byte anim_data__0668_3
		.4byte anim_data__0668_4




.align 2, 0
	anim_data__0669_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CAEE, 0x24
		.4byte	AnimCmd_6, 0x0, 0xF60EE2F2
		.4byte	AnimCmd_6, 0x1, 0x712E9EE
		.4byte	AnimCmd_6, 0x2, 0xE0E05F1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0669:
		.4byte anim_data__0669_0




.align 2, 0
	anim_data__0670_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CB12, 0x14
		.4byte	AnimCmd_6, 0x0, 0x711F9EF
		.4byte	AnimCmd_6, 0x1, 0xF90AEBF6, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0670:
		.4byte anim_data__0670_0




.align 2, 0
	anim_data__0671_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1CB26, 0x19
		.4byte	AnimCmd_6, 0x0, 0x70EECF2
		.4byte	AnimCmd_6, 0x1, 0xE0E07F1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0671:
		.4byte anim_data__0671_0




.align 2, 0
	anim_data__0672_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CB3F, 0x19, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0672_1:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CB3F, 0x19, 0x14, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CB58, 0x19, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CB71, 0x24, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CB95, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x1AFDE8CB
		.4byte	AnimCmd_6, 0x1, 0x8F2FDE7, 0xC, 0x3
		.4byte	AnimCmd_4
	anim_data__0672_2:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CB71, 0x24, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CB3F, 0x19, 0xA, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0672:
		.4byte anim_data__0672_0
		.4byte anim_data__0672_1
		.4byte anim_data__0672_2




.align 2, 0
	anim_data__0673_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBBF, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBC0, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBC4, 0x4, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0673:
		.4byte anim_data__0673_0




.align 2, 0
	anim_data__0674_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBC8, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBC9, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBCD, 0x4, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0674:
		.4byte anim_data__0674_0




.align 2, 0
	anim_data__0675_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBD1, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBD2, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBD6, 0x4, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0675:
		.4byte anim_data__0675_0




.align 2, 0
	anim_data__0676_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBDA, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBDB, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBDF, 0x4, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0676:
		.4byte anim_data__0676_0




.align 2, 0
	anim_data__0677_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBE3, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBE5, 0x2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBE7, 0x2, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0677:
		.4byte anim_data__0677_0




.align 2, 0
	anim_data__0678_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBE9, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBEB, 0x2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBED, 0x2, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0678:
		.4byte anim_data__0678_0




.align 2, 0
	anim_data__0679_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBEF, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBF1, 0x2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBF3, 0x2, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0679:
		.4byte anim_data__0679_0




.align 2, 0
	anim_data__0680_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBF5, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CBF7, 0x2, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CBF9, 0x2, 0x3, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0680:
		.4byte anim_data__0680_0




.align 2, 0
	anim_data__0681_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CBFB, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0681:
		.4byte anim_data__0681_0




.align 2, 0
	anim_data__0682_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1CBFF, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0682:
		.4byte anim_data__0682_0




.align 2, 0
	anim_data__0683_0:
		.4byte	AnimCmd_GetPalette, 0x8D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CC3F, 0x4, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CC43, 0x4, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CC47, 0x4, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0683:
		.4byte anim_data__0683_0




.align 2, 0
	anim_data__0684_0:
		.4byte	AnimCmd_GetPalette, 0x8E, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CC4B, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0684_1:
		.4byte	AnimCmd_GetPalette, 0x8E, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CC53, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CC5B, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CC53, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CC5B, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CC53, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CC5B, 0x8, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0684_2:
		.4byte	AnimCmd_GetPalette, 0x8E, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CC63, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CC6B, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CC63, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CC6B, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CC63, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CC6B, 0x8, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0684_3:
		.4byte	AnimCmd_GetPalette, 0x8E, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CC73, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0684:
		.4byte anim_data__0684_0
		.4byte anim_data__0684_1
		.4byte anim_data__0684_2
		.4byte anim_data__0684_3




.align 2, 0
	anim_data__0685_0:
		.4byte	AnimCmd_GetPalette, 0x8F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1CC7B, 0xC4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0685:
		.4byte anim_data__0685_0




.align 2, 0
	anim_data__0686_0:
		.4byte	AnimCmd_GetPalette, 0x8F, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x90, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x91, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x92, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x93, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x94, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x95, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x23

.align 2, 0
	anim_0686:
		.4byte anim_data__0686_0




.align 2, 0
	anim_data__0687_0:
		.4byte	AnimCmd_GetPalette, 0x96, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CD3F, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x210E9F0
		.4byte	AnimCmd_6, 0x1, 0x1617F6E9, 0x3, 0x0
		.4byte	AnimCmd_4
	anim_data__0687_1:
		.4byte	AnimCmd_GetPalette, 0x96, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CD69, 0x2A
		.4byte	AnimCmd_6, 0x0, 0x210E9F0
		.4byte	AnimCmd_6, 0x1, 0x1617F6E9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CD3F, 0x2A, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CD93, 0x2A, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x18

.align 2, 0
	anim_0687:
		.4byte anim_data__0687_0
		.4byte anim_data__0687_1




.align 2, 0
	anim_data__0688_0:
		.4byte	AnimCmd_GetPalette, 0x96, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDBD, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CDC1, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CDC5, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CDC9, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CDCD, 0x4, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0688:
		.4byte anim_data__0688_0




.align 2, 0
	anim_data__0689_0:
		.4byte	AnimCmd_GetPalette, 0x96, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDD1, 0x4
		.4byte	AnimCmd_6, 0x0, 0x404FCFC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CDD5, 0x4, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CDD9, 0x4, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CDDD, 0x4, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0689:
		.4byte anim_data__0689_0




.align 2, 0
	anim_data__0690_0:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDE1, 0xC
		.4byte	AnimCmd_6, 0x0, 0x618FAE8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0690_1:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDED, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0690_2:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDE1, 0xC
		.4byte	AnimCmd_6, 0x0, 0x618FAE8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CDED, 0xC, 0x4, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0690_3:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CDF9, 0x12
		.4byte	AnimCmd_6, 0x0, 0x618F0E8, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CE0B, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CE23, 0x18, 0x5, 0x4
		.4byte	AnimCmd_4
	anim_data__0690_4:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CE3B, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0690:
		.4byte anim_data__0690_0
		.4byte anim_data__0690_1
		.4byte anim_data__0690_2
		.4byte anim_data__0690_3
		.4byte anim_data__0690_4




.align 2, 0
	anim_data__0691_0:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CE7B, 0xC
		.4byte	AnimCmd_6, 0x0, 0x618FAE8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0691_1:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CE87, 0x40, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0691_2:
		.4byte	AnimCmd_GetPalette, 0x97, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CE7B, 0xC
		.4byte	AnimCmd_6, 0x0, 0x618FAE8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CEC7, 0xC, 0x4, 0x2
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0691:
		.4byte anim_data__0691_0
		.4byte anim_data__0691_1
		.4byte anim_data__0691_2




.align 2, 0
	anim_data__0692_0:
		.4byte	AnimCmd_GetPalette, 0x96, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1CED3, 0x4, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1CED7, 0x4, 0xA, 0x1
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0692:
		.4byte anim_data__0692_0




.align 2, 0
	anim_data__0693_0:
		.4byte	AnimCmd_GetPalette, 0x98, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CEDB, 0x8
		.4byte	AnimCmd_6, 0x0, 0x21092108, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0693_1:
		.4byte	AnimCmd_GetPalette, 0x98, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CEE3, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CEEB, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CEE3, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CEEB, 0x8, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CEE3, 0x8, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CEEB, 0x8, 0x6, 0x2
		.4byte	AnimCmd_4
	anim_data__0693_2:
		.4byte	AnimCmd_GetPalette, 0x98, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CEF3, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CEFB, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CEF3, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CEFB, 0x8, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CEF3, 0x8, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1CEFB, 0x8, 0x4, 0x4
		.4byte	AnimCmd_4
	anim_data__0693_3:
		.4byte	AnimCmd_GetPalette, 0x98, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1CF03, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0693:
		.4byte anim_data__0693_0
		.4byte anim_data__0693_1
		.4byte anim_data__0693_2
		.4byte anim_data__0693_3




.align 2, 0
	anim_data__0694_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1CF0B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1613EAED, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0694_1:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1CF4B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1613EAED, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CF8B, 0x40, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CF4B, 0x40, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CF8B, 0x40, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1CF4B, 0x40, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1CF8B, 0x40, 0x6, 0x2
		.4byte	AnimCmd_JumpBack, 0x24
	anim_data__0694_2:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1CFCB, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D00B, 0x40, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CFCB, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D00B, 0x40, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1CFCB, 0x40, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D00B, 0x40, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0694_3:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D04B, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0694_4:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D08B, 0x40, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0694:
		.4byte anim_data__0694_0
		.4byte anim_data__0694_1
		.4byte anim_data__0694_2
		.4byte anim_data__0694_3
		.4byte anim_data__0694_4




.align 2, 0
	anim_data__0695_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D0CB, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0695:
		.4byte anim_data__0695_0




.align 2, 0
	anim_data__0696_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D10B, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0696:
		.4byte anim_data__0696_0




.align 2, 0
	anim_data__0697_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D14B, 0xC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D157, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D163, 0xC, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0697:
		.4byte anim_data__0697_0




.align 2, 0
	anim_data__0698_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D16F, 0x6
		.4byte	AnimCmd_6, 0x0, 0xFF06EDFA, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D175, 0x6, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D17B, 0x6, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D181, 0x6, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0698:
		.4byte anim_data__0698_0




.align 2, 0
	anim_data__0699_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D187, 0x21
		.4byte	AnimCmd_GetPalette, 0x4B, 0xA00010
		.4byte	AnimCmd_6, 0x0, 0x102F2FD, 0x5, 0x0
		.4byte	AnimCmd_6, 0x0, 0x102EBFD, 0x5, 0x1
		.4byte	AnimCmd_6, 0x0, 0x102E7FD, 0x5, 0x2
		.4byte	AnimCmd_6, 0x0, 0x102E4FD, 0x5, 0x3
		.4byte	AnimCmd_6, 0x0, 0xFA02E5FD, 0x5, 0x4
		.4byte	AnimCmd_6, 0x0, 0x102E7FD, 0x4, 0x5
		.4byte	AnimCmd_6, 0x0, 0x102EBFD, 0x4, 0x6
		.4byte	AnimCmd_6, 0x0, 0x102EBFD, 0x4, 0x7
		.4byte	AnimCmd_6, 0x0, 0x102F2FD, 0x4, 0x8
		.4byte	AnimCmd_6, 0x0, 0x102F2FD, 0x4, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0699:
		.4byte anim_data__0699_0




.align 2, 0
	anim_data__0700_0:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D1A8, 0x4
		.4byte	AnimCmd_6, 0x0, 0x202FEFE, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0700_1:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D1AC, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0700_2:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D1B0, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0700_3:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D1B4, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0700_4:
		.4byte	AnimCmd_GetPalette, 0x99, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D1B8, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0700:
		.4byte anim_data__0700_0
		.4byte anim_data__0700_1
		.4byte anim_data__0700_2
		.4byte anim_data__0700_3
		.4byte anim_data__0700_4




.align 2, 0
	anim_data__0701_0:
		.4byte	AnimCmd_GetPalette, 0x9A, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D1BC, 0xF
		.4byte	AnimCmd_6, 0x0, 0xF614E8EC, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0701:
		.4byte anim_data__0701_0




.align 2, 0
	anim_data__0702_0:
		.4byte	AnimCmd_GetPalette, 0x9A, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1D1CB, 0x20
		.4byte	AnimCmd_6, 0x0, 0x10C0F0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0702:
		.4byte anim_data__0702_0




.align 2, 0
	anim_data__0703_0:
		.4byte	AnimCmd_GetPalette, 0x9B, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1D1EB, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0703_1:
		.4byte	AnimCmd_GetPalette, 0x9B, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1D1EB, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D22B, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D26B, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D2AB, 0x40, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0703_2:
		.4byte	AnimCmd_GetPalette, 0x9B, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1D2EB, 0x40
		.4byte	AnimCmd_6, 0x0, 0x10001, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0703:
		.4byte anim_data__0703_0
		.4byte anim_data__0703_1
		.4byte anim_data__0703_2




.align 2, 0
	anim_data__0704_0:
		.4byte	AnimCmd_GetPalette, 0x9B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1D32B, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0704_1:
		.4byte	AnimCmd_GetPalette, 0x9B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1D32B, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D36B, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D3AB, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D3EB, 0x40, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0704_2:
		.4byte	AnimCmd_GetPalette, 0x9B, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1D42B, 0x40, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0704:
		.4byte anim_data__0704_0
		.4byte anim_data__0704_1
		.4byte anim_data__0704_2




.align 2, 0
	anim_data__0705_0:
		.4byte	AnimCmd_GetPalette, 0x9C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D46B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1112EFF0, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0705_1:
		.4byte	AnimCmd_GetPalette, 0x9C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D46B, 0x40
		.4byte	AnimCmd_6, 0x0, 0x1112EFF0, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D4AB, 0x40, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D4EB, 0x40, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D4AB, 0x40, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D46B, 0x40
		.4byte	AnimCmd_6, 0x0, 0xFA10EEF0, 0x3, 0x0
		.4byte	AnimCmd_4
	anim_data__0705_2:
		.4byte	AnimCmd_GetPalette, 0x9C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D52B, 0x40, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0705_3:
		.4byte	AnimCmd_GetPalette, 0x9C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D56B, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1D5AB, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0705:
		.4byte anim_data__0705_0
		.4byte anim_data__0705_1
		.4byte anim_data__0705_2
		.4byte anim_data__0705_3




.align 2, 0
	anim_data__0706_0:
		.4byte	AnimCmd_GetPalette, 0x9C, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D5EB, 0x1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0706:
		.4byte anim_data__0706_0




.align 2, 0
	anim_data__0707_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D5EC, 0x20
		.4byte	AnimCmd_GetPalette, 0x9A, 0x800010, 0x2, 0x0, 0x2, 0x1, 0x2, 0x2, 0x2, 0x3, 0x2, 0x4, 0x2, 0x5, 0x2, 0x6, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0707:
		.4byte anim_data__0707_0




.align 2, 0
	anim_data__0708_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1D60C, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0708:
		.4byte anim_data__0708_0




.align 2, 0
	anim_data__0709_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D666, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0709:
		.4byte anim_data__0709_0




.align 2, 0
	anim_data__0710_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D6A6, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0710:
		.4byte anim_data__0710_0




.align 2, 0
	anim_data__0711_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D6E6, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0711:
		.4byte anim_data__0711_0




.align 2, 0
	anim_data__0712_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D726, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0712:
		.4byte anim_data__0712_0




.align 2, 0
	anim_data__0713_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D766, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D776, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D786, 0x10, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D796, 0x10, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0713:
		.4byte anim_data__0713_0




.align 2, 0
	anim_data__0714_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D7A6, 0x20
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010, 0x2, 0x0, 0x2, 0x1, 0x2, 0x2, 0x2, 0x3, 0x2, 0x4, 0x2, 0x5, 0x2, 0x6, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x13

.align 2, 0
	anim_0714:
		.4byte anim_data__0714_0




.align 2, 0
	anim_data__0715_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D7C6, 0x6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D7CC, 0x6, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D7D2, 0x6, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D7D8, 0x9, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D7E1, 0x9, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1D7D8, 0x9, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D7D2, 0x6, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D7CC, 0x6, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D7C6, 0x6, 0x3, 0x0
		.4byte	AnimCmd_JumpBack, 0x30

.align 2, 0
	anim_0715:
		.4byte anim_data__0715_0




.align 2, 0
	anim_data__0716_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D7EA, 0x8
		.4byte	AnimCmd_6, 0x1, 0x604F1FD, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D7F2, 0x8, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_1:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D7FA, 0x8
		.4byte	AnimCmd_6, 0x1, 0x605F3FA, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D802, 0x8, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_2:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D80A, 0x10
		.4byte	AnimCmd_6, 0x1, 0x506F5F6, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1D81A, 0x10, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_3:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D82A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x406F9F3, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1D832, 0x8, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_4:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D83A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x306FCF1, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1D842, 0x8, 0x1, 0x9
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_5:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D84A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x506FCF2, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1D852, 0x8, 0x1, 0xB
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_6:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D85A, 0x10
		.4byte	AnimCmd_6, 0x1, 0xA05FAF5, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1D86A, 0x10, 0x1, 0xD
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_7:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D87A, 0xC
		.4byte	AnimCmd_6, 0x1, 0xD04FAF8, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1D886, 0xC, 0x1, 0xF
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_8:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D7EA, 0x8
		.4byte	AnimCmd_6, 0x1, 0xF03FAFC, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D7F2, 0x8, 0x1, 0x11
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_9:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D7FA, 0x8
		.4byte	AnimCmd_6, 0x1, 0xE07FBFB, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1D802, 0x8, 0x1, 0x13
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_10:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D80A, 0x10
		.4byte	AnimCmd_6, 0x1, 0xC0BFBFA, 0x1, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x1D81A, 0x10, 0x1, 0x15
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_11:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D82A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x80DFBFA, 0x1, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x1D832, 0x8, 0x1, 0x17
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_12:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D83A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x40FFDFA, 0x1, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x1D842, 0x8, 0x1, 0x19
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_13:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D84A, 0x8
		.4byte	AnimCmd_6, 0x1, 0x50EFAFA, 0x1, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x1D852, 0x8, 0x1, 0x1B
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_14:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D85A, 0x10
		.4byte	AnimCmd_6, 0x1, 0x60CF5FB, 0x1, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x1D86A, 0x10, 0x1, 0x1D
		.4byte	AnimCmd_JumpBack, 0x10
	anim_data__0716_15:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D87A, 0xC
		.4byte	AnimCmd_6, 0x1, 0x708F2FC, 0x1, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x1D886, 0xC, 0x1, 0x1F
		.4byte	AnimCmd_JumpBack, 0x10

.align 2, 0
	anim_0716:
		.4byte anim_data__0716_0
		.4byte anim_data__0716_1
		.4byte anim_data__0716_2
		.4byte anim_data__0716_3
		.4byte anim_data__0716_4
		.4byte anim_data__0716_5
		.4byte anim_data__0716_6
		.4byte anim_data__0716_7
		.4byte anim_data__0716_8
		.4byte anim_data__0716_9
		.4byte anim_data__0716_10
		.4byte anim_data__0716_11
		.4byte anim_data__0716_12
		.4byte anim_data__0716_13
		.4byte anim_data__0716_14
		.4byte anim_data__0716_15




.align 2, 0
	anim_data__0717_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D892, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D89B, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D8A4, 0x9, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D8AD, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D8B1, 0x1, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0717:
		.4byte anim_data__0717_0




.align 2, 0
	anim_data__0718_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1D8B2, 0x10
		.4byte	AnimCmd_6, 0x0, 0x403FCFB, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D8C2, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D8D2, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D8E2, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1A

.align 2, 0
	anim_0718:
		.4byte anim_data__0718_0




.align 2, 0
	anim_data__0719_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D8F2, 0x4
		.4byte	AnimCmd_6, 0x0, 0x404FCFC, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D8F6, 0x4
		.4byte	AnimCmd_6, 0x0, 0x0, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0x13

.align 2, 0
	anim_0719:
		.4byte anim_data__0719_0




.align 2, 0
	anim_data__0720_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D8FA, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D8FB, 0x1, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D8FC, 0x1, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D8FD, 0x1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D8FE, 0x1, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x1C

.align 2, 0
	anim_0720:
		.4byte anim_data__0720_0




.align 2, 0
	anim_data__0721_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D8FF, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D900, 0x1, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D901, 0x1, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D902, 0x1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D903, 0x1, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x1C

.align 2, 0
	anim_0721:
		.4byte anim_data__0721_0




.align 2, 0
	anim_data__0722_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1D904, 0x1, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D905, 0x1, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1D906, 0x1, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1D907, 0x1, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1D908, 0x1, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x1C

.align 2, 0
	anim_0722:
		.4byte anim_data__0722_0




.align 2, 0
	anim_data__0723_0:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D909, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0723_1:
		.4byte	AnimCmd_GetPalette, 0x9D, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D919, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0723_2:
		.4byte	AnimCmd_GetPalette, 0x9E, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D929, 0x40, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0723:
		.4byte anim_data__0723_0
		.4byte anim_data__0723_1
		.4byte anim_data__0723_2




.align 2, 0
	anim_data__0724_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D969, 0x10
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_6, 0x0, 0x10DE5F3, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0724:
		.4byte anim_data__0724_0




.align 2, 0
	anim_data__0725_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D979, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0725_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D97D, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0725_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D981, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0725_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D985, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0725_4:
		.4byte	AnimCmd_GetPalette, 0x9F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D989, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0725_5:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1D98D, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0725_6:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D991, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0725_7:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D995, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0725_8:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D999, 0x4, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0725_9:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D99D, 0x4, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0725_10:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9A1, 0x4, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0725_11:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9A5, 0x4, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__0725_12:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9A9, 0x4, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__0725_13:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D9AD, 0x4, 0x1, 0xD
		.4byte	AnimCmd_4
	anim_data__0725_14:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D9B1, 0x4, 0x1, 0xE
		.4byte	AnimCmd_4
	anim_data__0725_15:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x1D9B5, 0x4, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__0725_16:
		.4byte	AnimCmd_GetPalette, 0xA0, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1D9B9, 0x4, 0x1, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0725:
		.4byte anim_data__0725_0
		.4byte anim_data__0725_1
		.4byte anim_data__0725_2
		.4byte anim_data__0725_3
		.4byte anim_data__0725_4
		.4byte anim_data__0725_5
		.4byte anim_data__0725_6
		.4byte anim_data__0725_7
		.4byte anim_data__0725_8
		.4byte anim_data__0725_9
		.4byte anim_data__0725_10
		.4byte anim_data__0725_11
		.4byte anim_data__0725_12
		.4byte anim_data__0725_13
		.4byte anim_data__0725_14
		.4byte anim_data__0725_15
		.4byte anim_data__0725_16




.align 2, 0
	anim_data__0726_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D9BD, 0x10
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010, 0x8, 0x0, 0x8, 0x1, 0x8, 0x2, 0x8, 0x3
		.4byte	AnimCmd_JumpBack, 0xB

.align 2, 0
	anim_0726:
		.4byte anim_data__0726_0




.align 2, 0
	anim_data__0727_0:
		.4byte	AnimCmd_GetTileIndex, 0x1D9CD, 0x10
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_PlaySoundEffect, 0x75, 0x4, 0x0, 0x4, 0x1, 0x4, 0x2, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0727:
		.4byte anim_data__0727_0




.align 2, 0
	anim_data__0728_0:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9DD, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0728_1:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9DF, 0x2, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0728_2:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9E1, 0x2, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0728_3:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9E3, 0x2, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0728_4:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9E5, 0x2, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0728:
		.4byte anim_data__0728_0
		.4byte anim_data__0728_1
		.4byte anim_data__0728_2
		.4byte anim_data__0728_3
		.4byte anim_data__0728_4




.align 2, 0
	anim_data__0729_0:
		.4byte	AnimCmd_GetPalette, 0xA2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1D9E7, 0x9, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0729:
		.4byte anim_data__0729_0




.align 2, 0
	anim_data__0730_0:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1D9F0, 0x9
		.4byte	AnimCmd_6, 0x0, 0x410E4F0, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1D9F9, 0x9, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1DA02, 0x9, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1DA0B, 0x9, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1DA14, 0x6, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1DA1A, 0x6, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1DA20, 0x9, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1DA29, 0x9, 0x4, 0x7
		.4byte	AnimCmd_JumpBack, 0x2E
	anim_data__0730_1:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DA32, 0x9, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1DA3B, 0x9, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1DA44, 0x9, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1DA4D, 0x9, 0x4, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0730:
		.4byte anim_data__0730_0
		.4byte anim_data__0730_1




.align 2, 0
	anim_data__0731_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DA56, 0x40
		.4byte	AnimCmd_6, 0x0, 0x46474547, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0731_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DA96, 0x40, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0731_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DAD6, 0x40
		.4byte	AnimCmd_6, 0x0, 0xFF00FF00, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0731_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB16, 0x40, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0731_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB56, 0xE, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0731:
		.4byte anim_data__0731_0
		.4byte anim_data__0731_1
		.4byte anim_data__0731_2
		.4byte anim_data__0731_3
		.4byte anim_data__0731_4




.align 2, 0
	anim_data__0732_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB64, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0732_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB74, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0732_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB84, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0732_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DB94, 0x10, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0732:
		.4byte anim_data__0732_0
		.4byte anim_data__0732_1
		.4byte anim_data__0732_2
		.4byte anim_data__0732_3




.align 2, 0
	anim_data__0733_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DBA4, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0733:
		.4byte anim_data__0733_0




.align 2, 0
	anim_data__0734_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DBD4, 0x3, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0734:
		.4byte anim_data__0734_0




.align 2, 0
	anim_data__0735_0:
		.4byte	AnimCmd_GetPalette, 0xA5, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x1DBD7, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0735:
		.4byte anim_data__0735_0




.align 2, 0
	anim_data__0736_0:
		.4byte	AnimCmd_GetPalette, 0xA6, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1DBF1, 0x8C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0736_1:
		.4byte	AnimCmd_GetPalette, 0xA6, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x1DC7D, 0x8C, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1DD09, 0x8C, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1DD95, 0x8C, 0xF, 0x3
		.4byte	AnimCmd_4
	anim_data__0736_2:
		.4byte	AnimCmd_GetPalette, 0xA7, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1DE21, 0x5B, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0736_3:
		.4byte	AnimCmd_GetPalette, 0xA7, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1DE7C, 0x68, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1DEE4, 0x75, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1DF59, 0x82, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1DFDB, 0x82, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1E05D, 0x82, 0xF, 0x9
		.4byte	AnimCmd_4
	anim_data__0736_4:
		.4byte	AnimCmd_GetPalette, 0xA8, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1E0DF, 0x82, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0736_5:
		.4byte	AnimCmd_GetPalette, 0xA8, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1E161, 0x82, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1E1E3, 0x8F, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1E272, 0x90, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1E302, 0x90, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1E392, 0x90, 0xF, 0xF
		.4byte	AnimCmd_4
	anim_data__0736_6:
		.4byte	AnimCmd_GetPalette, 0xA9, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1E422, 0x8C, 0x1, 0x10
		.4byte	AnimCmd_4
	anim_data__0736_7:
		.4byte	AnimCmd_GetPalette, 0xA9, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1E4AE, 0x8C, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x1E53A, 0x8C, 0x3, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x1E5C6, 0x8C, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x1E652, 0x8C, 0xF, 0x14
		.4byte	AnimCmd_4
	anim_data__0736_8:
		.4byte	AnimCmd_GetPalette, 0xAA, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1E6DE, 0x82, 0x1, 0x15
		.4byte	AnimCmd_4
	anim_data__0736_9:
		.4byte	AnimCmd_GetPalette, 0xAA, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1E760, 0x82, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x1E7E2, 0x82, 0x4, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x1E864, 0x82, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x1E8E6, 0x82, 0x5, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x1E968, 0x82, 0xF, 0x1A
		.4byte	AnimCmd_4
	anim_data__0736_10:
		.4byte	AnimCmd_GetPalette, 0xAB, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1E9EA, 0x23, 0x1, 0x1B
		.4byte	AnimCmd_4
	anim_data__0736_11:
		.4byte	AnimCmd_GetPalette, 0xAB, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1EA0D, 0x23, 0x3, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x1EA30, 0x23, 0x3, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x1EA53, 0x23, 0x3, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x1EA76, 0x23, 0x2, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x1EA99, 0x23, 0xF, 0x20
		.4byte	AnimCmd_4

.align 2, 0
	anim_0736:
		.4byte anim_data__0736_0
		.4byte anim_data__0736_1
		.4byte anim_data__0736_2
		.4byte anim_data__0736_3
		.4byte anim_data__0736_4
		.4byte anim_data__0736_5
		.4byte anim_data__0736_6
		.4byte anim_data__0736_7
		.4byte anim_data__0736_8
		.4byte anim_data__0736_9
		.4byte anim_data__0736_10
		.4byte anim_data__0736_11




.align 2, 0
	anim_data__0737_0:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EABC, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0737_1:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EACC, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0737_2:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EADC, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0737_3:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EAEC, 0x10, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0737_4:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EAFC, 0x10, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0737_5:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EB0C, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0737_6:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EB4C, 0x40, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0737_7:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EB8C, 0x40, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0737_8:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EBCC, 0x40, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0737_9:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EC0C, 0x40, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0737:
		.4byte anim_data__0737_0
		.4byte anim_data__0737_1
		.4byte anim_data__0737_2
		.4byte anim_data__0737_3
		.4byte anim_data__0737_4
		.4byte anim_data__0737_5
		.4byte anim_data__0737_6
		.4byte anim_data__0737_7
		.4byte anim_data__0737_8
		.4byte anim_data__0737_9




.align 2, 0
	anim_data__0738_0:
		.4byte	AnimCmd_GetPalette, 0xAD, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x1EC4C, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0738_1:
		.4byte	AnimCmd_GetPalette, 0xAD, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x1EC64, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1EC7C, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1EC94, 0x18, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1ECAC, 0x18, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0738:
		.4byte anim_data__0738_0
		.4byte anim_data__0738_1




.align 2, 0
	anim_data__0739_0:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1ECC4, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0739_1:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1ED04, 0x40, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0739_2:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1ED44, 0x40, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0739_3:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1ED84, 0x40, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0739_4:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EDC4, 0x40, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0739_5:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EE04, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0739_6:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EE44, 0x40, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0739_7:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EE84, 0x40, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0739_8:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EEC4, 0x40, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0739_9:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EF04, 0x40, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0739_10:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EF44, 0x40, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0739_11:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x1EF84, 0x40, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0739:
		.4byte anim_data__0739_0
		.4byte anim_data__0739_1
		.4byte anim_data__0739_2
		.4byte anim_data__0739_3
		.4byte anim_data__0739_4
		.4byte anim_data__0739_5
		.4byte anim_data__0739_6
		.4byte anim_data__0739_7
		.4byte anim_data__0739_8
		.4byte anim_data__0739_9
		.4byte anim_data__0739_10
		.4byte anim_data__0739_11




.align 2, 0
	anim_data__0740_0:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1EFC4, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0740:
		.4byte anim_data__0740_0




.align 2, 0
	anim_data__0741_0:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1EFFA, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0741_1:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F01E, 0x1E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0741_2:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F03C, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0741_3:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F060, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0741_4:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F084, 0x12, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0741_5:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F096, 0xC, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0741:
		.4byte anim_data__0741_0
		.4byte anim_data__0741_1
		.4byte anim_data__0741_2
		.4byte anim_data__0741_3
		.4byte anim_data__0741_4
		.4byte anim_data__0741_5




.align 2, 0
	anim_data__0742_0:
		.4byte	AnimCmd_GetPalette, 0xA0, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1F0A2, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0742:
		.4byte anim_data__0742_0




.align 2, 0
	anim_data__0743_0:
		.4byte	AnimCmd_GetPalette, 0xAF, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F0B2, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0743:
		.4byte anim_data__0743_0




.align 2, 0
	anim_data__0744_0:
		.4byte	AnimCmd_GetPalette, 0xAF, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F0E8, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0744:
		.4byte anim_data__0744_0




.align 2, 0
	anim_data__0745_0:
		.4byte	AnimCmd_GetPalette, 0xAF, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F11E, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0745:
		.4byte anim_data__0745_0




.align 2, 0
	anim_data__0746_0:
		.4byte	AnimCmd_GetPalette, 0xAF, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F154, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0746:
		.4byte anim_data__0746_0




.align 2, 0
	anim_data__0747_0:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F18A, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0747_1:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F1AE, 0x20, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0747_2:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F1CE, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0747_3:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F1F2, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0747_4:
		.4byte	AnimCmd_GetPalette, 0xAE, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F216, 0x14, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0747:
		.4byte anim_data__0747_0
		.4byte anim_data__0747_1
		.4byte anim_data__0747_2
		.4byte anim_data__0747_3
		.4byte anim_data__0747_4




.align 2, 0
	anim_data__0748_0:
		.4byte	AnimCmd_GetPalette, 0xAF, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F22A, 0x36, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0748:
		.4byte anim_data__0748_0




.align 2, 0
	anim_data__0749_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F260, 0x6, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F266, 0x6, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F26C, 0x6, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F272, 0x6, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F278, 0x6, 0x6, 0x4
		.4byte	AnimCmd_4
	anim_data__0749_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F278, 0x6, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0749:
		.4byte anim_data__0749_0
		.4byte anim_data__0749_1




.align 2, 0
	anim_data__0750_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F27E, 0xC, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F28A, 0xC, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F296, 0xC, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F2A2, 0xC, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F2AE, 0xC, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F2BA, 0xC, 0x6, 0x5
		.4byte	AnimCmd_4
	anim_data__0750_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F2BA, 0xC, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0750:
		.4byte anim_data__0750_0
		.4byte anim_data__0750_1




.align 2, 0
	anim_data__0751_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F2C6, 0x4, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F2CA, 0x4, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F2CE, 0x6, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F2D4, 0x8, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F2DC, 0xA, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F2E6, 0xA, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1F2F0, 0xA, 0x6, 0x6
		.4byte	AnimCmd_4
	anim_data__0751_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F2F0, 0xA, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0751:
		.4byte anim_data__0751_0
		.4byte anim_data__0751_1




.align 2, 0
	anim_data__0752_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F2FA, 0x6, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F300, 0x6, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F306, 0x6, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F30C, 0x6, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F312, 0x6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0752_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F312, 0x6, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0752:
		.4byte anim_data__0752_0
		.4byte anim_data__0752_1




.align 2, 0
	anim_data__0753_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F318, 0x10, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F328, 0x10, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F338, 0x10, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F348, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F358, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F368, 0x10, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1F378, 0x10, 0x6, 0x6
		.4byte	AnimCmd_4
	anim_data__0753_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F378, 0x10, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0753:
		.4byte anim_data__0753_0
		.4byte anim_data__0753_1




.align 2, 0
	anim_data__0754_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F388, 0x4, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F38C, 0x4, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F390, 0x6, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F396, 0x8, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F39E, 0xA, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F3A8, 0xA, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1F3B2, 0x12, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1F3C4, 0x15, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1F3D9, 0x1C, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1F3F5, 0x15, 0x6, 0x9
		.4byte	AnimCmd_4
	anim_data__0754_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F3F5, 0x15, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0754:
		.4byte anim_data__0754_0
		.4byte anim_data__0754_1




.align 2, 0
	anim_data__0755_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F40A, 0x24, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F42E, 0x24, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F452, 0x24, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F476, 0x24, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F49A, 0x24, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F4BE, 0x24, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1F4E2, 0x24, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1F506, 0x24, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1F52A, 0x24, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1F54E, 0x24, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1F572, 0x24, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1F596, 0x24, 0x6, 0xB
		.4byte	AnimCmd_4
	anim_data__0755_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F596, 0x24, 0x1, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0755:
		.4byte anim_data__0755_0
		.4byte anim_data__0755_1




.align 2, 0
	anim_data__0756_0:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F5BA, 0x2, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1F5BC, 0x4, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1F5C0, 0x6, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1F5C6, 0x8, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1F5CE, 0x8, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1F5D6, 0xA, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1F5E0, 0xC, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1F5EC, 0x15, 0x6, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x1F601, 0x15, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x1F616, 0x18, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x1F62E, 0x1B, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x1F649, 0x1E, 0x6, 0xB
		.4byte	AnimCmd_4
	anim_data__0756_1:
		.4byte	AnimCmd_GetPalette, 0xB0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x1F649, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x1F667, 0x1E, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x1F685, 0x1E, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x1F6A3, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x1F6C1, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x1F6DF, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0756:
		.4byte anim_data__0756_0
		.4byte anim_data__0756_1




.align 2, 0
	anim_data__0757_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F6FD, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0757_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F711, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0757_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F72B, 0x1A, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0757:
		.4byte anim_data__0757_0
		.4byte anim_data__0757_1
		.4byte anim_data__0757_2




.align 2, 0
	anim_data__0758_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F745, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0758_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F749, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0758_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F74D, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0758_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F751, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0758_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F755, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0758_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F759, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0758_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x1F75D, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0758:
		.4byte anim_data__0758_0
		.4byte anim_data__0758_1
		.4byte anim_data__0758_2
		.4byte anim_data__0758_3
		.4byte anim_data__0758_4
		.4byte anim_data__0758_5
		.4byte anim_data__0758_6




.align 2, 0
	anim_data__0759_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F761, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0759_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F765, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0759_2:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F769, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0759_3:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F76D, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0759_4:
		.4byte	AnimCmd_GetPalette, 0x9F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1F771, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0759:
		.4byte anim_data__0759_0
		.4byte anim_data__0759_1
		.4byte anim_data__0759_2
		.4byte anim_data__0759_3
		.4byte anim_data__0759_4




.align 2, 0
	anim_data__0760_0:
		.4byte	AnimCmd_GetPalette, 0xB1, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x1F775, 0x9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0760_1:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1F77E, 0x9, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0760_2:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x1F787, 0x9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0760_3:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1F790, 0x9, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0760_4:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x1F799, 0x9, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0760_5:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7A2, 0x9, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0760_6:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7AB, 0x9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0760_7:
		.4byte	AnimCmd_GetPalette, 0xB1, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7B4, 0x9, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0760:
		.4byte anim_data__0760_0
		.4byte anim_data__0760_1
		.4byte anim_data__0760_2
		.4byte anim_data__0760_3
		.4byte anim_data__0760_4
		.4byte anim_data__0760_5
		.4byte anim_data__0760_6
		.4byte anim_data__0760_7




.align 2, 0
	anim_data__0761_0:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7BD, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0761_1:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7DB, 0x1C, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0761_2:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F7F7, 0x26, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0761_3:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F81D, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0761_4:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F841, 0x20, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0761_5:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F861, 0x18, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0761_6:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F879, 0x20, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0761_7:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F899, 0x1E, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0761_8:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F8B7, 0x22, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0761:
		.4byte anim_data__0761_0
		.4byte anim_data__0761_1
		.4byte anim_data__0761_2
		.4byte anim_data__0761_3
		.4byte anim_data__0761_4
		.4byte anim_data__0761_5
		.4byte anim_data__0761_6
		.4byte anim_data__0761_7
		.4byte anim_data__0761_8




.align 2, 0
	anim_data__0762_0:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F8D9, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0762_1:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F8FD, 0x22, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0762_2:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F91F, 0x22, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0762_3:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F941, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0762_4:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F965, 0x22, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0762_5:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F987, 0x24, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0762_6:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F9AB, 0x20, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0762_7:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F9CB, 0xA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0762_8:
		.4byte	AnimCmd_GetPalette, 0xB5, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x1F9D5, 0x26, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0762:
		.4byte anim_data__0762_0
		.4byte anim_data__0762_1
		.4byte anim_data__0762_2
		.4byte anim_data__0762_3
		.4byte anim_data__0762_4
		.4byte anim_data__0762_5
		.4byte anim_data__0762_6
		.4byte anim_data__0762_7
		.4byte anim_data__0762_8




.align 2, 0
	anim_data__0763_0:
		.4byte	AnimCmd_GetPalette, 0xB6, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F9FB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0763_1:
		.4byte	AnimCmd_GetPalette, 0xB7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F9FB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0763_2:
		.4byte	AnimCmd_GetPalette, 0xB8, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F9FB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0763_3:
		.4byte	AnimCmd_GetPalette, 0xB9, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F9FB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0763_4:
		.4byte	AnimCmd_GetPalette, 0xBA, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1F9FB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0763:
		.4byte anim_data__0763_0
		.4byte anim_data__0763_1
		.4byte anim_data__0763_2
		.4byte anim_data__0763_3
		.4byte anim_data__0763_4




.align 2, 0
	anim_data__0764_0:
		.4byte	AnimCmd_GetPalette, 0xB6, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1FA13, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0764_1:
		.4byte	AnimCmd_GetPalette, 0xB7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1FA13, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0764_2:
		.4byte	AnimCmd_GetPalette, 0xB8, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1FA13, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0764_3:
		.4byte	AnimCmd_GetPalette, 0xB9, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1FA13, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0764_4:
		.4byte	AnimCmd_GetPalette, 0xBA, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x1FA13, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0764:
		.4byte anim_data__0764_0
		.4byte anim_data__0764_1
		.4byte anim_data__0764_2
		.4byte anim_data__0764_3
		.4byte anim_data__0764_4




.align 2, 0
	anim_data__0765_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FA2F, 0x2A, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FA59, 0x2A, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0765_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FA83, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FA93, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FAA3, 0x10, 0xC, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FA93, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FA83, 0x10, 0x2, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0765:
		.4byte anim_data__0765_0
		.4byte anim_data__0765_1




.align 2, 0
	anim_data__0766_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FAB3, 0x18, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FACB, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FAE3, 0x18, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0766_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FAFB, 0xC, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FB07, 0x10, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FB17, 0x10, 0xC, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1FB27, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1FB37, 0xC, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0766:
		.4byte anim_data__0766_0
		.4byte anim_data__0766_1




.align 2, 0
	anim_data__0767_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FB43, 0x1C, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FB5F, 0x1C, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FB7B, 0x1C, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0767_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FB97, 0x14, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FBAB, 0x18, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FBC3, 0x12, 0xC, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1FBD5, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1FB97, 0x14, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0767:
		.4byte anim_data__0767_0
		.4byte anim_data__0767_1




.align 2, 0
	anim_data__0768_0:
		.4byte	AnimCmd_GetPalette, 0xBB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FBED, 0x23, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FC10, 0x1C, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0768_1:
		.4byte	AnimCmd_GetPalette, 0xBB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FC2C, 0x10, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FC3C, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FC4C, 0x10, 0xC, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FC3C, 0x10, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FC2C, 0x10, 0x2, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0768:
		.4byte anim_data__0768_0
		.4byte anim_data__0768_1




.align 2, 0
	anim_data__0769_0:
		.4byte	AnimCmd_GetPalette, 0xBC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FC5C, 0x18, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FC74, 0x18, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FC8C, 0x18, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0769_1:
		.4byte	AnimCmd_GetPalette, 0xBC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FCA4, 0x10, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FCB4, 0x10, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FCC4, 0x10, 0xC, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1FCD4, 0x10, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x1FCE4, 0x10, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0769:
		.4byte anim_data__0769_0
		.4byte anim_data__0769_1




.align 2, 0
	anim_data__0770_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x1FCF4, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FCFD, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FD0D, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FD1D, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FD2D, 0x10, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x1FD3D, 0x10, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x1FD4D, 0xC, 0x3, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0770:
		.4byte anim_data__0770_0




.align 2, 0
	anim_data__0771_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FD59, 0x14, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FD6D, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FD8B, 0x14, 0x28, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0771:
		.4byte anim_data__0771_0




.align 2, 0
	anim_data__0772_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FD9F, 0x10, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FDAF, 0x14, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FDC3, 0xF, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FDC3, 0xF, 0x6, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0772:
		.4byte anim_data__0772_0




.align 2, 0
	anim_data__0773_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FDD2, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FDE6, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FDFA, 0x1E, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FE18, 0x14, 0x28, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0773:
		.4byte anim_data__0773_0




.align 2, 0
	anim_data__0774_0:
		.4byte	AnimCmd_GetPalette, 0xBB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FE2C, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FE40, 0xF, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FE4F, 0x18, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FE67, 0xF, 0x28, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0774:
		.4byte anim_data__0774_0




.align 2, 0
	anim_data__0775_0:
		.4byte	AnimCmd_GetPalette, 0xBC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FE76, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FE8A, 0x14, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FE9E, 0x18, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FEB6, 0x14, 0x28, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0775:
		.4byte anim_data__0775_0




.align 2, 0
	anim_data__0776_0:
		.4byte	AnimCmd_GetPalette, 0xBD, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x1FECA, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x1FF0A, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x1FF4A, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x1FF8A, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x1FFCA, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2000A, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0776:
		.4byte anim_data__0776_0




.align 2, 0
	anim_data__0777_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2004A, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2008A, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x200CA, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2010A, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2014A, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2018A, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0777:
		.4byte anim_data__0777_0




.align 2, 0
	anim_data__0778_0:
		.4byte	AnimCmd_GetPalette, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x201CA, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2020A, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2024A, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2028A, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x202CA, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2030A, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0778:
		.4byte anim_data__0778_0




.align 2, 0
	anim_data__0779_0:
		.4byte	AnimCmd_GetPalette, 0xBE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2034A, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2038A, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x203CA, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2040A, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2044A, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2048A, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0779:
		.4byte anim_data__0779_0




.align 2, 0
	anim_data__0780_0:
		.4byte	AnimCmd_GetPalette, 0x25, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x204CA, 0x40, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2050A, 0x40, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2054A, 0x40, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2058A, 0x40, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x205CA, 0x40, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2060A, 0x40, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0780:
		.4byte anim_data__0780_0




.align 2, 0
	anim_data__0781_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2064A, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0781_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2067A, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0781_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x20694, 0x20, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0781:
		.4byte anim_data__0781_0
		.4byte anim_data__0781_1
		.4byte anim_data__0781_2




.align 2, 0
	anim_data__0782_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x206B4, 0xF, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x206C3, 0x10, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x206D3, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x206E7, 0x10, 0xC, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x206E7, 0x10, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x206E7, 0x10, 0xE, 0x3
		.4byte	AnimCmd_4
	anim_data__0782_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x206E7, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x206F7, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x20707, 0x14, 0x10, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0782:
		.4byte anim_data__0782_0
		.4byte anim_data__0782_1




.align 2, 0
	anim_data__0783_0:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2071B, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0783_1:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2072F, 0x14, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x20743, 0x18, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2075B, 0x18, 0x3, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0783:
		.4byte anim_data__0783_0
		.4byte anim_data__0783_1




.align 2, 0
	anim_data__0784_0:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x20773, 0x18, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20773, 0x18, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20773, 0x18, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20773, 0x18, 0xC, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2078B, 0x18, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x207A3, 0x18, 0xE, 0x2
		.4byte	AnimCmd_4
	anim_data__0784_1:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x207BB, 0x18, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x207D3, 0x18, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x207EB, 0x18, 0x10, 0x5
		.4byte	AnimCmd_4
	anim_data__0784_2:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x20803, 0x18, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0784:
		.4byte anim_data__0784_0
		.4byte anim_data__0784_1
		.4byte anim_data__0784_2




.align 2, 0
	anim_data__0785_0:
		.4byte	AnimCmd_GetPalette, 0xC0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2081B, 0x68, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20883, 0x68, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0785_1:
		.4byte	AnimCmd_GetPalette, 0xC0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x208EB, 0x30, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2091B, 0x30, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0785_2:
		.4byte	AnimCmd_GetPalette, 0xC1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2094B, 0x68, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x209B3, 0x68, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0785_3:
		.4byte	AnimCmd_GetPalette, 0xC1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20A1B, 0x30, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x20A4B, 0x30, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0785:
		.4byte anim_data__0785_0
		.4byte anim_data__0785_1
		.4byte anim_data__0785_2
		.4byte anim_data__0785_3




.align 2, 0
	anim_data__0786_0:
		.4byte	AnimCmd_GetPalette, 0xC2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20A7B, 0x50, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20ACB, 0x50, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0786_1:
		.4byte	AnimCmd_GetPalette, 0xC2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20B1B, 0x50, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x20B6B, 0x46, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0786_2:
		.4byte	AnimCmd_GetPalette, 0xC3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20BB1, 0x50, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x20C01, 0x50, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0786_3:
		.4byte	AnimCmd_GetPalette, 0xC3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20C51, 0x50, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x20CA1, 0x46, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0786:
		.4byte anim_data__0786_0
		.4byte anim_data__0786_1
		.4byte anim_data__0786_2
		.4byte anim_data__0786_3




.align 2, 0
	anim_data__0787_0:
		.4byte	AnimCmd_GetPalette, 0xC4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20CE7, 0x63, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20D4A, 0x63, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0787_1:
		.4byte	AnimCmd_GetPalette, 0xC4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20DAD, 0x50, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x20DFD, 0x50, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0787_2:
		.4byte	AnimCmd_GetPalette, 0xC5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20E4D, 0x63, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x20EB0, 0x63, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0787_3:
		.4byte	AnimCmd_GetPalette, 0xC5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20F13, 0x50, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x20F63, 0x50, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0787:
		.4byte anim_data__0787_0
		.4byte anim_data__0787_1
		.4byte anim_data__0787_2
		.4byte anim_data__0787_3




.align 2, 0
	anim_data__0788_0:
		.4byte	AnimCmd_GetPalette, 0xC6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x20FB3, 0x48, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x20FFB, 0x48, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0788_1:
		.4byte	AnimCmd_GetPalette, 0xC6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21043, 0x38, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2107B, 0x40, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0788_2:
		.4byte	AnimCmd_GetPalette, 0xC7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x210BB, 0x48, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x21103, 0x48, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0788_3:
		.4byte	AnimCmd_GetPalette, 0xC7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2114B, 0x38, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x21183, 0x40, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0788:
		.4byte anim_data__0788_0
		.4byte anim_data__0788_1
		.4byte anim_data__0788_2
		.4byte anim_data__0788_3




.align 2, 0
	anim_data__0789_0:
		.4byte	AnimCmd_GetPalette, 0xC8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x211C3, 0x38, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x211FB, 0x38, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0789_1:
		.4byte	AnimCmd_GetPalette, 0xC8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21233, 0x2A, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2125D, 0x2A, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0789_2:
		.4byte	AnimCmd_GetPalette, 0xC9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21287, 0x38, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x212BF, 0x38, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0789_3:
		.4byte	AnimCmd_GetPalette, 0xC9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x212F7, 0x2A, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x21321, 0x2A, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0789:
		.4byte anim_data__0789_0
		.4byte anim_data__0789_1
		.4byte anim_data__0789_2
		.4byte anim_data__0789_3




.align 2, 0
	anim_data__0790_0:
		.4byte	AnimCmd_GetPalette, 0xCA, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2134B, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21369, 0x1E, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0790_1:
		.4byte	AnimCmd_GetPalette, 0xCB, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x21387, 0x1E, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x213A5, 0x1E, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0790:
		.4byte anim_data__0790_0
		.4byte anim_data__0790_1




.align 2, 0
	anim_data__0791_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x213C3, 0x2A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0791_1:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x213ED, 0x2A, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21417, 0x2A, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21441, 0x2A, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2146B, 0x2A, 0x8, 0x4
		.4byte	AnimCmd_4
	anim_data__0791_2:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x21495, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0791:
		.4byte anim_data__0791_0
		.4byte anim_data__0791_1
		.4byte anim_data__0791_2




.align 2, 0
	anim_data__0792_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x214D5, 0xF, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0792:
		.4byte anim_data__0792_0




.align 2, 0
	anim_data__0793_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x214E4, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0793:
		.4byte anim_data__0793_0




.align 2, 0
	anim_data__0794_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x214EA, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0794:
		.4byte anim_data__0794_0




.align 2, 0
	anim_data__0795_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x214F0, 0xF, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0795:
		.4byte anim_data__0795_0




.align 2, 0
	anim_data__0796_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x214FF, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0796:
		.4byte anim_data__0796_0




.align 2, 0
	anim_data__0797_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x21505, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0797:
		.4byte anim_data__0797_0




.align 2, 0
	anim_data__0798_0:
		.4byte	AnimCmd_GetPalette, 0xCC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2150B, 0x4, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2150F, 0x4, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21513, 0x4, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21517, 0x4, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2151B, 0x4, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2151F, 0x2, 0x4, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0798:
		.4byte anim_data__0798_0




.align 2, 0
	anim_data__0799_0:
		.4byte	AnimCmd_GetPalette, 0xCD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x21521, 0x18, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21539, 0x18, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21551, 0x10, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0799:
		.4byte anim_data__0799_0




.align 2, 0
	anim_data__0804_0:
		.4byte	AnimCmd_GetPalette, 0xCE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21561, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0804:
		.4byte anim_data__0804_0




.align 2, 0
	anim_data__0805_0:
		.4byte	AnimCmd_GetPalette, 0xCF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21609, 0xC0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0805:
		.4byte anim_data__0805_0




.align 2, 0
	anim_data__0806_0:
		.4byte	AnimCmd_GetPalette, 0xD0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x216C9, 0xD2, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0806:
		.4byte anim_data__0806_0




.align 2, 0
	anim_data__0807_0:
		.4byte	AnimCmd_GetPalette, 0xAA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2179B, 0xB0, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0807:
		.4byte anim_data__0807_0




.align 2, 0
	anim_data__0808_0:
		.4byte	AnimCmd_GetPalette, 0xD1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2184B, 0x8C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0808:
		.4byte anim_data__0808_0




.align 2, 0
	anim_data__0809_0:
		.4byte	AnimCmd_GetPalette, 0xAB, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x218D7, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0809:
		.4byte anim_data__0809_0




.align 2, 0
	anim_data__0810_0:
		.4byte	AnimCmd_GetPalette, 0xAA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x218F5, 0x3F, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0810_1:
		.4byte	AnimCmd_GetPalette, 0xAA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21934, 0x3F, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21973, 0x3F, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x219B2, 0x46, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x219F8, 0x46, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x21A3E, 0x46, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x21A84, 0x46, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x21ACA, 0x50, 0xF, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0810:
		.4byte anim_data__0810_0
		.4byte anim_data__0810_1




.align 2, 0
	anim_data__0815_0:
		.4byte	AnimCmd_GetPalette, 0xD2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21B1A, 0x1E, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21B38, 0x1E, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21B56, 0x1E, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21B74, 0x1E, 0x8, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0815:
		.4byte anim_data__0815_0




.align 2, 0
	anim_data__0816_0:
		.4byte	AnimCmd_GetPalette, 0xD2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21B92, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0816_1:
		.4byte	AnimCmd_GetPalette, 0xD2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21B96, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0816:
		.4byte anim_data__0816_0
		.4byte anim_data__0816_1




.align 2, 0
	anim_data__0817_0:
		.4byte	AnimCmd_GetPalette, 0xD2, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21B9A, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21BA3, 0x9, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21BAC, 0x9, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21BB5, 0x9, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x21BBE, 0x9, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0817:
		.4byte anim_data__0817_0




.align 2, 0
	anim_data__0818_0:
		.4byte	AnimCmd_GetPalette, 0x2A, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x21BC7, 0x18, 0x1, 0x0
		.4byte	AnimCmd_GetPalette, 0x2A, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x21BDF, 0x18, 0x1, 0x1
		.4byte	AnimCmd_GetPalette, 0x2A, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x21BF7, 0x18, 0x1, 0x2
		.4byte	AnimCmd_GetPalette, 0x2A, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x21C0F, 0x18, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x20

.align 2, 0
	anim_0818:
		.4byte anim_data__0818_0




.align 2, 0
	anim_data__0819_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21C27, 0x1E, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21C45, 0x19, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21C5E, 0x14, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21C72, 0x14, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x21C86, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x21C9E, 0x19, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x21CB7, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x21CCF, 0x14, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0819:
		.4byte anim_data__0819_0




.align 2, 0
	anim_data__0820_0:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x21CE3, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21D01, 0x23, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21D24, 0x23, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0820:
		.4byte anim_data__0820_0




.align 2, 0
	anim_data__0821_0:
		.4byte	AnimCmd_GetPalette, 0xD3, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x21D47, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21D4B, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x21D4F, 0x4, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12

.align 2, 0
	anim_0821:
		.4byte anim_data__0821_0




.align 2, 0
	anim_data__0822_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21D53, 0x23, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x21D76, 0x23, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0822_1:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21D99, 0x2A, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x21DC3, 0x2A, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0822:
		.4byte anim_data__0822_0
		.4byte anim_data__0822_1




.align 2, 0
	anim_data__0823_0:
		.4byte	AnimCmd_GetPalette, 0xD4, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x21DED, 0xF, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0823:
		.4byte anim_data__0823_0




.align 2, 0
	anim_data__0824_0:
		.4byte	AnimCmd_GetPalette, 0xD5, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21DFC, 0xA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0824_1:
		.4byte	AnimCmd_GetPalette, 0xD5, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21E06, 0x15, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0824_2:
		.4byte	AnimCmd_GetPalette, 0xD5, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21E1B, 0x1E, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0824_3:
		.4byte	AnimCmd_GetPalette, 0xD5, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x21E39, 0x50, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0824:
		.4byte anim_data__0824_0
		.4byte anim_data__0824_1
		.4byte anim_data__0824_2
		.4byte anim_data__0824_3




.align 2, 0
	anim_data__0828_0:
		.4byte	AnimCmd_GetPalette, 0xD6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21E89, 0x38, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0828_1:
		.4byte	AnimCmd_GetPalette, 0xD6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21EC1, 0x4E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0828_2:
		.4byte	AnimCmd_GetPalette, 0xD6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21F0F, 0x3C, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0828_3:
		.4byte	AnimCmd_GetPalette, 0xD6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x21F4B, 0x60, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0828:
		.4byte anim_data__0828_0
		.4byte anim_data__0828_1
		.4byte anim_data__0828_2
		.4byte anim_data__0828_3




.align 2, 0
	anim_data__0829_0:
		.4byte	AnimCmd_GetPalette, 0xD7, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x21FAB, 0x3F, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0829_1:
		.4byte	AnimCmd_GetPalette, 0xD7, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x21FEA, 0x3F, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0829:
		.4byte anim_data__0829_0
		.4byte anim_data__0829_1




.align 2, 0
	anim_data__0830_0:
		.4byte	AnimCmd_GetPalette, 0xD8, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x22029, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0830_1:
		.4byte	AnimCmd_GetPalette, 0xD8, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x22083, 0x5A, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0830:
		.4byte anim_data__0830_0
		.4byte anim_data__0830_1




.align 2, 0
	anim_data__0831_0:
		.4byte	AnimCmd_GetPalette, 0xD9, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x220DD, 0x3, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x220E0, 0x3, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x220E3, 0x3, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x220E6, 0x3, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x220DD, 0x3, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x220E0, 0x3, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x220E3, 0x3, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x220E6, 0x3, 0xA, 0x3
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0831:
		.4byte anim_data__0831_0




.align 2, 0
	anim_data__0832_0:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x220E9, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0832_1:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x220ED, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0832_2:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x220FD, 0x1, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0832_3:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x220FE, 0x1, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0832_4:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x220FF, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0832_5:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x22103, 0x10, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0832_6:
		.4byte	AnimCmd_GetPalette, 0xDA, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x22113, 0x40, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0832:
		.4byte anim_data__0832_0
		.4byte anim_data__0832_1
		.4byte anim_data__0832_2
		.4byte anim_data__0832_3
		.4byte anim_data__0832_4
		.4byte anim_data__0832_5
		.4byte anim_data__0832_6




.align 2, 0
	anim_data__0833_0:
		.4byte	AnimCmd_GetPalette, 0xD8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x22153, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0833:
		.4byte anim_data__0833_0




.align 2, 0
	anim_data__0834_0:
		.4byte	AnimCmd_GetPalette, 0xDB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2215B, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2216F, 0x14, 0x4, 0x1
		.4byte	AnimCmd_4
	anim_data__0834_1:
		.4byte	AnimCmd_GetPalette, 0xDB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22183, 0x14, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22197, 0x14, 0x6, 0x3
		.4byte	AnimCmd_4
	anim_data__0834_2:
		.4byte	AnimCmd_GetPalette, 0xDB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x221AB, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x221BF, 0x19, 0xC, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x221D8, 0x19, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x221BF, 0x19, 0x4, 0x5
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0834_3:
		.4byte	AnimCmd_GetPalette, 0xDB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x221AB, 0x14, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x221F1, 0x19, 0x6, 0x7
		.4byte	AnimCmd_4
	anim_data__0834_4:
		.4byte	AnimCmd_GetPalette, 0xDB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2220A, 0xF, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x22219, 0x14, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2222D, 0x14, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x22241, 0x14, 0x2, 0xB
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0834:
		.4byte anim_data__0834_0
		.4byte anim_data__0834_1
		.4byte anim_data__0834_2
		.4byte anim_data__0834_3
		.4byte anim_data__0834_4




.align 2, 0
	anim_data__0835_0:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22255, 0xF, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22264, 0xF, 0x4, 0x1
		.4byte	AnimCmd_4
	anim_data__0835_1:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22273, 0x14, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22287, 0x14, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2229B, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x222AF, 0x14, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x222C3, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x222D7, 0x14, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x222EB, 0x14, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x222FF, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x22313, 0x14, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x22327, 0x14, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x22264, 0xF, 0x4, 0x1
		.4byte	AnimCmd_4
	anim_data__0835_2:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22255, 0xF, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0835_3:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2233B, 0xF, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2234A, 0xF, 0x28, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x22359, 0x14, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2236D, 0x14, 0x6, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x22381, 0x18, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22399, 0x18, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x223B1, 0x18, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x223C9, 0x18, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x223E1, 0x14, 0x2, 0x14
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0835_4:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x223B1, 0x18, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x223C9, 0x18, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x223E1, 0x14, 0x2, 0x14
		.4byte	AnimCmd_4
	anim_data__0835_5:
		.4byte	AnimCmd_GetPalette, 0xDC, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x223B1, 0x18, 0x2, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x223C9, 0x18, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x223E1, 0x14, 0x2, 0x14
		.4byte	AnimCmd_GetPalette, 0xDD, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x223F5, 0x18, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x2240D, 0x18, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x22425, 0x14, 0x2, 0x17
		.4byte	AnimCmd_JumpBack, 0x24

.align 2, 0
	anim_0835:
		.4byte anim_data__0835_0
		.4byte anim_data__0835_1
		.4byte anim_data__0835_2
		.4byte anim_data__0835_3
		.4byte anim_data__0835_4
		.4byte anim_data__0835_5




.align 2, 0
	anim_data__0836_0:
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x20
	anim_data__0836_1:
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22499, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224B1, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224C9, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224E1, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224C9, 0x18, 0x2, 0x6
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224E1, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22499, 0x18, 0x2, 0x4
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224B1, 0x18, 0x2, 0x5
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x224F9, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22511, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22529, 0x1E, 0x2, 0xA
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22547, 0x1E, 0x2, 0xB
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22565, 0x18, 0x2, 0xC
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2257D, 0x18, 0x2, 0xD
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22595, 0x1E, 0x2, 0xE
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225B3, 0x1E, 0x2, 0xF
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225D1, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225EF, 0x1E, 0x2, 0x11
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2260D, 0x1E, 0x2, 0x12
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2262B, 0x1E, 0x2, 0x13
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225D1, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225EF, 0x1E, 0x2, 0x11
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2260D, 0x1E, 0x2, 0x12
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2262B, 0x1E, 0x2, 0x13
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225D1, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225EF, 0x1E, 0x2, 0x11
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2260D, 0x1E, 0x2, 0x12
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2262B, 0x1E, 0x2, 0x13
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225D1, 0x1E, 0x2, 0x10
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x225EF, 0x1E, 0x2, 0x11
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2260D, 0x1E, 0x2, 0x12
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2262B, 0x1E, 0x2, 0x13
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22649, 0x18, 0x2, 0x14
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22661, 0x18, 0x2, 0x15
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22439, 0x18, 0x2, 0x0
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22451, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22469, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22481, 0x18, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x1B0
	anim_data__0836_2:
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22679, 0x18, 0x2, 0x16
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22691, 0x18, 0x2, 0x17
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x226A9, 0x18, 0x2, 0x18
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x226C1, 0x18, 0x2, 0x19
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22679, 0x18, 0x2, 0x16
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22691, 0x18, 0x2, 0x17
		.4byte	AnimCmd_GetPalette, 0xDE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x226D9, 0x18, 0x2, 0x1A
		.4byte	AnimCmd_GetPalette, 0xDF, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x226F1, 0x18, 0x2, 0x1B
		.4byte	AnimCmd_4
	anim_data__0836_3:
		.4byte	AnimCmd_GetPalette, 0xE0, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x22709, 0x30, 0x2, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x22739, 0x30, 0x2, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x22769, 0x30, 0x2, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x22799, 0x30, 0x2, 0x1F
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0836:
		.4byte anim_data__0836_0
		.4byte anim_data__0836_1
		.4byte anim_data__0836_2
		.4byte anim_data__0836_3




.align 2, 0
	anim_data__0837_0:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x227C9, 0x4, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x227CD, 0x4, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x227D1, 0x4, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x227D5, 0x4, 0x4, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_1:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x227D9, 0x4, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x227DD, 0x4, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x227E1, 0x4, 0x4, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x227E5, 0x4, 0x4, 0x7
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_2:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x227E9, 0x4, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x227ED, 0x4, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x227F1, 0x4, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x227F5, 0x4, 0x4, 0xB
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_3:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x227F9, 0x4, 0x4, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x227FD, 0x4, 0x4, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x22801, 0x4, 0x4, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x22805, 0x4, 0x4, 0xF
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_4:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x22809, 0x4, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2280D, 0x4, 0x4, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x22811, 0x4, 0x4, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x22815, 0x4, 0x4, 0x13
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_5:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x22819, 0x4, 0x4, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x2281D, 0x4, 0x4, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x22821, 0x4, 0x4, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x22825, 0x4, 0x4, 0x17
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0837_6:
		.4byte	AnimCmd_GetPalette, 0xB1, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x22829, 0x4, 0x4, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x2282D, 0x4, 0x4, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x22831, 0x4, 0x4, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x22835, 0x4, 0x4, 0x1B
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0837:
		.4byte anim_data__0837_0
		.4byte anim_data__0837_1
		.4byte anim_data__0837_2
		.4byte anim_data__0837_3
		.4byte anim_data__0837_4
		.4byte anim_data__0837_5
		.4byte anim_data__0837_6




.align 2, 0
	anim_data__0838_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x22839, 0x4, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2283D, 0x4, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22841, 0x4, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22845, 0x4, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22849, 0x4, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2284D, 0x4, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22851, 0x4, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22839, 0x4, 0x2, 0x0
		.4byte	AnimCmd_4
	anim_data__0838_1:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x22855, 0x1, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x22839, 0x4, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22856, 0x4, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2285A, 0x4, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2285E, 0x4, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x22862, 0x4, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x22839, 0x4, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22855, 0x1, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0838:
		.4byte anim_data__0838_0
		.4byte anim_data__0838_1




.align 2, 0
	anim_data__0839_0:
		.4byte	AnimCmd_GetPalette, 0x2B, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x22866, 0xF, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22875, 0x10, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22885, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22895, 0x10, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0839_1:
		.4byte	AnimCmd_GetPalette, 0x2B, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x228A5, 0x12, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x228B7, 0xF, 0x3, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0839:
		.4byte anim_data__0839_0
		.4byte anim_data__0839_1




.align 2, 0
	anim_data__0840_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x228C6, 0x10, 0x8, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x228D6, 0x10, 0x8, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x228E6, 0x14, 0x8, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x228FA, 0x14, 0x8, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2290E, 0x10, 0x8, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2291E, 0x10, 0x8, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2292E, 0x14, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22942, 0x14, 0x8, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0840_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22956, 0x14, 0x8, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2296A, 0x10, 0x8, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2297A, 0x10, 0x8, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2298A, 0x14, 0x8, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2299E, 0x10, 0x8, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x229AE, 0x10, 0x8, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x229BE, 0x10, 0x8, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x229CE, 0x14, 0x8, 0xF
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0840_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x229E2, 0x14, 0x8, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x229F6, 0x14, 0x8, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x22A0A, 0x19, 0x8, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x22A23, 0x14, 0x8, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x22A37, 0x14, 0x8, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x22A4B, 0x10, 0x8, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x22A5B, 0x14, 0x8, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x22A6F, 0x19, 0x8, 0x17
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0840:
		.4byte anim_data__0840_0
		.4byte anim_data__0840_1
		.4byte anim_data__0840_2




.align 2, 0
	anim_data__0841_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22A88, 0x10, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22A98, 0x10, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22AA8, 0x10, 0x4, 0x2
		.4byte	AnimCmd_4
	anim_data__0841_1:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22AB8, 0x10, 0x6, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22AC8, 0x10, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22AD8, 0x10, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22AE8, 0x10, 0x8, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22AF8, 0x10, 0x4, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x22B08, 0x10, 0x4, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x22B18, 0x10, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x22B28, 0x10, 0x4, 0xA
		.4byte	AnimCmd_JumpBack, 0x14
	anim_data__0841_2:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22AD8, 0x10, 0x4, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22B38, 0x10, 0x6, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x22B48, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x22B5C, 0x10, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x22B6C, 0x10, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x22B7C, 0xC, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x22B88, 0xC, 0x4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22B7C, 0xC, 0x4, 0xF
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0841_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22B94, 0xC, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x22BA0, 0xC, 0x6, 0x12
		.4byte	AnimCmd_4
	anim_data__0841_4:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22BAC, 0xC, 0x3, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x22BB8, 0xC, 0x3, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x22BC4, 0x10, 0x3, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x22BD4, 0x10, 0x2, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x22BE4, 0x10, 0x2, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x22BF4, 0x10, 0x2, 0x18
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0841:
		.4byte anim_data__0841_0
		.4byte anim_data__0841_1
		.4byte anim_data__0841_2
		.4byte anim_data__0841_3
		.4byte anim_data__0841_4




.align 2, 0
	anim_data__0842_0:
		.4byte	AnimCmd_GetPalette, 0xE1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22C04, 0x14, 0x4, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22C18, 0x19, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22C31, 0x19, 0x4, 0x2
		.4byte	AnimCmd_4
	anim_data__0842_1:
		.4byte	AnimCmd_GetPalette, 0xE1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22C4A, 0x19, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22C63, 0x14, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22C77, 0x14, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22C8B, 0x14, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22C9F, 0x14, 0x6, 0x7
		.4byte	AnimCmd_4
	anim_data__0842_2:
		.4byte	AnimCmd_GetPalette, 0xE1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22CB3, 0x14, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x22CC7, 0x14, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x22CDB, 0x19, 0xC, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x22CF4, 0x19, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x22CDB, 0x19, 0x4, 0xA
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0842_3:
		.4byte	AnimCmd_GetPalette, 0xE1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22D0D, 0x14, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x22D21, 0x10, 0x6, 0xD
		.4byte	AnimCmd_4
	anim_data__0842_4:
		.4byte	AnimCmd_GetPalette, 0xE1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22D31, 0x14, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x22D45, 0x14, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x22D59, 0x14, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x22D6D, 0x14, 0x2, 0x11
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0842:
		.4byte anim_data__0842_0
		.4byte anim_data__0842_1
		.4byte anim_data__0842_2
		.4byte anim_data__0842_3
		.4byte anim_data__0842_4




.align 2, 0
	anim_data__0843_0:
		.4byte	AnimCmd_GetPalette, 0xE2, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x22D81, 0x9, 0x9, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22D8A, 0x9, 0x9, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22D93, 0x9, 0x9, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22D9C, 0x9, 0x9, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22DA5, 0x9, 0x9, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22DAE, 0x9, 0x9, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22D93, 0x9, 0x9, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22D8A, 0x9, 0x9, 0x1
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0843_1:
		.4byte	AnimCmd_GetPalette, 0xE2, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x22DB7, 0x9, 0x9, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22DC0, 0x9, 0x9, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x22DC9, 0x9, 0x9, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x22DD2, 0x9, 0x9, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x22DDB, 0x9, 0x9, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x22DE4, 0x9, 0x9, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x22DC9, 0x9, 0x9, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x22DC0, 0x9, 0x9, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B
	anim_data__0843_2:
		.4byte	AnimCmd_GetPalette, 0xE2, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x22DED, 0x9, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x22DF6, 0x9, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x22DFF, 0x9, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x22E08, 0x9, 0x2, 0xF
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0843:
		.4byte anim_data__0843_0
		.4byte anim_data__0843_1
		.4byte anim_data__0843_2




.align 2, 0
	anim_data__0844_0:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x22E11, 0x1E, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22E2F, 0x23, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22E52, 0x23, 0x3, 0x2
		.4byte	AnimCmd_JumpBack, 0x12
	anim_data__0844_1:
		.4byte	AnimCmd_GetPalette, 0xBF, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x22E75, 0x14, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0844:
		.4byte anim_data__0844_0
		.4byte anim_data__0844_1




.align 2, 0
	anim_data__0845_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010, 0xC
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetTileIndex, 0x22E89, 0xC, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22E95, 0xF, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22EA4, 0xC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22EB0, 0x9, 0x2, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0845:
		.4byte anim_data__0845_0




.align 2, 0
	anim_data__0846_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x22EB9, 0x8, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22EC1, 0xC, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22ECD, 0xC, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22ED9, 0xC, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22EE5, 0xC, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22EF1, 0xC, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22EFD, 0xC, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22F09, 0x8, 0x2, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0846:
		.4byte anim_data__0846_0




.align 2, 0
	anim_data__0847_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x22F11, 0x14, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22F25, 0x14, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22F39, 0x10, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22F49, 0x14, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0847:
		.4byte anim_data__0847_0




.align 2, 0
	anim_data__0848_0:
		.4byte	AnimCmd_GetTileIndex, 0x22F5D, 0x20
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010, 0x2, 0x0, 0x2, 0x1, 0x2, 0x2
		.4byte	AnimCmd_6, 0x0, 0x27412741, 0x2, 0x3, 0x2, 0x4, 0x2, 0x5, 0x2, 0x6, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0848:
		.4byte anim_data__0848_0




.align 2, 0
	anim_data__0849_0:
		.4byte	AnimCmd_GetPalette, 0xE3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x22F7D, 0xC, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x22F89, 0xC, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x22F95, 0xC, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x22FA1, 0xC, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x22FAD, 0x14, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x22FC1, 0xF, 0x2, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x22FD0, 0xF, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x22FDF, 0x6, 0x2, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0849:
		.4byte anim_data__0849_0




.align 2, 0
	anim_data__0850_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x22FE5, 0x24, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23009, 0x24, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2302D, 0x24, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23051, 0x24, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23075, 0x24, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23099, 0x24, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_0850:
		.4byte anim_data__0850_0




.align 2, 0
	anim_data__0851_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x230BD, 0x24, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x230E1, 0x24, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x230BD, 0x24, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x230E1, 0x24, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23105, 0x24, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23129, 0x24, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23105, 0x24, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23129, 0x24, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2314D, 0x24, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23171, 0x24, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2314D, 0x24, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23171, 0x24, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23195, 0x24, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x231B9, 0x24, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x23195, 0x24, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x231B9, 0x24, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x53

.align 2, 0
	anim_0851:
		.4byte anim_data__0851_0




.align 2, 0
	anim_data__0852_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x231DD, 0x24, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23201, 0x24, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23225, 0x24, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23249, 0x24, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2326D, 0x24, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23291, 0x24, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0x21
	anim_data__0852_1:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x232B5, 0x6, 0x2, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x232BB, 0x6, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x232C1, 0x9, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x232CA, 0x9, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x232D3, 0x9, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x232DC, 0x9, 0x2, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x232E5, 0x1, 0x2, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x232E6, 0x1, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x232E7, 0x4, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x232EB, 0x4, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x232EF, 0x4, 0x2, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x232F3, 0x4, 0x2, 0x11
		.4byte	AnimCmd_4

.align 2, 0
	anim_0852:
		.4byte anim_data__0852_0
		.4byte anim_data__0852_1




.align 2, 0
	anim_data__0853_0:
		.4byte	AnimCmd_GetTileIndex, 0x232F7, 0x4
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010, 0xC, 0x0, 0xC, 0x1, 0xC, 0x2, 0xC, 0x3
		.4byte	AnimCmd_JumpBack, 0xB

.align 2, 0
	anim_0853:
		.4byte anim_data__0853_0




.align 2, 0
	anim_data__0854_0:
		.4byte	AnimCmd_GetTileIndex, 0x232FB, 0x10
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010, 0xC, 0x0, 0xC, 0x1, 0xC, 0x2, 0xC, 0x3
		.4byte	AnimCmd_JumpBack, 0xB

.align 2, 0
	anim_0854:
		.4byte anim_data__0854_0




.align 2, 0
	anim_data__0855_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x2330B, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2330D, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23315, 0xA, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2331F, 0xA, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23329, 0x4, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0855:
		.4byte anim_data__0855_0




.align 2, 0
	anim_data__0856_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x2332D, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2332F, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23337, 0x8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2333F, 0x5, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23344, 0x5, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0856:
		.4byte anim_data__0856_0




.align 2, 0
	anim_data__0857_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x23349, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2334B, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23353, 0x8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2335B, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2335F, 0x4, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0857:
		.4byte anim_data__0857_0




.align 2, 0
	anim_data__0858_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x23363, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23367, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2336B, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2336F, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23373, 0x2, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0858:
		.4byte anim_data__0858_0




.align 2, 0
	anim_data__0859_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x23375, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23377, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2337B, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2337F, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23383, 0x2, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0859:
		.4byte anim_data__0859_0




.align 2, 0
	anim_data__0860_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x23385, 0x2, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23387, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2338B, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2338F, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23393, 0x2, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0860:
		.4byte anim_data__0860_0




.align 2, 0
	anim_data__0861_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x23395, 0x6, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2339B, 0xC, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x233A7, 0xC, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x233B3, 0x8, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x233BB, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x233BF, 0x6, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x233C5, 0x6, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x233CB, 0x4, 0x3, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0861:
		.4byte anim_data__0861_0




.align 2, 0
	anim_data__0862_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x233CF, 0x9, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x233D8, 0x10, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x233E8, 0x10, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x233F8, 0x10, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23408, 0x10, 0x3, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0862:
		.4byte anim_data__0862_0




.align 2, 0
	anim_data__0863_0:
		.4byte	AnimCmd_GetPalette, 0xE4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23418, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2341C, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23420, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23424, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23428, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2342C, 0x4, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23430, 0x4, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x23434, 0x4, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0863:
		.4byte anim_data__0863_0




.align 2, 0
	anim_data__0864_0:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23438, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2343C, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23440, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23444, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23448, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2344C, 0x4, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23450, 0x4, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x23454, 0x4, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0864:
		.4byte anim_data__0864_0




.align 2, 0
	anim_data__0865_0:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23458, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2345C, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23460, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23464, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23468, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2346C, 0x4, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23470, 0x4, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x23474, 0x4, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0865:
		.4byte anim_data__0865_0




.align 2, 0
	anim_data__0866_0:
		.4byte	AnimCmd_GetPalette, 0xBE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23478, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2347C, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23480, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23484, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23488, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2348C, 0x4, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23490, 0x4, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x23494, 0x4, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0866:
		.4byte anim_data__0866_0




.align 2, 0
	anim_data__0867_0:
		.4byte	AnimCmd_GetPalette, 0x9F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23498, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2349C, 0x4, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x234A0, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x234A4, 0x4, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x234A8, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x234AC, 0x4, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x234B0, 0x4, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x234B4, 0x4, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0x2B

.align 2, 0
	anim_0867:
		.4byte anim_data__0867_0




.align 2, 0
	anim_data__0868_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x234B8, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0868_1:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x234E6, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0868_2:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x234FA, 0x14, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0868_3:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2350E, 0x10, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0868_4:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2351E, 0x1C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0868_5:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2353A, 0x14, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0868_6:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2354E, 0x14, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0868_7:
		.4byte	AnimCmd_GetPalette, 0xE6, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x23562, 0x28, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0868:
		.4byte anim_data__0868_0
		.4byte anim_data__0868_1
		.4byte anim_data__0868_2
		.4byte anim_data__0868_3
		.4byte anim_data__0868_4
		.4byte anim_data__0868_5
		.4byte anim_data__0868_6
		.4byte anim_data__0868_7




.align 2, 0
	anim_data__0869_0:
		.4byte	AnimCmd_GetPalette, 0xE7, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2358A, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0869_1:
		.4byte	AnimCmd_GetPalette, 0xE6, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x2359E, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0869_2:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__0869_3:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__0869_4:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x235B2, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0869_5:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0869:
		.4byte anim_data__0869_0
		.4byte anim_data__0869_1
		.4byte anim_data__0869_2
		.4byte anim_data__0869_3
		.4byte anim_data__0869_4
		.4byte anim_data__0869_5




.align 2, 0
	anim_data__0870_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235BA, 0x4, 0x3C, 0x0
		.4byte	AnimCmd_4
	anim_data__0870_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235BE, 0x4, 0x3C, 0x1
		.4byte	AnimCmd_4
	anim_data__0870_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235C2, 0x4, 0x3C, 0x2
		.4byte	AnimCmd_4
	anim_data__0870_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235C6, 0x4, 0x3C, 0x3
		.4byte	AnimCmd_4
	anim_data__0870_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235CA, 0x4, 0x3C, 0x4
		.4byte	AnimCmd_4
	anim_data__0870_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x235CE, 0x4, 0x3C, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0870:
		.4byte anim_data__0870_0
		.4byte anim_data__0870_1
		.4byte anim_data__0870_2
		.4byte anim_data__0870_3
		.4byte anim_data__0870_4
		.4byte anim_data__0870_5




.align 2, 0
	anim_data__0871_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x235D8, 0x18, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x235F0, 0x18, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23608, 0x18, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23620, 0x24, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23644, 0x18, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2365C, 0x18, 0x10, 0x6
		.4byte	AnimCmd_4
	anim_data__0871_1:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23674, 0x18, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2368C, 0x18, 0x2, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x236A4, 0x18, 0x2, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x236BC, 0x24, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x236E0, 0x18, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x236F8, 0x18, 0x10, 0xC
		.4byte	AnimCmd_4
	anim_data__0871_2:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23710, 0x18, 0x2, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x23728, 0x18, 0x2, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x23740, 0x18, 0x2, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x23758, 0x24, 0x3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2377C, 0x18, 0x3, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x23794, 0x18, 0x10, 0x12
		.4byte	AnimCmd_4
	anim_data__0871_3:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x237AC, 0x18, 0x2, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x237C4, 0x18, 0x2, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x237DC, 0x18, 0x2, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x237F4, 0x24, 0x3, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x23818, 0x18, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x23830, 0x18, 0x10, 0x18
		.4byte	AnimCmd_4
	anim_data__0871_4:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23848, 0x18, 0x2, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x23860, 0x18, 0x2, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x23878, 0x18, 0x2, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x23890, 0x24, 0x3, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x238B4, 0x18, 0x3, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x238CC, 0x18, 0x10, 0x1E
		.4byte	AnimCmd_4
	anim_data__0871_5:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x235D2, 0x6, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x238E4, 0x18, 0x2, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x238FC, 0x18, 0x2, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x23914, 0x18, 0x2, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x2392C, 0x24, 0x3, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x23818, 0x18, 0x3, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x23950, 0x18, 0x10, 0x23
		.4byte	AnimCmd_4

.align 2, 0
	anim_0871:
		.4byte anim_data__0871_0
		.4byte anim_data__0871_1
		.4byte anim_data__0871_2
		.4byte anim_data__0871_3
		.4byte anim_data__0871_4
		.4byte anim_data__0871_5




.align 2, 0
	anim_data__0872_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x23968, 0xA, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23972, 0xA, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2397C, 0xA, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23986, 0xA, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23990, 0xF, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2399F, 0xF, 0x2, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0872:
		.4byte anim_data__0872_0




.align 2, 0
	anim_data__0873_0:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x239AE, 0x1, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x239AF, 0x1, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0873_1:
		.4byte	AnimCmd_GetPalette, 0x17, 0x400010
		.4byte	AnimCmd_GetTileIndex, 0x239AE, 0x1, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x239AF, 0x1, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x239AE, 0x1, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x239AF, 0x1, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x239AE, 0x1, 0x2, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x239AF, 0x1, 0x2, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x239B0, 0x1, 0x2, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x239B1, 0x1, 0x2, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x239B2, 0x1, 0x2, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x239B3, 0x1, 0x2, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0873:
		.4byte anim_data__0873_0
		.4byte anim_data__0873_1




.align 2, 0
	anim_data__0874_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x239B4, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0874_1:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x239DA, 0x1E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0874_2:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x239F8, 0x20, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0874_3:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23A18, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0874_4:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23A2E, 0x2C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0874_5:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23A5A, 0x22, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0874_6:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23A7C, 0x20, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0874:
		.4byte anim_data__0874_0
		.4byte anim_data__0874_1
		.4byte anim_data__0874_2
		.4byte anim_data__0874_3
		.4byte anim_data__0874_4
		.4byte anim_data__0874_5
		.4byte anim_data__0874_6




.align 2, 0
	anim_data__0875_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23A9C, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0875_1:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23AC2, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0875_2:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23ADC, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0875_3:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23AF8, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0875_4:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23B0E, 0x2E, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0875_5:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23B3C, 0x1E, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0875_6:
		.4byte	AnimCmd_GetPalette, 0xE5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23B5A, 0x22, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0875:
		.4byte anim_data__0875_0
		.4byte anim_data__0875_1
		.4byte anim_data__0875_2
		.4byte anim_data__0875_3
		.4byte anim_data__0875_4
		.4byte anim_data__0875_5
		.4byte anim_data__0875_6




.align 2, 0
	anim_data__0876_0:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23B7C, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0876_1:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23BAA, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0876_2:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23BC4, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0876_3:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23BE0, 0x14, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0876_4:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23BF4, 0x2C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0876_5:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23C20, 0x22, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0876_6:
		.4byte	AnimCmd_GetPalette, 0xE8, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23C42, 0x1A, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0876:
		.4byte anim_data__0876_0
		.4byte anim_data__0876_1
		.4byte anim_data__0876_2
		.4byte anim_data__0876_3
		.4byte anim_data__0876_4
		.4byte anim_data__0876_5
		.4byte anim_data__0876_6




.align 2, 0
	anim_data__0877_0:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23C5C, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0877_1:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23C7A, 0x1E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0877_2:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23C98, 0x26, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0877_3:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23CBE, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0877_4:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23CD4, 0x26, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0877_5:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23CFA, 0x16, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0877_6:
		.4byte	AnimCmd_GetPalette, 0xE9, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23D10, 0x1E, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0877:
		.4byte anim_data__0877_0
		.4byte anim_data__0877_1
		.4byte anim_data__0877_2
		.4byte anim_data__0877_3
		.4byte anim_data__0877_4
		.4byte anim_data__0877_5
		.4byte anim_data__0877_6




.align 2, 0
	anim_data__0878_0:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23D2E, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0878_1:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23D4C, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0878_2:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23D66, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0878_3:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23D8E, 0x12, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0878_4:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23DA0, 0x26, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0878_5:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23DC6, 0x26, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0878_6:
		.4byte	AnimCmd_GetPalette, 0xEA, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x23DEC, 0x26, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_0878:
		.4byte anim_data__0878_0
		.4byte anim_data__0878_1
		.4byte anim_data__0878_2
		.4byte anim_data__0878_3
		.4byte anim_data__0878_4
		.4byte anim_data__0878_5
		.4byte anim_data__0878_6




.align 2, 0
	anim_data__0879_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E12, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0879:
		.4byte anim_data__0879_0




.align 2, 0
	anim_data__0880_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E16, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0880:
		.4byte anim_data__0880_0




.align 2, 0
	anim_data__0881_0:
		.4byte	AnimCmd_GetPalette, 0x2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x23E1A, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23E22, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x23E2A, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23E32, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x23E3A, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23E42, 0x8
		.4byte	AnimCmd_6, 0x0, 0xEE01EE01, 0x5, 0x5
		.4byte	AnimCmd_JumpBack, 0x33

.align 2, 0
	anim_0881:
		.4byte anim_data__0881_0




.align 2, 0
	anim_data__0882_0:
		.4byte	AnimCmd_GetTileIndex, 0x23E4A, 0x10
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010, 0x6, 0x0, 0x6, 0x1, 0x6, 0x2, 0x6, 0x3
		.4byte	AnimCmd_JumpBack, 0xB
	anim_data__0882_1:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E5A, 0x4, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23E5E, 0x4, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x23E62, 0x4, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x23E66, 0x4, 0x6, 0x7
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_2:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E6A, 0x1, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x23E6B, 0x1, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x23E6C, 0x1, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x23E6D, 0x1, 0x6, 0xB
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_3:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E6E, 0x1, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x23E6F, 0x1, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x23E70, 0x1, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x23E71, 0x1, 0x6, 0xF
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_4:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23E72, 0x1, 0x6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x23E73, 0x1, 0x6, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x23E74, 0x1, 0x6, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x23E75, 0x1, 0x6, 0x13
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_5:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23E76, 0x4, 0x6, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x23E7A, 0x4, 0x6, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x23E7E, 0x4, 0x6, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x23E82, 0x4, 0x6, 0x17
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_6:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23E86, 0x4, 0x6, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x23E8A, 0x4, 0x6, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x23E8E, 0x4, 0x6, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x23E92, 0x4, 0x6, 0x1B
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_7:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23E96, 0x1, 0x6, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x23E97, 0x1, 0x6, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x23E98, 0x1, 0x6, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x23E99, 0x1, 0x6, 0x1F
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_8:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23E9A, 0x1, 0x6, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x23E9B, 0x1, 0x6, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x23E9C, 0x1, 0x6, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x23E9D, 0x1, 0x6, 0x23
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_9:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23E9E, 0x1, 0x6, 0x24
		.4byte	AnimCmd_GetTileIndex, 0x23E9F, 0x1, 0x6, 0x25
		.4byte	AnimCmd_GetTileIndex, 0x23EA0, 0x1, 0x6, 0x26
		.4byte	AnimCmd_GetTileIndex, 0x23EA1, 0x1, 0x6, 0x27
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_10:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23EA2, 0x1, 0x6, 0x28
		.4byte	AnimCmd_GetTileIndex, 0x23EA3, 0x1, 0x6, 0x29
		.4byte	AnimCmd_GetTileIndex, 0x23EA4, 0x1, 0x6, 0x2A
		.4byte	AnimCmd_GetTileIndex, 0x23EA5, 0x1, 0x6, 0x2B
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_11:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23EA6, 0x1, 0x6, 0x2C
		.4byte	AnimCmd_GetTileIndex, 0x23EA7, 0x1, 0x6, 0x2D
		.4byte	AnimCmd_GetTileIndex, 0x23EA8, 0x1, 0x6, 0x2E
		.4byte	AnimCmd_GetTileIndex, 0x23EA9, 0x1, 0x6, 0x2F
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_12:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23EAA, 0x1, 0x6, 0x30
		.4byte	AnimCmd_GetTileIndex, 0x23EAB, 0x1, 0x6, 0x31
		.4byte	AnimCmd_GetTileIndex, 0x23EAC, 0x1, 0x6, 0x32
		.4byte	AnimCmd_GetTileIndex, 0x23EAD, 0x1, 0x6, 0x33
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_13:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23EAE, 0x1, 0x6, 0x34
		.4byte	AnimCmd_GetTileIndex, 0x23EAF, 0x1, 0x6, 0x35
		.4byte	AnimCmd_GetTileIndex, 0x23EB0, 0x1, 0x6, 0x36
		.4byte	AnimCmd_GetTileIndex, 0x23EB1, 0x1, 0x6, 0x37
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_14:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x23EB2, 0x1, 0x6, 0x38
		.4byte	AnimCmd_GetTileIndex, 0x23EB3, 0x1, 0x6, 0x39
		.4byte	AnimCmd_GetTileIndex, 0x23EB4, 0x1, 0x6, 0x3A
		.4byte	AnimCmd_GetTileIndex, 0x23EB5, 0x1, 0x6, 0x3B
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0882_15:
		.4byte	AnimCmd_GetPalette, 0xEB, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x23EB6, 0x1, 0x6, 0x3C
		.4byte	AnimCmd_GetTileIndex, 0x23EB7, 0x1, 0x6, 0x3D
		.4byte	AnimCmd_GetTileIndex, 0x23EB8, 0x1, 0x6, 0x3E
		.4byte	AnimCmd_GetTileIndex, 0x23EB9, 0x1, 0x6, 0x3F
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0882:
		.4byte anim_data__0882_0
		.4byte anim_data__0882_1
		.4byte anim_data__0882_2
		.4byte anim_data__0882_3
		.4byte anim_data__0882_4
		.4byte anim_data__0882_5
		.4byte anim_data__0882_6
		.4byte anim_data__0882_7
		.4byte anim_data__0882_8
		.4byte anim_data__0882_9
		.4byte anim_data__0882_10
		.4byte anim_data__0882_11
		.4byte anim_data__0882_12
		.4byte anim_data__0882_13
		.4byte anim_data__0882_14
		.4byte anim_data__0882_15




.align 2, 0
	anim_data__0883_0:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x23EBA, 0x40, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x23EFA, 0x40, 0x3, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_1:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x23F3A, 0x40, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x23F7A, 0x40, 0x3, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_2:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x23FBA, 0x40, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x23FFA, 0x40, 0x3, 0x5
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_3:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2403A, 0x40, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2407A, 0x40, 0x3, 0x7
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_4:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x240BA, 0x40, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x240FA, 0x40, 0x3, 0x9
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_5:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2413A, 0x40, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2417A, 0x40, 0x3, 0xB
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_6:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x241BA, 0x40, 0x3, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x241FA, 0x40, 0x3, 0xD
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0883_7:
		.4byte	AnimCmd_GetPalette, 0xEC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2423A, 0x40, 0x3, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2427A, 0x40, 0x3, 0xF
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0883:
		.4byte anim_data__0883_0
		.4byte anim_data__0883_1
		.4byte anim_data__0883_2
		.4byte anim_data__0883_3
		.4byte anim_data__0883_4
		.4byte anim_data__0883_5
		.4byte anim_data__0883_6
		.4byte anim_data__0883_7




.align 2, 0
	anim_data__0884_0:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242BA, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0884_1:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242BC, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0884_2:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C0, 0x1, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0884_3:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C1, 0x1, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0884:
		.4byte anim_data__0884_0
		.4byte anim_data__0884_1
		.4byte anim_data__0884_2
		.4byte anim_data__0884_3




.align 2, 0
	anim_data__0885_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C2, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0885_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C4, 0x2, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0885_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C6, 0x2, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0885_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242C8, 0x2, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0885_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242CA, 0x2, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0885_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242CC, 0x2, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0885_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242CE, 0x2, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0885_7:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242D0, 0x2, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_0885:
		.4byte anim_data__0885_0
		.4byte anim_data__0885_1
		.4byte anim_data__0885_2
		.4byte anim_data__0885_3
		.4byte anim_data__0885_4
		.4byte anim_data__0885_5
		.4byte anim_data__0885_6
		.4byte anim_data__0885_7




.align 2, 0
	anim_data__0886_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242D2, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0886:
		.4byte anim_data__0886_0




.align 2, 0
	anim_data__0887_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x242E6, 0x1, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0887:
		.4byte anim_data__0887_0




.align 2, 0
	anim_data__0888_0:
		.4byte	AnimCmd_GetPalette, 0xED, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x242E7, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0888_1:
		.4byte	AnimCmd_GetPalette, 0xED, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x242EF, 0x8, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x242F7, 0x8, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x242FF, 0x8, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x24307, 0x8, 0x3, 0x4
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0888:
		.4byte anim_data__0888_0
		.4byte anim_data__0888_1




.align 2, 0
	anim_data__0889_0:
		.4byte	AnimCmd_GetPalette, 0x34, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0889:
		.4byte anim_data__0889_0




.align 2, 0
	anim_data__0890_0:
		.4byte	AnimCmd_GetPalette, 0xEE, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2430F, 0x4, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x24313, 0x4, 0x2, 0x1
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0890_1:
		.4byte	AnimCmd_GetPalette, 0xEE, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x24317, 0x4, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2431B, 0x4, 0x2, 0x3
		.4byte	AnimCmd_JumpBack, 0xD
	anim_data__0890_2:
		.4byte	AnimCmd_GetPalette, 0xEE, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2431F, 0x4, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x24323, 0x4, 0x2, 0x5
		.4byte	AnimCmd_JumpBack, 0xD

.align 2, 0
	anim_0890:
		.4byte anim_data__0890_0
		.4byte anim_data__0890_1
		.4byte anim_data__0890_2




.align 2, 0
	anim_data__0891_0:
		.4byte	AnimCmd_GetTileIndex, 0x24327, 0x4
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010, 0x4, 0x0
		.4byte	AnimCmd_4
	anim_data__0891_1:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2432B, 0x4, 0x4, 0x1
		.4byte	AnimCmd_4
	anim_data__0891_2:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2432F, 0x4, 0x4, 0x2
		.4byte	AnimCmd_4
	anim_data__0891_3:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x24333, 0x4, 0x4, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0891:
		.4byte anim_data__0891_0
		.4byte anim_data__0891_1
		.4byte anim_data__0891_2
		.4byte anim_data__0891_3




.align 2, 0
	anim_data__0892_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x24337, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0892:
		.4byte anim_data__0892_0




.align 2, 0
	anim_data__0893_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2435F, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0893_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2437F, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0893:
		.4byte anim_data__0893_0
		.4byte anim_data__0893_1




.align 2, 0
	anim_data__0894_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x243A7, 0x16, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0894_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x243BD, 0x16, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0894_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x243D3, 0x16, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0894:
		.4byte anim_data__0894_0
		.4byte anim_data__0894_1
		.4byte anim_data__0894_2




.align 2, 0
	anim_data__0895_0:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x243E9, 0x9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0895_1:
		.4byte	AnimCmd_GetPalette, 0xB2, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x243F2, 0x9, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0895_2:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x243FB, 0x9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0895_3:
		.4byte	AnimCmd_GetPalette, 0xB3, 0xD00010
		.4byte	AnimCmd_GetTileIndex, 0x24404, 0x9, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0895_4:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x2440D, 0x9, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0895_5:
		.4byte	AnimCmd_GetPalette, 0xB4, 0xE00010
		.4byte	AnimCmd_GetTileIndex, 0x24416, 0x9, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0895_6:
		.4byte	AnimCmd_GetPalette, 0xEF, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2441F, 0x9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0895_7:
		.4byte	AnimCmd_GetPalette, 0xEF, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x24428, 0x9, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0895_8:
		.4byte	AnimCmd_GetPalette, 0xEF, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x24431, 0x9, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2443A, 0x9, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x24443, 0x9, 0x2, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x24428, 0x9, 0x2, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2444C, 0x9, 0x2, 0xB
		.4byte	AnimCmd_4

.align 2, 0
	anim_0895:
		.4byte anim_data__0895_0
		.4byte anim_data__0895_1
		.4byte anim_data__0895_2
		.4byte anim_data__0895_3
		.4byte anim_data__0895_4
		.4byte anim_data__0895_5
		.4byte anim_data__0895_6
		.4byte anim_data__0895_7
		.4byte anim_data__0895_8




.align 2, 0
	anim_data__0896_0:
		.4byte	AnimCmd_GetPalette, 0xF0, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF1, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF0, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF1, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF2, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF3, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF2, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF1, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0896:
		.4byte anim_data__0896_0




.align 2, 0
	anim_data__0897_0:
		.4byte	AnimCmd_GetPalette, 0xF4, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF5, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF6, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF7, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF8, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xF9, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFA, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFB, 0xD00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0897:
		.4byte anim_data__0897_0




.align 2, 0
	anim_data__0898_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0x200010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0x200010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0898:
		.4byte anim_data__0898_0




.align 2, 0
	anim_data__0899_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0x700010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0x700010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0899:
		.4byte anim_data__0899_0




.align 2, 0
	anim_data__0900_0:
		.4byte	AnimCmd_GetPalette, 0xFE, 0x10, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFF, 0x10, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x100, 0x10, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0900_1:
		.4byte	AnimCmd_GetPalette, 0xFF, 0x100010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x100, 0x100010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFE, 0x100010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF
	anim_data__0900_2:
		.4byte	AnimCmd_GetPalette, 0x100, 0x200010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFE, 0x200010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFF, 0x200010, 0x14
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0900:
		.4byte anim_data__0900_0
		.4byte anim_data__0900_1
		.4byte anim_data__0900_2




.align 2, 0
	anim_data__0901_0:
		.4byte	AnimCmd_GetPalette, 0x101, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x102, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x103, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x104, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x105, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x106, 0x900010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0901:
		.4byte anim_data__0901_0




.align 2, 0
	anim_data__0902_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0x10, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0x10, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0902:
		.4byte anim_data__0902_0




.align 2, 0
	anim_data__0903_0:
		.4byte	AnimCmd_GetPalette, 0x107, 0x300010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x108, 0x300010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0903:
		.4byte anim_data__0903_0




.align 2, 0
	anim_data__0904_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0x600010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0x600010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0904:
		.4byte anim_data__0904_0




.align 2, 0
	anim_data__0905_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0x600010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0x600010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0905:
		.4byte anim_data__0905_0




.align 2, 0
	anim_data__0906_0:
		.4byte	AnimCmd_GetPalette, 0x109, 0x200010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x10A, 0x200010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x10B, 0x200010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x10C, 0x200010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x14
	anim_data__0906_1:
		.4byte	AnimCmd_GetPalette, 0x10D, 0x300010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x10E, 0x300010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x10F, 0x300010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x110, 0x300010, 0x8
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x14
	anim_data__0906_2:
		.4byte	AnimCmd_GetPalette, 0x111, 0xD00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x112, 0xD00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x113, 0xD00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x114, 0xD00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x14

.align 2, 0
	anim_0906:
		.4byte anim_data__0906_0
		.4byte anim_data__0906_1
		.4byte anim_data__0906_2




.align 2, 0
	anim_data__0907_0:
		.4byte	AnimCmd_GetPalette, 0x115, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x116, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x117, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x118, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x119, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x11A, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x11B, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x11C, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x11D, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0907:
		.4byte anim_data__0907_0




.align 2, 0
	anim_data__0908_0:
		.4byte	AnimCmd_GetPalette, 0x11E, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x11F, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x120, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x121, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x122, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x123, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x124, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x125, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x126, 0x900010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0908:
		.4byte anim_data__0908_0




.align 2, 0
	anim_data__0909_0:
		.4byte	AnimCmd_GetPalette, 0x127, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x128, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x129, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0909:
		.4byte anim_data__0909_0




.align 2, 0
	anim_data__0910_0:
		.4byte	AnimCmd_GetPalette, 0x12A, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12B, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12C, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12D, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12E, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12F, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x130, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12F, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12E, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12D, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12C, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x12B, 0x100010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0910:
		.4byte anim_data__0910_0




.align 2, 0
	anim_data__0911_0:
		.4byte	AnimCmd_GetPalette, 0x131, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x132, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x133, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x134, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x135, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x136, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x137, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x138, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x137, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x136, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x135, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x134, 0x400010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0911:
		.4byte anim_data__0911_0




.align 2, 0
	anim_data__0912_0:
		.4byte	AnimCmd_GetPalette, 0x139, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x13A, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x13B, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x13C, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x13D, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x13E, 0x500010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0912:
		.4byte anim_data__0912_0




.align 2, 0
	anim_data__0913_0:
		.4byte	AnimCmd_GetPalette, 0x13F, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x140, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x141, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x142, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x143, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x140, 0x600010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0913:
		.4byte anim_data__0913_0




.align 2, 0
	anim_data__0914_0:
		.4byte	AnimCmd_GetPalette, 0x144, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x145, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x146, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x147, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x146, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x145, 0x700010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0914:
		.4byte anim_data__0914_0




.align 2, 0
	anim_data__0915_0:
		.4byte	AnimCmd_GetPalette, 0x148, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x149, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14A, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14B, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14C, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14D, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14E, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x14F, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x150, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x151, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x152, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x153, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x154, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x155, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x156, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0915:
		.4byte anim_data__0915_0




.align 2, 0
	anim_data__0916_0:
		.4byte	AnimCmd_GetPalette, 0x157, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x158, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x159, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15A, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15B, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15C, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15D, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15E, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x15F, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x160, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x161, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x162, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x163, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x164, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x165, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0916:
		.4byte anim_data__0916_0




.align 2, 0
	anim_data__0917_0:
		.4byte	AnimCmd_GetPalette, 0x166, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x167, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x168, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x169, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16A, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16B, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16C, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16D, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16E, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x16F, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x170, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x171, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x172, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x173, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x174, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0917:
		.4byte anim_data__0917_0




.align 2, 0
	anim_data__0918_0:
		.4byte	AnimCmd_GetPalette, 0x175, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x176, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x177, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x178, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x179, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17A, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17B, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17C, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17D, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17E, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x17F, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x180, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x181, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x182, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x183, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0918:
		.4byte anim_data__0918_0




.align 2, 0
	anim_data__0919_0:
		.4byte	AnimCmd_GetPalette, 0x184, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x185, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x186, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x187, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x188, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x189, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18A, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18B, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18C, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18D, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18E, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x18F, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x190, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x191, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x192, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0919:
		.4byte anim_data__0919_0




.align 2, 0
	anim_data__0920_0:
		.4byte	AnimCmd_GetPalette, 0x193, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x194, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x195, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x196, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x197, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x198, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x199, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19A, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19B, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19C, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19D, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19E, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x19F, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A0, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A1, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0920:
		.4byte anim_data__0920_0




.align 2, 0
	anim_data__0921_0:
		.4byte	AnimCmd_GetPalette, 0x1A2, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A3, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A4, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A5, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A6, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A7, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A8, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1A9, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AA, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AB, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AC, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AD, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AE, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1AF, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B0, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0921:
		.4byte anim_data__0921_0




.align 2, 0
	anim_data__0922_0:
		.4byte	AnimCmd_GetPalette, 0x127, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x128, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x129, 0x200010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0922:
		.4byte anim_data__0922_0




.align 2, 0
	anim_data__0923_0:
		.4byte	AnimCmd_GetPalette, 0x1B1, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B2, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B3, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B4, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B5, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B6, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B7, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B8, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1B9, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BA, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BB, 0x100010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BC, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BD, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BE, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1BF, 0x100010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0923:
		.4byte anim_data__0923_0




.align 2, 0
	anim_data__0924_0:
		.4byte	AnimCmd_GetPalette, 0x1C0, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C1, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C2, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C3, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C4, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C5, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C6, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C7, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C8, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1C9, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1CA, 0x500010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1CB, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1CC, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1CD, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1CE, 0x500010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0924:
		.4byte anim_data__0924_0




.align 2, 0
	anim_data__0925_0:
		.4byte	AnimCmd_GetPalette, 0x1CF, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D0, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D1, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D2, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D3, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D4, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D5, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D6, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D7, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D8, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1D9, 0x600010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1DA, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1DB, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1DC, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1DD, 0x600010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0925:
		.4byte anim_data__0925_0




.align 2, 0
	anim_data__0926_0:
		.4byte	AnimCmd_GetPalette, 0x1DE, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1DF, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E0, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E1, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E2, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E3, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E4, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E5, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E6, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E7, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E8, 0x400010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1E9, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1EA, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1EB, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1EC, 0x400010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0926:
		.4byte anim_data__0926_0




.align 2, 0
	anim_data__0927_0:
		.4byte	AnimCmd_GetPalette, 0x1ED, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1EE, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1EF, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F0, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F1, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F2, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F3, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F4, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F5, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F6, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F7, 0x700010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F8, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1F9, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1FA, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1FB, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0927:
		.4byte anim_data__0927_0




.align 2, 0
	anim_data__0928_0:
		.4byte	AnimCmd_GetPalette, 0x1FC, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1FD, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1FE, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x1FF, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x200, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x201, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x202, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x203, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x204, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x205, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x206, 0x800010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x207, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x208, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x209, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x20A, 0x800010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0928:
		.4byte anim_data__0928_0




.align 2, 0
	anim_data__0929_0:
		.4byte	AnimCmd_GetPalette, 0x20B, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x20C, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x20D, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x20E, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x20F, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x210, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x211, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x212, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x213, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x214, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x215, 0x900010, 0x1E
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x216, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x217, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x218, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x219, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x4B

.align 2, 0
	anim_0929:
		.4byte anim_data__0929_0




.align 2, 0
	anim_data__0930_0:
		.4byte	AnimCmd_GetPalette, 0x21A, 0x10, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21B, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21C, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21D, 0x10, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21C, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21B, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0930:
		.4byte anim_data__0930_0




.align 2, 0
	anim_data__0931_0:
		.4byte	AnimCmd_GetPalette, 0x21E, 0x100010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21F, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x220, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x221, 0x100010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x220, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x21F, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0931:
		.4byte anim_data__0931_0




.align 2, 0
	anim_data__0932_0:
		.4byte	AnimCmd_GetPalette, 0x222, 0x200010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x223, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x224, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x225, 0x200010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x224, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x223, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0932:
		.4byte anim_data__0932_0




.align 2, 0
	anim_data__0933_0:
		.4byte	AnimCmd_GetPalette, 0x226, 0x300010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x227, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x228, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x229, 0x300010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x228, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x227, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0933:
		.4byte anim_data__0933_0




.align 2, 0
	anim_data__0934_0:
		.4byte	AnimCmd_GetPalette, 0x22A, 0x400010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22B, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22C, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22D, 0x400010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22C, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22B, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0934:
		.4byte anim_data__0934_0




.align 2, 0
	anim_data__0935_0:
		.4byte	AnimCmd_GetPalette, 0x22E, 0x10, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22F, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x230, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x231, 0x10, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x230, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x22F, 0x10, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0935:
		.4byte anim_data__0935_0




.align 2, 0
	anim_data__0936_0:
		.4byte	AnimCmd_GetPalette, 0x232, 0x100010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x233, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x234, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x235, 0x100010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x234, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x233, 0x100010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0936:
		.4byte anim_data__0936_0




.align 2, 0
	anim_data__0937_0:
		.4byte	AnimCmd_GetPalette, 0x236, 0x200010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x237, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x238, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x239, 0x200010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x238, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x237, 0x200010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0937:
		.4byte anim_data__0937_0




.align 2, 0
	anim_data__0938_0:
		.4byte	AnimCmd_GetPalette, 0x23A, 0x300010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23B, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23C, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23D, 0x300010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23C, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23B, 0x300010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0938:
		.4byte anim_data__0938_0




.align 2, 0
	anim_data__0939_0:
		.4byte	AnimCmd_GetPalette, 0x23E, 0x400010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23F, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x240, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x241, 0x400010, 0x64
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x240, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x23F, 0x400010, 0xF
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0939:
		.4byte anim_data__0939_0




.align 2, 0
	anim_data__0940_0:
		.4byte	AnimCmd_GetPalette, 0x242, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x243, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x242, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x243, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x242, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x243, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x242, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x243, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x244, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x245, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x244, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x245, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x244, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x245, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x244, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x245, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x246, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x247, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x246, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x247, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x246, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x247, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x246, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x247, 0x10, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x78
	anim_data__0940_1:
		.4byte	AnimCmd_GetPalette, 0x248, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x249, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x248, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x249, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x248, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x249, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x248, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x249, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24A, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24B, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24A, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24B, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24A, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24B, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24A, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24B, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24C, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24D, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24C, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24D, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24C, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24D, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24C, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24D, 0x100010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x78
	anim_data__0940_2:
		.4byte	AnimCmd_GetPalette, 0x24E, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x24F, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x250, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x251, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x252, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x253, 0x200010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0940_3:
		.4byte	AnimCmd_GetPalette, 0x254, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x255, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x256, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x257, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x258, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x259, 0x300010, 0x6
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0940_4:
		.4byte	AnimCmd_GetPalette, 0x25A, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25B, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25A, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25B, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25A, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25B, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25A, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25B, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25C, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25D, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25C, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25D, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25C, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25D, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25C, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25D, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25E, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25F, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25E, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25F, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25E, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25F, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25E, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x25F, 0x400010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x78
	anim_data__0940_5:
		.4byte	AnimCmd_GetPalette, 0x260, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x261, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x260, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x261, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x260, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x261, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x262, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x263, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x262, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x263, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x262, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x263, 0x500010, 0x4
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x3C
	anim_data__0940_6:
		.4byte	AnimCmd_GetPalette, 0x264, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x265, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x266, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x267, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x268, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x269, 0x600010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0940_7:
		.4byte	AnimCmd_GetPalette, 0x26A, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x26B, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x26C, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x26D, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x26E, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x26F, 0x700010, 0x3
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0940_8:
		.4byte	AnimCmd_GetPalette, 0x270, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x271, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x272, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x273, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x272, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x271, 0x800010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E
	anim_data__0940_9:
		.4byte	AnimCmd_GetPalette, 0x274, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x274, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x274, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x275, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x276, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x276, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x276, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x275, 0x900010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28
	anim_data__0940_10:
		.4byte	AnimCmd_GetPalette, 0x277, 0xC00010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x278, 0xC00010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA
	anim_data__0940_11:
		.4byte	AnimCmd_GetPalette, 0x279, 0xE00010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27A, 0xE00010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27B, 0xE00010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27C, 0xE00010, 0x5
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x14

.align 2, 0
	anim_0940:
		.4byte anim_data__0940_0
		.4byte anim_data__0940_1
		.4byte anim_data__0940_2
		.4byte anim_data__0940_3
		.4byte anim_data__0940_4
		.4byte anim_data__0940_5
		.4byte anim_data__0940_6
		.4byte anim_data__0940_7
		.4byte anim_data__0940_8
		.4byte anim_data__0940_9
		.4byte anim_data__0940_10
		.4byte anim_data__0940_11




.align 2, 0
	anim_data__0941_0:
		.4byte	AnimCmd_GetPalette, 0x27D, 0xF00010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27E, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27F, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x280, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x281, 0xF00010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x280, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27F, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x27E, 0xF00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0941:
		.4byte anim_data__0941_0




.align 2, 0
	anim_data__0942_0:
		.4byte	AnimCmd_GetPalette, 0x282, 0x900010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x283, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x284, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x285, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x286, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x287, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x288, 0x900010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x287, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x286, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x285, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x284, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x283, 0x900010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0942:
		.4byte anim_data__0942_0




.align 2, 0
	anim_data__0943_0:
		.4byte	AnimCmd_GetPalette, 0x289, 0xE00010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28A, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28B, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28C, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28D, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28E, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28F, 0xE00010, 0x28
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28E, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28D, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28C, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28B, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x28A, 0xE00010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x3C

.align 2, 0
	anim_0943:
		.4byte anim_data__0943_0




.align 2, 0
	anim_data__0944_0:
		.4byte	AnimCmd_GetPalette, 0x290, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x291, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x292, 0x700010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xF

.align 2, 0
	anim_0944:
		.4byte anim_data__0944_0




.align 2, 0
	anim_data__0945_0:
		.4byte	AnimCmd_GetPalette, 0x293, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x294, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x295, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x296, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x297, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x298, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x299, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x29A, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x29B, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x29C, 0x200010, 0x7
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x32

.align 2, 0
	anim_0945:
		.4byte anim_data__0945_0




.align 2, 0
	anim_data__0946_0:
		.4byte	AnimCmd_GetPalette, 0x29D, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x29E, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x29F, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A0, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A1, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A2, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A3, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A4, 0x800010, 0xA
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0946:
		.4byte anim_data__0946_0




.align 2, 0
	anim_data__0947_0:
		.4byte	AnimCmd_GetPalette, 0xFC, 0xB00010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0xFD, 0xB00010, 0x2
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0xA

.align 2, 0
	anim_0947:
		.4byte anim_data__0947_0




.align 2, 0
	anim_data__0948_0:
		.4byte	AnimCmd_GetPalette, 0x2A5, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A6, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A7, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A8, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2A9, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AA, 0xC00010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x1E

.align 2, 0
	anim_0948:
		.4byte anim_data__0948_0




.align 2, 0
	anim_data__0949_0:
		.4byte	AnimCmd_GetPalette, 0x2AB, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AC, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AD, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AE, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AF, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AE, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AD, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_GetPalette, 0x2AC, 0x300010, 0x9
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x28

.align 2, 0
	anim_0949:
		.4byte anim_data__0949_0




.align 2, 0
	anim_data__0950_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24455, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0950_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24467, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0950_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24479, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0950_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2448B, 0x33, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0950_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x244BE, 0xC
		.4byte	AnimCmd_6, 0x0, 0x68386737, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0950_5:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x244CA, 0xC, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0950_6:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x244D6, 0xC, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0950_7:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x244E2, 0x42, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0950_8:
		.4byte	AnimCmd_GetPalette, 0xA1, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x24524, 0x1, 0x6, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x24525, 0x2, 0x6, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x24527, 0x2, 0x6, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x24529, 0x2, 0x6, 0xB
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0950_9:
		.4byte	AnimCmd_GetPalette, 0xA1, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2452B, 0x1, 0x6, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2452C, 0x2, 0x6, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2452E, 0x2, 0x6, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x24530, 0x2, 0x6, 0xF
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0950_10:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x24532, 0xE, 0x1, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_0950:
		.4byte anim_data__0950_0
		.4byte anim_data__0950_1
		.4byte anim_data__0950_2
		.4byte anim_data__0950_3
		.4byte anim_data__0950_4
		.4byte anim_data__0950_5
		.4byte anim_data__0950_6
		.4byte anim_data__0950_7
		.4byte anim_data__0950_8
		.4byte anim_data__0950_9
		.4byte anim_data__0950_10




.align 2, 0
	anim_data__0951_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24540, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0951_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24550, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0951_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24560, 0x36, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0951_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24596, 0x27, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0951:
		.4byte anim_data__0951_0
		.4byte anim_data__0951_1
		.4byte anim_data__0951_2
		.4byte anim_data__0951_3




.align 2, 0
	anim_data__0952_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x245BD, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0952_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x245CD, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0952_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x245DD, 0x2A, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0952_3:
		.4byte	AnimCmd_GetPalette, 0x2B4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24607, 0x12, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0952:
		.4byte anim_data__0952_0
		.4byte anim_data__0952_1
		.4byte anim_data__0952_2
		.4byte anim_data__0952_3




.align 2, 0
	anim_data__0953_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24619, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0953_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24641, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0953_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24669, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0953_3:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24691, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0953_4:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x246B9, 0x28, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0953_5:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x246E1, 0x28, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0953_6:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24709, 0x2D, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0953_7:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24736, 0x10, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0953_8:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24746, 0x10, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__0953_9:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24756, 0x10, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__0953_10:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24766, 0x10, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__0953_11:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24776, 0x10, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__0953_12:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24786, 0x10, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__0953_13:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x24796, 0x1A, 0x1, 0xD
		.4byte	AnimCmd_4

.align 2, 0
	anim_0953:
		.4byte anim_data__0953_0
		.4byte anim_data__0953_1
		.4byte anim_data__0953_2
		.4byte anim_data__0953_3
		.4byte anim_data__0953_4
		.4byte anim_data__0953_5
		.4byte anim_data__0953_6
		.4byte anim_data__0953_7
		.4byte anim_data__0953_8
		.4byte anim_data__0953_9
		.4byte anim_data__0953_10
		.4byte anim_data__0953_11
		.4byte anim_data__0953_12
		.4byte anim_data__0953_13




.align 2, 0
	anim_data__0954_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x247B0, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0954_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x247C2, 0x30, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0954_2:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x247F2, 0x30, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0954_3:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24822, 0x3, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0954_4:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24825, 0x3, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0954_5:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24828, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0954_6:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24830, 0x2, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0954_7:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24832, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0954_8:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24836, 0xA, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0954:
		.4byte anim_data__0954_0
		.4byte anim_data__0954_1
		.4byte anim_data__0954_2
		.4byte anim_data__0954_3
		.4byte anim_data__0954_4
		.4byte anim_data__0954_5
		.4byte anim_data__0954_6
		.4byte anim_data__0954_7
		.4byte anim_data__0954_8




.align 2, 0
	anim_data__0955_0:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24840, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24844, 0x4, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_2:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24848, 0x4, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_3:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2484C, 0x4, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_4:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24850, 0x4, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_5:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24854, 0x4, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_6:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24858, 0x4, 0x1, 0x6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_7:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2485C, 0x4, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_8:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24860, 0x4, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_9:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24864, 0x4, 0x1, 0x9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_10:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24868, 0x1, 0x1, 0xA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_11:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24869, 0x4, 0x1, 0xB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_12:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2486D, 0x4, 0x1, 0xC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_13:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24871, 0x4, 0x1, 0xD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_14:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24875, 0x4, 0x1, 0xE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_15:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24879, 0x4, 0x1, 0xF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_16:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2487D, 0x4, 0x1, 0x10
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_17:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_18:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24881, 0x4, 0x1, 0x11
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_19:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_20:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24885, 0x4, 0x1, 0x12
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_21:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24889, 0x4, 0x1, 0x13
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_22:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2488D, 0x4, 0x1, 0x14
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_23:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24891, 0x4, 0x1, 0x15
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_24:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24895, 0x4, 0x1, 0x16
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_25:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24899, 0x4, 0x1, 0x17
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_26:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2489D, 0x4, 0x1, 0x18
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_27:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248A1, 0x4, 0x1, 0x19
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_28:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248A5, 0x4, 0x1, 0x1A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_29:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248A9, 0x4, 0x1, 0x1B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_30:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248AD, 0x4, 0x1, 0x1C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_31:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248B1, 0x4, 0x1, 0x1D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_32:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248B5, 0x4, 0x1, 0x1E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_33:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248B9, 0x4, 0x1, 0x1F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_34:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248BD, 0x4, 0x1, 0x20
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_35:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248C1, 0x4, 0x1, 0x21
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_36:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248C5, 0x4, 0x1, 0x22
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_37:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248C9, 0x4, 0x1, 0x23
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_38:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248CD, 0x4, 0x1, 0x24
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_39:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_40:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248D1, 0x4, 0x1, 0x25
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_41:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_42:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248D5, 0x4, 0x1, 0x26
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_43:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248D9, 0x2, 0x1, 0x27
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_44:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248DB, 0x4, 0x1, 0x28
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_45:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248DF, 0x4, 0x1, 0x29
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_46:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248E3, 0x4, 0x1, 0x2A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_47:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248E7, 0x4, 0x1, 0x2B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_48:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248EB, 0x4, 0x1, 0x2C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_49:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248EF, 0x4, 0x1, 0x2D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_50:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248F3, 0x4, 0x1, 0x2E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_51:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248F7, 0x4, 0x1, 0x2F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_52:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248FB, 0x4, 0x1, 0x30
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_53:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x248FF, 0x4, 0x1, 0x31
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_54:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24903, 0x4, 0x1, 0x32
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_55:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24907, 0x4, 0x1, 0x33
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_56:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2490B, 0x4, 0x1, 0x34
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_57:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2490F, 0x4, 0x1, 0x35
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_58:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24913, 0x4, 0x1, 0x36
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_59:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24917, 0x4, 0x1, 0x37
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_60:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2491B, 0x4, 0x1, 0x38
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_61:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_62:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2491F, 0x4, 0x1, 0x39
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_63:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_64:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24923, 0x4, 0x1, 0x3A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_65:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24927, 0x4, 0x1, 0x3B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_66:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2492B, 0x4, 0x1, 0x3C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_67:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2492F, 0x4, 0x1, 0x3D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_68:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24933, 0x4, 0x1, 0x3E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_69:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24937, 0x4, 0x1, 0x3F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_70:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2493B, 0x4, 0x1, 0x40
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_71:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2493F, 0x4, 0x1, 0x41
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_72:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24943, 0x4, 0x1, 0x42
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_73:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24947, 0x4, 0x1, 0x43
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_74:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2494B, 0x4, 0x1, 0x44
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_75:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_76:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_77:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_78:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2494F, 0x4, 0x1, 0x45
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_79:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24953, 0x2, 0x1, 0x46
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_80:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24955, 0x4, 0x1, 0x47
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_81:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24959, 0x4, 0x1, 0x48
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_82:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2495D, 0x4, 0x1, 0x49
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_83:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24961, 0x4, 0x1, 0x4A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_84:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24965, 0x2, 0x1, 0x4B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_85:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24967, 0x4, 0x1, 0x4C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_86:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2496B, 0x4, 0x1, 0x4D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_87:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2496F, 0x4, 0x1, 0x4E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_88:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24973, 0x4, 0x1, 0x4F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_89:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24977, 0x2, 0x1, 0x50
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_90:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24979, 0x4, 0x1, 0x51
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_91:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2497D, 0x2, 0x1, 0x52
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_92:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2497F, 0x4, 0x1, 0x53
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_93:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24983, 0x4, 0x1, 0x54
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_94:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24987, 0x4, 0x1, 0x55
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_95:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2498B, 0x4, 0x1, 0x56
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_96:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2498F, 0x4, 0x1, 0x57
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_97:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24993, 0x4, 0x1, 0x58
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_98:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24997, 0x4, 0x1, 0x59
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_99:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2499B, 0x4, 0x1, 0x5A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_100:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2499F, 0x4, 0x1, 0x5B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_101:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249A3, 0x4, 0x1, 0x5C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_102:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249A7, 0x4, 0x1, 0x5D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_103:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249AB, 0x4, 0x1, 0x5E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_104:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249AF, 0x4, 0x1, 0x5F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_105:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249B3, 0x4, 0x1, 0x60
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_106:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249B7, 0x4, 0x1, 0x61
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_107:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249BB, 0x4, 0x1, 0x62
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_108:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249BF, 0x4, 0x1, 0x63
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_109:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_110:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249C3, 0x4, 0x1, 0x64
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_111:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249C7, 0x4, 0x1, 0x65
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_112:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249CB, 0x4, 0x1, 0x66
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_113:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249CF, 0x4, 0x1, 0x67
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_114:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249D3, 0x4, 0x1, 0x68
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_115:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249D7, 0x4, 0x1, 0x69
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_116:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249DB, 0x4, 0x1, 0x6A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_117:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249DF, 0x4, 0x1, 0x6B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_118:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249E3, 0x4, 0x1, 0x6C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_119:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249E7, 0x4, 0x1, 0x6D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_120:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249EB, 0x4, 0x1, 0x6E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_121:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249EF, 0x4, 0x1, 0x6F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_122:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249F3, 0x4, 0x1, 0x70
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_123:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249F7, 0x4, 0x1, 0x71
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_124:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249FB, 0x4, 0x1, 0x72
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_125:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x249FF, 0x4, 0x1, 0x73
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_126:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A03, 0x4, 0x1, 0x74
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_127:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A07, 0x4, 0x1, 0x75
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_128:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A0B, 0x4, 0x1, 0x76
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_129:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A0F, 0x4, 0x1, 0x77
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_130:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A13, 0x4, 0x1, 0x78
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_131:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A17, 0x4, 0x1, 0x79
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_132:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A1B, 0x4, 0x1, 0x7A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_133:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A1F, 0x4, 0x1, 0x7B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_134:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A23, 0x4, 0x1, 0x7C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_135:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A27, 0x4, 0x1, 0x7D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_136:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A2B, 0x4, 0x1, 0x7E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_137:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A2F, 0x4, 0x1, 0x7F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_138:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A33, 0x4, 0x1, 0x80
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_139:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A37, 0x4, 0x1, 0x81
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_140:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A3B, 0x2, 0x1, 0x82
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_141:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A3D, 0x2, 0x1, 0x83
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_142:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_143:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A3F, 0x2, 0x1, 0x84
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_144:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A41, 0x4, 0x1, 0x85
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_145:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A45, 0x4, 0x1, 0x86
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_146:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A49, 0x4, 0x1, 0x87
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_147:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A4D, 0x4, 0x1, 0x88
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_148:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A51, 0x4, 0x1, 0x89
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_149:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A55, 0x4, 0x1, 0x8A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_150:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A59, 0x4, 0x1, 0x8B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_151:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A5D, 0x4, 0x1, 0x8C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_152:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A61, 0x4, 0x1, 0x8D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_153:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A65, 0x4, 0x1, 0x8E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_154:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A69, 0x4, 0x1, 0x8F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_155:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A6D, 0x4, 0x1, 0x90
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_156:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A71, 0x4, 0x1, 0x91
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_157:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A75, 0x4, 0x1, 0x92
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_158:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A79, 0x4, 0x1, 0x93
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_159:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A7D, 0x4, 0x1, 0x94
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_160:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A81, 0x4, 0x1, 0x95
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_161:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A85, 0x4, 0x1, 0x96
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_162:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A89, 0x4, 0x1, 0x97
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_163:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A8D, 0x4, 0x1, 0x98
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_164:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A91, 0x4, 0x1, 0x99
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_165:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A95, 0x4, 0x1, 0x9A
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_166:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A99, 0x4, 0x1, 0x9B
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_167:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24A9D, 0x4, 0x1, 0x9C
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_168:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AA1, 0x4, 0x1, 0x9D
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_169:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AA5, 0x4, 0x1, 0x9E
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_170:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AA9, 0x4, 0x1, 0x9F
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_171:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AAD, 0x4, 0x1, 0xA0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_172:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AB1, 0x4, 0x1, 0xA1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_173:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AB5, 0x4, 0x1, 0xA2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_174:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_175:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_176:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AB9, 0x4, 0x1, 0xA3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_177:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24ABD, 0x4, 0x1, 0xA4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_178:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AC1, 0x4, 0x1, 0xA5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_179:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AC5, 0x4, 0x1, 0xA6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_180:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AC9, 0x4, 0x1, 0xA7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_181:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24ACD, 0x4, 0x1, 0xA8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_182:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AD1, 0x4, 0x1, 0xA9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_183:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AD5, 0x4, 0x1, 0xAA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_184:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AD9, 0x4, 0x1, 0xAB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_185:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24ADD, 0x4, 0x1, 0xAC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_186:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AE1, 0x4, 0x1, 0xAD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_187:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AE5, 0x4, 0x1, 0xAE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_188:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AE9, 0x4, 0x1, 0xAF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_189:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AED, 0x4, 0x1, 0xB0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_190:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AF1, 0x4, 0x1, 0xB1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_191:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AF5, 0x4, 0x1, 0xB2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_192:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AF9, 0x4, 0x1, 0xB3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_193:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24AFD, 0x4, 0x1, 0xB4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_194:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B01, 0x4, 0x1, 0xB5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_195:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B05, 0x4, 0x1, 0xB6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_196:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B09, 0x4, 0x1, 0xB7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_197:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B0D, 0x4, 0x1, 0xB8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_198:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B11, 0x4, 0x1, 0xB9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_199:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B15, 0x4, 0x1, 0xBA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_200:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B19, 0x4, 0x1, 0xBB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_201:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B1D, 0x4, 0x1, 0xBC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_202:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B21, 0x4, 0x1, 0xBD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_203:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B25, 0x4, 0x1, 0xBE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_204:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B29, 0x4, 0x1, 0xBF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_205:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B2D, 0x4, 0x1, 0xC0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_206:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B31, 0x4, 0x1, 0xC1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_207:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B35, 0x4, 0x1, 0xC2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_208:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_209:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B39, 0x4, 0x1, 0xC3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_210:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B3D, 0x4, 0x1, 0xC4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_211:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B41, 0x4, 0x1, 0xC5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_212:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B45, 0x4, 0x1, 0xC6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_213:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B49, 0x4, 0x1, 0xC7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_214:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B4D, 0x4, 0x1, 0xC8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_215:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B51, 0x4, 0x1, 0xC9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_216:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B55, 0x4, 0x1, 0xCA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_217:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B59, 0x4, 0x1, 0xCB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_218:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B5D, 0x4, 0x1, 0xCC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_219:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B61, 0x4, 0x1, 0xCD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_220:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B65, 0x4, 0x1, 0xCE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_221:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B69, 0x4, 0x1, 0xCF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_222:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B6D, 0x4, 0x1, 0xD0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_223:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B71, 0x4, 0x1, 0xD1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_224:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B75, 0x4, 0x1, 0xD2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_225:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B79, 0x4, 0x1, 0xD3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_226:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B7D, 0x4, 0x1, 0xD4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_227:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B81, 0x4, 0x1, 0xD5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_228:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B85, 0x4, 0x1, 0xD6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_229:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B89, 0x4, 0x1, 0xD7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_230:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B8D, 0x4, 0x1, 0xD8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_231:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B11, 0x4, 0x1, 0xB9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_232:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B91, 0x4, 0x1, 0xD9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_233:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B95, 0x4, 0x1, 0xDA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_234:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B99, 0x4, 0x1, 0xDB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_235:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24B9D, 0x4, 0x1, 0xDC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_236:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BA1, 0x4, 0x1, 0xDD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_237:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BA5, 0x4, 0x1, 0xDE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_238:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BA9, 0x4, 0x1, 0xDF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_239:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BAD, 0x4, 0x1, 0xE0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_240:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BB1, 0x4, 0x1, 0xE1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_241:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__0955_242:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BB5, 0x4, 0x1, 0xE2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_243:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BB9, 0x4, 0x1, 0xE3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_244:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BBD, 0x4, 0x1, 0xE4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_245:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BC1, 0x4, 0x1, 0xE5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_246:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BC5, 0x4, 0x1, 0xE6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_247:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BC9, 0x4, 0x1, 0xE7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_248:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BCD, 0x4, 0x1, 0xE8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_249:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BD1, 0x4, 0x1, 0xE9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_250:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BD5, 0x4, 0x1, 0xEA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_251:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BD9, 0x4, 0x1, 0xEB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_252:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BDD, 0x4, 0x1, 0xEC
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_253:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BE1, 0x4, 0x1, 0xED
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_254:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BE5, 0x4, 0x1, 0xEE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0955_255:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24BE9, 0x4, 0x1, 0xEF
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_0955:
		.4byte anim_data__0955_0
		.4byte anim_data__0955_1
		.4byte anim_data__0955_2
		.4byte anim_data__0955_3
		.4byte anim_data__0955_4
		.4byte anim_data__0955_5
		.4byte anim_data__0955_6
		.4byte anim_data__0955_7
		.4byte anim_data__0955_8
		.4byte anim_data__0955_9
		.4byte anim_data__0955_10
		.4byte anim_data__0955_11
		.4byte anim_data__0955_12
		.4byte anim_data__0955_13
		.4byte anim_data__0955_14
		.4byte anim_data__0955_15
		.4byte anim_data__0955_16
		.4byte anim_data__0955_17
		.4byte anim_data__0955_18
		.4byte anim_data__0955_19
		.4byte anim_data__0955_20
		.4byte anim_data__0955_21
		.4byte anim_data__0955_22
		.4byte anim_data__0955_23
		.4byte anim_data__0955_24
		.4byte anim_data__0955_25
		.4byte anim_data__0955_26
		.4byte anim_data__0955_27
		.4byte anim_data__0955_28
		.4byte anim_data__0955_29
		.4byte anim_data__0955_30
		.4byte anim_data__0955_31
		.4byte anim_data__0955_32
		.4byte anim_data__0955_33
		.4byte anim_data__0955_34
		.4byte anim_data__0955_35
		.4byte anim_data__0955_36
		.4byte anim_data__0955_37
		.4byte anim_data__0955_38
		.4byte anim_data__0955_39
		.4byte anim_data__0955_40
		.4byte anim_data__0955_41
		.4byte anim_data__0955_42
		.4byte anim_data__0955_43
		.4byte anim_data__0955_44
		.4byte anim_data__0955_45
		.4byte anim_data__0955_46
		.4byte anim_data__0955_47
		.4byte anim_data__0955_48
		.4byte anim_data__0955_49
		.4byte anim_data__0955_50
		.4byte anim_data__0955_51
		.4byte anim_data__0955_52
		.4byte anim_data__0955_53
		.4byte anim_data__0955_54
		.4byte anim_data__0955_55
		.4byte anim_data__0955_56
		.4byte anim_data__0955_57
		.4byte anim_data__0955_58
		.4byte anim_data__0955_59
		.4byte anim_data__0955_60
		.4byte anim_data__0955_61
		.4byte anim_data__0955_62
		.4byte anim_data__0955_63
		.4byte anim_data__0955_64
		.4byte anim_data__0955_65
		.4byte anim_data__0955_66
		.4byte anim_data__0955_67
		.4byte anim_data__0955_68
		.4byte anim_data__0955_69
		.4byte anim_data__0955_70
		.4byte anim_data__0955_71
		.4byte anim_data__0955_72
		.4byte anim_data__0955_73
		.4byte anim_data__0955_74
		.4byte anim_data__0955_75
		.4byte anim_data__0955_76
		.4byte anim_data__0955_77
		.4byte anim_data__0955_78
		.4byte anim_data__0955_79
		.4byte anim_data__0955_80
		.4byte anim_data__0955_81
		.4byte anim_data__0955_82
		.4byte anim_data__0955_83
		.4byte anim_data__0955_84
		.4byte anim_data__0955_85
		.4byte anim_data__0955_86
		.4byte anim_data__0955_87
		.4byte anim_data__0955_88
		.4byte anim_data__0955_89
		.4byte anim_data__0955_90
		.4byte anim_data__0955_91
		.4byte anim_data__0955_92
		.4byte anim_data__0955_93
		.4byte anim_data__0955_94
		.4byte anim_data__0955_95
		.4byte anim_data__0955_96
		.4byte anim_data__0955_97
		.4byte anim_data__0955_98
		.4byte anim_data__0955_99
		.4byte anim_data__0955_100
		.4byte anim_data__0955_101
		.4byte anim_data__0955_102
		.4byte anim_data__0955_103
		.4byte anim_data__0955_104
		.4byte anim_data__0955_105
		.4byte anim_data__0955_106
		.4byte anim_data__0955_107
		.4byte anim_data__0955_108
		.4byte anim_data__0955_109
		.4byte anim_data__0955_110
		.4byte anim_data__0955_111
		.4byte anim_data__0955_112
		.4byte anim_data__0955_113
		.4byte anim_data__0955_114
		.4byte anim_data__0955_115
		.4byte anim_data__0955_116
		.4byte anim_data__0955_117
		.4byte anim_data__0955_118
		.4byte anim_data__0955_119
		.4byte anim_data__0955_120
		.4byte anim_data__0955_121
		.4byte anim_data__0955_122
		.4byte anim_data__0955_123
		.4byte anim_data__0955_124
		.4byte anim_data__0955_125
		.4byte anim_data__0955_126
		.4byte anim_data__0955_127
		.4byte anim_data__0955_128
		.4byte anim_data__0955_129
		.4byte anim_data__0955_130
		.4byte anim_data__0955_131
		.4byte anim_data__0955_132
		.4byte anim_data__0955_133
		.4byte anim_data__0955_134
		.4byte anim_data__0955_135
		.4byte anim_data__0955_136
		.4byte anim_data__0955_137
		.4byte anim_data__0955_138
		.4byte anim_data__0955_139
		.4byte anim_data__0955_140
		.4byte anim_data__0955_141
		.4byte anim_data__0955_142
		.4byte anim_data__0955_143
		.4byte anim_data__0955_144
		.4byte anim_data__0955_145
		.4byte anim_data__0955_146
		.4byte anim_data__0955_147
		.4byte anim_data__0955_148
		.4byte anim_data__0955_149
		.4byte anim_data__0955_150
		.4byte anim_data__0955_151
		.4byte anim_data__0955_152
		.4byte anim_data__0955_153
		.4byte anim_data__0955_154
		.4byte anim_data__0955_155
		.4byte anim_data__0955_156
		.4byte anim_data__0955_157
		.4byte anim_data__0955_158
		.4byte anim_data__0955_159
		.4byte anim_data__0955_160
		.4byte anim_data__0955_161
		.4byte anim_data__0955_162
		.4byte anim_data__0955_163
		.4byte anim_data__0955_164
		.4byte anim_data__0955_165
		.4byte anim_data__0955_166
		.4byte anim_data__0955_167
		.4byte anim_data__0955_168
		.4byte anim_data__0955_169
		.4byte anim_data__0955_170
		.4byte anim_data__0955_171
		.4byte anim_data__0955_172
		.4byte anim_data__0955_173
		.4byte anim_data__0955_174
		.4byte anim_data__0955_175
		.4byte anim_data__0955_176
		.4byte anim_data__0955_177
		.4byte anim_data__0955_178
		.4byte anim_data__0955_179
		.4byte anim_data__0955_180
		.4byte anim_data__0955_181
		.4byte anim_data__0955_182
		.4byte anim_data__0955_183
		.4byte anim_data__0955_184
		.4byte anim_data__0955_185
		.4byte anim_data__0955_186
		.4byte anim_data__0955_187
		.4byte anim_data__0955_188
		.4byte anim_data__0955_189
		.4byte anim_data__0955_190
		.4byte anim_data__0955_191
		.4byte anim_data__0955_192
		.4byte anim_data__0955_193
		.4byte anim_data__0955_194
		.4byte anim_data__0955_195
		.4byte anim_data__0955_196
		.4byte anim_data__0955_197
		.4byte anim_data__0955_198
		.4byte anim_data__0955_199
		.4byte anim_data__0955_200
		.4byte anim_data__0955_201
		.4byte anim_data__0955_202
		.4byte anim_data__0955_203
		.4byte anim_data__0955_204
		.4byte anim_data__0955_205
		.4byte anim_data__0955_206
		.4byte anim_data__0955_207
		.4byte anim_data__0955_208
		.4byte anim_data__0955_209
		.4byte anim_data__0955_210
		.4byte anim_data__0955_211
		.4byte anim_data__0955_212
		.4byte anim_data__0955_213
		.4byte anim_data__0955_214
		.4byte anim_data__0955_215
		.4byte anim_data__0955_216
		.4byte anim_data__0955_217
		.4byte anim_data__0955_218
		.4byte anim_data__0955_219
		.4byte anim_data__0955_220
		.4byte anim_data__0955_221
		.4byte anim_data__0955_222
		.4byte anim_data__0955_223
		.4byte anim_data__0955_224
		.4byte anim_data__0955_225
		.4byte anim_data__0955_226
		.4byte anim_data__0955_227
		.4byte anim_data__0955_228
		.4byte anim_data__0955_229
		.4byte anim_data__0955_230
		.4byte anim_data__0955_231
		.4byte anim_data__0955_232
		.4byte anim_data__0955_233
		.4byte anim_data__0955_234
		.4byte anim_data__0955_235
		.4byte anim_data__0955_236
		.4byte anim_data__0955_237
		.4byte anim_data__0955_238
		.4byte anim_data__0955_239
		.4byte anim_data__0955_240
		.4byte anim_data__0955_241
		.4byte anim_data__0955_242
		.4byte anim_data__0955_243
		.4byte anim_data__0955_244
		.4byte anim_data__0955_245
		.4byte anim_data__0955_246
		.4byte anim_data__0955_247
		.4byte anim_data__0955_248
		.4byte anim_data__0955_249
		.4byte anim_data__0955_250
		.4byte anim_data__0955_251
		.4byte anim_data__0955_252
		.4byte anim_data__0955_253
		.4byte anim_data__0955_254
		.4byte anim_data__0955_255




.align 2, 0
	anim_data__0956_0:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24BED, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0956_1:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24C1F, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0956_2:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24C51, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0956_3:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24C83, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0956_4:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24CB5, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0956_5:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24CE7, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0956_6:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24D19, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0956_7:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x24D4B, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0956_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24D7D, 0x27, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0956:
		.4byte anim_data__0956_0
		.4byte anim_data__0956_1
		.4byte anim_data__0956_2
		.4byte anim_data__0956_3
		.4byte anim_data__0956_4
		.4byte anim_data__0956_5
		.4byte anim_data__0956_6
		.4byte anim_data__0956_7
		.4byte anim_data__0956_8




.align 2, 0
	anim_data__0957_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24DA4, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0957_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24DCC, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0957_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24DF4, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0957_3:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24E1C, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0957_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24E44, 0x33, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0957_5:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24E77, 0x3F, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_0957:
		.4byte anim_data__0957_0
		.4byte anim_data__0957_1
		.4byte anim_data__0957_2
		.4byte anim_data__0957_3
		.4byte anim_data__0957_4
		.4byte anim_data__0957_5




.align 2, 0
	anim_data__0958_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x24EB6, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0958:
		.4byte anim_data__0958_0




.align 2, 0
	anim_data__0959_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x24ED2, 0x42, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0959_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24F14, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0959_2:
		.4byte	AnimCmd_GetPalette, 0x2B6, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24F38, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0959:
		.4byte anim_data__0959_0
		.4byte anim_data__0959_1
		.4byte anim_data__0959_2




.align 2, 0
	anim_data__0960_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24F5C, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0960_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x24F6C, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0960_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x24F7C, 0x2A, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0960:
		.4byte anim_data__0960_0
		.4byte anim_data__0960_1
		.4byte anim_data__0960_2




.align 2, 0
	anim_data__0961_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x24FA6, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0961_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24FD6, 0x1C, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0961:
		.4byte anim_data__0961_0
		.4byte anim_data__0961_1




.align 2, 0
	anim_data__0962_0:
		.4byte	AnimCmd_GetPalette, 0x2B7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24FF2, 0x1, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x24FF3, 0x2, 0x6, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x24FF5, 0x2, 0x6, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x24FF7, 0x1, 0x6, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__0962_1:
		.4byte	AnimCmd_GetPalette, 0x2B7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24FF8, 0x1, 0x6, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x24FF9, 0x2, 0x6, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x24FFB, 0x2, 0x6, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x24FFD, 0x1, 0x6, 0x7
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_0962:
		.4byte anim_data__0962_0
		.4byte anim_data__0962_1




.align 2, 0
	anim_data__0963_0:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x24FFE, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25002, 0x4, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_2:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25006, 0x4, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_3:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2500A, 0x4, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_4:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2500E, 0x4, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_5:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25012, 0x4, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_6:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25016, 0x4, 0x1, 0x6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_7:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2501A, 0x4, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_8:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2501E, 0x4, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_9:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25022, 0x4, 0x1, 0x9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_10:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25026, 0x4, 0x1, 0xA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_11:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2502A, 0x4, 0x1, 0xB
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__0963_12:
		.4byte	AnimCmd_GetPalette, 0x2B8, 0x700010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__0963_13:
		.4byte	AnimCmd_GetPalette, 0x2B9, 0x800010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0963:
		.4byte anim_data__0963_0
		.4byte anim_data__0963_1
		.4byte anim_data__0963_2
		.4byte anim_data__0963_3
		.4byte anim_data__0963_4
		.4byte anim_data__0963_5
		.4byte anim_data__0963_6
		.4byte anim_data__0963_7
		.4byte anim_data__0963_8
		.4byte anim_data__0963_9
		.4byte anim_data__0963_10
		.4byte anim_data__0963_11
		.4byte anim_data__0963_12
		.4byte anim_data__0963_13




.align 2, 0
	anim_data__0964_0:
		.4byte	AnimCmd_GetPalette, 0x2BA, 0x200010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__0964_1:
		.4byte	AnimCmd_GetPalette, 0x2BB, 0x400010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_0964:
		.4byte anim_data__0964_0
		.4byte anim_data__0964_1




.align 2, 0
	anim_data__0965_0:
		.4byte	AnimCmd_GetPalette, 0x2BC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2502E, 0xA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0965_1:
		.4byte	AnimCmd_GetPalette, 0x2BC, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x25038, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0965_2:
		.4byte	AnimCmd_GetPalette, 0x2BC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x25042, 0x1, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0965:
		.4byte anim_data__0965_0
		.4byte anim_data__0965_1
		.4byte anim_data__0965_2




.align 2, 0
	anim_data__0966_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x25043, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0966:
		.4byte anim_data__0966_0




.align 2, 0
	anim_data__0967_0:
		.4byte	AnimCmd_GetPalette, 0x2BD, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x25057, 0x2A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0967:
		.4byte anim_data__0967_0




.align 2, 0
	anim_data__0968_0:
		.4byte	AnimCmd_GetPalette, 0x2BE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x25081, 0x40, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x250C1, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x25101, 0x40, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x25141, 0x48, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x25189, 0x48, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x251D1, 0x48, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x25219, 0x40, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x25259, 0x40, 0x5, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x25299, 0x48, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x25189, 0x48, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x251D1, 0x48, 0x5, 0x5
		.4byte	AnimCmd_JumpBack, 0x3A
	anim_data__0968_1:
		.4byte	AnimCmd_GetPalette, 0x2BE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x252E1, 0x28, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_0968:
		.4byte anim_data__0968_0
		.4byte anim_data__0968_1




.align 2, 0
	anim_data__0969_0:
		.4byte	AnimCmd_GetPalette, 0x2BF, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x25309, 0x60, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0969:
		.4byte anim_data__0969_0




.align 2, 0
	anim_data__0970_0:
		.4byte	AnimCmd_GetPalette, 0x2BE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x25369, 0x30, 0x6, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x25399, 0x30, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x253C9, 0x2A, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x253F3, 0x2A, 0xA, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x253C9, 0x2A, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x25399, 0x30, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x25369, 0x30, 0xA, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2541D, 0x30, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2544D, 0x30, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2541D, 0x30, 0x5, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x25369, 0x30, 0x5, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0970:
		.4byte anim_data__0970_0




.align 2, 0
	anim_data__0971_0:
		.4byte	AnimCmd_GetPalette, 0x2BE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x2547D, 0x40, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x254BD, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x254FD, 0x3F, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2553C, 0x36, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x25572, 0x36, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2553C, 0x36, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x254FD, 0x3F, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2553C, 0x36, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x25572, 0x36, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2553C, 0x36, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x254FD, 0x3F, 0x5, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x254BD, 0x40, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2547D, 0x40, 0x5, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0971:
		.4byte anim_data__0971_0




.align 2, 0
	anim_data__0972_0:
		.4byte	AnimCmd_GetPalette, 0x2C0, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x255A8, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0972:
		.4byte anim_data__0972_0




.align 2, 0
	anim_data__0973_0:
		.4byte	AnimCmd_GetPalette, 0x2BE, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x255BC, 0x30, 0x5, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x255EC, 0x38, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x25624, 0x30, 0xA, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x25654, 0x30, 0x5, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x25684, 0x38, 0xA, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x256BC, 0x30, 0x5, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x256EC, 0x38, 0x5, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x25724, 0x30, 0xA, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x25754, 0x30, 0x5, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x25784, 0x38, 0xA, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x25784, 0x38, 0x5, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x257BC, 0x38, 0x5, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x257F4, 0x38, 0xA, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2582C, 0x38, 0x5, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x25864, 0x38, 0xA, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x25864, 0x38, 0x5, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x255EC, 0x38, 0x5, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2589C, 0x38, 0xA, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x258D4, 0x38, 0x5, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x2590C, 0x38, 0xA, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x25864, 0x38, 0x5, 0xD
		.4byte	AnimCmd_JumpBack, 0x6C

.align 2, 0
	anim_0973:
		.4byte anim_data__0973_0




.align 2, 0
	anim_data__0974_0:
		.4byte	AnimCmd_GetPalette, 0x2C1, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x25944, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0974:
		.4byte anim_data__0974_0




.align 2, 0
	anim_data__0975_0:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25984, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0975_1:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x259B6, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0975_2:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x259E8, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0975_3:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25A1A, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0975_4:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25A4C, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0975_5:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25A7E, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0975_6:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25AB0, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0975_7:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25AE2, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0975_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x25B14, 0x1A, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0975:
		.4byte anim_data__0975_0
		.4byte anim_data__0975_1
		.4byte anim_data__0975_2
		.4byte anim_data__0975_3
		.4byte anim_data__0975_4
		.4byte anim_data__0975_5
		.4byte anim_data__0975_6
		.4byte anim_data__0975_7
		.4byte anim_data__0975_8




.align 2, 0
	anim_data__0976_0:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25B2E, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0976_1:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25B60, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0976_2:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25B92, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0976_3:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25BC4, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0976_4:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25BF6, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0976_5:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25C28, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0976_6:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25C5A, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0976_7:
		.4byte	AnimCmd_GetPalette, 0x2C2, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25C8C, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0976_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x25CBE, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0976:
		.4byte anim_data__0976_0
		.4byte anim_data__0976_1
		.4byte anim_data__0976_2
		.4byte anim_data__0976_3
		.4byte anim_data__0976_4
		.4byte anim_data__0976_5
		.4byte anim_data__0976_6
		.4byte anim_data__0976_7
		.4byte anim_data__0976_8




.align 2, 0
	anim_data__0977_0:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25CDC, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0977_1:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25D0E, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0977_2:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25D40, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0977_3:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25D72, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0977_4:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25DA4, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0977_5:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25DD6, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0977_6:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25E08, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0977_7:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25E3A, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0977_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x25E6C, 0x18, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0977:
		.4byte anim_data__0977_0
		.4byte anim_data__0977_1
		.4byte anim_data__0977_2
		.4byte anim_data__0977_3
		.4byte anim_data__0977_4
		.4byte anim_data__0977_5
		.4byte anim_data__0977_6
		.4byte anim_data__0977_7
		.4byte anim_data__0977_8




.align 2, 0
	anim_data__0978_0:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25E84, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0978_1:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25EB6, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0978_2:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25EE8, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0978_3:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25F1A, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0978_4:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25F4C, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0978_5:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25F7E, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0978_6:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25FB0, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0978_7:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x25FE2, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0978_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26014, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0978:
		.4byte anim_data__0978_0
		.4byte anim_data__0978_1
		.4byte anim_data__0978_2
		.4byte anim_data__0978_3
		.4byte anim_data__0978_4
		.4byte anim_data__0978_5
		.4byte anim_data__0978_6
		.4byte anim_data__0978_7
		.4byte anim_data__0978_8




.align 2, 0
	anim_data__0979_0:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x26032, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0979_1:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x26064, 0x32, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0979_2:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x26096, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0979_3:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x260C8, 0x32, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0979_4:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x260FA, 0x32, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__0979_5:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2612C, 0x32, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__0979_6:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2615E, 0x32, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__0979_7:
		.4byte	AnimCmd_GetPalette, 0x2B5, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x26190, 0x32, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__0979_8:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x261C2, 0x18, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_0979:
		.4byte anim_data__0979_0
		.4byte anim_data__0979_1
		.4byte anim_data__0979_2
		.4byte anim_data__0979_3
		.4byte anim_data__0979_4
		.4byte anim_data__0979_5
		.4byte anim_data__0979_6
		.4byte anim_data__0979_7
		.4byte anim_data__0979_8




.align 2, 0
	anim_data__0980_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x261DA, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0980_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x261EC, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0980_2:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x261FE, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0980_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26210, 0x26, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0980_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26236, 0x11, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0980:
		.4byte anim_data__0980_0
		.4byte anim_data__0980_1
		.4byte anim_data__0980_2
		.4byte anim_data__0980_3
		.4byte anim_data__0980_4




.align 2, 0
	anim_data__0981_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26247, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0981_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26259, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0981_2:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2626B, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0981_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2627D, 0x26, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0981_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x262A3, 0x11, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0981:
		.4byte anim_data__0981_0
		.4byte anim_data__0981_1
		.4byte anim_data__0981_2
		.4byte anim_data__0981_3
		.4byte anim_data__0981_4




.align 2, 0
	anim_data__0982_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x262B4, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0982_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x262C6, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0982_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x262D8, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0982_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x262EA, 0x2C, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0982_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26316, 0x11, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0982:
		.4byte anim_data__0982_0
		.4byte anim_data__0982_1
		.4byte anim_data__0982_2
		.4byte anim_data__0982_3
		.4byte anim_data__0982_4




.align 2, 0
	anim_data__0983_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26327, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0983_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26339, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0983_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2634B, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0983_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2635D, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0983_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26385, 0x15, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0983:
		.4byte anim_data__0983_0
		.4byte anim_data__0983_1
		.4byte anim_data__0983_2
		.4byte anim_data__0983_3
		.4byte anim_data__0983_4




.align 2, 0
	anim_data__0984_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2639A, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0984_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x263AC, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0984_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x263BE, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0984_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x263D0, 0x2E, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__0984_4:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x263FE, 0xF, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_0984:
		.4byte anim_data__0984_0
		.4byte anim_data__0984_1
		.4byte anim_data__0984_2
		.4byte anim_data__0984_3
		.4byte anim_data__0984_4




.align 2, 0
	anim_data__0985_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2640D, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0985_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2641D, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0985_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2642D, 0x2E, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0985_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2645B, 0x26, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0985:
		.4byte anim_data__0985_0
		.4byte anim_data__0985_1
		.4byte anim_data__0985_2
		.4byte anim_data__0985_3




.align 2, 0
	anim_data__0986_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26481, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0986_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26491, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0986_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x264A1, 0x30, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0986_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x264D1, 0x2C, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0986:
		.4byte anim_data__0986_0
		.4byte anim_data__0986_1
		.4byte anim_data__0986_2
		.4byte anim_data__0986_3




.align 2, 0
	anim_data__0987_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x264FD, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0987_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2650D, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0987_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2651D, 0x50, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0987_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2656D, 0x2A, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0987:
		.4byte anim_data__0987_0
		.4byte anim_data__0987_1
		.4byte anim_data__0987_2
		.4byte anim_data__0987_3




.align 2, 0
	anim_data__0988_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26597, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0988_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x265A7, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0988_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x265B7, 0x44, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0988_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x265FB, 0x3F, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0988:
		.4byte anim_data__0988_0
		.4byte anim_data__0988_1
		.4byte anim_data__0988_2
		.4byte anim_data__0988_3




.align 2, 0
	anim_data__0989_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2663A, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0989_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2664A, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0989_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2665A, 0x3C, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__0989_3:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26696, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_0989:
		.4byte anim_data__0989_0
		.4byte anim_data__0989_1
		.4byte anim_data__0989_2
		.4byte anim_data__0989_3




.align 2, 0
	anim_data__0990_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x266AC, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0990_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x266BC, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0990_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x266CC, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0990:
		.4byte anim_data__0990_0
		.4byte anim_data__0990_1
		.4byte anim_data__0990_2




.align 2, 0
	anim_data__0991_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x266E8, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0991_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x266F8, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0991_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26708, 0x32, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0991:
		.4byte anim_data__0991_0
		.4byte anim_data__0991_1
		.4byte anim_data__0991_2




.align 2, 0
	anim_data__0992_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2673A, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0992_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2674A, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0992_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2675A, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0992:
		.4byte anim_data__0992_0
		.4byte anim_data__0992_1
		.4byte anim_data__0992_2




.align 2, 0
	anim_data__0993_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26776, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0993_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26786, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0993_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26796, 0x1C, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0993:
		.4byte anim_data__0993_0
		.4byte anim_data__0993_1
		.4byte anim_data__0993_2




.align 2, 0
	anim_data__0994_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x267B2, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0994_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x267C2, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__0994_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x267D2, 0x2D, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_0994:
		.4byte anim_data__0994_0
		.4byte anim_data__0994_1
		.4byte anim_data__0994_2




.align 2, 0
	anim_data__0995_0:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x267FF, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__0995_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26831, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_0995:
		.4byte anim_data__0995_0
		.4byte anim_data__0995_1




.align 2, 0
	anim_data__0996_0:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26845, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0996:
		.4byte anim_data__0996_0




.align 2, 0
	anim_data__0997_0:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26873, 0x3C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0997:
		.4byte anim_data__0997_0




.align 2, 0
	anim_data__0998_0:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x268AF, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0998:
		.4byte anim_data__0998_0




.align 2, 0
	anim_data__0999_0:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x268D5, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_0999:
		.4byte anim_data__0999_0




.align 2, 0
	anim_data__1000_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26903, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1000_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26923, 0x18, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1000:
		.4byte anim_data__1000_0
		.4byte anim_data__1000_1




.align 2, 0
	anim_data__1001_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x2693B, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1001_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26957, 0x1C, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1001:
		.4byte anim_data__1001_0
		.4byte anim_data__1001_1




.align 2, 0
	anim_data__1002_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26973, 0x22, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1002_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26995, 0x1E, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1002:
		.4byte anim_data__1002_0
		.4byte anim_data__1002_1




.align 2, 0
	anim_data__1003_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x269B3, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1003_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x269B3, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1003:
		.4byte anim_data__1003_0
		.4byte anim_data__1003_1




.align 2, 0
	anim_data__1004_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x269C7, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1004_1:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x269E7, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1004:
		.4byte anim_data__1004_0
		.4byte anim_data__1004_1




.align 2, 0
	anim_data__1005_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26A01, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1005_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26A29, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1005_2:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26A51, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1005_3:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26A79, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1005_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26AA1, 0x22, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1005:
		.4byte anim_data__1005_0
		.4byte anim_data__1005_1
		.4byte anim_data__1005_2
		.4byte anim_data__1005_3
		.4byte anim_data__1005_4




.align 2, 0
	anim_data__1006_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26AC3, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1006_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26AEB, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1006_2:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26B13, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1006_3:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26B3B, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1006_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26B63, 0x26, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1006:
		.4byte anim_data__1006_0
		.4byte anim_data__1006_1
		.4byte anim_data__1006_2
		.4byte anim_data__1006_3
		.4byte anim_data__1006_4




.align 2, 0
	anim_data__1007_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26B89, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1007_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26BB1, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1007_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26BD9, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1007_3:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26C01, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1007_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26C29, 0x1C, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1007:
		.4byte anim_data__1007_0
		.4byte anim_data__1007_1
		.4byte anim_data__1007_2
		.4byte anim_data__1007_3
		.4byte anim_data__1007_4




.align 2, 0
	anim_data__1008_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26C45, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1008_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26C6D, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1008_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26C95, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1008_3:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26CBD, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1008_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26CE5, 0x1E, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1008:
		.4byte anim_data__1008_0
		.4byte anim_data__1008_1
		.4byte anim_data__1008_2
		.4byte anim_data__1008_3
		.4byte anim_data__1008_4




.align 2, 0
	anim_data__1009_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26D03, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1009_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26D2B, 0x28, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1009_2:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26D53, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1009_3:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26D7B, 0x28, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1009_4:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26DA3, 0x1C, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1009:
		.4byte anim_data__1009_0
		.4byte anim_data__1009_1
		.4byte anim_data__1009_2
		.4byte anim_data__1009_3
		.4byte anim_data__1009_4




.align 2, 0
	anim_data__1010_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26DBF, 0x16, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1010:
		.4byte anim_data__1010_0




.align 2, 0
	anim_data__1011_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26DD5, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1011:
		.4byte anim_data__1011_0




.align 2, 0
	anim_data__1012_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26DEF, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1012:
		.4byte anim_data__1012_0




.align 2, 0
	anim_data__1013_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26E09, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1013:
		.4byte anim_data__1013_0




.align 2, 0
	anim_data__1014_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26E23, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1014:
		.4byte anim_data__1014_0




.align 2, 0
	anim_data__1015_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26E3F, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1015_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x26E5F, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1015_2:
		.4byte	AnimCmd_GetPalette, 0x2B6, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26E83, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1015:
		.4byte anim_data__1015_0
		.4byte anim_data__1015_1
		.4byte anim_data__1015_2




.align 2, 0
	anim_data__1016_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26EA7, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1016:
		.4byte anim_data__1016_0




.align 2, 0
	anim_data__1017_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26EC5, 0x2C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1017:
		.4byte anim_data__1017_0




.align 2, 0
	anim_data__1018_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26EF1, 0x2C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1018:
		.4byte anim_data__1018_0




.align 2, 0
	anim_data__1019_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x26F1D, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1019:
		.4byte anim_data__1019_0




.align 2, 0
	anim_data__1020_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26F41, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1020_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26F51, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1020_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26F61, 0x1A, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1020:
		.4byte anim_data__1020_0
		.4byte anim_data__1020_1
		.4byte anim_data__1020_2




.align 2, 0
	anim_data__1021_0:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26F7B, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1021_1:
		.4byte	AnimCmd_GetPalette, 0x2C3, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26F8B, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1021_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26F9B, 0x18, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1021:
		.4byte anim_data__1021_0
		.4byte anim_data__1021_1
		.4byte anim_data__1021_2




.align 2, 0
	anim_data__1022_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26FB3, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1022_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26FC3, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1022_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x26FD3, 0x26, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1022:
		.4byte anim_data__1022_0
		.4byte anim_data__1022_1
		.4byte anim_data__1022_2




.align 2, 0
	anim_data__1023_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x26FF9, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1023_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x27009, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1023_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27019, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1023:
		.4byte anim_data__1023_0
		.4byte anim_data__1023_1
		.4byte anim_data__1023_2




.align 2, 0
	anim_data__1024_0:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x27041, 0x10, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1024_1:
		.4byte	AnimCmd_GetPalette, 0x2B0, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x27051, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1024_2:
		.4byte	AnimCmd_GetPalette, 0x2B1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27061, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1024:
		.4byte anim_data__1024_0
		.4byte anim_data__1024_1
		.4byte anim_data__1024_2




.align 2, 0
	anim_data__1025_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x27085, 0x2A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1025_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x270AF, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1025:
		.4byte anim_data__1025_0
		.4byte anim_data__1025_1




.align 2, 0
	anim_data__1026_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x270C9, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1026_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x270E5, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1026:
		.4byte anim_data__1026_0
		.4byte anim_data__1026_1




.align 2, 0
	anim_data__1027_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x270FF, 0x2A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1027_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27129, 0x18, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1027:
		.4byte anim_data__1027_0
		.4byte anim_data__1027_1




.align 2, 0
	anim_data__1028_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x27141, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1028_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27169, 0x18, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1028:
		.4byte anim_data__1028_0
		.4byte anim_data__1028_1




.align 2, 0
	anim_data__1029_0:
		.4byte	AnimCmd_GetPalette, 0x2B2, 0x500010
		.4byte	AnimCmd_GetTileIndex, 0x27181, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1029_1:
		.4byte	AnimCmd_GetPalette, 0x2B3, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x271A9, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1029:
		.4byte anim_data__1029_0
		.4byte anim_data__1029_1




.align 2, 0
	anim_data__1030_0:
		.4byte	AnimCmd_GetPalette, 0x2BD, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x271C3, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1030:
		.4byte anim_data__1030_0




.align 2, 0
	anim_data__1031_0:
		.4byte	AnimCmd_GetPalette, 0x2BD, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x271E3, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1031:
		.4byte anim_data__1031_0




.align 2, 0
	anim_data__1032_0:
		.4byte	AnimCmd_GetPalette, 0x2BD, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x271FD, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1032:
		.4byte anim_data__1032_0




.align 2, 0
	anim_data__1033_0:
		.4byte	AnimCmd_GetPalette, 0x2BD, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2722D, 0x22, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1033:
		.4byte anim_data__1033_0




.align 2, 0
	anim_data__1034_0:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2724F, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1034_1:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x27257, 0x8, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1034:
		.4byte anim_data__1034_0
		.4byte anim_data__1034_1




.align 2, 0
	anim_data__1035_0:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2725F, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1035_1:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x27267, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1035:
		.4byte anim_data__1035_0
		.4byte anim_data__1035_1




.align 2, 0
	anim_data__1036_0:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x27273, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1036_1:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2727B, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1036:
		.4byte anim_data__1036_0
		.4byte anim_data__1036_1




.align 2, 0
	anim_data__1037_0:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x27287, 0xA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1037_1:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x27291, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1037:
		.4byte anim_data__1037_0
		.4byte anim_data__1037_1




.align 2, 0
	anim_data__1038_0:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x2729B, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1038_1:
		.4byte	AnimCmd_GetPalette, 0x2C4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272A3, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1038:
		.4byte anim_data__1038_0
		.4byte anim_data__1038_1




.align 2, 0
	anim_data__1039_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272AF, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1039:
		.4byte anim_data__1039_0




.align 2, 0
	anim_data__1040_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272C3, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1040:
		.4byte anim_data__1040_0




.align 2, 0
	anim_data__1041_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272D7, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1041:
		.4byte anim_data__1041_0




.align 2, 0
	anim_data__1042_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272EB, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1042:
		.4byte anim_data__1042_0




.align 2, 0
	anim_data__1043_0:
		.4byte	AnimCmd_GetPalette, 0xA4, 0x200010
		.4byte	AnimCmd_GetTileIndex, 0x272FF, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1043:
		.4byte anim_data__1043_0




.align 2, 0
	anim_data__1044_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27313, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1044:
		.4byte anim_data__1044_0




.align 2, 0
	anim_data__1045_0:
		.4byte	AnimCmd_GetPalette, 0x4A, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2732F, 0x2E
		.4byte	AnimCmd_6, 0x0, 0x2000200, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1045:
		.4byte anim_data__1045_0




.align 2, 0
	anim_data__1046_0:
		.4byte	AnimCmd_GetPalette, 0xD8, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2735D, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1046:
		.4byte anim_data__1046_0




.align 2, 0
	anim_data__1047_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273B7, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1047_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273BB, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1047_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273BF, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1047_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273C3, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1047_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273C7, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1047_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273CB, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1047_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273CF, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1047_7:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273D3, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1047_8:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273D7, 0x4, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1047_9:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273DB, 0x4, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__1047_10:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273DF, 0x4, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__1047_11:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273E3, 0x10, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__1047_12:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x273F3, 0x10, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__1047_13:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27403, 0x10, 0x1, 0xD
		.4byte	AnimCmd_4
	anim_data__1047_14:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27413, 0x10, 0x1, 0xE
		.4byte	AnimCmd_4
	anim_data__1047_15:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27423, 0x10, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__1047_16:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27433, 0x10, 0x1, 0x10
		.4byte	AnimCmd_4

.align 2, 0
	anim_1047:
		.4byte anim_data__1047_0
		.4byte anim_data__1047_1
		.4byte anim_data__1047_2
		.4byte anim_data__1047_3
		.4byte anim_data__1047_4
		.4byte anim_data__1047_5
		.4byte anim_data__1047_6
		.4byte anim_data__1047_7
		.4byte anim_data__1047_8
		.4byte anim_data__1047_9
		.4byte anim_data__1047_10
		.4byte anim_data__1047_11
		.4byte anim_data__1047_12
		.4byte anim_data__1047_13
		.4byte anim_data__1047_14
		.4byte anim_data__1047_15
		.4byte anim_data__1047_16




.align 2, 0
	anim_data__1048_0:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27443, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1048_1:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27457, 0x10, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1048_2:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27467, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1048_3:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2746B, 0x6, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1048_4:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27471, 0x6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1048_5:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27477, 0x6, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1048_6:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2747D, 0x6, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1048_7:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27483, 0x6, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1048_8:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27489, 0x6, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1048_9:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2748F, 0x14, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1048:
		.4byte anim_data__1048_0
		.4byte anim_data__1048_1
		.4byte anim_data__1048_2
		.4byte anim_data__1048_3
		.4byte anim_data__1048_4
		.4byte anim_data__1048_5
		.4byte anim_data__1048_6
		.4byte anim_data__1048_7
		.4byte anim_data__1048_8
		.4byte anim_data__1048_9




.align 2, 0
	anim_data__1049_0:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x274A3, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1049_1:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x274BF, 0x1C, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1049_2:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x274DB, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1049_3:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x274FF, 0x1E, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1049_4:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2751D, 0x1C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1049_5:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27539, 0x16, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1049_6:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2754F, 0x1E, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1049_7:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2756D, 0x1A, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1049_8:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27587, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_1049:
		.4byte anim_data__1049_0
		.4byte anim_data__1049_1
		.4byte anim_data__1049_2
		.4byte anim_data__1049_3
		.4byte anim_data__1049_4
		.4byte anim_data__1049_5
		.4byte anim_data__1049_6
		.4byte anim_data__1049_7
		.4byte anim_data__1049_8




.align 2, 0
	anim_data__1050_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275A5, 0x1, 0x7, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x275A6, 0x2, 0x7, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x275A8, 0x2, 0x7, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x275AA, 0x2, 0x7, 0x3
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__1050_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275AC, 0x1, 0x7, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x275AD, 0x2, 0x7, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x275AF, 0x2, 0x7, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x275B1, 0x2, 0x7, 0x7
		.4byte	AnimCmd_JumpBack, 0x17

.align 2, 0
	anim_1050:
		.4byte anim_data__1050_0
		.4byte anim_data__1050_1




.align 2, 0
	anim_data__1051_0:
		.4byte	AnimCmd_GetPalette, 0x2C6, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275B3, 0x16, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1051_1:
		.4byte	AnimCmd_GetPalette, 0x2C6, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275C9, 0x20, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1051_2:
		.4byte	AnimCmd_GetPalette, 0x2C6, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275E9, 0x16, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1051_3:
		.4byte	AnimCmd_GetPalette, 0x2C6, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x275FF, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1051_4:
		.4byte	AnimCmd_GetPalette, 0x2C6, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27615, 0xA, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1051_5:
		.4byte	AnimCmd_GetPalette, 0x2C7, 0x700010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_1051:
		.4byte anim_data__1051_0
		.4byte anim_data__1051_1
		.4byte anim_data__1051_2
		.4byte anim_data__1051_3
		.4byte anim_data__1051_4
		.4byte anim_data__1051_5




.align 2, 0
	anim_data__1052_0:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2761F, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1052_1:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27637, 0x2A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1052_2:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27661, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1052_3:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27685, 0x1E, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1052_4:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x276A3, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1052:
		.4byte anim_data__1052_0
		.4byte anim_data__1052_1
		.4byte anim_data__1052_2
		.4byte anim_data__1052_3
		.4byte anim_data__1052_4




.align 2, 0
	anim_data__1053_0:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x276AB, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1053_1:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x276C3, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1053_2:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x276E7, 0x2A, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1053_3:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27711, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1053_4:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27735, 0x14, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1053:
		.4byte anim_data__1053_0
		.4byte anim_data__1053_1
		.4byte anim_data__1053_2
		.4byte anim_data__1053_3
		.4byte anim_data__1053_4




.align 2, 0
	anim_data__1054_0:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27749, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1054_1:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27761, 0x30, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1054_2:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27791, 0x24, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1054_3:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x277B5, 0x20, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1054_4:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x277D5, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1054:
		.4byte anim_data__1054_0
		.4byte anim_data__1054_1
		.4byte anim_data__1054_2
		.4byte anim_data__1054_3
		.4byte anim_data__1054_4




.align 2, 0
	anim_data__1055_0:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x277DD, 0x2C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1055_1:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27809, 0x2C, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1055_2:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27835, 0x26, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1055_3:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2785B, 0x20, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1055_4:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2787B, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1055:
		.4byte anim_data__1055_0
		.4byte anim_data__1055_1
		.4byte anim_data__1055_2
		.4byte anim_data__1055_3
		.4byte anim_data__1055_4




.align 2, 0
	anim_data__1056_0:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27883, 0x14, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1056_1:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27897, 0x2C, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1056_2:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x278C3, 0x28, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1056_3:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x278EB, 0x1C, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1056_4:
		.4byte	AnimCmd_GetPalette, 0x2C8, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x27907, 0xC, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1056:
		.4byte anim_data__1056_0
		.4byte anim_data__1056_1
		.4byte anim_data__1056_2
		.4byte anim_data__1056_3
		.4byte anim_data__1056_4




.align 2, 0
	anim_data__1057_0:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27913, 0x6C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1057_1:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2797F, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1057_2:
		.4byte	AnimCmd_GetPalette, 0x2CA, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2798B, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1057_3:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27993, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1057_4:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27A3B, 0xA8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1057_5:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27AE3, 0xA8, 0x1, 0x5
		.4byte	AnimCmd_4

.align 2, 0
	anim_1057:
		.4byte anim_data__1057_0
		.4byte anim_data__1057_1
		.4byte anim_data__1057_2
		.4byte anim_data__1057_3
		.4byte anim_data__1057_4
		.4byte anim_data__1057_5




.align 2, 0
	anim_data__1058_0:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27B8B, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1058_1:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27C33, 0xA8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1058_2:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27CDB, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1058_3:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27D83, 0xC, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1058_4:
		.4byte	AnimCmd_GetPalette, 0x2CC, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x27D8F, 0xC, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1058:
		.4byte anim_data__1058_0
		.4byte anim_data__1058_1
		.4byte anim_data__1058_2
		.4byte anim_data__1058_3
		.4byte anim_data__1058_4




.align 2, 0
	anim_data__1059_0:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27D9B, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1059_1:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27E43, 0xA8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1059_2:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27EEB, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1059:
		.4byte anim_data__1059_0
		.4byte anim_data__1059_1
		.4byte anim_data__1059_2




.align 2, 0
	anim_data__1060_0:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x27F93, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1060_1:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2803B, 0xA8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1060_2:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x280E3, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1060:
		.4byte anim_data__1060_0
		.4byte anim_data__1060_1
		.4byte anim_data__1060_2




.align 2, 0
	anim_data__1061_0:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2818B, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1061_1:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28233, 0xA8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1061_2:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x282DB, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1061:
		.4byte anim_data__1061_0
		.4byte anim_data__1061_1
		.4byte anim_data__1061_2




.align 2, 0
	anim_data__1062_0:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28383, 0xA8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1062_1:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2842B, 0xA8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1062_2:
		.4byte	AnimCmd_GetPalette, 0x2CB, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x284D3, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1062:
		.4byte anim_data__1062_0
		.4byte anim_data__1062_1
		.4byte anim_data__1062_2




.align 2, 0
	anim_data__1063_0:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2857B, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1063_1:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2859F, 0x22, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1063_2:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x285C1, 0x22, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1063_3:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x285E3, 0x24, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1063_4:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28607, 0x22, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1063_5:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28629, 0x24, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1063_6:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2864D, 0x20, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1063_7:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2866D, 0xA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1063_8:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28677, 0x26, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_1063:
		.4byte anim_data__1063_0
		.4byte anim_data__1063_1
		.4byte anim_data__1063_2
		.4byte anim_data__1063_3
		.4byte anim_data__1063_4
		.4byte anim_data__1063_5
		.4byte anim_data__1063_6
		.4byte anim_data__1063_7
		.4byte anim_data__1063_8




.align 2, 0
	anim_data__1064_0:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2869D, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1064_1:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x286C1, 0x22, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1064_2:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x286E3, 0x18, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1064_3:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x286FB, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1064_4:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28711, 0x18, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1064_5:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28729, 0x1C, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1064_6:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28745, 0x18, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_1064:
		.4byte anim_data__1064_0
		.4byte anim_data__1064_1
		.4byte anim_data__1064_2
		.4byte anim_data__1064_3
		.4byte anim_data__1064_4
		.4byte anim_data__1064_5
		.4byte anim_data__1064_6




.align 2, 0
	anim_data__1065_0:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2875D, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1065_1:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28783, 0x26, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1065_2:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x287A9, 0x1A, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1065_3:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x287C3, 0x16, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1065_4:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x287D9, 0x1C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1065_5:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x287F5, 0x22, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1065_6:
		.4byte	AnimCmd_GetPalette, 0x2C5, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28817, 0x16, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_1065:
		.4byte anim_data__1065_0
		.4byte anim_data__1065_1
		.4byte anim_data__1065_2
		.4byte anim_data__1065_3
		.4byte anim_data__1065_4
		.4byte anim_data__1065_5
		.4byte anim_data__1065_6




.align 2, 0
	anim_data__1066_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2882D, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1066:
		.4byte anim_data__1066_0




.align 2, 0
	anim_data__1067_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x28855, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1067:
		.4byte anim_data__1067_0




.align 2, 0
	anim_data__1068_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2887D, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1068:
		.4byte anim_data__1068_0




.align 2, 0
	anim_data__1069_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x288A5, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1069:
		.4byte anim_data__1069_0




.align 2, 0
	anim_data__1070_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x288CD, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1070:
		.4byte anim_data__1070_0




.align 2, 0
	anim_data__1071_0:
		.4byte	AnimCmd_GetPalette, 0x5D, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x288F5, 0x28, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1071:
		.4byte anim_data__1071_0




.align 2, 0
	anim_data__1072_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2891D, 0x16, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1072_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x28933, 0x8, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1072:
		.4byte anim_data__1072_0
		.4byte anim_data__1072_1




.align 2, 0
	anim_data__1073_0:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2893B, 0x32, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1073_1:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2896D, 0x26, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1073_2:
		.4byte	AnimCmd_GetPalette, 0x2CA, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x28993, 0x20, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1073_3:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x289B3, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1073_4:
		.4byte	AnimCmd_GetPalette, 0x2C9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28A5B, 0xA8, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1073:
		.4byte anim_data__1073_0
		.4byte anim_data__1073_1
		.4byte anim_data__1073_2
		.4byte anim_data__1073_3
		.4byte anim_data__1073_4




.align 2, 0
	anim_data__1074_0:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28B03, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1074_1:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28B5D, 0x33, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1074_2:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28B90, 0x39, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1074_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28BC9, 0x42, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1074_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28C0B, 0x42, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1074_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28C4D, 0x42, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1074_6:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28C8F, 0xF, 0x1, 0x6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_7:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28C9E, 0x1E, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_8:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28CBC, 0x4, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_9:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28CC0, 0x4, 0x1, 0x9
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_10:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28CC4, 0x4, 0x1, 0xA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_11:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28CC8, 0x1E, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__1074_12:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28CE6, 0x42, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__1074_13:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28D28, 0x6, 0x1, 0xD
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_14:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28D2E, 0x8, 0x1, 0xE
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_15:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28D36, 0x8, 0x1, 0xF
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_16:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28D3E, 0x8, 0x1, 0x10
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1074_17:
		.4byte	AnimCmd_GetPalette, 0x2CF, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x28D46, 0xC, 0x1, 0x11
		.4byte	AnimCmd_4
	anim_data__1074_18:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28D52, 0x12, 0x1, 0x12
		.4byte	AnimCmd_4

.align 2, 0
	anim_1074:
		.4byte anim_data__1074_0
		.4byte anim_data__1074_1
		.4byte anim_data__1074_2
		.4byte anim_data__1074_3
		.4byte anim_data__1074_4
		.4byte anim_data__1074_5
		.4byte anim_data__1074_6
		.4byte anim_data__1074_7
		.4byte anim_data__1074_8
		.4byte anim_data__1074_9
		.4byte anim_data__1074_10
		.4byte anim_data__1074_11
		.4byte anim_data__1074_12
		.4byte anim_data__1074_13
		.4byte anim_data__1074_14
		.4byte anim_data__1074_15
		.4byte anim_data__1074_16
		.4byte anim_data__1074_17
		.4byte anim_data__1074_18




.align 2, 0
	anim_data__1075_0:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x28D64, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1075_1:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x28D94, 0x30, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1075:
		.4byte anim_data__1075_0
		.4byte anim_data__1075_1




.align 2, 0
	anim_data__1076_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28DC4, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1076_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28DF2, 0x2A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1076_2:
		.4byte	AnimCmd_GetPalette, 0x2D1, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x28E1C, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1076_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E28, 0x12, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1076_4:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E3A, 0x6, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1076_5:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E40, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1076_6:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E48, 0x8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1076_7:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E50, 0x8, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1076_8:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E58, 0x8, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1076_9:
		.4byte	AnimCmd_GetPalette, 0xA1, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x28E60, 0x1, 0x4, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x28E61, 0x1, 0x4, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x28E62, 0x1, 0x4, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x28E63, 0x1, 0x4, 0xC
		.4byte	AnimCmd_JumpBack, 0x17
	anim_data__1076_10:
		.4byte	AnimCmd_GetPalette, 0x2D1, 0x100010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4

.align 2, 0
	anim_1076:
		.4byte anim_data__1076_0
		.4byte anim_data__1076_1
		.4byte anim_data__1076_2
		.4byte anim_data__1076_3
		.4byte anim_data__1076_4
		.4byte anim_data__1076_5
		.4byte anim_data__1076_6
		.4byte anim_data__1076_7
		.4byte anim_data__1076_8
		.4byte anim_data__1076_9
		.4byte anim_data__1076_10




.align 2, 0
	anim_data__1077_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E64, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1077_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E6A, 0x6, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1077_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E70, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1077_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E7C, 0x8, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1077_4:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E84, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1077_5:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E8C, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1077_6:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E94, 0x8, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1077_7:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28E9C, 0xC, 0x1, 0x7
		.4byte	AnimCmd_4

.align 2, 0
	anim_1077:
		.4byte anim_data__1077_0
		.4byte anim_data__1077_1
		.4byte anim_data__1077_2
		.4byte anim_data__1077_3
		.4byte anim_data__1077_4
		.4byte anim_data__1077_5
		.4byte anim_data__1077_6
		.4byte anim_data__1077_7




.align 2, 0
	anim_data__1078_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EA8, 0x4, 0x1, 0x0
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EAC, 0x2, 0x1, 0x1
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EAE, 0x4, 0x1, 0x2
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EB2, 0x4, 0x1, 0x3
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_4:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EB6, 0x4, 0x1, 0x4
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_5:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EBA, 0x4, 0x1, 0x5
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_6:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EBE, 0x4, 0x1, 0x6
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_7:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EC2, 0x4, 0x1, 0x7
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_8:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28EC6, 0x4, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1078_9:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x28ECA, 0x4, 0x1, 0x9
		.4byte	AnimCmd_JumpBack, 0x8

.align 2, 0
	anim_1078:
		.4byte anim_data__1078_0
		.4byte anim_data__1078_1
		.4byte anim_data__1078_2
		.4byte anim_data__1078_3
		.4byte anim_data__1078_4
		.4byte anim_data__1078_5
		.4byte anim_data__1078_6
		.4byte anim_data__1078_7
		.4byte anim_data__1078_8
		.4byte anim_data__1078_9




.align 2, 0
	anim_data__1079_0:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28ECE, 0x54, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1079_1:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28F22, 0x4B, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1079_2:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28F6D, 0x30, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1079_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28F9D, 0x44, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1079_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x28FE1, 0x44, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1079_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29025, 0x44, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1079_6:
		.4byte	AnimCmd_GetPalette, 0x2D3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x29069, 0xA, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1079_7:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29073, 0xA, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1079_8:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2907D, 0x24, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1079_9:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x290A1, 0x32, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1079:
		.4byte anim_data__1079_0
		.4byte anim_data__1079_1
		.4byte anim_data__1079_2
		.4byte anim_data__1079_3
		.4byte anim_data__1079_4
		.4byte anim_data__1079_5
		.4byte anim_data__1079_6
		.4byte anim_data__1079_7
		.4byte anim_data__1079_8
		.4byte anim_data__1079_9




.align 2, 0
	anim_data__1080_0:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x290D3, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1080_1:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2912D, 0x4B, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1080_2:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29178, 0x45, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1080_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x291BD, 0x58, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1080_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29215, 0x58, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1080_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2926D, 0x58, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1080_6:
		.4byte	AnimCmd_GetPalette, 0x2D3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x292C5, 0xF, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1080_7:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x292D4, 0x15, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1080_8:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x292E9, 0x2A, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1080_9:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29313, 0x33, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1080:
		.4byte anim_data__1080_0
		.4byte anim_data__1080_1
		.4byte anim_data__1080_2
		.4byte anim_data__1080_3
		.4byte anim_data__1080_4
		.4byte anim_data__1080_5
		.4byte anim_data__1080_6
		.4byte anim_data__1080_7
		.4byte anim_data__1080_8
		.4byte anim_data__1080_9




.align 2, 0
	anim_data__1081_0:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29346, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1081_1:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x293A0, 0x39, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1081_2:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x293D9, 0x27, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1081_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29400, 0x3C, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1081_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2943C, 0x3C, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1081_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29478, 0x3C, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1081_6:
		.4byte	AnimCmd_GetPalette, 0x2D3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x294B4, 0x12, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1081_7:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x294C6, 0x12, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1081_8:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x294D8, 0x45, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1081_9:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2951D, 0x45, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1081:
		.4byte anim_data__1081_0
		.4byte anim_data__1081_1
		.4byte anim_data__1081_2
		.4byte anim_data__1081_3
		.4byte anim_data__1081_4
		.4byte anim_data__1081_5
		.4byte anim_data__1081_6
		.4byte anim_data__1081_7
		.4byte anim_data__1081_8
		.4byte anim_data__1081_9




.align 2, 0
	anim_data__1082_0:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29562, 0x5A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1082_1:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x295BC, 0x2D, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1082_2:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x295E9, 0x45, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1082_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2962E, 0x44, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1082_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29672, 0x44, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1082_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x296B6, 0x44, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1082_6:
		.4byte	AnimCmd_GetPalette, 0x2D3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x296FA, 0x9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1082_7:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29703, 0xF, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1082_8:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29712, 0x2E, 0x1, 0x8
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1082_9:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29740, 0x33, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1082:
		.4byte anim_data__1082_0
		.4byte anim_data__1082_1
		.4byte anim_data__1082_2
		.4byte anim_data__1082_3
		.4byte anim_data__1082_4
		.4byte anim_data__1082_5
		.4byte anim_data__1082_6
		.4byte anim_data__1082_7
		.4byte anim_data__1082_8
		.4byte anim_data__1082_9




.align 2, 0
	anim_data__1083_0:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29773, 0x2D, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1083_1:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x297A0, 0x33, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1083_2:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x297D3, 0x45, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1083_3:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29818, 0x3C, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1083_4:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29854, 0x40, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1083_5:
		.4byte	AnimCmd_GetPalette, 0x2CD, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x29894, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1083_6:
		.4byte	AnimCmd_GetPalette, 0x2D3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x298D4, 0x9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1083_7:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x298DD, 0xF, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1083_8:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x298EC, 0x3F, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1083_9:
		.4byte	AnimCmd_GetPalette, 0x2D2, 0x700010
		.4byte	AnimCmd_GetTileIndex, 0x2992B, 0x33, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1083:
		.4byte anim_data__1083_0
		.4byte anim_data__1083_1
		.4byte anim_data__1083_2
		.4byte anim_data__1083_3
		.4byte anim_data__1083_4
		.4byte anim_data__1083_5
		.4byte anim_data__1083_6
		.4byte anim_data__1083_7
		.4byte anim_data__1083_8
		.4byte anim_data__1083_9




.align 2, 0
	anim_data__1084_0:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2995E, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1084_1:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29984, 0x2E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1084_2:
		.4byte	AnimCmd_GetPalette, 0x2D5, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x299B2, 0xE, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1084_3:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x299C0, 0xA, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1084:
		.4byte anim_data__1084_0
		.4byte anim_data__1084_1
		.4byte anim_data__1084_2
		.4byte anim_data__1084_3




.align 2, 0
	anim_data__1085_0:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x299CA, 0x39, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1085_1:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29A03, 0x2E, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1085_2:
		.4byte	AnimCmd_GetPalette, 0x2D5, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29A31, 0xA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1085_3:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29A3B, 0xE, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1085:
		.4byte anim_data__1085_0
		.4byte anim_data__1085_1
		.4byte anim_data__1085_2
		.4byte anim_data__1085_3




.align 2, 0
	anim_data__1086_0:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29A49, 0x33, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1086_1:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29A7C, 0x48, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1086_2:
		.4byte	AnimCmd_GetPalette, 0x2D5, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29AC4, 0xA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1086_3:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29ACE, 0xE, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1086:
		.4byte anim_data__1086_0
		.4byte anim_data__1086_1
		.4byte anim_data__1086_2
		.4byte anim_data__1086_3




.align 2, 0
	anim_data__1087_0:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29ADC, 0x4B, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1087_1:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29B27, 0x45, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1087_2:
		.4byte	AnimCmd_GetPalette, 0x2D5, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29B6C, 0x9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1087_3:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29B75, 0xF, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1087:
		.4byte anim_data__1087_0
		.4byte anim_data__1087_1
		.4byte anim_data__1087_2
		.4byte anim_data__1087_3




.align 2, 0
	anim_data__1088_0:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29B84, 0x48, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1088_1:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29BCC, 0x4B, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1088_2:
		.4byte	AnimCmd_GetPalette, 0x2D5, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29C17, 0x6, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1088_3:
		.4byte	AnimCmd_GetPalette, 0x2D4, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C1D, 0xA, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1088:
		.4byte anim_data__1088_0
		.4byte anim_data__1088_1
		.4byte anim_data__1088_2
		.4byte anim_data__1088_3




.align 2, 0
	anim_data__1089_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C27, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1089_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C2D, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1089_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C37, 0xA, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1089_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C41, 0x6, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1089_4:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C47, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1089_5:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C4F, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1089_6:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C57, 0x8, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_1089:
		.4byte anim_data__1089_0
		.4byte anim_data__1089_1
		.4byte anim_data__1089_2
		.4byte anim_data__1089_3
		.4byte anim_data__1089_4
		.4byte anim_data__1089_5
		.4byte anim_data__1089_6




.align 2, 0
	anim_data__1090_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C5F, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1090_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C67, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1090_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C71, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1090:
		.4byte anim_data__1090_0
		.4byte anim_data__1090_1
		.4byte anim_data__1090_2




.align 2, 0
	anim_data__1091_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C7D, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1091_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C89, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1091_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C95, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1091:
		.4byte anim_data__1091_0
		.4byte anim_data__1091_1
		.4byte anim_data__1091_2




.align 2, 0
	anim_data__1092_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29C9D, 0xC, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1092_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CA9, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1092_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CB5, 0xA, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1092:
		.4byte anim_data__1092_0
		.4byte anim_data__1092_1
		.4byte anim_data__1092_2




.align 2, 0
	anim_data__1093_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CBF, 0xA, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1093_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CC9, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1093_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CD3, 0x8, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1093:
		.4byte anim_data__1093_0
		.4byte anim_data__1093_1
		.4byte anim_data__1093_2




.align 2, 0
	anim_data__1094_0:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29CDB, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1094_1:
		.4byte	AnimCmd_GetPalette, 0x2D7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29CFF, 0x26, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1094_2:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29D25, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1094_3:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29DCD, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1094:
		.4byte anim_data__1094_0
		.4byte anim_data__1094_1
		.4byte anim_data__1094_2
		.4byte anim_data__1094_3




.align 2, 0
	anim_data__1095_0:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29E75, 0x22, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1095_1:
		.4byte	AnimCmd_GetPalette, 0x2D8, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x29E97, 0x1C, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1095_2:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29EB3, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1095_3:
		.4byte	AnimCmd_GetPalette, 0x2D6, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x29F5B, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1095:
		.4byte anim_data__1095_0
		.4byte anim_data__1095_1
		.4byte anim_data__1095_2
		.4byte anim_data__1095_3




.align 2, 0
	anim_data__1096_0:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A003, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1096_1:
		.4byte	AnimCmd_GetPalette, 0x2D7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2A027, 0x20, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1096_2:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A047, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1096_3:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A0EF, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1096:
		.4byte anim_data__1096_0
		.4byte anim_data__1096_1
		.4byte anim_data__1096_2
		.4byte anim_data__1096_3




.align 2, 0
	anim_data__1097_0:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A197, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1097_1:
		.4byte	AnimCmd_GetPalette, 0x2D7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2A1BB, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1097_2:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A1DF, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1097_3:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A287, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1097:
		.4byte anim_data__1097_0
		.4byte anim_data__1097_1
		.4byte anim_data__1097_2
		.4byte anim_data__1097_3




.align 2, 0
	anim_data__1098_0:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A32F, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1098_1:
		.4byte	AnimCmd_GetPalette, 0x2D7, 0x100010
		.4byte	AnimCmd_GetTileIndex, 0x2A353, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1098_2:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A377, 0xA8, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1098_3:
		.4byte	AnimCmd_GetPalette, 0x2D9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2A41F, 0xA8, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1098:
		.4byte anim_data__1098_0
		.4byte anim_data__1098_1
		.4byte anim_data__1098_2
		.4byte anim_data__1098_3




.align 2, 0
	anim_data__1099_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4C7, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1099_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4CD, 0x6, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1099_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4D3, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1099_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4DF, 0xC, 0x1, 0x3
		.4byte	AnimCmd_4

.align 2, 0
	anim_1099:
		.4byte anim_data__1099_0
		.4byte anim_data__1099_1
		.4byte anim_data__1099_2
		.4byte anim_data__1099_3




.align 2, 0
	anim_data__1100_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4EB, 0x6, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1100_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4F1, 0xA, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1100_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2A4FB, 0xA, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1100:
		.4byte anim_data__1100_0
		.4byte anim_data__1100_1
		.4byte anim_data__1100_2




.align 2, 0
	anim_data__1101_0:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A505, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1101_1:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A50D, 0x8, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1101_2:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A515, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1101_3:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A521, 0x8, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1101_4:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A529, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1101_5:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A531, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1101_6:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A539, 0x8, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_1101:
		.4byte anim_data__1101_0
		.4byte anim_data__1101_1
		.4byte anim_data__1101_2
		.4byte anim_data__1101_3
		.4byte anim_data__1101_4
		.4byte anim_data__1101_5
		.4byte anim_data__1101_6




.align 2, 0
	anim_data__1102_0:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A541, 0x8, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1102_1:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A549, 0xC, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1102_2:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A555, 0xC, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1102_3:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A561, 0x8, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1102_4:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A569, 0x8, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1102_5:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A571, 0x8, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1102_6:
		.4byte	AnimCmd_GetPalette, 0x2DA, 0x900010
		.4byte	AnimCmd_GetTileIndex, 0x2A579, 0x8, 0x1, 0x6
		.4byte	AnimCmd_4

.align 2, 0
	anim_1102:
		.4byte anim_data__1102_0
		.4byte anim_data__1102_1
		.4byte anim_data__1102_2
		.4byte anim_data__1102_3
		.4byte anim_data__1102_4
		.4byte anim_data__1102_5
		.4byte anim_data__1102_6




.align 2, 0
	anim_data__1103_0:
		.4byte	AnimCmd_GetPalette, 0x2DB, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A581, 0x30, 0x3, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2A5B1, 0x30, 0x3, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2A5E1, 0x30, 0x3, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2A611, 0x30, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2A641, 0x30, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2A671, 0x30, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2A6A1, 0x2A, 0x3, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2A6CB, 0x31, 0x3, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2A6FC, 0x38, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2A734, 0x38, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2A76C, 0x38, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2A7A4, 0x38, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2A7DC, 0x38, 0x3, 0xC
		.4byte	AnimCmd_4
	anim_data__1103_1:
		.4byte	AnimCmd_GetPalette, 0x2DB, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A7A4, 0x38, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2A76C, 0x38, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2A814, 0x38, 0x3, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2A76C, 0x38, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2A7A4, 0x38, 0x3, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2A7DC, 0x38, 0x3, 0xC
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_1103:
		.4byte anim_data__1103_0
		.4byte anim_data__1103_1




.align 2, 0
	anim_data__1104_0:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A84C, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1104_1:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A87C, 0x30, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1104_2:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A8AC, 0x30, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1104_3:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A8DC, 0x30, 0x3, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2A90C, 0x30, 0x3, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2A93C, 0x30, 0x3, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2A96C, 0x30, 0x3, 0x6
		.4byte	AnimCmd_4
	anim_data__1104_4:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A99C, 0x30, 0x3, 0x7
		.4byte	AnimCmd_4
	anim_data__1104_5:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2A9CC, 0x30, 0x3, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2A9FC, 0x30, 0x3, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2AA2C, 0x30, 0x3, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2AA5C, 0x30, 0x3, 0xB
		.4byte	AnimCmd_4
	anim_data__1104_6:
		.4byte	AnimCmd_GetPalette, 0x2D0, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2AA8C, 0x30, 0x3, 0xC
		.4byte	AnimCmd_4

.align 2, 0
	anim_1104:
		.4byte anim_data__1104_0
		.4byte anim_data__1104_1
		.4byte anim_data__1104_2
		.4byte anim_data__1104_3
		.4byte anim_data__1104_4
		.4byte anim_data__1104_5
		.4byte anim_data__1104_6




.align 2, 0
	anim_data__1105_0:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AABC, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1105_1:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAC0, 0x2, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1105_2:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAC2, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1105_3:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAC6, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1105_4:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AACA, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1105_5:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AACE, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1105_6:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAD2, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1105_7:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAD6, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1105_8:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AADA, 0x4, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1105_9:
		.4byte	AnimCmd_GetPalette, 0x2CE, 0xA00010
		.4byte	AnimCmd_GetTileIndex, 0x2AADE, 0x4, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1105:
		.4byte anim_data__1105_0
		.4byte anim_data__1105_1
		.4byte anim_data__1105_2
		.4byte anim_data__1105_3
		.4byte anim_data__1105_4
		.4byte anim_data__1105_5
		.4byte anim_data__1105_6
		.4byte anim_data__1105_7
		.4byte anim_data__1105_8
		.4byte anim_data__1105_9




.align 2, 0
	anim_data__1106_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2AAE2, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1106:
		.4byte anim_data__1106_0




.align 2, 0
	anim_data__1107_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2AB10, 0x22, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1107:
		.4byte anim_data__1107_0




.align 2, 0
	anim_data__1108_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2AB32, 0x2E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1108:
		.4byte anim_data__1108_0




.align 2, 0
	anim_data__1109_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2AB60, 0x26, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1109:
		.4byte anim_data__1109_0




.align 2, 0
	anim_data__1110_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2AB86, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1110:
		.4byte anim_data__1110_0




.align 2, 0
	anim_data__1111_0:
		.4byte	AnimCmd_GetPalette, 0xE5, 0xB00010
		.4byte	AnimCmd_GetTileIndex, 0x2ABA4, 0x1E, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1111:
		.4byte anim_data__1111_0




.align 2, 0
	anim_data__1112_0:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ABC2, 0x12, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1112_1:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ABD4, 0x12, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1112_2:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ABE6, 0x12, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1112_3:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ABF8, 0x12, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1112_4:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2AC0A, 0x12, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1112:
		.4byte anim_data__1112_0
		.4byte anim_data__1112_1
		.4byte anim_data__1112_2
		.4byte anim_data__1112_3
		.4byte anim_data__1112_4




.align 2, 0
	anim_data__1113_0:
		.4byte	AnimCmd_GetPalette, 0x2DD, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x2AC1C, 0x54, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1113_1:
		.4byte	AnimCmd_GetPalette, 0x2DD, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x2AC70, 0x54, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1113_2:
		.4byte	AnimCmd_GetPalette, 0x2DD, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x2ACC4, 0x54, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1113_3:
		.4byte	AnimCmd_GetPalette, 0x2DD, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x2AD18, 0x54, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1113_4:
		.4byte	AnimCmd_GetPalette, 0x2DD, 0xC00010
		.4byte	AnimCmd_GetTileIndex, 0x2AD6C, 0x54, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1113:
		.4byte anim_data__1113_0
		.4byte anim_data__1113_1
		.4byte anim_data__1113_2
		.4byte anim_data__1113_3
		.4byte anim_data__1113_4




.align 2, 0
	anim_data__1114_0:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2ADC0, 0x9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1114_1:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2ADC9, 0x9, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1114_2:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2ADD2, 0x9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1114_3:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2ADDB, 0x9, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1114_4:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x800010
		.4byte	AnimCmd_GetTileIndex, 0x2ADE4, 0x9, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1114:
		.4byte anim_data__1114_0
		.4byte anim_data__1114_1
		.4byte anim_data__1114_2
		.4byte anim_data__1114_3
		.4byte anim_data__1114_4




.align 2, 0
	anim_data__1115_0:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ADED, 0x24, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1115_1:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2ADED, 0x24, 0x1, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2AE11, 0x24, 0x1, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2AE35, 0x24, 0x1, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2AE59, 0x24, 0x1, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2AE7D, 0x24, 0x1, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2AEA1, 0x24, 0x1, 0x5
		.4byte	AnimCmd_GetTileIndex, 0x2AEC5, 0x24, 0x1, 0x6
		.4byte	AnimCmd_GetTileIndex, 0x2AEE9, 0x1E, 0x1, 0x7
		.4byte	AnimCmd_GetTileIndex, 0x2AF07, 0x1E, 0x1, 0x8
		.4byte	AnimCmd_GetTileIndex, 0x2AF25, 0x1E, 0x1, 0x9
		.4byte	AnimCmd_GetTileIndex, 0x2AF43, 0x1E, 0x1, 0xA
		.4byte	AnimCmd_GetTileIndex, 0x2AF61, 0x1E, 0x1, 0xB
		.4byte	AnimCmd_GetTileIndex, 0x2AF7F, 0x19, 0x1, 0xC
		.4byte	AnimCmd_GetTileIndex, 0x2AF98, 0x19, 0x1, 0xD
		.4byte	AnimCmd_GetTileIndex, 0x2AFB1, 0x19, 0x1, 0xE
		.4byte	AnimCmd_GetTileIndex, 0x2AFCA, 0x19, 0x1, 0xF
		.4byte	AnimCmd_GetTileIndex, 0x2AFE3, 0x19, 0x1, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2AFFC, 0x14, 0x1, 0x11
		.4byte	AnimCmd_GetTileIndex, 0x2B010, 0x14, 0x1, 0x12
		.4byte	AnimCmd_GetTileIndex, 0x2B024, 0x14, 0x1, 0x13
		.4byte	AnimCmd_GetTileIndex, 0x2B038, 0x14, 0x1, 0x14
		.4byte	AnimCmd_GetTileIndex, 0x2B04C, 0x14, 0x1, 0x15
		.4byte	AnimCmd_GetTileIndex, 0x2B060, 0x19, 0x1, 0x16
		.4byte	AnimCmd_GetTileIndex, 0x2B079, 0x19, 0x1, 0x17
		.4byte	AnimCmd_GetTileIndex, 0x2B092, 0x19, 0x1, 0x18
		.4byte	AnimCmd_GetTileIndex, 0x2B0AB, 0x19, 0x1, 0x19
		.4byte	AnimCmd_GetTileIndex, 0x2B0C4, 0x19, 0x1, 0x1A
		.4byte	AnimCmd_GetTileIndex, 0x2B0DD, 0x1E, 0x1, 0x1B
		.4byte	AnimCmd_GetTileIndex, 0x2B0FB, 0x1E, 0x1, 0x1C
		.4byte	AnimCmd_GetTileIndex, 0x2B119, 0x1E, 0x1, 0x1D
		.4byte	AnimCmd_GetTileIndex, 0x2B137, 0x1E, 0x1, 0x1E
		.4byte	AnimCmd_GetTileIndex, 0x2B155, 0x1E, 0x1, 0x1F
		.4byte	AnimCmd_GetTileIndex, 0x2B173, 0x24, 0x1, 0x20
		.4byte	AnimCmd_GetTileIndex, 0x2B197, 0x24, 0x1, 0x21
		.4byte	AnimCmd_GetTileIndex, 0x2B1BB, 0x24, 0x1, 0x22
		.4byte	AnimCmd_GetTileIndex, 0x2B1DF, 0x24, 0x1, 0x23
		.4byte	AnimCmd_GetTileIndex, 0x2B203, 0x24, 0x1, 0x24
		.4byte	AnimCmd_GetTileIndex, 0x2B227, 0x24, 0x1, 0x25
		.4byte	AnimCmd_JumpBack, 0xC1

.align 2, 0
	anim_1115:
		.4byte anim_data__1115_0
		.4byte anim_data__1115_1




.align 2, 0
	anim_data__1116_0:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B24B, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1116_1:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B28B, 0x40, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1116_2:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B2CB, 0x40, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1116_3:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B30B, 0x40, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1116_4:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B34B, 0x40, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1116_5:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B38B, 0x40, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1116_6:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B3CB, 0x40, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1116_7:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B40B, 0x40, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1116_8:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B44B, 0x40, 0x1, 0x8
		.4byte	AnimCmd_4

.align 2, 0
	anim_1116:
		.4byte anim_data__1116_0
		.4byte anim_data__1116_1
		.4byte anim_data__1116_2
		.4byte anim_data__1116_3
		.4byte anim_data__1116_4
		.4byte anim_data__1116_5
		.4byte anim_data__1116_6
		.4byte anim_data__1116_7
		.4byte anim_data__1116_8




.align 2, 0
	anim_data__1117_0:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B48B, 0x23, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1117_1:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B4AE, 0x14, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1117_2:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B4C2, 0x14, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1117_3:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B4D6, 0x23, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1117_4:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B4F9, 0x23, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1117_5:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B51C, 0x14, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1117_6:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B530, 0x14, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1117_7:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B544, 0x23, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1117_8:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B567, 0x23, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1117_9:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B58A, 0x14, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__1117_10:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B59E, 0x14, 0x1, 0xA
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1117_11:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B5B2, 0x23, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__1117_12:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B5D5, 0x23, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__1117_13:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B5F8, 0x14, 0x1, 0xD
		.4byte	AnimCmd_4
	anim_data__1117_14:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B60C, 0x14, 0x1, 0xE
		.4byte	AnimCmd_4
	anim_data__1117_15:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B620, 0x23, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__1117_16:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B643, 0x23, 0x1, 0x10
		.4byte	AnimCmd_4
	anim_data__1117_17:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B666, 0x14, 0x1, 0x11
		.4byte	AnimCmd_4
	anim_data__1117_18:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B67A, 0x14, 0x1, 0x12
		.4byte	AnimCmd_4
	anim_data__1117_19:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B68E, 0x23, 0x1, 0x13
		.4byte	AnimCmd_JumpBack, 0x8
	anim_data__1117_20:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B6B1, 0x23, 0x1, 0x14
		.4byte	AnimCmd_4
	anim_data__1117_21:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B6D4, 0x14, 0x1, 0x15
		.4byte	AnimCmd_4
	anim_data__1117_22:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B6E8, 0x14, 0x1, 0x16
		.4byte	AnimCmd_4
	anim_data__1117_23:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B6FC, 0x23, 0x1, 0x17
		.4byte	AnimCmd_4
	anim_data__1117_24:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B71F, 0x23, 0x1, 0x18
		.4byte	AnimCmd_4
	anim_data__1117_25:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B742, 0x14, 0x1, 0x19
		.4byte	AnimCmd_4
	anim_data__1117_26:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B756, 0x14, 0x1, 0x1A
		.4byte	AnimCmd_4
	anim_data__1117_27:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B76A, 0x23, 0x1, 0x1B
		.4byte	AnimCmd_4
	anim_data__1117_28:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B78D, 0x19, 0x1, 0x1C
		.4byte	AnimCmd_4
	anim_data__1117_29:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__1117_30:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__1117_31:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__1117_32:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B7A6, 0x23, 0x1, 0x1D
		.4byte	AnimCmd_4
	anim_data__1117_33:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B7C9, 0x14, 0x1, 0x1E
		.4byte	AnimCmd_4
	anim_data__1117_34:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B7DD, 0x14, 0x1, 0x1F
		.4byte	AnimCmd_4
	anim_data__1117_35:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B7F1, 0x23, 0x1, 0x20
		.4byte	AnimCmd_4
	anim_data__1117_36:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B814, 0x23, 0x1, 0x21
		.4byte	AnimCmd_4
	anim_data__1117_37:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B837, 0x14, 0x1, 0x22
		.4byte	AnimCmd_4
	anim_data__1117_38:
		.4byte	AnimCmd_GetPalette, 0x2DE, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B84B, 0x14, 0x1, 0x23
		.4byte	AnimCmd_4
	anim_data__1117_39:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B85F, 0x23, 0x1, 0x24
		.4byte	AnimCmd_4

.align 2, 0
	anim_1117:
		.4byte anim_data__1117_0
		.4byte anim_data__1117_1
		.4byte anim_data__1117_2
		.4byte anim_data__1117_3
		.4byte anim_data__1117_4
		.4byte anim_data__1117_5
		.4byte anim_data__1117_6
		.4byte anim_data__1117_7
		.4byte anim_data__1117_8
		.4byte anim_data__1117_9
		.4byte anim_data__1117_10
		.4byte anim_data__1117_11
		.4byte anim_data__1117_12
		.4byte anim_data__1117_13
		.4byte anim_data__1117_14
		.4byte anim_data__1117_15
		.4byte anim_data__1117_16
		.4byte anim_data__1117_17
		.4byte anim_data__1117_18
		.4byte anim_data__1117_19
		.4byte anim_data__1117_20
		.4byte anim_data__1117_21
		.4byte anim_data__1117_22
		.4byte anim_data__1117_23
		.4byte anim_data__1117_24
		.4byte anim_data__1117_25
		.4byte anim_data__1117_26
		.4byte anim_data__1117_27
		.4byte anim_data__1117_28
		.4byte anim_data__1117_29
		.4byte anim_data__1117_30
		.4byte anim_data__1117_31
		.4byte anim_data__1117_32
		.4byte anim_data__1117_33
		.4byte anim_data__1117_34
		.4byte anim_data__1117_35
		.4byte anim_data__1117_36
		.4byte anim_data__1117_37
		.4byte anim_data__1117_38
		.4byte anim_data__1117_39




.align 2, 0
	anim_data__1118_0:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B882, 0x9, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1118_1:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B88B, 0x9, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1118_2:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B894, 0x9, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1118_3:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B89D, 0x9, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1118_4:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8A6, 0x9, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1118_5:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8AF, 0x9, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1118_6:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8B8, 0x9, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1118_7:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8C1, 0x9, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1118_8:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8CA, 0x9, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1118_9:
		.4byte	AnimCmd_GetPalette, 0x2DC, 0xF00010
		.4byte	AnimCmd_GetTileIndex, 0x2B8D3, 0x9, 0x1, 0x9
		.4byte	AnimCmd_4

.align 2, 0
	anim_1118:
		.4byte anim_data__1118_0
		.4byte anim_data__1118_1
		.4byte anim_data__1118_2
		.4byte anim_data__1118_3
		.4byte anim_data__1118_4
		.4byte anim_data__1118_5
		.4byte anim_data__1118_6
		.4byte anim_data__1118_7
		.4byte anim_data__1118_8
		.4byte anim_data__1118_9




.align 2, 0
	anim_data__1119_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010, 0x1
		.4byte	AnimCmd_GetTileIndex
		.4byte	AnimCmd_4
	anim_data__1119_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8DC, 0x2, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1119_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8DE, 0x1, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1119_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8DF, 0x2, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1119_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8E1, 0x2, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1119_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8E3, 0x2, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1119_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8E5, 0x2, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1119_7:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8E7, 0x1, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1119_8:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8E8, 0x2, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1119_9:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8EA, 0x2, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1119_10:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8EC, 0x2, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__1119_11:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8EE, 0x2, 0x1, 0xA
		.4byte	AnimCmd_4
	anim_data__1119_12:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F0, 0x1, 0x1, 0xB
		.4byte	AnimCmd_4
	anim_data__1119_13:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F1, 0x1, 0x1, 0xC
		.4byte	AnimCmd_4
	anim_data__1119_14:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F2, 0x1, 0x1, 0xD
		.4byte	AnimCmd_4
	anim_data__1119_15:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F3, 0x2, 0x1, 0xE
		.4byte	AnimCmd_4
	anim_data__1119_16:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F5, 0x2, 0x1, 0xF
		.4byte	AnimCmd_4
	anim_data__1119_17:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F7, 0x2, 0x1, 0x10
		.4byte	AnimCmd_4
	anim_data__1119_18:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8F9, 0x2, 0x1, 0x11
		.4byte	AnimCmd_4
	anim_data__1119_19:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8FB, 0x2, 0x1, 0x12
		.4byte	AnimCmd_4
	anim_data__1119_20:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8FD, 0x2, 0x1, 0x13
		.4byte	AnimCmd_4
	anim_data__1119_21:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B8FF, 0x2, 0x1, 0x14
		.4byte	AnimCmd_4
	anim_data__1119_22:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B901, 0x2, 0x1, 0x15
		.4byte	AnimCmd_4
	anim_data__1119_23:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B903, 0x2, 0x1, 0x16
		.4byte	AnimCmd_4
	anim_data__1119_24:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B905, 0x2, 0x1, 0x17
		.4byte	AnimCmd_4
	anim_data__1119_25:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B907, 0x2, 0x1, 0x18
		.4byte	AnimCmd_4
	anim_data__1119_26:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B909, 0x2, 0x1, 0x19
		.4byte	AnimCmd_4
	anim_data__1119_27:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B90B, 0x2, 0x1, 0x1A
		.4byte	AnimCmd_4
	anim_data__1119_28:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B90D, 0x2, 0x1, 0x1B
		.4byte	AnimCmd_4
	anim_data__1119_29:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B90F, 0x2, 0x1, 0x1C
		.4byte	AnimCmd_4
	anim_data__1119_30:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B911, 0x2, 0x1, 0x1D
		.4byte	AnimCmd_4
	anim_data__1119_31:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B913, 0x2, 0x1, 0x1E
		.4byte	AnimCmd_4
	anim_data__1119_32:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B915, 0x2, 0x1, 0x1F
		.4byte	AnimCmd_4
	anim_data__1119_33:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B917, 0x2, 0x1, 0x20
		.4byte	AnimCmd_4
	anim_data__1119_34:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B919, 0x2, 0x1, 0x21
		.4byte	AnimCmd_4
	anim_data__1119_35:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B91B, 0x2, 0x1, 0x22
		.4byte	AnimCmd_4
	anim_data__1119_36:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B91D, 0x2
		.4byte	AnimCmd_6, 0x0, 0xFF00FF00, 0x1, 0x23
		.4byte	AnimCmd_4
	anim_data__1119_37:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B91F, 0x2, 0x1, 0x24
		.4byte	AnimCmd_4
	anim_data__1119_38:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B921, 0x2, 0x1, 0x25
		.4byte	AnimCmd_4
	anim_data__1119_39:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B923, 0x2, 0x1, 0x26
		.4byte	AnimCmd_4
	anim_data__1119_40:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B925, 0x2, 0x1, 0x27
		.4byte	AnimCmd_4
	anim_data__1119_41:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B927, 0x2, 0x1, 0x28
		.4byte	AnimCmd_4
	anim_data__1119_42:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B929, 0x2, 0x1, 0x29
		.4byte	AnimCmd_4
	anim_data__1119_43:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B92B, 0x2, 0x1, 0x2A
		.4byte	AnimCmd_4
	anim_data__1119_44:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B92D, 0x2, 0x1, 0x2B
		.4byte	AnimCmd_4
	anim_data__1119_45:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B92F, 0x2, 0x1, 0x2C
		.4byte	AnimCmd_4
	anim_data__1119_46:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B931, 0x2, 0x1, 0x2D
		.4byte	AnimCmd_4
	anim_data__1119_47:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B933, 0x2, 0x1, 0x2E
		.4byte	AnimCmd_4
	anim_data__1119_48:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B935, 0x2, 0x1, 0x2F
		.4byte	AnimCmd_4
	anim_data__1119_49:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B937, 0x2, 0x1, 0x30
		.4byte	AnimCmd_4
	anim_data__1119_50:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B939, 0x2, 0x1, 0x31
		.4byte	AnimCmd_4
	anim_data__1119_51:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B93B, 0x2, 0x1, 0x32
		.4byte	AnimCmd_4
	anim_data__1119_52:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B93D, 0x2, 0x1, 0x33
		.4byte	AnimCmd_4
	anim_data__1119_53:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B93F, 0x2, 0x1, 0x34
		.4byte	AnimCmd_4
	anim_data__1119_54:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B941, 0x2, 0x1, 0x35
		.4byte	AnimCmd_4
	anim_data__1119_55:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B943, 0x2, 0x1, 0x36
		.4byte	AnimCmd_4
	anim_data__1119_56:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B945, 0x2, 0x1, 0x37
		.4byte	AnimCmd_4
	anim_data__1119_57:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B947, 0x2, 0x1, 0x38
		.4byte	AnimCmd_4
	anim_data__1119_58:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B949, 0x2, 0x1, 0x39
		.4byte	AnimCmd_4
	anim_data__1119_59:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B94B, 0x2, 0x1, 0x3A
		.4byte	AnimCmd_4
	anim_data__1119_60:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B94D, 0x2, 0x1, 0x3B
		.4byte	AnimCmd_4
	anim_data__1119_61:
		.4byte	AnimCmd_GetTileIndex, 0x2B94F, 0x2, 0x1, 0x3C
		.4byte	AnimCmd_JumpBack, 0x5
	anim_data__1119_62:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B951, 0x1, 0x1, 0x3D
		.4byte	AnimCmd_4
	anim_data__1119_63:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B952, 0x1, 0x1, 0x3E
		.4byte	AnimCmd_4
	anim_data__1119_64:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B953, 0x1, 0x1, 0x3F
		.4byte	AnimCmd_4
	anim_data__1119_65:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B954, 0x1, 0x1, 0x40
		.4byte	AnimCmd_4
	anim_data__1119_66:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B955, 0x1, 0x1, 0x41
		.4byte	AnimCmd_4
	anim_data__1119_67:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B956, 0x1, 0x1, 0x42
		.4byte	AnimCmd_4
	anim_data__1119_68:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B957, 0x1, 0x1, 0x43
		.4byte	AnimCmd_4
	anim_data__1119_69:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B958, 0x1, 0x1, 0x44
		.4byte	AnimCmd_4
	anim_data__1119_70:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B959, 0x1, 0x1, 0x45
		.4byte	AnimCmd_4
	anim_data__1119_71:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B95A, 0x2, 0x1, 0x46
		.4byte	AnimCmd_4
	anim_data__1119_72:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B95C, 0x1, 0x1, 0x47
		.4byte	AnimCmd_4
	anim_data__1119_73:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B95D, 0x1, 0x1, 0x48
		.4byte	AnimCmd_4
	anim_data__1119_74:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B95E, 0x2, 0x1, 0x49
		.4byte	AnimCmd_4
	anim_data__1119_75:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B960, 0x1
		.4byte	AnimCmd_6, 0x0, 0xD150D15, 0x1, 0x4A
		.4byte	AnimCmd_4
	anim_data__1119_76:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B961, 0x1, 0x1, 0x4B
		.4byte	AnimCmd_4
	anim_data__1119_77:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B962, 0x1, 0x1, 0x4C
		.4byte	AnimCmd_4
	anim_data__1119_78:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B963, 0x1, 0x1, 0x4D
		.4byte	AnimCmd_4
	anim_data__1119_79:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B964, 0x1, 0x1, 0x4E
		.4byte	AnimCmd_4
	anim_data__1119_80:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B965, 0x2, 0x1, 0x4F
		.4byte	AnimCmd_4
	anim_data__1119_81:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B967, 0x2, 0x1, 0x50
		.4byte	AnimCmd_4
	anim_data__1119_82:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B969, 0x1, 0x1, 0x51
		.4byte	AnimCmd_4
	anim_data__1119_83:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96A, 0x1, 0x1, 0x52
		.4byte	AnimCmd_4
	anim_data__1119_84:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96B, 0x1, 0x1, 0x53
		.4byte	AnimCmd_4
	anim_data__1119_85:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96C, 0x1, 0x1, 0x54
		.4byte	AnimCmd_4
	anim_data__1119_86:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96D, 0x1, 0x1, 0x55
		.4byte	AnimCmd_4
	anim_data__1119_87:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96E, 0x1, 0x1, 0x56
		.4byte	AnimCmd_4
	anim_data__1119_88:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B96F, 0x1, 0x1, 0x57
		.4byte	AnimCmd_4
	anim_data__1119_89:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B970, 0x2, 0x1, 0x58
		.4byte	AnimCmd_4
	anim_data__1119_90:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B972, 0x1, 0x1, 0x59
		.4byte	AnimCmd_4
	anim_data__1119_91:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B973, 0x2, 0x1, 0x5A
		.4byte	AnimCmd_4
	anim_data__1119_92:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B975, 0x2, 0x1, 0x5B
		.4byte	AnimCmd_4
	anim_data__1119_93:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B977, 0x2, 0x1, 0x5C
		.4byte	AnimCmd_4
	anim_data__1119_94:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B979, 0x1, 0x1, 0x5D
		.4byte	AnimCmd_4

.align 2, 0
	anim_1119:
		.4byte anim_data__1119_0
		.4byte anim_data__1119_1
		.4byte anim_data__1119_2
		.4byte anim_data__1119_3
		.4byte anim_data__1119_4
		.4byte anim_data__1119_5
		.4byte anim_data__1119_6
		.4byte anim_data__1119_7
		.4byte anim_data__1119_8
		.4byte anim_data__1119_9
		.4byte anim_data__1119_10
		.4byte anim_data__1119_11
		.4byte anim_data__1119_12
		.4byte anim_data__1119_13
		.4byte anim_data__1119_14
		.4byte anim_data__1119_15
		.4byte anim_data__1119_16
		.4byte anim_data__1119_17
		.4byte anim_data__1119_18
		.4byte anim_data__1119_19
		.4byte anim_data__1119_20
		.4byte anim_data__1119_21
		.4byte anim_data__1119_22
		.4byte anim_data__1119_23
		.4byte anim_data__1119_24
		.4byte anim_data__1119_25
		.4byte anim_data__1119_26
		.4byte anim_data__1119_27
		.4byte anim_data__1119_28
		.4byte anim_data__1119_29
		.4byte anim_data__1119_30
		.4byte anim_data__1119_31
		.4byte anim_data__1119_32
		.4byte anim_data__1119_33
		.4byte anim_data__1119_34
		.4byte anim_data__1119_35
		.4byte anim_data__1119_36
		.4byte anim_data__1119_37
		.4byte anim_data__1119_38
		.4byte anim_data__1119_39
		.4byte anim_data__1119_40
		.4byte anim_data__1119_41
		.4byte anim_data__1119_42
		.4byte anim_data__1119_43
		.4byte anim_data__1119_44
		.4byte anim_data__1119_45
		.4byte anim_data__1119_46
		.4byte anim_data__1119_47
		.4byte anim_data__1119_48
		.4byte anim_data__1119_49
		.4byte anim_data__1119_50
		.4byte anim_data__1119_51
		.4byte anim_data__1119_52
		.4byte anim_data__1119_53
		.4byte anim_data__1119_54
		.4byte anim_data__1119_55
		.4byte anim_data__1119_56
		.4byte anim_data__1119_57
		.4byte anim_data__1119_58
		.4byte anim_data__1119_59
		.4byte anim_data__1119_60
		.4byte anim_data__1119_61
		.4byte anim_data__1119_62
		.4byte anim_data__1119_63
		.4byte anim_data__1119_64
		.4byte anim_data__1119_65
		.4byte anim_data__1119_66
		.4byte anim_data__1119_67
		.4byte anim_data__1119_68
		.4byte anim_data__1119_69
		.4byte anim_data__1119_70
		.4byte anim_data__1119_71
		.4byte anim_data__1119_72
		.4byte anim_data__1119_73
		.4byte anim_data__1119_74
		.4byte anim_data__1119_75
		.4byte anim_data__1119_76
		.4byte anim_data__1119_77
		.4byte anim_data__1119_78
		.4byte anim_data__1119_79
		.4byte anim_data__1119_80
		.4byte anim_data__1119_81
		.4byte anim_data__1119_82
		.4byte anim_data__1119_83
		.4byte anim_data__1119_84
		.4byte anim_data__1119_85
		.4byte anim_data__1119_86
		.4byte anim_data__1119_87
		.4byte anim_data__1119_88
		.4byte anim_data__1119_89
		.4byte anim_data__1119_90
		.4byte anim_data__1119_91
		.4byte anim_data__1119_92
		.4byte anim_data__1119_93
		.4byte anim_data__1119_94




.align 2, 0
	anim_data__1120_0:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B97A, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1120:
		.4byte anim_data__1120_0




.align 2, 0
	anim_data__1121_0:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B97E, 0x18, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1121_1:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B996, 0x18, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1121_2:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B9AE, 0x1B, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1121_3:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B9C9, 0x12, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1121_4:
		.4byte	AnimCmd_GetPalette, 0xAC, 0x300010
		.4byte	AnimCmd_GetTileIndex, 0x2B9DB, 0x1B, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1121:
		.4byte anim_data__1121_0
		.4byte anim_data__1121_1
		.4byte anim_data__1121_2
		.4byte anim_data__1121_3
		.4byte anim_data__1121_4




.align 2, 0
	anim_data__1122_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2B9F6, 0x1C, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1122_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA12, 0x24, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1122:
		.4byte anim_data__1122_0
		.4byte anim_data__1122_1




.align 2, 0
	anim_data__1123_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA36, 0xE, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1123_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA44, 0xE, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1123_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA52, 0x10, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1123_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA62, 0x10, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1123_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA72, 0x12, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1123_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA84, 0x12, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1123_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BA96, 0x12, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1123_7:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BAA8, 0x12, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1123_8:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BABA, 0x12, 0x1, 0x8
		.4byte	AnimCmd_4
	anim_data__1123_9:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BACC, 0x12, 0x1, 0x9
		.4byte	AnimCmd_4
	anim_data__1123_10:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BADE, 0x12, 0x1, 0xA
		.4byte	AnimCmd_4

.align 2, 0
	anim_1123:
		.4byte anim_data__1123_0
		.4byte anim_data__1123_1
		.4byte anim_data__1123_2
		.4byte anim_data__1123_3
		.4byte anim_data__1123_4
		.4byte anim_data__1123_5
		.4byte anim_data__1123_6
		.4byte anim_data__1123_7
		.4byte anim_data__1123_8
		.4byte anim_data__1123_9
		.4byte anim_data__1123_10




.align 2, 0
	anim_data__1124_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BAF0, 0x1A, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1124_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB0A, 0x1A, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1124_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB24, 0x1A, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1124:
		.4byte anim_data__1124_0
		.4byte anim_data__1124_1
		.4byte anim_data__1124_2




.align 2, 0
	anim_data__1125_0:
		.4byte	AnimCmd_GetPalette, 0x0, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2BB3E, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1125_1:
		.4byte	AnimCmd_GetPalette, 0x9, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2BB42, 0x4
		.4byte	AnimCmd_6, 0x0, 0x20002, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1125_2:
		.4byte	AnimCmd_GetPalette, 0x16, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2BB46, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1125_3:
		.4byte	AnimCmd_GetPalette, 0x7, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2BB4A, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1125_4:
		.4byte	AnimCmd_GetPalette, 0x9F, 0x10
		.4byte	AnimCmd_GetTileIndex, 0x2BB4E, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4

.align 2, 0
	anim_1125:
		.4byte anim_data__1125_0
		.4byte anim_data__1125_1
		.4byte anim_data__1125_2
		.4byte anim_data__1125_3
		.4byte anim_data__1125_4




.align 2, 0
	anim_data__1126_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB52, 0x20, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1126:
		.4byte anim_data__1126_0




.align 2, 0
	anim_data__1127_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB72, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1127_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB76, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1127_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB7A, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4
	anim_data__1127_3:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB7E, 0x4, 0x1, 0x3
		.4byte	AnimCmd_4
	anim_data__1127_4:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB82, 0x4, 0x1, 0x4
		.4byte	AnimCmd_4
	anim_data__1127_5:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB86, 0x4, 0x1, 0x5
		.4byte	AnimCmd_4
	anim_data__1127_6:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB8A, 0x4, 0x1, 0x6
		.4byte	AnimCmd_4
	anim_data__1127_7:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB8E, 0x4, 0x1, 0x7
		.4byte	AnimCmd_4
	anim_data__1127_8:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB92, 0x4, 0x1, 0x8
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB96, 0x4, 0x1, 0x9
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB9A, 0x4, 0x1, 0xA
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BB9E, 0x4, 0x1, 0xB
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBA2, 0x4, 0x1, 0xC
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBA6, 0x4, 0x1, 0xD
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBAA, 0x4, 0x1, 0xE
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBAE, 0x4, 0x1, 0xF
		.4byte	AnimCmd_JumpBack, 0x40

.align 2, 0
	anim_1127:
		.4byte anim_data__1127_0
		.4byte anim_data__1127_1
		.4byte anim_data__1127_2
		.4byte anim_data__1127_3
		.4byte anim_data__1127_4
		.4byte anim_data__1127_5
		.4byte anim_data__1127_6
		.4byte anim_data__1127_7
		.4byte anim_data__1127_8




.align 2, 0
	anim_data__1128_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBB2, 0x1, 0x77, 0x0
		.4byte	AnimCmd_GetTileIndex, 0x2BBB3, 0x1, 0x4, 0x1
		.4byte	AnimCmd_GetTileIndex, 0x2BBB4, 0x1, 0x4, 0x2
		.4byte	AnimCmd_GetTileIndex, 0x2BBB5, 0x1, 0x4, 0x3
		.4byte	AnimCmd_GetTileIndex, 0x2BBB6, 0x1, 0x4, 0x4
		.4byte	AnimCmd_GetTileIndex, 0x2BBB2, 0x1, 0x77, 0x0
		.4byte	AnimCmd_JumpBack, 0x21

.align 2, 0
	anim_1128:
		.4byte anim_data__1128_0




.align 2, 0
	anim_data__1129_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBB7, 0x4, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1129_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBBB, 0x4, 0x1, 0x1
		.4byte	AnimCmd_4
	anim_data__1129_2:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBBF, 0x4, 0x1, 0x2
		.4byte	AnimCmd_4

.align 2, 0
	anim_1129:
		.4byte anim_data__1129_0
		.4byte anim_data__1129_1
		.4byte anim_data__1129_2




.align 2, 0
	anim_data__1130_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BBC3, 0x40, 0x1, 0x0
		.4byte	AnimCmd_4
	anim_data__1130_1:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BC03, 0x40, 0x1, 0x1
		.4byte	AnimCmd_4

.align 2, 0
	anim_1130:
		.4byte anim_data__1130_0
		.4byte anim_data__1130_1




.align 2, 0
	anim_data__1131_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BC43, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1131:
		.4byte anim_data__1131_0




.align 2, 0
	anim_data__1132_0:
		.4byte	AnimCmd_GetPalette, 0xA3, 0x600010
		.4byte	AnimCmd_GetTileIndex, 0x2BC73, 0x30, 0x1, 0x0
		.4byte	AnimCmd_4

.align 2, 0
	anim_1132:
		.4byte anim_data__1132_0
