	.section .rodata

.equ AnimCmd_GetTiles,            -1
.equ AnimCmd_GetPalette,          -2
.equ AnimCmd_JumpBack,            -3
.equ AnimCmd_4,                   -4
.equ AnimCmd_PlaySoundEffect,     -5
.equ AnimCmd_6,                   -6
.equ AnimCmd_TranslateSprite,     -7
.equ AnimCmd_8,                   -8
.equ AnimCmd_SetIdAndVariant,     -9
.equ AnimCmd_10,                  -10
.equ AnimCmd_11,                  -11
.equ AnimCmd_12,                  -12

.equ NUM_ANIMATION_TABLE_ENTRIES, 1133

.include "asm/macros/animations.inc"

.align 2, 0
	anim_data__0000_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x0 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x24 16
		.4byte	6, 2

		mGetTiles 0x34 16
		.4byte	6, 3

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x90 16
		.4byte	6, 8

		mGetTiles 0xA0 16
		.4byte	6, 9

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x14 16
		.4byte	6, 1

		mGetTiles 0x24 16
		.4byte	6, 2

		mGetTiles 0x34 16
		.4byte	6, 3

		mGetTiles 0x44 20
		.4byte	6, 4

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mGetTiles 0xB0 20
		.4byte	6, 10

		mGetTiles 0xC4 20
		.4byte	12, 11

		mGetTiles 0xD8 20
		.4byte	6, 12

		mGetTiles 0xC4 20
		.4byte	6, 11

		mGetTiles 0xD8 20
		.4byte	6, 12

		mGetTiles 0xC4 20
		.4byte	12, 11

		mGetTiles 0xB0 20
		.4byte	8, 10

		mGetTiles 0x0 20
		.4byte	6, 0

		mGetTiles 0x58 20
		.4byte	6, 5

		mGetTiles 0x6C 16
		.4byte	6, 6

		mGetTiles 0x7C 20
		.4byte	6, 7

		mJumpBack 0xB5


.align 2, 0
	anim_0000:
		.4byte anim_data__0000_0




.align 2, 0
	anim_data__0001_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xEC 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	4, 0

		mGetTiles 0x100 20
		.4byte	12, 1

		mGetTiles 0x114 20
		.4byte	4, 2

		mGetTiles 0x128 20
		.4byte	4, 3

		mGetTiles 0x13C 25
		.4byte	4, 4

		mGetTiles 0x155 25
		.4byte	4, 5

		mGetTiles 0x16E 20
		.4byte	6, 6

		mGetTiles 0x155 25
		.4byte	4, 5

		mGetTiles 0x13C 25
		.4byte	6, 4

		mGetTiles 0x155 25
		.4byte	4, 5

		mGetTiles 0x16E 20
		.4byte	6, 6

		mGetTiles 0x155 25
		.4byte	4, 5

		mGetTiles 0x182 20
		.4byte	4, 7

		mGetTiles 0x128 20
		.4byte	4, 3

		mGetTiles 0x114 20
		.4byte	4, 2

		mGetTiles 0x196 20
		.4byte	4, 8

		mGetTiles 0x1AA 25
		.4byte	4, 9

		mGetTiles 0x1C3 25
		.4byte	4, 10

		mGetTiles 0x1DC 20
		.4byte	6, 11

		mGetTiles 0x1C3 25
		.4byte	4, 10

		mGetTiles 0x1AA 25
		.4byte	6, 9

		mGetTiles 0x1C3 25
		.4byte	4, 10

		mGetTiles 0x1DC 20
		.4byte	4, 11

		mGetTiles 0x1C3 25
		.4byte	4, 10

		mGetTiles 0x196 20
		.4byte	4, 8

		mGetTiles 0x114 20
		.4byte	4, 2

		mGetTiles 0x100 20
		.4byte	4, 1

		mGetTiles 0x1F0 20
		.4byte	4, 12

		mGetTiles 0x204 20
		.4byte	4, 13

		mGetTiles 0x218 30
		.4byte	4, 14

		mGetTiles 0x236 30
		.4byte	4, 15

		mGetTiles 0x254 30
		.4byte	4, 16

		mGetTiles 0x272 24
		.4byte	4, 17

		mGetTiles 0x218 30
		.4byte	4, 14

		mGetTiles 0x236 30
		.4byte	4, 15

		mGetTiles 0x254 30
		.4byte	4, 16

		mGetTiles 0x28A 24
		.4byte	4, 18

		mGetTiles 0x2A2 30
		.4byte	4, 19

		mGetTiles 0x2C0 30
		.4byte	4, 20

		mGetTiles 0x2DE 30
		.4byte	4, 21

		mGetTiles 0x2FC 24
		.4byte	4, 22

		mGetTiles 0x2A2 30
		.4byte	4, 19

		mGetTiles 0x2C0 30
		.4byte	4, 20

		mGetTiles 0x2DE 30
		.4byte	4, 21

		mGetTiles 0x2FC 24
		.4byte	4, 22

		mGetTiles 0x314 30
		.4byte	4, 23

		mGetTiles 0x236 30
		.4byte	4, 15

		mGetTiles 0x254 30
		.4byte	4, 16

		mGetTiles 0x272 24
		.4byte	4, 17

		mGetTiles 0x218 30
		.4byte	4, 14

		mGetTiles 0x236 30
		.4byte	4, 15

		mGetTiles 0x254 30
		.4byte	4, 16

		mGetTiles 0x272 24
		.4byte	4, 17

		mJumpBack 0x14

	anim_data__0001_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x218 30
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	4, 14

		mGetTiles 0x236 30
		.4byte	4, 15

		mGetTiles 0x254 30
		.4byte	4, 16

		mGetTiles 0x332 30
		.4byte	4, 24

		mGetTiles 0x350 30
		.4byte	4, 25

		mGetTiles 0x100 20
		.4byte	16, 1

		mGetTiles 0xEC 20
		.4byte	4, 0

		mAnimCmd4 


.align 2, 0
	anim_0001:
		.4byte anim_data__0001_0
		.4byte anim_data__0001_1




.align 2, 0
	anim_data__0002_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x36E 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 0

		mGetTiles 0x37E 16
		.4byte	1, 1

		mGetTiles 0x38E 16
		.4byte	1, 2

		mGetTiles 0x39E 16
		.4byte	1, 3

		mJumpBack 0x5

	anim_data__0002_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x37E 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 1

		mGetTiles 0x36E 16
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0002:
		.4byte anim_data__0002_0
		.4byte anim_data__0002_1




.align 2, 0
	anim_data__0003_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3AE 16
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x3BE 16
		.4byte	2, 1

		mGetTiles 0x3CE 16
		.4byte	2, 2

		mGetTiles 0x3DE 16
		.4byte	2, 3

		mJumpBack 0x1D

	anim_data__0003_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3EE 16
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 4

		mGetTiles 0x3FE 16
		.4byte	2, 5

		mGetTiles 0x40E 16
		.4byte	2, 6

		mGetTiles 0x41E 16
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0003:
		.4byte anim_data__0003_0
		.4byte anim_data__0003_1




.align 2, 0
	anim_data__0004_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x42E 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x43E 16
		.4byte	2, 1

		mGetTiles 0x44E 16
		.4byte	2, 2

		mGetTiles 0x45E 16
		.4byte	2, 3

		mGetTiles 0x42E 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x43E 16
		.4byte	2, 1

		mGetTiles 0x44E 16
		.4byte	2, 2

		mGetTiles 0x45E 16
		.4byte	2, 3

		mGetTiles 0x42E 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x43E 16
		.4byte	2, 1

		mGetTiles 0x44E 16
		.4byte	2, 2

		mGetTiles 0x45E 16
		.4byte	2, 3

		mJumpBack 0x51


.align 2, 0
	anim_0004:
		.4byte anim_data__0004_0




.align 2, 0
	anim_data__0005_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x46E 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	1, 0

		mGetTiles 0x482 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0005:
		.4byte anim_data__0005_0




.align 2, 0
	anim_data__0006_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x496 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 0

		mGetTiles 0x4AA 20
		.4byte	2, 1

		mGetTiles 0x4BE 25
		.4byte	2, 2

		mGetTiles 0x4D7 20
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0006:
		.4byte anim_data__0006_0




.align 2, 0
	anim_data__0007_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4EB 25
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 0

		mGetTiles 0x504 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	4, 1

		mGetTiles 0x51D 25
		.4byte	4, 2

		mJumpBack 0xD

	anim_data__0007_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4EB 25
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	4, 0

		mAnimCmd4 


.align 2, 0
	anim_0007:
		.4byte anim_data__0007_0
		.4byte anim_data__0007_1




.align 2, 0
	anim_data__0008_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x536 12
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	1, 0

		mGetTiles 0x542 16
		.4byte	1, 1

		mGetTiles 0x552 20
		.4byte	3, 2

		mGetTiles 0x566 24
		.4byte	3, 3

		mJumpBack 0xA

	anim_data__0008_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x57E 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	2, 4

		mGetTiles 0x592 20
		.4byte	1, 5

		mGetTiles 0x5A6 16
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0008:
		.4byte anim_data__0008_0
		.4byte anim_data__0008_1




.align 2, 0
	anim_data__0009_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x5B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 0

		mGetTiles 0x5F6 64
		.4byte	8, 1

		mGetTiles 0x636 64
		.4byte	8, 2

		mGetTiles 0x676 64
		.4byte	8, 3

		mGetTiles 0x6B6 64
		.4byte	8, 4

		mGetTiles 0x6F6 64
		.4byte	8, 5

		mGetTiles 0x736 64
		.4byte	8, 6

		mGetTiles 0x776 64
		.4byte	8, 7

		mJumpBack 0x2E

	anim_data__0009_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x7B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 8

		mGetTiles 0x7F6 64
		.4byte	8, 9

		mGetTiles 0x836 64
		.4byte	8, 10

		mGetTiles 0x876 64
		.4byte	8, 11

		mGetTiles 0x8B6 64
		.4byte	8, 12

		mGetTiles 0x8F6 64
		.4byte	8, 13

		mGetTiles 0x936 64
		.4byte	8, 14

		mGetTiles 0x976 64
		.4byte	8, 15

		mJumpBack 0x2E

	anim_data__0009_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x9B6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 16

		mGetTiles 0x9F6 64
		.4byte	8, 17

		mGetTiles 0xA36 64
		.4byte	8, 18

		mGetTiles 0xA76 64
		.4byte	8, 19

		mGetTiles 0xAB6 64
		.4byte	8, 20

		mGetTiles 0xAF6 64
		.4byte	8, 21

		mGetTiles 0xB36 64
		.4byte	8, 22

		mGetTiles 0xB76 64
		.4byte	8, 23

		mJumpBack 0x2E

	anim_data__0009_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xBB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 24

		mGetTiles 0xBF6 64
		.4byte	8, 25

		mGetTiles 0xC36 64
		.4byte	8, 26

		mGetTiles 0xC76 64
		.4byte	8, 27

		mGetTiles 0xCB6 64
		.4byte	8, 28

		mGetTiles 0xCF6 64
		.4byte	8, 29

		mGetTiles 0xD36 64
		.4byte	8, 30

		mGetTiles 0xD76 64
		.4byte	8, 31

		mJumpBack 0x2E

	anim_data__0009_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xDB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 32

		mGetTiles 0xDF6 64
		.4byte	8, 33

		mGetTiles 0xE36 64
		.4byte	8, 34

		mGetTiles 0xE76 64
		.4byte	8, 35

		mGetTiles 0xEB6 64
		.4byte	8, 36

		mGetTiles 0xEF6 64
		.4byte	8, 37

		mGetTiles 0xF36 64
		.4byte	8, 38

		mGetTiles 0xF76 64
		.4byte	8, 39

		mJumpBack 0x2E

	anim_data__0009_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xDB6 64
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	8, 32

		mGetTiles 0xDF6 64
		.4byte	8, 33

		mGetTiles 0xE36 64
		.4byte	8, 34

		mGetTiles 0xE76 64
		.4byte	8, 35

		mGetTiles 0xEB6 64
		.4byte	8, 36

		mGetTiles 0xEF6 64
		.4byte	8, 37

		mGetTiles 0xF36 64
		.4byte	8, 38

		mGetTiles 0xF76 64
		.4byte	8, 39

		mJumpBack 0x2E


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
		mGetPalette 0x1 16 0x0
		mGetTiles 0xFB6 16
		mAnimCmd6 0x0 0x1006F0FA
		mAnimCmd6 0x1 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0xFC6 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0010_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0xFD6 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xFE6 16
		.4byte	2, 3

		mGetTiles 0xFF6 16
		.4byte	2, 4

		mGetTiles 0x1006 16
		.4byte	2, 5

		mGetTiles 0x1016 16
		.4byte	2, 6

		mGetTiles 0x1026 16
		.4byte	2, 7

		mGetTiles 0x1036 16
		.4byte	2, 8

		mGetTiles 0x1046 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0010_2:
		mGetPalette 0x1 16 0x0
		mGetTiles 0x1056 25
		mAnimCmd6 0x0 0x406F0FA
		mAnimCmd6 0x1 0xE08F6F8
		.4byte	1, 10

		mGetTiles 0x106F 20
		.4byte	2, 11

		mGetTiles 0x1083 25
		.4byte	2, 12

		mGetTiles 0x109C 30
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0010:
		.4byte anim_data__0010_0
		.4byte anim_data__0010_1
		.4byte anim_data__0010_2




.align 2, 0
	anim_data__0011_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x10BA 16
		mAnimCmd6 0x0 0x1006F0FA
		mAnimCmd6 0x1 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0x10CA 16
		mAnimCmd6 0x0 0x1206F4FA
		mAnimCmd6 0x1 0x1206F4FA
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0011_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x10DA 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0x10EA 16
		.4byte	2, 3

		mGetTiles 0x10FA 16
		.4byte	2, 4

		mGetTiles 0x110A 16
		.4byte	2, 5

		mGetTiles 0x111A 16
		.4byte	2, 6

		mGetTiles 0x112A 16
		.4byte	2, 7

		mGetTiles 0x113A 16
		.4byte	2, 8

		mGetTiles 0x114A 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0011_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x115A 25
		mAnimCmd6 0x0 0x406F0FA
		mAnimCmd6 0x1 0xE08F6F8
		.4byte	1, 10

		mGetTiles 0x1173 20
		.4byte	2, 11

		mGetTiles 0x1187 25
		.4byte	2, 12

		mGetTiles 0x11A0 30
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0011:
		.4byte anim_data__0011_0
		.4byte anim_data__0011_1
		.4byte anim_data__0011_2




.align 2, 0
	anim_data__0012_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x11BE 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x11D2 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 1

		mGetTiles 0x11E2 16
		.4byte	1, 2

		mGetTiles 0x11D2 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0012:
		.4byte anim_data__0012_0




.align 2, 0
	anim_data__0013_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x11F2 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x1206 20
		.4byte	2, 1

		mGetTiles 0x121A 20
		.4byte	2, 2

		mGetTiles 0x122E 20
		.4byte	2, 3

		mGetTiles 0x1242 20
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0013:
		.4byte anim_data__0013_0




.align 2, 0
	anim_data__0014_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1256 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	2, 0

		mGetTiles 0x1266 30
		mAnimCmd6 0x0 0x100AFAF6
		mAnimCmd6 0x1 0x1006ECE9
		.4byte	2, 1

		mGetTiles 0x1284 18
		.4byte	2, 2

		mGetTiles 0x1296 24
		.4byte	1, 3

		mGetTiles 0x12AE 30
		.4byte	1, 4

		mGetTiles 0x12CC 30
		.4byte	1, 5

		mGetTiles 0x12EA 36
		.4byte	1, 6

		mGetTiles 0x130E 25
		.4byte	1, 7

		mGetTiles 0x1327 30
		.4byte	1, 8

		mGetTiles 0x1345 30
		.4byte	1, 9

		mGetTiles 0x1363 20
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0014_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1377 24
		mAnimCmd6 0x0 0x100EFEF2
		mAnimCmd6 0x1 0x1203F8EB
		.4byte	2, 11

		mGetTiles 0x138F 24
		.4byte	2, 12

		mGetTiles 0x13A7 24
		.4byte	2, 13

		mJumpBack 0x18

	anim_data__0014_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x13BF 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 14

		mGetTiles 0x13CF 16
		.4byte	1, 15

		mGetTiles 0x13DF 16
		.4byte	1, 16

		mAnimCmd4 


.align 2, 0
	anim_0014:
		.4byte anim_data__0014_0
		.4byte anim_data__0014_1
		.4byte anim_data__0014_2




.align 2, 0
	anim_data__0015_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x13EF 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x1403 18
		.4byte	3, 1

		mGetTiles 0x1415 24
		.4byte	6, 2

		mGetTiles 0x1403 18
		.4byte	2, 1

		mGetTiles 0x142D 25
		.4byte	2, 3

		mGetTiles 0x1446 20
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 4

		mGetTiles 0x145A 20
		.4byte	2, 5

		mGetTiles 0x146E 16
		.4byte	2, 6

		mGetTiles 0x147E 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 7

		mGetTiles 0x148E 16
		.4byte	2, 8

		mGetTiles 0x149E 16
		.4byte	2, 9

		mGetTiles 0x14AE 16
		.4byte	2, 10

		mJumpBack 0x1A

	anim_data__0015_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x14BE 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 11

		mGetTiles 0x14D2 16
		.4byte	2, 12

		mGetTiles 0x14E2 20
		.4byte	1, 13

		mGetTiles 0x14F6 20
		.4byte	2, 14

		mGetTiles 0x150A 20
		.4byte	3, 15

		mGetTiles 0x151E 20
		.4byte	3, 16

		mGetTiles 0x1532 20
		.4byte	3, 17

		mJumpBack 0xF

	anim_data__0015_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1546 16
		.4byte	2, 18

		mGetTiles 0x1556 16
		.4byte	2, 19

		mJumpBack 0xD


.align 2, 0
	anim_0015:
		.4byte anim_data__0015_0
		.4byte anim_data__0015_1
		.4byte anim_data__0015_2




.align 2, 0
	anim_data__0016_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1566 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	2, 0

		mGetTiles 0x1576 30
		mAnimCmd6 0x0 0x100EFAF2
		mAnimCmd6 0x1 0x1006ECE9
		.4byte	2, 1

		mGetTiles 0x1594 18
		.4byte	2, 2

		mGetTiles 0x15A6 24
		.4byte	1, 3

		mGetTiles 0x15BE 30
		.4byte	1, 4

		mGetTiles 0x15DC 30
		.4byte	1, 5

		mGetTiles 0x15FA 36
		.4byte	1, 6

		mGetTiles 0x161E 25
		.4byte	1, 7

		mGetTiles 0x1637 30
		.4byte	1, 8

		mGetTiles 0x1655 30
		.4byte	1, 9

		mGetTiles 0x1673 20
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0016_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1687 24
		mAnimCmd6 0x0 0x100EFEF2
		mAnimCmd6 0x1 0x1203F8EB
		.4byte	2, 11

		mGetTiles 0x169F 24
		.4byte	2, 12

		mGetTiles 0x16B7 24
		.4byte	2, 13

		mJumpBack 0x18

	anim_data__0016_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x16CF 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 14

		mGetTiles 0x16DF 16
		.4byte	1, 15

		mGetTiles 0x16EF 16
		.4byte	1, 16

		mAnimCmd4 

	anim_data__0016_3:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x16FF 9
		.4byte	1, 17

		mGetTiles 0x1708 15
		.4byte	1, 18

		mGetTiles 0x1717 15
		.4byte	1, 19

		mGetTiles 0x16FF 9
		.4byte	1, 17

		mGetTiles 0x1708 15
		.4byte	1, 18

		mGetTiles 0x1717 15
		.4byte	1, 19

		mJumpBack 0x21


.align 2, 0
	anim_0016:
		.4byte anim_data__0016_0
		.4byte anim_data__0016_1
		.4byte anim_data__0016_2
		.4byte anim_data__0016_3




.align 2, 0
	anim_data__0017_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1726 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0xE0EF2F2
		.4byte	1, 0

		mGetTiles 0x1736 12
		.4byte	1, 1

		mGetTiles 0x1742 16
		.4byte	1, 2

		mGetTiles 0x1752 16
		.4byte	1, 3

		mGetTiles 0x1762 16
		.4byte	1, 4

		mGetTiles 0x1772 12
		.4byte	1, 5

		mGetTiles 0x177E 16
		.4byte	1, 6

		mGetTiles 0x178E 20
		.4byte	1, 7

		mGetTiles 0x17A2 16
		mAnimCmd6 0x0 0x808F8F8
		.4byte	2, 8

		mGetTiles 0x17B2 16
		.4byte	2, 9

		mGetTiles 0x17C2 16
		.4byte	2, 10

		mGetTiles 0x17D2 16
		.4byte	2, 11

		mJumpBack 0x17

	anim_data__0017_1:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x17E2 8
		.4byte	2, 12

		mGetTiles 0x17EA 16
		.4byte	2, 13

		mGetTiles 0x17FA 16
		.4byte	2, 14

		mGetTiles 0x180A 16
		.4byte	2, 15

		mGetTiles 0x181A 16
		.4byte	2, 16

		mGetTiles 0x182A 16
		.4byte	2, 17

		mGetTiles 0x183A 12
		.4byte	2, 18

		mGetTiles 0x1846 16
		.4byte	2, 19

		mAnimCmd4 


.align 2, 0
	anim_0017:
		.4byte anim_data__0017_0
		.4byte anim_data__0017_1




.align 2, 0
	anim_data__0018_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1856 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x1866 16
		.4byte	2, 1

		mGetTiles 0x1876 16
		.4byte	2, 2

		mGetTiles 0x1886 16
		.4byte	2, 3

		mGetTiles 0x1896 16
		.4byte	2, 4

		mGetTiles 0x18A6 16
		.4byte	2, 5

		mGetTiles 0x18B6 16
		.4byte	2, 6

		mGetTiles 0x18C6 16
		.4byte	2, 7

		mGetTiles 0x18D6 16
		.4byte	2, 8

		mGetTiles 0x18E6 16
		.4byte	2, 9

		mGetTiles 0x18F6 16
		.4byte	2, 10

		mGetTiles 0x1906 16
		.4byte	2, 11

		mJumpBack 0x14


.align 2, 0
	anim_0018:
		.4byte anim_data__0018_0




.align 2, 0
	anim_data__0019_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1916 16
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	2, 0

		mGetTiles 0x1926 16
		.4byte	2, 1

		mGetTiles 0x1936 16
		.4byte	2, 2

		mGetTiles 0x1946 16
		.4byte	2, 3

		mGetTiles 0x1956 20
		mAnimCmd6 0x0 0x1006F2F8
		.4byte	2, 4

		mGetTiles 0x196A 24
		.4byte	2, 5

		mGetTiles 0x1982 20
		.4byte	2, 6

		mJumpBack 0x12

	anim_data__0019_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1996 25
		mAnimCmd6 0x0 0xC06F4FA
		.4byte	2, 7

		mGetTiles 0x19AF 25
		.4byte	2, 8

		mJumpBack 0x10

	anim_data__0019_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x19C8 25
		mAnimCmd6 0x0 0xC06F4FA
		.4byte	2, 9

		mAnimCmd4 


.align 2, 0
	anim_0019:
		.4byte anim_data__0019_0
		.4byte anim_data__0019_1
		.4byte anim_data__0019_2




.align 2, 0
	anim_data__0028_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x19E1 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0x19F5 25
		.4byte	8, 1

		mGetTiles 0x1A0E 20
		.4byte	8, 2

		mGetTiles 0x1A22 25
		.4byte	8, 3

		mGetTiles 0x1A3B 20
		.4byte	8, 4

		mJumpBack 0x5

	anim_data__0028_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1A4F 30
		mAnimCmd6 0x0 0x1806F8FA
		.4byte	5, 5

		mGetTiles 0x1A6D 24
		.4byte	5, 6

		mGetTiles 0x1A85 24
		.4byte	5, 7

		mGetTiles 0x1A9D 25
		.4byte	5, 8

		mGetTiles 0x1AB6 25
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0028_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1ACF 16
		.4byte	5, 10

		mGetTiles 0x1ADF 16
		.4byte	3, 11

		mGetTiles 0x1AEF 20
		.4byte	3, 12

		mGetTiles 0x1B03 20
		.4byte	3, 13

		mAnimCmd4 


.align 2, 0
	anim_0028:
		.4byte anim_data__0028_0
		.4byte anim_data__0028_1
		.4byte anim_data__0028_2




.align 2, 0
	anim_data__0029_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1B17 20
		.4byte	3, 0

		mGetTiles 0x1B2B 25
		.4byte	3, 1

		mGetTiles 0x1B17 20
		.4byte	12, 0

		mGetTiles 0x1B44 16
		.4byte	2, 2

		mGetTiles 0x1B54 20
		.4byte	3, 3

		mGetTiles 0x1B68 20
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0029:
		.4byte anim_data__0029_0




.align 2, 0
	anim_data__0030_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1B7C 20
		.4byte	2, 0

		mGetTiles 0x1B90 20
		.4byte	2, 1

		mGetTiles 0x1BA4 20
		.4byte	4, 2

		mGetTiles 0x1BB8 25
		.4byte	4, 3

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BEA 20
		.4byte	6, 5

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BB8 25
		.4byte	6, 3

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BEA 20
		.4byte	6, 5

		mGetTiles 0x1BD1 25
		.4byte	4, 4

		mGetTiles 0x1BFE 20
		.4byte	4, 6

		mGetTiles 0x1BA4 20
		.4byte	4, 2

		mGetTiles 0x1B90 20
		.4byte	4, 1

		mGetTiles 0x1C12 20
		.4byte	4, 7

		mGetTiles 0x1C26 25
		.4byte	4, 8

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C58 20
		.4byte	6, 10

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C26 25
		.4byte	6, 8

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C58 20
		.4byte	4, 10

		mGetTiles 0x1C3F 25
		.4byte	4, 9

		mGetTiles 0x1C12 20
		.4byte	4, 7

		mGetTiles 0x1B90 20
		.4byte	4, 1

		mGetTiles 0x1B7C 20
		.4byte	4, 0

		mGetTiles 0x1C6C 20
		.4byte	8, 11

		mGetTiles 0x1C80 15
		.4byte	4, 12

		mGetTiles 0x1C8F 20
		.4byte	4, 13

		mGetTiles 0x1CA3 15
		.4byte	4, 14

		mGetTiles 0x1CB2 15
		.4byte	4, 15

		mGetTiles 0x1C80 15
		.4byte	4, 12

		mGetTiles 0x1C8F 20
		.4byte	4, 13

		mGetTiles 0x1CA3 15
		.4byte	4, 14

		mGetTiles 0x1CB2 15
		.4byte	4, 15

		mGetTiles 0x1C6C 20
		.4byte	4, 11

		mGetTiles 0x1B7C 20
		.4byte	8, 0

		mGetTiles 0x1CC1 20
		.4byte	6, 16

		mGetTiles 0x1CD5 16
		.4byte	6, 17

		mGetTiles 0x1CE5 16
		.4byte	2, 18

		mAnimCmd4 

	anim_data__0030_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1CE5 16
		.4byte	1, 18

		mGetTiles 0x1CF5 20
		.4byte	6, 19

		mGetTiles 0x1D09 20
		.4byte	60, 20

		mGetTiles 0x1D1D 25
		.4byte	4, 21

		mAnimCmd4 


.align 2, 0
	anim_0030:
		.4byte anim_data__0030_0
		.4byte anim_data__0030_1




.align 2, 0
	anim_data__0031_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1D36 16
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0x1D46 24
		.4byte	3, 1

		mGetTiles 0x1D5E 25
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0031_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1D77 25
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 3

		mGetTiles 0x1D90 20
		.4byte	2, 4

		mGetTiles 0x1DA4 25
		.4byte	2, 5

		mGetTiles 0x1DBD 25
		.4byte	2, 6

		mJumpBack 0x1A

	anim_data__0031_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1DD6 20
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 7

		mGetTiles 0x1DEA 20
		.4byte	2, 8

		mGetTiles 0x1DFE 20
		.4byte	4, 9

		mAnimCmd4 


.align 2, 0
	anim_0031:
		.4byte anim_data__0031_0
		.4byte anim_data__0031_1
		.4byte anim_data__0031_2




.align 2, 0
	anim_data__0032_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1E12 20
		.4byte	5, 0

		mGetTiles 0x1E26 20
		.4byte	5, 1

		mGetTiles 0x1E3A 20
		.4byte	16, 2

		mGetTiles 0x1E4E 20
		.4byte	3, 3

		mGetTiles 0x1E62 20
		.4byte	3, 4

		mGetTiles 0x1E76 20
		.4byte	3, 5

		mGetTiles 0x1E8A 20
		.4byte	3, 6

		mGetTiles 0x1E9E 25
		.4byte	3, 7

		mGetTiles 0x1EB7 20
		.4byte	4, 8

		mGetTiles 0x1ECB 20
		.4byte	4, 9

		mGetTiles 0x1EDF 20
		.4byte	12, 10

		mGetTiles 0x1EF3 20
		.4byte	6, 11

		mGetTiles 0x1F07 25
		.4byte	5, 12

		mGetTiles 0x1F20 25
		.4byte	12, 13

		mAnimCmd4 


.align 2, 0
	anim_0032:
		.4byte anim_data__0032_0




.align 2, 0
	anim_data__0033_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1F39 20
		.4byte	5, 0

		mGetTiles 0x1F4D 20
		.4byte	5, 1

		mGetTiles 0x1F61 20
		.4byte	16, 2

		mGetTiles 0x1F75 20
		.4byte	3, 3

		mGetTiles 0x1F89 20
		.4byte	3, 4

		mGetTiles 0x1F9D 24
		.4byte	3, 5

		mGetTiles 0x1FB5 24
		.4byte	3, 6

		mGetTiles 0x1FCD 20
		.4byte	3, 7

		mGetTiles 0x1FE1 20
		.4byte	3, 8

		mGetTiles 0x1FF5 20
		.4byte	3, 9

		mGetTiles 0x2009 20
		.4byte	3, 10

		mGetTiles 0x201D 20
		.4byte	3, 11

		mGetTiles 0x2031 20
		.4byte	6, 12

		mGetTiles 0x2045 20
		.4byte	3, 13

		mGetTiles 0x2059 20
		.4byte	2, 14

		mGetTiles 0x206D 25
		.4byte	3, 15

		mGetTiles 0x2086 25
		.4byte	10, 16

		mGetTiles 0x206D 25
		.4byte	3, 15

		mGetTiles 0x209F 20
		.4byte	2, 17

		mGetTiles 0x20B3 20
		.4byte	12, 18

		mAnimCmd4 


.align 2, 0
	anim_0033:
		.4byte anim_data__0033_0




.align 2, 0
	anim_data__0034_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x20C7 20
		.4byte	3, 0

		mGetTiles 0x20DB 24
		.4byte	3, 1

		mGetTiles 0x20F3 24
		.4byte	3, 2

		mGetTiles 0x210B 24
		.4byte	3, 3

		mGetTiles 0x2123 24
		.4byte	3, 4

		mGetTiles 0x213B 28
		.4byte	3, 5

		mGetTiles 0x2157 24
		.4byte	3, 6

		mGetTiles 0x216F 20
		.4byte	3, 7

		mGetTiles 0x2183 20
		.4byte	3, 8

		mGetTiles 0x2197 20
		.4byte	3, 9

		mGetTiles 0x21AB 20
		.4byte	3, 10

		mGetTiles 0x21BF 20
		.4byte	3, 11

		mGetTiles 0x21D3 24
		.4byte	2, 12

		mGetTiles 0x21EB 24
		.4byte	6, 13

		mGetTiles 0x2203 20
		.4byte	3, 14

		mGetTiles 0x2217 20
		.4byte	3, 15

		mGetTiles 0x222B 20
		.4byte	60, 16

		mAnimCmd4 


.align 2, 0
	anim_0034:
		.4byte anim_data__0034_0




.align 2, 0
	anim_data__0035_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x223F 20
		.4byte	3, 0

		mGetTiles 0x2253 20
		.4byte	3, 1

		mGetTiles 0x2267 25
		.4byte	3, 2

		mGetTiles 0x2280 20
		.4byte	3, 3

		mGetTiles 0x2294 20
		.4byte	3, 4

		mGetTiles 0x22A8 20
		.4byte	3, 5

		mGetTiles 0x22BC 25
		.4byte	3, 6

		mGetTiles 0x22D5 25
		.4byte	3, 7

		mGetTiles 0x22EE 25
		.4byte	3, 8

		mGetTiles 0x2307 25
		.4byte	3, 9

		mGetTiles 0x2320 25
		.4byte	3, 10

		mGetTiles 0x2339 25
		.4byte	3, 11

		mGetTiles 0x2352 25
		.4byte	3, 12

		mGetTiles 0x236B 25
		.4byte	3, 13

		mGetTiles 0x22BC 25
		.4byte	3, 6

		mGetTiles 0x2384 25
		.4byte	3, 14

		mJumpBack 0x28


.align 2, 0
	anim_0035:
		.4byte anim_data__0035_0




.align 2, 0
	anim_data__0036_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x239D 15
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0036_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x23AC 15
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0036_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x23BB 25
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0036_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x23D4 25
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0036:
		.4byte anim_data__0036_0
		.4byte anim_data__0036_1
		.4byte anim_data__0036_2
		.4byte anim_data__0036_3




.align 2, 0
	anim_data__0037_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x23ED 15
		.4byte	3, 0

		mGetTiles 0x23FC 20
		.4byte	3, 1

		mGetTiles 0x2410 25
		.4byte	3, 2

		mGetTiles 0x2429 20
		.4byte	3, 3

		mGetTiles 0x243D 15
		.4byte	3, 4

		mGetTiles 0x244C 20
		.4byte	3, 5

		mGetTiles 0x2460 25
		.4byte	3, 6

		mGetTiles 0x2479 20
		.4byte	3, 7

		mJumpBack 0x2B

	anim_data__0037_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x248D 20
		.4byte	3, 8

		mGetTiles 0x24A1 20
		.4byte	3, 9

		mGetTiles 0x24B5 30
		.4byte	3, 10

		mGetTiles 0x24D3 25
		.4byte	3, 11

		mGetTiles 0x24EC 20
		.4byte	3, 12

		mGetTiles 0x2500 25
		.4byte	3, 13

		mGetTiles 0x2519 30
		.4byte	3, 14

		mGetTiles 0x2537 25
		.4byte	3, 15

		mJumpBack 0x2B


.align 2, 0
	anim_0037:
		.4byte anim_data__0037_0
		.4byte anim_data__0037_1




.align 2, 0
	anim_data__0048_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2550 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x2564 20
		.4byte	6, 1

		mGetTiles 0x2550 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0048_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2578 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 2

		mGetTiles 0x258C 20
		.4byte	1, 3

		mGetTiles 0x25A0 18
		.4byte	3, 4

		mGetTiles 0x25B2 18
		.4byte	3, 5

		mGetTiles 0x25C4 18
		.4byte	3, 6

		mJumpBack 0xF

	anim_data__0048_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x258C 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 3

		mGetTiles 0x2578 20
		.4byte	3, 2

		mGetTiles 0x25D6 20
		.4byte	3, 7

		mGetTiles 0x25EA 30
		.4byte	2, 8

		mGetTiles 0x2608 24
		.4byte	2, 9

		mGetTiles 0x2620 25
		.4byte	2, 10

		mJumpBack 0xF


.align 2, 0
	anim_0048:
		.4byte anim_data__0048_0
		.4byte anim_data__0048_1
		.4byte anim_data__0048_2




.align 2, 0
	anim_data__0049_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2639 20
		mAnimCmd6 0x0 0xE06F0F8
		.4byte	2, 0

		mGetTiles 0x264D 20
		.4byte	4, 1

		mGetTiles 0x2661 28
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0049_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x267D 20
		mAnimCmd6 0x0 0xE06F0FA
		mAnimCmd6 0x1 0xE0EF0F2
		.4byte	1, 3

		mGetTiles 0x2691 20
		.4byte	1, 4

		mGetTiles 0x26A5 25
		.4byte	1, 5

		mGetTiles 0x26BE 30
		.4byte	1, 6

		mGetTiles 0x26DC 20
		.4byte	1, 7

		mGetTiles 0x26F0 20
		.4byte	1, 8

		mGetTiles 0x2704 25
		.4byte	1, 9

		mGetTiles 0x271D 25
		.4byte	1, 10

		mJumpBack 0x31

	anim_data__0049_2:
		mGetPalette 0x3 16 0x50
		mGetTiles 0x2736 32
		.4byte	1, 11

		mGetTiles 0x2756 32
		.4byte	1, 12

		mGetTiles 0x2776 32
		.4byte	1, 13

		mGetTiles 0x2796 32
		.4byte	1, 14

		mGetTiles 0x27B6 32
		.4byte	1, 15

		mGetTiles 0x27D6 32
		.4byte	1, 16

		mGetTiles 0x27F6 32
		.4byte	1, 17

		mGetTiles 0x2816 32
		.4byte	1, 18

		mJumpBack 0x2B


.align 2, 0
	anim_0049:
		.4byte anim_data__0049_0
		.4byte anim_data__0049_1
		.4byte anim_data__0049_2




.align 2, 0
	anim_data__0050_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2836 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0050_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2836 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	5, 0

		mGetTiles 0x284E 20
		.4byte	4, 1

		mGetTiles 0x2862 30
		.4byte	3, 2

		mGetTiles 0x2880 25
		.4byte	2, 3

		mGetTiles 0x2899 20
		.4byte	2, 4

		mGetTiles 0x28AD 20
		.4byte	2, 5

		mGetTiles 0x28C1 24
		.4byte	2, 6

		mGetTiles 0x28D9 25
		.4byte	2, 7

		mGetTiles 0x28F2 20
		.4byte	3, 8

		mGetTiles 0x2906 20
		.4byte	3, 9

		mGetTiles 0x291A 20
		.4byte	3, 10

		mJumpBack 0xF


.align 2, 0
	anim_0050:
		.4byte anim_data__0050_0
		.4byte anim_data__0050_1




.align 2, 0
	anim_data__0051_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x292E 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x2942 18
		.4byte	3, 1

		mGetTiles 0x2954 24
		.4byte	6, 2

		mGetTiles 0x2942 18
		.4byte	2, 1

		mGetTiles 0x296C 25
		.4byte	2, 3

		mGetTiles 0x2985 20
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 4

		mGetTiles 0x2999 20
		.4byte	2, 5

		mGetTiles 0x29AD 16
		.4byte	2, 6

		mAnimCmd4 

	anim_data__0051_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x29BD 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 7

		mGetTiles 0x29CD 16
		.4byte	2, 8

		mGetTiles 0x29DD 16
		.4byte	2, 9

		mGetTiles 0x29ED 16
		.4byte	2, 10

		mJumpBack 0x1D

	anim_data__0051_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x29FD 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 11

		mGetTiles 0x2A11 16
		.4byte	2, 12

		mGetTiles 0x2A21 20
		.4byte	2, 13

		mGetTiles 0x2A35 20
		.4byte	2, 14

		mGetTiles 0x2A49 20
		.4byte	3, 15

		mGetTiles 0x2A5D 20
		.4byte	3, 16

		mGetTiles 0x2A71 20
		.4byte	3, 17

		mJumpBack 0xF

	anim_data__0051_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2A85 16
		.4byte	1, 18

		mGetTiles 0x2A95 16
		.4byte	1, 19

		mJumpBack 0xD


.align 2, 0
	anim_0051:
		.4byte anim_data__0051_0
		.4byte anim_data__0051_1
		.4byte anim_data__0051_2
		.4byte anim_data__0051_3




.align 2, 0
	anim_data__0052_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2AA5 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x2ABD 18
		.4byte	3, 1

		mGetTiles 0x2ACF 18
		.4byte	3, 2

		mGetTiles 0x2AE1 18
		.4byte	3, 3

		mJumpBack 0xF

	anim_data__0052_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2AA5 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x2AF3 20
		.4byte	2, 4

		mGetTiles 0x2B07 20
		.4byte	2, 5

		mGetTiles 0x2B1B 20
		.4byte	3, 6

		mGetTiles 0x2B2F 20
		.4byte	3, 7

		mGetTiles 0x2B43 20
		.4byte	3, 8

		mAnimCmd4 

	anim_data__0052_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2B57 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 9

		mGetTiles 0x2B6B 20
		.4byte	3, 10

		mGetTiles 0x2B7F 20
		.4byte	3, 11

		mJumpBack 0x15


.align 2, 0
	anim_0052:
		.4byte anim_data__0052_0
		.4byte anim_data__0052_1
		.4byte anim_data__0052_2




.align 2, 0
	anim_data__0053_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2B93 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	4, 0

		mGetTiles 0x2BA7 16
		.4byte	4, 1

		mGetTiles 0x2BB7 20
		.4byte	4, 2

		mGetTiles 0x2BCB 20
		.4byte	4, 3

		mGetTiles 0x2BDF 20
		.4byte	4, 4

		mGetTiles 0x2BF3 20
		.4byte	4, 5

		mGetTiles 0x2C07 20
		.4byte	4, 6

		mGetTiles 0x2C1B 20
		.4byte	4, 7

		mGetTiles 0x2C2F 20
		.4byte	4, 8

		mGetTiles 0x2C43 16
		.4byte	4, 9

		mGetTiles 0x2C53 20
		.4byte	4, 10

		mGetTiles 0x2C67 20
		.4byte	3, 11

		mGetTiles 0x2C7B 20
		.4byte	3, 12

		mGetTiles 0x2C8F 20
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0053:
		.4byte anim_data__0053_0




.align 2, 0
	anim_data__0054_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2CA3 25
		mAnimCmd6 0x0 0x1208F2F8
		.4byte	1, 0

		mGetTiles 0x2CBC 30
		mAnimCmd6 0x0 0xE08F0F8
		.4byte	2, 1

		mGetTiles 0x2CDA 20
		.4byte	2, 2

		mGetTiles 0x2CEE 25
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0054_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2D07 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 4

		mGetTiles 0x2D1F 20
		.4byte	2, 5

		mGetTiles 0x2D33 20
		.4byte	2, 6

		mGetTiles 0x2D47 20
		.4byte	2, 7

		mGetTiles 0x2D5B 20
		.4byte	2, 8

		mGetTiles 0x2D6F 20
		.4byte	2, 9

		mGetTiles 0x2D83 20
		.4byte	2, 10

		mGetTiles 0x2D97 20
		.4byte	2, 11

		mJumpBack 0xF


.align 2, 0
	anim_0054:
		.4byte anim_data__0054_0
		.4byte anim_data__0054_1




.align 2, 0
	anim_data__0055_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2DAB 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0x2DEB 64
		.4byte	2, 1

		mJumpBack 0x10


.align 2, 0
	anim_0055:
		.4byte anim_data__0055_0




.align 2, 0
	anim_data__0056_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2E2B 20
		mAnimCmd6 0x0 0xC06EEFA
		.4byte	3, 0

		mGetTiles 0x2E3F 24
		.4byte	3, 1

		mGetTiles 0x2E57 20
		.4byte	3, 2

		mGetTiles 0x2E2B 20
		.4byte	3, 0

		mGetTiles 0x2E3F 24
		.4byte	3, 1

		mGetTiles 0x2E57 20
		.4byte	3, 2

		mGetTiles 0x2E6B 20
		.4byte	3, 3

		mGetTiles 0x2E7F 20
		.4byte	3, 4

		mGetTiles 0x2E93 20
		.4byte	3, 5

		mGetTiles 0x2EA7 30
		.4byte	3, 6

		mGetTiles 0x2EC5 24
		.4byte	3, 7

		mGetTiles 0x2EDD 21
		.4byte	3, 8

		mGetTiles 0x2EF2 30
		.4byte	3, 9

		mGetTiles 0x2F10 24
		.4byte	3, 10

		mGetTiles 0x2F28 24
		.4byte	3, 11

		mGetTiles 0x2F40 36
		.4byte	3, 12

		mGetTiles 0x2F64 25
		.4byte	3, 13

		mGetTiles 0x2F7D 18
		.4byte	3, 14

		mGetTiles 0x2F8F 30
		.4byte	3, 15

		mGetTiles 0x2FAD 24
		.4byte	3, 16

		mGetTiles 0x2FC5 24
		.4byte	3, 17

		mGetTiles 0x2FDD 30
		.4byte	3, 18

		mGetTiles 0x2FFB 24
		.4byte	3, 19

		mGetTiles 0x3013 20
		.4byte	3, 20

		mGetTiles 0x3027 20
		.4byte	3, 21

		mGetTiles 0x303B 20
		.4byte	3, 22

		mGetTiles 0x304F 20
		.4byte	3, 23

		mGetTiles 0x3063 20
		.4byte	3, 24

		mJumpBack 0xF


.align 2, 0
	anim_0056:
		.4byte anim_data__0056_0




.align 2, 0
	anim_data__0057_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3077 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0057_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3090 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0057_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30A0 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0057_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30B0 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0057_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30C9 20
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0057_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30DD 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0057_6:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30ED 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0057_7:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x30FD 20
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3111 64
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	5, 0

		mGetTiles 0x3151 64
		.4byte	5, 1

		mGetTiles 0x3191 64
		.4byte	5, 2

		mGetTiles 0x31D1 64
		.4byte	5, 3

		mGetTiles 0x3211 64
		.4byte	5, 4

		mGetTiles 0x3251 64
		.4byte	5, 5

		mGetTiles 0x3291 64
		.4byte	5, 6

		mGetTiles 0x32D1 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0058:
		.4byte anim_data__0058_0




.align 2, 0
	anim_data__0059_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3311 21
		mAnimCmd6 0x0 0x2A060CFA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0059_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3326 30
		mAnimCmd6 0x0 0x1EFE0AE4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0059_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3344 24
		mAnimCmd6 0x0 0x10F802D8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0059_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x335C 25
		mAnimCmd6 0x0 0xAF2F5DD
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0059_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3375 24
		mAnimCmd6 0x0 0xFEF8EAE6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0059_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x338D 18
		mAnimCmd6 0x0 0xF8FEDCEC
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0059_6:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x339F 28
		mAnimCmd6 0x0 0xF806DAFA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0059_7:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x33BB 28
		mAnimCmd6 0x0 0xF610DE00
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0059_8:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x33D7 20
		mAnimCmd6 0x0 0xFE1EEC08
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0059_9:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x33EB 24
		mAnimCmd6 0x0 0x826F80A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0059_10:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3403 24
		mAnimCmd6 0x0 0x12240208
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0059_11:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x341B 30
		mAnimCmd6 0x0 0x221C0804
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3439 28
		mAnimCmd6 0x0 0xF806DAFA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0060_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3455 18
		mAnimCmd6 0x0 0xF8FEDCEC
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0060_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3467 24
		mAnimCmd6 0x0 0xFEF8EAE6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0060_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x347F 25
		mAnimCmd6 0x0 0xAF2F5DD
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0060_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3498 24
		mAnimCmd6 0x0 0x16F802D8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0060_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x34B0 30
		mAnimCmd6 0x0 0x1EFE0AE4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0060_6:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x34CE 21
		mAnimCmd6 0x0 0x2A060CFA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0060_7:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x34E3 30
		mAnimCmd6 0x0 0x221C0804
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0060_8:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3501 24
		mAnimCmd6 0x0 0x12240208
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0060_9:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3519 24
		mAnimCmd6 0x0 0x826F80A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0060_10:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3531 20
		mAnimCmd6 0x0 0xFE1EEC08
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0060_11:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3545 28
		mAnimCmd6 0x0 0xF610DE00
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3561 30
		mAnimCmd6 0x0 0xF06F1FA
		.4byte	8, 0

		mGetTiles 0x357F 30
		.4byte	8, 1

		mGetTiles 0x359D 30
		.4byte	8, 2

		mGetTiles 0x357F 30
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0061:
		.4byte anim_data__0061_0




.align 2, 0
	anim_data__0062_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x35BB 28
		mAnimCmd6 0x0 0x1E0600FA
		.4byte	2, 0

		mGetTiles 0x35D7 24
		mAnimCmd6 0x0 0x180600FA
		.4byte	2, 1

		mGetTiles 0x35EF 16
		mAnimCmd6 0x0 0x100600FA
		.4byte	2, 2

		mGetTiles 0x35FF 20
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 3

		mGetTiles 0x3613 28
		mAnimCmd6 0x0 0xFE06E0FA
		.4byte	4, 4

		mGetTiles 0x362F 24
		mAnimCmd6 0x0 0xFE06E6FA
		.4byte	3, 5

		mGetTiles 0x3647 16
		mAnimCmd6 0x0 0x206F0FA
		.4byte	2, 6

		mGetTiles 0x3657 24
		mAnimCmd6 0x0 0x1A06FCFA
		.4byte	2, 7

		mGetTiles 0x35BB 28
		mAnimCmd6 0x0 0x1E0400F8
		.4byte	4, 0

		mGetTiles 0x35D7 24
		mAnimCmd6 0x0 0x180600FA
		.4byte	3, 1

		mGetTiles 0x35EF 16
		mAnimCmd6 0x0 0x100600FA
		.4byte	2, 2

		mGetTiles 0x35FF 20
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 3

		mGetTiles 0x3613 28
		mAnimCmd6 0x0 0xFE06E0FA
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0062_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x366F 28
		mAnimCmd6 0x0 0xFC06DEFA
		.4byte	2, 8

		mGetTiles 0x368B 24
		mAnimCmd6 0x0 0xFE06E4FA
		.4byte	2, 9

		mGetTiles 0x36A3 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 10

		mGetTiles 0x36B3 20
		mAnimCmd6 0x0 0x160600FA
		.4byte	2, 11

		mGetTiles 0x36C7 28
		mAnimCmd6 0x0 0x200602FA
		.4byte	4, 12

		mGetTiles 0x36E3 24
		mAnimCmd6 0x0 0x180602FA
		.4byte	3, 13

		mGetTiles 0x36FB 16
		mAnimCmd6 0x0 0x100600FA
		.4byte	2, 14

		mGetTiles 0x370B 24
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 15

		mGetTiles 0x366F 28
		mAnimCmd6 0x0 0xFC06DEFA
		.4byte	4, 8

		mGetTiles 0x368B 24
		mAnimCmd6 0x0 0xFE06E4FA
		.4byte	3, 9

		mGetTiles 0x36A3 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 10

		mGetTiles 0x36B3 20
		mAnimCmd6 0x0 0x160600FA
		.4byte	2, 11

		mGetTiles 0x36C7 28
		mAnimCmd6 0x0 0x200602FA
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0062:
		.4byte anim_data__0062_0
		.4byte anim_data__0062_1




.align 2, 0
	anim_data__0063_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3723 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mGetTiles 0x3733 25
		mAnimCmd6 0x0 0xEEEF6
		.4byte	2, 1

		mGetTiles 0x374C 35
		mAnimCmd6 0x0 0xFE0EE5F6
		.4byte	4, 2

		mGetTiles 0x376F 25
		mAnimCmd6 0x0 0xEEDF6
		.4byte	3, 3

		mGetTiles 0x3788 12
		mAnimCmd6 0x0 0x60EF6F6
		.4byte	2, 4

		mGetTiles 0x3794 20
		mAnimCmd6 0x0 0x180E00F6
		.4byte	2, 5

		mGetTiles 0x37A8 28
		mAnimCmd6 0x0 0x200E02F6
		.4byte	4, 6

		mGetTiles 0x37C4 20
		mAnimCmd6 0x0 0x140E00F6
		.4byte	3, 7

		mGetTiles 0x3723 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0063_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x37D8 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mGetTiles 0x37E8 25
		mAnimCmd6 0x0 0x160E00F6
		.4byte	2, 9

		mGetTiles 0x3801 35
		mAnimCmd6 0x0 0x220E02F6
		.4byte	4, 10

		mGetTiles 0x3824 25
		mAnimCmd6 0x0 0x160E00F6
		.4byte	3, 11

		mGetTiles 0x383D 12
		mAnimCmd6 0x0 0xA0EFAF6
		.4byte	2, 12

		mGetTiles 0x3849 20
		mAnimCmd6 0x0 0x20EEAF6
		.4byte	2, 13

		mGetTiles 0x385D 28
		mAnimCmd6 0x0 0x20EE4F6
		.4byte	4, 14

		mGetTiles 0x3879 20
		mAnimCmd6 0x0 0x20EEEF6
		.4byte	3, 15

		mGetTiles 0x37D8 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0063:
		.4byte anim_data__0063_0
		.4byte anim_data__0063_1




.align 2, 0
	anim_data__0064_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x388D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x38A1 30
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x38BF 24
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x38D7 25
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x38F0 15
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mGetTiles 0x38FF 24
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	2, 5

		mGetTiles 0x3917 28
		mAnimCmd6 0x0 0xFF1FE113
		.4byte	4, 6

		mGetTiles 0x3933 20
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	3, 7

		mGetTiles 0x388D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x38A1 30
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x38BF 24
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x38D7 25
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x38F0 15
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0064:
		.4byte anim_data__0064_0




.align 2, 0
	anim_data__0065_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3947 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x3960 25
		.4byte	2, 1

		mGetTiles 0x3979 30
		.4byte	2, 2

		mGetTiles 0x3997 24
		.4byte	2, 3

		mGetTiles 0x39AF 30
		.4byte	2, 4

		mGetTiles 0x39CD 30
		.4byte	2, 5

		mGetTiles 0x39EB 30
		.4byte	2, 6

		mGetTiles 0x3A09 24
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0065_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3A21 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 8

		mGetTiles 0x3A39 20
		.4byte	3, 9

		mGetTiles 0x3A4D 20
		.4byte	3, 10

		mGetTiles 0x3A61 20
		.4byte	3, 11

		mAnimCmd4 

	anim_data__0065_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3A75 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 12

		mGetTiles 0x3A89 20
		.4byte	3, 13

		mGetTiles 0x3A9D 20
		.4byte	3, 14

		mJumpBack 0x15


.align 2, 0
	anim_0065:
		.4byte anim_data__0065_0
		.4byte anim_data__0065_1
		.4byte anim_data__0065_2




.align 2, 0
	anim_data__0066_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3AB1 35
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x3AD4 35
		.4byte	3, 1

		mGetTiles 0x3AF7 35
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0066_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3B1A 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 3

		mGetTiles 0x3B38 24
		.4byte	3, 4

		mGetTiles 0x3B50 18
		.4byte	3, 5

		mGetTiles 0x3B62 24
		.4byte	3, 6

		mGetTiles 0x3B7A 30
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0066_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3B98 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 8

		mGetTiles 0x3BB1 25
		.4byte	3, 9

		mGetTiles 0x3BCA 30
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0066:
		.4byte anim_data__0066_0
		.4byte anim_data__0066_1
		.4byte anim_data__0066_2




.align 2, 0
	anim_data__0067_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3BE8 36
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	5, 0

		mGetTiles 0x3C0C 25
		.4byte	5, 1

		mGetTiles 0x3C25 16
		.4byte	5, 2

		mGetTiles 0x3C35 25
		.4byte	5, 3

		mGetTiles 0x3C4E 36
		.4byte	5, 4

		mGetTiles 0x3C72 20
		.4byte	5, 5

		mGetTiles 0x3C86 16
		.4byte	5, 6

		mGetTiles 0x3C96 20
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0067:
		.4byte anim_data__0067_0




.align 2, 0
	anim_data__0068_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CAA 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0068_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CBE 16
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0068_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CCE 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0068_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CE2 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0068_4:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3CF6 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0068_5:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D0A 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0068_6:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D1E 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0068_7:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D32 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0068_8:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D46 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0068_9:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D5A 16
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0068_10:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D6A 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3D7E 20
		mAnimCmd6 0x0 0xA0AF8F8
		.4byte	2, 0

		mGetTiles 0x3D92 20
		.4byte	2, 1

		mGetTiles 0x3DA6 20
		.4byte	2, 2

		mGetTiles 0x3DBA 20
		.4byte	2, 3

		mGetTiles 0x3DCE 20
		.4byte	2, 4

		mGetTiles 0x3DE2 20
		.4byte	2, 5

		mGetTiles 0x3DF6 25
		.4byte	2, 6

		mGetTiles 0x3E0F 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0069_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3E23 20
		mAnimCmd6 0x0 0xA0AF8F8
		.4byte	2, 8

		mGetTiles 0x3E37 20
		.4byte	2, 9

		mGetTiles 0x3E4B 20
		.4byte	2, 10

		mGetTiles 0x3E5F 20
		.4byte	2, 11

		mGetTiles 0x3E73 20
		.4byte	2, 12

		mGetTiles 0x3E87 20
		.4byte	2, 13

		mGetTiles 0x3E9B 25
		.4byte	2, 14

		mGetTiles 0x3EB4 20
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0069:
		.4byte anim_data__0069_0
		.4byte anim_data__0069_1




.align 2, 0
	anim_data__0070_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3EC8 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x3ED8 16
		.4byte	2, 1

		mGetTiles 0x3EE8 16
		.4byte	2, 2

		mGetTiles 0x3EF8 16
		.4byte	2, 3

		mGetTiles 0x3F08 16
		.4byte	2, 4

		mGetTiles 0x3F18 16
		.4byte	2, 5

		mGetTiles 0x3F28 16
		.4byte	2, 6

		mGetTiles 0x3F38 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0070:
		.4byte anim_data__0070_0




.align 2, 0
	anim_data__0071_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x3F48 25
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 0

		mGetTiles 0x3F61 25
		.4byte	2, 1

		mGetTiles 0x3F7A 25
		.4byte	2, 2

		mGetTiles 0x3F93 25
		.4byte	2, 3

		mGetTiles 0x3FAC 20
		.4byte	2, 4

		mGetTiles 0x3FC0 25
		.4byte	2, 5

		mGetTiles 0x3FD9 25
		.4byte	2, 6

		mGetTiles 0x3FF2 25
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0071_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x400B 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 8

		mGetTiles 0x4029 24
		.4byte	2, 9

		mGetTiles 0x4041 24
		.4byte	2, 10

		mGetTiles 0x4059 30
		.4byte	2, 11

		mGetTiles 0x4041 24
		.4byte	2, 10

		mGetTiles 0x4029 24
		.4byte	2, 9

		mJumpBack 0x24


.align 2, 0
	anim_0071:
		.4byte anim_data__0071_0
		.4byte anim_data__0071_1




.align 2, 0
	anim_data__0072_0:
		mGetPalette 0x4 16 0x0
		mGetTiles 0x4077 18
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0x4089 30
		mAnimCmd6 0x0 0x12FFF4EE
		.4byte	3, 1

		mGetTiles 0x40A7 30
		mAnimCmd6 0x0 0x12FAF4E8
		.4byte	3, 2

		mGetTiles 0x40C5 24
		mAnimCmd6 0x0 0x12FCF4EA
		.4byte	3, 3

		mGetTiles 0x40DD 24
		mAnimCmd6 0x0 0x1206F4F7
		.4byte	3, 4

		mGetTiles 0x40F5 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 5

		mGetTiles 0x410D 30
		mAnimCmd6 0x0 0x1218F406
		.4byte	3, 6

		mGetTiles 0x412B 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0072:
		.4byte anim_data__0072_0




.align 2, 0
	anim_data__0073_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4143 16
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	3, 0

		mGetTiles 0x4153 16
		.4byte	3, 1

		mGetTiles 0x4163 16
		.4byte	3, 2

		mGetTiles 0x4173 16
		.4byte	3, 3

		mGetTiles 0x4183 16
		.4byte	3, 4

		mGetTiles 0x4193 16
		.4byte	3, 5

		mGetTiles 0x41A3 16
		.4byte	3, 6

		mGetTiles 0x41B3 16
		.4byte	3, 7

		mJumpBack 0x2E

	anim_data__0073_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x41C3 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	3, 8

		mGetTiles 0x41D7 20
		.4byte	3, 9

		mGetTiles 0x41EB 16
		.4byte	3, 10

		mGetTiles 0x41FB 20
		.4byte	3, 11

		mGetTiles 0x420F 20
		.4byte	3, 12

		mGetTiles 0x4223 20
		.4byte	3, 13

		mGetTiles 0x4237 20
		.4byte	3, 14

		mGetTiles 0x424B 20
		.4byte	3, 15

		mJumpBack 0x2E

	anim_data__0073_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x425F 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	3, 16

		mGetTiles 0x4273 20
		.4byte	3, 17

		mGetTiles 0x4287 25
		.4byte	3, 18

		mGetTiles 0x42A0 20
		.4byte	3, 19

		mGetTiles 0x42B4 20
		.4byte	3, 20

		mGetTiles 0x42C8 20
		.4byte	3, 21

		mGetTiles 0x42DC 16
		.4byte	3, 22

		mGetTiles 0x42EC 20
		.4byte	3, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0073:
		.4byte anim_data__0073_0
		.4byte anim_data__0073_1
		.4byte anim_data__0073_2




.align 2, 0
	anim_data__0074_0:
		mGetPalette 0x5 16 0x10
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0074:
		.4byte anim_data__0074_0




.align 2, 0
	anim_data__0075_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4300 64
		mAnimCmd6 0x0 0x1007F9F9
		.4byte	2, 0

		mGetTiles 0x4340 64
		.4byte	2, 1

		mGetTiles 0x4380 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0075:
		.4byte anim_data__0075_0




.align 2, 0
	anim_data__0085_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x43C0 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0085_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x43D4 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0085:
		.4byte anim_data__0085_0
		.4byte anim_data__0085_1




.align 2, 0
	anim_data__0086_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x43E8 24
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 0

		mGetTiles 0x4400 24
		.4byte	3, 1

		mGetTiles 0x4418 20
		.4byte	3, 2

		mGetTiles 0x442C 24
		.4byte	3, 3

		mGetTiles 0x4444 24
		.4byte	3, 4

		mGetTiles 0x445C 20
		.4byte	3, 5

		mJumpBack 0x24

	anim_data__0086_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4470 20
		mAnimCmd6 0x0 0x8E0F8
		.4byte	3, 6

		mGetTiles 0x4484 20
		.4byte	3, 7

		mGetTiles 0x4498 20
		.4byte	3, 8

		mGetTiles 0x44AC 20
		.4byte	3, 9

		mGetTiles 0x44C0 20
		.4byte	3, 10

		mGetTiles 0x44D4 20
		.4byte	3, 11

		mJumpBack 0x24

	anim_data__0086_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x44E8 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 12

		mGetTiles 0x44FC 20
		.4byte	3, 13

		mGetTiles 0x4510 20
		.4byte	3, 14

		mGetTiles 0x4524 20
		.4byte	3, 15

		mGetTiles 0x4538 20
		.4byte	3, 16

		mGetTiles 0x454C 20
		.4byte	3, 17

		mJumpBack 0x24

	anim_data__0086_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4560 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 18

		mGetTiles 0x4574 20
		.4byte	3, 19

		mGetTiles 0x4588 20
		.4byte	3, 20

		mGetTiles 0x459C 20
		.4byte	3, 21

		mGetTiles 0x45B0 20
		.4byte	3, 22

		mGetTiles 0x45C4 20
		.4byte	3, 23

		mJumpBack 0x24


.align 2, 0
	anim_0086:
		.4byte anim_data__0086_0
		.4byte anim_data__0086_1
		.4byte anim_data__0086_2
		.4byte anim_data__0086_3




.align 2, 0
	anim_data__0087_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x45D8 36
		mAnimCmd6 0x0 0x6E2FA
		.4byte	2, 0

		mGetTiles 0x45FC 30
		.4byte	2, 1

		mJumpBack 0x10

	anim_data__0087_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x461A 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0087_2:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x462E 30
		mAnimCmd6 0x0 0x6E2FA
		.4byte	2, 3

		mGetTiles 0x464C 30
		.4byte	2, 4

		mJumpBack 0x10

	anim_data__0087_3:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x466A 25
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0087:
		.4byte anim_data__0087_0
		.4byte anim_data__0087_1
		.4byte anim_data__0087_2
		.4byte anim_data__0087_3




.align 2, 0
	anim_data__0088_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4683 20
		.4byte	6, 0

		mGetTiles 0x4697 20
		.4byte	6, 1

		mGetTiles 0x46AB 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0088_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x46BF 20
		.4byte	6, 3

		mGetTiles 0x46D3 20
		.4byte	6, 4

		mGetTiles 0x46E7 30
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0088:
		.4byte anim_data__0088_0
		.4byte anim_data__0088_1




.align 2, 0
	anim_data__0089_0:
		mGetPalette 0x6 16 0x0
		mGetTiles 0x4705 16
		mAnimCmd6 0x0 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x4715 16
		.4byte	2, 1

		mGetTiles 0x4725 16
		.4byte	2, 2

		mGetTiles 0x4735 16
		.4byte	2, 3

		mGetTiles 0x4745 16
		.4byte	2, 4

		mGetTiles 0x4755 16
		.4byte	2, 5

		mJumpBack 0x24


.align 2, 0
	anim_0089:
		.4byte anim_data__0089_0




.align 2, 0
	anim_data__0090_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x4765 20
		mAnimCmd6 0x0 0x106E3FA
		.4byte	2, 0

		mGetTiles 0x4779 20
		.4byte	2, 1

		mGetTiles 0x478D 20
		.4byte	2, 2

		mGetTiles 0x47A1 20
		.4byte	2, 3

		mGetTiles 0x47B5 20
		.4byte	3, 4

		mGetTiles 0x47C9 20
		.4byte	3, 5

		mGetTiles 0x47DD 20
		.4byte	3, 6

		mGetTiles 0x47F1 20
		.4byte	3, 7

		mGetTiles 0x4805 20
		.4byte	3, 8

		mGetTiles 0x4819 20
		.4byte	3, 9

		mGetTiles 0x482D 20
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0090:
		.4byte anim_data__0090_0




.align 2, 0
	anim_data__0091_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4841 12
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	5, 0

		mGetTiles 0x484D 12
		.4byte	5, 1

		mGetTiles 0x4859 16
		.4byte	7, 2

		mGetTiles 0x4869 16
		.4byte	10, 3

		mGetTiles 0x4879 16
		.4byte	3, 4

		mGetTiles 0x4889 12
		.4byte	3, 5

		mGetTiles 0x4895 12
		.4byte	3, 6

		mGetTiles 0x48A1 12
		.4byte	7, 7

		mGetTiles 0x4841 12
		.4byte	5, 0

		mGetTiles 0x48AD 12
		.4byte	5, 8

		mGetTiles 0x4859 16
		.4byte	7, 2

		mGetTiles 0x4869 16
		.4byte	10, 3

		mGetTiles 0x48B9 16
		.4byte	3, 9

		mGetTiles 0x48C9 12
		.4byte	3, 10

		mGetTiles 0x48D5 12
		.4byte	3, 11

		mGetTiles 0x48E1 12
		.4byte	7, 12

		mJumpBack 0x56


.align 2, 0
	anim_0091:
		.4byte anim_data__0091_0




.align 2, 0
	anim_data__0092_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x48ED 15
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	6, 0

		mGetTiles 0x48FC 15
		.4byte	6, 1

		mGetTiles 0x490B 15
		.4byte	6, 2

		mGetTiles 0x491A 20
		.4byte	6, 3

		mGetTiles 0x492E 15
		.4byte	6, 4

		mGetTiles 0x493D 12
		.4byte	6, 5

		mGetTiles 0x492E 15
		.4byte	6, 4

		mGetTiles 0x491A 20
		.4byte	6, 3

		mGetPalette 0x7 16 0x0
		mGetTiles 0x48ED 15
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	6, 0

		mGetTiles 0x48FC 15
		.4byte	6, 1

		mGetTiles 0x490B 15
		.4byte	6, 2

		mGetTiles 0x491A 20
		.4byte	6, 3

		mGetTiles 0x492E 15
		.4byte	6, 4

		mGetTiles 0x493D 12
		.4byte	6, 5

		mGetTiles 0x492E 15
		.4byte	6, 4

		mGetTiles 0x491A 20
		.4byte	6, 3

		mGetTiles 0x48ED 15
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	6, 0

		mGetTiles 0x4949 15
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	6, 6

		mGetTiles 0x4958 16
		.4byte	6, 7

		mGetTiles 0x4968 12
		.4byte	5, 8

		mGetTiles 0x4974 12
		.4byte	5, 9

		mGetTiles 0x4968 12
		.4byte	5, 8

		mGetTiles 0x4974 12
		.4byte	5, 9

		mGetTiles 0x4968 12
		.4byte	5, 8

		mGetTiles 0x4974 12
		.4byte	5, 9

		mGetTiles 0x4980 16
		.4byte	4, 10

		mGetTiles 0x4990 20
		.4byte	4, 11

		mGetTiles 0x49A4 25
		.4byte	6, 12

		mGetTiles 0x49BD 25
		.4byte	4, 13

		mGetTiles 0x49D6 25
		.4byte	4, 14

		mGetTiles 0x49EF 25
		.4byte	4, 15

		mGetTiles 0x49A4 25
		.4byte	12, 12

		mGetTiles 0x4A08 20
		.4byte	8, 16

		mGetTiles 0x4A1C 15
		.4byte	8, 17

		mGetTiles 0x4A2B 15
		.4byte	8, 18

		mGetTiles 0x4A3A 15
		.4byte	8, 19

		mGetTiles 0x4A49 15
		.4byte	8, 20

		mGetTiles 0x4A1C 15
		.4byte	8, 17

		mGetTiles 0x4A2B 15
		.4byte	8, 18

		mGetTiles 0x4A3A 15
		.4byte	8, 19

		mGetTiles 0x4A49 15
		.4byte	8, 20

		mGetTiles 0x4A1C 15
		.4byte	8, 17

		mGetTiles 0x4A2B 15
		.4byte	8, 18

		mGetTiles 0x4A3A 15
		.4byte	8, 19

		mGetTiles 0x4A49 15
		.4byte	8, 20

		mGetTiles 0x4A58 15
		.4byte	8, 21

		mGetTiles 0x4A67 20
		.4byte	8, 22

		mGetTiles 0x4A7B 20
		.4byte	8, 23

		mGetTiles 0x4A8F 20
		.4byte	8, 24

		mGetTiles 0x4AA3 20
		.4byte	8, 25

		mGetTiles 0x4A67 20
		.4byte	8, 22

		mGetTiles 0x4A7B 20
		.4byte	8, 23

		mGetTiles 0x4A8F 20
		.4byte	8, 24

		mGetTiles 0x4AA3 20
		.4byte	8, 25

		mGetTiles 0x4A67 20
		.4byte	8, 22

		mGetTiles 0x4A7B 20
		.4byte	8, 23

		mGetTiles 0x4A8F 20
		.4byte	8, 24

		mGetTiles 0x4AA3 20
		.4byte	8, 25

		mGetTiles 0x4A58 15
		.4byte	8, 21

		mJumpBack 0x82

	anim_data__0092_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4AB7 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	4, 26

		mGetTiles 0x4ACB 16
		.4byte	4, 27

		mGetTiles 0x4ADB 16
		.4byte	1, 28

		mAnimCmd4 


.align 2, 0
	anim_0092:
		.4byte anim_data__0092_0
		.4byte anim_data__0092_1




.align 2, 0
	anim_data__0093_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4AEB 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 0

		mGetTiles 0x4AFB 16
		.4byte	1, 1

		mGetTiles 0x4B0B 16
		.4byte	1, 2

		mGetTiles 0x4B1B 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0093_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4B27 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 4

		mGetTiles 0x4B37 16
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0093:
		.4byte anim_data__0093_0
		.4byte anim_data__0093_1




.align 2, 0
	anim_data__0094_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4B47 25
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x4B60 30
		.4byte	2, 1

		mGetTiles 0x4B7E 25
		.4byte	2, 2

		mGetTiles 0x4B97 25
		.4byte	2, 3

		mGetTiles 0x4BB0 25
		.4byte	2, 4

		mGetTiles 0x4BC9 30
		.4byte	2, 5

		mGetTiles 0x4BE7 25
		.4byte	2, 6

		mGetTiles 0x4C00 25
		.4byte	2, 7

		mJumpBack 0x31

	anim_data__0094_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4B47 25
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x4B60 30
		.4byte	2, 1

		mGetTiles 0x4B7E 25
		.4byte	2, 2

		mGetTiles 0x4B97 25
		.4byte	2, 3

		mGetTiles 0x4BB0 25
		.4byte	2, 4

		mGetTiles 0x4BC9 30
		.4byte	2, 5

		mGetTiles 0x4BE7 25
		.4byte	2, 6

		mGetTiles 0x4C00 25
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0094:
		.4byte anim_data__0094_0
		.4byte anim_data__0094_1




.align 2, 0
	anim_data__0095_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4C19 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x4C29 16
		.4byte	2, 1

		mGetTiles 0x4C39 16
		.4byte	2, 2

		mGetTiles 0x4C49 16
		.4byte	2, 3

		mJumpBack 0x1D

	anim_data__0095_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4C59 16
		.4byte	2, 4

		mGetTiles 0x4C69 16
		.4byte	2, 5

		mGetTiles 0x4C79 16
		.4byte	2, 6

		mGetTiles 0x4C89 16
		.4byte	2, 7

		mGetTiles 0x4C99 16
		.4byte	2, 8

		mGetTiles 0x4CA9 16
		.4byte	2, 9

		mGetTiles 0x4CB9 16
		.4byte	2, 10

		mGetTiles 0x4CC9 16
		.4byte	2, 11

		mJumpBack 0x2B


.align 2, 0
	anim_0095:
		.4byte anim_data__0095_0
		.4byte anim_data__0095_1




.align 2, 0
	anim_data__0096_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4CD9 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x4CE9 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0096:
		.4byte anim_data__0096_0




.align 2, 0
	anim_data__0097_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4CF9 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x4D0D 16
		.4byte	2, 1

		mGetTiles 0x4D1D 16
		.4byte	2, 2

		mGetTiles 0x4D2D 16
		.4byte	2, 3

		mGetTiles 0x4D3D 16
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0097:
		.4byte anim_data__0097_0




.align 2, 0
	anim_data__0098_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4D4D 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x4D61 20
		.4byte	4, 1

		mGetTiles 0x4D75 25
		.4byte	4, 2

		mJumpBack 0xA

	anim_data__0098_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4D8E 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 3

		mGetTiles 0x4D9E 16
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0098:
		.4byte anim_data__0098_0
		.4byte anim_data__0098_1




.align 2, 0
	anim_data__0099_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4DAE 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x4DC2 16
		.4byte	2, 1

		mGetTiles 0x4DD2 20
		.4byte	2, 2

		mGetTiles 0x4DE6 24
		.4byte	2, 3

		mGetTiles 0x4DFE 24
		.4byte	2, 4

		mGetTiles 0x4E16 24
		.4byte	2, 5

		mGetTiles 0x4E2E 20
		.4byte	2, 6

		mGetTiles 0x4E42 16
		.4byte	2, 7

		mGetTiles 0x4E52 20
		.4byte	2, 8

		mGetTiles 0x4DC2 16
		.4byte	2, 1

		mGetTiles 0x4DD2 20
		.4byte	2, 2

		mGetTiles 0x4DE6 24
		.4byte	2, 3

		mGetTiles 0x4DFE 24
		.4byte	2, 4

		mGetTiles 0x4E66 24
		.4byte	2, 9

		mGetTiles 0x4E7E 20
		.4byte	2, 10

		mGetTiles 0x4E92 16
		.4byte	2, 11

		mGetTiles 0x4E52 20
		.4byte	2, 8

		mJumpBack 0x50

	anim_data__0099_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4EA2 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 12

		mGetTiles 0x4EB6 16
		.4byte	2, 13

		mGetTiles 0x4EC6 16
		.4byte	1, 14

		mAnimCmd4 


.align 2, 0
	anim_0099:
		.4byte anim_data__0099_0
		.4byte anim_data__0099_1




.align 2, 0
	anim_data__0100_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x4ED6 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 0

		mGetTiles 0x4F16 64
		.4byte	8, 1

		mGetTiles 0x4F56 64
		.4byte	8, 2

		mGetTiles 0x4F96 64
		.4byte	8, 3

		mGetTiles 0x4FD6 64
		.4byte	8, 4

		mGetTiles 0x5016 64
		.4byte	8, 5

		mGetTiles 0x5056 64
		.4byte	8, 6

		mGetTiles 0x5096 64
		.4byte	8, 7

		mGetTiles 0x4ED6 64
		.4byte	8, 0

		mGetTiles 0x4F16 64
		.4byte	8, 1

		mGetTiles 0x4F56 64
		.4byte	8, 2

		mGetTiles 0x4F96 64
		.4byte	8, 3

		mGetTiles 0x50D6 64
		.4byte	8, 8

		mGetTiles 0x5116 64
		.4byte	8, 9

		mGetTiles 0x5156 64
		.4byte	8, 10

		mGetTiles 0x5096 64
		.4byte	8, 7

		mJumpBack 0x56

	anim_data__0100_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5196 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 11

		mGetTiles 0x51D6 64
		.4byte	8, 12

		mGetTiles 0x5216 64
		.4byte	8, 13

		mGetTiles 0x5256 64
		.4byte	8, 14

		mGetTiles 0x5296 64
		.4byte	8, 15

		mGetTiles 0x52D6 64
		.4byte	8, 16

		mGetTiles 0x5316 64
		.4byte	8, 17

		mGetTiles 0x5356 64
		.4byte	8, 18

		mGetTiles 0x5196 64
		.4byte	8, 11

		mGetTiles 0x51D6 64
		.4byte	8, 12

		mGetTiles 0x5216 64
		.4byte	8, 13

		mGetTiles 0x5256 64
		.4byte	8, 14

		mGetTiles 0x5396 64
		.4byte	8, 19

		mGetTiles 0x53D6 64
		.4byte	8, 20

		mGetTiles 0x5416 64
		.4byte	8, 21

		mGetTiles 0x5356 64
		.4byte	8, 18

		mJumpBack 0x56

	anim_data__0100_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5456 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 22

		mGetTiles 0x5496 64
		.4byte	8, 23

		mGetTiles 0x54D6 64
		.4byte	8, 24

		mGetTiles 0x5516 64
		.4byte	8, 25

		mGetTiles 0x5556 64
		.4byte	8, 26

		mGetTiles 0x5596 64
		.4byte	8, 27

		mGetTiles 0x55D6 64
		.4byte	8, 28

		mGetTiles 0x5616 64
		.4byte	8, 29

		mGetTiles 0x5456 64
		.4byte	8, 22

		mGetTiles 0x5496 64
		.4byte	8, 23

		mGetTiles 0x54D6 64
		.4byte	8, 24

		mGetTiles 0x5516 64
		.4byte	8, 25

		mGetTiles 0x5656 64
		.4byte	8, 30

		mGetTiles 0x5696 64
		.4byte	8, 31

		mGetTiles 0x56D6 64
		.4byte	8, 32

		mGetTiles 0x5616 64
		.4byte	8, 29

		mJumpBack 0x56

	anim_data__0100_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5716 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 33

		mGetTiles 0x5756 64
		.4byte	8, 34

		mGetTiles 0x5796 64
		.4byte	8, 35

		mGetTiles 0x57D6 64
		.4byte	8, 36

		mGetTiles 0x5816 64
		.4byte	8, 37

		mGetTiles 0x5856 64
		.4byte	8, 38

		mGetTiles 0x5896 64
		.4byte	8, 39

		mGetTiles 0x58D6 64
		.4byte	8, 40

		mGetTiles 0x5716 64
		.4byte	8, 33

		mGetTiles 0x5756 64
		.4byte	8, 34

		mGetTiles 0x5796 64
		.4byte	8, 35

		mGetTiles 0x57D6 64
		.4byte	8, 36

		mGetTiles 0x5916 64
		.4byte	8, 41

		mGetTiles 0x5956 64
		.4byte	8, 42

		mGetTiles 0x5996 64
		.4byte	8, 43

		mGetTiles 0x59D6 64
		.4byte	8, 44

		mJumpBack 0x56

	anim_data__0100_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5A16 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 45

		mGetTiles 0x5A56 64
		.4byte	8, 46

		mGetTiles 0x5A96 64
		.4byte	8, 47

		mGetTiles 0x5AD6 64
		.4byte	8, 48

		mGetTiles 0x5B16 64
		.4byte	8, 49

		mGetTiles 0x5B56 64
		.4byte	8, 50

		mGetTiles 0x5B96 64
		.4byte	8, 51

		mGetTiles 0x5BD6 64
		.4byte	8, 52

		mGetTiles 0x5A16 64
		.4byte	8, 45

		mGetTiles 0x5A56 64
		.4byte	8, 46

		mGetTiles 0x5A96 64
		.4byte	8, 47

		mGetTiles 0x5AD6 64
		.4byte	8, 48

		mGetTiles 0x5C16 64
		.4byte	8, 53

		mGetTiles 0x5C56 64
		.4byte	8, 54

		mGetTiles 0x5C96 64
		.4byte	8, 55

		mGetTiles 0x5BD6 64
		.4byte	8, 52

		mJumpBack 0x56

	anim_data__0100_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5A16 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 45

		mGetTiles 0x5A56 64
		.4byte	8, 46

		mGetTiles 0x5A96 64
		.4byte	8, 47

		mGetTiles 0x5AD6 64
		.4byte	8, 48

		mGetTiles 0x5B16 64
		.4byte	8, 49

		mGetTiles 0x5B56 64
		.4byte	8, 50

		mGetTiles 0x5B96 64
		.4byte	8, 51

		mGetTiles 0x5BD6 64
		.4byte	8, 52

		mGetTiles 0x5A16 64
		.4byte	8, 45

		mGetTiles 0x5A56 64
		.4byte	8, 46

		mGetTiles 0x5A96 64
		.4byte	8, 47

		mGetTiles 0x5AD6 64
		.4byte	8, 48

		mGetTiles 0x5C16 64
		.4byte	8, 53

		mGetTiles 0x5C56 64
		.4byte	8, 54

		mGetTiles 0x5C96 64
		.4byte	8, 55

		mGetTiles 0x5BD6 64
		.4byte	8, 52

		mJumpBack 0x56


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
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5CD6 16
		mAnimCmd6 0x0 0x806F2FA
		mAnimCmd6 0x1 0x806F2FA
		.4byte	3, 0

		mGetTiles 0x5CE6 16
		.4byte	3, 1

		mAnimCmd4 

	anim_data__0101_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5CF6 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0x5D06 16
		.4byte	2, 3

		mGetTiles 0x5D16 16
		.4byte	2, 4

		mGetTiles 0x5D26 16
		.4byte	2, 5

		mGetTiles 0x5D36 16
		.4byte	2, 6

		mGetTiles 0x5D46 16
		.4byte	2, 7

		mGetTiles 0x5D56 16
		.4byte	2, 8

		mGetTiles 0x5D66 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0101_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5D76 25
		mAnimCmd6 0x0 0x806F2FA
		mAnimCmd6 0x1 0xD0AF9F6
		.4byte	1, 10

		mGetTiles 0x5D8F 24
		.4byte	2, 11

		mGetTiles 0x5DA7 28
		.4byte	2, 12

		mGetTiles 0x5DC3 20
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0101:
		.4byte anim_data__0101_0
		.4byte anim_data__0101_1
		.4byte anim_data__0101_2




.align 2, 0
	anim_data__0102_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5DD7 16
		mAnimCmd6 0x0 0x806F2FA
		mAnimCmd6 0x1 0x806F2FA
		.4byte	3, 0

		mGetTiles 0x5DE7 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0102_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5DF7 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0x5E07 16
		.4byte	2, 3

		mGetTiles 0x5E17 16
		.4byte	2, 4

		mGetTiles 0x5E27 16
		.4byte	2, 5

		mGetTiles 0x5E37 16
		.4byte	2, 6

		mGetTiles 0x5E47 16
		.4byte	2, 7

		mGetTiles 0x5E57 16
		.4byte	2, 8

		mGetTiles 0x5E67 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0102_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5E77 25
		mAnimCmd6 0x0 0x806F2FA
		mAnimCmd6 0x1 0xD0AF9F6
		.4byte	1, 10

		mGetTiles 0x5E90 24
		.4byte	2, 11

		mGetTiles 0x5EA8 28
		.4byte	2, 12

		mGetTiles 0x5EC4 20
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0102:
		.4byte anim_data__0102_0
		.4byte anim_data__0102_1
		.4byte anim_data__0102_2




.align 2, 0
	anim_data__0103_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5ED8 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	3, 0

		mGetTiles 0x5EE8 16
		.4byte	1, 1

		mGetTiles 0x5EF8 16
		.4byte	1, 2

		mGetTiles 0x5F08 12
		.4byte	1, 3

		mGetTiles 0x5EE8 16
		.4byte	1, 1

		mGetPalette 0x7 16 0x0
		mGetTiles 0x5ED8 16
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0103:
		.4byte anim_data__0103_0




.align 2, 0
	anim_data__0104_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5F14 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x5F28 24
		.4byte	2, 1

		mGetTiles 0x5F40 28
		.4byte	2, 2

		mGetTiles 0x5F5C 28
		.4byte	2, 3

		mGetTiles 0x5F78 28
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0104:
		.4byte anim_data__0104_0




.align 2, 0
	anim_data__0105_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x5F94 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x5FA4 16
		.4byte	1, 1

		mGetTiles 0x5FB4 16
		.4byte	1, 2

		mGetTiles 0x5FC4 16
		.4byte	1, 3

		mGetTiles 0x5FD4 20
		.4byte	1, 4

		mGetTiles 0x5FE8 20
		.4byte	1, 5

		mGetTiles 0x5FFC 20
		.4byte	3, 6

		mGetTiles 0x6010 25
		.4byte	1, 7

		mGetTiles 0x6029 25
		.4byte	2, 8

		mGetTiles 0x6042 20
		.4byte	2, 9

		mGetTiles 0x6056 25
		.4byte	2, 10

		mGetTiles 0x606F 20
		.4byte	2, 11

		mGetTiles 0x6083 20
		.4byte	6, 12

		mGetTiles 0x6097 16
		.4byte	3, 13

		mGetTiles 0x60A7 16
		.4byte	3, 14

		mAnimCmd4 


.align 2, 0
	anim_0105:
		.4byte anim_data__0105_0




.align 2, 0
	anim_data__0107_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x60B7 12
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x60C3 12
		.4byte	1, 1

		mGetTiles 0x60CF 16
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	3, 2

		mGetTiles 0x60DF 20
		mAnimCmd6 0x0 0x606ECFA
		mAnimCmd6 0x1 0x810E8F0
		.4byte	2, 3

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x611B 20
		.4byte	2, 6

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x611B 20
		.4byte	2, 6

		mGetTiles 0x60F3 20
		.4byte	2, 4

		mGetTiles 0x6107 20
		.4byte	2, 5

		mGetTiles 0x612F 20
		.4byte	2, 7

		mGetTiles 0x6143 20
		.4byte	2, 8

		mGetTiles 0x6157 25
		.4byte	2, 9

		mGetTiles 0x6170 25
		.4byte	2, 10

		mGetTiles 0x6189 16
		mAnimCmd6 0x0 0x1006F6FA
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	2, 11

		mGetTiles 0x6199 16
		mAnimCmd6 0x1 0x0
		.4byte	4, 12

		mGetTiles 0x61A9 16
		.4byte	2, 13

		mGetTiles 0x61B9 16
		.4byte	2, 14

		mAnimCmd4 


.align 2, 0
	anim_0107:
		.4byte anim_data__0107_0




.align 2, 0
	anim_data__0108_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x61C9 16
		mAnimCmd6 0x0 0xA06F4FA
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	1, 0

		mGetTiles 0x61D9 16
		.4byte	1, 1

		mGetTiles 0x61E9 16
		.4byte	1, 2

		mGetTiles 0x61F9 16
		.4byte	1, 3

		mGetTiles 0x6209 20
		mAnimCmd6 0x0 0xA06F4FA
		mAnimCmd6 0x1 0x1010F0F0
		.4byte	2, 4

		mGetTiles 0x621D 20
		.4byte	2, 5

		mGetTiles 0x6231 20
		.4byte	2, 6

		mGetTiles 0x6209 20
		.4byte	2, 4

		mGetTiles 0x621D 20
		.4byte	2, 5

		mGetTiles 0x6231 20
		.4byte	2, 6

		mAnimCmd4 

	anim_data__0108_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6245 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 7

		mGetTiles 0x6259 20
		.4byte	2, 8

		mGetTiles 0x626D 16
		.4byte	2, 9

		mGetTiles 0x627D 20
		.4byte	2, 10

		mGetTiles 0x6291 20
		.4byte	2, 11

		mGetTiles 0x62A5 24
		.4byte	2, 12

		mGetTiles 0x62BD 24
		.4byte	2, 13

		mGetTiles 0x62D5 24
		.4byte	2, 14

		mJumpBack 0xF


.align 2, 0
	anim_0108:
		.4byte anim_data__0108_0
		.4byte anim_data__0108_1




.align 2, 0
	anim_data__0109_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x62ED 24
		mAnimCmd6 0x0 0x806F2FA
		.4byte	1, 0

		mGetTiles 0x6305 24
		.4byte	1, 1

		mGetTiles 0x631D 20
		.4byte	1, 2

		mGetTiles 0x6331 25
		.4byte	3, 3

		mGetTiles 0x634A 25
		.4byte	1, 4

		mGetTiles 0x6363 24
		.4byte	1, 5

		mGetTiles 0x637B 25
		.4byte	1, 6

		mGetTiles 0x6394 25
		.4byte	2, 7

		mGetTiles 0x63AD 20
		.4byte	2, 8

		mGetTiles 0x63C1 25
		.4byte	2, 9

		mGetTiles 0x63DA 20
		.4byte	2, 10

		mGetTiles 0x63EE 20
		.4byte	4, 11

		mGetTiles 0x6402 25
		.4byte	3, 12

		mGetTiles 0x641B 20
		.4byte	3, 13

		mGetTiles 0x642F 24
		.4byte	3, 14

		mGetTiles 0x6447 28
		.4byte	3, 15

		mGetTiles 0x6463 28
		.4byte	3, 16

		mGetTiles 0x647F 28
		.4byte	3, 17

		mJumpBack 0xF


.align 2, 0
	anim_0109:
		.4byte anim_data__0109_0




.align 2, 0
	anim_data__0110_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x649B 16
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x64AB 16
		.4byte	4, 1

		mGetTiles 0x64BB 25
		.4byte	4, 2

		mGetTiles 0x64D4 24
		.4byte	4, 3

		mGetTiles 0x64EC 24
		.4byte	4, 4

		mGetTiles 0x6504 20
		.4byte	2, 5

		mGetTiles 0x6518 24
		.4byte	1, 6

		mGetTiles 0x6530 16
		.4byte	1, 7

		mGetTiles 0x649B 16
		.4byte	2, 0

		mGetTiles 0x64AB 16
		.4byte	4, 1

		mGetTiles 0x64BB 25
		.4byte	4, 2

		mGetTiles 0x64D4 24
		.4byte	4, 3

		mGetTiles 0x6540 24
		.4byte	4, 8

		mGetTiles 0x6558 20
		.4byte	2, 9

		mGetTiles 0x656C 24
		.4byte	1, 10

		mGetTiles 0x6530 16
		.4byte	1, 7

		mJumpBack 0x56

	anim_data__0110_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6584 16
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	1, 11

		mGetTiles 0x6594 16
		.4byte	1, 12

		mAnimCmd4 


.align 2, 0
	anim_0110:
		.4byte anim_data__0110_0
		.4byte anim_data__0110_1




.align 2, 0
	anim_data__0111_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x65A4 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x65BC 20
		.4byte	2, 1

		mGetTiles 0x65D0 24
		mAnimCmd6 0x0 0xA06F4FA
		mAnimCmd6 0x1 0x110607FA
		.4byte	2, 2

		mGetTiles 0x65E8 28
		.4byte	2, 3

		mGetTiles 0x6604 20
		.4byte	2, 4

		mJumpBack 0x15


.align 2, 0
	anim_0111:
		.4byte anim_data__0111_0




.align 2, 0
	anim_data__0112_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6618 16
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	6, 0

		mGetTiles 0x6628 16
		.4byte	3, 1

		mGetTiles 0x6638 16
		.4byte	6, 2

		mGetTiles 0x6648 16
		.4byte	6, 3

		mGetTiles 0x6658 16
		.4byte	6, 4

		mGetTiles 0x6668 16
		.4byte	6, 5

		mGetTiles 0x6678 16
		.4byte	6, 6

		mGetTiles 0x6688 16
		.4byte	6, 7

		mGetTiles 0x6698 16
		.4byte	6, 8

		mGetTiles 0x66A8 16
		.4byte	6, 9

		mJumpBack 0x28


.align 2, 0
	anim_0112:
		.4byte anim_data__0112_0




.align 2, 0
	anim_data__0113_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x66B8 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x66F8 64
		.4byte	1, 1

		mGetTiles 0x6738 64
		.4byte	2, 2

		mGetTiles 0x6778 64
		.4byte	1, 3

		mGetTiles 0x67B8 64
		.4byte	1, 4

		mGetTiles 0x67F8 64
		.4byte	1, 5

		mGetTiles 0x6838 64
		.4byte	1, 6

		mGetTiles 0x6878 64
		.4byte	2, 7

		mGetTiles 0x68B8 64
		.4byte	1, 8

		mGetTiles 0x68F8 64
		.4byte	1, 9

		mGetTiles 0x6938 64
		.4byte	1, 10

		mGetTiles 0x6978 64
		.4byte	2, 11

		mGetTiles 0x69B8 64
		.4byte	2, 12

		mGetTiles 0x69F8 64
		.4byte	2, 13

		mGetTiles 0x6A38 64
		.4byte	2, 14

		mGetTiles 0x6A78 64
		.4byte	2, 15

		mAnimCmd4 


.align 2, 0
	anim_0113:
		.4byte anim_data__0113_0




.align 2, 0
	anim_data__0119_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6AB8 16
		mAnimCmd6 0x0 0xD06F3FA
		.4byte	3, 0

		mGetTiles 0x6AC8 20
		.4byte	3, 1

		mGetTiles 0x6ADC 16
		.4byte	3, 2

		mGetTiles 0x6AEC 12
		.4byte	3, 3

		mGetTiles 0x6AF8 16
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0119_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6B08 20
		mAnimCmd6 0x0 0xD06F3FA
		.4byte	5, 5

		mGetTiles 0x6B1C 15
		.4byte	5, 6

		mGetTiles 0x6B2B 20
		.4byte	5, 7

		mGetTiles 0x6B3F 20
		.4byte	5, 8

		mGetTiles 0x6B53 20
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0119_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6B67 16
		.4byte	2, 10

		mGetTiles 0x6B77 20
		.4byte	2, 11

		mGetTiles 0x6B8B 20
		.4byte	2, 12

		mGetTiles 0x6B9F 20
		.4byte	2, 13

		mGetTiles 0x6BB3 16
		.4byte	2, 14

		mAnimCmd4 


.align 2, 0
	anim_0119:
		.4byte anim_data__0119_0
		.4byte anim_data__0119_1
		.4byte anim_data__0119_2




.align 2, 0
	anim_data__0120_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6BC3 20
		.4byte	3, 0

		mGetTiles 0x6BD7 20
		.4byte	3, 1

		mGetTiles 0x6BEB 20
		.4byte	2, 2

		mGetTiles 0x6BFF 24
		.4byte	3, 3

		mGetTiles 0x6C17 24
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0120:
		.4byte anim_data__0120_0




.align 2, 0
	anim_data__0121_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6C2F 20
		.4byte	6, 0

		mGetTiles 0x6C43 20
		.4byte	6, 1

		mGetTiles 0x6C2F 20
		.4byte	6, 0

		mGetTiles 0x6C57 20
		.4byte	6, 2

		mGetTiles 0x6C2F 20
		.4byte	6, 0

		mGetTiles 0x6C43 20
		.4byte	6, 1

		mGetTiles 0x6C2F 20
		.4byte	26, 0

		mGetTiles 0x6C6B 16
		.4byte	4, 3

		mGetTiles 0x6C7B 20
		.4byte	4, 4

		mGetTiles 0x6C8F 16
		.4byte	4, 5

		mGetTiles 0x6C9F 16
		.4byte	4, 6

		mGetTiles 0x6CAF 16
		.4byte	6, 7

		mGetTiles 0x6CBF 20
		.4byte	3, 8

		mGetTiles 0x6CD3 16
		.4byte	3, 9

		mGetTiles 0x6CE3 20
		.4byte	3, 10

		mGetTiles 0x6CBF 20
		.4byte	3, 8

		mGetTiles 0x6CD3 16
		.4byte	3, 9

		mGetTiles 0x6CE3 20
		.4byte	3, 10

		mGetTiles 0x6CBF 20
		.4byte	3, 8

		mGetTiles 0x6CD3 16
		.4byte	3, 9

		mGetTiles 0x6CE3 20
		.4byte	3, 10

		mGetTiles 0x6CF7 16
		.4byte	6, 11

		mGetTiles 0x6D07 16
		.4byte	4, 12

		mGetTiles 0x6D17 16
		.4byte	4, 13

		mGetTiles 0x6D27 16
		.4byte	8, 14

		mGetTiles 0x6D37 16
		.4byte	2, 15

		mGetTiles 0x6D47 20
		.4byte	2, 16

		mGetTiles 0x6D5B 20
		.4byte	5, 17

		mGetTiles 0x6D6F 25
		.4byte	3, 18

		mGetTiles 0x6D88 16
		.4byte	3, 19

		mGetTiles 0x6D98 20
		.4byte	14, 20

		mGetTiles 0x6DAC 20
		.4byte	3, 21

		mGetTiles 0x6DC0 20
		.4byte	3, 22

		mGetTiles 0x6DD4 15
		.4byte	4, 23

		mGetTiles 0x6DE3 12
		.4byte	2, 24

		mGetTiles 0x6DEF 16
		.4byte	2, 25

		mAnimCmd4 

	anim_data__0121_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6DFF 16
		.4byte	1, 26

		mGetTiles 0x6E0F 16
		.4byte	6, 27

		mGetTiles 0x6E1F 16
		.4byte	60, 28

		mGetTiles 0x6E2F 20
		.4byte	4, 29

		mAnimCmd4 


.align 2, 0
	anim_0121:
		.4byte anim_data__0121_0
		.4byte anim_data__0121_1




.align 2, 0
	anim_data__0122_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6E43 25
		.4byte	3, 0

		mGetTiles 0x6E5C 25
		.4byte	3, 1

		mGetTiles 0x6E75 25
		.4byte	3, 2

		mGetTiles 0x6E8E 16
		.4byte	3, 3

		mGetTiles 0x6E9E 25
		.4byte	3, 4

		mGetTiles 0x6EB7 25
		.4byte	3, 5

		mGetTiles 0x6ED0 25
		.4byte	3, 6

		mGetTiles 0x6EE9 20
		.4byte	3, 7

		mGetTiles 0x6E43 25
		.4byte	3, 0

		mGetTiles 0x6E5C 25
		.4byte	3, 1

		mGetTiles 0x6E75 25
		.4byte	3, 2

		mGetTiles 0x6E8E 16
		.4byte	3, 3

		mGetTiles 0x6E9E 25
		.4byte	3, 4

		mGetTiles 0x6EB7 25
		.4byte	3, 5

		mGetTiles 0x6ED0 25
		.4byte	3, 6

		mGetTiles 0x6EE9 20
		.4byte	3, 7

		mGetPalette 0x7 16 0x0
		mGetTiles 0x6EFD 16
		.4byte	2, 8

		mGetTiles 0x6F0D 20
		.4byte	2, 9

		mGetTiles 0x6F21 20
		.4byte	2, 10

		mAnimCmd4 

	anim_data__0122_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6F35 25
		.4byte	3, 11

		mGetTiles 0x6F4E 20
		.4byte	3, 12

		mGetTiles 0x6F62 25
		.4byte	3, 13

		mGetTiles 0x6F7B 20
		.4byte	3, 14

		mJumpBack 0x17

	anim_data__0122_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6F8F 20
		.4byte	2, 15

		mGetTiles 0x6FA3 16
		.4byte	2, 16

		mGetTiles 0x6FB3 16
		.4byte	4, 17

		mGetTiles 0x6FC3 16
		.4byte	2, 18

		mGetTiles 0x6FD3 16
		.4byte	2, 19

		mGetTiles 0x6FE3 16
		.4byte	4, 20

		mAnimCmd4 


.align 2, 0
	anim_0122:
		.4byte anim_data__0122_0
		.4byte anim_data__0122_1
		.4byte anim_data__0122_2




.align 2, 0
	anim_data__0123_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x6FF3 12
		.4byte	8, 0

		mGetTiles 0x6FFF 15
		.4byte	8, 1

		mGetTiles 0x700E 20
		.4byte	8, 2

		mGetTiles 0x7022 20
		.4byte	8, 3

		mGetTiles 0x7036 20
		.4byte	4, 4

		mGetTiles 0x704A 20
		.4byte	4, 5

		mGetTiles 0x7036 20
		.4byte	4, 4

		mGetTiles 0x7022 20
		.4byte	8, 3

		mGetTiles 0x705E 15
		.4byte	4, 6

		mGetTiles 0x706D 12
		.4byte	4, 7

		mGetTiles 0x7079 16
		.4byte	4, 8

		mGetTiles 0x7089 16
		.4byte	6, 9

		mGetTiles 0x7099 16
		.4byte	4, 10

		mGetTiles 0x70A9 24
		.4byte	5, 11

		mGetTiles 0x70C1 20
		.4byte	5, 12

		mGetTiles 0x70D5 24
		.4byte	5, 13

		mGetTiles 0x70ED 16
		.4byte	5, 14

		mGetTiles 0x70FD 16
		.4byte	5, 15

		mGetTiles 0x710D 16
		.4byte	5, 16

		mGetTiles 0x711D 24
		.4byte	5, 17

		mGetTiles 0x7135 20
		.4byte	5, 18

		mGetTiles 0x7149 24
		.4byte	5, 19

		mGetTiles 0x70ED 16
		.4byte	5, 14

		mGetTiles 0x7161 16
		.4byte	5, 20

		mGetTiles 0x710D 16
		.4byte	5, 16

		mJumpBack 0x3C


.align 2, 0
	anim_0123:
		.4byte anim_data__0123_0




.align 2, 0
	anim_data__0124_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7171 20
		.4byte	6, 0

		mGetTiles 0x7185 16
		.4byte	6, 1

		mGetTiles 0x7171 20
		.4byte	6, 0

		mGetTiles 0x7195 20
		.4byte	6, 2

		mGetTiles 0x71A9 20
		.4byte	6, 3

		mGetTiles 0x71BD 16
		.4byte	6, 4

		mGetTiles 0x71A9 20
		.4byte	6, 3

		mGetTiles 0x71CD 20
		.4byte	6, 5

		mJumpBack 0x2B

	anim_data__0124_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x71E1 16
		.4byte	4, 6

		mGetTiles 0x71F1 16
		.4byte	6, 7

		mGetTiles 0x7201 16
		.4byte	4, 8

		mGetTiles 0x7211 16
		.4byte	4, 9

		mGetTiles 0x7221 16
		.4byte	4, 10

		mGetTiles 0x7231 16
		.4byte	4, 11

		mGetTiles 0x7221 16
		.4byte	4, 10

		mGetTiles 0x7211 16
		.4byte	4, 9

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	4, 12

		mGetTiles 0x7241 16
		.4byte	8, 12

		mGetTiles 0x7251 16
		.4byte	4, 13

		mGetTiles 0x7261 16
		.4byte	4, 14

		mGetTiles 0x7271 16
		.4byte	4, 15

		mGetTiles 0x7281 12
		.4byte	6, 16

		mGetTiles 0x728D 16
		.4byte	4, 17

		mGetTiles 0x729D 16
		.4byte	4, 18

		mGetTiles 0x72AD 20
		.4byte	4, 19

		mGetTiles 0x72C1 20
		.4byte	4, 20

		mGetTiles 0x72C1 20
		.4byte	4, 20

		mGetTiles 0x72C1 20
		.4byte	16, 20

		mAnimCmd4 


.align 2, 0
	anim_0124:
		.4byte anim_data__0124_0
		.4byte anim_data__0124_1




.align 2, 0
	anim_data__0125_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x72D5 20
		.4byte	3, 0

		mGetTiles 0x72E9 12
		.4byte	4, 1

		mGetTiles 0x72F5 15
		.4byte	3, 2

		mGetTiles 0x7304 15
		.4byte	3, 3

		mGetTiles 0x7313 15
		.4byte	3, 4

		mGetTiles 0x7322 20
		.4byte	3, 5

		mGetTiles 0x7336 25
		.4byte	3, 6

		mGetTiles 0x734F 15
		.4byte	3, 7

		mGetTiles 0x735E 20
		.4byte	3, 8

		mGetTiles 0x7372 16
		.4byte	3, 9

		mGetTiles 0x7382 16
		.4byte	3, 10

		mGetTiles 0x7392 20
		.4byte	8, 11

		mGetTiles 0x73A6 20
		.4byte	4, 12

		mGetTiles 0x73BA 20
		.4byte	4, 13

		mGetTiles 0x73CE 20
		.4byte	4, 14

		mGetTiles 0x73E2 20
		.4byte	4, 15

		mGetTiles 0x73F6 20
		.4byte	60, 16

		mAnimCmd4 


.align 2, 0
	anim_0125:
		.4byte anim_data__0125_0




.align 2, 0
	anim_data__0126_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x740A 20
		.4byte	2, 0

		mGetTiles 0x741E 16
		.4byte	2, 1

		mGetTiles 0x742E 16
		.4byte	2, 2

		mGetTiles 0x743E 16
		.4byte	2, 3

		mGetTiles 0x744E 16
		.4byte	2, 4

		mGetTiles 0x745E 20
		.4byte	3, 5

		mGetTiles 0x7472 16
		.4byte	3, 6

		mGetTiles 0x7482 20
		.4byte	3, 7

		mGetTiles 0x7496 25
		.4byte	3, 8

		mGetTiles 0x74AF 20
		.4byte	3, 9

		mGetTiles 0x74C3 16
		.4byte	3, 10

		mGetTiles 0x74D3 16
		.4byte	3, 11

		mGetTiles 0x74E3 16
		.4byte	3, 12

		mGetTiles 0x74F3 20
		.4byte	3, 13

		mGetTiles 0x7472 16
		.4byte	3, 6

		mGetTiles 0x7482 20
		.4byte	3, 7

		mGetTiles 0x7496 25
		.4byte	3, 8

		mGetTiles 0x74AF 20
		.4byte	3, 9

		mGetTiles 0x7507 16
		.4byte	3, 14

		mGetTiles 0x7517 16
		.4byte	3, 15

		mGetTiles 0x7527 16
		.4byte	3, 16

		mGetTiles 0x74F3 20
		.4byte	3, 13

		mJumpBack 0x50


.align 2, 0
	anim_0126:
		.4byte anim_data__0126_0




.align 2, 0
	anim_data__0127_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7537 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0127_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7543 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0127_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7553 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0127_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7563 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0127_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x756F 15
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0127_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x757E 15
		.4byte	6, 5

		mGetTiles 0x758D 15
		.4byte	6, 6

		mGetTiles 0x759C 15
		.4byte	8, 7

		mGetTiles 0x75AB 15
		.4byte	6, 8

		mGetTiles 0x757E 15
		.4byte	6, 5

		mAnimCmd4 


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
		mGetPalette 0x7 16 0x20
		mGetTiles 0x75BA 12
		.4byte	4, 0

		mGetTiles 0x75C6 12
		.4byte	4, 1

		mGetTiles 0x75D2 12
		.4byte	4, 2

		mGetTiles 0x75C6 12
		.4byte	4, 1

		mJumpBack 0x17


.align 2, 0
	anim_0129:
		.4byte anim_data__0129_0




.align 2, 0
	anim_data__0130_0:
		mGetPalette 0x7 16 0x20
		mGetTiles 0x75DE 20
		.4byte	3, 0

		mGetTiles 0x75F2 20
		.4byte	3, 1

		mGetTiles 0x7606 20
		.4byte	3, 2

		mGetTiles 0x761A 25
		.4byte	3, 3

		mGetTiles 0x7633 20
		.4byte	3, 4

		mGetTiles 0x7647 20
		.4byte	3, 5

		mGetTiles 0x765B 15
		.4byte	3, 6

		mGetTiles 0x766A 20
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0130:
		.4byte anim_data__0130_0




.align 2, 0
	anim_data__0135_0:
		mGetPalette 0x7 16 0x20
		mGetTiles 0x767E 20
		.4byte	4, 0

		mGetTiles 0x7692 15
		.4byte	4, 1

		mGetTiles 0x76A1 15
		.4byte	4, 2

		mGetTiles 0x76B0 15
		.4byte	4, 3

		mGetTiles 0x76A1 15
		.4byte	4, 2

		mGetTiles 0x7692 15
		.4byte	4, 1

		mJumpBack 0x21


.align 2, 0
	anim_0135:
		.4byte anim_data__0135_0




.align 2, 0
	anim_data__0139_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x76BF 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	1, 0

		mGetTiles 0x76D7 20
		.4byte	4, 1

		mGetTiles 0x76EB 16
		.4byte	4, 2

		mGetTiles 0x76FB 18
		.4byte	4, 3

		mGetTiles 0x770D 20
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0139_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x770D 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0x7721 24
		.4byte	2, 5

		mGetTiles 0x7739 20
		.4byte	2, 6

		mGetTiles 0x774D 24
		.4byte	3, 7

		mGetTiles 0x7765 24
		.4byte	3, 8

		mGetTiles 0x777D 24
		.4byte	3, 9

		mJumpBack 0xF

	anim_data__0139_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7795 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 10

		mGetTiles 0x77AD 20
		.4byte	2, 11

		mGetTiles 0x77C1 16
		.4byte	2, 12

		mGetTiles 0x77D1 20
		.4byte	2, 13

		mGetTiles 0x77E5 24
		.4byte	2, 14

		mGetTiles 0x77FD 28
		.4byte	3, 15

		mGetTiles 0x7819 28
		.4byte	3, 16

		mGetTiles 0x7835 28
		.4byte	3, 17

		mJumpBack 0xF


.align 2, 0
	anim_0139:
		.4byte anim_data__0139_0
		.4byte anim_data__0139_1
		.4byte anim_data__0139_2




.align 2, 0
	anim_data__0140_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7851 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x7869 24
		.4byte	2, 1

		mGetTiles 0x7881 20
		.4byte	4, 2

		mGetTiles 0x7895 24
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0140_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x78AD 18
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0x78BF 24
		.4byte	2, 5

		mGetTiles 0x78D7 30
		.4byte	2, 6

		mGetTiles 0x78F5 24
		.4byte	2, 7

		mGetTiles 0x790D 18
		.4byte	2, 8

		mGetTiles 0x791F 30
		.4byte	2, 9

		mGetTiles 0x793D 25
		.4byte	2, 10

		mGetTiles 0x7956 24
		.4byte	2, 11

		mJumpBack 0x2E


.align 2, 0
	anim_0140:
		.4byte anim_data__0140_0
		.4byte anim_data__0140_1




.align 2, 0
	anim_data__0141_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x796E 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x7986 20
		.4byte	2, 1

		mGetTiles 0x799A 24
		.4byte	4, 2

		mGetTiles 0x79B2 12
		.4byte	6, 3

		mGetTiles 0x79BE 24
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0141_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x79D6 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 5

		mGetTiles 0x79EA 20
		.4byte	2, 6

		mGetTiles 0x79FE 20
		.4byte	3, 7

		mGetTiles 0x7A12 20
		.4byte	3, 8

		mGetTiles 0x7A26 16
		.4byte	3, 9

		mJumpBack 0xF

	anim_data__0141_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7A36 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 10

		mGetTiles 0x7A4A 30
		.4byte	2, 11

		mGetTiles 0x7A68 28
		.4byte	2, 12

		mGetTiles 0x7A84 28
		.4byte	3, 13

		mGetTiles 0x7AA0 28
		.4byte	3, 14

		mGetTiles 0x7ABC 28
		.4byte	3, 15

		mJumpBack 0xF


.align 2, 0
	anim_0141:
		.4byte anim_data__0141_0
		.4byte anim_data__0141_1
		.4byte anim_data__0141_2




.align 2, 0
	anim_data__0142_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7AD8 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x7AF0 20
		.4byte	2, 1

		mGetTiles 0x7B04 24
		.4byte	4, 2

		mGetTiles 0x7B1C 20
		.4byte	6, 3

		mGetTiles 0x7B30 24
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0142_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7B48 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 5

		mGetTiles 0x7B5C 20
		.4byte	2, 6

		mGetTiles 0x7B70 20
		.4byte	2, 7

		mGetTiles 0x7B84 30
		mAnimCmd6 0x0 0xA06F4FA
		mAnimCmd6 0x1 0xA0600FA
		.4byte	3, 8

		mGetTiles 0x7BA2 30
		.4byte	3, 9

		mGetTiles 0x7BC0 30
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0142:
		.4byte anim_data__0142_0
		.4byte anim_data__0142_1




.align 2, 0
	anim_data__0143_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7BDE 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 0

		mGetTiles 0x7BF6 24
		.4byte	3, 1

		mGetTiles 0x7C0E 24
		.4byte	3, 2

		mGetTiles 0x7C26 24
		.4byte	3, 3

		mJumpBack 0xF

	anim_data__0143_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7BDE 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0x7C3E 24
		.4byte	3, 4

		mGetTiles 0x7C56 20
		.4byte	3, 5

		mGetTiles 0x7C6A 16
		.4byte	4, 6

		mGetTiles 0x7C7A 20
		.4byte	4, 7

		mGetTiles 0x7C8E 24
		.4byte	4, 8

		mAnimCmd4 

	anim_data__0143_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7CA6 28
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 9

		mGetTiles 0x7CC2 28
		.4byte	3, 10

		mGetTiles 0x7CDE 28
		.4byte	3, 11

		mJumpBack 0x15


.align 2, 0
	anim_0143:
		.4byte anim_data__0143_0
		.4byte anim_data__0143_1
		.4byte anim_data__0143_2




.align 2, 0
	anim_data__0144_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7CFA 20
		mAnimCmd6 0x0 0x506EFFA
		.4byte	4, 0

		mGetTiles 0x7D0E 20
		.4byte	4, 1

		mGetTiles 0x7D22 15
		.4byte	4, 2

		mGetTiles 0x7D31 20
		.4byte	4, 3

		mGetTiles 0x7D45 24
		.4byte	4, 4

		mGetTiles 0x7D5D 25
		.4byte	4, 5

		mGetTiles 0x7D76 20
		.4byte	4, 6

		mGetTiles 0x7D8A 20
		.4byte	4, 7

		mGetTiles 0x7D9E 16
		.4byte	4, 8

		mGetTiles 0x7DAE 20
		.4byte	4, 9

		mGetTiles 0x7DC2 25
		.4byte	4, 10

		mGetTiles 0x7DDB 24
		.4byte	2, 11

		mGetTiles 0x7DF3 28
		.4byte	3, 12

		mGetTiles 0x7E0F 28
		.4byte	3, 13

		mGetTiles 0x7E2B 28
		.4byte	3, 14

		mJumpBack 0xF


.align 2, 0
	anim_0144:
		.4byte anim_data__0144_0




.align 2, 0
	anim_data__0145_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7E47 16
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x7E57 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 1

		mGetTiles 0x7E6B 20
		.4byte	2, 2

		mGetTiles 0x7E7F 20
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0145_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7E93 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0x7EA7 20
		.4byte	2, 5

		mGetTiles 0x7EBB 16
		.4byte	2, 6

		mGetTiles 0x7ECB 20
		.4byte	2, 7

		mGetTiles 0x7EDF 24
		.4byte	2, 8

		mGetTiles 0x7EF7 28
		.4byte	2, 9

		mGetTiles 0x7F13 28
		.4byte	2, 10

		mGetTiles 0x7F2F 28
		.4byte	2, 11

		mJumpBack 0xF


.align 2, 0
	anim_0145:
		.4byte anim_data__0145_0
		.4byte anim_data__0145_1




.align 2, 0
	anim_data__0146_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x7F4B 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x7F8B 64
		.4byte	2, 1

		mGetTiles 0x7FCB 64
		.4byte	2, 2

		mGetTiles 0x800B 64
		.4byte	2, 3

		mGetTiles 0x804B 64
		.4byte	2, 4

		mGetTiles 0x808B 64
		.4byte	2, 5

		mGetTiles 0x7F4B 64
		.4byte	2, 0

		mGetTiles 0x7F8B 64
		.4byte	2, 1

		mGetTiles 0x7FCB 64
		.4byte	2, 2

		mGetTiles 0x80CB 64
		.4byte	2, 6

		mGetTiles 0x810B 64
		.4byte	2, 7

		mGetTiles 0x814B 64
		.4byte	2, 8

		mJumpBack 0x42


.align 2, 0
	anim_0146:
		.4byte anim_data__0146_0




.align 2, 0
	anim_data__0148_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x818B 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0148_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x819F 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0148_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81B3 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0148_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81C7 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0148_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81DB 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0148_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x81EF 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0148_6:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8203 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0148_7:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8217 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8227 20
		mAnimCmd6 0x0 0xA0AFAF6
		.4byte	5, 0

		mGetTiles 0x823B 16
		.4byte	5, 1

		mGetTiles 0x824B 20
		.4byte	5, 2

		mGetTiles 0x825F 16
		.4byte	5, 3

		mGetTiles 0x826F 20
		.4byte	5, 4

		mGetTiles 0x8283 16
		.4byte	5, 5

		mGetTiles 0x8293 20
		.4byte	5, 6

		mGetTiles 0x82A7 16
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0149:
		.4byte anim_data__0149_0




.align 2, 0
	anim_data__0150_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x82B7 18
		mAnimCmd6 0x0 0x1F0709F9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0150_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x82C9 20
		mAnimCmd6 0x0 0x18FE04EC
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0150_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x82DD 15
		mAnimCmd6 0x0 0xFFB00E6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0150_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x82EC 20
		mAnimCmd6 0x0 0x8FAFBE5
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0150_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8300 20
		mAnimCmd6 0x0 0xFCF1E8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0150_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8314 15
		mAnimCmd6 0x0 0xFC00E8ED
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0150_6:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8323 18
		mAnimCmd6 0x0 0xFA07E2F8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0150_7:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8335 20
		mAnimCmd6 0x0 0xFB0EE601
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0150_8:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8349 16
		mAnimCmd6 0x0 0x215ED03
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0150_9:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8359 18
		mAnimCmd6 0x0 0x91FF807
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0150_10:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x836B 20
		mAnimCmd6 0x0 0x121B0305
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0150_11:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x837F 20
		mAnimCmd6 0x0 0x1B140702
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8393 18
		mAnimCmd6 0x0 0xFA07E2F8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0151_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83A5 15
		mAnimCmd6 0x0 0xFC00E8ED
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0151_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83B4 20
		mAnimCmd6 0x0 0xFCF1E8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0151_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83C8 20
		mAnimCmd6 0x0 0x8FAFBE5
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0151_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83DC 15
		mAnimCmd6 0x0 0xFFB00E6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0151_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83EB 20
		mAnimCmd6 0x0 0x18FE04EC
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0151_6:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x83FF 18
		mAnimCmd6 0x0 0x1F0709F9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0151_7:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8411 20
		mAnimCmd6 0x0 0x1B140702
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0151_8:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8425 20
		mAnimCmd6 0x0 0x121B0305
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0151_9:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8439 18
		mAnimCmd6 0x0 0x91FF807
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0151_10:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x844B 16
		mAnimCmd6 0x0 0x215ED03
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0151_11:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x845B 20
		mAnimCmd6 0x0 0xFB0EE601
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x7 16 0x0
		mGetTiles 0x846F 15
		mAnimCmd6 0x0 0x405EEF9
		.4byte	8, 0

		mGetTiles 0x847E 15
		.4byte	8, 1

		mGetTiles 0x848D 15
		.4byte	8, 2

		mGetTiles 0x847E 15
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0152:
		.4byte anim_data__0152_0




.align 2, 0
	anim_data__0153_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x849C 24
		mAnimCmd6 0x0 0x18FE04F2
		.4byte	2, 0

		mGetTiles 0x84B4 20
		mAnimCmd6 0x0 0x14FE04F2
		.4byte	2, 1

		mGetTiles 0x84C8 16
		mAnimCmd6 0x0 0x10FE02F2
		.4byte	2, 2

		mGetTiles 0x84D8 24
		mAnimCmd6 0x0 0xCFEFEF2
		.4byte	2, 3

		mGetTiles 0x84F0 28
		mAnimCmd6 0x0 0x2FEF4F2
		.4byte	4, 4

		mGetTiles 0x850C 20
		mAnimCmd6 0x0 0x2FEF4F2
		.4byte	3, 5

		mGetTiles 0x8520 12
		mAnimCmd6 0x0 0x8FEF8F2
		.4byte	2, 6

		mGetTiles 0x852C 24
		mAnimCmd6 0x0 0x14FE04F2
		.4byte	2, 7

		mGetTiles 0x849C 24
		mAnimCmd6 0x0 0x18FE04F2
		.4byte	4, 0

		mGetTiles 0x84B4 20
		mAnimCmd6 0x0 0x14FE04F2
		.4byte	3, 1

		mGetTiles 0x84C8 16
		mAnimCmd6 0x0 0x10FE02F2
		.4byte	2, 2

		mGetTiles 0x84D8 24
		mAnimCmd6 0x0 0xCFEFEF2
		.4byte	2, 3

		mGetTiles 0x84F0 28
		mAnimCmd6 0x0 0x2FEF4F2
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0153_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8544 24
		mAnimCmd6 0x0 0xFDFEE9F2
		.4byte	2, 8

		mGetTiles 0x855C 20
		mAnimCmd6 0x0 0xFCFEECF2
		.4byte	2, 9

		mGetTiles 0x8570 16
		mAnimCmd6 0x0 0xFEFEEEF2
		.4byte	2, 10

		mGetTiles 0x8580 24
		mAnimCmd6 0x0 0x4FEF6F2
		.4byte	2, 11

		mGetTiles 0x8598 28
		mAnimCmd6 0x0 0xEFEFCF2
		.4byte	4, 12

		mGetTiles 0x85B4 20
		mAnimCmd6 0x0 0xCFEFEF2
		.4byte	3, 13

		mGetTiles 0x85C8 12
		mAnimCmd6 0x0 0x6FEF8F2
		.4byte	2, 14

		mGetTiles 0x85D4 24
		mAnimCmd6 0x0 0xFEECF2
		.4byte	2, 15

		mGetTiles 0x8544 24
		mAnimCmd6 0x0 0xFDFEE9F2
		.4byte	4, 8

		mGetTiles 0x855C 20
		mAnimCmd6 0x0 0xFCFEECF2
		.4byte	3, 9

		mGetTiles 0x8570 16
		mAnimCmd6 0x0 0xFEFEEEF2
		.4byte	2, 10

		mGetTiles 0x8580 24
		mAnimCmd6 0x0 0x4FEF6F2
		.4byte	2, 11

		mGetTiles 0x8598 28
		mAnimCmd6 0x0 0xEFEFCF2
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0153:
		.4byte anim_data__0153_0
		.4byte anim_data__0153_1




.align 2, 0
	anim_data__0154_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x85EC 16
		mAnimCmd6 0x0 0x50EF8FE
		.4byte	2, 0

		mGetTiles 0x85FC 24
		mAnimCmd6 0x0 0xEF2FE
		.4byte	2, 1

		mGetTiles 0x8614 28
		mAnimCmd6 0x0 0xFC0EECFE
		.4byte	4, 2

		mGetTiles 0x8630 16
		mAnimCmd6 0x0 0xFC0EEEFE
		.4byte	3, 3

		mGetTiles 0x8640 16
		mAnimCmd6 0x0 0x60EF6FE
		.4byte	2, 4

		mGetTiles 0x8650 28
		mAnimCmd6 0x0 0xE0EFCFE
		.4byte	2, 5

		mGetTiles 0x866C 32
		mAnimCmd6 0x0 0x120E00FE
		.4byte	4, 6

		mGetTiles 0x868C 20
		mAnimCmd6 0x0 0x100EFEFE
		.4byte	3, 7

		mGetTiles 0x85EC 16
		mAnimCmd6 0x0 0x50EF8FE
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0154_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x86A0 16
		mAnimCmd6 0x0 0x80EFAFE
		.4byte	2, 8

		mGetTiles 0x86B0 24
		mAnimCmd6 0x0 0x120E02FE
		.4byte	2, 9

		mGetTiles 0x86C8 28
		mAnimCmd6 0x0 0x180E04FE
		.4byte	4, 10

		mGetTiles 0x86E4 16
		mAnimCmd6 0x0 0x120E00FE
		.4byte	3, 11

		mGetTiles 0x86F4 16
		mAnimCmd6 0x0 0xA0EFAFE
		.4byte	2, 12

		mGetTiles 0x8704 28
		mAnimCmd6 0x0 0x40EF4FE
		.4byte	2, 13

		mGetTiles 0x8720 32
		mAnimCmd6 0x0 0x40EEEFE
		.4byte	4, 14

		mGetTiles 0x8740 20
		mAnimCmd6 0x0 0x40EF2FE
		.4byte	3, 15

		mGetTiles 0x86A0 16
		mAnimCmd6 0x0 0x80EFAFE
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0154:
		.4byte anim_data__0154_0
		.4byte anim_data__0154_1




.align 2, 0
	anim_data__0155_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8754 12
		mAnimCmd6 0x0 0xF505E3F9
		.4byte	2, 0

		mGetTiles 0x8760 28
		mAnimCmd6 0x0 0xF5FBE3EF
		.4byte	2, 1

		mGetTiles 0x877C 24
		mAnimCmd6 0x0 0xF5F9E3ED
		.4byte	4, 2

		mGetTiles 0x8794 20
		mAnimCmd6 0x0 0xF5FDE3F1
		.4byte	3, 3

		mGetTiles 0x87A8 20
		mAnimCmd6 0x0 0xF505E3F9
		.4byte	2, 4

		mGetTiles 0x87BC 24
		mAnimCmd6 0x0 0xF50BE3FF
		.4byte	2, 5

		mGetTiles 0x87D4 28
		mAnimCmd6 0x0 0xF511E305
		.4byte	4, 6

		mGetTiles 0x87F0 20
		mAnimCmd6 0x0 0xF50FE303
		.4byte	3, 7

		mGetTiles 0x8754 12
		mAnimCmd6 0x0 0xF505E3F9
		.4byte	2, 0

		mGetTiles 0x8760 28
		mAnimCmd6 0x0 0xF5FBE3EF
		.4byte	2, 1

		mGetTiles 0x877C 24
		mAnimCmd6 0x0 0xF5F9E3ED
		.4byte	4, 2

		mGetTiles 0x8794 20
		mAnimCmd6 0x0 0xF5FDE3F1
		.4byte	3, 3

		mGetTiles 0x87A8 20
		mAnimCmd6 0x0 0xF505E3F9
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0155:
		.4byte anim_data__0155_0




.align 2, 0
	anim_data__0156_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8804 20
		mAnimCmd6 0x0 0x806F2FA
		.4byte	2, 0

		mGetTiles 0x8818 20
		.4byte	2, 1

		mGetTiles 0x882C 25
		.4byte	2, 2

		mGetTiles 0x8845 24
		.4byte	2, 3

		mGetTiles 0x885D 24
		.4byte	2, 4

		mGetTiles 0x8875 25
		.4byte	2, 5

		mGetTiles 0x888E 30
		.4byte	2, 6

		mGetTiles 0x88AC 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0156_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x88C0 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 8

		mGetTiles 0x88D4 20
		.4byte	2, 9

		mGetTiles 0x88E8 16
		.4byte	3, 10

		mGetTiles 0x88F8 20
		.4byte	3, 11

		mGetTiles 0x890C 24
		.4byte	3, 12

		mAnimCmd4 

	anim_data__0156_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8924 28
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 13

		mGetTiles 0x8940 28
		.4byte	3, 14

		mGetTiles 0x895C 28
		.4byte	3, 15

		mJumpBack 0x15


.align 2, 0
	anim_0156:
		.4byte anim_data__0156_0
		.4byte anim_data__0156_1
		.4byte anim_data__0156_2




.align 2, 0
	anim_data__0157_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8978 20
		mAnimCmd6 0x0 0xFE06E8FA
		.4byte	3, 0

		mGetTiles 0x898C 25
		.4byte	3, 1

		mGetTiles 0x89A5 20
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0157_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x89B9 20
		mAnimCmd6 0x0 0x6EAFA
		.4byte	3, 3

		mGetTiles 0x89CD 20
		.4byte	3, 4

		mGetTiles 0x89E1 15
		.4byte	3, 5

		mGetTiles 0x89F0 20
		.4byte	3, 6

		mGetTiles 0x8A04 25
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0157_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8A1D 25
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 8

		mGetTiles 0x8A36 25
		.4byte	3, 9

		mGetTiles 0x8A4F 25
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0157:
		.4byte anim_data__0157_0
		.4byte anim_data__0157_1
		.4byte anim_data__0157_2




.align 2, 0
	anim_data__0158_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8A68 20
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	5, 0

		mGetTiles 0x8A7C 16
		.4byte	5, 1

		mGetTiles 0x8A8C 20
		.4byte	5, 2

		mGetTiles 0x8AA0 16
		.4byte	5, 3

		mGetTiles 0x8AB0 20
		.4byte	5, 4

		mGetTiles 0x8AC4 16
		.4byte	5, 5

		mGetTiles 0x8AD4 20
		.4byte	5, 6

		mGetTiles 0x8AE8 16
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0158:
		.4byte anim_data__0158_0




.align 2, 0
	anim_data__0159_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8AF8 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0159_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B0C 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0159_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B20 15
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0159_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B2F 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0159_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B43 24
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0159_5:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B5B 25
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0159_6:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B74 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0159_7:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B88 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0159_8:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8B9C 16
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0159_9:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8BAC 20
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0159_10:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8BC0 25
		mAnimCmd6 0x0 0x604F0FA
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8BD9 20
		mAnimCmd6 0x0 0xC04F8FA
		.4byte	2, 0

		mGetTiles 0x8BED 20
		.4byte	2, 1

		mGetTiles 0x8C01 16
		.4byte	2, 2

		mGetTiles 0x8C11 20
		.4byte	2, 3

		mGetTiles 0x8C25 20
		.4byte	2, 4

		mGetTiles 0x8C39 16
		.4byte	2, 5

		mGetTiles 0x8C49 20
		.4byte	2, 6

		mGetTiles 0x8C5D 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0160_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8C71 20
		mAnimCmd6 0x0 0x604F4FA
		.4byte	2, 8

		mGetTiles 0x8C85 20
		.4byte	2, 9

		mGetTiles 0x8C99 16
		.4byte	2, 10

		mGetTiles 0x8CA9 20
		.4byte	2, 11

		mGetTiles 0x8CBD 20
		.4byte	2, 12

		mGetTiles 0x8CD1 16
		.4byte	2, 13

		mGetTiles 0x8CE1 20
		.4byte	2, 14

		mGetTiles 0x8CF5 20
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0160:
		.4byte anim_data__0160_0
		.4byte anim_data__0160_1




.align 2, 0
	anim_data__0161_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8D09 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x8D19 16
		.4byte	2, 1

		mGetTiles 0x8D29 16
		.4byte	2, 2

		mGetTiles 0x8D39 16
		.4byte	2, 3

		mGetTiles 0x8D49 16
		.4byte	2, 4

		mGetTiles 0x8D59 16
		.4byte	2, 5

		mGetTiles 0x8D69 16
		.4byte	2, 6

		mGetTiles 0x8D79 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0161:
		.4byte anim_data__0161_0




.align 2, 0
	anim_data__0162_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8D89 25
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x8DA2 25
		.4byte	2, 1

		mGetTiles 0x8DBB 25
		.4byte	2, 2

		mGetTiles 0x8DD4 16
		.4byte	2, 3

		mGetTiles 0x8DE4 25
		.4byte	2, 4

		mGetTiles 0x8DFD 25
		.4byte	2, 5

		mGetTiles 0x8E16 25
		.4byte	2, 6

		mGetTiles 0x8E2F 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0162_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8E43 20
		mAnimCmd6 0x0 0xA06ECFA
		.4byte	2, 8

		mGetTiles 0x8E57 20
		.4byte	2, 9

		mGetTiles 0x8E6B 20
		.4byte	2, 10

		mGetTiles 0x8E7F 20
		.4byte	2, 11

		mGetTiles 0x8E6B 20
		.4byte	2, 10

		mGetTiles 0x8E57 20
		.4byte	2, 9

		mJumpBack 0x24


.align 2, 0
	anim_0162:
		.4byte anim_data__0162_0
		.4byte anim_data__0162_1




.align 2, 0
	anim_data__0163_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8E93 24
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 0

		mGetTiles 0x8EAB 20
		mAnimCmd6 0x0 0x4FEEEF1
		.4byte	3, 1

		mGetTiles 0x8EBF 20
		mAnimCmd6 0x0 0x4FCEEEC
		.4byte	3, 2

		mGetTiles 0x8ED3 20
		mAnimCmd6 0x0 0x4FEEEF0
		.4byte	3, 3

		mGetTiles 0x8EE7 16
		mAnimCmd6 0x0 0x406EEF8
		.4byte	3, 4

		mGetTiles 0x8EF7 30
		mAnimCmd6 0x0 0x412EE04
		.4byte	3, 5

		mGetTiles 0x8F15 30
		mAnimCmd6 0x0 0x415EE06
		.4byte	3, 6

		mGetTiles 0x8F33 30
		mAnimCmd6 0x0 0x412EE03
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0163:
		.4byte anim_data__0163_0




.align 2, 0
	anim_data__0164_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8F51 20
		mAnimCmd6 0x0 0xB06F1FA
		.4byte	4, 0

		mGetTiles 0x8F65 20
		.4byte	4, 1

		mGetTiles 0x8F79 20
		.4byte	4, 2

		mGetTiles 0x8F8D 20
		.4byte	4, 3

		mGetTiles 0x8FA1 20
		.4byte	4, 4

		mGetTiles 0x8FB5 16
		.4byte	4, 5

		mGetTiles 0x8FC5 16
		.4byte	4, 6

		mGetTiles 0x8FD5 16
		.4byte	4, 7

		mJumpBack 0x2E

	anim_data__0164_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x8FE5 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	4, 8

		mGetTiles 0x8FFE 25
		.4byte	4, 9

		mGetTiles 0x9017 20
		.4byte	4, 10

		mGetTiles 0x902B 20
		.4byte	4, 11

		mGetTiles 0x903F 25
		.4byte	4, 12

		mGetTiles 0x9058 20
		.4byte	4, 13

		mGetTiles 0x906C 20
		.4byte	4, 14

		mGetTiles 0x9080 25
		.4byte	4, 15

		mJumpBack 0x2E

	anim_data__0164_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x9099 25
		mAnimCmd6 0x0 0x906EDFA
		.4byte	4, 16

		mGetTiles 0x90B2 25
		.4byte	4, 17

		mGetTiles 0x90CB 20
		.4byte	4, 18

		mGetTiles 0x90DF 20
		.4byte	4, 19

		mGetTiles 0x90F3 25
		.4byte	4, 20

		mGetTiles 0x910C 20
		.4byte	4, 21

		mGetTiles 0x9120 20
		.4byte	4, 22

		mGetTiles 0x9134 25
		.4byte	4, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0164:
		.4byte anim_data__0164_0
		.4byte anim_data__0164_1
		.4byte anim_data__0164_2




.align 2, 0
	anim_data__0165_0:
		mGetPalette 0x8 16 0x10
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0165:
		.4byte anim_data__0165_0




.align 2, 0
	anim_data__0166_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x914D 64
		mAnimCmd6 0x0 0x1206FEFA
		.4byte	2, 0

		mGetTiles 0x918D 64
		.4byte	2, 1

		mGetTiles 0x91CD 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0166:
		.4byte anim_data__0166_0




.align 2, 0
	anim_data__0176_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x920D 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0176_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x921D 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0176:
		.4byte anim_data__0176_0
		.4byte anim_data__0176_1




.align 2, 0
	anim_data__0177_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x922D 20
		.4byte	3, 0

		mGetTiles 0x9241 20
		.4byte	3, 1

		mGetTiles 0x9255 20
		.4byte	3, 2

		mGetTiles 0x9269 20
		.4byte	3, 3

		mGetTiles 0x927D 20
		.4byte	3, 4

		mGetTiles 0x9291 20
		.4byte	3, 5

		mJumpBack 0x21

	anim_data__0177_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x92A5 20
		.4byte	3, 6

		mGetTiles 0x92B9 20
		.4byte	3, 7

		mGetTiles 0x92CD 16
		.4byte	3, 8

		mGetTiles 0x92DD 20
		.4byte	3, 9

		mGetTiles 0x92F1 20
		.4byte	3, 10

		mGetTiles 0x9305 16
		.4byte	3, 11

		mJumpBack 0x21

	anim_data__0177_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x9315 20
		.4byte	3, 12

		mGetTiles 0x9329 25
		.4byte	3, 13

		mGetTiles 0x9342 20
		.4byte	3, 14

		mGetTiles 0x9356 20
		.4byte	3, 15

		mGetTiles 0x936A 20
		.4byte	3, 16

		mGetTiles 0x937E 20
		.4byte	3, 17

		mJumpBack 0x21

	anim_data__0177_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x9392 16
		.4byte	3, 18

		mGetTiles 0x93A2 20
		.4byte	3, 19

		mGetTiles 0x93B6 16
		.4byte	3, 20

		mGetTiles 0x93C6 16
		.4byte	3, 21

		mGetTiles 0x93D6 16
		.4byte	3, 22

		mGetTiles 0x93E6 16
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0177:
		.4byte anim_data__0177_0
		.4byte anim_data__0177_1
		.4byte anim_data__0177_2
		.4byte anim_data__0177_3




.align 2, 0
	anim_data__0178_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x93F6 30
		.4byte	1, 0

		mGetTiles 0x9414 25
		.4byte	1, 1

		mJumpBack 0xD

	anim_data__0178_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x942D 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0178_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x943D 25
		.4byte	2, 3

		mGetTiles 0x9456 25
		.4byte	2, 4

		mJumpBack 0xD

	anim_data__0178_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x946F 16
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0178:
		.4byte anim_data__0178_0
		.4byte anim_data__0178_1
		.4byte anim_data__0178_2
		.4byte anim_data__0178_3




.align 2, 0
	anim_data__0179_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x947F 24
		.4byte	6, 0

		mGetTiles 0x9497 20
		.4byte	6, 1

		mGetTiles 0x94AB 16
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0179_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x94BB 20
		.4byte	6, 3

		mGetTiles 0x94CF 20
		.4byte	6, 4

		mGetTiles 0x94E3 24
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0179:
		.4byte anim_data__0179_0
		.4byte anim_data__0179_1




.align 2, 0
	anim_data__0180_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x94FB 16
		.4byte	2, 0

		mGetTiles 0x950B 16
		.4byte	2, 1

		mGetTiles 0x951B 16
		.4byte	2, 2

		mGetTiles 0x952B 16
		.4byte	2, 3

		mGetTiles 0x953B 16
		.4byte	2, 4

		mGetTiles 0x954B 16
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0180:
		.4byte anim_data__0180_0




.align 2, 0
	anim_data__0181_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x955B 16
		.4byte	2, 0

		mGetTiles 0x956B 16
		.4byte	2, 1

		mGetTiles 0x957B 12
		.4byte	2, 2

		mGetTiles 0x9587 12
		.4byte	2, 3

		mGetTiles 0x9593 12
		.4byte	3, 4

		mGetTiles 0x959F 16
		.4byte	3, 5

		mGetTiles 0x95AF 12
		.4byte	3, 6

		mGetTiles 0x95BB 12
		.4byte	3, 7

		mGetTiles 0x95C7 12
		.4byte	3, 8

		mGetTiles 0x95D3 16
		.4byte	3, 9

		mGetTiles 0x95E3 16
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0181:
		.4byte anim_data__0181_0




.align 2, 0
	anim_data__0182_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x95F3 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 0

		mGetTiles 0x960B 24
		.4byte	8, 1

		mGetTiles 0x9623 30
		.4byte	8, 2

		mGetTiles 0x9641 24
		.4byte	8, 3

		mGetTiles 0x9659 24
		.4byte	8, 4

		mGetTiles 0x9671 24
		.4byte	8, 5

		mGetTiles 0x9689 30
		.4byte	8, 6

		mGetTiles 0x96A7 24
		.4byte	8, 7

		mGetTiles 0x95F3 24
		.4byte	8, 0

		mGetTiles 0x96BF 24
		.4byte	8, 8

		mGetTiles 0x96D7 30
		.4byte	8, 9

		mGetTiles 0x96F5 24
		.4byte	8, 10

		mGetTiles 0x9659 24
		.4byte	8, 4

		mGetTiles 0x9671 24
		.4byte	8, 5

		mGetTiles 0x9689 30
		.4byte	8, 6

		mGetTiles 0x96A7 24
		.4byte	8, 7

		mJumpBack 0x56


.align 2, 0
	anim_0182:
		.4byte anim_data__0182_0




.align 2, 0
	anim_data__0183_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0x970D 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	6, 0

		mGetTiles 0x9721 25
		.4byte	8, 1

		mGetTiles 0x973A 25
		.4byte	6, 2

		mGetTiles 0x9753 20
		.4byte	6, 3

		mGetTiles 0x9767 20
		.4byte	8, 4

		mGetTiles 0x977B 20
		.4byte	6, 5

		mGetTiles 0x978F 24
		.4byte	6, 6

		mGetTiles 0x97A7 24
		.4byte	6, 7

		mGetTiles 0x97BF 24
		.4byte	6, 8

		mGetTiles 0x97D7 20
		.4byte	18, 9

		mGetTiles 0x97EB 20
		.4byte	6, 10

		mGetTiles 0x97FF 25
		.4byte	6, 11

		mGetTiles 0x9818 25
		.4byte	6, 12

		mGetTiles 0x9831 20
		.4byte	6, 13

		mGetTiles 0x9845 20
		.4byte	6, 14

		mGetTiles 0x9859 20
		.4byte	6, 15

		mGetTiles 0x986D 20
		.4byte	6, 16

		mGetTiles 0x9881 24
		.4byte	10, 17

		mGetTiles 0x9899 28
		.4byte	10, 18

		mGetTiles 0x98B5 24
		.4byte	10, 19

		mGetTiles 0x98CD 28
		.4byte	10, 20

		mGetTiles 0x98E9 24
		.4byte	10, 21

		mGetTiles 0x9901 24
		.4byte	10, 22

		mGetTiles 0x9919 24
		.4byte	10, 23

		mGetTiles 0x9931 24
		.4byte	10, 24

		mJumpBack 0x28

	anim_data__0183_1:
		mGetPalette 0xA 16 0x0
		mGetTiles 0x9949 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 25

		mGetTiles 0x9961 24
		.4byte	8, 26

		mGetTiles 0x9979 20
		.4byte	4, 27

		mGetTiles 0x998D 20
		.4byte	4, 28

		mGetTiles 0x99A1 20
		.4byte	4, 29

		mAnimCmd4 


.align 2, 0
	anim_0183:
		.4byte anim_data__0183_0
		.4byte anim_data__0183_1




.align 2, 0
	anim_data__0184_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x99B5 20
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 0

		mGetTiles 0x99C9 24
		.4byte	1, 1

		mGetTiles 0x99E1 18
		.4byte	6, 2

		mGetTiles 0x99F3 18
		.4byte	6, 3

		mGetTiles 0x9A05 18
		.4byte	6, 4

		mGetTiles 0x9A17 18
		.4byte	6, 5

		mGetTiles 0x9A29 18
		.4byte	6, 6

		mGetTiles 0x9A3B 18
		.4byte	6, 7

		mGetTiles 0x9A4D 18
		.4byte	6, 8

		mGetTiles 0x9A5F 18
		.4byte	6, 9

		mGetTiles 0x99E1 18
		.4byte	6, 2

		mGetTiles 0x99F3 18
		.4byte	6, 3

		mGetTiles 0x9A05 18
		.4byte	6, 4

		mGetTiles 0x9A17 18
		.4byte	6, 5

		mGetTiles 0x9A71 18
		.4byte	6, 10

		mGetTiles 0x9A83 18
		.4byte	6, 11

		mGetTiles 0x9A95 18
		.4byte	6, 12

		mGetTiles 0x9A5F 18
		.4byte	6, 9

		mJumpBack 0x50

	anim_data__0184_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x99C9 24
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 1

		mGetTiles 0x99B5 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0184:
		.4byte anim_data__0184_0
		.4byte anim_data__0184_1




.align 2, 0
	anim_data__0185_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9AA7 24
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x9ABF 24
		.4byte	2, 1

		mGetTiles 0x9AD7 24
		.4byte	2, 2

		mGetTiles 0x9AEF 24
		.4byte	2, 3

		mGetTiles 0x9B07 24
		.4byte	2, 4

		mGetTiles 0x9B1F 24
		.4byte	2, 5

		mGetTiles 0x9B37 28
		.4byte	2, 6

		mGetTiles 0x9B53 24
		.4byte	2, 7

		mJumpBack 0x31

	anim_data__0185_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9AA7 24
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x9ABF 24
		.4byte	2, 1

		mGetTiles 0x9AD7 24
		.4byte	2, 2

		mGetTiles 0x9AEF 24
		.4byte	2, 3

		mGetTiles 0x9B07 24
		.4byte	2, 4

		mGetTiles 0x9B1F 24
		.4byte	2, 5

		mGetTiles 0x9B37 28
		.4byte	2, 6

		mGetTiles 0x9B53 24
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0185:
		.4byte anim_data__0185_0
		.4byte anim_data__0185_1




.align 2, 0
	anim_data__0186_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9B6B 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x9B7B 16
		.4byte	2, 1

		mGetTiles 0x9B8B 16
		.4byte	2, 2

		mGetTiles 0x9B9B 16
		.4byte	2, 3

		mGetTiles 0x9B6B 16
		.4byte	2, 0

		mGetTiles 0x9B7B 16
		.4byte	2, 1

		mGetTiles 0x9B8B 16
		.4byte	2, 2

		mGetTiles 0x9B9B 16
		.4byte	2, 3

		mJumpBack 0x31

	anim_data__0186_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9BAB 16
		.4byte	2, 4

		mGetTiles 0x9BBB 16
		.4byte	2, 5

		mGetTiles 0x9BCB 16
		.4byte	2, 6

		mGetTiles 0x9BDB 16
		.4byte	2, 7

		mGetTiles 0x9BEB 16
		.4byte	2, 8

		mGetTiles 0x9BFB 16
		.4byte	2, 9

		mGetTiles 0x9C0B 16
		.4byte	2, 10

		mGetTiles 0x9C1B 16
		.4byte	2, 11

		mJumpBack 0x2B


.align 2, 0
	anim_0186:
		.4byte anim_data__0186_0
		.4byte anim_data__0186_1




.align 2, 0
	anim_data__0187_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9C2B 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0x9C3F 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0187:
		.4byte anim_data__0187_0




.align 2, 0
	anim_data__0188_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9C53 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x9C6B 20
		.4byte	2, 1

		mGetTiles 0x9C7F 20
		.4byte	2, 2

		mGetTiles 0x9C93 16
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0188:
		.4byte anim_data__0188_0




.align 2, 0
	anim_data__0189_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9CA3 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x9CB7 20
		.4byte	4, 1

		mGetTiles 0x9CCB 20
		.4byte	4, 2

		mJumpBack 0xA

	anim_data__0189_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9CDF 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0189:
		.4byte anim_data__0189_0
		.4byte anim_data__0189_1




.align 2, 0
	anim_data__0190_0:
		mGetPalette 0xB 16 0x0
		mGetTiles 0x9CF7 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0x9D0F 28
		.4byte	4, 1

		mGetTiles 0x9D2B 28
		.4byte	4, 2

		mJumpBack 0xA

	anim_data__0190_1:
		mGetPalette 0xB 16 0x0
		mGetTiles 0x9CF7 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	4, 0

		mGetTiles 0x9D47 24
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0190:
		.4byte anim_data__0190_0
		.4byte anim_data__0190_1




.align 2, 0
	anim_data__0191_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x9D5F 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 0

		mGetTiles 0x9D9F 64
		.4byte	8, 1

		mGetTiles 0x9DDF 64
		.4byte	8, 2

		mGetTiles 0x9E1F 64
		.4byte	8, 3

		mGetTiles 0x9E5F 64
		.4byte	8, 4

		mGetTiles 0x9E9F 64
		.4byte	8, 5

		mGetTiles 0x9EDF 64
		.4byte	8, 6

		mGetTiles 0x9F1F 64
		.4byte	8, 7

		mGetTiles 0x9D5F 64
		.4byte	8, 0

		mGetTiles 0x9F5F 64
		.4byte	8, 8

		mGetTiles 0x9F9F 64
		.4byte	8, 9

		mGetTiles 0x9FDF 64
		.4byte	8, 10

		mGetTiles 0x9E5F 64
		.4byte	8, 4

		mGetTiles 0x9E9F 64
		.4byte	8, 5

		mGetTiles 0x9EDF 64
		.4byte	8, 6

		mGetTiles 0x9F1F 64
		.4byte	8, 7

		mJumpBack 0x56

	anim_data__0191_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xA01F 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 11

		mGetTiles 0xA05F 64
		.4byte	8, 12

		mGetTiles 0xA09F 64
		.4byte	8, 13

		mGetTiles 0xA0DF 64
		.4byte	8, 14

		mGetTiles 0xA11F 64
		.4byte	8, 15

		mGetTiles 0xA15F 64
		.4byte	8, 16

		mGetTiles 0xA19F 64
		.4byte	8, 17

		mGetTiles 0xA1DF 64
		.4byte	8, 18

		mGetTiles 0xA01F 64
		.4byte	8, 11

		mGetTiles 0xA21F 64
		.4byte	8, 19

		mGetTiles 0xA25F 64
		.4byte	8, 20

		mGetTiles 0xA29F 64
		.4byte	8, 21

		mGetTiles 0xA11F 64
		.4byte	8, 15

		mGetTiles 0xA15F 64
		.4byte	8, 16

		mGetTiles 0xA19F 64
		.4byte	8, 17

		mGetTiles 0xA1DF 64
		.4byte	8, 18

		mJumpBack 0x56

	anim_data__0191_2:
		mGetPalette 0xC 16 0x0
		mGetTiles 0xA2DF 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 22

		mGetTiles 0xA31F 64
		.4byte	8, 23

		mGetTiles 0xA35F 64
		.4byte	8, 24

		mGetTiles 0xA39F 64
		.4byte	8, 25

		mGetTiles 0xA3DF 64
		.4byte	8, 26

		mGetTiles 0xA41F 64
		.4byte	8, 27

		mGetTiles 0xA45F 64
		.4byte	8, 28

		mGetTiles 0xA49F 64
		.4byte	8, 29

		mGetTiles 0xA2DF 64
		.4byte	8, 22

		mGetTiles 0xA4DF 64
		.4byte	8, 30

		mGetTiles 0xA51F 64
		.4byte	8, 31

		mGetTiles 0xA55F 64
		.4byte	8, 32

		mGetTiles 0xA3DF 64
		.4byte	8, 26

		mGetTiles 0xA41F 64
		.4byte	8, 27

		mGetTiles 0xA45F 64
		.4byte	8, 28

		mGetTiles 0xA49F 64
		.4byte	8, 29

		mJumpBack 0x56

	anim_data__0191_3:
		mGetPalette 0xD 16 0x0
		mGetTiles 0xA59F 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 33

		mGetTiles 0xA5DF 64
		.4byte	8, 34

		mGetTiles 0xA61F 64
		.4byte	8, 35

		mGetTiles 0xA65F 64
		.4byte	8, 36

		mGetTiles 0xA69F 64
		.4byte	8, 37

		mGetTiles 0xA6DF 64
		.4byte	8, 38

		mGetTiles 0xA71F 64
		.4byte	8, 39

		mGetTiles 0xA75F 64
		.4byte	8, 40

		mGetTiles 0xA59F 64
		.4byte	8, 33

		mGetTiles 0xA79F 64
		.4byte	8, 41

		mGetTiles 0xA7DF 64
		.4byte	8, 42

		mGetTiles 0xA81F 64
		.4byte	8, 43

		mGetTiles 0xA69F 64
		.4byte	8, 37

		mGetTiles 0xA6DF 64
		.4byte	8, 38

		mGetTiles 0xA71F 64
		.4byte	8, 39

		mGetTiles 0xA75F 64
		.4byte	8, 40

		mJumpBack 0x56

	anim_data__0191_4:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xA85F 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 44

		mGetTiles 0xA89F 64
		.4byte	8, 45

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xA91F 64
		.4byte	8, 47

		mGetTiles 0xA85F 64
		.4byte	8, 44

		mGetTiles 0xA95F 64
		.4byte	8, 48

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xA99F 64
		.4byte	8, 49

		mGetTiles 0xA9DF 64
		.4byte	8, 50

		mGetTiles 0xAA1F 64
		.4byte	8, 51

		mGetTiles 0xAA5F 64
		.4byte	8, 52

		mGetTiles 0xAA9F 64
		.4byte	8, 53

		mGetTiles 0xA9DF 64
		.4byte	8, 50

		mGetTiles 0xA89F 64
		.4byte	8, 45

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xAADF 64
		.4byte	8, 54

		mJumpBack 0x56

	anim_data__0191_5:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xA85F 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	8, 44

		mGetTiles 0xA89F 64
		.4byte	8, 45

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xA91F 64
		.4byte	8, 47

		mGetTiles 0xA85F 64
		.4byte	8, 44

		mGetTiles 0xA95F 64
		.4byte	8, 48

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xA99F 64
		.4byte	8, 49

		mGetTiles 0xA9DF 64
		.4byte	8, 50

		mGetTiles 0xAA1F 64
		.4byte	8, 51

		mGetTiles 0xAA5F 64
		.4byte	8, 52

		mGetTiles 0xAA9F 64
		.4byte	8, 53

		mGetTiles 0xA9DF 64
		.4byte	8, 50

		mGetTiles 0xA89F 64
		.4byte	8, 45

		mGetTiles 0xA8DF 64
		.4byte	8, 46

		mGetTiles 0xAADF 64
		.4byte	8, 54

		mJumpBack 0x56


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
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAB1F 20
		mAnimCmd6 0x0 0x406EEFA
		mAnimCmd6 0x1 0x406EEFA
		.4byte	3, 0

		mGetTiles 0xAB33 20
		mAnimCmd6 0x0 0x1007FAFB
		mAnimCmd6 0x1 0x1007FAFB
		.4byte	3, 1

		mAnimCmd4 

	anim_data__0192_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAB47 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xAB57 16
		.4byte	2, 3

		mGetTiles 0xAB67 16
		.4byte	2, 4

		mGetTiles 0xAB77 16
		.4byte	2, 5

		mGetTiles 0xAB87 16
		.4byte	2, 6

		mGetTiles 0xAB97 16
		.4byte	2, 7

		mGetTiles 0xABA7 16
		.4byte	2, 8

		mGetTiles 0xABB7 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0192_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xABC7 20
		mAnimCmd6 0x0 0x606F0FA
		mAnimCmd6 0x1 0xC0AF8F6
		.4byte	1, 10

		mGetTiles 0xABDB 20
		mAnimCmd6 0x0 0x406EEF8
		mAnimCmd6 0x1 0x909F7F7
		.4byte	2, 11

		mGetTiles 0xABEF 25
		.4byte	2, 12

		mGetTiles 0xAC08 30
		.4byte	2, 13

		mGetTiles 0xAC26 30
		.4byte	2, 14

		mGetTiles 0xAC44 30
		.4byte	2, 15

		mJumpBack 0xF


.align 2, 0
	anim_0192:
		.4byte anim_data__0192_0
		.4byte anim_data__0192_1
		.4byte anim_data__0192_2




.align 2, 0
	anim_data__0193_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAC62 20
		mAnimCmd6 0x0 0x406EEFA
		mAnimCmd6 0x1 0x406EEFA
		.4byte	3, 0

		mGetTiles 0xAC76 20
		.4byte	3, 1

		mAnimCmd4 

	anim_data__0193_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAC8A 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xAC9A 16
		.4byte	2, 3

		mGetTiles 0xACAA 16
		.4byte	2, 4

		mGetTiles 0xACBA 16
		.4byte	2, 5

		mGetTiles 0xACCA 16
		.4byte	2, 6

		mGetTiles 0xACDA 16
		.4byte	2, 7

		mGetTiles 0xACEA 16
		.4byte	2, 8

		mGetTiles 0xACFA 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0193_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAD0A 20
		mAnimCmd6 0x0 0x406EEFA
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	1, 10

		mGetTiles 0xAD1E 20
		mAnimCmd6 0x0 0x406EEF8
		mAnimCmd6 0x1 0x909F7F7
		.4byte	2, 11

		mGetTiles 0xAD32 25
		.4byte	2, 12

		mGetTiles 0xAD4B 30
		.4byte	2, 13

		mGetTiles 0xAD69 30
		.4byte	2, 14

		mGetTiles 0xAD87 30
		.4byte	2, 15

		mJumpBack 0xF


.align 2, 0
	anim_0193:
		.4byte anim_data__0193_0
		.4byte anim_data__0193_1
		.4byte anim_data__0193_2




.align 2, 0
	anim_data__0194_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xADA5 20
		mAnimCmd6 0x0 0x1008F6F8
		.4byte	1, 0

		mGetTiles 0xADB9 24
		.4byte	1, 1

		mGetTiles 0xADD1 18
		.4byte	1, 2

		mGetTiles 0xADE3 24
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0194:
		.4byte anim_data__0194_0




.align 2, 0
	anim_data__0195_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xADFB 20
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	2, 0

		mGetTiles 0xAE0F 25
		.4byte	2, 1

		mGetTiles 0xAE28 35
		.4byte	2, 2

		mGetTiles 0xAE4B 35
		.4byte	2, 3

		mGetTiles 0xAE6E 35
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0195:
		.4byte anim_data__0195_0




.align 2, 0
	anim_data__0196_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAE91 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0xAEA5 20
		mAnimCmd6 0x0 0x1002F6F6
		.4byte	2, 1

		mGetTiles 0xAEB9 20
		mAnimCmd6 0x0 0x1000F6F4
		mPlaySoundEffect 121
		.4byte	2, 2

		mGetTiles 0xAECD 20
		mAnimCmd6 0x0 0x1006F6FA
		mAnimCmd6 0x1 0x10FAF6EC
		.4byte	2, 3

		mGetTiles 0xAEE1 28
		mAnimCmd6 0x0 0x10FEF6F2
		mAnimCmd6 0x1 0x10F4F6D0
		.4byte	2, 4

		mGetTiles 0xAEFD 24
		mAnimCmd6 0x0 0x10FEF6F2
		mAnimCmd6 0x1 0x10F2F6D8
		.4byte	2, 5

		mGetTiles 0xAF15 24
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	3, 6

		mGetTiles 0xAF2D 16
		mAnimCmd6 0x0 0x1004F6F8
		.4byte	3, 7

		mGetTiles 0xAF3D 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	3, 8

		mAnimCmd4 


.align 2, 0
	anim_0196:
		.4byte anim_data__0196_0




.align 2, 0
	anim_data__0198_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xAF51 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0xAF65 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 1

		mGetTiles 0xAF79 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 2

		mGetTiles 0xAF8D 20
		mAnimCmd6 0x0 0x1004F6F8
		mAnimCmd6 0x1 0x1000FDE9
		.4byte	2, 3

		mGetTiles 0xAFA1 28
		mAnimCmd6 0x0 0x1004F6F8
		mAnimCmd6 0x1 0x1000F8DD
		.4byte	2, 4

		mGetTiles 0xAFBD 24
		mAnimCmd6 0x0 0x1004F6F8
		mAnimCmd6 0x1 0xF00F7E0
		.4byte	2, 5

		mGetTiles 0xAFD5 20
		mAnimCmd6 0x0 0x1004F6F8
		.4byte	2, 6

		mGetTiles 0xAFE9 16
		mAnimCmd6 0x0 0x1004F6F8
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0198_1:
		mGetPalette 0xE 16 0x50
		.4byte	5, -1

		mGetTiles 0xAFF9 12
		.4byte	2, 8

		mGetTiles 0xB005 24
		.4byte	3, 9

		mGetTiles 0xB01D 16
		.4byte	3, 10

		mGetTiles 0xB02D 9
		.4byte	4, 11

		mAnimCmd4 


.align 2, 0
	anim_0198:
		.4byte anim_data__0198_0
		.4byte anim_data__0198_1




.align 2, 0
	anim_data__0201_0:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB036 18
		mAnimCmd6 0x0 0xA05F4F9
		.4byte	4, 0

		mGetTiles 0xB048 25
		.4byte	1, 1

		mGetTiles 0xB061 20
		.4byte	2, 2

		mGetTiles 0xB075 20
		.4byte	3, 3

		mGetTiles 0xB089 20
		.4byte	3, 4

		mGetTiles 0xB09D 30
		.4byte	3, 5

		mGetTiles 0xB0BB 25
		.4byte	3, 6

		mGetTiles 0xB0D4 20
		.4byte	3, 7

		mGetTiles 0xB0E8 20
		.4byte	3, 8

		mGetTiles 0xB0FC 30
		.4byte	3, 9

		mGetTiles 0xB11A 25
		.4byte	3, 10

		mGetTiles 0xB133 25
		.4byte	1, 11

		mGetTiles 0xB14C 20
		.4byte	1, 12

		mGetTiles 0xB160 25
		.4byte	1, 13

		mGetTiles 0xB179 35
		.4byte	2, 14

		mGetTiles 0xB19C 35
		.4byte	2, 15

		mGetTiles 0xB1BF 35
		.4byte	2, 16

		mJumpBack 0xF


.align 2, 0
	anim_0201:
		.4byte anim_data__0201_0




.align 2, 0
	anim_data__0202_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB1E2 20
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF516E9EB
		.4byte	2, 0

		mGetTiles 0xB1F6 20
		.4byte	2, 1

		mGetTiles 0xB20A 30
		.4byte	2, 2

		mGetTiles 0xB228 25
		.4byte	2, 3

		mGetTiles 0xB241 20
		.4byte	2, 4

		mGetTiles 0xB255 20
		.4byte	2, 5

		mGetTiles 0xB269 30
		.4byte	2, 6

		mGetTiles 0xB287 25
		.4byte	2, 7

		mGetTiles 0xB1E2 20
		.4byte	2, 0

		mGetTiles 0xB1F6 20
		.4byte	2, 1

		mGetTiles 0xB20A 30
		.4byte	2, 2

		mGetTiles 0xB228 25
		.4byte	2, 3

		mGetTiles 0xB2A0 20
		.4byte	2, 8

		mGetTiles 0xB2B4 20
		.4byte	2, 9

		mGetTiles 0xB2C8 30
		.4byte	2, 10

		mGetTiles 0xB287 25
		.4byte	2, 7

		mJumpBack 0x59


.align 2, 0
	anim_0202:
		.4byte anim_data__0202_0




.align 2, 0
	anim_data__0203_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB2E6 25
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF511EDEF
		.4byte	1, 0

		mGetTiles 0xB2FF 25
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF511EDEF
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0203:
		.4byte anim_data__0203_0




.align 2, 0
	anim_data__0204_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB318 25
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	6, 0

		mGetTiles 0xB331 24
		.4byte	3, 1

		mGetTiles 0xB349 30
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	6, 2

		mGetTiles 0xB367 30
		.4byte	6, 3

		mGetTiles 0xB385 30
		.4byte	6, 4

		mGetTiles 0xB3A3 30
		.4byte	6, 5

		mGetTiles 0xB349 30
		.4byte	6, 2

		mGetTiles 0xB367 30
		.4byte	6, 3

		mGetTiles 0xB385 30
		.4byte	6, 4

		mGetTiles 0xB3A3 30
		.4byte	6, 5

		mJumpBack 0x2B


.align 2, 0
	anim_0204:
		.4byte anim_data__0204_0




.align 2, 0
	anim_data__0210_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB3C1 24
		mAnimCmd6 0x0 0x1006F4F6
		.4byte	3, 0

		mGetTiles 0xB3D9 20
		.4byte	8, 1

		mGetTiles 0xB3ED 20
		.4byte	8, 2

		mGetTiles 0xB401 20
		.4byte	8, 3

		mGetTiles 0xB415 20
		.4byte	8, 4

		mAnimCmd4 

	anim_data__0210_1:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB429 20
		mAnimCmd6 0x0 0x1308F7F8
		.4byte	5, 5

		mGetTiles 0xB43D 16
		.4byte	5, 6

		mGetTiles 0xB44D 15
		.4byte	5, 7

		mGetTiles 0xB45C 16
		.4byte	5, 8

		mGetTiles 0xB46C 16
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0210_2:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB47C 20
		.4byte	2, 10

		mGetTiles 0xB490 25
		.4byte	2, 11

		mGetTiles 0xB4A9 20
		.4byte	2, 12

		mGetTiles 0xB4BD 20
		.4byte	2, 13

		mGetTiles 0xB4D1 20
		.4byte	2, 14

		mAnimCmd4 


.align 2, 0
	anim_0210:
		.4byte anim_data__0210_0
		.4byte anim_data__0210_1
		.4byte anim_data__0210_2




.align 2, 0
	anim_data__0211_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB4E5 25
		.4byte	3, 0

		mGetTiles 0xB4FE 20
		.4byte	3, 1

		mGetTiles 0xB4E5 25
		.4byte	3, 0

		mGetTiles 0xB512 25
		.4byte	3, 2

		mGetTiles 0xB52B 20
		.4byte	3, 3

		mGetTiles 0xB53F 20
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0211:
		.4byte anim_data__0211_0




.align 2, 0
	anim_data__0212_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB553 16
		.4byte	6, 0

		mGetTiles 0xB563 20
		.4byte	4, 1

		mGetTiles 0xB577 20
		.4byte	4, 2

		mGetTiles 0xB58B 20
		.4byte	4, 3

		mGetTiles 0xB59F 20
		.4byte	6, 4

		mGetTiles 0xB5B3 20
		.4byte	4, 5

		mGetTiles 0xB5C7 20
		.4byte	4, 6

		mGetTiles 0xB563 20
		.4byte	4, 1

		mGetTiles 0xB553 16
		.4byte	6, 0

		mGetTiles 0xB563 20
		.4byte	4, 1

		mGetTiles 0xB577 20
		.4byte	4, 2

		mGetTiles 0xB58B 20
		.4byte	4, 3

		mGetTiles 0xB59F 20
		.4byte	6, 4

		mGetTiles 0xB5B3 20
		.4byte	4, 5

		mGetPalette 0xA 16 0x0
		mGetTiles 0xB5DB 20
		.4byte	6, 7

		mGetTiles 0xB5EF 20
		.4byte	4, 8

		mGetTiles 0xB603 25
		.4byte	4, 9

		mGetTiles 0xB61C 20
		.4byte	8, 10

		mGetTiles 0xB630 20
		.4byte	6, 11

		mGetTiles 0xB644 20
		.4byte	6, 12

		mGetTiles 0xB630 20
		.4byte	6, 11

		mGetTiles 0xB61C 20
		.4byte	8, 10

		mGetTiles 0xB658 16
		.4byte	4, 13

		mGetTiles 0xB668 25
		.4byte	4, 14

		mGetTiles 0xB681 20
		.4byte	4, 15

		mGetTiles 0xB695 20
		.4byte	6, 16

		mGetTiles 0xB6A9 20
		.4byte	4, 17

		mGetTiles 0xB6BD 20
		.4byte	16, 18

		mGetTiles 0xB6D1 20
		.4byte	2, 19

		mGetTiles 0xB6E5 20
		.4byte	4, 20

		mGetTiles 0xB6F9 20
		.4byte	4, 21

		mGetTiles 0xB70D 20
		.4byte	4, 22

		mGetTiles 0xB721 20
		.4byte	4, 23

		mGetTiles 0xB735 20
		.4byte	4, 24

		mGetTiles 0xB6F9 20
		.4byte	4, 21

		mGetTiles 0xB749 20
		.4byte	6, 25

		mGetTiles 0xB75D 24
		.4byte	2, 26

		mJumpBack 0xBF

	anim_data__0212_1:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB775 20
		.4byte	1, 27

		mGetTiles 0xB789 20
		.4byte	6, 28

		mGetTiles 0xB79D 24
		.4byte	60, 29

		mGetTiles 0xB7B5 24
		.4byte	4, 30

		mAnimCmd4 


.align 2, 0
	anim_0212:
		.4byte anim_data__0212_0
		.4byte anim_data__0212_1




.align 2, 0
	anim_data__0213_0:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB7CD 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0213_1:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB7E1 20
		.4byte	3, 1

		mGetTiles 0xB7F5 25
		.4byte	3, 2

		mGetTiles 0xB80E 25
		.4byte	3, 3

		mGetTiles 0xB7F5 25
		.4byte	3, 2

		mJumpBack 0x17

	anim_data__0213_2:
		mGetPalette 0xB 16 0x0
		mGetTiles 0xB827 20
		.4byte	4, 4

		mGetTiles 0xB83B 24
		.4byte	2, 5

		mAnimCmd4 


.align 2, 0
	anim_0213:
		.4byte anim_data__0213_0
		.4byte anim_data__0213_1
		.4byte anim_data__0213_2




.align 2, 0
	anim_data__0214_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xB853 20
		.4byte	2, 0

		mGetTiles 0xB867 20
		.4byte	6, 1

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB87B 20
		.4byte	4, 2

		mGetTiles 0xB88F 20
		.4byte	4, 3

		mGetTiles 0xB8A3 20
		.4byte	8, 4

		mGetTiles 0xB8B7 20
		.4byte	2, 5

		mGetTiles 0xB8CB 20
		.4byte	3, 6

		mGetTiles 0xB8DF 25
		.4byte	4, 7

		mGetTiles 0xB8F8 20
		.4byte	4, 8

		mGetTiles 0xB90C 20
		.4byte	12, 9

		mAnimCmd4 


.align 2, 0
	anim_0214:
		.4byte anim_data__0214_0




.align 2, 0
	anim_data__0215_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xB920 20
		.4byte	6, 0

		mGetTiles 0xB934 30
		.4byte	8, 1

		mGetTiles 0xB952 20
		.4byte	4, 2

		mGetTiles 0xB966 12
		.4byte	4, 3

		mGetTiles 0xB972 16
		.4byte	6, 4

		mGetTiles 0xB982 25
		.4byte	8, 5

		mGetTiles 0xB99B 24
		.4byte	4, 6

		mGetTiles 0xB9B3 12
		.4byte	4, 7

		mGetTiles 0xB9BF 16
		.4byte	4, 8

		mGetTiles 0xB9CF 20
		.4byte	4, 9

		mGetTiles 0xB9E3 20
		.4byte	4, 10

		mGetTiles 0xB9F7 16
		.4byte	4, 11

		mGetTiles 0xBA07 16
		.4byte	4, 12

		mGetTiles 0xBA17 16
		.4byte	4, 13

		mGetTiles 0xBA27 16
		.4byte	4, 14

		mGetTiles 0xBA37 20
		.4byte	4, 15

		mGetTiles 0xBA4B 20
		.4byte	4, 16

		mGetTiles 0xBA5F 20
		.4byte	8, 17

		mGetTiles 0xBA73 20
		.4byte	4, 18

		mGetTiles 0xBA87 25
		.4byte	4, 19

		mGetTiles 0xBAA0 20
		.4byte	16, 20

		mGetTiles 0xBAB4 16
		.4byte	4, 21

		mGetTiles 0xBAC4 20
		.4byte	6, 22

		mGetTiles 0xBAD8 25
		.4byte	5, 23

		mGetTiles 0xBAF1 25
		.4byte	5, 24

		mGetTiles 0xBB0A 25
		.4byte	5, 25

		mGetTiles 0xBB23 20
		.4byte	5, 26

		mGetTiles 0xBAB4 16
		.4byte	5, 21

		mGetTiles 0xBB37 20
		.4byte	5, 27

		mGetTiles 0xBAD8 25
		.4byte	5, 23

		mGetTiles 0xBAF1 25
		.4byte	5, 24

		mGetTiles 0xBB0A 25
		.4byte	5, 25

		mGetTiles 0xBB23 20
		.4byte	5, 26

		mGetTiles 0xBAB4 16
		.4byte	5, 21

		mGetTiles 0xBAC4 20
		.4byte	5, 22

		mJumpBack 0x3C


.align 2, 0
	anim_0215:
		.4byte anim_data__0215_0




.align 2, 0
	anim_data__0216_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBB4B 16
		.4byte	4, 0

		mGetTiles 0xBB5B 16
		.4byte	4, 1

		mGetTiles 0xBB6B 20
		.4byte	4, 2

		mGetTiles 0xBB7F 20
		.4byte	4, 3

		mGetTiles 0xBB93 20
		.4byte	4, 4

		mGetTiles 0xBBA7 25
		.4byte	4, 5

		mGetTiles 0xBBC0 20
		.4byte	4, 6

		mGetTiles 0xBBD4 25
		.4byte	4, 7

		mGetTiles 0xBBED 25
		.4byte	8, 8

		mGetTiles 0xBC06 25
		.4byte	6, 9

		mGetTiles 0xBC1F 30
		.4byte	6, 10

		mGetTiles 0xBC3D 25
		.4byte	6, 11

		mGetTiles 0xBC56 30
		.4byte	6, 12

		mGetTiles 0xBC74 30
		.4byte	6, 13

		mGetTiles 0xBC92 30
		.4byte	6, 14

		mGetTiles 0xBCB0 30
		.4byte	6, 15

		mGetTiles 0xBCCE 30
		.4byte	6, 16

		mGetTiles 0xBCEC 30
		.4byte	6, 17

		mGetTiles 0xBD0A 30
		.4byte	6, 18

		mGetTiles 0xBD28 30
		.4byte	6, 19

		mJumpBack 0x28


.align 2, 0
	anim_0216:
		.4byte anim_data__0216_0




.align 2, 0
	anim_data__0217_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBD46 20
		.4byte	2, 0

		mGetTiles 0xBD5A 20
		.4byte	2, 1

		mGetTiles 0xBD6E 24
		.4byte	3, 2

		mGetTiles 0xBD86 24
		.4byte	3, 3

		mGetTiles 0xBD9E 24
		.4byte	3, 4

		mGetTiles 0xBDB6 24
		.4byte	3, 5

		mGetTiles 0xBDCE 24
		.4byte	3, 6

		mGetTiles 0xBDE6 24
		.4byte	3, 7

		mGetTiles 0xBDFE 20
		.4byte	3, 8

		mGetTiles 0xBE12 20
		.4byte	3, 9

		mJumpBack 0x28


.align 2, 0
	anim_0217:
		.4byte anim_data__0217_0




.align 2, 0
	anim_data__0218_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE26 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0218_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE3A 25
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0218_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE53 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0218_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xBE67 20
		.4byte	6, 3

		mGetTiles 0xBE7B 20
		.4byte	6, 4

		mGetTiles 0xBE8F 20
		.4byte	6, 5

		mGetTiles 0xBEA3 20
		.4byte	6, 6

		mGetTiles 0xBEB7 20
		.4byte	6, 7

		mAnimCmd4 


.align 2, 0
	anim_0218:
		.4byte anim_data__0218_0
		.4byte anim_data__0218_1
		.4byte anim_data__0218_2
		.4byte anim_data__0218_3




.align 2, 0
	anim_data__0222_0:
		mGetPalette 0xF 16 0x20
		mGetTiles 0xBECB 30
		.4byte	3, 0

		mGetTiles 0xBEE9 30
		.4byte	3, 1

		mGetTiles 0xBF07 30
		.4byte	3, 2

		mGetTiles 0xBF25 30
		.4byte	3, 3

		mJumpBack 0x17

	anim_data__0222_1:
		mGetPalette 0xF 16 0x20
		mGetTiles 0xBF43 25
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0222:
		.4byte anim_data__0222_0
		.4byte anim_data__0222_1




.align 2, 0
	anim_data__0223_0:
		mGetPalette 0x9 16 0x20
		mGetTiles 0xBF5C 20
		mAnimCmd6 0x0 0xA06F6FA
		mAnimCmd6 0x1 0xF516EDEB
		.4byte	2, 0

		mGetTiles 0xBF70 20
		.4byte	2, 1

		mGetTiles 0xBF84 30
		.4byte	2, 2

		mGetTiles 0xBFA2 25
		.4byte	2, 3

		mGetTiles 0xBFBB 20
		.4byte	2, 4

		mGetTiles 0xBFCF 20
		.4byte	2, 5

		mGetTiles 0xBFE3 30
		.4byte	2, 6

		mGetTiles 0xC001 25
		.4byte	2, 7

		mGetTiles 0xBF5C 20
		.4byte	2, 0

		mGetTiles 0xBF70 20
		.4byte	2, 1

		mGetTiles 0xBF84 30
		.4byte	2, 2

		mGetTiles 0xBFA2 25
		.4byte	2, 3

		mGetTiles 0xC01A 20
		.4byte	2, 8

		mGetTiles 0xC02E 20
		.4byte	2, 9

		mGetTiles 0xC042 30
		.4byte	2, 10

		mGetTiles 0xC001 25
		.4byte	2, 7

		mJumpBack 0x59

	anim_data__0223_1:
		mGetPalette 0x9 16 0x20
		mGetTiles 0xC060 16
		.4byte	2, 11

		mGetTiles 0xC070 24
		.4byte	4, 12

		mGetTiles 0xC088 24
		.4byte	2, 13

		mGetTiles 0xC0A0 24
		.4byte	2, 14

		mGetTiles 0xC0B8 36
		.4byte	2, 15

		mGetTiles 0xC0DC 30
		.4byte	2, 16

		mGetTiles 0xC0FA 24
		.4byte	2, 17

		mGetTiles 0xC112 20
		.4byte	2, 18

		mGetTiles 0xC126 30
		.4byte	2, 19

		mGetTiles 0xC144 30
		.4byte	2, 20

		mGetTiles 0xC162 36
		.4byte	2, 21

		mGetTiles 0xC186 25
		.4byte	2, 22

		mGetTiles 0xC19F 20
		.4byte	2, 23

		mGetTiles 0xC1B3 20
		.4byte	2, 24

		mGetTiles 0xC1C7 30
		.4byte	2, 25

		mGetTiles 0xC1E5 25
		.4byte	2, 26

		mGetTiles 0xC1FE 20
		.4byte	2, 27

		mGetTiles 0xC212 24
		.4byte	2, 28

		mJumpBack 0x50


.align 2, 0
	anim_0223:
		.4byte anim_data__0223_0
		.4byte anim_data__0223_1




.align 2, 0
	anim_data__0230_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC22A 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC242 20
		.4byte	1, 1

		mGetTiles 0xC256 25
		.4byte	1, 2

		mGetTiles 0xC26F 20
		.4byte	8, 3

		mAnimCmd4 

	anim_data__0230_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC283 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 4

		mGetTiles 0xC297 20
		.4byte	4, 5

		mGetTiles 0xC2AB 28
		.4byte	4, 6

		mGetTiles 0xC2C7 28
		.4byte	4, 7

		mGetTiles 0xC2E3 28
		.4byte	4, 8

		mJumpBack 0xF

	anim_data__0230_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC2FF 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 9

		mGetTiles 0xC317 25
		.4byte	4, 10

		mGetTiles 0xC330 25
		.4byte	4, 11

		mGetTiles 0xC349 35
		.4byte	3, 12

		mGetTiles 0xC36C 35
		.4byte	3, 13

		mGetTiles 0xC38F 35
		.4byte	3, 14

		mJumpBack 0xF


.align 2, 0
	anim_0230:
		.4byte anim_data__0230_0
		.4byte anim_data__0230_1
		.4byte anim_data__0230_2




.align 2, 0
	anim_data__0231_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC3B2 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC3CA 25
		.4byte	2, 1

		mGetTiles 0xC3E3 20
		.4byte	2, 2

		mGetTiles 0xC3F7 20
		.4byte	2, 3

		mGetTiles 0xC40B 24
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0231_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC423 20
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 5

		mGetTiles 0xC437 20
		.4byte	1, 6

		mGetTiles 0xC44B 25
		.4byte	1, 7

		mGetTiles 0xC464 20
		.4byte	1, 8

		mGetTiles 0xC478 25
		.4byte	3, 9

		mGetTiles 0xC491 20
		.4byte	3, 10

		mGetTiles 0xC4A5 25
		.4byte	3, 11

		mGetTiles 0xC4BE 20
		.4byte	3, 12

		mGetTiles 0xC4D2 20
		.4byte	3, 13

		mGetTiles 0xC4E6 25
		.4byte	3, 14

		mGetTiles 0xC4FF 25
		.4byte	3, 15

		mGetTiles 0xC518 20
		.4byte	3, 16

		mJumpBack 0x28

	anim_data__0231_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC52C 25
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	3, 17

		mGetTiles 0xC545 30
		.4byte	3, 18

		mGetTiles 0xC563 30
		.4byte	3, 19

		mGetTiles 0xC581 30
		.4byte	3, 20

		mJumpBack 0xF


.align 2, 0
	anim_0231:
		.4byte anim_data__0231_0
		.4byte anim_data__0231_1
		.4byte anim_data__0231_2




.align 2, 0
	anim_data__0232_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC59F 28
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC5BB 30
		.4byte	2, 1

		mGetTiles 0xC5D9 30
		.4byte	2, 2

		mGetTiles 0xC5F7 20
		.4byte	4, 3

		mAnimCmd4 

	anim_data__0232_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC60B 25
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 4

		mGetTiles 0xC624 30
		.4byte	2, 5

		mGetTiles 0xC642 25
		.4byte	2, 6

		mGetTiles 0xC65B 35
		mAnimCmd6 0x0 0xA06F4FA
		mAnimCmd6 0x1 0xA1700F2
		.4byte	3, 7

		mGetTiles 0xC67E 25
		.4byte	3, 8

		mGetTiles 0xC697 25
		.4byte	3, 9

		mGetTiles 0xC6B0 25
		.4byte	3, 10

		mJumpBack 0x1A

	anim_data__0232_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC6C9 25
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	4, 11

		mGetTiles 0xC6E2 30
		.4byte	4, 12

		mGetTiles 0xC700 25
		.4byte	4, 13

		mGetTiles 0xC719 20
		.4byte	4, 14

		mGetTiles 0xC72D 24
		.4byte	3, 15

		mGetTiles 0xC745 25
		.4byte	3, 16

		mGetTiles 0xC75E 25
		.4byte	3, 17

		mGetTiles 0xC777 30
		.4byte	3, 18

		mGetTiles 0xC795 30
		.4byte	3, 19

		mGetTiles 0xC7B3 30
		.4byte	3, 20

		mJumpBack 0xF


.align 2, 0
	anim_0232:
		.4byte anim_data__0232_0
		.4byte anim_data__0232_1
		.4byte anim_data__0232_2




.align 2, 0
	anim_data__0233_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC7D1 24
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC7E9 24
		.4byte	2, 1

		mGetTiles 0xC801 20
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0233_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC815 16
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 3

		mGetTiles 0xC825 20
		.4byte	2, 4

		mGetTiles 0xC839 20
		.4byte	2, 5

		mGetTiles 0xC84D 30
		.4byte	3, 6

		mGetTiles 0xC86B 25
		.4byte	3, 7

		mGetTiles 0xC884 30
		.4byte	3, 8

		mGetTiles 0xC8A2 25
		.4byte	3, 9

		mGetTiles 0xC84D 30
		.4byte	3, 6

		mGetTiles 0xC86B 25
		.4byte	3, 7

		mGetTiles 0xC884 30
		.4byte	3, 8

		mGetTiles 0xC8A2 25
		.4byte	3, 9

		mJumpBack 0x28


.align 2, 0
	anim_0233:
		.4byte anim_data__0233_0
		.4byte anim_data__0233_1




.align 2, 0
	anim_data__0234_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC8BB 21
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 0

		mGetTiles 0xC8D0 21
		.4byte	2, 1

		mGetTiles 0xC8E5 21
		.4byte	2, 2

		mJumpBack 0x15

	anim_data__0234_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC8FA 18
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	2, 3

		mGetTiles 0xC90C 24
		mAnimCmd6 0x0 0x806F2FA
		.4byte	3, 4

		mGetTiles 0xC924 20
		.4byte	3, 5

		mGetTiles 0xC938 20
		.4byte	4, 6

		mGetTiles 0xC94C 20
		mAnimCmd6 0x0 0x606F0FA
		.4byte	4, 7

		mGetTiles 0xC960 25
		mAnimCmd6 0x0 0x606F2FA
		.4byte	4, 8

		mAnimCmd4 

	anim_data__0234_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC979 35
		mAnimCmd6 0x0 0x606F0FA
		.4byte	3, 9

		mGetTiles 0xC99C 35
		.4byte	3, 10

		mGetTiles 0xC9BF 35
		.4byte	3, 11

		mJumpBack 0x15


.align 2, 0
	anim_0234:
		.4byte anim_data__0234_0
		.4byte anim_data__0234_1
		.4byte anim_data__0234_2




.align 2, 0
	anim_data__0235_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xC9E2 25
		mAnimCmd6 0x0 0xB06F5FA
		.4byte	4, 0

		mGetTiles 0xC9FB 25
		.4byte	4, 1

		mGetTiles 0xCA14 24
		.4byte	4, 2

		mGetTiles 0xCA2C 24
		.4byte	4, 3

		mGetTiles 0xCA44 20
		.4byte	4, 4

		mGetTiles 0xCA58 25
		.4byte	4, 5

		mGetTiles 0xCA71 20
		.4byte	4, 6

		mGetTiles 0xCA85 24
		.4byte	4, 7

		mGetTiles 0xCA9D 35
		.4byte	4, 8

		mGetTiles 0xCAC0 20
		.4byte	4, 9

		mGetTiles 0xCAD4 25
		.4byte	4, 10

		mGetTiles 0xCAED 35
		.4byte	3, 11

		mGetTiles 0xCB10 35
		.4byte	3, 12

		mGetTiles 0xCB33 35
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0235:
		.4byte anim_data__0235_0




.align 2, 0
	anim_data__0236_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCB56 20
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 0

		mGetTiles 0xCB6A 25
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	2, 1

		mGetTiles 0xCB83 25
		.4byte	2, 2

		mGetTiles 0xCB9C 25
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0236_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCBB5 25
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	1, 4

		mGetTiles 0xCBCE 30
		.4byte	2, 5

		mGetTiles 0xCBEC 25
		.4byte	2, 6

		mGetTiles 0xCC05 25
		.4byte	2, 7

		mGetTiles 0xCC1E 20
		.4byte	2, 8

		mGetTiles 0xCC32 25
		.4byte	2, 9

		mGetTiles 0xCC4B 30
		.4byte	2, 10

		mGetTiles 0xCC69 30
		.4byte	2, 11

		mGetTiles 0xCC87 30
		.4byte	2, 12

		mJumpBack 0xF


.align 2, 0
	anim_0236:
		.4byte anim_data__0236_0
		.4byte anim_data__0236_1




.align 2, 0
	anim_data__0237_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCCA5 64
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0xCCE5 64
		.4byte	2, 1

		mGetTiles 0xCD25 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0237:
		.4byte anim_data__0237_0




.align 2, 0
	anim_data__0239_0:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCD65 24
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0239_1:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCD7D 28
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0239_2:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCD99 24
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0239_3:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCDB1 28
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0239_4:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCDCD 28
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0239_5:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCDE9 24
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0239_6:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCE01 24
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0239_7:
		mGetPalette 0x10 16 0x0
		mGetTiles 0xCE19 24
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x9 16 0x0
		mGetTiles 0xCE31 64
		mAnimCmd6 0x0 0xA0AFAF6
		.4byte	5, 0

		mGetTiles 0xCE71 64
		.4byte	5, 1

		mGetTiles 0xCEB1 64
		.4byte	5, 2

		mGetTiles 0xCEF1 64
		.4byte	5, 3

		mGetTiles 0xCF31 64
		.4byte	5, 4

		mGetTiles 0xCF71 64
		.4byte	5, 5

		mGetTiles 0xCFB1 64
		.4byte	5, 6

		mGetTiles 0xCFF1 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0240:
		.4byte anim_data__0240_0




.align 2, 0
	anim_data__0241_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD031 30
		mAnimCmd6 0x0 0x1F0709F9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0241_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD04F 30
		mAnimCmd6 0x0 0x18FE04EC
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0241_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD06D 36
		mAnimCmd6 0x0 0xFFB00E6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0241_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD091 24
		mAnimCmd6 0x0 0x8FAFBE5
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0241_4:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD0A9 30
		mAnimCmd6 0x0 0xFCF1E8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0241_5:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD0C7 30
		mAnimCmd6 0x0 0xFC00E8ED
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0241_6:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD0E5 30
		mAnimCmd6 0x0 0xFA07E2F8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0241_7:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD103 30
		mAnimCmd6 0x0 0xFB0EE601
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0241_8:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD121 25
		mAnimCmd6 0x0 0x215ED03
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0241_9:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD13A 25
		mAnimCmd6 0x0 0x91FF807
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0241_10:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD153 25
		mAnimCmd6 0x0 0x121B0305
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0241_11:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD16C 36
		mAnimCmd6 0x0 0x1B140702
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD190 28
		mAnimCmd6 0x0 0xFA07E2F8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0242_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD1AC 30
		mAnimCmd6 0x0 0xFC00E8ED
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0242_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD1CA 30
		mAnimCmd6 0x0 0xFCF1E8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0242_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD1E8 30
		mAnimCmd6 0x0 0x8FAFBE5
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0242_4:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD206 24
		mAnimCmd6 0x0 0xFFB00E6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0242_5:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD21E 20
		mAnimCmd6 0x0 0x18FE04EC
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0242_6:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD232 28
		mAnimCmd6 0x0 0x1F0709F9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0242_7:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD24E 36
		mAnimCmd6 0x0 0x1B140702
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0242_8:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD272 24
		mAnimCmd6 0x0 0x121B0305
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0242_9:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD28A 28
		mAnimCmd6 0x0 0x91FF807
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0242_10:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD2A6 30
		mAnimCmd6 0x0 0x215ED03
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0242_11:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD2C4 21
		mAnimCmd6 0x0 0xFB0EE601
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD2D9 28
		mAnimCmd6 0x0 0x405EEF9
		.4byte	8, 0

		mGetTiles 0xD2F5 28
		.4byte	8, 1

		mGetTiles 0xD311 28
		.4byte	8, 2

		mGetTiles 0xD2F5 28
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0243:
		.4byte anim_data__0243_0




.align 2, 0
	anim_data__0244_0:
		mGetPalette 0x11 16 0x0
		mGetTiles 0xD32D 24
		mAnimCmd6 0x0 0x180604FA
		.4byte	2, 0

		mGetTiles 0xD345 20
		mAnimCmd6 0x0 0x140604FA
		.4byte	2, 1

		mGetTiles 0xD359 24
		mAnimCmd6 0x0 0x100602FA
		.4byte	2, 2

		mGetTiles 0xD371 24
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	2, 3

		mGetTiles 0xD389 24
		mAnimCmd6 0x0 0x206F4FA
		.4byte	4, 4

		mGetTiles 0xD3A1 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	3, 5

		mGetTiles 0xD3B1 30
		mAnimCmd6 0x0 0x806F8FA
		.4byte	2, 6

		mGetTiles 0xD3CF 24
		mAnimCmd6 0x0 0x140604FA
		.4byte	2, 7

		mGetTiles 0xD32D 24
		mAnimCmd6 0x0 0x180604FA
		.4byte	4, 0

		mGetTiles 0xD345 20
		mAnimCmd6 0x0 0x140604FA
		.4byte	3, 1

		mGetTiles 0xD359 24
		mAnimCmd6 0x0 0x100602FA
		.4byte	2, 2

		mGetTiles 0xD371 24
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	2, 3

		mGetTiles 0xD389 24
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0244_1:
		mGetPalette 0x11 16 0x0
		mGetTiles 0xD3E7 24
		mAnimCmd6 0x0 0xFD06E9FA
		.4byte	2, 8

		mGetTiles 0xD3FF 20
		mAnimCmd6 0x0 0xFC06ECFA
		.4byte	2, 9

		mGetTiles 0xD413 24
		mAnimCmd6 0x0 0xFE06EEFA
		.4byte	2, 10

		mGetTiles 0xD42B 24
		mAnimCmd6 0x0 0x406F6FA
		.4byte	2, 11

		mGetTiles 0xD443 24
		mAnimCmd6 0x0 0xE06FCFA
		.4byte	4, 12

		mGetTiles 0xD45B 16
		mAnimCmd6 0x0 0xC06FEFA
		.4byte	3, 13

		mGetTiles 0xD46B 30
		mAnimCmd6 0x0 0x606F8FA
		.4byte	2, 14

		mGetTiles 0xD489 24
		mAnimCmd6 0x0 0x6ECFA
		.4byte	2, 15

		mGetTiles 0xD3E7 24
		mAnimCmd6 0x0 0xFD06E9FA
		.4byte	4, 8

		mGetTiles 0xD3FF 20
		mAnimCmd6 0x0 0xFC06ECFA
		.4byte	3, 9

		mGetTiles 0xD413 24
		mAnimCmd6 0x0 0xFE06EEFA
		.4byte	2, 10

		mGetTiles 0xD42B 24
		mAnimCmd6 0x0 0x406F6FA
		.4byte	2, 11

		mGetTiles 0xD443 24
		mAnimCmd6 0x0 0xE06FCFA
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0244:
		.4byte anim_data__0244_0
		.4byte anim_data__0244_1




.align 2, 0
	anim_data__0245_0:
		mGetPalette 0x12 16 0x0
		mGetTiles 0xD4A1 20
		mAnimCmd6 0x0 0x50EF8FE
		.4byte	2, 0

		mGetTiles 0xD4B5 18
		mAnimCmd6 0x0 0xEF2FE
		.4byte	2, 1

		mGetTiles 0xD4C7 24
		mAnimCmd6 0x0 0xFC0EECFE
		.4byte	4, 2

		mGetTiles 0xD4DF 25
		mAnimCmd6 0x0 0xFC0EEEFE
		.4byte	3, 3

		mGetTiles 0xD4F8 24
		mAnimCmd6 0x0 0xE0EFEFE
		.4byte	2, 4

		mGetTiles 0xD510 24
		mAnimCmd6 0x0 0xE10FC00
		.4byte	2, 5

		mGetTiles 0xD528 20
		mAnimCmd6 0x0 0x120E00FE
		.4byte	4, 6

		mGetTiles 0xD53C 16
		mAnimCmd6 0x0 0x100EFEFE
		.4byte	3, 7

		mGetTiles 0xD4A1 20
		mAnimCmd6 0x0 0x50EF8FE
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0245_1:
		mGetPalette 0x12 16 0x0
		mGetTiles 0xD54C 20
		mAnimCmd6 0x0 0x80EFAFE
		.4byte	2, 8

		mGetTiles 0xD560 18
		mAnimCmd6 0x0 0x120E02FE
		.4byte	2, 9

		mGetTiles 0xD572 24
		mAnimCmd6 0x0 0x180E04FE
		.4byte	4, 10

		mGetTiles 0xD58A 25
		mAnimCmd6 0x0 0x120E00FE
		.4byte	3, 11

		mGetTiles 0xD5A3 24
		mAnimCmd6 0x0 0x20EF2FE
		.4byte	2, 12

		mGetTiles 0xD5BB 24
		mAnimCmd6 0x0 0x410F400
		.4byte	2, 13

		mGetTiles 0xD5D3 20
		mAnimCmd6 0x0 0x40EEEFE
		.4byte	4, 14

		mGetTiles 0xD5E7 16
		mAnimCmd6 0x0 0x40EF2FE
		.4byte	3, 15

		mGetTiles 0xD54C 20
		mAnimCmd6 0x0 0x80EFAFE
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0245:
		.4byte anim_data__0245_0
		.4byte anim_data__0245_1




.align 2, 0
	anim_data__0246_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD5F7 20
		mAnimCmd6 0x0 0xF405E2F9
		.4byte	2, 0

		mGetTiles 0xD60B 18
		mAnimCmd6 0x0 0xF4FBE2EF
		.4byte	2, 1

		mGetTiles 0xD61D 24
		mAnimCmd6 0x0 0xF4F9E2ED
		.4byte	4, 2

		mGetTiles 0xD635 25
		mAnimCmd6 0x0 0xF4FDE2F1
		.4byte	3, 3

		mGetTiles 0xD64E 25
		mAnimCmd6 0x0 0xF405E2F9
		.4byte	2, 4

		mGetTiles 0xD667 24
		mAnimCmd6 0x0 0xF40BE2FF
		.4byte	2, 5

		mGetTiles 0xD67F 24
		mAnimCmd6 0x0 0xF411E205
		.4byte	4, 6

		mGetTiles 0xD697 20
		mAnimCmd6 0x0 0xF40FE203
		.4byte	3, 7

		mGetTiles 0xD5F7 20
		mAnimCmd6 0x0 0xF405E2F9
		.4byte	2, 0

		mGetTiles 0xD60B 18
		mAnimCmd6 0x0 0xF4FBE2EF
		.4byte	2, 1

		mGetTiles 0xD61D 24
		mAnimCmd6 0x0 0xF4F9E2ED
		.4byte	4, 2

		mGetTiles 0xD635 25
		mAnimCmd6 0x0 0xF4FDE2F1
		.4byte	3, 3

		mGetTiles 0xD64E 25
		mAnimCmd6 0x0 0xF405E2F9
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0246:
		.4byte anim_data__0246_0




.align 2, 0
	anim_data__0247_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD6AB 24
		mAnimCmd6 0x0 0x806F2FA
		.4byte	2, 0

		mGetTiles 0xD6C3 30
		.4byte	2, 1

		mGetTiles 0xD6E1 36
		.4byte	2, 2

		mGetTiles 0xD705 36
		.4byte	2, 3

		mGetTiles 0xD729 24
		.4byte	2, 4

		mGetTiles 0xD741 30
		.4byte	2, 5

		mGetTiles 0xD75F 36
		.4byte	2, 6

		mGetTiles 0xD783 30
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0247_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD7A1 20
		mAnimCmd6 0x0 0x806F2FA
		.4byte	2, 8

		mGetTiles 0xD7B5 20
		.4byte	2, 9

		mGetTiles 0xD7C9 20
		.4byte	3, 10

		mGetTiles 0xD7DD 20
		.4byte	3, 11

		mGetTiles 0xD7F1 25
		.4byte	3, 12

		mAnimCmd4 

	anim_data__0247_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD80A 35
		mAnimCmd6 0x0 0xB08F2FA
		.4byte	3, 13

		mGetTiles 0xD82D 35
		.4byte	3, 14

		mGetTiles 0xD850 35
		.4byte	3, 15

		mJumpBack 0x15


.align 2, 0
	anim_0247:
		.4byte anim_data__0247_0
		.4byte anim_data__0247_1
		.4byte anim_data__0247_2




.align 2, 0
	anim_data__0248_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD873 35
		mAnimCmd6 0x0 0xFE06E8FA
		.4byte	3, 0

		mGetTiles 0xD896 35
		.4byte	3, 1

		mGetTiles 0xD8B9 35
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0248_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD8DC 25
		mAnimCmd6 0x0 0x6EAFA
		.4byte	3, 3

		mGetTiles 0xD8F5 20
		.4byte	3, 4

		mGetTiles 0xD909 25
		.4byte	3, 5

		mGetTiles 0xD922 20
		.4byte	3, 6

		mGetTiles 0xD936 30
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0248_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xD954 30
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 8

		mGetTiles 0xD972 30
		.4byte	3, 9

		mGetTiles 0xD990 30
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0248:
		.4byte anim_data__0248_0
		.4byte anim_data__0248_1
		.4byte anim_data__0248_2




.align 2, 0
	anim_data__0249_0:
		mGetPalette 0x13 16 0x0
		mGetTiles 0xD9AE 30
		mAnimCmd6 0x0 0xC06F6FA
		.4byte	5, 0

		mGetTiles 0xD9CC 24
		.4byte	5, 1

		mGetTiles 0xD9E4 30
		.4byte	5, 2

		mGetTiles 0xDA02 24
		.4byte	5, 3

		mGetTiles 0xDA1A 30
		.4byte	5, 4

		mGetTiles 0xDA38 30
		.4byte	5, 5

		mGetTiles 0xDA56 30
		.4byte	5, 6

		mGetTiles 0xDA74 30
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0249:
		.4byte anim_data__0249_0




.align 2, 0
	anim_data__0250_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDA92 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0250_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAAB 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0250_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAC4 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0250_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDADC 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0250_4:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDAF4 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0250_5:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB08 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0250_6:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB21 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0250_7:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB35 24
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0250_8:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB4D 35
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0250_9:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB70 20
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0250_10:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB84 25
		mAnimCmd6 0x0 0xC04F6FA
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDB9D 30
		mAnimCmd6 0x0 0xC04F8FA
		.4byte	2, 0

		mGetTiles 0xDBBB 30
		.4byte	2, 1

		mGetTiles 0xDBD9 35
		.4byte	2, 2

		mGetTiles 0xDBFC 30
		.4byte	2, 3

		mGetTiles 0xDC1A 30
		.4byte	2, 4

		mGetTiles 0xDC38 30
		.4byte	2, 5

		mGetTiles 0xDC56 28
		.4byte	2, 6

		mGetTiles 0xDC72 30
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0251_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDC90 30
		mAnimCmd6 0x0 0x604F4FA
		.4byte	2, 8

		mGetTiles 0xDCAE 30
		.4byte	2, 9

		mGetTiles 0xDCCC 35
		.4byte	2, 10

		mGetTiles 0xDCEF 30
		.4byte	2, 11

		mGetTiles 0xDD0D 30
		.4byte	2, 12

		mGetTiles 0xDD2B 30
		.4byte	2, 13

		mGetTiles 0xDD49 28
		.4byte	2, 14

		mGetTiles 0xDD65 30
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0251:
		.4byte anim_data__0251_0
		.4byte anim_data__0251_1




.align 2, 0
	anim_data__0252_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDD83 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0xDD93 16
		.4byte	2, 1

		mGetTiles 0xDDA3 16
		.4byte	2, 2

		mGetTiles 0xDDB3 16
		.4byte	2, 3

		mGetTiles 0xDDC3 16
		.4byte	2, 4

		mGetTiles 0xDDD3 16
		.4byte	2, 5

		mGetTiles 0xDDE3 16
		.4byte	2, 6

		mGetTiles 0xDDF3 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0252:
		.4byte anim_data__0252_0




.align 2, 0
	anim_data__0253_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDE03 30
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	2, 0

		mGetTiles 0xDE21 30
		.4byte	2, 1

		mGetTiles 0xDE3F 30
		.4byte	2, 2

		mGetTiles 0xDE5D 20
		.4byte	2, 3

		mGetTiles 0xDE71 30
		.4byte	2, 4

		mGetTiles 0xDE8F 30
		.4byte	2, 5

		mGetTiles 0xDEAD 30
		.4byte	2, 6

		mGetTiles 0xDECB 24
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0253_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDEE3 18
		mAnimCmd6 0x0 0xA06ECFA
		.4byte	3, 8

		mGetTiles 0xDEF5 18
		.4byte	3, 9

		mGetTiles 0xDF07 18
		.4byte	3, 10

		mGetTiles 0xDF19 18
		.4byte	3, 11

		mGetTiles 0xDF07 18
		.4byte	3, 10

		mGetTiles 0xDEF5 18
		.4byte	3, 9

		mJumpBack 0x24


.align 2, 0
	anim_0253:
		.4byte anim_data__0253_0
		.4byte anim_data__0253_1




.align 2, 0
	anim_data__0254_0:
		mGetPalette 0x14 16 0x0
		mGetTiles 0xDF2B 25
		mAnimCmd6 0x0 0x406EEFA
		.4byte	3, 0

		mGetTiles 0xDF44 30
		mAnimCmd6 0x0 0x4FEEEF1
		.4byte	3, 1

		mGetTiles 0xDF62 25
		mAnimCmd6 0x0 0x4FCEEEC
		.4byte	3, 2

		mGetTiles 0xDF7B 20
		mAnimCmd6 0x0 0x4FEEEF0
		.4byte	3, 3

		mGetTiles 0xDF8F 25
		mAnimCmd6 0x0 0x406EEF8
		.4byte	3, 4

		mGetTiles 0xDFA8 30
		mAnimCmd6 0x0 0x412EE04
		.4byte	3, 5

		mGetTiles 0xDFC6 30
		mAnimCmd6 0x0 0x415EE06
		.4byte	3, 6

		mGetTiles 0xDFE4 25
		mAnimCmd6 0x0 0x412EE03
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0254:
		.4byte anim_data__0254_0




.align 2, 0
	anim_data__0255_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xDFFD 30
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	3, 0

		mGetTiles 0xE01B 30
		.4byte	3, 1

		mGetTiles 0xE039 30
		.4byte	3, 2

		mGetTiles 0xE057 35
		.4byte	3, 3

		mGetTiles 0xE07A 30
		.4byte	3, 4

		mGetTiles 0xE098 30
		.4byte	3, 5

		mGetTiles 0xE0B6 30
		.4byte	3, 6

		mGetTiles 0xE0D4 35
		.4byte	3, 7

		mJumpBack 0x2E

	anim_data__0255_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE0F7 30
		mAnimCmd6 0x0 0x1408F8FC
		.4byte	3, 8

		mGetTiles 0xE115 30
		.4byte	3, 9

		mGetTiles 0xE133 28
		.4byte	3, 10

		mGetTiles 0xE14F 30
		.4byte	3, 11

		mGetTiles 0xE16D 30
		.4byte	3, 12

		mGetTiles 0xE18B 30
		.4byte	3, 13

		mGetTiles 0xE1A9 35
		.4byte	3, 14

		mGetTiles 0xE1CC 30
		.4byte	3, 15

		mJumpBack 0x2E

	anim_data__0255_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE1EA 30
		mAnimCmd6 0x0 0x1208F6FC
		.4byte	3, 16

		mGetTiles 0xE208 30
		.4byte	3, 17

		mGetTiles 0xE226 35
		.4byte	3, 18

		mGetTiles 0xE249 30
		.4byte	3, 19

		mGetTiles 0xE267 30
		.4byte	3, 20

		mGetTiles 0xE285 30
		.4byte	3, 21

		mGetTiles 0xE2A3 28
		.4byte	3, 22

		mGetTiles 0xE2BF 30
		.4byte	3, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0255:
		.4byte anim_data__0255_0
		.4byte anim_data__0255_1
		.4byte anim_data__0255_2




.align 2, 0
	anim_data__0256_0:
		mGetPalette 0x15 16 0x10
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0256:
		.4byte anim_data__0256_0




.align 2, 0
	anim_data__0257_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE2DD 64
		mAnimCmd6 0x0 0x1304FFFA
		.4byte	2, 0

		mGetTiles 0xE31D 64
		.4byte	2, 1

		mGetTiles 0xE35D 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0257:
		.4byte anim_data__0257_0




.align 2, 0
	anim_data__0267_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE39D 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0267_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE3AD 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0267:
		.4byte anim_data__0267_0
		.4byte anim_data__0267_1




.align 2, 0
	anim_data__0268_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE3BD 16
		.4byte	3, 0

		mGetTiles 0xE3CD 20
		.4byte	3, 1

		mGetTiles 0xE3E1 16
		.4byte	3, 2

		mGetTiles 0xE3F1 20
		.4byte	3, 3

		mGetTiles 0xE405 20
		.4byte	3, 4

		mGetTiles 0xE419 16
		.4byte	3, 5

		mJumpBack 0x21

	anim_data__0268_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE429 20
		.4byte	3, 6

		mGetTiles 0xE43D 25
		.4byte	3, 7

		mGetTiles 0xE456 20
		.4byte	3, 8

		mGetTiles 0xE46A 20
		.4byte	3, 9

		mGetTiles 0xE47E 25
		.4byte	3, 10

		mGetTiles 0xE497 20
		.4byte	3, 11

		mJumpBack 0x21

	anim_data__0268_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE4AB 16
		.4byte	3, 12

		mGetTiles 0xE4BB 16
		.4byte	3, 13

		mGetTiles 0xE4CB 16
		.4byte	3, 14

		mGetTiles 0xE4DB 16
		.4byte	3, 15

		mGetTiles 0xE4EB 16
		.4byte	3, 16

		mGetTiles 0xE4FB 16
		.4byte	3, 17

		mJumpBack 0x21

	anim_data__0268_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE50B 20
		.4byte	3, 18

		mGetTiles 0xE51F 20
		.4byte	3, 19

		mGetTiles 0xE533 20
		.4byte	3, 20

		mGetTiles 0xE547 20
		.4byte	3, 21

		mGetTiles 0xE55B 20
		.4byte	3, 22

		mGetTiles 0xE56F 20
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0268:
		.4byte anim_data__0268_0
		.4byte anim_data__0268_1
		.4byte anim_data__0268_2
		.4byte anim_data__0268_3




.align 2, 0
	anim_data__0269_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE583 36
		.4byte	2, 0

		mGetTiles 0xE5A7 30
		.4byte	2, 1

		mJumpBack 0xD

	anim_data__0269_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE5C5 16
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0269_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE5D5 25
		.4byte	2, 3

		mGetTiles 0xE5EE 25
		.4byte	2, 4

		mJumpBack 0xD

	anim_data__0269_3:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE607 24
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0269:
		.4byte anim_data__0269_0
		.4byte anim_data__0269_1
		.4byte anim_data__0269_2
		.4byte anim_data__0269_3




.align 2, 0
	anim_data__0270_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE61F 16
		.4byte	6, 0

		mGetTiles 0xE62F 20
		.4byte	6, 1

		mGetTiles 0xE643 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0270_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0xE657 24
		.4byte	6, 3

		mGetTiles 0xE66F 30
		.4byte	6, 4

		mGetTiles 0xE68D 30
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0270:
		.4byte anim_data__0270_0
		.4byte anim_data__0270_1




.align 2, 0
	anim_data__0271_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xE6AB 16
		.4byte	2, 0

		mGetTiles 0xE6BB 16
		.4byte	2, 1

		mGetTiles 0xE6CB 16
		.4byte	2, 2

		mGetTiles 0xE6DB 16
		.4byte	2, 3

		mGetTiles 0xE6EB 16
		.4byte	2, 4

		mGetTiles 0xE6FB 16
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0271:
		.4byte anim_data__0271_0




.align 2, 0
	anim_data__0272_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0xE70B 16
		.4byte	2, 0

		mGetTiles 0xE71B 16
		.4byte	2, 1

		mGetTiles 0xE72B 16
		.4byte	2, 2

		mGetTiles 0xE73B 16
		.4byte	2, 3

		mGetTiles 0xE74B 20
		.4byte	3, 4

		mGetTiles 0xE75F 12
		.4byte	3, 5

		mGetTiles 0xE76B 16
		.4byte	3, 6

		mGetTiles 0xE77B 16
		.4byte	3, 7

		mGetTiles 0xE78B 16
		.4byte	3, 8

		mGetTiles 0xE79B 16
		.4byte	3, 9

		mGetTiles 0xE7AB 16
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0272:
		.4byte anim_data__0272_0




.align 2, 0
	anim_data__0273_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xE7BB 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	5, 0

		mGetTiles 0xE7CF 20
		.4byte	5, 1

		mGetTiles 0xE7E3 20
		.4byte	5, 2

		mGetTiles 0xE7F7 16
		.4byte	5, 3

		mGetTiles 0xE807 20
		.4byte	5, 4

		mGetTiles 0xE7BB 20
		.4byte	5, 0

		mGetTiles 0xE7CF 20
		.4byte	5, 1

		mGetTiles 0xE7E3 20
		.4byte	5, 2

		mGetTiles 0xE7F7 16
		.4byte	5, 3

		mGetTiles 0xE807 20
		.4byte	5, 4

		mGetTiles 0xE81B 20
		.4byte	5, 5

		mGetTiles 0xE7BB 20
		.4byte	5, 0

		mGetTiles 0xE7CF 20
		.4byte	5, 1

		mGetTiles 0xE82F 20
		.4byte	5, 6

		mGetTiles 0xE843 16
		.4byte	5, 7

		mGetTiles 0xE853 20
		.4byte	5, 8

		mGetTiles 0xE81B 20
		.4byte	5, 5

		mGetTiles 0xE7BB 20
		.4byte	5, 0

		mGetTiles 0xE7CF 20
		.4byte	5, 1

		mGetTiles 0xE7E3 20
		.4byte	5, 2

		mGetTiles 0xE7F7 16
		.4byte	5, 3

		mGetTiles 0xE807 20
		mAnimCmd6 0x0 0x1008F3FA
		.4byte	5, 4

		mGetTiles 0xE867 20
		.4byte	5, 9

		mGetTiles 0xE87B 20
		.4byte	10, 10

		mGetTiles 0xE88F 20
		.4byte	5, 11

		mGetTiles 0xE8A3 20
		.4byte	5, 12

		mGetTiles 0xE8B7 20
		.4byte	5, 13

		mGetTiles 0xE867 20
		.4byte	5, 9

		mGetTiles 0xE87B 20
		.4byte	5, 10

		mGetTiles 0xE88F 20
		.4byte	5, 11

		mGetTiles 0xE8A3 20
		.4byte	5, 12

		mGetTiles 0xE8B7 20
		.4byte	12, 13

		mGetTiles 0xE867 20
		.4byte	6, 9

		mGetTiles 0xE81B 20
		.4byte	5, 5

		mGetTiles 0xE7BB 20
		.4byte	5, 0

		mGetTiles 0xE7CF 20
		.4byte	5, 1

		mGetTiles 0xE7E3 20
		.4byte	5, 2

		mGetTiles 0xE7F7 16
		.4byte	5, 3

		mGetTiles 0xE807 20
		.4byte	5, 4

		mJumpBack 0xCC


.align 2, 0
	anim_0273:
		.4byte anim_data__0273_0




.align 2, 0
	anim_data__0274_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xE8CB 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	6, 0

		mGetTiles 0xE8DF 20
		.4byte	5, 1

		mGetTiles 0xE8F3 20
		.4byte	3, 2

		mGetTiles 0xE907 20
		.4byte	5, 3

		mGetTiles 0xE8F3 20
		.4byte	3, 2

		mGetTiles 0xE8DF 20
		.4byte	5, 1

		mGetTiles 0xE8F3 20
		.4byte	3, 2

		mGetTiles 0xE907 20
		.4byte	5, 3

		mGetTiles 0xE8F3 20
		.4byte	3, 2

		mGetTiles 0xE8DF 20
		.4byte	6, 1

		mGetTiles 0xE91B 20
		.4byte	4, 4

		mGetTiles 0xE92F 20
		.4byte	5, 5

		mGetTiles 0xE943 20
		.4byte	3, 6

		mGetTiles 0xE957 20
		.4byte	5, 7

		mGetTiles 0xE943 20
		.4byte	3, 6

		mGetTiles 0xE92F 20
		.4byte	5, 5

		mGetTiles 0xE943 20
		.4byte	3, 6

		mGetTiles 0xE957 20
		.4byte	5, 7

		mGetTiles 0xE943 20
		.4byte	3, 6

		mGetTiles 0xE92F 20
		.4byte	6, 5

		mGetTiles 0xE8CB 20
		.4byte	4, 0

		mGetTiles 0xE96B 20
		.4byte	3, 8

		mGetTiles 0xE97F 20
		.4byte	3, 9

		mGetTiles 0xE993 20
		.4byte	2, 10

		mGetTiles 0xE9A7 20
		.4byte	2, 11

		mGetTiles 0xE9BB 20
		.4byte	4, 12

		mGetTiles 0xE96B 20
		.4byte	3, 8

		mGetTiles 0xE97F 20
		.4byte	3, 9

		mGetTiles 0xE993 20
		.4byte	2, 10

		mGetTiles 0xE9A7 20
		.4byte	2, 11

		mGetTiles 0xE9BB 20
		.4byte	8, 12

		mGetTiles 0xE9CF 20
		.4byte	2, 13

		mGetTiles 0xE9E3 20
		.4byte	2, 14

		mGetTiles 0xE9F7 25
		.4byte	2, 15

		mGetTiles 0xEA10 30
		mAnimCmd6 0x1 0x10FEEFE9
		mPlaySoundEffect 126
		.4byte	2, 16

		mGetTiles 0xEA2E 25
		.4byte	4, 17

		mGetTiles 0xEA47 25
		.4byte	2, 18

		mGetTiles 0xEA60 20
		.4byte	2, 19

		mGetTiles 0xEA10 30
		mAnimCmd6 0x1 0x10FEEFE9
		mPlaySoundEffect 126
		.4byte	2, 16

		mGetTiles 0xEA2E 25
		.4byte	4, 17

		mGetTiles 0xEA47 25
		.4byte	2, 18

		mGetTiles 0xE9E3 20
		.4byte	2, 14

		mGetTiles 0xEA74 20
		.4byte	2, 20

		mGetTiles 0xEA88 20
		.4byte	2, 21

		mGetTiles 0xEA9C 20
		.4byte	2, 22

		mGetTiles 0xEAB0 30
		mAnimCmd6 0x1 0x10FEF0E7
		mPlaySoundEffect 126
		.4byte	2, 23

		mGetTiles 0xEACE 30
		.4byte	4, 24

		mGetTiles 0xEA9C 20
		.4byte	2, 22

		mGetTiles 0xEA88 20
		.4byte	2, 21

		mGetTiles 0xE9CF 20
		.4byte	2, 13

		mJumpBack 0x6E

	anim_data__0274_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xE9CF 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 13

		mAnimCmd4 


.align 2, 0
	anim_0274:
		.4byte anim_data__0274_0
		.4byte anim_data__0274_1




.align 2, 0
	anim_data__0275_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEAEC 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 0

		mGetTiles 0xEAFC 16
		.4byte	1, 1

		mGetTiles 0xEB0C 12
		.4byte	1, 2

		mGetTiles 0xEB18 16
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0275_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEAFC 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 1

		mGetTiles 0xEAEC 16
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0275:
		.4byte anim_data__0275_0
		.4byte anim_data__0275_1




.align 2, 0
	anim_data__0276_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEB28 16
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0xEB38 16
		.4byte	2, 1

		mGetTiles 0xEB48 16
		.4byte	2, 2

		mGetTiles 0xEB58 16
		.4byte	2, 3

		mJumpBack 0x1D

	anim_data__0276_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEB68 16
		mAnimCmd6 0x0 0x806F8FA
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 4

		mGetTiles 0xEB78 16
		.4byte	2, 5

		mGetTiles 0xEB88 16
		.4byte	2, 6

		mGetTiles 0xEB98 16
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0276:
		.4byte anim_data__0276_0
		.4byte anim_data__0276_1




.align 2, 0
	anim_data__0277_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEBA8 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0xEBB8 16
		.4byte	2, 1

		mGetTiles 0xEBC8 16
		.4byte	2, 2

		mGetTiles 0xEBD8 16
		.4byte	2, 3

		mJumpBack 0x1D


.align 2, 0
	anim_0277:
		.4byte anim_data__0277_0




.align 2, 0
	anim_data__0278_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEBE8 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 0

		mGetTiles 0xEBFC 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0278:
		.4byte anim_data__0278_0




.align 2, 0
	anim_data__0279_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEC10 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 0

		mGetTiles 0xEC24 30
		.4byte	1, 1

		mGetTiles 0xEC42 30
		.4byte	1, 2

		mGetTiles 0xEC60 25
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0279:
		.4byte anim_data__0279_0




.align 2, 0
	anim_data__0280_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEC79 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0xEC8D 30
		.4byte	2, 1

		mGetTiles 0xECAB 30
		.4byte	2, 2

		mJumpBack 0x5

	anim_data__0280_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECC9 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 3

		mGetTiles 0xEC79 20
		.4byte	2, 0

		mAnimCmd4 


.align 2, 0
	anim_0280:
		.4byte anim_data__0280_0
		.4byte anim_data__0280_1




.align 2, 0
	anim_data__0281_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECE7 20
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	1, 0

		mGetTiles 0xECFB 25
		.4byte	1, 1

		mGetTiles 0xED14 30
		.4byte	3, 2

		mGetTiles 0xED32 25
		.4byte	3, 3

		mJumpBack 0xA

	anim_data__0281_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xECFB 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	2, 1

		mGetTiles 0xECE7 20
		.4byte	2, 0

		mAnimCmd4 


.align 2, 0
	anim_0281:
		.4byte anim_data__0281_0
		.4byte anim_data__0281_1




.align 2, 0
	anim_data__0282_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xED4B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 0

		mGetTiles 0xED8B 64
		.4byte	8, 1

		mGetTiles 0xEDCB 64
		.4byte	8, 2

		mGetTiles 0xEE0B 64
		.4byte	8, 3

		mGetTiles 0xEE4B 64
		.4byte	8, 4

		mGetTiles 0xEE8B 64
		.4byte	8, 5

		mGetTiles 0xEECB 64
		.4byte	8, 6

		mGetTiles 0xEF0B 64
		.4byte	8, 7

		mJumpBack 0x2E

	anim_data__0282_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xEF4B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 8

		mGetTiles 0xEF8B 64
		.4byte	8, 9

		mGetTiles 0xEFCB 64
		.4byte	8, 10

		mGetTiles 0xF00B 64
		.4byte	8, 11

		mGetTiles 0xF04B 64
		.4byte	8, 12

		mGetTiles 0xF08B 64
		.4byte	8, 13

		mGetTiles 0xF0CB 64
		.4byte	8, 14

		mGetTiles 0xF10B 64
		.4byte	8, 15

		mJumpBack 0x2E

	anim_data__0282_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF14B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 16

		mGetTiles 0xF18B 64
		.4byte	8, 17

		mGetTiles 0xF1CB 64
		.4byte	8, 18

		mGetTiles 0xF20B 64
		.4byte	8, 19

		mGetTiles 0xF24B 64
		.4byte	8, 20

		mGetTiles 0xF28B 64
		.4byte	8, 21

		mGetTiles 0xF2CB 64
		.4byte	8, 22

		mGetTiles 0xF30B 64
		.4byte	8, 23

		mJumpBack 0x2E

	anim_data__0282_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF34B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 24

		mGetTiles 0xF38B 64
		.4byte	8, 25

		mGetTiles 0xF3CB 64
		.4byte	8, 26

		mGetTiles 0xF40B 64
		.4byte	8, 27

		mGetTiles 0xF44B 64
		.4byte	8, 28

		mGetTiles 0xF48B 64
		.4byte	8, 29

		mGetTiles 0xF4CB 64
		.4byte	8, 30

		mGetTiles 0xF50B 64
		.4byte	8, 31

		mJumpBack 0x2E

	anim_data__0282_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF54B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 32

		mGetTiles 0xF58B 64
		.4byte	8, 33

		mGetTiles 0xF5CB 64
		.4byte	8, 34

		mGetTiles 0xF60B 64
		.4byte	8, 35

		mGetTiles 0xF64B 64
		.4byte	8, 36

		mGetTiles 0xF68B 64
		.4byte	8, 37

		mGetTiles 0xF6CB 64
		.4byte	8, 38

		mGetTiles 0xF70B 64
		.4byte	8, 39

		mJumpBack 0x2E

	anim_data__0282_5:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF54B 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	8, 32

		mGetTiles 0xF58B 64
		.4byte	8, 33

		mGetTiles 0xF5CB 64
		.4byte	8, 34

		mGetTiles 0xF60B 64
		.4byte	8, 35

		mGetTiles 0xF64B 64
		.4byte	8, 36

		mGetTiles 0xF68B 64
		.4byte	8, 37

		mGetTiles 0xF6CB 64
		.4byte	8, 38

		mGetTiles 0xF70B 64
		.4byte	8, 39

		mJumpBack 0x2E


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
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF74B 16
		mAnimCmd6 0x0 0x1206F4FA
		mAnimCmd6 0x1 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0xF75B 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0283_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF76B 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xF77B 16
		.4byte	2, 3

		mGetTiles 0xF78B 16
		.4byte	2, 4

		mGetTiles 0xF79B 16
		.4byte	2, 5

		mGetTiles 0xF7AB 16
		.4byte	2, 6

		mGetTiles 0xF7BB 16
		.4byte	2, 7

		mGetTiles 0xF7CB 16
		.4byte	2, 8

		mGetTiles 0xF7DB 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0283_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF7EB 25
		mAnimCmd6 0x0 0x406F0FA
		mAnimCmd6 0x1 0xE08F6F8
		.4byte	1, 10

		mGetTiles 0xF804 20
		.4byte	2, 11

		mGetTiles 0xF818 25
		.4byte	2, 12

		mGetTiles 0xF831 25
		.4byte	2, 13

		mJumpBack 0xF


.align 2, 0
	anim_0283:
		.4byte anim_data__0283_0
		.4byte anim_data__0283_1
		.4byte anim_data__0283_2




.align 2, 0
	anim_data__0284_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF84A 16
		mAnimCmd6 0x0 0x1006F0FA
		mAnimCmd6 0x1 0x1006F0FA
		.4byte	3, 0

		mGetTiles 0xF85A 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0284_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF86A 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 2

		mGetTiles 0xF87A 16
		.4byte	2, 3

		mGetTiles 0xF88A 16
		.4byte	2, 4

		mGetTiles 0xF89A 16
		.4byte	2, 5

		mGetTiles 0xF8AA 16
		.4byte	2, 6

		mGetTiles 0xF8BA 16
		.4byte	2, 7

		mGetTiles 0xF8CA 16
		.4byte	2, 8

		mGetTiles 0xF8DA 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0284_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF8EA 25
		mAnimCmd6 0x0 0x406F0FA
		mAnimCmd6 0x1 0xE08F6F8
		.4byte	1, 10

		mGetTiles 0xF903 20
		.4byte	2, 11

		mGetTiles 0xF917 25
		.4byte	2, 12

		mGetTiles 0xF930 25
		.4byte	2, 13

		mAnimCmd4 


.align 2, 0
	anim_0284:
		.4byte anim_data__0284_0
		.4byte anim_data__0284_1
		.4byte anim_data__0284_2




.align 2, 0
	anim_data__0285_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF949 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0xF967 16
		mAnimCmd6 0x0 0x1C06FEFA
		.4byte	1, 1

		mGetTiles 0xF977 16
		.4byte	1, 2

		mGetTiles 0xF967 16
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0285:
		.4byte anim_data__0285_0




.align 2, 0
	anim_data__0286_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xF987 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0xF9A5 30
		.4byte	2, 1

		mGetTiles 0xF9C3 30
		.4byte	2, 2

		mGetTiles 0xF9E1 30
		.4byte	2, 3

		mGetTiles 0xF9FF 30
		.4byte	2, 4

		mJumpBack 0xF


.align 2, 0
	anim_0286:
		.4byte anim_data__0286_0




.align 2, 0
	anim_data__0287_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFA1D 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0xFA1D 20
		.4byte	2, 0

		mGetTiles 0xFA31 30
		mAnimCmd6 0x0 0x1002F2F0
		mAnimCmd6 0x1 0x10F2EFDD
		mPlaySoundEffect 126
		.4byte	2, 1

		mGetTiles 0xFA4F 35
		mAnimCmd6 0x0 0x1006F2FA
		mAnimCmd6 0x1 0x0
		.4byte	4, 2

		mGetTiles 0xFA72 30
		mAnimCmd6 0x0 0x1006F2FA
		mAnimCmd6 0x1 0x0
		.4byte	2, 3

		mGetTiles 0xFA1D 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0287_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFA90 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 4

		mGetTiles 0xFAA4 20
		.4byte	2, 5

		mGetTiles 0xFAB8 35
		mAnimCmd6 0x0 0x1006F2EF
		mAnimCmd6 0x1 0x10F3EFDD
		mPlaySoundEffect 126
		.4byte	2, 6

		mGetTiles 0xFADB 35
		mAnimCmd6 0x0 0x1006F2EF
		mAnimCmd6 0x1 0x0
		.4byte	8, 7

		mGetTiles 0xFAA4 20
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	3, 5

		mGetTiles 0xFA90 20
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0287:
		.4byte anim_data__0287_0
		.4byte anim_data__0287_1




.align 2, 0
	anim_data__0288_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFAFE 28
		mAnimCmd6 0x0 0x1206F4FA
		mAnimCmd6 0x1 0x1E0EFEF2
		.4byte	2, 0

		mGetTiles 0xFB1A 28
		.4byte	2, 1

		mGetTiles 0xFB36 28
		.4byte	2, 2

		mGetTiles 0xFB52 28
		.4byte	2, 3

		mGetTiles 0xFAFE 28
		.4byte	2, 0

		mGetTiles 0xFB1A 28
		.4byte	2, 1

		mGetTiles 0xFB36 28
		.4byte	2, 2

		mGetTiles 0xFB52 28
		.4byte	2, 3

		mJumpBack 0x31

	anim_data__0288_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFB6E 25
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 4

		mGetTiles 0xFB87 20
		.4byte	1, 5

		mGetTiles 0xFB9B 16
		.4byte	1, 6

		mGetTiles 0xFBAB 16
		.4byte	1, 7

		mGetTiles 0xFBBB 16
		.4byte	4, 8

		mGetTiles 0xFBAB 16
		.4byte	2, 7

		mGetTiles 0xFB9B 16
		.4byte	2, 6

		mAnimCmd4 

	anim_data__0288_2:
		mGetPalette 0x17 16 0x40
		mGetTiles 0xFBCB 6
		.4byte	2, 9

		mGetTiles 0xFBD1 16
		.4byte	2, 10

		mGetTiles 0xFBE1 25
		.4byte	2, 11

		mGetTiles 0xFBFA 25
		.4byte	2, 12

		mGetTiles 0xFC13 24
		.4byte	2, 13

		mGetTiles 0xFC2B 18
		.4byte	2, 14

		mGetTiles 0xFC3D 15
		.4byte	2, 15

		mGetTiles 0xFC4C 4
		.4byte	2, 16

		mJumpBack 0x2B


.align 2, 0
	anim_0288:
		.4byte anim_data__0288_0
		.4byte anim_data__0288_1
		.4byte anim_data__0288_2




.align 2, 0
	anim_data__0289_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFC50 32
		mAnimCmd6 0x0 0x1006F2FA
		mAnimCmd6 0x1 0x700E9E7
		.4byte	2, 0

		mGetTiles 0xFC70 32
		.4byte	2, 1

		mGetTiles 0xFC90 32
		.4byte	2, 2

		mGetTiles 0xFCB0 32
		.4byte	2, 3

		mGetTiles 0xFC50 32
		.4byte	2, 0

		mGetTiles 0xFC70 32
		.4byte	2, 1

		mGetTiles 0xFC90 32
		.4byte	2, 2

		mGetTiles 0xFCB0 32
		.4byte	2, 3

		mJumpBack 0x31

	anim_data__0289_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFCD0 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 4

		mGetTiles 0xFCEE 36
		.4byte	1, 5

		mGetTiles 0xFD12 30
		.4byte	1, 6

		mGetTiles 0xFD30 24
		.4byte	1, 7

		mGetTiles 0xFD48 20
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0289_2:
		mGetPalette 0x17 16 0x40
		mGetTiles 0xFD5C 4
		.4byte	2, 9

		mGetTiles 0xFD60 12
		.4byte	2, 10

		mGetTiles 0xFD6C 25
		.4byte	2, 11

		mGetTiles 0xFD85 30
		.4byte	2, 12

		mGetTiles 0xFDA3 20
		.4byte	2, 13

		mGetTiles 0xFDB7 18
		.4byte	2, 14

		mGetTiles 0xFDC9 18
		.4byte	2, 15

		mGetTiles 0xFDDB 6
		.4byte	2, 16

		mJumpBack 0x2B


.align 2, 0
	anim_0289:
		.4byte anim_data__0289_0
		.4byte anim_data__0289_1
		.4byte anim_data__0289_2




.align 2, 0
	anim_data__0292_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFDE1 24
		mAnimCmd6 0x0 0x610F8FA
		mAnimCmd6 0x1 0x902F4F1
		.4byte	3, 0

		mGetTiles 0xFDF9 24
		.4byte	3, 1

		mJumpBack 0x13


.align 2, 0
	anim_0292:
		.4byte anim_data__0292_0




.align 2, 0
	anim_data__0293_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE11 24
		mAnimCmd6 0x0 0x610F8FA
		mAnimCmd6 0x1 0x902F4F4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0293_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE29 24
		mAnimCmd6 0x0 0x60CF8F6
		mAnimCmd6 0x1 0x9FEF4F0
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0293_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE41 24
		mAnimCmd6 0x0 0x608F8F2
		mAnimCmd6 0x1 0x910F402
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0293_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE59 24
		mAnimCmd6 0x0 0x604F8EE
		mAnimCmd6 0x1 0x90CF4FE
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0293:
		.4byte anim_data__0293_0
		.4byte anim_data__0293_1
		.4byte anim_data__0293_2
		.4byte anim_data__0293_3




.align 2, 0
	anim_data__0294_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE71 15
		mAnimCmd6 0x0 0x715FAFB
		mAnimCmd6 0x1 0xA02F6F5
		.4byte	2, 0

		mGetTiles 0xFE80 15
		.4byte	2, 1

		mJumpBack 0x13


.align 2, 0
	anim_0294:
		.4byte anim_data__0294_0




.align 2, 0
	anim_data__0295_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFE8F 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0xFEA3 25
		.4byte	3, 1

		mGetTiles 0xFEBC 30
		.4byte	3, 2

		mGetTiles 0xFEDA 30
		.4byte	3, 3

		mGetTiles 0xFEF8 30
		.4byte	3, 4

		mGetTiles 0xFF16 30
		.4byte	3, 5

		mGetTiles 0xFF34 30
		.4byte	3, 6

		mJumpBack 0xF

	anim_data__0295_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFF52 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 7

		mGetTiles 0xFF70 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 8

		mGetTiles 0xFF80 16
		.4byte	1, 9

		mGetTiles 0xFF90 16
		.4byte	2, 10

		mGetTiles 0xFF80 16
		.4byte	1, 9

		mGetTiles 0xFF70 16
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_0295:
		.4byte anim_data__0295_0
		.4byte anim_data__0295_1




.align 2, 0
	anim_data__0296_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFFA0 30
		mAnimCmd6 0x0 0xA0AF2FE
		.4byte	2, 0

		mGetTiles 0xFFBE 20
		mAnimCmd6 0x0 0xF0AF6FA
		.4byte	2, 1

		mGetTiles 0xFFD2 16
		mAnimCmd6 0x0 0xF7F7F7F7
		.4byte	2, 2

		mAnimCmd4 


.align 2, 0
	anim_0296:
		.4byte anim_data__0296_0




.align 2, 0
	anim_data__0297_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0xFFE2 20
		mAnimCmd6 0x0 0xF0AF6FA
		.4byte	4, 0

		mGetTiles 0xFFF6 24
		mPlaySoundEffect 125
		.4byte	4, 1

		mGetTiles 0x1000E 20
		.4byte	4, 2

		mGetTiles 0x10022 20
		.4byte	4, 3

		mGetTiles 0x10036 24
		mPlaySoundEffect 125
		.4byte	4, 4

		mGetTiles 0x1004E 20
		.4byte	4, 5

		mJumpBack 0x28

	anim_data__0297_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1004E 20
		mAnimCmd6 0x0 0xF0AF6FA
		.4byte	4, 5

		mGetTiles 0x10036 24
		.4byte	4, 4

		mGetTiles 0x10022 20
		mPlaySoundEffect 125
		.4byte	4, 3

		mGetTiles 0x1000E 20
		.4byte	4, 2

		mGetTiles 0xFFF6 24
		.4byte	4, 1

		mGetTiles 0xFFE2 20
		mPlaySoundEffect 125
		.4byte	4, 0

		mJumpBack 0x28

	anim_data__0297_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10062 16
		mAnimCmd6 0x0 0xF0AF6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0297_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10072 20
		mAnimCmd6 0x0 0xF07F8F7
		.4byte	4, 7

		mGetTiles 0x10086 18
		mAnimCmd6 0x0 0xA01F0F1
		.4byte	4, 8

		mGetTiles 0x10098 24
		mAnimCmd6 0x0 0x6F9ECEF
		.4byte	4, 9

		mGetTiles 0x100B0 24
		.4byte	4, 10

		mGetTiles 0x100C8 20
		mAnimCmd6 0x0 0xF9ECED
		.4byte	4, 11

		mAnimCmd4 

	anim_data__0297_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x100DC 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	4, 12

		mGetTiles 0x100EC 16
		.4byte	4, 13

		mAnimCmd4 


.align 2, 0
	anim_0297:
		.4byte anim_data__0297_0
		.4byte anim_data__0297_1
		.4byte anim_data__0297_2
		.4byte anim_data__0297_3
		.4byte anim_data__0297_4




.align 2, 0
	anim_data__0301_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x100FC 25
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	3, 0

		mGetTiles 0x10115 20
		.4byte	8, 1

		mGetTiles 0x10129 20
		.4byte	8, 2

		mGetTiles 0x1013D 20
		.4byte	8, 3

		mGetTiles 0x10151 15
		.4byte	8, 4

		mJumpBack 0x5

	anim_data__0301_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10160 30
		mAnimCmd6 0x0 0x1806FAFA
		.4byte	5, 5

		mGetTiles 0x1017E 24
		.4byte	5, 6

		mGetTiles 0x10196 24
		.4byte	5, 7

		mGetTiles 0x101AE 25
		.4byte	5, 8

		mGetTiles 0x101C7 25
		.4byte	5, 9

		mAnimCmd4 

	anim_data__0301_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x101E0 20
		.4byte	5, 10

		mGetTiles 0x101F4 16
		.4byte	3, 11

		mGetTiles 0x10204 20
		.4byte	3, 12

		mGetTiles 0x10218 20
		.4byte	3, 13

		mAnimCmd4 


.align 2, 0
	anim_0301:
		.4byte anim_data__0301_0
		.4byte anim_data__0301_1
		.4byte anim_data__0301_2




.align 2, 0
	anim_data__0302_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1022C 30
		.4byte	3, 0

		mGetTiles 0x1024A 36
		.4byte	3, 1

		mGetTiles 0x1022C 30
		.4byte	3, 0

		mGetTiles 0x1026E 25
		.4byte	3, 2

		mGetTiles 0x10287 20
		.4byte	3, 3

		mGetTiles 0x1029B 20
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0302:
		.4byte anim_data__0302_0




.align 2, 0
	anim_data__0303_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x102AF 20
		.4byte	37, 0

		mGetTiles 0x102C3 20
		.4byte	6, 1

		mGetTiles 0x102D7 20
		.4byte	5, 2

		mGetTiles 0x102EB 20
		.4byte	3, 3

		mGetTiles 0x102FF 20
		.4byte	5, 4

		mGetTiles 0x102EB 20
		.4byte	3, 3

		mGetTiles 0x102D7 20
		.4byte	5, 2

		mGetTiles 0x102EB 20
		.4byte	3, 3

		mGetTiles 0x102FF 20
		.4byte	5, 4

		mGetTiles 0x102EB 20
		.4byte	3, 3

		mGetTiles 0x102D7 20
		.4byte	8, 2

		mGetTiles 0x10313 20
		.4byte	4, 5

		mGetTiles 0x10327 20
		.4byte	5, 6

		mGetTiles 0x1033B 20
		.4byte	3, 7

		mGetTiles 0x1034F 20
		.4byte	5, 8

		mGetTiles 0x1033B 20
		.4byte	3, 7

		mGetTiles 0x10327 20
		.4byte	10, 6

		mGetTiles 0x10363 20
		.4byte	5, 9

		mGetTiles 0x10377 25
		.4byte	4, 10

		mGetTiles 0x10390 20
		.4byte	2, 11

		mGetTiles 0x103A4 20
		.4byte	2, 12

		mGetTiles 0x103B8 20
		.4byte	2, 13

		mGetTiles 0x103CC 20
		.4byte	2, 14

		mGetTiles 0x103E0 20
		.4byte	2, 15

		mGetTiles 0x103F4 20
		.4byte	2, 16

		mGetTiles 0x10377 25
		.4byte	2, 10

		mGetTiles 0x10390 20
		.4byte	2, 11

		mGetTiles 0x103A4 20
		.4byte	2, 12

		mGetTiles 0x103B8 20
		.4byte	2, 13

		mGetTiles 0x103CC 20
		.4byte	2, 14

		mGetTiles 0x103E0 20
		.4byte	2, 15

		mGetTiles 0x103F4 20
		.4byte	2, 16

		mGetTiles 0x10377 25
		.4byte	12, 10

		mGetTiles 0x10363 20
		.4byte	6, 9

		mGetTiles 0x10408 20
		.4byte	4, 17

		mGetTiles 0x1041C 20
		.4byte	4, 18

		mGetTiles 0x10430 16
		.4byte	2, 19

		mAnimCmd4 

	anim_data__0303_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10430 16
		.4byte	1, 19

		mGetTiles 0x10440 20
		.4byte	6, 20

		mGetTiles 0x10454 20
		.4byte	60, 21

		mGetTiles 0x10468 30
		.4byte	4, 22

		mAnimCmd4 


.align 2, 0
	anim_0303:
		.4byte anim_data__0303_0
		.4byte anim_data__0303_1




.align 2, 0
	anim_data__0304_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10486 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	3, 0

		mGetTiles 0x1049F 25
		.4byte	3, 1

		mAnimCmd4 

	anim_data__0304_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x104B8 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	2, 2

		mGetTiles 0x104D1 25
		.4byte	2, 3

		mGetTiles 0x104EA 25
		.4byte	2, 4

		mGetTiles 0x10503 30
		.4byte	2, 5

		mJumpBack 0x1A

	anim_data__0304_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10521 25
		mAnimCmd6 0x0 0x1006F3FA
		.4byte	2, 6

		mGetTiles 0x1053A 20
		.4byte	2, 7

		mGetTiles 0x1054E 20
		.4byte	4, 8

		mAnimCmd4 


.align 2, 0
	anim_0304:
		.4byte anim_data__0304_0
		.4byte anim_data__0304_1
		.4byte anim_data__0304_2




.align 2, 0
	anim_data__0305_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10562 20
		.4byte	5, 0

		mGetTiles 0x10576 20
		.4byte	5, 1

		mGetTiles 0x1058A 20
		.4byte	30, 2

		mGetTiles 0x1059E 20
		.4byte	3, 3

		mGetTiles 0x105B2 25
		.4byte	3, 4

		mGetTiles 0x105CB 20
		.4byte	4, 5

		mGetTiles 0x105DF 20
		.4byte	2, 6

		mGetTiles 0x105F3 25
		.4byte	2, 7

		mGetTiles 0x1060C 25
		.4byte	3, 8

		mGetTiles 0x10625 25
		.4byte	6, 9

		mGetTiles 0x1063E 25
		.4byte	2, 10

		mGetTiles 0x10657 20
		.4byte	2, 11

		mGetTiles 0x1066B 20
		.4byte	2, 12

		mGetTiles 0x1067F 24
		.4byte	3, 13

		mGetTiles 0x10697 24
		.4byte	8, 14

		mGetTiles 0x106AF 20
		.4byte	2, 15

		mGetTiles 0x106C3 20
		.4byte	2, 16

		mGetTiles 0x106D7 20
		.4byte	30, 17

		mAnimCmd4 


.align 2, 0
	anim_0305:
		.4byte anim_data__0305_0




.align 2, 0
	anim_data__0306_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x106EB 20
		.4byte	4, 0

		mGetTiles 0x106FF 15
		.4byte	3, 1

		mGetTiles 0x1070E 20
		.4byte	3, 2

		mGetTiles 0x10722 20
		.4byte	8, 3

		mGetTiles 0x10736 20
		.4byte	5, 4

		mGetTiles 0x1074A 20
		.4byte	8, 5

		mGetTiles 0x1075E 20
		.4byte	3, 6

		mGetTiles 0x10772 20
		.4byte	3, 7

		mGetTiles 0x10786 20
		.4byte	3, 8

		mGetTiles 0x1079A 20
		.4byte	3, 9

		mGetTiles 0x107AE 20
		.4byte	3, 10

		mGetTiles 0x107C2 20
		.4byte	3, 11

		mGetTiles 0x1075E 20
		.4byte	3, 6

		mGetTiles 0x10772 20
		.4byte	3, 7

		mGetTiles 0x10786 20
		.4byte	3, 8

		mGetTiles 0x1079A 20
		.4byte	3, 9

		mGetTiles 0x107AE 20
		.4byte	3, 10

		mGetTiles 0x107C2 20
		.4byte	4, 11

		mGetTiles 0x1074A 20
		.4byte	8, 5

		mGetTiles 0x107D6 20
		.4byte	6, 12

		mGetTiles 0x107EA 20
		.4byte	12, 13

		mGetTiles 0x107FE 20
		.4byte	3, 14

		mGetTiles 0x10812 20
		.4byte	2, 15

		mGetTiles 0x10826 20
		.4byte	2, 16

		mGetTiles 0x1083A 20
		.4byte	3, 17

		mGetTiles 0x1084E 20
		.4byte	3, 18

		mGetTiles 0x10862 20
		.4byte	12, 19

		mGetTiles 0x10876 20
		.4byte	4, 20

		mGetTiles 0x1088A 20
		.4byte	8, 21

		mGetTiles 0x1089E 20
		.4byte	3, 22

		mGetTiles 0x108B2 20
		.4byte	12, 23

		mAnimCmd4 


.align 2, 0
	anim_0306:
		.4byte anim_data__0306_0




.align 2, 0
	anim_data__0307_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x108C6 20
		.4byte	6, 0

		mGetTiles 0x108DA 25
		.4byte	3, 1

		mGetTiles 0x108F3 24
		.4byte	3, 2

		mGetTiles 0x1090B 28
		.4byte	3, 3

		mGetTiles 0x10927 30
		.4byte	3, 4

		mGetTiles 0x10945 30
		.4byte	3, 5

		mGetTiles 0x10963 36
		.4byte	3, 6

		mGetTiles 0x10987 36
		.4byte	3, 7

		mGetTiles 0x109AB 30
		.4byte	3, 8

		mGetTiles 0x109C9 20
		.4byte	3, 9

		mGetTiles 0x109DD 20
		.4byte	3, 10

		mGetTiles 0x109F1 20
		.4byte	3, 11

		mGetTiles 0x10A05 20
		.4byte	6, 12

		mGetTiles 0x10A19 25
		.4byte	3, 13

		mGetTiles 0x10A32 25
		.4byte	3, 14

		mGetTiles 0x10A4B 25
		.4byte	3, 15

		mGetTiles 0x10A64 20
		.4byte	60, 16

		mAnimCmd4 


.align 2, 0
	anim_0307:
		.4byte anim_data__0307_0




.align 2, 0
	anim_data__0308_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10A78 20
		.4byte	3, 0

		mGetTiles 0x10A8C 20
		.4byte	3, 1

		mGetTiles 0x10AA0 25
		.4byte	3, 2

		mGetTiles 0x10AB9 20
		.4byte	3, 3

		mGetTiles 0x10ACD 20
		.4byte	3, 4

		mGetTiles 0x10AE1 25
		.4byte	3, 5

		mGetTiles 0x10AFA 25
		.4byte	3, 6

		mGetTiles 0x10B13 25
		.4byte	3, 7

		mGetTiles 0x10B2C 24
		.4byte	3, 8

		mGetTiles 0x10B44 24
		.4byte	3, 9

		mGetTiles 0x10B5C 30
		.4byte	3, 10

		mGetTiles 0x10B7A 24
		.4byte	3, 11

		mGetTiles 0x10B92 24
		.4byte	3, 12

		mGetTiles 0x10BAA 24
		.4byte	3, 13

		mGetTiles 0x10BC2 30
		.4byte	3, 14

		mGetTiles 0x10BE0 24
		.4byte	3, 15

		mJumpBack 0x28


.align 2, 0
	anim_0308:
		.4byte anim_data__0308_0




.align 2, 0
	anim_data__0309_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10BF8 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0309_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C0C 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0309_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C20 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0309_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10C34 25
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0309:
		.4byte anim_data__0309_0
		.4byte anim_data__0309_1
		.4byte anim_data__0309_2
		.4byte anim_data__0309_3




.align 2, 0
	anim_data__0315_0:
		mGetPalette 0x18 16 0x20
		mGetTiles 0x10C4D 9
		.4byte	40, 0

		mGetTiles 0x10C56 9
		.4byte	12, 1

		mGetTiles 0x10C4D 9
		.4byte	10, 0

		mGetTiles 0x10C5F 9
		.4byte	12, 2

		mJumpBack 0x17

	anim_data__0315_1:
		mGetPalette 0x18 16 0x20
		mGetTiles 0x10C5F 9
		.4byte	8, 2

		mGetTiles 0x10C4D 9
		.4byte	6, 0

		mGetTiles 0x10C56 9
		.4byte	8, 1

		mGetTiles 0x10C4D 9
		.4byte	6, 0

		mGetTiles 0x10C5F 9
		.4byte	8, 2

		mGetTiles 0x10C4D 9
		.4byte	6, 0

		mGetTiles 0x10C56 9
		.4byte	12, 1

		mJumpBack 0x26

	anim_data__0315_2:
		mGetPalette 0x18 16 0x20
		mGetTiles 0x10C4D 9
		.4byte	4, 0

		mGetTiles 0x10C68 9
		.4byte	8, 3

		mGetTiles 0x10C4D 9
		.4byte	4, 0

		mGetTiles 0x10C68 9
		.4byte	8, 3

		mGetTiles 0x10C4D 9
		.4byte	4, 0

		mGetTiles 0x10C68 9
		.4byte	8, 3

		mAnimCmd4 

	anim_data__0315_3:
		mGetPalette 0x18 16 0x20
		mGetTiles 0x10C4D 9
		.4byte	6, 0

		mGetTiles 0x10C71 15
		.4byte	6, 4

		mGetTiles 0x10C80 15
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0315:
		.4byte anim_data__0315_0
		.4byte anim_data__0315_1
		.4byte anim_data__0315_2
		.4byte anim_data__0315_3




.align 2, 0
	anim_data__0316_0:
		mGetPalette 0x19 16 0x90
		mGetTiles 0x10C8F 35
		.4byte	3, 0

		mGetTiles 0x10CB2 28
		.4byte	3, 1

		mGetTiles 0x10CCE 25
		.4byte	3, 2

		mGetTiles 0x10CE7 25
		.4byte	3, 3

		mGetTiles 0x10D00 25
		.4byte	3, 4

		mGetTiles 0x10D19 20
		.4byte	3, 5

		mGetTiles 0x10D2D 25
		.4byte	3, 6

		mGetTiles 0x10D46 25
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0316:
		.4byte anim_data__0316_0




.align 2, 0
	anim_data__0321_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10D5F 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 0

		mGetTiles 0x10D73 20
		.4byte	2, 1

		mGetTiles 0x10D5F 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0321_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10D87 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	4, 2

		mGetTiles 0x10DA5 30
		.4byte	4, 3

		mGetTiles 0x10DC3 32
		mAnimCmd6 0x0 0xE06F0FA
		mAnimCmd6 0x1 0xFE0EE4F2
		.4byte	8, 4

		mGetTiles 0x10DE3 28
		.4byte	8, 5

		mGetTiles 0x10DFF 25
		.4byte	8, 6

		mAnimCmd4 

	anim_data__0321_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10E18 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	7, 7

		mGetTiles 0x10E36 30
		.4byte	6, 8

		mGetTiles 0x10E54 30
		.4byte	3, 9

		mGetTiles 0x10E72 30
		.4byte	3, 10

		mGetTiles 0x10E90 30
		.4byte	3, 11

		mJumpBack 0xF

	anim_data__0321_3:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x10EAE 6
		.4byte	2, 12

		mGetTiles 0x10EB4 12
		.4byte	2, 13

		mGetTiles 0x10EC0 20
		.4byte	2, 14

		mGetTiles 0x10ED4 20
		.4byte	2, 15

		mGetTiles 0x10EE8 24
		.4byte	3, 16

		mGetTiles 0x10F00 24
		.4byte	3, 17

		mGetTiles 0x10F18 24
		.4byte	3, 18

		mGetTiles 0x10F30 9
		.4byte	3, 19

		mAnimCmd4 


.align 2, 0
	anim_0321:
		.4byte anim_data__0321_0
		.4byte anim_data__0321_1
		.4byte anim_data__0321_2
		.4byte anim_data__0321_3




.align 2, 0
	anim_data__0322_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10F39 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x10F57 36
		.4byte	2, 1

		mGetTiles 0x10F7B 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 2

		mGetTiles 0x10F93 30
		.4byte	2, 3

		mGetTiles 0x10FB1 30
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0322_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x10FCF 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 5

		mGetTiles 0x10FE3 25
		.4byte	2, 6

		mGetTiles 0x10FFC 24
		.4byte	2, 7

		mGetTiles 0x11014 24
		mAnimCmd6 0x0 0x60EF7F2
		mAnimCmd6 0x1 0xEFCF0ED
		.4byte	2, 8

		mGetTiles 0x1102C 24
		.4byte	2, 9

		mJumpBack 0x10

	anim_data__0322_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11044 30
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 10

		mGetTiles 0x11062 36
		.4byte	2, 11

		mGetTiles 0x11086 20
		.4byte	2, 12

		mGetTiles 0x1109A 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 13

		mGetTiles 0x110AA 16
		.4byte	2, 14

		mGetTiles 0x110BA 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		mPlaySoundEffect 109
		.4byte	2, 15

		mGetTiles 0x110CA 16
		.4byte	2, 16

		mGetTiles 0x110DA 16
		.4byte	2, 17

		mGetTiles 0x110EA 16
		.4byte	2, 18

		mAnimCmd4 


.align 2, 0
	anim_0322:
		.4byte anim_data__0322_0
		.4byte anim_data__0322_1
		.4byte anim_data__0322_2




.align 2, 0
	anim_data__0323_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x110FA 24
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x11112 30
		.4byte	2, 1

		mGetTiles 0x11130 30
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0323_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1114E 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 3

		mGetTiles 0x11162 20
		.4byte	2, 4

		mGetTiles 0x11176 30
		mAnimCmd6 0x0 0xE06F0FA
		mAnimCmd6 0x1 0xE12F000
		.4byte	3, 5

		mGetTiles 0x11194 30
		.4byte	3, 6

		mJumpBack 0x10


.align 2, 0
	anim_0323:
		.4byte anim_data__0323_0
		.4byte anim_data__0323_1




.align 2, 0
	anim_data__0324_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x111B2 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x111D0 30
		.4byte	3, 1

		mGetTiles 0x111EE 30
		.4byte	2, 2

		mGetTiles 0x1120C 35
		.4byte	2, 3

		mAnimCmd4 

	anim_data__0324_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1122F 28
		mAnimCmd6 0x0 0x1206F4FA
		mAnimCmd6 0x1 0x1E0E00F2
		.4byte	2, 4

		mGetTiles 0x1124B 28
		.4byte	2, 5

		mGetTiles 0x11267 28
		.4byte	2, 6

		mGetTiles 0x11283 28
		.4byte	2, 7

		mGetTiles 0x1122F 28
		.4byte	2, 4

		mGetTiles 0x1124B 28
		.4byte	2, 5

		mGetTiles 0x11267 28
		.4byte	2, 6

		mGetTiles 0x11283 28
		.4byte	2, 7

		mJumpBack 0x31

	anim_data__0324_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1129F 25
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	1, 8

		mGetTiles 0x112B8 20
		.4byte	1, 9

		mGetTiles 0x112CC 16
		.4byte	1, 10

		mGetTiles 0x112DC 16
		.4byte	1, 11

		mGetTiles 0x112EC 16
		.4byte	4, 12

		mGetTiles 0x112DC 16
		.4byte	2, 11

		mGetTiles 0x112CC 16
		.4byte	2, 10

		mAnimCmd4 

	anim_data__0324_3:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x112FC 6
		.4byte	2, 13

		mGetTiles 0x11302 16
		.4byte	2, 14

		mGetTiles 0x11312 25
		.4byte	2, 15

		mGetTiles 0x1132B 25
		.4byte	2, 16

		mGetTiles 0x11344 24
		.4byte	2, 17

		mGetTiles 0x1135C 18
		.4byte	2, 18

		mGetTiles 0x1136E 15
		.4byte	2, 19

		mGetTiles 0x1137D 4
		.4byte	2, 20

		mJumpBack 0x2B


.align 2, 0
	anim_0324:
		.4byte anim_data__0324_0
		.4byte anim_data__0324_1
		.4byte anim_data__0324_2
		.4byte anim_data__0324_3




.align 2, 0
	anim_data__0325_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11381 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x11395 20
		.4byte	3, 1

		mGetTiles 0x113A9 20
		.4byte	3, 2

		mGetTiles 0x113BD 20
		.4byte	3, 3

		mJumpBack 0xF

	anim_data__0325_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x113D1 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 4

		mGetTiles 0x113E5 20
		.4byte	3, 5

		mGetTiles 0x113F9 20
		.4byte	3, 6

		mGetTiles 0x1140D 25
		.4byte	3, 7

		mGetTiles 0x11426 30
		.4byte	3, 8

		mGetTiles 0x11444 30
		.4byte	3, 9

		mAnimCmd4 

	anim_data__0325_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11462 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 10

		mGetTiles 0x11480 30
		.4byte	3, 11

		mGetTiles 0x1149E 30
		.4byte	3, 12

		mJumpBack 0x15


.align 2, 0
	anim_0325:
		.4byte anim_data__0325_0
		.4byte anim_data__0325_1
		.4byte anim_data__0325_2




.align 2, 0
	anim_data__0326_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x114BC 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	4, 0

		mGetTiles 0x114D0 20
		.4byte	4, 1

		mGetTiles 0x114E4 20
		.4byte	4, 2

		mGetTiles 0x114F8 25
		.4byte	4, 3

		mGetTiles 0x11511 25
		.4byte	4, 4

		mGetTiles 0x1152A 25
		.4byte	4, 5

		mGetTiles 0x11543 20
		.4byte	4, 6

		mGetTiles 0x11557 20
		.4byte	4, 7

		mGetTiles 0x1156B 25
		.4byte	4, 8

		mGetTiles 0x11584 20
		.4byte	4, 9

		mGetTiles 0x11598 25
		.4byte	4, 10

		mGetTiles 0x115B1 30
		.4byte	3, 11

		mGetTiles 0x115CF 30
		.4byte	3, 12

		mGetTiles 0x115ED 30
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0326:
		.4byte anim_data__0326_0




.align 2, 0
	anim_data__0327_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1160B 20
		mAnimCmd6 0x0 0x1208F2F8
		.4byte	1, 0

		mGetTiles 0x1161F 25
		mAnimCmd6 0x0 0xE08F1F8
		.4byte	2, 1

		mGetTiles 0x11638 20
		.4byte	2, 2

		mGetTiles 0x1164C 25
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0327_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11665 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 4

		mGetTiles 0x1167E 25
		.4byte	2, 5

		mGetTiles 0x11697 25
		.4byte	2, 6

		mGetTiles 0x116B0 30
		.4byte	2, 7

		mGetTiles 0x116CE 30
		.4byte	2, 8

		mGetTiles 0x116EC 30
		.4byte	2, 9

		mGetTiles 0x1170A 30
		.4byte	2, 10

		mGetTiles 0x11728 30
		.4byte	2, 11

		mJumpBack 0xF


.align 2, 0
	anim_0327:
		.4byte anim_data__0327_0
		.4byte anim_data__0327_1




.align 2, 0
	anim_data__0328_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11746 64
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	2, 0

		mGetTiles 0x11786 64
		.4byte	2, 1

		mJumpBack 0x10


.align 2, 0
	anim_0328:
		.4byte anim_data__0328_0




.align 2, 0
	anim_data__0330_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x117C6 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0330_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x117DF 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0330_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x117EF 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0330_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x117FF 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0330_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11818 24
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0330_5:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11830 20
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0330_6:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11844 16
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0330_7:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11854 25
		mAnimCmd6 0x0 0xE06F2FA
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1186D 64
		mAnimCmd6 0x0 0xA06F4FA
		.4byte	5, 0

		mGetTiles 0x118AD 64
		.4byte	5, 1

		mGetTiles 0x118ED 64
		.4byte	5, 2

		mGetTiles 0x1192D 64
		.4byte	5, 3

		mGetTiles 0x1196D 64
		.4byte	5, 4

		mGetTiles 0x119AD 64
		.4byte	5, 5

		mGetTiles 0x119ED 64
		.4byte	5, 6

		mGetTiles 0x11A2D 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0331:
		.4byte anim_data__0331_0




.align 2, 0
	anim_data__0332_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11A6D 35
		mAnimCmd6 0x0 0x2A060CFA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0332_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11A90 30
		mAnimCmd6 0x0 0x1EFE0AE4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0332_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11AAE 30
		mAnimCmd6 0x0 0x10F802D8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0332_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11ACC 30
		mAnimCmd6 0x0 0xAF2F5DD
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0332_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11AEA 30
		mAnimCmd6 0x0 0xFEF8EAE6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0332_5:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B08 24
		mAnimCmd6 0x0 0xF8FEDCEC
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0332_6:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B20 28
		mAnimCmd6 0x0 0xF806DAFA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0332_7:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B3C 28
		mAnimCmd6 0x0 0xF610DE00
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0332_8:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B58 20
		mAnimCmd6 0x0 0xFE1EEC08
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0332_9:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B6C 24
		mAnimCmd6 0x0 0x826F80A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0332_10:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B84 24
		mAnimCmd6 0x0 0x12240208
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0332_11:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11B9C 30
		mAnimCmd6 0x0 0x221C0804
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11BBA 28
		mAnimCmd6 0x0 0xF806DAFA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0333_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11BD6 24
		mAnimCmd6 0x0 0xF8FEDCEC
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0333_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11BEE 30
		mAnimCmd6 0x0 0xFEF8EAE6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0333_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11C0C 30
		mAnimCmd6 0x0 0xAF2F5DD
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0333_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11C2A 30
		mAnimCmd6 0x0 0x10F802D8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0333_5:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11C48 30
		mAnimCmd6 0x0 0x1EFE0AE4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0333_6:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11C66 35
		mAnimCmd6 0x0 0x2A060CFA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0333_7:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11C89 30
		mAnimCmd6 0x0 0x221C0804
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0333_8:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11CA7 24
		mAnimCmd6 0x0 0x12240208
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0333_9:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11CBF 24
		mAnimCmd6 0x0 0x826F80A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0333_10:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11CD7 20
		mAnimCmd6 0x0 0xFE1EEC08
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0333_11:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11CEB 28
		mAnimCmd6 0x0 0xF610DE00
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11D07 30
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	8, 0

		mGetTiles 0x11D25 30
		.4byte	8, 1

		mGetTiles 0x11D43 30
		.4byte	8, 2

		mGetTiles 0x11D25 30
		.4byte	8, 1

		mJumpBack 0x1A


.align 2, 0
	anim_0334:
		.4byte anim_data__0334_0




.align 2, 0
	anim_data__0335_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11D61 28
		mAnimCmd6 0x0 0x1E0600FA
		.4byte	2, 0

		mGetTiles 0x11D7D 24
		mAnimCmd6 0x0 0x180600FA
		.4byte	2, 1

		mGetTiles 0x11D95 16
		mAnimCmd6 0x0 0x100600FA
		.4byte	2, 2

		mGetTiles 0x11DA5 20
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 3

		mGetTiles 0x11DB9 24
		mAnimCmd6 0x0 0xFE06E0FA
		.4byte	4, 4

		mGetTiles 0x11DD1 20
		mAnimCmd6 0x0 0xFE06E6FA
		.4byte	3, 5

		mGetTiles 0x11DE5 16
		mAnimCmd6 0x0 0x206F0FA
		.4byte	2, 6

		mGetTiles 0x11DF5 18
		mAnimCmd6 0x0 0x1A06FCFA
		.4byte	2, 7

		mGetTiles 0x11D61 28
		mAnimCmd6 0x0 0x1E0400F8
		.4byte	4, 0

		mGetTiles 0x11D7D 24
		mAnimCmd6 0x0 0x180600FA
		.4byte	3, 1

		mGetTiles 0x11D95 16
		mAnimCmd6 0x0 0x100600FA
		.4byte	2, 2

		mGetTiles 0x11DA5 20
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 3

		mGetTiles 0x11DB9 24
		mAnimCmd6 0x0 0xFE06E0FA
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0335_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11E07 28
		mAnimCmd6 0x0 0xFC06DEFA
		.4byte	2, 8

		mGetTiles 0x11E23 24
		mAnimCmd6 0x0 0xFE06E4FA
		.4byte	2, 9

		mGetTiles 0x11E3B 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 10

		mGetTiles 0x11E4B 20
		mAnimCmd6 0x0 0x160600FA
		.4byte	2, 11

		mGetTiles 0x11E5F 24
		mAnimCmd6 0x0 0x160600FA
		.4byte	4, 12

		mGetTiles 0x11E77 20
		mAnimCmd6 0x0 0x200602FA
		.4byte	3, 13

		mGetTiles 0x11E8B 16
		mAnimCmd6 0x0 0x180602FA
		.4byte	2, 14

		mGetTiles 0x11E9B 18
		mAnimCmd6 0x0 0x406ECFA
		.4byte	2, 15

		mGetTiles 0x11E07 28
		mAnimCmd6 0x0 0xFC06DEFA
		.4byte	4, 8

		mGetTiles 0x11E23 24
		mAnimCmd6 0x0 0xFE06E4FA
		.4byte	3, 9

		mGetTiles 0x11E3B 16
		mAnimCmd6 0x0 0x206F4FA
		.4byte	2, 10

		mGetTiles 0x11E4B 20
		mAnimCmd6 0x0 0x160600FA
		.4byte	2, 11

		mGetTiles 0x11E5F 24
		mAnimCmd6 0x0 0x200602FA
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0335:
		.4byte anim_data__0335_0
		.4byte anim_data__0335_1




.align 2, 0
	anim_data__0336_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11EAD 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mGetTiles 0x11EBD 20
		mAnimCmd6 0x0 0xEEEF6
		.4byte	2, 1

		mGetTiles 0x11ED1 28
		mAnimCmd6 0x0 0xFE0EE5F6
		.4byte	4, 2

		mGetTiles 0x11EED 20
		mAnimCmd6 0x0 0xEEDF6
		.4byte	3, 3

		mGetTiles 0x11F01 20
		mAnimCmd6 0x0 0x60EF6F6
		.4byte	2, 4

		mGetTiles 0x11F15 20
		mAnimCmd6 0x0 0x180E00F6
		.4byte	2, 5

		mGetTiles 0x11F29 35
		mAnimCmd6 0x0 0x200E02F6
		.4byte	4, 6

		mGetTiles 0x11F4C 25
		mAnimCmd6 0x0 0x140E00F6
		.4byte	3, 7

		mGetTiles 0x11EAD 16
		mAnimCmd6 0x0 0xA0EFCF6
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0336_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x11F65 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mGetTiles 0x11F75 20
		mAnimCmd6 0x0 0x160E00F6
		.4byte	2, 9

		mGetTiles 0x11F89 28
		mAnimCmd6 0x0 0x220E02F6
		.4byte	4, 10

		mGetTiles 0x11FA5 20
		mAnimCmd6 0x0 0x160E00F6
		.4byte	3, 11

		mGetTiles 0x11FB9 20
		mAnimCmd6 0x0 0xA0EFAF6
		.4byte	2, 12

		mGetTiles 0x11FCD 20
		mAnimCmd6 0x0 0x20EEAF6
		.4byte	2, 13

		mGetTiles 0x11FE1 35
		mAnimCmd6 0x0 0x20EE4F6
		.4byte	4, 14

		mGetTiles 0x12004 25
		mAnimCmd6 0x0 0x20EEEF6
		.4byte	3, 15

		mGetTiles 0x11F65 16
		mAnimCmd6 0x0 0x80EF6F6
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0336:
		.4byte anim_data__0336_0
		.4byte anim_data__0336_1




.align 2, 0
	anim_data__0337_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1201D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x12031 24
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x12049 28
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x12065 20
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x12079 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mGetTiles 0x1208D 24
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	2, 5

		mGetTiles 0x120A5 40
		mAnimCmd6 0x0 0xFF1FE113
		.4byte	4, 6

		mGetTiles 0x120CD 25
		mAnimCmd6 0x0 0xFF17E10B
		.4byte	3, 7

		mGetTiles 0x1201D 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 0

		mGetTiles 0x12031 24
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	2, 1

		mGetTiles 0x12049 28
		mAnimCmd6 0x0 0xFFEFE1E3
		.4byte	4, 2

		mGetTiles 0x12065 20
		mAnimCmd6 0x0 0xFFF7E1EB
		.4byte	3, 3

		mGetTiles 0x12079 20
		mAnimCmd6 0x0 0xFF07E1FB
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0337:
		.4byte anim_data__0337_0




.align 2, 0
	anim_data__0338_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x120E6 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 0

		mGetTiles 0x12104 30
		.4byte	2, 1

		mGetTiles 0x12122 36
		.4byte	2, 2

		mGetTiles 0x12146 30
		.4byte	2, 3

		mGetTiles 0x12164 36
		.4byte	2, 4

		mGetTiles 0x12188 36
		.4byte	2, 5

		mGetTiles 0x121AC 30
		.4byte	2, 6

		mGetTiles 0x121CA 30
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0338_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x121E8 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 8

		mGetTiles 0x12206 25
		.4byte	3, 9

		mGetTiles 0x1221F 30
		.4byte	3, 10

		mGetTiles 0x1223D 30
		.4byte	3, 11

		mAnimCmd4 

	anim_data__0338_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1225B 30
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 12

		mGetTiles 0x12279 30
		.4byte	3, 13

		mGetTiles 0x12297 30
		.4byte	3, 14

		mJumpBack 0x15


.align 2, 0
	anim_0338:
		.4byte anim_data__0338_0
		.4byte anim_data__0338_1
		.4byte anim_data__0338_2




.align 2, 0
	anim_data__0339_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x122B5 42
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 0

		mGetTiles 0x122DF 42
		.4byte	3, 1

		mGetTiles 0x12309 42
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0339_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12333 36
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 3

		mGetTiles 0x12357 24
		.4byte	3, 4

		mGetTiles 0x1236F 24
		.4byte	3, 5

		mGetTiles 0x12387 30
		.4byte	3, 6

		mGetTiles 0x123A5 25
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0339_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x123BE 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	3, 8

		mGetTiles 0x123D7 25
		.4byte	3, 9

		mGetTiles 0x123F0 25
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0339:
		.4byte anim_data__0339_0
		.4byte anim_data__0339_1
		.4byte anim_data__0339_2




.align 2, 0
	anim_data__0340_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12409 36
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	5, 0

		mGetTiles 0x1242D 30
		.4byte	5, 1

		mGetTiles 0x1244B 20
		.4byte	5, 2

		mGetTiles 0x1245F 30
		.4byte	5, 3

		mGetTiles 0x1247D 36
		.4byte	5, 4

		mGetTiles 0x124A1 20
		.4byte	5, 5

		mGetTiles 0x124B5 25
		.4byte	5, 6

		mGetTiles 0x124CE 20
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0340:
		.4byte anim_data__0340_0




.align 2, 0
	anim_data__0341_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x124E2 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0341_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x124F6 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0341_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1250A 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0341_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1251E 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0341_4:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12537 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0341_5:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12550 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0341_6:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12569 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0341_7:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1257D 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0341_8:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12591 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0341_9:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x125AA 20
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0341_10:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x125BE 25
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0x16 16 0x0
		mGetTiles 0x125D7 24
		mAnimCmd6 0x0 0xA0AF8F8
		.4byte	2, 0

		mGetTiles 0x125EF 24
		.4byte	2, 1

		mGetTiles 0x12607 20
		.4byte	2, 2

		mGetTiles 0x1261B 24
		.4byte	2, 3

		mGetTiles 0x12633 24
		.4byte	2, 4

		mGetTiles 0x1264B 20
		.4byte	2, 5

		mGetTiles 0x1265F 25
		.4byte	2, 6

		mGetTiles 0x12678 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0342_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1268C 24
		mAnimCmd6 0x0 0xA0AF8F8
		.4byte	2, 8

		mGetTiles 0x126A4 24
		.4byte	2, 9

		mGetTiles 0x126BC 20
		.4byte	2, 10

		mGetTiles 0x126D0 24
		.4byte	2, 11

		mGetTiles 0x126E8 24
		.4byte	2, 12

		mGetTiles 0x12700 20
		.4byte	2, 13

		mGetTiles 0x12714 25
		.4byte	2, 14

		mGetTiles 0x1272D 20
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0342:
		.4byte anim_data__0342_0
		.4byte anim_data__0342_1




.align 2, 0
	anim_data__0343_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12741 16
		mAnimCmd6 0x0 0x808F8F8
		mAnimCmd6 0x1 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x12751 16
		.4byte	2, 1

		mGetTiles 0x12761 16
		.4byte	2, 2

		mGetTiles 0x12771 16
		.4byte	2, 3

		mGetTiles 0x12781 16
		.4byte	2, 4

		mGetTiles 0x12791 16
		.4byte	2, 5

		mGetTiles 0x127A1 16
		.4byte	2, 6

		mGetTiles 0x127B1 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0343:
		.4byte anim_data__0343_0




.align 2, 0
	anim_data__0344_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x127C1 25
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	2, 0

		mGetTiles 0x127DA 25
		.4byte	2, 1

		mGetTiles 0x127F3 25
		.4byte	2, 2

		mGetTiles 0x1280C 30
		.4byte	2, 3

		mGetTiles 0x1282A 30
		.4byte	2, 4

		mGetTiles 0x12848 36
		.4byte	2, 5

		mJumpBack 0x24

	anim_data__0344_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1286C 35
		mAnimCmd6 0x0 0xE06F0FA
		.4byte	2, 6

		mGetTiles 0x1288F 24
		.4byte	2, 7

		mGetTiles 0x128A7 24
		.4byte	2, 8

		mGetTiles 0x128BF 30
		.4byte	2, 9

		mGetTiles 0x128A7 24
		.4byte	2, 8

		mGetTiles 0x1288F 24
		.4byte	2, 7

		mJumpBack 0x24


.align 2, 0
	anim_0344:
		.4byte anim_data__0344_0
		.4byte anim_data__0344_1




.align 2, 0
	anim_data__0345_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x128DD 24
		mAnimCmd6 0x0 0x1206F4FA
		.4byte	3, 0

		mGetTiles 0x128F5 30
		mAnimCmd6 0x0 0x12F5F4EE
		.4byte	3, 1

		mGetTiles 0x12913 36
		mAnimCmd6 0x0 0x12FAF4E8
		.4byte	3, 2

		mGetTiles 0x12937 30
		mAnimCmd6 0x0 0x12FCF4EA
		.4byte	3, 3

		mGetTiles 0x12955 24
		mAnimCmd6 0x0 0x1206F4F7
		.4byte	3, 4

		mGetTiles 0x1296D 24
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 5

		mGetTiles 0x12985 36
		mAnimCmd6 0x0 0x1218F406
		.4byte	3, 6

		mGetTiles 0x129A9 30
		mAnimCmd6 0x0 0x1212F402
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0345:
		.4byte anim_data__0345_0




.align 2, 0
	anim_data__0346_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x129C7 16
		mAnimCmd6 0x0 0x1006F2FA
		.4byte	3, 0

		mGetTiles 0x129D7 16
		.4byte	3, 1

		mGetTiles 0x129E7 20
		.4byte	3, 2

		mGetTiles 0x129FB 16
		.4byte	3, 3

		mGetTiles 0x12A0B 16
		.4byte	3, 4

		mGetTiles 0x12A1B 16
		.4byte	3, 5

		mGetTiles 0x12A2B 16
		.4byte	3, 6

		mGetTiles 0x12A3B 16
		.4byte	3, 7

		mJumpBack 0x2E

	anim_data__0346_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12A4B 30
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 8

		mGetTiles 0x12A69 25
		.4byte	3, 9

		mGetTiles 0x12A82 20
		.4byte	3, 10

		mGetTiles 0x12A96 25
		.4byte	3, 11

		mGetTiles 0x12AAF 30
		.4byte	3, 12

		mGetTiles 0x12ACD 25
		.4byte	3, 13

		mGetTiles 0x12AE6 30
		.4byte	3, 14

		mGetTiles 0x12B04 25
		.4byte	3, 15

		mJumpBack 0x2E

	anim_data__0346_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12B1D 30
		mAnimCmd6 0x0 0x1006F0FA
		.4byte	3, 16

		mGetTiles 0x12B3B 25
		.4byte	3, 17

		mGetTiles 0x12B54 30
		.4byte	3, 18

		mGetTiles 0x12B72 25
		.4byte	3, 19

		mGetTiles 0x12B8B 30
		.4byte	3, 20

		mGetTiles 0x12BA9 30
		.4byte	3, 21

		mGetTiles 0x12BC7 25
		.4byte	3, 22

		mGetTiles 0x12BE0 30
		.4byte	3, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0346:
		.4byte anim_data__0346_0
		.4byte anim_data__0346_1
		.4byte anim_data__0346_2




.align 2, 0
	anim_data__0347_0:
		mGetPalette 0x1A 16 0x10
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0347:
		.4byte anim_data__0347_0




.align 2, 0
	anim_data__0348_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12BFE 64
		mAnimCmd6 0x0 0x1007F7F9
		.4byte	2, 0

		mGetTiles 0x12C3E 64
		.4byte	2, 1

		mGetTiles 0x12C7E 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0348:
		.4byte anim_data__0348_0




.align 2, 0
	anim_data__0358_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12CBE 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0358_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12CD2 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0358:
		.4byte anim_data__0358_0
		.4byte anim_data__0358_1




.align 2, 0
	anim_data__0359_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12CE6 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 0

		mGetTiles 0x12CFA 20
		.4byte	3, 1

		mGetTiles 0x12D0E 20
		.4byte	3, 2

		mGetTiles 0x12D22 20
		.4byte	3, 3

		mGetTiles 0x12D36 20
		.4byte	3, 4

		mGetPalette 0x16 16 0x0
		mGetTiles 0x12D4A 20
		.4byte	3, 5

		mJumpBack 0x27

	anim_data__0359_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12D5E 20
		mAnimCmd6 0x0 0x8E0F8
		.4byte	3, 6

		mGetTiles 0x12D72 20
		.4byte	3, 7

		mGetTiles 0x12D86 20
		.4byte	3, 8

		mGetTiles 0x12D9A 20
		.4byte	3, 9

		mGetTiles 0x12DAE 20
		.4byte	3, 10

		mGetTiles 0x12DC2 20
		.4byte	3, 11

		mJumpBack 0x24

	anim_data__0359_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12DD6 30
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 12

		mGetTiles 0x12DF4 30
		.4byte	3, 13

		mGetTiles 0x12E12 30
		.4byte	3, 14

		mGetTiles 0x12E30 30
		.4byte	3, 15

		mGetTiles 0x12E4E 30
		.4byte	3, 16

		mGetTiles 0x12E6C 30
		.4byte	3, 17

		mJumpBack 0x24

	anim_data__0359_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12E8A 25
		.4byte	3, 18

		mGetTiles 0x12EA3 25
		.4byte	3, 19

		mGetTiles 0x12EBC 25
		.4byte	3, 20

		mGetTiles 0x12ED5 25
		.4byte	3, 21

		mGetTiles 0x12EEE 25
		.4byte	3, 22

		mGetTiles 0x12F07 25
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0359:
		.4byte anim_data__0359_0
		.4byte anim_data__0359_1
		.4byte anim_data__0359_2
		.4byte anim_data__0359_3




.align 2, 0
	anim_data__0360_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12F20 36
		mAnimCmd6 0x0 0x6E2FA
		.4byte	2, 0

		mGetTiles 0x12F44 36
		.4byte	2, 1

		mJumpBack 0x10

	anim_data__0360_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12F68 20
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0360_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12F7C 30
		mAnimCmd6 0x0 0x6E2FA
		.4byte	2, 3

		mGetTiles 0x12F9A 30
		.4byte	2, 4

		mJumpBack 0x10

	anim_data__0360_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12FB8 25
		mAnimCmd6 0x0 0x6E2FA
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0360:
		.4byte anim_data__0360_0
		.4byte anim_data__0360_1
		.4byte anim_data__0360_2
		.4byte anim_data__0360_3




.align 2, 0
	anim_data__0361_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x12FD1 16
		.4byte	6, 0

		mGetTiles 0x12FE1 20
		.4byte	6, 1

		mGetTiles 0x12FF5 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0361_1:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x13009 25
		.4byte	6, 3

		mGetTiles 0x13022 25
		.4byte	6, 4

		mGetTiles 0x1303B 30
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0361:
		.4byte anim_data__0361_0
		.4byte anim_data__0361_1




.align 2, 0
	anim_data__0362_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x13059 16
		mAnimCmd6 0x0 0x808F8F8
		.4byte	2, 0

		mGetTiles 0x13069 16
		.4byte	2, 1

		mGetTiles 0x13079 16
		.4byte	2, 2

		mGetTiles 0x13089 16
		.4byte	2, 3

		mGetTiles 0x13099 16
		.4byte	2, 4

		mGetTiles 0x130A9 16
		.4byte	2, 5

		mJumpBack 0x24


.align 2, 0
	anim_0362:
		.4byte anim_data__0362_0




.align 2, 0
	anim_data__0363_0:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x130B9 20
		mAnimCmd6 0x0 0x106E3FA
		.4byte	2, 0

		mGetTiles 0x130CD 20
		.4byte	2, 1

		mGetTiles 0x130E1 20
		.4byte	2, 2

		mGetTiles 0x130F5 20
		.4byte	2, 3

		mGetTiles 0x13109 20
		.4byte	3, 4

		mGetTiles 0x1311D 20
		.4byte	3, 5

		mGetTiles 0x13131 20
		.4byte	3, 6

		mGetTiles 0x13145 20
		.4byte	3, 7

		mGetTiles 0x13159 20
		.4byte	3, 8

		mGetTiles 0x1316D 20
		.4byte	3, 9

		mGetTiles 0x13181 20
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0363:
		.4byte anim_data__0363_0




.align 2, 0
	anim_data__0364_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13195 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	6, 0

		mGetTiles 0x131A9 20
		.4byte	6, 1

		mGetTiles 0x131BD 20
		.4byte	6, 2

		mGetTiles 0x131D1 20
		.4byte	6, 3

		mGetTiles 0x131E5 20
		.4byte	6, 4

		mGetTiles 0x131F9 20
		.4byte	6, 5

		mGetTiles 0x1320D 20
		.4byte	6, 6

		mGetTiles 0x13221 20
		.4byte	6, 7

		mGetTiles 0x13195 20
		.4byte	6, 0

		mGetTiles 0x13235 20
		.4byte	6, 8

		mGetTiles 0x13249 20
		.4byte	6, 9

		mGetTiles 0x1325D 20
		.4byte	6, 10

		mGetTiles 0x131E5 20
		.4byte	6, 4

		mGetTiles 0x131F9 20
		.4byte	6, 5

		mGetTiles 0x1320D 20
		.4byte	6, 6

		mGetTiles 0x13221 20
		.4byte	6, 7

		mJumpBack 0x56


.align 2, 0
	anim_0364:
		.4byte anim_data__0364_0




.align 2, 0
	anim_data__0365_0:
		mGetPalette 0x1C 16 0x0
		mGetTiles 0x13271 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	3, 0

		mGetTiles 0x13281 16
		.4byte	5, 1

		mGetTiles 0x13291 16
		.4byte	5, 2

		mGetTiles 0x132A1 16
		.4byte	5, 3

		mGetTiles 0x132B1 20
		.4byte	5, 4

		mGetTiles 0x132C5 20
		.4byte	5, 5

		mGetTiles 0x132D9 15
		.4byte	5, 6

		mGetTiles 0x132E8 15
		.4byte	5, 7

		mGetTiles 0x132F7 25
		.4byte	5, 8

		mGetTiles 0x13310 25
		.4byte	5, 9

		mGetTiles 0x13329 25
		.4byte	5, 10

		mGetTiles 0x13342 25
		.4byte	5, 11

		mGetTiles 0x1335B 25
		.4byte	5, 12

		mGetTiles 0x13374 25
		.4byte	8, 13

		mGetTiles 0x1338D 30
		.4byte	5, 14

		mGetTiles 0x133AB 30
		.4byte	4, 15

		mGetTiles 0x133C9 25
		.4byte	12, 16

		mGetTiles 0x133E2 15
		.4byte	4, 17

		mGetTiles 0x133F1 20
		.4byte	12, 18

		mGetTiles 0x13405 15
		.4byte	5, 19

		mGetTiles 0x13414 15
		.4byte	5, 20

		mGetTiles 0x13423 15
		.4byte	5, 21

		mGetTiles 0x13432 15
		.4byte	10, 22

		mGetTiles 0x13441 15
		.4byte	4, 23

		mGetTiles 0x13450 20
		.4byte	4, 24

		mGetTiles 0x13464 15
		.4byte	4, 25

		mGetTiles 0x13473 16
		.4byte	6, 26

		mGetTiles 0x13483 20
		.4byte	4, 27

		mGetTiles 0x13497 20
		.4byte	4, 28

		mGetTiles 0x134AB 20
		.4byte	4, 29

		mGetTiles 0x134BF 15
		.4byte	4, 30

		mGetTiles 0x134CE 12
		.4byte	4, 31

		mGetTiles 0x134DA 15
		.4byte	4, 32

		mJumpBack 0x1E

	anim_data__0365_1:
		mGetPalette 0x1C 16 0x0
		mGetTiles 0x134E9 12
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	4, 33

		mGetTiles 0x134F5 15
		.4byte	4, 34

		mGetTiles 0x13504 20
		.4byte	12, 35

		mGetTiles 0x13518 20
		.4byte	4, 36

		mAnimCmd4 


.align 2, 0
	anim_0365:
		.4byte anim_data__0365_0
		.4byte anim_data__0365_1




.align 2, 0
	anim_data__0366_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1352C 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 0

		mGetTiles 0x1353C 16
		.4byte	1, 1

		mGetTiles 0x1354C 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0366_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1355C 16
		mAnimCmd6 0x0 0x1006FAFA
		.4byte	1, 3

		mGetTiles 0x1356C 16
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0366:
		.4byte anim_data__0366_0
		.4byte anim_data__0366_1




.align 2, 0
	anim_data__0367_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1357C 16
		mAnimCmd6 0x0 0xA06EEFA
		mAnimCmd6 0x1 0xA06EEFA
		.4byte	3, 0

		mGetTiles 0x1358C 16
		.4byte	3, 1

		mGetTiles 0x1359C 16
		.4byte	3, 2

		mJumpBack 0x18

	anim_data__0367_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1357C 16
		mAnimCmd6 0x0 0xA06EEFA
		mAnimCmd6 0x1 0xA06EEFA
		.4byte	3, 0

		mGetTiles 0x1358C 16
		.4byte	3, 1

		mGetTiles 0x1359C 16
		.4byte	3, 2

		mJumpBack 0x18


.align 2, 0
	anim_0367:
		.4byte anim_data__0367_0
		.4byte anim_data__0367_1




.align 2, 0
	anim_data__0368_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x135AC 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mGetTiles 0x135AC 16
		.4byte	2, 0

		mGetTiles 0x135BC 16
		.4byte	2, 1

		mGetTiles 0x135CC 16
		.4byte	2, 2

		mGetTiles 0x135DC 16
		.4byte	2, 3

		mJumpBack 0x59


.align 2, 0
	anim_0368:
		.4byte anim_data__0368_0




.align 2, 0
	anim_data__0369_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x135EC 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x13600 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0369:
		.4byte anim_data__0369_0




.align 2, 0
	anim_data__0370_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13614 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x13624 20
		.4byte	2, 1

		mGetTiles 0x13638 20
		.4byte	2, 2

		mGetTiles 0x1364C 16
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0370:
		.4byte anim_data__0370_0




.align 2, 0
	anim_data__0371_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1365C 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x13670 25
		.4byte	2, 1

		mGetTiles 0x13689 25
		.4byte	2, 2

		mJumpBack 0xA

	anim_data__0371_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x136A2 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0371:
		.4byte anim_data__0371_0
		.4byte anim_data__0371_1




.align 2, 0
	anim_data__0372_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x136B2 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x136C2 20
		.4byte	1, 1

		mGetTiles 0x136D6 25
		.4byte	3, 2

		mGetTiles 0x136EF 25
		.4byte	3, 3

		mJumpBack 0xA

	anim_data__0372_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13708 20
		mAnimCmd6 0x0 0x1206F6FA
		.4byte	2, 4

		mGetTiles 0x1371C 12
		.4byte	1, 5

		mGetTiles 0x13728 12
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0372:
		.4byte anim_data__0372_0
		.4byte anim_data__0372_1




.align 2, 0
	anim_data__0373_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13734 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 0

		mGetTiles 0x13774 64
		.4byte	8, 1

		mGetTiles 0x137B4 64
		.4byte	8, 2

		mGetTiles 0x137F4 64
		.4byte	8, 3

		mGetTiles 0x13834 64
		.4byte	8, 4

		mGetTiles 0x13874 64
		.4byte	8, 5

		mGetTiles 0x138B4 64
		.4byte	8, 6

		mGetTiles 0x138F4 64
		.4byte	8, 7

		mGetTiles 0x13734 64
		.4byte	8, 0

		mGetTiles 0x13934 64
		.4byte	8, 8

		mGetTiles 0x13974 64
		.4byte	8, 9

		mGetTiles 0x139B4 64
		.4byte	8, 10

		mGetTiles 0x13834 64
		.4byte	8, 4

		mGetTiles 0x13874 64
		.4byte	8, 5

		mGetTiles 0x138B4 64
		.4byte	8, 6

		mGetTiles 0x138F4 64
		.4byte	8, 7

		mJumpBack 0x56

	anim_data__0373_1:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x139F4 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 11

		mGetTiles 0x13A34 64
		.4byte	8, 12

		mGetTiles 0x13A74 64
		.4byte	8, 13

		mGetTiles 0x13AB4 64
		.4byte	8, 14

		mGetTiles 0x13AF4 64
		.4byte	8, 15

		mGetTiles 0x13B34 64
		.4byte	8, 16

		mGetTiles 0x13B74 64
		.4byte	8, 17

		mGetTiles 0x13BB4 64
		.4byte	8, 18

		mGetTiles 0x13BF4 64
		.4byte	8, 19

		mGetTiles 0x13C34 64
		.4byte	8, 20

		mGetTiles 0x13C74 64
		.4byte	8, 21

		mGetTiles 0x13CB4 64
		.4byte	8, 22

		mGetTiles 0x13AF4 64
		.4byte	8, 15

		mGetTiles 0x13B34 64
		.4byte	8, 16

		mGetTiles 0x13B74 64
		.4byte	8, 17

		mGetTiles 0x13CF4 64
		.4byte	8, 23

		mJumpBack 0x56

	anim_data__0373_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x13D34 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 24

		mGetTiles 0x13D74 64
		.4byte	8, 25

		mGetTiles 0x13DB4 64
		.4byte	8, 26

		mGetTiles 0x13DF4 64
		.4byte	8, 27

		mGetTiles 0x13E34 64
		.4byte	8, 28

		mGetTiles 0x13E74 64
		.4byte	8, 29

		mGetTiles 0x13EB4 64
		.4byte	8, 30

		mGetTiles 0x13EF4 64
		.4byte	8, 31

		mGetTiles 0x13D34 64
		.4byte	8, 24

		mGetTiles 0x13F34 64
		.4byte	8, 32

		mGetTiles 0x13F74 64
		.4byte	8, 33

		mGetTiles 0x13FB4 64
		.4byte	8, 34

		mGetTiles 0x13E34 64
		.4byte	8, 28

		mGetTiles 0x13E74 64
		.4byte	8, 29

		mGetTiles 0x13EB4 64
		.4byte	8, 30

		mGetTiles 0x13EF4 64
		.4byte	8, 31

		mJumpBack 0x56

	anim_data__0373_3:
		mGetPalette 0x1E 16 0x0
		mGetTiles 0x13FF4 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 35

		mGetTiles 0x14034 64
		.4byte	8, 36

		mGetTiles 0x14074 64
		.4byte	8, 37

		mGetTiles 0x140B4 64
		.4byte	8, 38

		mGetTiles 0x140F4 64
		.4byte	8, 39

		mGetTiles 0x14134 64
		.4byte	8, 40

		mGetTiles 0x14174 64
		.4byte	8, 41

		mGetTiles 0x141B4 64
		.4byte	8, 42

		mGetTiles 0x13FF4 64
		.4byte	8, 35

		mGetTiles 0x141F4 64
		.4byte	8, 43

		mGetTiles 0x14234 64
		.4byte	8, 44

		mGetTiles 0x14274 64
		.4byte	8, 45

		mGetTiles 0x140F4 64
		.4byte	8, 39

		mGetTiles 0x14134 64
		.4byte	8, 40

		mGetTiles 0x14174 64
		.4byte	8, 41

		mGetTiles 0x141B4 64
		.4byte	8, 42

		mJumpBack 0x56

	anim_data__0373_4:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x142B4 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 46

		mGetTiles 0x142F4 64
		.4byte	8, 47

		mGetTiles 0x14334 64
		.4byte	8, 48

		mGetTiles 0x14374 64
		.4byte	8, 49

		mGetTiles 0x143B4 64
		.4byte	8, 50

		mGetTiles 0x143F4 64
		.4byte	8, 51

		mGetTiles 0x14434 64
		.4byte	8, 52

		mGetTiles 0x14474 64
		.4byte	8, 53

		mGetTiles 0x142B4 64
		.4byte	8, 46

		mGetTiles 0x144B4 64
		.4byte	8, 54

		mGetTiles 0x144F4 64
		.4byte	8, 55

		mGetTiles 0x14534 64
		.4byte	8, 56

		mGetTiles 0x143B4 64
		.4byte	8, 50

		mGetTiles 0x143F4 64
		.4byte	8, 51

		mGetTiles 0x14434 64
		.4byte	8, 52

		mGetTiles 0x14474 64
		.4byte	8, 53

		mJumpBack 0x56

	anim_data__0373_5:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x142B4 64
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	8, 46

		mGetTiles 0x142F4 64
		.4byte	8, 47

		mGetTiles 0x14334 64
		.4byte	8, 48

		mGetTiles 0x14374 64
		.4byte	8, 49

		mGetTiles 0x143B4 64
		.4byte	8, 50

		mGetTiles 0x143F4 64
		.4byte	8, 51

		mGetTiles 0x14434 64
		.4byte	8, 52

		mGetTiles 0x14474 64
		.4byte	8, 53

		mGetTiles 0x142B4 64
		.4byte	8, 46

		mGetTiles 0x144B4 64
		.4byte	8, 54

		mGetTiles 0x144F4 64
		.4byte	8, 55

		mGetTiles 0x14534 64
		.4byte	8, 56

		mGetTiles 0x143B4 64
		.4byte	8, 50

		mGetTiles 0x143F4 64
		.4byte	8, 51

		mGetTiles 0x14434 64
		.4byte	8, 52

		mGetTiles 0x14474 64
		.4byte	8, 53

		mJumpBack 0x56


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
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14574 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	3, 0

		mGetTiles 0x14584 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0374_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14594 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	2, 2

		mGetTiles 0x145A4 16
		.4byte	2, 3

		mGetTiles 0x145B4 16
		.4byte	2, 4

		mGetTiles 0x145C4 16
		.4byte	2, 5

		mGetTiles 0x145D4 16
		.4byte	2, 6

		mGetTiles 0x145E4 16
		.4byte	2, 7

		mGetTiles 0x145F4 16
		.4byte	2, 8

		mGetTiles 0x14604 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0374_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14614 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	1, 10

		mGetTiles 0x14624 20
		mAnimCmd6 0x0 0xA06F0FA
		mAnimCmd6 0x1 0xF0BF9F6
		.4byte	2, 11

		mGetTiles 0x14638 25
		.4byte	2, 12

		mGetTiles 0x14651 25
		.4byte	2, 13

		mGetTiles 0x1466A 30
		.4byte	2, 14

		mJumpBack 0xF


.align 2, 0
	anim_0374:
		.4byte anim_data__0374_0
		.4byte anim_data__0374_1
		.4byte anim_data__0374_2




.align 2, 0
	anim_data__0375_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14688 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	3, 0

		mGetTiles 0x14698 16
		.4byte	2, 1

		mAnimCmd4 

	anim_data__0375_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x146A8 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	2, 2

		mGetTiles 0x146B8 16
		.4byte	2, 3

		mGetTiles 0x146C8 16
		.4byte	2, 4

		mGetTiles 0x146D8 16
		.4byte	2, 5

		mGetTiles 0x146E8 16
		.4byte	2, 6

		mGetTiles 0x146F8 16
		.4byte	2, 7

		mGetTiles 0x14708 16
		.4byte	2, 8

		mGetTiles 0x14718 16
		.4byte	2, 9

		mJumpBack 0x31

	anim_data__0375_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14728 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	1, 10

		mGetTiles 0x14738 20
		mAnimCmd6 0x0 0xA06F0FA
		mAnimCmd6 0x1 0xF0BF9F6
		.4byte	2, 11

		mGetTiles 0x1474C 25
		.4byte	2, 12

		mGetTiles 0x14765 25
		.4byte	2, 13

		mGetTiles 0x1477E 30
		.4byte	2, 14

		mJumpBack 0xF


.align 2, 0
	anim_0375:
		.4byte anim_data__0375_0
		.4byte anim_data__0375_1
		.4byte anim_data__0375_2




.align 2, 0
	anim_data__0376_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1479C 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x147AC 16
		.4byte	1, 1

		mGetTiles 0x147BC 16
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0376:
		.4byte anim_data__0376_0




.align 2, 0
	anim_data__0377_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x147CC 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	2, 0

		mGetTiles 0x147E0 25
		.4byte	2, 1

		mGetTiles 0x147F9 24
		mAnimCmd6 0x0 0x806EEFA
		.4byte	2, 2

		mGetTiles 0x14811 24
		.4byte	2, 3

		mGetTiles 0x14829 24
		.4byte	2, 4

		mJumpBack 0x12


.align 2, 0
	anim_0377:
		.4byte anim_data__0377_0




.align 2, 0
	anim_data__0378_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14841 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x14855 24
		mAnimCmd6 0x0 0x100EF400
		.4byte	1, 1

		mGetTiles 0x1486D 20
		mAnimCmd6 0x0 0x100EF402
		.4byte	1, 2

		mGetTiles 0x14881 30
		mAnimCmd6 0x0 0x1012F406
		.4byte	1, 3

		mGetTiles 0x1489F 35
		.4byte	2, 4

		mGetTiles 0x148C2 35
		.4byte	3, 5

		mGetTiles 0x148E5 36
		mAnimCmd6 0x0 0x100EF402
		.4byte	1, 6

		mGetTiles 0x14909 24
		mAnimCmd6 0x0 0x100CF400
		mAnimCmd6 0x1 0xFE0ADDEC
		.4byte	1, 7

		mGetTiles 0x14921 42
		mAnimCmd6 0x0 0x1006F4FA
		mAnimCmd6 0x1 0x1000E9E0
		mPlaySoundEffect 128
		.4byte	2, 8

		mGetTiles 0x1494B 35
		.4byte	2, 9

		mGetTiles 0x1496E 35
		.4byte	2, 10

		mGetTiles 0x14991 28
		.4byte	2, 11

		mGetTiles 0x149AD 20
		mAnimCmd6 0x0 0x1006F4FA
		mAnimCmd6 0x1 0x0
		.4byte	3, 12

		mGetTiles 0x149C1 20
		.4byte	3, 13

		mGetTiles 0x149D5 16
		.4byte	3, 14

		mAnimCmd4 


.align 2, 0
	anim_0378:
		.4byte anim_data__0378_0




.align 2, 0
	anim_data__0380_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x149E5 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x149F9 20
		mAnimCmd6 0x0 0x1008F8FA
		.4byte	6, 1

		mGetTiles 0x14A0D 24
		mAnimCmd6 0x0 0x1008F8FA
		.4byte	6, 2

		mGetTiles 0x14A25 20
		mAnimCmd6 0x0 0x1008FEFA
		.4byte	2, 3

		mAnimCmd4 

	anim_data__0380_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14A39 18
		mAnimCmd6 0x0 0xF0801FA
		mAnimCmd6 0x1 0x1101FBEE
		.4byte	2, 4

		mGetTiles 0x14A4B 24
		.4byte	2, 5

		mGetTiles 0x14A63 20
		.4byte	2, 6

		mJumpBack 0x18

	anim_data__0380_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14A77 18
		mAnimCmd6 0x0 0x1006FCFA
		.4byte	1, 7

		mGetTiles 0x14A89 25
		.4byte	2, 8

		mGetTiles 0x14AA2 16
		.4byte	1, 9

		mGetTiles 0x14AB2 15
		.4byte	1, 10

		mGetTiles 0x14AC1 25
		.4byte	1, 11

		mGetTiles 0x14ADA 16
		.4byte	1, 12

		mGetTiles 0x14AEA 20
		.4byte	1, 13

		mGetTiles 0x14AFE 15
		.4byte	1, 14

		mGetTiles 0x14B0D 16
		.4byte	1, 15

		mGetTiles 0x14B1D 16
		.4byte	1, 16

		mAnimCmd4 

	anim_data__0380_3:
		mGetPalette 0xE 16 0x50
		mGetTiles 0x14B2D 9
		.4byte	2, 17

		mGetTiles 0x14B36 20
		.4byte	2, 18

		mGetTiles 0x14B4A 12
		.4byte	2, 19

		mJumpBack 0x12


.align 2, 0
	anim_0380:
		.4byte anim_data__0380_0
		.4byte anim_data__0380_1
		.4byte anim_data__0380_2
		.4byte anim_data__0380_3




.align 2, 0
	anim_data__0381_0:
		mGetPalette 0x1F 16 0x0
		mGetTiles 0x14B56 24
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xE0EF2F2
		.4byte	2, 0

		mGetTiles 0x14B6E 35
		.4byte	3, 1

		mGetTiles 0x14B91 30
		.4byte	2, 2

		mGetTiles 0x14BAF 25
		.4byte	2, 3

		mGetTiles 0x14BC8 20
		.4byte	1, 4

		mGetTiles 0x14BDC 30
		.4byte	1, 5

		mGetTiles 0x14BFA 20
		.4byte	1, 6

		mGetTiles 0x14C0E 30
		.4byte	1, 7

		mGetTiles 0x14C2C 15
		.4byte	1, 8

		mGetTiles 0x14C3B 30
		.4byte	1, 9

		mGetTiles 0x14C59 24
		.4byte	1, 10

		mGetTiles 0x14C71 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	1, 11

		mGetTiles 0x14C85 20
		.4byte	1, 12

		mGetTiles 0x14C99 25
		.4byte	1, 13

		mGetTiles 0x14CB2 24
		.4byte	3, 14

		mGetTiles 0x14CCA 24
		.4byte	3, 15

		mGetTiles 0x14CE2 24
		.4byte	3, 16

		mJumpBack 0xF


.align 2, 0
	anim_0381:
		.4byte anim_data__0381_0




.align 2, 0
	anim_data__0382_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14CFA 15
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	3, 0

		mGetTiles 0x14D09 20
		.4byte	4, 1

		mGetTiles 0x14D1D 20
		.4byte	3, 2

		mGetTiles 0x14D31 30
		mAnimCmd6 0x0 0xE06F4FA
		mAnimCmd6 0x1 0xE18FAE8
		.4byte	2, 3

		mGetTiles 0x14D4F 20
		.4byte	2, 4

		mGetTiles 0x14D63 30
		.4byte	2, 5

		mGetTiles 0x14D81 24
		.4byte	2, 6

		mGetTiles 0x14D99 16
		.4byte	2, 7

		mGetTiles 0x14DA9 24
		.4byte	2, 8

		mJumpBack 0x24

	anim_data__0382_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14DC1 25
		mAnimCmd6 0x0 0xE06F4FA
		mAnimCmd6 0x1 0x0
		.4byte	4, 9

		mGetTiles 0x14DDA 24
		.4byte	3, 10

		mGetTiles 0x14DF2 24
		.4byte	3, 11

		mGetTiles 0x14E0A 24
		.4byte	3, 12

		mJumpBack 0xF


.align 2, 0
	anim_0382:
		.4byte anim_data__0382_0
		.4byte anim_data__0382_1




.align 2, 0
	anim_data__0383_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x14E22 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	1, 0

		mGetTiles 0x14E36 20
		.4byte	1, 1

		mGetTiles 0x14E4A 25
		.4byte	1, 2

		mGetTiles 0x14E63 30
		.4byte	1, 3

		mGetTiles 0x14E81 30
		.4byte	3, 4

		mGetTiles 0x14E9F 36
		.4byte	4, 5

		mGetTiles 0x14EC3 36
		.4byte	2, 6

		mGetTiles 0x14EE7 35
		.4byte	1, 7

		mGetTiles 0x14F0A 42
		mAnimCmd6 0x0 0x1006F4FA
		mAnimCmd6 0x1 0xD6E0
		.4byte	1, 8

		mGetTiles 0x14F34 42
		mAnimCmd6 0x0 0x10FEF4F2
		mAnimCmd6 0x1 0x6F9DED8
		.4byte	1, 9

		mGetTiles 0x14F5E 42
		mAnimCmd6 0x0 0x10FEF4F2
		mAnimCmd6 0x1 0x10F5E9D4
		mPlaySoundEffect 128
		.4byte	1, 10

		mGetTiles 0x14F88 42
		.4byte	2, 11

		mGetTiles 0x14FB2 42
		.4byte	2, 12

		mGetTiles 0x14FDC 28
		.4byte	2, 13

		mGetTiles 0x14FF8 28
		.4byte	8, 14

		mGetTiles 0x15014 16
		mAnimCmd6 0x0 0x1004F4F8
		mAnimCmd6 0x1 0x0
		.4byte	3, 15

		mGetTiles 0x15024 16
		mAnimCmd6 0x0 0x1008F4FC
		.4byte	3, 16

		mGetTiles 0x15034 12
		mAnimCmd6 0x0 0x100AF4FE
		.4byte	3, 17

		mAnimCmd4 


.align 2, 0
	anim_0383:
		.4byte anim_data__0383_0




.align 2, 0
	anim_data__0392_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15040 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	3, 0

		mGetTiles 0x15054 25
		.4byte	8, 1

		mGetTiles 0x1506D 20
		.4byte	8, 2

		mGetTiles 0x15081 16
		.4byte	8, 3

		mAnimCmd4 

	anim_data__0392_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15091 25
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	5, 4

		mGetTiles 0x150AA 15
		.4byte	5, 5

		mGetTiles 0x150B9 16
		.4byte	5, 6

		mGetTiles 0x150C9 16
		.4byte	5, 7

		mGetTiles 0x150D9 20
		.4byte	5, 8

		mAnimCmd4 

	anim_data__0392_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x150ED 16
		.4byte	2, 9

		mGetTiles 0x150FD 16
		.4byte	2, 10

		mGetTiles 0x1510D 20
		.4byte	2, 11

		mGetTiles 0x15121 16
		.4byte	2, 12

		mGetTiles 0x15131 16
		.4byte	2, 13

		mAnimCmd4 


.align 2, 0
	anim_0392:
		.4byte anim_data__0392_0
		.4byte anim_data__0392_1
		.4byte anim_data__0392_2




.align 2, 0
	anim_data__0393_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15141 20
		.4byte	3, 0

		mGetTiles 0x15155 30
		.4byte	3, 1

		mGetTiles 0x15173 30
		.4byte	2, 2

		mGetTiles 0x15191 20
		.4byte	3, 3

		mGetTiles 0x151A5 24
		.4byte	3, 4

		mJumpBack 0xA


.align 2, 0
	anim_0393:
		.4byte anim_data__0393_0




.align 2, 0
	anim_data__0394_0:
		mGetPalette 0x20 16 0x0
		mGetTiles 0x151BD 15
		.4byte	1, 0

		mGetTiles 0x151CC 20
		.4byte	1, 1

		mGetTiles 0x151E0 20
		.4byte	2, 2

		mGetTiles 0x151F4 20
		.4byte	5, 3

		mGetTiles 0x15208 20
		.4byte	5, 4

		mGetTiles 0x1521C 20
		.4byte	5, 5

		mGetTiles 0x15230 20
		.4byte	5, 6

		mGetTiles 0x151F4 20
		.4byte	5, 3

		mGetTiles 0x15208 20
		.4byte	5, 4

		mGetTiles 0x1521C 20
		.4byte	5, 5

		mGetTiles 0x15230 20
		.4byte	5, 6

		mGetTiles 0x15244 20
		.4byte	5, 7

		mGetTiles 0x15258 20
		.4byte	3, 8

		mGetTiles 0x1526C 20
		.4byte	4, 9

		mGetTiles 0x15280 20
		.4byte	6, 10

		mGetTiles 0x15294 20
		.4byte	6, 11

		mGetTiles 0x152A8 20
		.4byte	6, 12

		mGetTiles 0x152BC 20
		.4byte	6, 13

		mGetTiles 0x152D0 20
		.4byte	6, 14

		mGetTiles 0x15294 20
		.4byte	6, 11

		mGetTiles 0x152A8 20
		.4byte	6, 12

		mGetTiles 0x152BC 20
		.4byte	6, 13

		mGetTiles 0x152D0 20
		.4byte	6, 14

		mGetTiles 0x152E4 20
		.4byte	4, 15

		mGetTiles 0x152F8 20
		.4byte	3, 16

		mGetTiles 0x1530C 20
		.4byte	3, 17

		mGetTiles 0x15320 20
		.4byte	7, 18

		mGetTiles 0x15334 20
		.4byte	4, 19

		mGetTiles 0x15348 20
		.4byte	4, 20

		mGetTiles 0x1535C 20
		.4byte	6, 21

		mGetTiles 0x15370 20
		.4byte	3, 22

		mGetTiles 0x15384 20
		.4byte	3, 23

		mGetTiles 0x15398 20
		.4byte	3, 24

		mGetTiles 0x153AC 15
		.4byte	12, 25

		mGetTiles 0x153BB 20
		.4byte	4, 26

		mGetTiles 0x153CF 16
		.4byte	6, 27

		mAnimCmd4 

	anim_data__0394_1:
		mGetPalette 0x20 16 0x0
		mGetTiles 0x153DF 16
		.4byte	1, 28

		mGetTiles 0x153EF 16
		.4byte	6, 29

		mGetTiles 0x153FF 20
		.4byte	60, 30

		mGetTiles 0x15413 20
		.4byte	4, 31

		mAnimCmd4 


.align 2, 0
	anim_0394:
		.4byte anim_data__0394_0
		.4byte anim_data__0394_1




.align 2, 0
	anim_data__0395_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15427 12
		mAnimCmd6 0x0 0x1006F4F8
		.4byte	3, 0

		mGetTiles 0x15433 12
		.4byte	3, 1

		mAnimCmd4 

	anim_data__0395_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1543F 20
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 2

		mGetTiles 0x15453 20
		.4byte	2, 3

		mGetTiles 0x15467 20
		.4byte	2, 4

		mJumpBack 0x15

	anim_data__0395_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15433 12
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 1

		mGetTiles 0x15427 12
		.4byte	2, 0

		mGetTiles 0x1547B 15
		.4byte	4, 5

		mAnimCmd4 


.align 2, 0
	anim_0395:
		.4byte anim_data__0395_0
		.4byte anim_data__0395_1
		.4byte anim_data__0395_2




.align 2, 0
	anim_data__0396_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1548A 20
		.4byte	3, 0

		mGetTiles 0x1549E 20
		.4byte	3, 1

		mGetTiles 0x154B2 16
		.4byte	3, 2

		mGetTiles 0x154C2 16
		.4byte	6, 3

		mGetTiles 0x154D2 16
		.4byte	3, 4

		mGetTiles 0x154E2 30
		.4byte	3, 5

		mGetTiles 0x15500 42
		.4byte	3, 6

		mGetTiles 0x1552A 48
		.4byte	3, 7

		mGetTiles 0x1555A 35
		.4byte	3, 8

		mGetTiles 0x1557D 35
		.4byte	3, 9

		mGetTiles 0x155A0 35
		.4byte	3, 10

		mGetTiles 0x155C3 30
		.4byte	3, 11

		mGetTiles 0x155E1 30
		.4byte	3, 12

		mGetTiles 0x155FF 25
		.4byte	3, 13

		mGetTiles 0x15618 20
		.4byte	3, 14

		mGetTiles 0x1562C 20
		.4byte	3, 15

		mGetTiles 0x15640 20
		.4byte	3, 16

		mGetTiles 0x15654 20
		.4byte	12, 17

		mGetTiles 0x15668 20
		.4byte	3, 18

		mGetTiles 0x1567C 20
		.4byte	3, 19

		mGetTiles 0x15690 20
		.4byte	3, 20

		mGetTiles 0x156A4 20
		.4byte	8, 21

		mGetTiles 0x156B8 20
		.4byte	3, 22

		mGetTiles 0x156CC 20
		.4byte	3, 23

		mGetTiles 0x156E0 20
		.4byte	3, 24

		mGetTiles 0x156F4 20
		.4byte	12, 25

		mAnimCmd4 


.align 2, 0
	anim_0396:
		.4byte anim_data__0396_0




.align 2, 0
	anim_data__0397_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15708 20
		.4byte	3, 0

		mGetTiles 0x1571C 15
		.4byte	3, 1

		mGetTiles 0x1572B 20
		.4byte	3, 2

		mGetTiles 0x1573F 20
		.4byte	6, 3

		mGetTiles 0x15753 20
		.4byte	3, 4

		mGetTiles 0x15767 20
		.4byte	3, 5

		mGetTiles 0x1577B 20
		.4byte	3, 6

		mGetTiles 0x1578F 15
		.4byte	3, 7

		mGetTiles 0x1579E 25
		.4byte	3, 8

		mGetTiles 0x157B7 25
		.4byte	3, 9

		mGetTiles 0x157D0 15
		.4byte	6, 10

		mGetTiles 0x157DF 15
		.4byte	6, 11

		mGetTiles 0x157EE 15
		.4byte	3, 12

		mGetTiles 0x157FD 15
		.4byte	3, 13

		mGetTiles 0x1580C 20
		.4byte	3, 14

		mGetTiles 0x15820 20
		.4byte	3, 15

		mGetTiles 0x15834 20
		.4byte	3, 16

		mGetTiles 0x15848 20
		.4byte	6, 17

		mGetTiles 0x1585C 20
		.4byte	6, 18

		mGetTiles 0x15870 15
		.4byte	3, 19

		mGetTiles 0x1587F 20
		.4byte	3, 20

		mGetTiles 0x15893 15
		.4byte	8, 21

		mGetTiles 0x158A2 20
		.4byte	3, 22

		mGetTiles 0x158B6 25
		.4byte	4, 23

		mGetTiles 0x158B6 25
		.4byte	4, 23

		mGetTiles 0x158CF 25
		.4byte	4, 24

		mGetTiles 0x158E8 25
		.4byte	4, 25

		mGetTiles 0x15901 25
		.4byte	4, 26

		mGetTiles 0x1591A 25
		.4byte	4, 27

		mGetTiles 0x15933 25
		.4byte	4, 28

		mGetTiles 0x1594C 25
		.4byte	4, 29

		mGetTiles 0x15965 25
		.4byte	4, 30

		mGetTiles 0x1597E 25
		.4byte	4, 31

		mGetTiles 0x15997 25
		.4byte	4, 32

		mGetTiles 0x15933 25
		.4byte	4, 28

		mGetTiles 0x1591A 25
		.4byte	4, 27

		mJumpBack 0x3C


.align 2, 0
	anim_0397:
		.4byte anim_data__0397_0




.align 2, 0
	anim_data__0398_0:
		mGetPalette 0x21 16 0x0
		mGetTiles 0x159B0 20
		.4byte	4, 0

		mGetTiles 0x159C4 20
		.4byte	4, 1

		mGetTiles 0x159D8 15
		.4byte	4, 2

		mGetTiles 0x159E7 20
		.4byte	4, 3

		mGetTiles 0x159FB 16
		.4byte	4, 4

		mGetTiles 0x15A0B 16
		.4byte	6, 5

		mGetTiles 0x15A1B 16
		.4byte	4, 6

		mGetTiles 0x15A2B 16
		.4byte	4, 7

		mGetTiles 0x15A3B 15
		.4byte	8, 8

		mGetTiles 0x15A4A 20
		.4byte	6, 9

		mGetTiles 0x15A5E 20
		.4byte	6, 10

		mGetTiles 0x15A72 20
		.4byte	6, 11

		mGetTiles 0x15A5E 20
		.4byte	6, 10

		mGetTiles 0x15A86 20
		.4byte	6, 12

		mGetTiles 0x15A9A 20
		.4byte	6, 13

		mGetTiles 0x15AAE 20
		.4byte	6, 14

		mGetTiles 0x15AC2 20
		.4byte	6, 15

		mGetTiles 0x15AD6 20
		.4byte	6, 16

		mGetTiles 0x15A4A 20
		.4byte	6, 9

		mGetTiles 0x15A5E 20
		.4byte	6, 10

		mGetTiles 0x15A72 20
		.4byte	6, 11

		mGetTiles 0x15A5E 20
		.4byte	6, 10

		mGetTiles 0x15AEA 20
		.4byte	6, 17

		mGetTiles 0x15AFE 20
		.4byte	6, 18

		mGetTiles 0x15B12 20
		.4byte	6, 19

		mGetTiles 0x15B26 20
		.4byte	6, 20

		mGetTiles 0x15B12 20
		.4byte	6, 19

		mJumpBack 0x5A


.align 2, 0
	anim_0398:
		.4byte anim_data__0398_0




.align 2, 0
	anim_data__0399_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15B3A 16
		.4byte	2, 0

		mGetTiles 0x15B4A 16
		.4byte	2, 1

		mGetTiles 0x15B5A 20
		.4byte	3, 2

		mGetTiles 0x15B6E 20
		.4byte	3, 3

		mGetTiles 0x15B82 16
		.4byte	3, 4

		mGetTiles 0x15B92 16
		.4byte	3, 5

		mGetTiles 0x15BA2 20
		.4byte	3, 6

		mGetTiles 0x15BB6 20
		.4byte	3, 7

		mGetTiles 0x15BCA 16
		.4byte	3, 8

		mGetTiles 0x15BDA 16
		.4byte	3, 9

		mGetTiles 0x15B5A 20
		.4byte	3, 2

		mGetTiles 0x15B6E 20
		.4byte	3, 3

		mGetTiles 0x15B82 16
		.4byte	3, 4

		mGetTiles 0x15B92 16
		.4byte	3, 5

		mGetTiles 0x15BEA 20
		.4byte	3, 10

		mGetTiles 0x15BFE 20
		.4byte	3, 11

		mGetTiles 0x15C12 16
		.4byte	3, 12

		mGetTiles 0x15BDA 16
		.4byte	3, 9

		mJumpBack 0x50


.align 2, 0
	anim_0399:
		.4byte anim_data__0399_0




.align 2, 0
	anim_data__0400_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C22 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0400_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C36 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0400_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C4A 15
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0400_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C59 15
		.4byte	6, 3

		mGetTiles 0x15C68 15
		.4byte	6, 4

		mGetTiles 0x15C77 15
		.4byte	8, 5

		mGetTiles 0x15C86 15
		.4byte	6, 6

		mGetTiles 0x15C59 15
		.4byte	6, 3

		mAnimCmd4 


.align 2, 0
	anim_0400:
		.4byte anim_data__0400_0
		.4byte anim_data__0400_1
		.4byte anim_data__0400_2
		.4byte anim_data__0400_3




.align 2, 0
	anim_data__0412_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15C95 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	3, 0

		mGetTiles 0x15CA9 20
		.4byte	6, 1

		mAnimCmd4 

	anim_data__0412_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15CBD 20
		.4byte	2, 2

		mGetTiles 0x15CD1 25
		.4byte	1, 3

		mGetTiles 0x15CEA 25
		.4byte	1, 4

		mGetTiles 0x15D03 18
		.4byte	3, 5

		mGetTiles 0x15D15 18
		.4byte	3, 6

		mGetTiles 0x15D27 18
		.4byte	3, 7

		mJumpBack 0xF

	anim_data__0412_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15D39 25
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 8

		mGetTiles 0x15D52 20
		.4byte	1, 9

		mGetTiles 0x15D66 20
		.4byte	1, 10

		mGetTiles 0x15D7A 20
		.4byte	3, 11

		mGetTiles 0x15D8E 20
		.4byte	3, 12

		mGetTiles 0x15DA2 20
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0412:
		.4byte anim_data__0412_0
		.4byte anim_data__0412_1
		.4byte anim_data__0412_2




.align 2, 0
	anim_data__0413_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15DB6 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	1, 0

		mGetTiles 0x15DCA 25
		.4byte	2, 1

		mGetTiles 0x15DE3 25
		.4byte	3, 2

		mGetTiles 0x15DFC 25
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0413_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15E15 20
		mAnimCmd6 0x0 0xA06F0FA
		mAnimCmd6 0x1 0xA0EF0F2
		.4byte	2, 4

		mGetTiles 0x15E29 20
		.4byte	2, 5

		mGetTiles 0x15E3D 20
		.4byte	2, 6

		mGetTiles 0x15E51 20
		.4byte	2, 7

		mGetTiles 0x15E65 20
		.4byte	2, 8

		mGetTiles 0x15E79 20
		.4byte	2, 9

		mGetTiles 0x15E8D 20
		.4byte	2, 10

		mGetTiles 0x15EA1 25
		.4byte	2, 11

		mJumpBack 0x31


.align 2, 0
	anim_0413:
		.4byte anim_data__0413_0
		.4byte anim_data__0413_1




.align 2, 0
	anim_data__0414_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15EBA 20
		mAnimCmd6 0x0 0xA06F0F8
		.4byte	1, 0

		mGetTiles 0x15ECE 20
		.4byte	2, 1

		mGetTiles 0x15EE2 20
		.4byte	2, 2

		mGetTiles 0x15EF6 16
		.4byte	3, 3

		mAnimCmd4 

	anim_data__0414_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x15F06 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 4

		mGetTiles 0x15F1A 20
		.4byte	2, 5

		mGetTiles 0x15F2E 24
		.4byte	3, 6

		mGetTiles 0x15F46 15
		.4byte	2, 7

		mGetTiles 0x15F55 20
		.4byte	2, 8

		mGetTiles 0x15F69 20
		.4byte	2, 9

		mGetTiles 0x15F7D 24
		.4byte	2, 10

		mGetTiles 0x15F95 24
		.4byte	2, 11

		mGetTiles 0x15FAD 20
		.4byte	2, 12

		mGetTiles 0x15FC1 25
		.4byte	2, 13

		mGetTiles 0x15FDA 24
		.4byte	2, 14

		mGetTiles 0x15FF2 25
		.4byte	2, 15

		mGetTiles 0x1600B 20
		.4byte	2, 16

		mGetTiles 0x1601F 20
		.4byte	2, 17

		mGetTiles 0x16033 20
		.4byte	3, 18

		mGetTiles 0x16047 20
		.4byte	3, 19

		mGetTiles 0x1605B 20
		.4byte	3, 20

		mJumpBack 0xF


.align 2, 0
	anim_0414:
		.4byte anim_data__0414_0
		.4byte anim_data__0414_1




.align 2, 0
	anim_data__0415_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1606F 15
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 0

		mGetTiles 0x1607E 20
		.4byte	2, 1

		mGetTiles 0x16092 20
		.4byte	4, 2

		mGetTiles 0x160A6 15
		.4byte	2, 3

		mAnimCmd4 

	anim_data__0415_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x160B5 30
		mAnimCmd6 0x0 0xA06F0FA
		mAnimCmd6 0x1 0xC1AF2E6
		.4byte	2, 4

		mGetTiles 0x160D3 20
		.4byte	2, 5

		mGetTiles 0x160E7 30
		.4byte	2, 6

		mGetTiles 0x16105 24
		.4byte	2, 7

		mGetTiles 0x1611D 16
		.4byte	2, 8

		mGetTiles 0x1612D 24
		.4byte	2, 9

		mJumpBack 0x27

	anim_data__0415_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x160B5 30
		mAnimCmd6 0x0 0xA06F0F8
		.4byte	2, 4

		mGetTiles 0x16145 25
		.4byte	2, 10

		mGetTiles 0x1615E 20
		.4byte	2, 11

		mGetTiles 0x16172 16
		.4byte	2, 12

		mGetTiles 0x16182 16
		.4byte	3, 13

		mGetTiles 0x16192 16
		.4byte	3, 14

		mGetTiles 0x161A2 16
		.4byte	3, 15

		mJumpBack 0xF


.align 2, 0
	anim_0415:
		.4byte anim_data__0415_0
		.4byte anim_data__0415_1
		.4byte anim_data__0415_2




.align 2, 0
	anim_data__0416_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x161B2 18
		mAnimCmd6 0x0 0x806EEFA
		.4byte	3, 0

		mGetTiles 0x161C4 18
		.4byte	3, 1

		mGetTiles 0x161D6 18
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0416_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x161E8 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	3, 3

		mGetTiles 0x161FC 20
		.4byte	3, 4

		mGetTiles 0x16210 20
		.4byte	3, 5

		mGetTiles 0x16224 20
		.4byte	4, 6

		mGetTiles 0x16238 20
		.4byte	4, 7

		mGetTiles 0x1624C 25
		.4byte	4, 8

		mAnimCmd4 

	anim_data__0416_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16265 24
		mAnimCmd6 0x0 0x806EEFA
		.4byte	3, 9

		mGetTiles 0x1627D 24
		.4byte	3, 10

		mGetTiles 0x16295 24
		.4byte	3, 11

		mJumpBack 0x15


.align 2, 0
	anim_0416:
		.4byte anim_data__0416_0
		.4byte anim_data__0416_1
		.4byte anim_data__0416_2




.align 2, 0
	anim_data__0417_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x162AD 20
		mAnimCmd6 0x0 0xD06F3FA
		.4byte	4, 0

		mGetTiles 0x162C1 15
		.4byte	4, 1

		mGetTiles 0x162D0 12
		.4byte	4, 2

		mGetTiles 0x162DC 16
		.4byte	4, 3

		mGetTiles 0x162EC 20
		.4byte	4, 4

		mGetTiles 0x16300 20
		.4byte	4, 5

		mGetTiles 0x16314 16
		.4byte	4, 6

		mGetTiles 0x16324 16
		.4byte	4, 7

		mGetTiles 0x16334 20
		.4byte	4, 8

		mGetTiles 0x16348 25
		.4byte	4, 9

		mGetTiles 0x16361 20
		.4byte	4, 10

		mGetTiles 0x16375 24
		.4byte	3, 11

		mGetTiles 0x1638D 24
		.4byte	3, 12

		mGetTiles 0x163A5 24
		.4byte	3, 13

		mJumpBack 0xF


.align 2, 0
	anim_0417:
		.4byte anim_data__0417_0




.align 2, 0
	anim_data__0418_0:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x163BD 15
		mAnimCmd6 0x0 0xC06F0FA
		.4byte	1, 0

		mGetTiles 0x163CC 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 1

		mGetTiles 0x163E0 20
		.4byte	2, 2

		mGetTiles 0x163F4 20
		.4byte	2, 3

		mJumpBack 0x12

	anim_data__0418_1:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x16408 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	1, 4

		mGetTiles 0x1641C 20
		.4byte	2, 5

		mGetTiles 0x16430 20
		.4byte	2, 6

		mGetTiles 0x16444 25
		.4byte	2, 7

		mGetTiles 0x1645D 20
		.4byte	2, 8

		mGetTiles 0x16471 25
		.4byte	2, 9

		mGetTiles 0x1648A 24
		.4byte	2, 10

		mGetTiles 0x164A2 24
		.4byte	2, 11

		mGetTiles 0x164BA 24
		.4byte	2, 12

		mJumpBack 0xF


.align 2, 0
	anim_0418:
		.4byte anim_data__0418_0
		.4byte anim_data__0418_1




.align 2, 0
	anim_data__0419_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x164D2 64
		mAnimCmd6 0x0 0x1006F2F8
		.4byte	2, 0

		mGetTiles 0x16512 64
		mAnimCmd6 0x0 0x1006F2F8
		.4byte	2, 1

		mJumpBack 0x13


.align 2, 0
	anim_0419:
		.4byte anim_data__0419_0




.align 2, 0
	anim_data__0420_0:
		mGetPalette 0x1D 16 0x0
		mGetTiles 0x16552 20
		mAnimCmd6 0x0 0xD06F0FA
		.4byte	3, 0

		mGetTiles 0x16566 20
		.4byte	3, 1

		mGetTiles 0x1657A 20
		.4byte	3, 2

		mGetTiles 0x16552 20
		.4byte	3, 0

		mGetTiles 0x16566 20
		.4byte	3, 1

		mGetTiles 0x1657A 20
		.4byte	3, 2

		mGetTiles 0x1658E 20
		.4byte	3, 3

		mGetTiles 0x165A2 20
		.4byte	2, 4

		mGetTiles 0x165B6 20
		.4byte	2, 5

		mGetTiles 0x165CA 24
		.4byte	4, 6

		mGetTiles 0x165E2 20
		.4byte	2, 7

		mGetTiles 0x165F6 24
		.4byte	2, 8

		mGetTiles 0x1660E 24
		.4byte	3, 9

		mGetTiles 0x16626 30
		.4byte	3, 10

		mGetTiles 0x16644 25
		.4byte	3, 11

		mGetTiles 0x1665D 24
		.4byte	3, 12

		mGetTiles 0x16675 30
		.4byte	3, 13

		mGetTiles 0x16693 25
		.4byte	3, 14

		mGetTiles 0x166AC 24
		.4byte	3, 15

		mGetTiles 0x166C4 24
		.4byte	3, 16

		mGetTiles 0x166DC 25
		.4byte	3, 17

		mGetTiles 0x166F5 18
		.4byte	3, 18

		mGetTiles 0x16707 25
		.4byte	3, 19

		mGetTiles 0x16720 20
		.4byte	3, 20

		mGetTiles 0x16734 18
		.4byte	3, 21

		mGetTiles 0x16746 24
		.4byte	3, 22

		mGetTiles 0x1675E 24
		.4byte	3, 23

		mGetTiles 0x16776 24
		.4byte	3, 24

		mGetTiles 0x1678E 18
		.4byte	3, 25

		mGetTiles 0x167A0 20
		.4byte	3, 26

		mGetTiles 0x167B4 25
		.4byte	3, 27

		mGetTiles 0x167CD 24
		.4byte	3, 28

		mGetTiles 0x167E5 24
		.4byte	3, 29

		mGetTiles 0x167FD 24
		.4byte	3, 30

		mJumpBack 0xF


.align 2, 0
	anim_0420:
		.4byte anim_data__0420_0




.align 2, 0
	anim_data__0421_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16815 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0421_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16825 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0421_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16835 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0421_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16845 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0421_4:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16859 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0421_5:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1686D 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0421_6:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1687D 16
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0421_7:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1688D 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x168A1 64
		mAnimCmd6 0x0 0x806F4FA
		.4byte	5, 0

		mGetTiles 0x168E1 64
		.4byte	5, 1

		mGetTiles 0x16921 64
		.4byte	5, 2

		mGetTiles 0x16961 64
		.4byte	5, 3

		mGetTiles 0x169A1 64
		.4byte	5, 4

		mGetTiles 0x169E1 64
		.4byte	5, 5

		mGetTiles 0x16A21 64
		.4byte	5, 6

		mGetTiles 0x16A61 64
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0422:
		.4byte anim_data__0422_0




.align 2, 0
	anim_data__0423_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16AA1 24
		mAnimCmd6 0x0 0x23060AF8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0423_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16AB9 20
		mAnimCmd6 0x0 0x1CFD08EA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0423_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16ACD 20
		mAnimCmd6 0x0 0x11F600E2
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0423_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16AE1 15
		mAnimCmd6 0x0 0x6F6F6E1
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0423_4:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16AF0 20
		mAnimCmd6 0x0 0xFFFAEDE7
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0423_5:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B04 20
		mAnimCmd6 0x0 0xFAFDE4ED
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0423_6:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B18 15
		mAnimCmd6 0x0 0xF506DFF8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0423_7:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B27 18
		mAnimCmd6 0x0 0xF912E402
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0423_8:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B39 20
		mAnimCmd6 0x0 0x21AEF09
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0423_9:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B4D 15
		mAnimCmd6 0x0 0x822FA0A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0423_10:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B5C 24
		mAnimCmd6 0x0 0x121E0008
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0423_11:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B74 25
		mAnimCmd6 0x0 0x1E160600
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B8D 15
		mAnimCmd6 0x0 0xF506DFF8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0424_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16B9C 20
		mAnimCmd6 0x0 0xFAFDE4ED
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0424_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16BB0 20
		mAnimCmd6 0x0 0xFFFAEDE7
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0424_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16BC4 15
		mAnimCmd6 0x0 0x6F6F6E1
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0424_4:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16BD3 20
		mAnimCmd6 0x0 0x11F600E2
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0424_5:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16BE7 20
		mAnimCmd6 0x0 0x1CFD08EA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0424_6:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16BFB 24
		mAnimCmd6 0x0 0x23060AF8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0424_7:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C13 25
		mAnimCmd6 0x0 0x1E160600
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0424_8:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C2C 24
		mAnimCmd6 0x0 0x121E0008
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0424_9:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C44 15
		mAnimCmd6 0x0 0x822FA0A
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0424_10:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C53 20
		mAnimCmd6 0x0 0x21AEF09
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0424_11:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C67 18
		mAnimCmd6 0x0 0xF912E402
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16C79 24
		.4byte	8, 0

		mGetTiles 0x16C91 24
		.4byte	8, 1

		mGetTiles 0x16CA9 24
		.4byte	8, 2

		mGetTiles 0x16C91 24
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0425:
		.4byte anim_data__0425_0




.align 2, 0
	anim_data__0426_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16CC1 24
		mAnimCmd6 0x0 0x1A0600FA
		.4byte	2, 0

		mGetTiles 0x16CD9 20
		mAnimCmd6 0x0 0x1206FEFA
		.4byte	2, 1

		mGetTiles 0x16CED 16
		mAnimCmd6 0x0 0xA06FEFA
		.4byte	2, 2

		mGetTiles 0x16CFD 16
		mAnimCmd6 0x0 0x406F7FA
		.4byte	2, 3

		mGetTiles 0x16D0D 24
		mAnimCmd6 0x0 0x6EAFA
		.4byte	4, 4

		mGetTiles 0x16D25 20
		mAnimCmd6 0x0 0x606F2FA
		.4byte	3, 5

		mGetTiles 0x16D39 16
		mAnimCmd6 0x0 0x806FAFA
		.4byte	2, 6

		mGetTiles 0x16D49 20
		mAnimCmd6 0x0 0x140600FA
		.4byte	2, 7

		mGetTiles 0x16CC1 24
		mAnimCmd6 0x0 0x1A0600FA
		.4byte	4, 0

		mGetTiles 0x16CD9 20
		mAnimCmd6 0x0 0x1206FEFA
		.4byte	3, 1

		mGetTiles 0x16CED 16
		mAnimCmd6 0x0 0xA06FEFA
		.4byte	2, 2

		mGetTiles 0x16CFD 16
		mAnimCmd6 0x0 0x406F7FA
		.4byte	2, 3

		mGetTiles 0x16D0D 24
		mAnimCmd6 0x0 0x6EAFA
		.4byte	2, 4

		mAnimCmd4 

	anim_data__0426_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16D5D 24
		.4byte	2, 8

		mGetTiles 0x16D75 20
		mAnimCmd6 0x0 0x206EEFA
		.4byte	2, 9

		mGetTiles 0x16D89 16
		mAnimCmd6 0x0 0x106F2FA
		.4byte	2, 10

		mGetTiles 0x16D99 16
		mAnimCmd6 0x0 0xC06FCFA
		.4byte	2, 11

		mGetTiles 0x16DA9 24
		mAnimCmd6 0x0 0x160600FA
		.4byte	4, 12

		mGetTiles 0x16DC1 20
		mAnimCmd6 0x0 0xE06FAFA
		.4byte	3, 13

		mGetTiles 0x16DD5 16
		mAnimCmd6 0x0 0x606F6FA
		.4byte	2, 14

		mGetTiles 0x16DE5 20
		mAnimCmd6 0x0 0x106ECFA
		.4byte	2, 15

		mGetTiles 0x16D5D 24
		mAnimCmd6 0x0 0x6E8FA
		.4byte	4, 8

		mGetTiles 0x16D75 20
		mAnimCmd6 0x0 0x206EEFA
		.4byte	3, 9

		mGetTiles 0x16D89 16
		mAnimCmd6 0x0 0x106F2FA
		.4byte	2, 10

		mGetTiles 0x16D99 16
		mAnimCmd6 0x0 0xC06FCFA
		.4byte	2, 11

		mGetTiles 0x16DA9 24
		mAnimCmd6 0x0 0x160600FA
		.4byte	2, 12

		mAnimCmd4 


.align 2, 0
	anim_0426:
		.4byte anim_data__0426_0
		.4byte anim_data__0426_1




.align 2, 0
	anim_data__0427_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16DF9 16
		mAnimCmd6 0x0 0xA0EFCFC
		.4byte	2, 0

		mGetTiles 0x16E09 16
		mAnimCmd6 0x0 0x20EF2FC
		.4byte	2, 1

		mGetTiles 0x16E19 24
		mAnimCmd6 0x0 0xFF0EF1FC
		.4byte	4, 2

		mGetTiles 0x16E31 16
		mAnimCmd6 0x0 0xEF2FC
		.4byte	3, 3

		mGetTiles 0x16E41 12
		mAnimCmd6 0x0 0x60EFAFC
		.4byte	2, 4

		mGetTiles 0x16E4D 20
		mAnimCmd6 0x0 0x100E02FC
		.4byte	2, 5

		mGetTiles 0x16E61 24
		mAnimCmd6 0x0 0x140E02FC
		.4byte	4, 6

		mGetTiles 0x16E79 20
		mAnimCmd6 0x0 0xE0E00FC
		.4byte	3, 7

		mGetTiles 0x16DF9 16
		mAnimCmd6 0x0 0xA0EFCFC
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0427_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16E8D 16
		mAnimCmd6 0x0 0x60EF8FC
		.4byte	2, 8

		mGetTiles 0x16E9D 16
		mAnimCmd6 0x0 0xC0E00FC
		.4byte	2, 9

		mGetTiles 0x16EAD 24
		mAnimCmd6 0x0 0x130E02FC
		.4byte	4, 10

		mGetTiles 0x16EC5 16
		mAnimCmd6 0x0 0xE0EFEFC
		.4byte	3, 11

		mGetTiles 0x16ED5 12
		mAnimCmd6 0x0 0x80EFAFC
		.4byte	2, 12

		mGetTiles 0x16EE1 20
		mAnimCmd6 0x0 0xEF0FC
		.4byte	2, 13

		mGetTiles 0x16EF5 24
		mAnimCmd6 0x0 0xEECFC
		.4byte	4, 14

		mGetTiles 0x16F0D 20
		mAnimCmd6 0x0 0x20EF2FC
		.4byte	3, 15

		mGetTiles 0x16E8D 16
		mAnimCmd6 0x0 0x60EF8FC
		.4byte	2, 8

		mAnimCmd4 


.align 2, 0
	anim_0427:
		.4byte anim_data__0427_0
		.4byte anim_data__0427_1




.align 2, 0
	anim_data__0428_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16F21 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 0

		mGetTiles 0x16F2D 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	2, 1

		mGetTiles 0x16F41 20
		mAnimCmd6 0x0 0xFDF5E3E9
		.4byte	4, 2

		mGetTiles 0x16F55 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	3, 3

		mGetTiles 0x16F69 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 4

		mGetTiles 0x16F75 20
		mAnimCmd6 0x0 0xFD13E307
		.4byte	2, 5

		mGetTiles 0x16F89 24
		mAnimCmd6 0x0 0xFD15E309
		.4byte	4, 6

		mGetTiles 0x16FA1 20
		mAnimCmd6 0x0 0xFD0FE303
		.4byte	3, 7

		mGetTiles 0x16F21 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 0

		mGetTiles 0x16F2D 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	2, 1

		mGetTiles 0x16F41 20
		mAnimCmd6 0x0 0xFDF5E3E9
		.4byte	4, 2

		mGetTiles 0x16F55 20
		mAnimCmd6 0x0 0xFDFBE3EF
		.4byte	3, 3

		mGetTiles 0x16F69 12
		mAnimCmd6 0x0 0xFD07E3FB
		.4byte	2, 4

		mAnimCmd4 


.align 2, 0
	anim_0428:
		.4byte anim_data__0428_0




.align 2, 0
	anim_data__0429_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x16FB5 24
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 0

		mGetTiles 0x16FCD 24
		.4byte	2, 1

		mGetTiles 0x16FE5 30
		.4byte	2, 2

		mGetTiles 0x17003 24
		.4byte	2, 3

		mGetTiles 0x1701B 18
		.4byte	2, 4

		mGetTiles 0x1702D 24
		.4byte	2, 5

		mGetTiles 0x17045 24
		.4byte	2, 6

		mGetTiles 0x1705D 24
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0429_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17075 20
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	2, 8

		mGetTiles 0x17089 20
		.4byte	3, 9

		mGetTiles 0x1709D 20
		.4byte	3, 10

		mGetTiles 0x170B1 20
		.4byte	3, 11

		mGetTiles 0x170C5 25
		.4byte	3, 12

		mAnimCmd4 

	anim_data__0429_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x170DE 24
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	3, 13

		mGetTiles 0x170F6 24
		.4byte	3, 14

		mGetTiles 0x1710E 24
		.4byte	3, 15

		mJumpBack 0x15


.align 2, 0
	anim_0429:
		.4byte anim_data__0429_0
		.4byte anim_data__0429_1
		.4byte anim_data__0429_2




.align 2, 0
	anim_data__0430_0:
		mGetPalette 0x22 16 0x0
		mGetTiles 0x17126 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	3, 0

		mGetTiles 0x1713A 20
		.4byte	3, 1

		mGetTiles 0x1714E 20
		.4byte	3, 2

		mJumpBack 0x15

	anim_data__0430_1:
		mGetPalette 0x22 16 0x0
		mGetTiles 0x17162 20
		mAnimCmd6 0x0 0x806EEFA
		.4byte	3, 3

		mGetTiles 0x17176 20
		.4byte	3, 4

		mGetTiles 0x1718A 20
		.4byte	3, 5

		mGetTiles 0x1719E 24
		.4byte	3, 6

		mGetTiles 0x171B6 20
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0430_2:
		mGetPalette 0x22 16 0x0
		mGetTiles 0x171CA 25
		mAnimCmd6 0x0 0xA06F0FA
		.4byte	3, 8

		mGetTiles 0x171E3 30
		.4byte	3, 9

		mGetTiles 0x17201 25
		.4byte	3, 10

		mJumpBack 0x15


.align 2, 0
	anim_0430:
		.4byte anim_data__0430_0
		.4byte anim_data__0430_1
		.4byte anim_data__0430_2




.align 2, 0
	anim_data__0431_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1721A 25
		mAnimCmd6 0x0 0x1206F8FA
		.4byte	5, 0

		mGetTiles 0x17233 20
		.4byte	5, 1

		mGetTiles 0x17247 20
		.4byte	5, 2

		mGetTiles 0x1725B 16
		.4byte	5, 3

		mGetTiles 0x1726B 25
		.4byte	5, 4

		mGetTiles 0x17284 20
		.4byte	5, 5

		mGetTiles 0x17298 20
		.4byte	5, 6

		mGetTiles 0x172AC 20
		.4byte	5, 7

		mJumpBack 0x2E


.align 2, 0
	anim_0431:
		.4byte anim_data__0431_0




.align 2, 0
	anim_data__0432_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x172C0 20
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0432_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x172D4 15
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0432_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x172E3 12
		mAnimCmd6 0x0 0x1006F6FA
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0432_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x172EF 16
		mAnimCmd6 0x0 0x1406FAFA
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0432_4:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x172FF 20
		mAnimCmd6 0x0 0x1406FAFA
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0432_5:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17313 20
		mAnimCmd6 0x0 0x1606FCFA
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0432_6:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17327 16
		mAnimCmd6 0x0 0x1406FAFA
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0432_7:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17337 16
		mAnimCmd6 0x0 0x1406FAFA
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0432_8:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17347 20
		mAnimCmd6 0x0 0x1206F8FA
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0432_9:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1735B 25
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0432_10:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17374 20
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17388 20
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	2, 0

		mGetTiles 0x1739C 20
		.4byte	2, 1

		mGetTiles 0x173B0 20
		.4byte	2, 2

		mGetTiles 0x173C4 20
		.4byte	2, 3

		mGetTiles 0x173D8 20
		.4byte	2, 4

		mGetTiles 0x173EC 20
		.4byte	2, 5

		mGetTiles 0x17400 20
		.4byte	2, 6

		mGetTiles 0x17414 20
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0433_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17428 20
		mAnimCmd6 0x0 0xE06F4FA
		.4byte	2, 8

		mGetTiles 0x1743C 20
		.4byte	2, 9

		mGetTiles 0x17450 20
		.4byte	2, 10

		mGetTiles 0x17464 20
		.4byte	2, 11

		mGetTiles 0x17478 20
		.4byte	2, 12

		mGetTiles 0x1748C 20
		.4byte	2, 13

		mGetTiles 0x174A0 20
		.4byte	2, 14

		mGetTiles 0x174B4 20
		.4byte	2, 15

		mJumpBack 0x2E


.align 2, 0
	anim_0433:
		.4byte anim_data__0433_0
		.4byte anim_data__0433_1




.align 2, 0
	anim_data__0434_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x174C8 16
		mAnimCmd6 0x0 0xA0AF6F6
		mAnimCmd6 0x1 0xA0AF6F6
		.4byte	2, 0

		mGetTiles 0x174D8 16
		.4byte	2, 1

		mGetTiles 0x174E8 16
		.4byte	2, 2

		mGetTiles 0x174F8 16
		.4byte	2, 3

		mGetTiles 0x17508 16
		.4byte	2, 4

		mGetTiles 0x17518 16
		.4byte	2, 5

		mGetTiles 0x17528 16
		.4byte	2, 6

		mGetTiles 0x17538 16
		.4byte	2, 7

		mJumpBack 0x31


.align 2, 0
	anim_0434:
		.4byte anim_data__0434_0




.align 2, 0
	anim_data__0435_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17548 25
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	2, 0

		mGetTiles 0x17561 25
		.4byte	2, 1

		mGetTiles 0x1757A 25
		.4byte	2, 2

		mGetTiles 0x17593 20
		.4byte	2, 3

		mGetTiles 0x175A7 25
		.4byte	2, 4

		mGetTiles 0x175C0 25
		.4byte	2, 5

		mGetTiles 0x175D9 25
		.4byte	2, 6

		mGetTiles 0x175F2 16
		.4byte	2, 7

		mJumpBack 0x2E

	anim_data__0435_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17602 24
		mAnimCmd6 0x0 0xC06F2FA
		.4byte	3, 8

		mGetTiles 0x1761A 18
		.4byte	3, 9

		mGetTiles 0x1762C 18
		.4byte	3, 10

		mGetTiles 0x1763E 15
		.4byte	3, 11

		mGetTiles 0x1762C 18
		.4byte	3, 10

		mGetTiles 0x1761A 18
		.4byte	3, 9

		mJumpBack 0x24


.align 2, 0
	anim_0435:
		.4byte anim_data__0435_0
		.4byte anim_data__0435_1




.align 2, 0
	anim_data__0436_0:
		mGetPalette 0x23 16 0x0
		mGetTiles 0x1764D 18
		mAnimCmd6 0x0 0xA0BF0FE
		.4byte	3, 0

		mGetTiles 0x1765F 24
		mAnimCmd6 0x0 0xA00F0F4
		.4byte	3, 1

		mGetTiles 0x17677 30
		mAnimCmd6 0x0 0xAFAF0EC
		.4byte	3, 2

		mGetTiles 0x17695 24
		mAnimCmd6 0x0 0xAFEF0F0
		.4byte	3, 3

		mGetTiles 0x176AD 18
		mAnimCmd6 0x0 0xA04F0F8
		.4byte	3, 4

		mGetTiles 0x176BF 24
		mAnimCmd6 0x0 0xA12F004
		.4byte	3, 5

		mGetTiles 0x176D7 30
		mAnimCmd6 0x0 0xA13F004
		.4byte	3, 6

		mGetTiles 0x176F5 24
		mAnimCmd6 0x0 0xA12F002
		.4byte	3, 7

		mJumpBack 0x43


.align 2, 0
	anim_0436:
		.4byte anim_data__0436_0




.align 2, 0
	anim_data__0437_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1770D 16
		mAnimCmd6 0x0 0x1006F4FA
		.4byte	3, 0

		mGetTiles 0x1771D 16
		.4byte	3, 1

		mGetTiles 0x1772D 16
		.4byte	3, 2

		mGetTiles 0x1773D 16
		.4byte	3, 3

		mGetTiles 0x1774D 16
		.4byte	3, 4

		mGetTiles 0x1775D 16
		.4byte	3, 5

		mGetTiles 0x1776D 16
		.4byte	3, 6

		mGetTiles 0x1777D 16
		.4byte	3, 7

		mJumpBack 0x2E

	anim_data__0437_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1778D 20
		mAnimCmd6 0x0 0xA06F6FA
		.4byte	3, 8

		mGetTiles 0x177A1 20
		.4byte	3, 9

		mGetTiles 0x177B5 20
		.4byte	3, 10

		mGetTiles 0x177C9 20
		.4byte	3, 11

		mGetTiles 0x177DD 20
		.4byte	3, 12

		mGetTiles 0x177F1 20
		.4byte	3, 13

		mGetTiles 0x17805 20
		.4byte	3, 14

		mGetTiles 0x17819 20
		.4byte	3, 15

		mJumpBack 0x2E

	anim_data__0437_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1782D 20
		mAnimCmd6 0x0 0xA06EEFA
		.4byte	3, 16

		mGetTiles 0x17841 20
		.4byte	3, 17

		mGetTiles 0x17855 20
		.4byte	3, 18

		mGetTiles 0x17869 20
		.4byte	3, 19

		mGetTiles 0x1787D 20
		.4byte	3, 20

		mGetTiles 0x17891 20
		.4byte	3, 21

		mGetTiles 0x178A5 20
		.4byte	3, 22

		mGetTiles 0x178B9 20
		.4byte	3, 23

		mJumpBack 0x2E


.align 2, 0
	anim_0437:
		.4byte anim_data__0437_0
		.4byte anim_data__0437_1
		.4byte anim_data__0437_2




.align 2, 0
	anim_data__0438_0:
		mGetPalette 0x24 16 0x10
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0438:
		.4byte anim_data__0438_0




.align 2, 0
	anim_data__0439_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x178CD 64
		mAnimCmd6 0x0 0x1306FDFA
		.4byte	2, 0

		mGetTiles 0x1790D 64
		.4byte	2, 1

		mGetTiles 0x1794D 64
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0439:
		.4byte anim_data__0439_0




.align 2, 0
	anim_data__0449_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x1798D 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0449_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x179A1 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0449:
		.4byte anim_data__0449_0
		.4byte anim_data__0449_1




.align 2, 0
	anim_data__0450_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x179B5 20
		.4byte	3, 0

		mGetTiles 0x179C9 20
		.4byte	3, 1

		mGetTiles 0x179DD 16
		.4byte	3, 2

		mGetTiles 0x179ED 20
		.4byte	3, 3

		mGetTiles 0x17A01 25
		.4byte	3, 4

		mGetTiles 0x17A1A 16
		.4byte	3, 5

		mJumpBack 0x21

	anim_data__0450_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17A2A 15
		.4byte	3, 6

		mGetTiles 0x17A39 20
		.4byte	3, 7

		mGetTiles 0x17A4D 20
		.4byte	3, 8

		mGetTiles 0x17A61 20
		.4byte	3, 9

		mGetTiles 0x17A75 20
		.4byte	3, 10

		mGetTiles 0x17A89 20
		.4byte	3, 11

		mJumpBack 0x21

	anim_data__0450_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17A9D 16
		.4byte	3, 12

		mGetTiles 0x17AAD 16
		.4byte	3, 13

		mGetTiles 0x17ABD 16
		.4byte	3, 14

		mGetTiles 0x17ACD 16
		.4byte	3, 15

		mGetTiles 0x17ADD 16
		.4byte	3, 16

		mGetTiles 0x17AED 16
		.4byte	3, 17

		mJumpBack 0x21

	anim_data__0450_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17AFD 16
		.4byte	3, 18

		mGetTiles 0x17B0D 20
		.4byte	3, 19

		mGetTiles 0x17B21 16
		.4byte	3, 20

		mGetTiles 0x17B31 16
		.4byte	3, 21

		mGetTiles 0x17B41 20
		.4byte	3, 22

		mGetTiles 0x17B55 16
		.4byte	3, 23

		mJumpBack 0x21


.align 2, 0
	anim_0450:
		.4byte anim_data__0450_0
		.4byte anim_data__0450_1
		.4byte anim_data__0450_2
		.4byte anim_data__0450_3




.align 2, 0
	anim_data__0451_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17B65 36
		.4byte	2, 0

		mGetTiles 0x17B89 25
		.4byte	2, 1

		mJumpBack 0xD

	anim_data__0451_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17BA2 16
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0451_2:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17BB2 25
		.4byte	2, 3

		mGetTiles 0x17BCB 25
		.4byte	2, 4

		mJumpBack 0xD

	anim_data__0451_3:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17BE4 20
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0451:
		.4byte anim_data__0451_0
		.4byte anim_data__0451_1
		.4byte anim_data__0451_2
		.4byte anim_data__0451_3




.align 2, 0
	anim_data__0452_0:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17BF8 16
		.4byte	6, 0

		mGetTiles 0x17C08 24
		.4byte	6, 1

		mGetTiles 0x17C20 20
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0452_1:
		mGetPalette 0x1B 16 0x0
		mGetTiles 0x17C34 16
		.4byte	6, 3

		mGetTiles 0x17C44 20
		.4byte	6, 4

		mGetTiles 0x17C58 25
		.4byte	6, 5

		mAnimCmd4 


.align 2, 0
	anim_0452:
		.4byte anim_data__0452_0
		.4byte anim_data__0452_1




.align 2, 0
	anim_data__0453_0:
		mGetPalette 0x25 16 0x0
		mGetTiles 0x17C71 16
		.4byte	2, 0

		mGetTiles 0x17C81 16
		.4byte	2, 1

		mGetTiles 0x17C91 16
		.4byte	2, 2

		mGetTiles 0x17CA1 16
		.4byte	2, 3

		mGetTiles 0x17CB1 16
		.4byte	2, 4

		mGetTiles 0x17CC1 16
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0453:
		.4byte anim_data__0453_0




.align 2, 0
	anim_data__0454_0:
		mGetPalette 0x26 16 0x0
		mGetTiles 0x17CD1 20
		.4byte	2, 0

		mGetTiles 0x17CE5 15
		.4byte	2, 1

		mGetTiles 0x17CF4 15
		.4byte	2, 2

		mGetTiles 0x17D03 15
		.4byte	2, 3

		mGetTiles 0x17D12 15
		.4byte	3, 4

		mGetTiles 0x17D21 20
		.4byte	3, 5

		mGetTiles 0x17D35 15
		.4byte	3, 6

		mGetTiles 0x17D44 15
		.4byte	3, 7

		mGetTiles 0x17D53 15
		.4byte	3, 8

		mGetTiles 0x17D62 15
		.4byte	3, 9

		mGetTiles 0x17D71 20
		.4byte	3, 10

		mAnimCmd4 


.align 2, 0
	anim_0454:
		.4byte anim_data__0454_0




.align 2, 0
	anim_data__0455_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17D85 9
		.4byte	9, 0

		mGetTiles 0x17D8E 9
		.4byte	9, 1

		mGetTiles 0x17D97 9
		.4byte	9, 2

		mGetTiles 0x17DA0 9
		.4byte	9, 3

		mGetTiles 0x17DA9 9
		.4byte	9, 4

		mGetTiles 0x17DB2 9
		.4byte	9, 5

		mGetTiles 0x17D97 9
		.4byte	9, 2

		mGetTiles 0x17DBB 9
		.4byte	9, 6

		mJumpBack 0x2B


.align 2, 0
	anim_0455:
		.4byte anim_data__0455_0




.align 2, 0
	anim_data__0456_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17DC4 9
		.4byte	3, 0

		mGetTiles 0x17DCD 9
		.4byte	3, 1

		mJumpBack 0xD


.align 2, 0
	anim_0456:
		.4byte anim_data__0456_0




.align 2, 0
	anim_data__0457_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17DD6 9
		.4byte	3, 0

		mGetTiles 0x17DDF 9
		.4byte	3, 1

		mGetTiles 0x17DE8 6
		.4byte	3, 2

		mGetTiles 0x17DEE 6
		.4byte	3, 3

		mGetTiles 0x17DF4 6
		.4byte	3, 4

		mGetTiles 0x17DFA 9
		.4byte	3, 5

		mGetTiles 0x17E03 6
		.4byte	3, 6

		mGetTiles 0x17E09 6
		.4byte	3, 7

		mAnimCmd4 

	anim_data__0457_1:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17E0F 9
		mAnimCmd6 0x1 0x80DEEF3
		.4byte	2, 8

		mGetTiles 0x17E18 9
		.4byte	2, 9

		mJumpBack 0x10


.align 2, 0
	anim_0457:
		.4byte anim_data__0457_0
		.4byte anim_data__0457_1




.align 2, 0
	anim_data__0458_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17E21 9
		.4byte	5, 0

		mGetTiles 0x17E2A 9
		.4byte	5, 1

		mGetTiles 0x17E33 9
		.4byte	5, 2

		mGetTiles 0x17E3C 9
		.4byte	5, 3

		mGetTiles 0x17E45 9
		.4byte	5, 4

		mGetTiles 0x17E4E 9
		.4byte	5, 5

		mGetTiles 0x17E57 9
		.4byte	5, 6

		mGetTiles 0x17E60 9
		.4byte	5, 7

		mGetTiles 0x17E69 9
		.4byte	5, 8

		mGetTiles 0x17E72 9
		.4byte	5, 9

		mGetTiles 0x17E7B 9
		.4byte	5, 10

		mGetTiles 0x17E84 9
		.4byte	5, 11

		mGetTiles 0x17E8D 9
		.4byte	5, 12

		mGetTiles 0x17E96 9
		.4byte	5, 13

		mJumpBack 0x49


.align 2, 0
	anim_0458:
		.4byte anim_data__0458_0




.align 2, 0
	anim_data__0459_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17E9F 9
		.4byte	3, 0

		mGetTiles 0x17EA8 9
		.4byte	3, 1

		mGetTiles 0x17EB1 9
		.4byte	3, 2

		mGetTiles 0x17EBA 9
		.4byte	3, 3

		mGetTiles 0x17EC3 9
		.4byte	3, 4

		mGetTiles 0x17ECC 9
		.4byte	3, 5

		mGetTiles 0x17ED5 9
		.4byte	3, 6

		mGetTiles 0x17EDE 9
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0459:
		.4byte anim_data__0459_0




.align 2, 0
	anim_data__0460_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17EE7 9
		.4byte	6, 0

		mGetTiles 0x17EF0 9
		.4byte	6, 1

		mGetTiles 0x17EF9 9
		.4byte	6, 2

		mGetTiles 0x17F02 9
		.4byte	6, 3

		mGetTiles 0x17F0B 9
		.4byte	6, 4

		mGetTiles 0x17F14 9
		.4byte	6, 5

		mGetTiles 0x17F1D 9
		.4byte	6, 6

		mGetTiles 0x17F26 9
		.4byte	6, 7

		mGetTiles 0x17F2F 9
		.4byte	6, 8

		mGetTiles 0x17F38 9
		.4byte	6, 9

		mGetTiles 0x17F41 9
		.4byte	6, 10

		mGetTiles 0x17F38 9
		.4byte	6, 9

		mJumpBack 0x14

	anim_data__0460_1:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17F4A 9
		.4byte	6, 11

		mGetTiles 0x17F53 9
		.4byte	6, 12

		mGetTiles 0x17F5C 9
		.4byte	6, 13

		mGetTiles 0x17F53 9
		.4byte	6, 12

		mJumpBack 0x17


.align 2, 0
	anim_0460:
		.4byte anim_data__0460_0
		.4byte anim_data__0460_1




.align 2, 0
	anim_data__0461_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17F65 9
		.4byte	3, 0

		mGetTiles 0x17F6E 9
		.4byte	3, 1

		mGetTiles 0x17F77 9
		.4byte	3, 2

		mGetTiles 0x17F6E 9
		.4byte	3, 1

		mJumpBack 0x17


.align 2, 0
	anim_0461:
		.4byte anim_data__0461_0




.align 2, 0
	anim_data__0462_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x17F80 9
		.4byte	4, 0

		mGetTiles 0x17F89 9
		.4byte	4, 1

		mGetTiles 0x17F92 9
		.4byte	4, 2

		mGetTiles 0x17F9B 9
		.4byte	4, 3

		mGetTiles 0x17FA4 9
		.4byte	4, 4

		mGetTiles 0x17FAD 9
		.4byte	4, 5

		mGetTiles 0x17FB6 9
		.4byte	4, 6

		mGetTiles 0x17FBF 9
		.4byte	4, 7

		mGetTiles 0x17FC8 9
		.4byte	4, 8

		mGetTiles 0x17FD1 9
		.4byte	4, 9

		mGetTiles 0x17FDA 9
		.4byte	4, 10

		mGetTiles 0x17FE3 9
		.4byte	4, 11

		mGetTiles 0x17FEC 9
		.4byte	4, 12

		mGetTiles 0x17FF5 9
		.4byte	4, 13

		mGetTiles 0x17FFE 9
		.4byte	4, 14

		mGetTiles 0x18007 9
		.4byte	4, 15

		mGetTiles 0x18010 9
		.4byte	4, 16

		mGetTiles 0x18019 9
		.4byte	4, 17

		mJumpBack 0x5D


.align 2, 0
	anim_0462:
		.4byte anim_data__0462_0




.align 2, 0
	anim_data__0463_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18022 6
		.4byte	1, 0

		mGetTiles 0x18028 6
		.4byte	1, 1

		mGetTiles 0x1802E 6
		.4byte	1, 2

		mGetTiles 0x18034 6
		.4byte	1, 3

		mGetTiles 0x1803A 6
		.4byte	1, 4

		mGetTiles 0x18040 6
		.4byte	1, 5

		mGetTiles 0x18046 9
		.4byte	1, 6

		mGetTiles 0x1804F 9
		.4byte	1, 7

		mGetTiles 0x18058 9
		.4byte	1, 8

		mGetTiles 0x18061 9
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0463_1:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x1806A 9
		.4byte	4, 10

		mGetTiles 0x18073 9
		.4byte	6, 11

		mGetTiles 0x1807C 9
		.4byte	4, 12

		mGetTiles 0x18085 6
		.4byte	4, 13

		mGetTiles 0x1808B 6
		.4byte	4, 14

		mGetTiles 0x18091 6
		.4byte	4, 15

		mGetTiles 0x18091 6
		.4byte	4, 15

		mGetTiles 0x18091 6
		.4byte	4, 15

		mGetTiles 0x18097 6
		.4byte	4, 16

		mGetTiles 0x1809D 6
		.4byte	4, 17

		mGetTiles 0x180A3 6
		.4byte	4, 18

		mGetTiles 0x180A9 6
		.4byte	8, 19

		mGetTiles 0x180AF 9
		.4byte	4, 20

		mGetTiles 0x180B8 9
		.4byte	4, 21

		mGetTiles 0x180C1 9
		.4byte	4, 22

		mGetTiles 0x180CA 9
		.4byte	6, 23

		mGetTiles 0x180D3 9
		.4byte	4, 24

		mGetTiles 0x180DC 9
		.4byte	4, 25

		mGetTiles 0x180E5 9
		.4byte	4, 26

		mGetTiles 0x180EE 9
		.4byte	4, 27

		mGetTiles 0x180F7 9
		.4byte	4, 28

		mGetTiles 0x18100 9
		.4byte	16, 29

		mAnimCmd4 


.align 2, 0
	anim_0463:
		.4byte anim_data__0463_0
		.4byte anim_data__0463_1




.align 2, 0
	anim_data__0464_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18109 9
		.4byte	6, 0

		mGetTiles 0x18112 9
		.4byte	6, 1

		mGetTiles 0x1811B 9
		.4byte	6, 2

		mGetTiles 0x18124 9
		.4byte	6, 3

		mGetTiles 0x1812D 9
		.4byte	6, 4

		mGetTiles 0x18136 9
		.4byte	6, 5

		mGetTiles 0x1813F 9
		.4byte	26, 6

		mGetTiles 0x18148 6
		.4byte	4, 7

		mGetTiles 0x1814E 6
		.4byte	4, 8

		mGetTiles 0x18154 9
		.4byte	4, 9

		mGetTiles 0x1815D 9
		.4byte	4, 10

		mGetTiles 0x18166 6
		.4byte	6, 11

		mGetTiles 0x1816C 6
		.4byte	3, 12

		mGetTiles 0x18172 6
		.4byte	3, 13

		mGetTiles 0x18178 6
		.4byte	3, 14

		mGetTiles 0x1817E 6
		.4byte	3, 15

		mGetTiles 0x1816C 6
		.4byte	3, 12

		mGetTiles 0x18172 6
		.4byte	3, 13

		mGetTiles 0x18184 6
		.4byte	3, 16

		mGetTiles 0x1818A 6
		.4byte	3, 17

		mGetTiles 0x18190 6
		.4byte	3, 18

		mGetTiles 0x18196 6
		.4byte	6, 19

		mGetTiles 0x1819C 6
		.4byte	4, 20

		mGetTiles 0x181A2 6
		.4byte	4, 21

		mGetTiles 0x181A8 6
		.4byte	8, 22

		mGetTiles 0x181AE 9
		.4byte	2, 23

		mGetTiles 0x181B7 9
		.4byte	2, 24

		mGetTiles 0x181C0 9
		.4byte	5, 25

		mGetTiles 0x181C9 9
		.4byte	3, 26

		mGetTiles 0x181D2 9
		.4byte	3, 27

		mGetTiles 0x181DB 6
		.4byte	14, 28

		mGetTiles 0x181E1 6
		.4byte	3, 29

		mGetTiles 0x181E7 6
		.4byte	3, 30

		mGetTiles 0x181ED 6
		.4byte	4, 31

		mGetTiles 0x181F3 6
		.4byte	2, 32

		mGetTiles 0x181F9 6
		.4byte	2, 33

		mGetTiles 0x181FF 6
		.4byte	2, 34

		mAnimCmd4 


.align 2, 0
	anim_0464:
		.4byte anim_data__0464_0




.align 2, 0
	anim_data__0465_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18205 9
		.4byte	3, 0

		mGetTiles 0x1820E 9
		.4byte	3, 1

		mGetTiles 0x18217 9
		.4byte	3, 2

		mGetTiles 0x1820E 9
		.4byte	3, 1

		mJumpBack 0x17


.align 2, 0
	anim_0465:
		.4byte anim_data__0465_0




.align 2, 0
	anim_data__0466_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18220 9
		.4byte	4, 0

		mGetTiles 0x18229 9
		.4byte	4, 1

		mGetTiles 0x18232 9
		.4byte	4, 2

		mGetTiles 0x1823B 9
		.4byte	4, 3

		mJumpBack 0x17


.align 2, 0
	anim_0466:
		.4byte anim_data__0466_0




.align 2, 0
	anim_data__0467_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18244 6
		.4byte	3, 0

		mGetTiles 0x1824A 6
		.4byte	3, 1

		mGetTiles 0x18250 6
		.4byte	3, 2

		mGetTiles 0x18256 6
		.4byte	3, 3

		mGetTiles 0x1825C 6
		.4byte	3, 4

		mGetTiles 0x18262 6
		.4byte	3, 5

		mGetTiles 0x18268 6
		.4byte	3, 6

		mGetTiles 0x1826E 6
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0467:
		.4byte anim_data__0467_0




.align 2, 0
	anim_data__0468_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x18274 6
		.4byte	4, 0

		mGetTiles 0x1827A 6
		.4byte	4, 1

		mGetTiles 0x18280 6
		.4byte	4, 2

		mGetTiles 0x18286 6
		.4byte	4, 3

		mGetTiles 0x18280 6
		.4byte	4, 2

		mGetTiles 0x1827A 6
		.4byte	4, 1

		mJumpBack 0x21


.align 2, 0
	anim_0468:
		.4byte anim_data__0468_0




.align 2, 0
	anim_data__0469_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x1828C 4
		.4byte	4, 0

		mGetTiles 0x18290 4
		.4byte	5, 1

		mGetTiles 0x18294 4
		.4byte	5, 2

		mGetTiles 0x18298 4
		.4byte	8, 3

		mGetTiles 0x1829C 4
		.4byte	8, 4

		mGetTiles 0x182A0 4
		.4byte	8, 5

		mGetTiles 0x182A4 4
		.4byte	8, 6

		mGetTiles 0x182A8 4
		.4byte	8, 7

		mGetTiles 0x182AC 4
		.4byte	8, 8

		mJumpBack 0x1E


.align 2, 0
	anim_0469:
		.4byte anim_data__0469_0




.align 2, 0
	anim_data__0470_0:
		mGetPalette 0x27 16 0xE0
		mGetTiles 0x182B0 9
		.4byte	5, 0

		mGetTiles 0x182B9 9
		.4byte	5, 1

		mGetTiles 0x182C2 9
		.4byte	5, 2

		mGetTiles 0x182CB 9
		.4byte	5, 3

		mGetTiles 0x182D4 9
		.4byte	5, 4

		mGetTiles 0x182DD 9
		.4byte	5, 5

		mGetTiles 0x182E6 9
		.4byte	5, 6

		mGetTiles 0x182CB 9
		.4byte	5, 3

		mGetTiles 0x182EF 9
		.4byte	5, 7

		mGetTiles 0x182F8 9
		.4byte	5, 8

		mJumpBack 0x28


.align 2, 0
	anim_0470:
		.4byte anim_data__0470_0




.align 2, 0
	anim_data__0471_0:
		mGetPalette 0x1 16 0x0
		mGetTiles 0x18301 20
		.4byte	4, 0

		mGetTiles 0x18315 20
		.4byte	4, 1

		mGetTiles 0x18329 20
		.4byte	4, 2

		mAnimCmd4 


.align 2, 0
	anim_0471:
		.4byte anim_data__0471_0




.align 2, 0
	anim_data__0472_0:
		mGetPalette 0x1 16 0x0
		mGetTiles 0x1833D 16
		.4byte	4, 0

		mGetTiles 0x1834D 16
		.4byte	10, 1

		mGetTiles 0x1835D 16
		.4byte	2, 2

		mGetTiles 0x1833D 16
		.4byte	4, 0

		mGetTiles 0x1836D 20
		.4byte	3, 3

		mGetTiles 0x18381 20
		.4byte	3, 4

		mGetTiles 0x18395 24
		.4byte	3, 5

		mGetTiles 0x183AD 24
		.4byte	3, 6

		mGetPalette 0x28 16 0x0
		mGetTiles 0x183C5 24
		.4byte	3, 7

		mGetPalette 0x29 16 0x0
		mGetTiles 0x183DD 24
		.4byte	3, 8

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x183F5 24
		.4byte	1, 9

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x1840D 24
		.4byte	1, 10

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18425 24
		.4byte	1, 11

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x1843D 24
		.4byte	1, 12

		mJumpBack 0x20

	anim_data__0472_1:
		mGetPalette 0x2C 16 0x50
		mGetTiles 0x18455 36
		.4byte	3, 13

		mGetTiles 0x18479 56
		.4byte	3, 14

		mJumpBack 0xD


.align 2, 0
	anim_0472:
		.4byte anim_data__0472_0
		.4byte anim_data__0472_1




.align 2, 0
	anim_data__0473_0:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x184B1 24
		mAnimCmd6 0x0 0x60DF6F2
		mAnimCmd6 0x1 0x60DF6F2
		.4byte	2, 0

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x184C9 24
		.4byte	2, 1

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x184E1 24
		.4byte	2, 2

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x184F9 24
		.4byte	2, 3

		mJumpBack 0x26

	anim_data__0473_1:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18511 24
		mAnimCmd6 0x0 0x60DF6F2
		mAnimCmd6 0x1 0xB03F1EC
		.4byte	2, 4

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x18529 24
		.4byte	2, 5

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18541 24
		.4byte	2, 6

		mGetPalette 0x2B 16 0x30
		mGetTiles 0x18559 24
		.4byte	2, 7

		mJumpBack 0x26

	anim_data__0473_2:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18571 64
		.4byte	1, 8

		mAnimCmd4 


.align 2, 0
	anim_0473:
		.4byte anim_data__0473_0
		.4byte anim_data__0473_1
		.4byte anim_data__0473_2




.align 2, 0
	anim_data__0474_0:
		mGetPalette 0x2D 16 0x20
		mGetTiles 0x185B1 40
		.4byte	2, 0

		mGetTiles 0x185D9 40
		.4byte	2, 1

		mGetTiles 0x18601 40
		.4byte	2, 2

		mGetTiles 0x18629 40
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0474_1:
		mGetPalette 0x2D 16 0x20
		mGetTiles 0x18651 40
		.4byte	3, 4

		mGetTiles 0x18679 40
		.4byte	3, 5

		mGetTiles 0x186A1 40
		.4byte	3, 6

		mAnimCmd4 


.align 2, 0
	anim_0474:
		.4byte anim_data__0474_0
		.4byte anim_data__0474_1




.align 2, 0
	anim_data__0475_0:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x186C9 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0475_1:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18709 24
		mAnimCmd6 0x0 0x60BFAEF
		.4byte	2, 1

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x18721 24
		.4byte	2, 2

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18739 24
		.4byte	2, 3

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x18751 24
		.4byte	2, 4

		mJumpBack 0x23

	anim_data__0475_2:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18769 24
		mAnimCmd6 0x0 0x60BFAEF
		.4byte	2, 5

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x18781 24
		.4byte	2, 6

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x18799 24
		.4byte	2, 7

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x187B1 24
		.4byte	2, 8

		mJumpBack 0x23

	anim_data__0475_3:
		mGetPalette 0x2A 16 0x0
		mGetTiles 0x187C9 24
		mAnimCmd6 0x0 0x60BFAEF
		.4byte	2, 9

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x187E1 24
		.4byte	2, 10

		mGetPalette 0x2A 16 0x0
		mGetTiles 0x187F9 24
		.4byte	2, 11

		mGetPalette 0x2B 16 0x0
		mGetTiles 0x18811 24
		.4byte	2, 12

		mJumpBack 0x23

	anim_data__0475_4:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18829 48
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0xD00F3E7
		.4byte	2, 13

		mGetTiles 0x18859 48
		.4byte	2, 14

		mGetTiles 0x18889 48
		.4byte	2, 15

		mGetTiles 0x188B9 48
		.4byte	2, 16

		mJumpBack 0x1D

	anim_data__0475_5:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x188E9 48
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0xD00F3E7
		.4byte	2, 17

		mGetTiles 0x18919 48
		.4byte	2, 18

		mGetTiles 0x18949 48
		.4byte	2, 19

		mGetTiles 0x18979 24
		.4byte	2, 20

		mAnimCmd4 

	anim_data__0475_6:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18991 49
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0x1405FAEC
		.4byte	2, 21

		mGetTiles 0x189C2 49
		.4byte	2, 22

		mGetTiles 0x189F3 49
		.4byte	2, 23

		mGetTiles 0x18A24 49
		.4byte	2, 24

		mJumpBack 0x1D

	anim_data__0475_7:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18A55 49
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0x1405FAEC
		.4byte	2, 25

		mGetTiles 0x18A86 56
		.4byte	2, 26

		mGetTiles 0x18ABE 49
		.4byte	2, 27

		mGetTiles 0x18AEF 30
		.4byte	2, 28

		mAnimCmd4 

	anim_data__0475_8:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18B0D 48
		mAnimCmd6 0x0 0x910F8F4
		mAnimCmd6 0x1 0x190CFFF3
		.4byte	2, 29

		mGetTiles 0x18B3D 48
		.4byte	2, 30

		mGetTiles 0x18B6D 48
		.4byte	2, 31

		mGetTiles 0x18B9D 48
		.4byte	2, 32

		mJumpBack 0x1D

	anim_data__0475_9:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18BCD 48
		mAnimCmd6 0x0 0x910F8F4
		mAnimCmd6 0x1 0x190CFFF3
		.4byte	2, 33

		mGetTiles 0x18BFD 48
		.4byte	2, 34

		mGetTiles 0x18C2D 48
		.4byte	2, 35

		mGetTiles 0x18C5D 24
		.4byte	2, 36

		mAnimCmd4 

	anim_data__0475_10:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18C75 49
		mAnimCmd6 0x0 0x811F7F5
		mAnimCmd6 0x1 0x1413FAFA
		.4byte	2, 37

		mGetTiles 0x18CA6 49
		.4byte	2, 38

		mGetTiles 0x18CD7 49
		.4byte	2, 39

		mGetTiles 0x18D08 49
		.4byte	2, 40

		mJumpBack 0x1D

	anim_data__0475_11:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18D39 49
		mAnimCmd6 0x0 0x811F7F5
		mAnimCmd6 0x1 0x1413FAFA
		.4byte	2, 41

		mGetTiles 0x18D6A 56
		.4byte	2, 42

		mGetTiles 0x18DA2 49
		.4byte	2, 43

		mGetTiles 0x18DD3 30
		.4byte	2, 44

		mAnimCmd4 

	anim_data__0475_12:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18DF1 48
		mAnimCmd6 0x0 0x914F8F8
		mAnimCmd6 0x1 0xD19F300
		.4byte	2, 45

		mGetTiles 0x18E21 48
		.4byte	2, 46

		mGetTiles 0x18E51 48
		.4byte	2, 47

		mGetTiles 0x18E81 48
		.4byte	2, 48

		mJumpBack 0x1D

	anim_data__0475_13:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x18EB1 48
		mAnimCmd6 0x0 0x914F8F8
		mAnimCmd6 0x1 0xD19F300
		.4byte	2, 49

		mGetTiles 0x18EE1 48
		.4byte	2, 50

		mGetTiles 0x18F11 48
		.4byte	2, 51

		mGetTiles 0x18F41 24
		.4byte	2, 52

		mAnimCmd4 

	anim_data__0475_14:
		mGetPalette 0x2F 16 0x20
		mGetTiles 0x18F59 64
		mAnimCmd6 0x0 0x90FF8F3
		mAnimCmd6 0x1 0x613ECFA
		.4byte	2, 53

		mGetTiles 0x18F99 64
		.4byte	2, 54

		mGetTiles 0x18FD9 64
		.4byte	2, 55

		mGetTiles 0x19019 64
		.4byte	2, 56

		mJumpBack 0x1D

	anim_data__0475_15:
		mGetPalette 0x2F 16 0x20
		mGetTiles 0x19059 64
		mAnimCmd6 0x0 0x811F7F5
		mAnimCmd6 0x1 0x613ECFA
		.4byte	2, 57

		mGetTiles 0x19099 64
		.4byte	2, 58

		mGetTiles 0x190D9 64
		.4byte	2, 59

		mGetTiles 0x19119 64
		.4byte	2, 60

		mAnimCmd4 

	anim_data__0475_16:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x19159 64
		mAnimCmd6 0x0 0x30CF2F0
		mAnimCmd6 0x1 0xCE6F3
		.4byte	2, 61

		mGetTiles 0x19199 64
		.4byte	2, 62

		mGetTiles 0x191D9 64
		.4byte	2, 63

		mGetTiles 0x19219 64
		.4byte	2, 64

		mJumpBack 0x1D

	anim_data__0475_17:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x19259 64
		mAnimCmd6 0x0 0x30CF2F0
		mAnimCmd6 0x1 0xCE6F3
		.4byte	2, 65

		mGetTiles 0x19299 64
		.4byte	2, 66

		mGetTiles 0x192D9 64
		.4byte	2, 67

		mGetTiles 0x19319 64
		.4byte	2, 68

		mAnimCmd4 

	anim_data__0475_18:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x19359 64
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0x605ECEC
		.4byte	2, 69

		mGetTiles 0x19399 64
		.4byte	2, 70

		mGetTiles 0x193D9 64
		.4byte	2, 71

		mGetTiles 0x19419 64
		.4byte	2, 72

		mJumpBack 0x1D

	anim_data__0475_19:
		mGetPalette 0x2E 16 0x20
		mGetTiles 0x19459 64
		mAnimCmd6 0x0 0x80BF7EF
		mAnimCmd6 0x1 0x605ECEC
		.4byte	2, 73

		mGetTiles 0x19499 64
		.4byte	2, 74

		mGetTiles 0x194D9 64
		.4byte	2, 75

		mGetTiles 0x19519 64
		.4byte	2, 76

		mAnimCmd4 


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
		mGetPalette 0x30 16 0xB0
		mGetTiles 0x19559 30
		mAnimCmd6 0x0 0x70DF8F3
		.4byte	5, 0

		mGetTiles 0x19577 30
		.4byte	5, 1

		mGetTiles 0x19595 30
		.4byte	5, 2

		mGetTiles 0x195B3 30
		.4byte	5, 3

		mGetTiles 0x195D1 36
		.4byte	5, 4

		mGetTiles 0x195F5 36
		.4byte	5, 5

		mJumpBack 0x24

	anim_data__0476_1:
		mGetPalette 0x31 16 0xB0
		mGetTiles 0x19619 16
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0476_2:
		mGetPalette 0x31 16 0xB0
		mGetTiles 0x19629 4
		.4byte	1, 7

		mAnimCmd4 


.align 2, 0
	anim_0476:
		.4byte anim_data__0476_0
		.4byte anim_data__0476_1
		.4byte anim_data__0476_2




.align 2, 0
	anim_data__0477_0:
		mGetTiles 0x1962D 64
		mGetPalette 0x32 16 0x90
		mAnimCmd6 0x0 0xFF0EE3F1
		.4byte	6, 0

		mAnimCmd6 0x0 0xFF0EE3F1
		.4byte	6, 1

		mAnimCmd6 0x0 0xFF0EE3F1
		.4byte	6, 2

		mAnimCmd6 0x0 0xFF0EE3F1
		.4byte	6, 3

		mAnimCmd4 


.align 2, 0
	anim_0477:
		.4byte anim_data__0477_0




.align 2, 0
	anim_data__0478_0:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x1966D 20
		mAnimCmd6 0x0 0x109EBF8
		.4byte	7, 0

		mGetTiles 0x19681 20
		mAnimCmd6 0x0 0x109EBF8
		.4byte	7, 1

		mJumpBack 0x13

	anim_data__0478_1:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x19695 15
		mAnimCmd6 0x0 0xFA09DCFB
		.4byte	8, 2

		mGetTiles 0x196A4 16
		mAnimCmd6 0x0 0xEF09E0F7
		.4byte	8, 3

		mGetTiles 0x196B4 20
		mAnimCmd6 0x0 0xF40BE2F7
		.4byte	8, 4

		mGetTiles 0x196C8 25
		mAnimCmd6 0x0 0xFA09DFF9
		.4byte	8, 5

		mAnimCmd4 

	anim_data__0478_2:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x196E1 20
		mAnimCmd6 0x0 0xBF0F4
		.4byte	8, 6

		mAnimCmd4 

	anim_data__0478_3:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x196F5 20
		mAnimCmd6 0x0 0xBF0F4
		.4byte	5, 7

		mAnimCmd4 


.align 2, 0
	anim_0478:
		.4byte anim_data__0478_0
		.4byte anim_data__0478_1
		.4byte anim_data__0478_2
		.4byte anim_data__0478_3




.align 2, 0
	anim_data__0479_0:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x19709 20
		mAnimCmd6 0x0 0xB14F1FF
		.4byte	5, 0

		mGetTiles 0x1971D 20
		mAnimCmd6 0x0 0xB14F1FF
		.4byte	5, 1

		mGetTiles 0x19731 20
		mAnimCmd6 0x0 0xB14F1FF
		.4byte	5, 2

		mJumpBack 0x1B

	anim_data__0479_1:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x19745 20
		mAnimCmd6 0x0 0x814F1FF
		.4byte	5, 3

		mGetTiles 0x19759 20
		mAnimCmd6 0x0 0xA19F1FF
		.4byte	8, 4

		mGetTiles 0x1976D 20
		mAnimCmd6 0x0 0xD14F1FF
		.4byte	5, 5

		mGetTiles 0x19781 20
		mAnimCmd6 0x0 0x814F1FF
		.4byte	5, 6

		mAnimCmd4 


.align 2, 0
	anim_0479:
		.4byte anim_data__0479_0
		.4byte anim_data__0479_1




.align 2, 0
	anim_data__0480_0:
		mGetPalette 0x33 16 0xD0
		mGetTiles 0x19795 4
		mAnimCmd6 0x0 0x504FCFC
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0480:
		.4byte anim_data__0480_0




.align 2, 0
	anim_data__0481_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x19799 16
		mAnimCmd6 0x0 0xA09F9F6
		.4byte	4, 0

		mGetTiles 0x197A9 16
		mAnimCmd6 0x0 0x907FBF8
		.4byte	4, 1

		mGetTiles 0x197B9 16
		mAnimCmd6 0x0 0x606FBFB
		.4byte	4, 2

		mGetTiles 0x197C9 12
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0481:
		.4byte anim_data__0481_0




.align 2, 0
	anim_data__0482_0:
		mGetPalette 0x35 16 0xC0
		mGetTiles 0x197D5 16
		mAnimCmd6 0x0 0x90DFBF6
		.4byte	2, 0

		mGetTiles 0x197E5 16
		mAnimCmd6 0x0 0x90DFBF6
		.4byte	2, 1

		mJumpBack 0x13

	anim_data__0482_1:
		mGetPalette 0x35 16 0xC0
		mGetTiles 0x197F5 20
		mAnimCmd6 0x0 0x1207FCF6
		.4byte	2, 2

		mGetTiles 0x19809 20
		mAnimCmd6 0x0 0x1207FCF6
		.4byte	2, 3

		mJumpBack 0x13

	anim_data__0482_2:
		mGetPalette 0x35 16 0xC0
		mGetTiles 0x1981D 16
		mAnimCmd6 0x0 0x907FBFA
		.4byte	5, 4

		mAnimCmd4 


.align 2, 0
	anim_0482:
		.4byte anim_data__0482_0
		.4byte anim_data__0482_1
		.4byte anim_data__0482_2




.align 2, 0
	anim_data__0483_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1982D 9
		mAnimCmd6 0x0 0xFF04ECFC
		mAnimCmd6 0x1 0xFC1AEFEA
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0483_1:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19836 9
		mAnimCmd6 0x0 0xFF04ECFC
		mAnimCmd6 0x1 0xFC1AEFEA
		.4byte	1, 1

		mGetTiles 0x1983F 9
		mAnimCmd6 0x0 0xFF04ECFC
		mAnimCmd6 0x1 0xFC1AEFEA
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0483:
		.4byte anim_data__0483_0
		.4byte anim_data__0483_1




.align 2, 0
	anim_data__0484_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19848 6
		.4byte	4, 0

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1984E 6
		.4byte	4, 1

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19854 6
		.4byte	4, 2

		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1985A 6
		.4byte	4, 3

		mJumpBack 0x20


.align 2, 0
	anim_0484:
		.4byte anim_data__0484_0




.align 2, 0
	anim_data__0485_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x19860 8
		mAnimCmd6 0x0 0xD0BF2F5
		.4byte	12, 0

		mGetTiles 0x19868 8
		.4byte	12, 1

		mGetTiles 0x19870 6
		.4byte	12, 2

		mGetTiles 0x19876 8
		.4byte	12, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0485:
		.4byte anim_data__0485_0




.align 2, 0
	anim_data__0486_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1987E 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0486:
		.4byte anim_data__0486_0




.align 2, 0
	anim_data__0487_0:
		mGetPalette 0x36 16 0xD0
		mGetTiles 0x1987F 4
		mAnimCmd6 0x0 0x504FDFC
		.4byte	4, 0

		mGetTiles 0x19883 4
		.4byte	4, 1

		mGetTiles 0x19887 4
		.4byte	4, 2

		mGetTiles 0x1988B 4
		.4byte	4, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0487:
		.4byte anim_data__0487_0




.align 2, 0
	anim_data__0488_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1988F 16
		mAnimCmd6 0x0 0x807F7F8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0488_1:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1989F 16
		mAnimCmd6 0x0 0x808F7F9
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0488:
		.4byte anim_data__0488_0
		.4byte anim_data__0488_1




.align 2, 0
	anim_data__0489_0:
		mGetPalette 0x38 16 0xC0
		mGetTiles 0x198AF 4
		mAnimCmd6 0x0 0x808F8F8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0489:
		.4byte anim_data__0489_0




.align 2, 0
	anim_data__0490_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198B3 6
		mAnimCmd6 0x0 0xCEEF4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0490_1:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198B9 6
		mAnimCmd6 0x0 0xC00F5EE
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0490:
		.4byte anim_data__0490_0
		.4byte anim_data__0490_1




.align 2, 0
	anim_data__0491_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198BF 1
		mAnimCmd6 0x0 0x303FDFD
		.4byte	3, 0

		mGetTiles 0x198C0 1
		.4byte	3, 1

		mJumpBack 0x10


.align 2, 0
	anim_0491:
		.4byte anim_data__0491_0




.align 2, 0
	anim_data__0492_0:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198C1 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0492_1:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198C1 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	6, 0

		mGetTiles 0x198D5 15
		.4byte	6, 1

		mJumpBack 0x10

	anim_data__0492_2:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x198E4 15
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 2

		mGetTiles 0x198F3 20
		.4byte	2, 3

		mGetTiles 0x19907 25
		.4byte	2, 4

		mGetTiles 0x19920 25
		.4byte	2, 5

		mGetTiles 0x19939 25
		.4byte	2, 6

		mGetTiles 0x19952 25
		.4byte	2, 7

		mGetTiles 0x19939 25
		.4byte	2, 6

		mGetTiles 0x198F3 20
		.4byte	2, 3

		mGetTiles 0x198E4 15
		.4byte	2, 2

		mGetTiles 0x198C1 20
		.4byte	2, 0

		mGetTiles 0x198C1 20
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0492_3:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1996B 25
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 8

		mGetTiles 0x19984 25
		.4byte	2, 9

		mJumpBack 0x10

	anim_data__0492_4:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x1999D 20
		mAnimCmd6 0x0 0xFE7EF
		.4byte	2, 10

		mGetTiles 0x199B1 25
		.4byte	2, 11

		mGetTiles 0x199CA 30
		.4byte	2, 12

		mGetTiles 0x199E8 30
		.4byte	2, 13

		mGetTiles 0x19A06 30
		.4byte	2, 14

		mGetTiles 0x19A24 30
		.4byte	2, 15

		mGetTiles 0x19A06 30
		.4byte	2, 14

		mGetTiles 0x199B1 25
		.4byte	2, 11

		mGetTiles 0x1999D 20
		.4byte	2, 10

		mGetTiles 0x19984 25
		.4byte	2, 9

		mAnimCmd4 

	anim_data__0492_5:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x19A42 20
		mAnimCmd6 0x0 0xEE7F3
		.4byte	2, 16

		mGetTiles 0x19A56 20
		mAnimCmd6 0x0 0xDE7F2
		.4byte	2, 17

		mAnimCmd4 

	anim_data__0492_6:
		mGetPalette 0x37 16 0xC0
		mGetTiles 0x19A6A 25
		mAnimCmd6 0x0 0xEE7F3
		.4byte	2, 18

		mGetTiles 0x19A83 25
		mAnimCmd6 0x0 0xCE7F2
		.4byte	2, 19

		mAnimCmd4 


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
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19A9C 20
		mAnimCmd6 0x0 0x1A0A02F7
		.4byte	5, 0

		mAnimCmd4 

	anim_data__0493_1:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19AB0 20
		mAnimCmd6 0x0 0x1A0A02F7
		.4byte	5, 1

		mGetTiles 0x19AC4 15
		.4byte	5, 2

		mGetTiles 0x19AD3 20
		.4byte	5, 3

		mGetTiles 0x19AE7 20
		.4byte	5, 4

		mGetTiles 0x19AFB 15
		.4byte	5, 5

		mGetTiles 0x19B0A 20
		.4byte	5, 6

		mGetTiles 0x19B1E 20
		.4byte	5, 7

		mGetTiles 0x19B32 20
		.4byte	5, 8

		mGetTiles 0x19B46 20
		.4byte	5, 9

		mGetTiles 0x19B5A 20
		.4byte	5, 10

		mGetTiles 0x19B6E 20
		.4byte	5, 11

		mGetTiles 0x19B82 20
		.4byte	5, 12

		mGetTiles 0x19B96 20
		.4byte	5, 13

		mJumpBack 0x3C


.align 2, 0
	anim_0493:
		.4byte anim_data__0493_0
		.4byte anim_data__0493_1




.align 2, 0
	anim_data__0494_0:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19BAA 30
		mAnimCmd6 0x0 0x9D7F8
		mAnimCmd6 0x1 0xE20BD7FF
		.4byte	6, 0

		mGetTiles 0x19BC8 30
		mAnimCmd6 0x0 0x8E0F6
		mAnimCmd6 0x1 0xF0F6E4EA
		.4byte	6, 1

		mGetTiles 0x19BE6 24
		mAnimCmd6 0x0 0x9E2F7
		mAnimCmd6 0x1 0xF9F1EEE6
		.4byte	6, 2

		mGetTiles 0x19BFE 30
		mAnimCmd6 0x0 0x7E0F5
		mAnimCmd6 0x1 0xF0F6E4EA
		.4byte	6, 3

		mGetTiles 0x19C1C 30
		mAnimCmd6 0x0 0x8D7F7
		mAnimCmd6 0x1 0xE201D7F5
		.4byte	6, 4

		mGetTiles 0x19C3A 30
		mAnimCmd6 0x0 0xBE0F9
		mAnimCmd6 0x1 0xF016E40A
		.4byte	6, 5

		mGetTiles 0x19C58 24
		mAnimCmd6 0x0 0x9E2F7
		mAnimCmd6 0x1 0xF91AEE0F
		.4byte	6, 6

		mGetTiles 0x19C70 30
		mAnimCmd6 0x0 0xBE0F9
		mAnimCmd6 0x1 0xF016E40A
		.4byte	6, 7

		mJumpBack 0x5B


.align 2, 0
	anim_0494:
		.4byte anim_data__0494_0




.align 2, 0
	anim_data__0495_0:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19C8E 16
		mAnimCmd6 0x0 0x7E6F9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0495_1:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19C8E 16
		mAnimCmd6 0x0 0x7E6F9
		.4byte	3, 0

		mGetTiles 0x19C9E 12
		.4byte	6, 1

		mAnimCmd4 

	anim_data__0495_2:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19CAA 18
		mAnimCmd6 0x0 0x7E6F9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0495_3:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19CBC 20
		mAnimCmd6 0x0 0x7E6F9
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0495:
		.4byte anim_data__0495_0
		.4byte anim_data__0495_1
		.4byte anim_data__0495_2
		.4byte anim_data__0495_3




.align 2, 0
	anim_data__0496_0:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19CD0 16
		mAnimCmd6 0x0 0xE70AD6F9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0496_1:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19CD0 16
		mAnimCmd6 0x0 0xE70AD6F9
		.4byte	3, 0

		mGetTiles 0x19CE0 16
		.4byte	3, 1

		mGetTiles 0x19CF0 16
		.4byte	3, 2

		mGetTiles 0x19D00 16
		.4byte	3, 3

		mJumpBack 0x1A

	anim_data__0496_2:
		mGetPalette 0x3A 16 0xD0
		mGetTiles 0x19D10 16
		mAnimCmd6 0x0 0x909F8F8
		.4byte	5, 4

		mGetTiles 0x19D20 16
		.4byte	5, 5

		mGetTiles 0x19D30 16
		.4byte	5, 6

		mGetTiles 0x19D40 16
		.4byte	5, 7

		mJumpBack 0x1A


.align 2, 0
	anim_0496:
		.4byte anim_data__0496_0
		.4byte anim_data__0496_1
		.4byte anim_data__0496_2




.align 2, 0
	anim_data__0497_0:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D50 12
		mAnimCmd6 0x0 0xAEDF6
		.4byte	30, 0

		mGetTiles 0x19D5C 12
		.4byte	5, 1

		mJumpBack 0x10

	anim_data__0497_1:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D68 12
		mAnimCmd6 0x0 0xAEDF6
		mAnimCmd6 0x1 0xF8F3
		.4byte	3, 2

		mGetTiles 0x19D74 12
		.4byte	3, 3

		mGetTiles 0x19D80 12
		.4byte	6, 4

		mAnimCmd4 

	anim_data__0497_2:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D74 12
		mAnimCmd6 0x0 0xAEDF6
		mAnimCmd6 0x1 0xF5F1
		.4byte	3, 3

		mGetTiles 0x19D68 12
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0497_3:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19D8C 12
		mAnimCmd6 0x0 0xAEDF6
		.4byte	4, 5

		mGetTiles 0x19D98 12
		.4byte	4, 6

		mAnimCmd4 


.align 2, 0
	anim_0497:
		.4byte anim_data__0497_0
		.4byte anim_data__0497_1
		.4byte anim_data__0497_2
		.4byte anim_data__0497_3




.align 2, 0
	anim_data__0498_0:
		mGetPalette 0x39 16 0xC0
		mGetTiles 0x19DA4 4
		mAnimCmd6 0x0 0x404FEFD
		.4byte	3, 0

		mGetTiles 0x19DA8 4
		.4byte	3, 1

		mJumpBack 0x10


.align 2, 0
	anim_0498:
		.4byte anim_data__0498_0




.align 2, 0
	anim_data__0499_0:
		mGetPalette 0x3B 16 0xC0
		mGetTiles 0x19DAC 36
		mAnimCmd6 0x0 0xE015D5EC
		mAnimCmd6 0x1 0xFC0BE0F6
		.4byte	4, 0

		mGetTiles 0x19DD0 36
		.4byte	4, 1

		mGetTiles 0x19DAC 36
		.4byte	4, 0

		mGetTiles 0x19DF4 36
		.4byte	4, 2

		mJumpBack 0x1D


.align 2, 0
	anim_0499:
		.4byte anim_data__0499_0




.align 2, 0
	anim_data__0500_0:
		mGetPalette 0x3B 16 0xC0
		mGetTiles 0x19E18 10
		mAnimCmd6 0x0 0x10F3F4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0500_1:
		mGetPalette 0x3B 16 0xC0
		mGetTiles 0x19E22 12
		mAnimCmd6 0x0 0xDF2F2
		.4byte	3, 1

		mGetTiles 0x19E2E 12
		.4byte	3, 2

		mGetTiles 0x19E3A 12
		.4byte	3, 3

		mJumpBack 0x15

	anim_data__0500_2:
		mGetPalette 0x3B 16 0xC0
		mGetTiles 0x19E46 8
		mAnimCmd6 0x0 0xCF2F5
		.4byte	10, 4

		mGetTiles 0x19E4E 8
		.4byte	10, 5

		mGetTiles 0x19E56 8
		.4byte	10, 6

		mGetTiles 0x19E5E 8
		mAnimCmd6 0x0 0xCF2F5
		.4byte	10, 7

		mAnimCmd4 


.align 2, 0
	anim_0500:
		.4byte anim_data__0500_0
		.4byte anim_data__0500_1
		.4byte anim_data__0500_2




.align 2, 0
	anim_data__0501_0:
		mGetPalette 0x3C 16 0xD0
		mGetTiles 0x19E66 10
		mAnimCmd6 0x0 0x909F2F7
		.4byte	10, 0

		mGetTiles 0x19E70 10
		.4byte	10, 1

		mGetTiles 0x19E7A 10
		.4byte	10, 2

		mGetTiles 0x19E70 10
		.4byte	10, 1

		mJumpBack 0x1A

	anim_data__0501_1:
		mGetPalette 0x3C 16 0xD0
		mGetTiles 0x19E84 10
		mAnimCmd6 0x0 0x909F2F7
		.4byte	10, 3

		mGetTiles 0x19E8E 10
		.4byte	10, 4

		mGetTiles 0x19E98 10
		.4byte	10, 5

		mGetTiles 0x19EA2 10
		.4byte	15, 6

		mGetTiles 0x19EAC 10
		.4byte	5, 7

		mGetTiles 0x19EB6 10
		.4byte	10, 8

		mAnimCmd4 


.align 2, 0
	anim_0501:
		.4byte anim_data__0501_0
		.4byte anim_data__0501_1




.align 2, 0
	anim_data__0502_0:
		mGetPalette 0x3C 16 0xD0
		mGetTiles 0x19EC0 2
		mAnimCmd6 0x0 0x302FAFE
		.4byte	3, 0

		mGetTiles 0x19EC2 3
		.4byte	3, 1

		mJumpBack 0x10


.align 2, 0
	anim_0502:
		.4byte anim_data__0502_0




.align 2, 0
	anim_data__0503_0:
		mGetPalette 0x3D 16 0xC0
		mGetTiles 0x19EC5 12
		mAnimCmd6 0x0 0x10E9F1
		.4byte	8, 0

		mGetTiles 0x19ED1 15
		.4byte	8, 1

		mGetTiles 0x19EE0 15
		.4byte	8, 2

		mGetTiles 0x19ED1 15
		.4byte	8, 1

		mJumpBack 0x1A

	anim_data__0503_1:
		mGetPalette 0x3D 16 0xC0
		mGetTiles 0x19EC5 12
		mAnimCmd6 0x0 0xFE0CE6F5
		.4byte	5, 0

		mGetTiles 0x19EEF 12
		.4byte	5, 3

		mGetTiles 0x19EFB 16
		.4byte	5, 4

		mGetTiles 0x19F0B 16
		mAnimCmd6 0x0 0xFE0CE6F5
		.4byte	2, 5

		mGetTiles 0x19F1B 16
		.4byte	2, 6

		mGetTiles 0x19F2B 16
		.4byte	2, 7

		mJumpBack 0x12

	anim_data__0503_2:
		mGetPalette 0x3D 16 0xC0
		mGetTiles 0x19F3B 16
		mAnimCmd6 0x0 0xFF0DE5F4
		.4byte	5, 8

		mGetTiles 0x19EFB 16
		.4byte	5, 4

		mGetTiles 0x19EEF 12
		.4byte	5, 3

		mGetTiles 0x19EC5 12
		.4byte	5, 0

		mAnimCmd4 


.align 2, 0
	anim_0503:
		.4byte anim_data__0503_0
		.4byte anim_data__0503_1
		.4byte anim_data__0503_2




.align 2, 0
	anim_data__0504_0:
		mGetPalette 0x3D 16 0xC0
		mGetTiles 0x19F4B 12
		mAnimCmd6 0x0 0xA09F8F7
		.4byte	1, 0

		mGetTiles 0x19F57 12
		.4byte	1, 1

		mGetTiles 0x19F63 12
		.4byte	1, 2

		mJumpBack 0x15


.align 2, 0
	anim_0504:
		.4byte anim_data__0504_0




.align 2, 0
	anim_data__0505_0:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19F6F 24
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	3, 0

		mGetTiles 0x19F87 24
		.4byte	3, 1

		mJumpBack 0x10

	anim_data__0505_1:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19F9F 16
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	4, 2

		mGetTiles 0x19FAF 16
		.4byte	4, 3

		mAnimCmd4 

	anim_data__0505_2:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x19FBF 24
		mAnimCmd6 0x0 0xA0AF5F4
		.4byte	5, 4

		mGetTiles 0x19FD7 20
		.4byte	5, 5

		mGetTiles 0x19FEB 20
		.4byte	5, 6

		mGetTiles 0x19FFF 16
		.4byte	5, 7

		mGetTiles 0x1A00F 16
		.4byte	2, 8

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x1A02F 16
		.4byte	2, 10

		mGetTiles 0x1A00F 16
		.4byte	2, 8

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x1A02F 16
		.4byte	2, 10

		mGetTiles 0x1A03F 16
		.4byte	2, 11

		mGetTiles 0x1A01F 16
		.4byte	2, 9

		mGetTiles 0x19FFF 16
		.4byte	5, 7

		mGetTiles 0x19FEB 20
		.4byte	5, 6

		mGetTiles 0x19FD7 20
		.4byte	5, 5

		mGetTiles 0x19FBF 24
		.4byte	5, 4

		mAnimCmd4 


.align 2, 0
	anim_0505:
		.4byte anim_data__0505_0
		.4byte anim_data__0505_1
		.4byte anim_data__0505_2




.align 2, 0
	anim_data__0506_0:
		mGetPalette 0x3E 16 0xD0
		mGetTiles 0x1A04F 4
		mAnimCmd6 0x0 0x202FEFE
		.4byte	2, 0

		mGetTiles 0x1A053 4
		.4byte	2, 1

		mGetTiles 0x1A057 4
		.4byte	2, 2

		mJumpBack 0x15


.align 2, 0
	anim_0506:
		.4byte anim_data__0506_0




.align 2, 0
	anim_data__0507_0:
		mGetPalette 0x3F 16 0xC0
		mGetTiles 0x1A05B 20
		mAnimCmd6 0x0 0xAE6F6
		.4byte	5, 0

		mGetTiles 0x1A06F 20
		.4byte	5, 1

		mGetTiles 0x1A083 20
		.4byte	5, 2

		mGetTiles 0x1A097 20
		.4byte	5, 3

		mAnimCmd4 

	anim_data__0507_1:
		mGetPalette 0x3F 16 0xC0
		mGetTiles 0x1A0AB 20
		mAnimCmd6 0x0 0xFC0AE2F6
		.4byte	3, 4

		mGetTiles 0x1A0BF 20
		.4byte	3, 5

		mJumpBack 0x10

	anim_data__0507_2:
		mGetPalette 0x3F 16 0xC0
		mGetTiles 0x1A0D3 20
		mAnimCmd6 0x0 0xAE6F6
		.4byte	5, 6

		mGetTiles 0x1A0E7 20
		.4byte	5, 7

		mGetTiles 0x1A0FB 16
		.4byte	5, 8

		mAnimCmd4 


.align 2, 0
	anim_0507:
		.4byte anim_data__0507_0
		.4byte anim_data__0507_1
		.4byte anim_data__0507_2




.align 2, 0
	anim_data__0508_0:
		mGetPalette 0x3F 16 0xC0
		mGetTiles 0x1A10B 8
		mAnimCmd6 0x0 0x808F8F8
		.4byte	4, 0

		mGetTiles 0x1A113 8
		.4byte	4, 1

		mGetTiles 0x1A11B 8
		.4byte	4, 2

		mGetTiles 0x1A123 8
		.4byte	4, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0508:
		.4byte anim_data__0508_0




.align 2, 0
	anim_data__0509_0:
		mGetPalette 0x40 16 0xC0
		mGetTiles 0x1A12B 24
		mAnimCmd6 0x0 0xA10F9EF
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A12B 24
		.4byte	3, 0

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A15B 20
		.4byte	3, 2

		mGetTiles 0x1A143 24
		.4byte	3, 1

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mGetTiles 0x1A16F 24
		.4byte	3, 3

		mGetTiles 0x1A187 24
		.4byte	3, 4

		mGetTiles 0x1A19F 20
		.4byte	3, 5

		mGetTiles 0x1A1B3 24
		.4byte	3, 6

		mJumpBack 0x92


.align 2, 0
	anim_0509:
		.4byte anim_data__0509_0




.align 2, 0
	anim_data__0510_0:
		mGetPalette 0x40 16 0xC0
		mGetTiles 0x1A1CB 3
		mAnimCmd6 0x0 0xA02F7FE
		.4byte	2, 0

		mGetTiles 0x1A1CE 3
		.4byte	2, 1

		mGetTiles 0x1A1D1 3
		.4byte	2, 2

		mJumpBack 0x15

	anim_data__0510_1:
		mGetPalette 0x40 16 0xC0
		mGetTiles 0x1A1D4 3
		mAnimCmd6 0x0 0xA02F7FE
		.4byte	2, 3

		mGetTiles 0x1A1D7 3
		.4byte	2, 4

		mGetTiles 0x1A1DA 3
		.4byte	2, 5

		mGetTiles 0x1A1DD 3
		.4byte	2, 6

		mGetTiles 0x1A1D1 3
		.4byte	2, 2

		mGetTiles 0x1A1E0 3
		.4byte	2, 7

		mJumpBack 0x24


.align 2, 0
	anim_0510:
		.4byte anim_data__0510_0
		.4byte anim_data__0510_1




.align 2, 0
	anim_data__0511_0:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A1E3 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0511_1:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A1FC 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	5, 1

		mGetTiles 0x1A215 25
		.4byte	5, 2

		mGetTiles 0x1A22E 25
		.4byte	5, 3

		mGetTiles 0x1A247 25
		.4byte	5, 4

		mAnimCmd4 

	anim_data__0511_2:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A247 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	2, 4

		mGetTiles 0x1A260 25
		.4byte	2, 5

		mGetTiles 0x1A279 25
		.4byte	2, 6

		mGetTiles 0x1A292 25
		.4byte	2, 7

		mJumpBack 0x1A

	anim_data__0511_3:
		mGetPalette 0x41 16 0xD0
		mGetTiles 0x1A247 25
		mAnimCmd6 0x0 0xC0BF4F5
		.4byte	5, 4

		mGetTiles 0x1A22E 25
		.4byte	5, 3

		mGetTiles 0x1A215 25
		.4byte	5, 2

		mGetTiles 0x1A1FC 25
		.4byte	5, 1

		mAnimCmd4 


.align 2, 0
	anim_0511:
		.4byte anim_data__0511_0
		.4byte anim_data__0511_1
		.4byte anim_data__0511_2
		.4byte anim_data__0511_3




.align 2, 0
	anim_data__0512_0:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A2AB 12
		mAnimCmd6 0x0 0x908F7F8
		.4byte	4, 0

		mGetTiles 0x1A2B7 12
		.4byte	4, 1

		mGetTiles 0x1A2C3 12
		.4byte	4, 2

		mGetTiles 0x1A2CF 12
		.4byte	4, 3

		mGetTiles 0x1A2DB 12
		.4byte	4, 4

		mGetTiles 0x1A2E7 12
		.4byte	4, 5

		mJumpBack 0x24

	anim_data__0512_1:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A2F3 12
		mAnimCmd6 0x0 0x808F7F8
		.4byte	4, 6

		mGetTiles 0x1A2FF 12
		.4byte	4, 7

		mGetTiles 0x1A30B 12
		.4byte	4, 8

		mGetTiles 0x1A317 12
		.4byte	4, 9

		mGetTiles 0x1A323 12
		.4byte	4, 10

		mGetTiles 0x1A32F 12
		.4byte	4, 11

		mJumpBack 0x24

	anim_data__0512_2:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1A33B 9
		mAnimCmd6 0x0 0x808F1F8
		.4byte	5, 12

		mGetTiles 0x1A344 9
		.4byte	5, 13

		mGetTiles 0x1A34D 9
		.4byte	5, 14

		mJumpBack 0x15

	anim_data__0512_3:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1A356 9
		mAnimCmd6 0x0 0x808F8F1
		.4byte	5, 15

		mGetTiles 0x1A35F 9
		.4byte	5, 16

		mGetTiles 0x1A368 9
		.4byte	5, 17

		mJumpBack 0x15


.align 2, 0
	anim_0512:
		.4byte anim_data__0512_0
		.4byte anim_data__0512_1
		.4byte anim_data__0512_2
		.4byte anim_data__0512_3




.align 2, 0
	anim_data__0513_0:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A371 10
		mAnimCmd6 0x0 0xBF3F1
		.4byte	4, 0

		mGetTiles 0x1A37B 15
		.4byte	4, 1

		mGetTiles 0x1A38A 10
		.4byte	4, 2

		mGetTiles 0x1A394 15
		.4byte	4, 3

		mJumpBack 0x1A

	anim_data__0513_1:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A3A3 8
		mAnimCmd6 0x0 0xDF3F4
		.4byte	2, 4

		mGetTiles 0x1A3AB 8
		.4byte	2, 5

		mGetTiles 0x1A3B3 8
		.4byte	2, 6

		mGetTiles 0x1A3BB 8
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0513:
		.4byte anim_data__0513_0
		.4byte anim_data__0513_1




.align 2, 0
	anim_data__0514_0:
		mGetPalette 0x42 16 0xD0
		mGetTiles 0x1A3C3 16
		mAnimCmd6 0x0 0xB09F2F7
		mAnimCmd6 0x1 0x210FFF0
		.4byte	3, 0

		mGetTiles 0x1A3D3 16
		.4byte	3, 1

		mGetTiles 0x1A3E3 24
		.4byte	3, 2

		mGetTiles 0x1A3FB 24
		.4byte	3, 3

		mGetTiles 0x1A413 24
		.4byte	3, 4

		mGetTiles 0x1A42B 16
		.4byte	3, 5

		mJumpBack 0x27


.align 2, 0
	anim_0514:
		.4byte anim_data__0514_0




.align 2, 0
	anim_data__0515_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A43B 4
		.4byte	8, 0

		mGetTiles 0x1A43F 4
		.4byte	8, 1

		mGetTiles 0x1A443 4
		.4byte	8, 2

		mGetTiles 0x1A43F 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0515:
		.4byte anim_data__0515_0




.align 2, 0
	anim_data__0516_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A447 4
		.4byte	8, 0

		mGetTiles 0x1A44B 4
		.4byte	8, 1

		mGetTiles 0x1A44F 4
		.4byte	8, 2

		mGetTiles 0x1A44B 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0516:
		.4byte anim_data__0516_0




.align 2, 0
	anim_data__0517_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A453 4
		.4byte	8, 0

		mGetTiles 0x1A457 4
		.4byte	8, 1

		mGetTiles 0x1A45B 4
		.4byte	8, 2

		mGetTiles 0x1A457 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0517:
		.4byte anim_data__0517_0




.align 2, 0
	anim_data__0518_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A45F 4
		.4byte	8, 0

		mGetTiles 0x1A463 4
		.4byte	2, 1

		mGetTiles 0x1A467 4
		.4byte	10, 2

		mGetTiles 0x1A463 4
		.4byte	2, 1

		mJumpBack 0x17


.align 2, 0
	anim_0518:
		.4byte anim_data__0518_0




.align 2, 0
	anim_data__0519_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A46B 4
		.4byte	8, 0

		mGetTiles 0x1A46F 4
		.4byte	8, 1

		mGetTiles 0x1A473 4
		.4byte	8, 2

		mGetTiles 0x1A46F 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0519:
		.4byte anim_data__0519_0




.align 2, 0
	anim_data__0520_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A477 4
		.4byte	3, 0

		mGetTiles 0x1A47B 4
		.4byte	3, 1

		mGetTiles 0x1A47F 4
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0520:
		.4byte anim_data__0520_0




.align 2, 0
	anim_data__0521_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A483 4
		.4byte	8, 0

		mGetTiles 0x1A487 4
		.4byte	8, 1

		mGetTiles 0x1A48B 4
		.4byte	8, 2

		mGetTiles 0x1A487 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0521:
		.4byte anim_data__0521_0




.align 2, 0
	anim_data__0522_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A48F 4
		.4byte	8, 0

		mGetTiles 0x1A493 4
		.4byte	8, 1

		mGetTiles 0x1A497 4
		.4byte	8, 2

		mGetTiles 0x1A493 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0522:
		.4byte anim_data__0522_0




.align 2, 0
	anim_data__0523_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A49B 4
		.4byte	8, 0

		mGetTiles 0x1A49F 4
		.4byte	8, 1

		mGetTiles 0x1A4A3 4
		.4byte	8, 2

		mGetTiles 0x1A49F 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0523:
		.4byte anim_data__0523_0




.align 2, 0
	anim_data__0524_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4A7 4
		.4byte	8, 0

		mGetTiles 0x1A4AB 4
		.4byte	8, 1

		mGetTiles 0x1A4AF 4
		.4byte	8, 2

		mGetTiles 0x1A4AB 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0524:
		.4byte anim_data__0524_0




.align 2, 0
	anim_data__0525_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4B3 4
		.4byte	8, 0

		mGetTiles 0x1A4B7 4
		.4byte	8, 1

		mGetTiles 0x1A4BB 4
		.4byte	8, 2

		mGetTiles 0x1A4B7 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0525:
		.4byte anim_data__0525_0




.align 2, 0
	anim_data__0526_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4BF 4
		.4byte	3, 0

		mGetTiles 0x1A4C3 4
		.4byte	3, 1

		mGetTiles 0x1A4C7 4
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0526:
		.4byte anim_data__0526_0




.align 2, 0
	anim_data__0527_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4CB 4
		.4byte	8, 0

		mGetTiles 0x1A4CF 4
		.4byte	8, 1

		mGetTiles 0x1A4D3 4
		.4byte	8, 2

		mGetTiles 0x1A4CF 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0527:
		.4byte anim_data__0527_0




.align 2, 0
	anim_data__0528_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4D7 4
		.4byte	6, 0

		mGetTiles 0x1A4DB 4
		.4byte	6, 1

		mGetTiles 0x1A4DF 4
		.4byte	6, 2

		mGetTiles 0x1A4DB 4
		.4byte	6, 1

		mJumpBack 0x17


.align 2, 0
	anim_0528:
		.4byte anim_data__0528_0




.align 2, 0
	anim_data__0529_0:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1A4E3 4
		.4byte	8, 0

		mGetTiles 0x1A4E7 4
		.4byte	8, 1

		mGetTiles 0x1A4EB 4
		.4byte	8, 2

		mGetTiles 0x1A4E7 4
		.4byte	8, 1

		mJumpBack 0x17


.align 2, 0
	anim_0529:
		.4byte anim_data__0529_0




.align 2, 0
	anim_data__0530_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A4EF 3
		.4byte	4, 0

		mGetTiles 0x1A4F2 3
		.4byte	4, 1

		mGetTiles 0x1A4F5 5
		.4byte	4, 2

		mGetTiles 0x1A4FA 5
		.4byte	4, 3

		mGetTiles 0x1A4FF 14
		.4byte	4, 4

		mGetTiles 0x1A50D 14
		.4byte	4, 5

		mGetTiles 0x1A51B 14
		.4byte	4, 6

		mGetTiles 0x1A529 14
		.4byte	4, 7

		mGetTiles 0x1A537 9
		.4byte	4, 8

		mGetTiles 0x1A540 9
		.4byte	4, 9

		mGetTiles 0x1A549 6
		.4byte	2, 10

		mGetTiles 0x1A54F 9
		.4byte	2, 11

		mJumpBack 0xA


.align 2, 0
	anim_0530:
		.4byte anim_data__0530_0




.align 2, 0
	anim_data__0531_0:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1A558 4
		mAnimCmd6 0x0 0x340AFEFE
		.4byte	8, 0

		mGetTiles 0x1A55C 4
		.4byte	8, 1

		mGetTiles 0x1A560 4
		.4byte	8, 2

		mGetTiles 0x1A564 4
		.4byte	24, 3

		mGetTiles 0x1A568 4
		.4byte	8, 4

		mGetTiles 0x1A56C 4
		.4byte	8, 5

		mJumpBack 0x24

	anim_data__0531_1:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1A570 4
		.4byte	8, 6

		mGetTiles 0x1A574 4
		.4byte	6, 7

		mGetTiles 0x1A578 4
		.4byte	6, 8

		mAnimCmd4 


.align 2, 0
	anim_0531:
		.4byte anim_data__0531_0
		.4byte anim_data__0531_1




.align 2, 0
	anim_data__0532_0:
		mGetPalette 0x45 16 0x70
		mGetTiles 0x1A57C 4
		.4byte	5, 0

		mGetTiles 0x1A580 4
		.4byte	5, 1

		mGetTiles 0x1A584 2
		.4byte	5, 2

		mGetTiles 0x1A586 4
		.4byte	5, 3

		mGetTiles 0x1A58A 4
		.4byte	5, 4

		mGetTiles 0x1A58E 4
		.4byte	5, 5

		mGetTiles 0x1A592 2
		.4byte	5, 6

		mGetTiles 0x1A594 4
		.4byte	5, 7

		mJumpBack 0x2B

	anim_data__0532_1:
		mGetPalette 0x45 16 0x70
		mGetTiles 0x1A594 4
		mAnimCmd6 0x0 0xC28F414
		.4byte	1, 7

		mAnimCmd4 


.align 2, 0
	anim_0532:
		.4byte anim_data__0532_0
		.4byte anim_data__0532_1




.align 2, 0
	anim_data__0533_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1A598 18
		.4byte	2, 0

		mGetTiles 0x1A5AA 18
		.4byte	2, 1

		mGetTiles 0x1A5BC 18
		.4byte	2, 2

		mJumpBack 0x12


.align 2, 0
	anim_0533:
		.4byte anim_data__0533_0




.align 2, 0
	anim_data__0534_0:
		mGetTiles 0x1A5CE 6
		mGetPalette 0x2 16 0x50
		.4byte	12, 0

		.4byte	12, 1

		.4byte	12, 2

		mJumpBack 0x9


.align 2, 0
	anim_0534:
		.4byte anim_data__0534_0




.align 2, 0
	anim_data__0535_0:
		mGetPalette 0x46 16 0xB0
		mGetTiles 0x1A5D4 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0535:
		.4byte anim_data__0535_0




.align 2, 0
	anim_data__0536_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A614 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0536_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A614 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mGetTiles 0x1A620 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1A62C 20
		mAnimCmd6 0x0 0x5DFFB
		.4byte	1, 2

		mGetTiles 0x1A640 16
		mAnimCmd6 0x0 0x5E3FB
		.4byte	5, 3

		mGetTiles 0x1A650 20
		mAnimCmd6 0x0 0x5E0FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0536_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A664 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0536_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A664 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 5

		mGetTiles 0x1A670 12
		mAnimCmd6 0x0 0x512FB00
		.4byte	2, 6

		mGetTiles 0x1A67C 20
		mAnimCmd6 0x0 0x521FB00
		.4byte	1, 7

		mGetTiles 0x1A690 16
		mAnimCmd6 0x0 0x51DFB00
		.4byte	5, 8

		mGetTiles 0x1A6A0 20
		mAnimCmd6 0x0 0x520FB00
		.4byte	3, 9

		mAnimCmd4 

	anim_data__0536_4:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A6B4 12
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0536_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A6B4 12
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 10

		mGetTiles 0x1A6C0 9
		mAnimCmd6 0x0 0xFB10F106
		.4byte	2, 11

		mGetTiles 0x1A6C9 20
		mAnimCmd6 0x0 0xF01BE611
		.4byte	1, 12

		mGetTiles 0x1A6DD 16
		mAnimCmd6 0x0 0xF417EA0D
		.4byte	5, 13

		mGetTiles 0x1A6ED 16
		mAnimCmd6 0x0 0xF11AE710
		.4byte	3, 14

		mAnimCmd4 

	anim_data__0536_6:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A6FD 8
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 15

		mAnimCmd4 

	anim_data__0536_7:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A6FD 8
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 15

		mGetTiles 0x1A705 6
		mAnimCmd6 0x0 0x10F906
		.4byte	2, 16

		mGetTiles 0x1A70B 15
		mAnimCmd6 0x0 0xF81BEE11
		.4byte	1, 17

		mGetTiles 0x1A71A 12
		mAnimCmd6 0x0 0xFC17F20D
		.4byte	5, 18

		mGetTiles 0x1A726 12
		mAnimCmd6 0x0 0xF91AEF10
		.4byte	3, 19

		mAnimCmd4 


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
		mGetPalette 0x47 16 0x70
		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0537_1:
		mGetPalette 0x47 16 0x70
		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1A73E 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1A74A 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	1, 2

		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	5, 0

		mGetTiles 0x1A74A 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0537_2:
		mGetPalette 0x47 16 0x70
		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1A73E 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1A75A 16
		mAnimCmd6 0x0 0x5E4FB
		.4byte	1, 3

		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	5, 0

		mGetTiles 0x1A76A 16
		mAnimCmd6 0x0 0x5E6FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0537_3:
		mGetPalette 0x47 16 0x70
		mGetTiles 0x1A732 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1A73E 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1A77A 24
		mAnimCmd6 0x0 0x5D3FB
		.4byte	1, 5

		mGetTiles 0x1A74A 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	5, 2

		mGetTiles 0x1A75A 16
		mAnimCmd6 0x0 0x5E4FB
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0537:
		.4byte anim_data__0537_0
		.4byte anim_data__0537_1
		.4byte anim_data__0537_2
		.4byte anim_data__0537_3




.align 2, 0
	anim_data__0538_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A792 18
		mAnimCmd6 0x0 0xF8D0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0538_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A7B6 18
		.4byte	5, 2

		mGetTiles 0x1A7C8 24
		.4byte	5, 3

		mGetTiles 0x1A7E0 20
		.4byte	5, 4

		mGetTiles 0x1A7F4 24
		.4byte	5, 5

		mGetTiles 0x1A7C8 24
		.4byte	5, 3

		mGetTiles 0x1A80C 18
		.4byte	5, 6

		mGetTiles 0x1A7B6 18
		.4byte	5, 2

		mGetTiles 0x1A81E 18
		.4byte	5, 7

		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A830 18
		.4byte	5, 8

		mAnimCmd4 

	anim_data__0538_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A7B6 18
		.4byte	5, 2

		mGetTiles 0x1A7C8 24
		.4byte	5, 3

		mGetTiles 0x1A80C 18
		.4byte	5, 6

		mGetTiles 0x1A7B6 18
		.4byte	5, 2

		mGetTiles 0x1A81E 18
		.4byte	5, 7

		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A830 18
		.4byte	5, 8

		mAnimCmd4 

	anim_data__0538_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A7B6 18
		.4byte	5, 2

		mGetTiles 0x1A81E 18
		.4byte	5, 7

		mGetTiles 0x1A7A4 18
		.4byte	5, 1

		mGetTiles 0x1A830 18
		.4byte	5, 8

		mAnimCmd4 


.align 2, 0
	anim_0538:
		.4byte anim_data__0538_0
		.4byte anim_data__0538_1
		.4byte anim_data__0538_2
		.4byte anim_data__0538_3




.align 2, 0
	anim_data__0539_0:
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1A842 32
		mAnimCmd6 0x0 0x20400000
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0539:
		.4byte anim_data__0539_0




.align 2, 0
	anim_data__0540_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A862 8
		mAnimCmd6 0x0 0x8F2F0
		.4byte	1, 0

		mGetTiles 0x1A86A 8
		.4byte	1, 1

		mGetTiles 0x1A872 8
		.4byte	1, 2

		mJumpBack 0x15

	anim_data__0540_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A87A 12
		mAnimCmd6 0x0 0x209F3F0
		.4byte	1, 3

		mGetTiles 0x1A886 12
		.4byte	1, 4

		mGetTiles 0x1A892 12
		.4byte	1, 5

		mJumpBack 0x15

	anim_data__0540_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A89E 12
		mAnimCmd6 0x0 0x209F4F0
		.4byte	1, 6

		mGetTiles 0x1A8AA 12
		.4byte	1, 7

		mGetTiles 0x1A8B6 12
		.4byte	1, 8

		mJumpBack 0x15

	anim_data__0540_3:
		mGetPalette 0x49 16 0x70
		mGetTiles 0x1A8C2 16
		mAnimCmd6 0x0 0x709EEF0
		.4byte	1, 9

		mGetTiles 0x1A8D2 16
		.4byte	1, 10

		mGetTiles 0x1A8E2 16
		.4byte	1, 11

		mJumpBack 0x15

	anim_data__0540_4:
		mGetPalette 0x49 16 0x70
		mGetTiles 0x1A8F2 12
		mAnimCmd6 0x0 0x607F2F0
		.4byte	1, 12

		mGetTiles 0x1A8FE 12
		.4byte	1, 13

		mGetTiles 0x1A90A 12
		.4byte	1, 14

		mJumpBack 0x15

	anim_data__0540_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A916 8
		mAnimCmd6 0x0 0x1000F8F2
		.4byte	1, 15

		mGetTiles 0x1A91E 8
		.4byte	1, 16

		mGetTiles 0x1A926 8
		.4byte	1, 17

		mJumpBack 0x15


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
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1A92E 18
		mAnimCmd6 0x0 0xF818F6E8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0541:
		.4byte anim_data__0541_0




.align 2, 0
	anim_data__0542_0:
		mGetPalette 0x4A 16 0x90
		mGetTiles 0x1A940 16
		mAnimCmd6 0x0 0xFE8F0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0542_1:
		mGetPalette 0x4A 16 0x90
		mGetTiles 0x1A950 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0542_2:
		mGetPalette 0x4A 16 0x90
		mGetTiles 0x1A954 8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0542_3:
		mGetPalette 0x4A 16 0x90
		mGetTiles 0x1A95C 16
		mAnimCmd6 0x0 0xF18F000
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0542:
		.4byte anim_data__0542_0
		.4byte anim_data__0542_1
		.4byte anim_data__0542_2
		.4byte anim_data__0542_3




.align 2, 0
	anim_data__0543_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A96C 20
		mAnimCmd6 0x0 0x14E5EC
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0543_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A980 15
		mAnimCmd6 0x0 0x14EAEC
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0543:
		.4byte anim_data__0543_0
		.4byte anim_data__0543_1




.align 2, 0
	anim_data__0544_0:
		mGetPalette 0x4B 16 0x70
		mGetTiles 0x1A98F 12
		.4byte	3, 0

		mGetTiles 0x1A99B 12
		.4byte	3, 1

		mGetTiles 0x1A9A7 12
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0544:
		.4byte anim_data__0544_0




.align 2, 0
	anim_data__0545_0:
		mGetPalette 0x4B 16 0x70
		mGetTiles 0x1A9B3 45
		.4byte	2, 0

		mGetTiles 0x1A9E0 45
		.4byte	2, 1

		mGetTiles 0x1AA0D 45
		.4byte	2, 2

		mJumpBack 0x12


.align 2, 0
	anim_0545:
		.4byte anim_data__0545_0




.align 2, 0
	anim_data__0546_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA3A 9
		mAnimCmd6 0x0 0xC07F4F9
		.4byte	1, 0

		mJumpBack 0xB

	anim_data__0546_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA43 9
		.4byte	1, 1

		mJumpBack 0x8

	anim_data__0546_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA4C 9
		.4byte	1, 2

		mJumpBack 0x8

	anim_data__0546_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA55 9
		.4byte	1, 3

		mJumpBack 0x8

	anim_data__0546_4:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA5E 9
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__0546_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA67 9
		.4byte	1, 5

		mJumpBack 0x8

	anim_data__0546_6:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA3A 9
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0546_7:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA43 9
		.4byte	1, 1

		mJumpBack 0x8

	anim_data__0546_8:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA4C 9
		.4byte	1, 2

		mJumpBack 0x8

	anim_data__0546_9:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA55 9
		.4byte	1, 3

		mJumpBack 0x8

	anim_data__0546_10:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA5E 9
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__0546_11:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA67 9
		.4byte	1, 5

		mJumpBack 0x8


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
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA70 4
		.4byte	5, 0

		mGetTiles 0x1AA74 4
		.4byte	5, 1

		mGetTiles 0x1AA78 4
		.4byte	5, 2

		mGetTiles 0x1AA7C 4
		.4byte	5, 3

		mGetTiles 0x1AA80 4
		.4byte	5, 4

		mGetTiles 0x1AA84 4
		.4byte	5, 5

		mGetTiles 0x1AA78 4
		.4byte	5, 2

		mGetTiles 0x1AA7C 4
		.4byte	5, 3

		mJumpBack 0x2B


.align 2, 0
	anim_0547:
		.4byte anim_data__0547_0




.align 2, 0
	anim_data__0548_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA88 2
		.4byte	5, 0

		mGetTiles 0x1AA8A 2
		.4byte	5, 1

		mGetTiles 0x1AA8C 2
		.4byte	5, 2

		mGetTiles 0x1AA8E 2
		.4byte	5, 3

		mJumpBack 0x17


.align 2, 0
	anim_0548:
		.4byte anim_data__0548_0




.align 2, 0
	anim_data__0549_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AA90 4
		.4byte	5, 0

		mGetTiles 0x1AA94 4
		.4byte	5, 1

		mGetTiles 0x1AA98 4
		.4byte	5, 2

		mGetTiles 0x1AA9C 4
		.4byte	5, 3

		mGetTiles 0x1AAA0 4
		.4byte	5, 4

		mGetTiles 0x1AAA4 4
		.4byte	5, 5

		mGetTiles 0x1AA98 4
		.4byte	5, 2

		mGetTiles 0x1AA9C 4
		.4byte	5, 3

		mJumpBack 0x2B


.align 2, 0
	anim_0549:
		.4byte anim_data__0549_0




.align 2, 0
	anim_data__0550_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AAA8 2
		.4byte	5, 0

		mGetTiles 0x1AAAA 2
		.4byte	5, 1

		mGetTiles 0x1AAAC 2
		.4byte	5, 2

		mGetTiles 0x1AAAE 1
		.4byte	5, 3

		mJumpBack 0x17


.align 2, 0
	anim_0550:
		.4byte anim_data__0550_0




.align 2, 0
	anim_data__0551_0:
		mGetPalette 0x4C 16 0x90
		mGetTiles 0x1AAAF 14
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0551:
		.4byte anim_data__0551_0




.align 2, 0
	anim_data__0552_0:
		mGetPalette 0x4D 16 0x90
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0552:
		.4byte anim_data__0552_0




.align 2, 0
	anim_data__0553_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1AABD 12
		.4byte	3, 0

		mGetTiles 0x1AAC9 12
		.4byte	4, 1

		mGetTiles 0x1AAD5 12
		.4byte	5, 2

		mGetTiles 0x1AAE1 6
		.4byte	6, 3

		mAnimCmd4 


.align 2, 0
	anim_0553:
		.4byte anim_data__0553_0




.align 2, 0
	anim_data__0554_0:
		mGetPalette 0x4E 256 0x0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0554:
		.4byte anim_data__0554_0




.align 2, 0
	anim_data__0555_0:
		mGetPalette 0x5E 16 0x0
		mGetTiles 0x1AAE7 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0555:
		.4byte anim_data__0555_0




.align 2, 0
	anim_data__0556_0:
		mGetPalette 0x5F 16 0x0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0556:
		.4byte anim_data__0556_0




.align 2, 0
	anim_data__0557_0:
		mGetPalette 0x60 16 0x0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0557:
		.4byte anim_data__0557_0




.align 2, 0
	anim_data__0558_0:
		mGetPalette 0x61 16 0x0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0558:
		.4byte anim_data__0558_0




.align 2, 0
	anim_data__0559_0:
		mGetPalette 0x62 16 0x0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0559:
		.4byte anim_data__0559_0




.align 2, 0
	anim_data__0560_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1AAEB 12
		.4byte	2, 0

		mGetTiles 0x1AAF7 12
		.4byte	2, 1

		mGetTiles 0x1AB03 12
		.4byte	2, 2

		mJumpBack 0x12


.align 2, 0
	anim_0560:
		.4byte anim_data__0560_0




.align 2, 0
	anim_data__0561_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB0F 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0561_1:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB13 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0561_2:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB17 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0561_3:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB1B 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0561_4:
		mGetPalette 0x63 16 0xB0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0561_5:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB1F 2
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__0561_6:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1AB21 4
		.4byte	1, 5

		mJumpBack 0x8


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
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1AB25 24
		mAnimCmd6 0x0 0x1018EFE8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0562:
		.4byte anim_data__0562_0




.align 2, 0
	anim_data__0563_0:
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1AB3D 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0563_1:
		mGetPalette 0x48 16 0xB0
		mGetTiles 0x1AB41 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0563:
		.4byte anim_data__0563_0
		.4byte anim_data__0563_1




.align 2, 0
	anim_data__0564_0:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1AB42 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0564_1:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1AB52 1
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0564_2:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1AB53 1
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0564:
		.4byte anim_data__0564_0
		.4byte anim_data__0564_1
		.4byte anim_data__0564_2




.align 2, 0
	anim_data__0565_0:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1AB54 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0565:
		.4byte anim_data__0565_0




.align 2, 0
	anim_data__0566_0:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1AB94 18
		mAnimCmd6 0x0 0xF818F6E8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0566_1:
		mGetPalette 0x64 16 0xB0
		mGetTiles 0x1ABA6 24
		mAnimCmd6 0x0 0x1018EFE8
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0566:
		.4byte anim_data__0566_0
		.4byte anim_data__0566_1




.align 2, 0
	anim_data__0567_0:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1ABBE 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0567_1:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1ABBE 8
		.4byte	2, 0

		mGetTiles 0x1ABC6 8
		.4byte	2, 1

		mGetTiles 0x1ABCE 12
		.4byte	4, 2

		mGetTiles 0x1ABC6 8
		.4byte	3, 1

		mGetTiles 0x1ABBE 8
		.4byte	2, 0

		mGetTiles 0x1ABDA 8
		.4byte	2, 3

		mGetTiles 0x1ABE2 8
		.4byte	4, 4

		mGetTiles 0x1ABDA 8
		.4byte	3, 3

		mGetTiles 0x1ABBE 8
		.4byte	2, 0

		mGetTiles 0x1ABC6 8
		.4byte	2, 1

		mGetTiles 0x1ABCE 12
		.4byte	4, 2

		mGetTiles 0x1ABC6 8
		.4byte	3, 1

		mGetTiles 0x1ABBE 8
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0567_2:
		mGetPalette 0x43 16 0x70
		mGetTiles 0x1ABE2 8
		.4byte	1, 4

		mGetTiles 0x1ABCE 12
		.4byte	1, 2

		mGetTiles 0x1ABC6 8
		.4byte	1, 1

		mGetTiles 0x1ABBE 8
		.4byte	1, 0

		mGetTiles 0x1ABDA 8
		.4byte	1, 3

		mGetTiles 0x1ABBE 8
		.4byte	1, 0

		mGetTiles 0x1ABC6 8
		.4byte	1, 1

		mGetTiles 0x1ABBE 8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0567:
		.4byte anim_data__0567_0
		.4byte anim_data__0567_1
		.4byte anim_data__0567_2




.align 2, 0
	anim_data__0568_0:
		mGetPalette 0x65 16 0x70
		mGetTiles 0x1ABEA 20
		mAnimCmd6 0x0 0x130EF0F2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0568_1:
		mGetPalette 0x65 16 0x70
		mGetTiles 0x1ABEA 20
		mAnimCmd6 0x0 0x130EF0F2
		.4byte	1, 0

		mGetTiles 0x1ABFE 20
		.4byte	2, 1

		mGetTiles 0x1AC12 28
		.4byte	1, 2

		mGetTiles 0x1AC2E 24
		.4byte	5, 3

		mGetTiles 0x1AC46 28
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0568_2:
		mGetPalette 0x65 16 0x70
		mGetTiles 0x1AC62 20
		mAnimCmd6 0x0 0x130EF0F2
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0568_3:
		mGetPalette 0x65 16 0x70
		mGetTiles 0x1AC62 20
		mAnimCmd6 0x0 0x130EF0F2
		.4byte	1, 5

		mGetTiles 0x1AC76 20
		.4byte	2, 6

		mGetTiles 0x1AC8A 28
		.4byte	1, 7

		mGetTiles 0x1ACA6 24
		.4byte	5, 8

		mGetTiles 0x1ACBE 28
		.4byte	3, 9

		mAnimCmd4 


.align 2, 0
	anim_0568:
		.4byte anim_data__0568_0
		.4byte anim_data__0568_1
		.4byte anim_data__0568_2
		.4byte anim_data__0568_3




.align 2, 0
	anim_data__0569_0:
		mGetPalette 0x66 16 0xB0
		mGetTiles 0x1ACDA 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0569_1:
		mGetPalette 0x66 16 0xB0
		mGetTiles 0x1ACDC 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0569:
		.4byte anim_data__0569_0
		.4byte anim_data__0569_1




.align 2, 0
	anim_data__0570_0:
		mGetPalette 0x67 16 0x70
		mGetTiles 0x1ACDD 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0570_1:
		mGetPalette 0x67 16 0x70
		mGetTiles 0x1ACDD 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1ACE9 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	2, 1

		mGetTiles 0x1ACF5 16
		mAnimCmd6 0x0 0x5E2FB
		.4byte	1, 2

		mGetTiles 0x1AD05 12
		mAnimCmd6 0x0 0x5E8FB
		.4byte	5, 3

		mGetTiles 0x1AD11 16
		mAnimCmd6 0x0 0x5E6FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0570_2:
		mGetPalette 0x67 16 0x70
		mGetTiles 0x1ACDD 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1ACE9 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	2, 1

		mGetTiles 0x1ACF5 16
		mAnimCmd6 0x0 0x5E2FB
		.4byte	1, 2

		mGetTiles 0x1AD05 12
		mAnimCmd6 0x0 0x5E8FB
		.4byte	5, 3

		mGetTiles 0x1AD11 16
		mAnimCmd6 0x0 0x5E6FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0570_3:
		mGetPalette 0x67 16 0x70
		mGetTiles 0x1ACDD 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1ACE9 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	2, 1

		mGetTiles 0x1ACF5 16
		mAnimCmd6 0x0 0x5E2FB
		.4byte	1, 2

		mGetTiles 0x1AD05 12
		mAnimCmd6 0x0 0x5E8FB
		.4byte	5, 3

		mGetTiles 0x1AD11 16
		mAnimCmd6 0x0 0x5E6FB
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0570:
		.4byte anim_data__0570_0
		.4byte anim_data__0570_1
		.4byte anim_data__0570_2
		.4byte anim_data__0570_3




.align 2, 0
	anim_data__0571_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AD21 20
		mAnimCmd6 0x0 0x130DF0F3
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0571_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1AD21 20
		mAnimCmd6 0x0 0x130DF0F3
		.4byte	1, 0

		mGetTiles 0x1AD35 20
		.4byte	2, 1

		mGetTiles 0x1AD49 28
		.4byte	1, 2

		mGetTiles 0x1AD65 28
		.4byte	5, 3

		mGetTiles 0x1AD81 28
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0571_2:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AD9D 20
		mAnimCmd6 0x0 0x130DF0F3
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0571_3:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AD9D 20
		mAnimCmd6 0x0 0x130DF0F3
		.4byte	1, 5

		mGetTiles 0x1ADB1 20
		.4byte	2, 6

		mGetTiles 0x1ADC5 28
		.4byte	1, 7

		mGetTiles 0x1ADE1 28
		.4byte	5, 8

		mGetTiles 0x1ADFD 28
		.4byte	3, 9

		mAnimCmd4 


.align 2, 0
	anim_0571:
		.4byte anim_data__0571_0
		.4byte anim_data__0571_1
		.4byte anim_data__0571_2
		.4byte anim_data__0571_3




.align 2, 0
	anim_data__0572_0:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE19 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0572_1:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE19 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mGetTiles 0x1AE25 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1AE31 20
		mAnimCmd6 0x0 0x5DFFB
		.4byte	1, 2

		mGetTiles 0x1AE45 16
		mAnimCmd6 0x0 0x5E3FB
		.4byte	5, 3

		mGetTiles 0x1AE55 20
		mAnimCmd6 0x0 0x5E0FB
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0572:
		.4byte anim_data__0572_0
		.4byte anim_data__0572_1




.align 2, 0
	anim_data__0573_0:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE69 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0573_1:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AE69 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 0

		mGetTiles 0x1AE75 12
		mAnimCmd6 0x0 0x512FB00
		.4byte	2, 1

		mGetTiles 0x1AE81 20
		mAnimCmd6 0x0 0x521FB00
		.4byte	1, 2

		mGetTiles 0x1AE95 16
		mAnimCmd6 0x0 0x51DFB00
		.4byte	5, 3

		mGetTiles 0x1AEA5 20
		mAnimCmd6 0x0 0x520FB00
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0573_2:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AEB9 16
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0573_3:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AEB9 16
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 5

		mGetTiles 0x1AEC9 9
		mAnimCmd6 0x0 0xFB10F106
		.4byte	2, 6

		mGetTiles 0x1AED2 25
		mAnimCmd6 0x0 0xF01BE611
		.4byte	1, 7

		mGetTiles 0x1AEEB 25
		mAnimCmd6 0x0 0xF417EA0D
		.4byte	5, 8

		mGetTiles 0x1AF04 25
		mAnimCmd6 0x0 0xF11AE710
		.4byte	3, 9

		mAnimCmd4 

	anim_data__0573_4:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AF1D 12
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0573_5:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AF1D 12
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 10

		mGetTiles 0x1AF29 6
		mAnimCmd6 0x0 0x10F906
		.4byte	2, 11

		mGetTiles 0x1AF2F 20
		mAnimCmd6 0x0 0xF81BEE11
		.4byte	1, 12

		mGetTiles 0x1AF43 20
		mAnimCmd6 0x0 0xFC17F20D
		.4byte	5, 13

		mGetTiles 0x1AF57 20
		mAnimCmd6 0x0 0xF91AEF10
		.4byte	3, 14

		mAnimCmd4 


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
		mGetPalette 0x6A 16 0xB0
		mGetTiles 0x1AF6B 18
		mAnimCmd6 0x0 0xF817F6E9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0574_1:
		mGetPalette 0x6B 16 0x70
		mGetTiles 0x1AF7D 36
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0574_2:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1AFA1 24
		mAnimCmd6 0x0 0x1018EFE8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0574:
		.4byte anim_data__0574_0
		.4byte anim_data__0574_1
		.4byte anim_data__0574_2




.align 2, 0
	anim_data__0575_0:
		mGetPalette 0x6C 16 0x70
		mGetTiles 0x1AFB9 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0575_1:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AFBD 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0575_2:
		mGetPalette 0x69 16 0x60
		mGetTiles 0x1AFC1 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0575_3:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AFC5 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0575_4:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AFC9 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0575_5:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1AFCD 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0575_6:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1AFD1 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0575_7:
		mGetPalette 0x6C 16 0x70
		mGetTiles 0x1AFD5 6
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0575_8:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1AFDB 6
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0575_9:
		mGetPalette 0x6D 16 0xB0
		mGetTiles 0x1AFE1 6
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0575_10:
		mGetPalette 0x6D 16 0xB0
		mGetTiles 0x1AFE7 6
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0575_11:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AFED 6
		.4byte	1, 11

		mAnimCmd4 

	anim_data__0575_12:
		mGetPalette 0x68 16 0x50
		mGetTiles 0x1AFF3 6
		.4byte	1, 12

		mAnimCmd4 

	anim_data__0575_13:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1AFF9 6
		.4byte	1, 13

		mAnimCmd4 

	anim_data__0575_14:
		mGetPalette 0x44 16 0x80
		mGetTiles 0x1AFFF 6
		.4byte	1, 14

		mAnimCmd4 

	anim_data__0575_15:
		mGetPalette 0x6C 16 0x70
		mGetTiles 0x1B005 1
		.4byte	1, 15

		mAnimCmd4 


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
		mGetPalette 0x6C 16 0x70
		mGetTiles 0x1B006 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0576_1:
		mGetPalette 0x6C 16 0x70
		mGetTiles 0x1B008 2
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0576:
		.4byte anim_data__0576_0
		.4byte anim_data__0576_1




.align 2, 0
	anim_data__0577_0:
		mGetPalette 0x6D 16 0xB0
		mGetTiles 0x1B00A 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0577:
		.4byte anim_data__0577_0




.align 2, 0
	anim_data__0578_0:
		mGetPalette 0x6E 16 0x40
		mGetTiles 0x1B00E 6
		.4byte	4, 0

		mGetTiles 0x1B014 6
		.4byte	4, 1

		mGetTiles 0x1B01A 6
		.4byte	8, 2

		mGetTiles 0x1B020 6
		.4byte	8, 3

		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0578:
		.4byte anim_data__0578_0




.align 2, 0
	anim_data__0579_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1B026 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0579_1:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1B028 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0579:
		.4byte anim_data__0579_0
		.4byte anim_data__0579_1




.align 2, 0
	anim_data__0580_0:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B029 16
		mAnimCmd6 0x0 0xFE8F0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0580_1:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B039 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0580_2:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B03D 8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0580_3:
		mGetPalette 0x6F 16 0x80
		mGetTiles 0x1B045 16
		mAnimCmd6 0x0 0xF18F000
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0580:
		.4byte anim_data__0580_0
		.4byte anim_data__0580_1
		.4byte anim_data__0580_2
		.4byte anim_data__0580_3




.align 2, 0
	anim_data__0581_0:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B055 18
		mAnimCmd6 0x0 0xFC18F6E8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0581_1:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B067 24
		mAnimCmd6 0x0 0x1018F0E8
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0581_2:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B07F 36
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0581:
		.4byte anim_data__0581_0
		.4byte anim_data__0581_1
		.4byte anim_data__0581_2




.align 2, 0
	anim_data__0582_0:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0A3 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0582_1:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0B3 9
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0582_2:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0BC 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0582_3:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0C0 1
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0582_4:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0C1 1
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0582:
		.4byte anim_data__0582_0
		.4byte anim_data__0582_1
		.4byte anim_data__0582_2
		.4byte anim_data__0582_3
		.4byte anim_data__0582_4




.align 2, 0
	anim_data__0583_0:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0C2 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0583_1:
		mGetPalette 0x70 16 0xB0
		mGetTiles 0x1B0C4 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0583:
		.4byte anim_data__0583_0
		.4byte anim_data__0583_1




.align 2, 0
	anim_data__0584_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0C5 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0584_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0D1 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0584_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0D7 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0584_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0E3 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0584_4:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B0E9 36
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0584_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B10D 25
		.4byte	1, 5

		mAnimCmd4 


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
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B126 32
		.4byte	1, 0

		mGetTiles 0x1B146 32
		.4byte	1, 1

		mGetTiles 0x1B166 32
		.4byte	1, 2

		mGetTiles 0x1B186 28
		.4byte	1, 3

		mGetTiles 0x1B1A2 32
		.4byte	1, 4

		mGetTiles 0x1B1C2 28
		.4byte	1, 5

		mGetTiles 0x1B1DE 32
		.4byte	1, 6

		mGetTiles 0x1B1FE 32
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0585_1:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B126 32
		.4byte	1, 0

		mGetTiles 0x1B1FE 32
		.4byte	1, 7

		mGetTiles 0x1B1DE 32
		.4byte	1, 6

		mGetTiles 0x1B1C2 28
		.4byte	1, 5

		mGetTiles 0x1B1A2 32
		.4byte	1, 4

		mGetTiles 0x1B186 28
		.4byte	1, 3

		mGetTiles 0x1B166 32
		.4byte	1, 2

		mGetTiles 0x1B146 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0585_2:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B126 32
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0585:
		.4byte anim_data__0585_0
		.4byte anim_data__0585_1
		.4byte anim_data__0585_2




.align 2, 0
	anim_data__0586_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B21E 24
		mAnimCmd6 0x0 0x1018EFE8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0586:
		.4byte anim_data__0586_0




.align 2, 0
	anim_data__0587_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B236 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0587_1:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B23A 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0587:
		.4byte anim_data__0587_0
		.4byte anim_data__0587_1




.align 2, 0
	anim_data__0588_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B23B 2
		.4byte	5, 0

		mGetTiles 0x1B23D 2
		.4byte	5, 1

		mGetTiles 0x1B23F 2
		.4byte	5, 2

		mGetTiles 0x1B241 2
		.4byte	5, 3

		mGetTiles 0x1B243 2
		.4byte	5, 4

		mGetTiles 0x1B245 2
		.4byte	5, 5

		mGetTiles 0x1B247 2
		.4byte	5, 6

		mGetTiles 0x1B249 2
		.4byte	5, 7

		mJumpBack 0x2B

	anim_data__0588_1:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B24B 1
		.4byte	5, 8

		mGetTiles 0x1B24C 1
		.4byte	5, 9

		mGetTiles 0x1B24D 1
		.4byte	5, 10

		mGetTiles 0x1B24E 1
		.4byte	5, 11

		mGetTiles 0x1B24F 1
		.4byte	5, 12

		mGetTiles 0x1B250 1
		.4byte	5, 13

		mGetTiles 0x1B251 1
		.4byte	5, 14

		mGetTiles 0x1B252 1
		.4byte	5, 15

		mJumpBack 0x2B

	anim_data__0588_2:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B253 1
		.4byte	5, 16

		mGetTiles 0x1B254 1
		.4byte	5, 17

		mGetTiles 0x1B255 1
		.4byte	5, 18

		mGetTiles 0x1B256 1
		.4byte	5, 19

		mGetTiles 0x1B257 1
		.4byte	5, 20

		mGetTiles 0x1B258 1
		.4byte	5, 21

		mGetTiles 0x1B259 1
		.4byte	5, 22

		mGetTiles 0x1B254 1
		.4byte	5, 17

		mJumpBack 0x2B


.align 2, 0
	anim_0588:
		.4byte anim_data__0588_0
		.4byte anim_data__0588_1
		.4byte anim_data__0588_2




.align 2, 0
	anim_data__0589_0:
		mGetPalette 0x71 16 0x70
		mGetTiles 0x1B25A 54
		.4byte	4, 0

		mGetTiles 0x1B290 54
		.4byte	4, 1

		mGetTiles 0x1B2C6 42
		.4byte	4, 2

		mGetTiles 0x1B2F0 54
		.4byte	4, 3

		mJumpBack 0x17


.align 2, 0
	anim_0589:
		.4byte anim_data__0589_0




.align 2, 0
	anim_data__0590_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B326 20
		.4byte	2, 0

		mGetTiles 0x1B33A 20
		.4byte	2, 1

		mGetTiles 0x1B34E 20
		.4byte	2, 2

		mGetTiles 0x1B362 20
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0590_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B326 20
		.4byte	2, 0

		mGetTiles 0x1B376 20
		.4byte	2, 4

		mGetTiles 0x1B38A 20
		.4byte	2, 5

		mGetTiles 0x1B362 20
		.4byte	2, 3

		mGetTiles 0x1B39E 20
		.4byte	2, 6

		mAnimCmd4 


.align 2, 0
	anim_0590:
		.4byte anim_data__0590_0
		.4byte anim_data__0590_1




.align 2, 0
	anim_data__0591_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0591_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	3, 1

		mGetTiles 0x1B3CA 12
		.4byte	2, 2

		mGetTiles 0x1B3D6 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0591_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	1, 1

		mGetTiles 0x1B3CA 12
		.4byte	1, 2

		mGetTiles 0x1B3D6 12
		.4byte	1, 3

		mJumpBack 0x17

	anim_data__0591_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1B3B2 12
		.4byte	1, 0

		mGetTiles 0x1B3BE 12
		.4byte	1, 1

		mGetTiles 0x1B3CA 12
		.4byte	2, 2

		mGetTiles 0x1B3D6 12
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0591:
		.4byte anim_data__0591_0
		.4byte anim_data__0591_1
		.4byte anim_data__0591_2
		.4byte anim_data__0591_3




.align 2, 0
	anim_data__0592_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B3E2 25
		.4byte	2, 0

		mGetTiles 0x1B3FB 15
		.4byte	2, 1

		mGetTiles 0x1B40A 15
		.4byte	2, 2

		mGetTiles 0x1B419 15
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0592:
		.4byte anim_data__0592_0




.align 2, 0
	anim_data__0593_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B428 18
		mAnimCmd6 0x0 0xFC18F6E8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0593:
		.4byte anim_data__0593_0




.align 2, 0
	anim_data__0594_0:
		mGetPalette 0x63 16 0xB0
		mGetTiles 0x1B43A 36
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0594:
		.4byte anim_data__0594_0




.align 2, 0
	anim_data__0595_0:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B45E 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 0

		mGetTiles 0x1B466 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 1

		mGetTiles 0x1B46E 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 2

		mGetTiles 0x1B476 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 3

		mGetTiles 0x1B47E 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 4

		mJumpBack 0x2B

	anim_data__0595_1:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B486 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 5

		mGetTiles 0x1B48E 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 6

		mGetTiles 0x1B496 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 7

		mGetTiles 0x1B49E 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 8

		mGetTiles 0x1B4A6 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	5, 9

		mJumpBack 0x2B

	anim_data__0595_2:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B4AE 8
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 10

		mAnimCmd4 


.align 2, 0
	anim_0595:
		.4byte anim_data__0595_0
		.4byte anim_data__0595_1
		.4byte anim_data__0595_2




.align 2, 0
	anim_data__0596_0:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B4B6 42
		mAnimCmd6 0x0 0x15300000
		.4byte	8, 0

		mGetTiles 0x1B4E0 42
		mAnimCmd6 0x0 0x15300000
		.4byte	8, 1

		mJumpBack 0x13

	anim_data__0596_1:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B50A 18
		mAnimCmd6 0x0 0x15300000
		.4byte	8, 2

		mGetTiles 0x1B51C 18
		mAnimCmd6 0x0 0x15300000
		.4byte	8, 3

		mJumpBack 0x13

	anim_data__0596_2:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B4B6 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0596_3:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B4E0 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0596_4:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B52E 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0596_5:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B558 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0596_6:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B582 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0596_7:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B5AC 42
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0596_8:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B50A 18
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0596_9:
		mGetPalette 0x73 16 0xB0
		mGetTiles 0x1B51C 18
		mAnimCmd6 0x0 0x15300000
		.4byte	1, 3

		mAnimCmd4 


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
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B5D6 18
		mAnimCmd6 0x0 0xFC18F6E8
		.4byte	10, 0

		mGetTiles 0x1B5E8 18
		.4byte	10, 1

		mGetTiles 0x1B5FA 18
		.4byte	10, 2

		mGetTiles 0x1B60C 18
		.4byte	10, 3

		mGetTiles 0x1B61E 18
		.4byte	10, 4

		mGetTiles 0x1B630 18
		.4byte	10, 5

		mJumpBack 0x24

	anim_data__0597_1:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B642 24
		mAnimCmd6 0x0 0x1018F0E8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0597_2:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B65A 36
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 7

		mAnimCmd4 


.align 2, 0
	anim_0597:
		.4byte anim_data__0597_0
		.4byte anim_data__0597_1
		.4byte anim_data__0597_2




.align 2, 0
	anim_data__0598_0:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B67E 8
		mAnimCmd6 0x0 0x810F8F0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0598_1:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B686 8
		mAnimCmd6 0x0 0x810F8F0
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0598_2:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B68E 8
		mAnimCmd6 0x0 0x810F8F0
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0598:
		.4byte anim_data__0598_0
		.4byte anim_data__0598_1
		.4byte anim_data__0598_2




.align 2, 0
	anim_data__0599_0:
		mGetPalette 0x72 16 0xB0
		mGetTiles 0x1B696 36
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0599:
		.4byte anim_data__0599_0




.align 2, 0
	anim_data__0600_0:
		mGetPalette 0x74 16 0xB0
		mGetTiles 0x1B6BA 9
		mAnimCmd6 0x0 0xB0BF5F5
		.4byte	10, 0

		mGetTiles 0x1B6C3 9
		.4byte	10, 1

		mGetTiles 0x1B6CC 9
		.4byte	10, 2

		mGetTiles 0x1B6D5 9
		.4byte	10, 3

		mJumpBack 0x1A

	anim_data__0600_1:
		mGetPalette 0x74 16 0xB0
		mGetTiles 0x1B6DE 9
		mAnimCmd6 0x0 0xB0BF5F5
		.4byte	10, 4

		mGetTiles 0x1B6E7 9
		.4byte	6, 5

		mGetTiles 0x1B6F0 9
		.4byte	6, 6

		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0600:
		.4byte anim_data__0600_0
		.4byte anim_data__0600_1




.align 2, 0
	anim_data__0601_0:
		mGetPalette 0x75 16 0xB0
		mGetTiles 0x1B6F9 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0601_1:
		mGetPalette 0x75 16 0xB0
		mGetTiles 0x1B6FB 2
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0601:
		.4byte anim_data__0601_0
		.4byte anim_data__0601_1




.align 2, 0
	anim_data__0602_0:
		mGetPalette 0x76 16 0xB0
		mGetTiles 0x1B6FD 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0602_1:
		mGetPalette 0x76 16 0xB0
		mGetTiles 0x1B6FF 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0602:
		.4byte anim_data__0602_0
		.4byte anim_data__0602_1




.align 2, 0
	anim_data__0603_0:
		mGetPalette 0x77 16 0xB0
		mGetTiles 0x1B700 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0603_1:
		mGetPalette 0x77 16 0xB0
		mGetTiles 0x1B700 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1B70C 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1B718 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	1, 2

		mGetTiles 0x1B70C 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	5, 1

		mGetTiles 0x1B718 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	3, 2

		mAnimCmd4 

	anim_data__0603_2:
		mGetPalette 0x77 16 0xB0
		mGetTiles 0x1B700 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1B70C 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1B728 16
		mAnimCmd6 0x0 0x5E4FB
		.4byte	1, 3

		mGetTiles 0x1B700 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	5, 0

		mGetTiles 0x1B738 16
		mAnimCmd6 0x0 0x5E6FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0603_3:
		mGetPalette 0x77 16 0xB0
		mGetTiles 0x1B700 12
		mAnimCmd6 0x0 0x5EBFB
		.4byte	1, 0

		mGetTiles 0x1B70C 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1B748 24
		mAnimCmd6 0x0 0x5D3FB
		.4byte	1, 5

		mGetTiles 0x1B718 16
		mAnimCmd6 0x0 0x5E7FB
		.4byte	5, 2

		mGetTiles 0x1B728 16
		mAnimCmd6 0x0 0x5E4FB
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0603:
		.4byte anim_data__0603_0
		.4byte anim_data__0603_1
		.4byte anim_data__0603_2
		.4byte anim_data__0603_3




.align 2, 0
	anim_data__0604_0:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B760 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0604_1:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B760 12
		mAnimCmd6 0x0 0x5ECFB
		.4byte	1, 0

		mGetTiles 0x1B76C 12
		mAnimCmd6 0x0 0x5EEFB
		.4byte	2, 1

		mGetTiles 0x1B778 20
		mAnimCmd6 0x0 0x5DFFB
		.4byte	1, 2

		mGetTiles 0x1B78C 16
		mAnimCmd6 0x0 0x5DFFB
		.4byte	5, 3

		mGetTiles 0x1B79C 20
		mAnimCmd6 0x0 0x5E0FB
		.4byte	3, 4

		mAnimCmd4 

	anim_data__0604_2:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B7B0 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0604_3:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B7B0 12
		mAnimCmd6 0x0 0x514FB00
		.4byte	1, 5

		mGetTiles 0x1B7BC 12
		mAnimCmd6 0x0 0x512FB00
		.4byte	2, 6

		mGetTiles 0x1B7C8 20
		mAnimCmd6 0x0 0x521FB00
		.4byte	1, 7

		mGetTiles 0x1B7DC 16
		mAnimCmd6 0x0 0x51DFB00
		.4byte	5, 8

		mGetTiles 0x1B7EC 20
		mAnimCmd6 0x0 0x520FB00
		.4byte	3, 9

		mAnimCmd4 

	anim_data__0604_4:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B800 9
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0604_5:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B800 9
		mAnimCmd6 0x0 0xF814EE0A
		.4byte	1, 10

		mGetTiles 0x1B809 9
		mAnimCmd6 0x0 0xFB10F106
		.4byte	2, 11

		mGetTiles 0x1B812 16
		mAnimCmd6 0x0 0xF01BE611
		.4byte	1, 12

		mGetTiles 0x1B822 16
		mAnimCmd6 0x0 0xF417EA0D
		.4byte	5, 13

		mGetTiles 0x1B832 16
		mAnimCmd6 0x0 0xF11AE710
		.4byte	3, 14

		mAnimCmd4 

	anim_data__0604_6:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B842 6
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 15

		mAnimCmd4 

	anim_data__0604_7:
		mGetPalette 0x78 16 0xB0
		mGetTiles 0x1B842 6
		mAnimCmd6 0x0 0x14F60A
		.4byte	1, 15

		mGetTiles 0x1B848 6
		mAnimCmd6 0x0 0x10F906
		.4byte	2, 16

		mGetTiles 0x1B84E 12
		mAnimCmd6 0x0 0xF81BEE11
		.4byte	1, 17

		mGetTiles 0x1B85A 12
		mAnimCmd6 0x0 0xFC17F20D
		.4byte	5, 18

		mGetTiles 0x1B866 12
		mAnimCmd6 0x0 0xF91AEF10
		.4byte	3, 19

		mAnimCmd4 


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
		mGetPalette 0x79 16 0xB0
		mGetTiles 0x1B872 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0605_1:
		mGetPalette 0x79 16 0xB0
		mGetTiles 0x1B87E 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0605_2:
		mGetPalette 0x7A 16 0xB0
		mGetTiles 0x1B884 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0605_3:
		mGetPalette 0x7A 16 0xB0
		mGetTiles 0x1B890 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0605_4:
		mGetPalette 0x7B 16 0xB0
		mGetTiles 0x1B896 36
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0605_5:
		mGetPalette 0x7B 16 0xB0
		mGetTiles 0x1B8BA 25
		.4byte	1, 5

		mAnimCmd4 


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
		mGetPalette 0x7C 16 0xB0
		mGetTiles 0x1B8D3 8
		mAnimCmd6 0x0 0x8F2F0
		.4byte	5, 0

		mGetTiles 0x1B8DB 8
		.4byte	5, 1

		mGetTiles 0x1B8E3 8
		.4byte	5, 2

		mJumpBack 0x15

	anim_data__0606_1:
		mGetPalette 0x7C 16 0xB0
		mGetTiles 0x1B8EB 12
		mAnimCmd6 0x0 0x209F3F0
		.4byte	5, 3

		mGetTiles 0x1B8F7 12
		.4byte	5, 4

		mGetTiles 0x1B903 12
		.4byte	5, 5

		mJumpBack 0x15

	anim_data__0606_2:
		mGetPalette 0x7C 16 0xB0
		mGetTiles 0x1B90F 12
		mAnimCmd6 0x0 0x209F4F0
		.4byte	5, 6

		mGetTiles 0x1B91B 12
		.4byte	5, 7

		mGetTiles 0x1B927 12
		.4byte	5, 8

		mJumpBack 0x15

	anim_data__0606_3:
		mGetPalette 0x7D 16 0xB0
		mGetTiles 0x1B933 16
		mAnimCmd6 0x0 0x709EEF0
		.4byte	5, 9

		mGetTiles 0x1B943 16
		.4byte	5, 10

		mGetTiles 0x1B953 16
		.4byte	5, 11

		mJumpBack 0x15

	anim_data__0606_4:
		mGetPalette 0x7D 16 0xB0
		mGetTiles 0x1B963 16
		mAnimCmd6 0x0 0x607F2F0
		.4byte	5, 12

		mGetTiles 0x1B973 16
		.4byte	5, 13

		mGetTiles 0x1B983 16
		.4byte	5, 14

		mJumpBack 0x15

	anim_data__0606_5:
		mGetPalette 0x7C 16 0xB0
		mGetTiles 0x1B993 8
		mAnimCmd6 0x0 0x1000F8F2
		.4byte	5, 15

		mGetTiles 0x1B99B 8
		.4byte	5, 16

		mGetTiles 0x1B9A3 8
		.4byte	5, 17

		mJumpBack 0x15


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
		mGetPalette 0x7E 16 0xB0
		mGetTiles 0x1B9AB 16
		mAnimCmd6 0x0 0xFE8F0
		.4byte	2, 0

		.4byte	2, -1

		mJumpBack 0xD

	anim_data__0607_1:
		mGetPalette 0x7E 16 0xB0
		mGetTiles 0x1B9BB 4
		.4byte	2, 1

		.4byte	2, -1

		mJumpBack 0xA

	anim_data__0607_2:
		mGetPalette 0x7E 16 0xB0
		mGetTiles 0x1B9BF 12
		.4byte	2, 2

		.4byte	2, -1

		mJumpBack 0xA

	anim_data__0607_3:
		mGetPalette 0x7E 16 0xB0
		mGetTiles 0x1B9CB 16
		mAnimCmd6 0x0 0xF18F000
		.4byte	2, 3

		.4byte	2, -1

		mJumpBack 0xD


.align 2, 0
	anim_0607:
		.4byte anim_data__0607_0
		.4byte anim_data__0607_1
		.4byte anim_data__0607_2
		.4byte anim_data__0607_3




.align 2, 0
	anim_data__0608_0:
		mGetPalette 0x7B 16 0xB0
		mGetTiles 0x1B9DB 20
		mAnimCmd6 0x0 0x14E5EC
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0608_1:
		mGetPalette 0x7B 16 0xB0
		mGetTiles 0x1B9EF 15
		mAnimCmd6 0x0 0x14EAEC
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0608:
		.4byte anim_data__0608_0
		.4byte anim_data__0608_1




.align 2, 0
	anim_data__0609_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1B9FE 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0609_1:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA02 1
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0609:
		.4byte anim_data__0609_0
		.4byte anim_data__0609_1




.align 2, 0
	anim_data__0610_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA03 24
		mAnimCmd6 0x0 0x1018EFE8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0610:
		.4byte anim_data__0610_0




.align 2, 0
	anim_data__0611_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA1B 2
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0611:
		.4byte anim_data__0611_0




.align 2, 0
	anim_data__0612_0:
		mGetPalette 0x80 16 0xB0
		mGetTiles 0x1BA1D 16
		mAnimCmd6 0x0 0x3020E0E0
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0612:
		.4byte anim_data__0612_0




.align 2, 0
	anim_data__0613_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA2D 36
		mAnimCmd6 0x0 0x1818EAE8
		.4byte	1, 0

		mJumpBack 0xB


.align 2, 0
	anim_0613:
		.4byte anim_data__0613_0




.align 2, 0
	anim_data__0614_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA51 15
		mAnimCmd6 0x0 0xEEFF2
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0614:
		.4byte anim_data__0614_0




.align 2, 0
	anim_data__0615_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BA60 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0615_1:
		mGetPalette 0x7F 16 0xB0
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0615_2:
		mGetPalette 0x7F 16 0xB0
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0615:
		.4byte anim_data__0615_0
		.4byte anim_data__0615_1
		.4byte anim_data__0615_2




.align 2, 0
	anim_data__0616_0:
		mGetPalette 0x81 16 0xB0
		mGetTiles 0x1BA64 24
		mAnimCmd6 0x0 0x1818E8E8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0616_1:
		mGetPalette 0x81 16 0xB0
		mGetTiles 0x1BA7C 64
		mAnimCmd6 0x0 0xEF0F2E0
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0616:
		.4byte anim_data__0616_0
		.4byte anim_data__0616_1




.align 2, 0
	anim_data__0617_0:
		mGetPalette 0x7F 16 0xB0
		mGetTiles 0x1BABC 18
		mAnimCmd6 0x0 0xFC18F6E8
		.4byte	1, 0

		mJumpBack 0xB


.align 2, 0
	anim_0617:
		.4byte anim_data__0617_0




.align 2, 0
	anim_data__0618_0:
		mGetPalette 0x82 16 0xB0
		mGetTiles 0x1BACE 18
		mAnimCmd6 0x0 0x1010F0F0
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0618:
		.4byte anim_data__0618_0




.align 2, 0
	anim_data__0619_0:
		mGetTiles 0x1BAE0 80
		mGetPalette 0x4B 16 0xA0
		.4byte	4, 0

		.4byte	4, 1

		.4byte	4, 2

		.4byte	4, 3

		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0619:
		.4byte anim_data__0619_0




.align 2, 0
	anim_data__0620_0:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB30 4
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0620_1:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB34 4
		.4byte	1, 1

		mJumpBack 0x8


.align 2, 0
	anim_0620:
		.4byte anim_data__0620_0
		.4byte anim_data__0620_1




.align 2, 0
	anim_data__0621_0:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB38 16
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0621_1:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB48 12
		.4byte	1, 1

		mJumpBack 0x8


.align 2, 0
	anim_0621:
		.4byte anim_data__0621_0
		.4byte anim_data__0621_1




.align 2, 0
	anim_data__0622_0:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB54 1
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0622_1:
		mGetPalette 0x83 16 0xD0
		mGetTiles 0x1BB55 1
		.4byte	1, 1

		mJumpBack 0x8


.align 2, 0
	anim_0622:
		.4byte anim_data__0622_0
		.4byte anim_data__0622_1




.align 2, 0
	anim_data__0623_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB56 1
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0623:
		.4byte anim_data__0623_0




.align 2, 0
	anim_data__0624_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB57 1
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0624:
		.4byte anim_data__0624_0




.align 2, 0
	anim_data__0625_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB58 4
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0625:
		.4byte anim_data__0625_0




.align 2, 0
	anim_data__0626_0:
		mGetPalette 0x84 16 0xD0
		mGetTiles 0x1BB5C 4
		.4byte	1, 0

		mJumpBack 0x8


.align 2, 0
	anim_0626:
		.4byte anim_data__0626_0




.align 2, 0
	anim_data__0627_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BB60 4
		.4byte	2, 0

		mGetTiles 0x1BB64 4
		.4byte	2, 1

		mGetTiles 0x1BB68 4
		.4byte	2, 2

		mGetTiles 0x1BB6C 4
		.4byte	2, 3

		mGetTiles 0x1BB70 4
		.4byte	2, 4

		mGetTiles 0x1BB74 4
		.4byte	2, 5

		mGetTiles 0x1BB78 4
		.4byte	2, 6

		mGetTiles 0x1BB7C 4
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0627:
		.4byte anim_data__0627_0




.align 2, 0
	anim_data__0628_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BB80 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0628:
		.4byte anim_data__0628_0




.align 2, 0
	anim_data__0629_0:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BBC0 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0629_1:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BBC8 8
		.4byte	6, 1

		mGetTiles 0x1BBD0 8
		.4byte	6, 2

		mGetTiles 0x1BBC8 8
		.4byte	6, 1

		mGetTiles 0x1BBD0 8
		.4byte	6, 2

		mGetTiles 0x1BBC8 8
		.4byte	6, 1

		mGetTiles 0x1BBD0 8
		.4byte	6, 2

		mSetIdAndVariant 629 0

	anim_data__0629_2:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BBD8 8
		.4byte	8, 3

		mGetTiles 0x1BBE0 8
		.4byte	4, 4

		mGetTiles 0x1BBD8 8
		.4byte	8, 3

		mGetTiles 0x1BBE0 8
		.4byte	4, 4

		mGetTiles 0x1BBD8 8
		.4byte	8, 3

		mGetTiles 0x1BBE0 8
		.4byte	4, 4

		mSetIdAndVariant 629 0

	anim_data__0629_3:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BBE8 8
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0629:
		.4byte anim_data__0629_0
		.4byte anim_data__0629_1
		.4byte anim_data__0629_2
		.4byte anim_data__0629_3




.align 2, 0
	anim_data__0630_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BBF0 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0630:
		.4byte anim_data__0630_0




.align 2, 0
	anim_data__0631_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BC30 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0631:
		.4byte anim_data__0631_0




.align 2, 0
	anim_data__0632_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BC70 72
		mAnimCmd6 0x0 0x1C18EEE9
		mAnimCmd6 0x1 0x210A02F7
		.4byte	3, 0

		mGetTiles 0x1BCB8 72
		.4byte	3, 1

		mGetTiles 0x1BD00 72
		.4byte	3, 2

		mJumpBack 0x18


.align 2, 0
	anim_0632:
		.4byte anim_data__0632_0




.align 2, 0
	anim_data__0633_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BD48 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0633:
		.4byte anim_data__0633_0




.align 2, 0
	anim_data__0634_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BD4C 9
		.4byte	2, 0

		mGetTiles 0x1BD55 9
		.4byte	2, 1

		mGetTiles 0x1BD5E 9
		.4byte	2, 2

		mGetTiles 0x1BD67 9
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0634:
		.4byte anim_data__0634_0




.align 2, 0
	anim_data__0635_0:
		mGetPalette 0x85 16 0x80
		mGetTiles 0x1BD70 9
		.4byte	2, 0

		mGetTiles 0x1BD79 9
		.4byte	2, 1

		mGetTiles 0x1BD82 9
		.4byte	2, 2

		mGetTiles 0x1BD8B 9
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0635:
		.4byte anim_data__0635_0




.align 2, 0
	anim_data__0636_0:
		mGetPalette 0x87 16 0x90
		mGetTiles 0x1BD94 30
		.4byte	3, 0

		mGetTiles 0x1BDB2 36
		.4byte	2, 1

		mJumpBack 0xD


.align 2, 0
	anim_0636:
		.4byte anim_data__0636_0




.align 2, 0
	anim_data__0637_0:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDD6 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0637_1:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDDE 12
		.4byte	7, 1

		mGetTiles 0x1BDEA 12
		.4byte	7, 2

		mJumpBack 0xD

	anim_data__0637_2:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1BDF6 8
		.4byte	6, 3

		mGetTiles 0x1BDFE 12
		.4byte	5, 4

		mJumpBack 0xD


.align 2, 0
	anim_0637:
		.4byte anim_data__0637_0
		.4byte anim_data__0637_1
		.4byte anim_data__0637_2




.align 2, 0
	anim_data__0638_0:
		mGetPalette 0x4B 16 0xA0
		mGetTiles 0x1BE0A 49
		mAnimCmd6 0x0 0x1010F0F0
		.4byte	4, 0

		mGetTiles 0x1BE3B 49
		mAnimCmd6 0x0 0x1817EDEB
		.4byte	4, 1

		mGetTiles 0x1BE6C 49
		mAnimCmd6 0x0 0x1615EFEB
		.4byte	4, 2

		mGetTiles 0x1BE9D 49
		mAnimCmd6 0x0 0x65006500
		.4byte	4, 3

		mGetTiles 0x1BECE 49
		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0638:
		.4byte anim_data__0638_0




.align 2, 0
	anim_data__0639_0:
		mGetPalette 0x4B 16 0xA0
		mGetTiles 0x1BEFF 20
		mAnimCmd6 0x0 0x408F5F8
		.4byte	4, 0

		mGetTiles 0x1BF13 32
		mAnimCmd6 0x0 0x308E6F8
		.4byte	4, 1

		mGetTiles 0x1BF33 32
		mAnimCmd6 0x0 0x208D5F8
		.4byte	4, 2

		mGetTiles 0x1BF53 32
		mAnimCmd6 0x0 0xEA08D5F8
		.4byte	4, 3

		mGetTiles 0x1BF73 32
		mAnimCmd6 0x0 0x45004500
		.4byte	4, 4

		mGetTiles 0x1BF93 28
		.4byte	4, 5

		mGetTiles 0x1BFAF 28
		.4byte	4, 6

		mAnimCmd4 


.align 2, 0
	anim_0639:
		.4byte anim_data__0639_0




.align 2, 0
	anim_data__0640_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1BFCB 100
		mAnimCmd6 0x0 0xFF10FF1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0640:
		.4byte anim_data__0640_0




.align 2, 0
	anim_data__0641_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C02F 90
		mAnimCmd6 0x0 0xFB18C4E3
		mAnimCmd6 0x1 0x60BE4F3
		.4byte	4, 0

		mGetTiles 0x1C089 99
		.4byte	4, 1

		mGetTiles 0x1C0EC 99
		.4byte	4, 2

		mJumpBack 0x18

	anim_data__0641_1:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C14F 90
		mAnimCmd6 0x0 0xFB18C4E3
		mAnimCmd6 0x1 0x60BE4F3
		.4byte	4, 3

		mGetTiles 0x1C1A9 99
		.4byte	4, 4

		mGetTiles 0x1C20C 99
		.4byte	4, 5

		mJumpBack 0x18


.align 2, 0
	anim_0641:
		.4byte anim_data__0641_0
		.4byte anim_data__0641_1




.align 2, 0
	anim_data__0642_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C26F 45
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0642_1:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C29C 45
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0642:
		.4byte anim_data__0642_0
		.4byte anim_data__0642_1




.align 2, 0
	anim_data__0643_0:
		mGetPalette 0x89 16 0x80
		mGetTiles 0x1C2C9 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0643:
		.4byte anim_data__0643_0




.align 2, 0
	anim_data__0644_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C2CA 16
		.4byte	4, 0

		mGetTiles 0x1C2DA 16
		.4byte	4, 1

		mGetTiles 0x1C2EA 16
		.4byte	4, 2

		mGetTiles 0x1C2FA 16
		.4byte	4, 3

		mJumpBack 0x17


.align 2, 0
	anim_0644:
		.4byte anim_data__0644_0




.align 2, 0
	anim_data__0645_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C30A 16
		.4byte	4, 0

		mGetTiles 0x1C31A 16
		.4byte	4, 1

		mJumpBack 0xD


.align 2, 0
	anim_0645:
		.4byte anim_data__0645_0




.align 2, 0
	anim_data__0646_0:
		mGetPalette 0x88 16 0xD0
		mGetTiles 0x1C32A 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0646_1:
		mGetPalette 0x88 16 0xD0
		mGetTiles 0x1C36A 64
		.4byte	3, 1

		mGetTiles 0x1C3AA 64
		.4byte	3, 2

		mGetTiles 0x1C3EA 64
		.4byte	3, 3

		mGetTiles 0x1C42A 64
		.4byte	3, 4

		mGetTiles 0x1C32A 64
		.4byte	8, 0

		mAnimCmd4 

	anim_data__0646_2:
		mGetPalette 0x88 16 0xD0
		mGetTiles 0x1C46A 64
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0646:
		.4byte anim_data__0646_0
		.4byte anim_data__0646_1
		.4byte anim_data__0646_2




.align 2, 0
	anim_data__0647_0:
		mGetPalette 0x88 16 0x80
		mGetTiles 0x1C4AA 9
		mAnimCmd6 0x0 0x808F9F9
		.4byte	4, 0

		mGetTiles 0x1C4B3 9
		.4byte	4, 1

		mGetTiles 0x1C4BC 9
		.4byte	4, 2

		mGetTiles 0x1C4C5 9
		.4byte	4, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0647:
		.4byte anim_data__0647_0




.align 2, 0
	anim_data__0648_0:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1C4CE 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0648_1:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1C4D6 8
		.4byte	6, 1

		mGetTiles 0x1C4DE 8
		.4byte	6, 2

		mGetTiles 0x1C4D6 8
		.4byte	6, 1

		mGetTiles 0x1C4DE 8
		.4byte	6, 2

		mGetTiles 0x1C4D6 8
		.4byte	6, 1

		mGetTiles 0x1C4DE 8
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0648_2:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1C4E6 8
		.4byte	8, 3

		mGetTiles 0x1C4EE 8
		.4byte	4, 4

		mGetTiles 0x1C4E6 8
		.4byte	8, 3

		mGetTiles 0x1C4EE 8
		.4byte	4, 4

		mGetTiles 0x1C4E6 8
		.4byte	8, 3

		mGetTiles 0x1C4EE 8
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0648_3:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1C4F6 8
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0648:
		.4byte anim_data__0648_0
		.4byte anim_data__0648_1
		.4byte anim_data__0648_2
		.4byte anim_data__0648_3




.align 2, 0
	anim_data__0649_0:
		mGetPalette 0x8A 16 0x80
		mGetTiles 0x1C4FE 32
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0649:
		.4byte anim_data__0649_0




.align 2, 0
	anim_data__0650_0:
		mGetPalette 0x8A 16 0x80
		mGetTiles 0x1C51E 36
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0650:
		.4byte anim_data__0650_0




.align 2, 0
	anim_data__0651_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C542 120
		mAnimCmd6 0x0 0xB31A9BE6
		mAnimCmd6 0x1 0x708B5F8
		.4byte	2, 0

		mGetTiles 0x1C5BA 120
		.4byte	2, 1

		mGetTiles 0x1C632 108
		.4byte	2, 2

		mJumpBack 0x18


.align 2, 0
	anim_0651:
		.4byte anim_data__0651_0




.align 2, 0
	anim_data__0652_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C69E 16
		.4byte	2, 0

		mGetTiles 0x1C6AE 16
		.4byte	2, 1

		mGetTiles 0x1C6BE 16
		.4byte	2, 2

		mGetTiles 0x1C6CE 16
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0652:
		.4byte anim_data__0652_0




.align 2, 0
	anim_data__0653_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C6DE 16
		.4byte	2, 0

		mGetTiles 0x1C6EE 16
		.4byte	2, 1

		mJumpBack 0xD


.align 2, 0
	anim_0653:
		.4byte anim_data__0653_0




.align 2, 0
	anim_data__0654_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C6FE 4
		.4byte	2, 0

		mGetTiles 0x1C702 4
		.4byte	2, 1

		mJumpBack 0xD


.align 2, 0
	anim_0654:
		.4byte anim_data__0654_0




.align 2, 0
	anim_data__0655_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C706 30
		mAnimCmd6 0x0 0x720F8E1
		mAnimCmd6 0x1 0xDFFFDE
		mAnimCmd6 0x2 0x23FF22
		.4byte	4, 0

		mGetTiles 0x1C724 30
		.4byte	4, 1

		mGetTiles 0x1C742 30
		.4byte	4, 2

		mGetTiles 0x1C760 30
		.4byte	4, 3

		mJumpBack 0x20


.align 2, 0
	anim_0655:
		.4byte anim_data__0655_0




.align 2, 0
	anim_data__0656_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C77E 20
		mAnimCmd6 0x0 0x8AFC8AFC
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0656:
		.4byte anim_data__0656_0




.align 2, 0
	anim_data__0657_0:
		mGetPalette 0x8B 16 0xB0
		mGetTiles 0x1C792 6
		mAnimCmd6 0x0 0x50BFBF5
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0657_1:
		mGetPalette 0x8B 16 0xB0
		mGetTiles 0x1C798 3
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0657:
		.4byte anim_data__0657_0
		.4byte anim_data__0657_1




.align 2, 0
	anim_data__0658_0:
		mGetTiles 0x1C79B 8
		mGetPalette 0x8B 16 0x80
		mAnimCmd6 0x0 0x202FEFE
		.4byte	4, 0

		mAnimCmd6 0x0 0x404FCFC
		.4byte	4, 1

		mJumpBack 0xD


.align 2, 0
	anim_0658:
		.4byte anim_data__0658_0




.align 2, 0
	anim_data__0659_0:
		mGetPalette 0x9 16 0x20
		mGetTiles 0x1C7A3 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0659:
		.4byte anim_data__0659_0




.align 2, 0
	anim_data__0660_0:
		mGetPalette 0x8B 16 0x80
		mGetTiles 0x1C7C1 18
		.4byte	4, 0

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7C1 18
		.4byte	4, 0

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7D3 18
		.4byte	4, 1

		mGetTiles 0x1C7E5 18
		.4byte	4, 2

		mGetTiles 0x1C7F7 15
		.4byte	4, 3

		mGetTiles 0x1C806 9
		.4byte	4, 4

		mAnimCmd4 


.align 2, 0
	anim_0660:
		.4byte anim_data__0660_0




.align 2, 0
	anim_data__0661_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C80F 64
		mAnimCmd6 0x0 0x619E9E7
		mAnimCmd6 0x1 0x120606F9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0661_1:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C80F 64
		mAnimCmd6 0x0 0x619E9E7
		mAnimCmd6 0x1 0x120606F9
		.4byte	8, 0

		mGetTiles 0x1C84F 64
		.4byte	8, 1

		mGetTiles 0x1C88F 64
		.4byte	8, 2

		mGetTiles 0x1C84F 64
		.4byte	8, 3

		mGetTiles 0x1C80F 64
		.4byte	8, 4

		mAnimCmd4 

	anim_data__0661_2:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C8CF 56
		mAnimCmd6 0x0 0x619E9E7
		.4byte	10, 5

		mGetTiles 0x1C907 56
		mAnimCmd6 0x0 0x619E9E7
		mAnimCmd6 0x1 0x120A06F6
		.4byte	10, 6

		mGetTiles 0x1C80F 64
		.4byte	10, 0

		mAnimCmd4 

	anim_data__0661_3:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C8CF 56
		mAnimCmd6 0x0 0x619E9E7
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0661:
		.4byte anim_data__0661_0
		.4byte anim_data__0661_1
		.4byte anim_data__0661_2
		.4byte anim_data__0661_3




.align 2, 0
	anim_data__0662_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C93F 15
		mAnimCmd6 0x0 0x90FF9F0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0662_1:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C93F 15
		mAnimCmd6 0x0 0x912F9ED
		.4byte	8, 1

		mGetTiles 0x1C94E 15
		mAnimCmd6 0x0 0x910F9EE
		.4byte	8, 2

		mGetTiles 0x1C95D 15
		mAnimCmd6 0x0 0x912F9EC
		.4byte	8, 3

		mGetTiles 0x1C94E 15
		mAnimCmd6 0x0 0x910F9EE
		.4byte	8, 4

		mGetTiles 0x1C93F 15
		mAnimCmd6 0x0 0x911F9EC
		.4byte	8, 0

		mAnimCmd4 

	anim_data__0662_2:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C96C 20
		.4byte	6, 5

		mGetTiles 0x1C980 20
		.4byte	6, 6

		mGetTiles 0x1C994 25
		.4byte	6, 7

		mAnimCmd4 

	anim_data__0662_3:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1C994 25
		.4byte	6, 7

		mGetTiles 0x1C980 20
		.4byte	6, 6

		mGetTiles 0x1C96C 20
		.4byte	6, 5

		mGetTiles 0x1C93F 15
		mAnimCmd6 0x0 0x90FF9F0
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0662:
		.4byte anim_data__0662_0
		.4byte anim_data__0662_1
		.4byte anim_data__0662_2
		.4byte anim_data__0662_3




.align 2, 0
	anim_data__0663_0:
		mGetPalette 0x4B 16 0xA0
		mGetTiles 0x1C9AD 20
		mAnimCmd6 0x0 0x808F2F8
		.4byte	5, 0

		mGetTiles 0x1C9C1 32
		mAnimCmd6 0x0 0x808D4F8
		.4byte	5, 1

		mGetTiles 0x1C9E1 32
		mAnimCmd6 0x0 0x808D0F8
		.4byte	5, 2

		mGetTiles 0x1CA01 32
		mAnimCmd6 0x0 0xEC08D7F8
		.4byte	5, 3

		mGetTiles 0x1CA21 32
		mAnimCmd6 0x0 0x47004700
		.4byte	5, 4

		mGetTiles 0x1CA41 28
		.4byte	4, 5

		mGetTiles 0x1CA5D 28
		.4byte	4, 6

		mAnimCmd4 


.align 2, 0
	anim_0663:
		.4byte anim_data__0663_0




.align 2, 0
	anim_data__0664_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1CA79 8
		mAnimCmd6 0x0 0xFD05EAFA
		.4byte	3, 0

		mGetTiles 0x1CA81 8
		.4byte	3, 1

		mGetTiles 0x1CA89 8
		.4byte	3, 2

		mGetTiles 0x1CA91 8
		.4byte	3, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0664:
		.4byte anim_data__0664_0




.align 2, 0
	anim_data__0665_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1CA99 8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0665:
		.4byte anim_data__0665_0




.align 2, 0
	anim_data__0666_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1CAA1 9
		mAnimCmd6 0x0 0x505FBFB
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0666:
		.4byte anim_data__0666_0




.align 2, 0
	anim_data__0667_0:
		mGetPalette 0x8C 16 0x80
		mGetTiles 0x1CAAA 4
		mAnimCmd6 0x0 0x404FCFC
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0667:
		.4byte anim_data__0667_0




.align 2, 0
	anim_data__0668_0:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1CAAE 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0668_1:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1CAB6 8
		.4byte	6, 1

		mGetTiles 0x1CABE 8
		.4byte	6, 2

		mGetTiles 0x1CAB6 8
		.4byte	6, 1

		mGetTiles 0x1CABE 8
		.4byte	6, 2

		mGetTiles 0x1CAB6 8
		.4byte	6, 1

		mGetTiles 0x1CABE 8
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0668_2:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1CAC6 8
		.4byte	8, 3

		mGetTiles 0x1CACE 8
		.4byte	4, 4

		mGetTiles 0x1CAC6 8
		.4byte	8, 3

		mGetTiles 0x1CACE 8
		.4byte	4, 4

		mGetTiles 0x1CAC6 8
		.4byte	8, 3

		mGetTiles 0x1CACE 8
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0668_3:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1CAAE 8
		.4byte	8, 0

		mGetTiles 0x1CAD6 8
		.4byte	8, 5

		mGetTiles 0x1CADE 8
		.4byte	8, 6

		mGetTiles 0x1CAD6 8
		.4byte	8, 7

		mGetTiles 0x1CAAE 8
		.4byte	8, 8

		mAnimCmd4 

	anim_data__0668_4:
		mGetPalette 0x86 16 0xC0
		mGetTiles 0x1CAE6 8
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_0668:
		.4byte anim_data__0668_0
		.4byte anim_data__0668_1
		.4byte anim_data__0668_2
		.4byte anim_data__0668_3
		.4byte anim_data__0668_4




.align 2, 0
	anim_data__0669_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CAEE 36
		mAnimCmd6 0x0 0xF60EE2F2
		mAnimCmd6 0x1 0x712E9EE
		mAnimCmd6 0x2 0xE0E05F1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0669:
		.4byte anim_data__0669_0




.align 2, 0
	anim_data__0670_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB12 20
		mAnimCmd6 0x0 0x711F9EF
		mAnimCmd6 0x1 0xF90AEBF6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0670:
		.4byte anim_data__0670_0




.align 2, 0
	anim_data__0671_0:
		mGetPalette 0x8D 16 0x90
		mGetTiles 0x1CB26 25
		mAnimCmd6 0x0 0x70EECF2
		mAnimCmd6 0x1 0xE0E07F1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0671:
		.4byte anim_data__0671_0




.align 2, 0
	anim_data__0672_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB3F 25
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0672_1:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB3F 25
		.4byte	20, 0

		mGetTiles 0x1CB58 25
		.4byte	8, 1

		mGetTiles 0x1CB71 36
		.4byte	4, 2

		mGetTiles 0x1CB95 42
		mAnimCmd6 0x0 0x1AFDE8CB
		mAnimCmd6 0x1 0x8F2FDE7
		.4byte	12, 3

		mAnimCmd4 

	anim_data__0672_2:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CB71 36
		.4byte	8, 2

		mGetTiles 0x1CB3F 25
		.4byte	10, 0

		mAnimCmd4 


.align 2, 0
	anim_0672:
		.4byte anim_data__0672_0
		.4byte anim_data__0672_1
		.4byte anim_data__0672_2




.align 2, 0
	anim_data__0673_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBBF 1
		.4byte	3, 0

		mGetTiles 0x1CBC0 4
		.4byte	3, 1

		mGetTiles 0x1CBC4 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0673:
		.4byte anim_data__0673_0




.align 2, 0
	anim_data__0674_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBC8 1
		.4byte	3, 0

		mGetTiles 0x1CBC9 4
		.4byte	3, 1

		mGetTiles 0x1CBCD 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0674:
		.4byte anim_data__0674_0




.align 2, 0
	anim_data__0675_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBD1 1
		.4byte	3, 0

		mGetTiles 0x1CBD2 4
		.4byte	3, 1

		mGetTiles 0x1CBD6 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0675:
		.4byte anim_data__0675_0




.align 2, 0
	anim_data__0676_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBDA 1
		.4byte	3, 0

		mGetTiles 0x1CBDB 4
		.4byte	3, 1

		mGetTiles 0x1CBDF 4
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0676:
		.4byte anim_data__0676_0




.align 2, 0
	anim_data__0677_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBE3 2
		.4byte	3, 0

		mGetTiles 0x1CBE5 2
		.4byte	3, 1

		mGetTiles 0x1CBE7 2
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0677:
		.4byte anim_data__0677_0




.align 2, 0
	anim_data__0678_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBE9 2
		.4byte	3, 0

		mGetTiles 0x1CBEB 2
		.4byte	3, 1

		mGetTiles 0x1CBED 2
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0678:
		.4byte anim_data__0678_0




.align 2, 0
	anim_data__0679_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBEF 2
		.4byte	3, 0

		mGetTiles 0x1CBF1 2
		.4byte	3, 1

		mGetTiles 0x1CBF3 2
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0679:
		.4byte anim_data__0679_0




.align 2, 0
	anim_data__0680_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBF5 2
		.4byte	3, 0

		mGetTiles 0x1CBF7 2
		.4byte	3, 1

		mGetTiles 0x1CBF9 2
		.4byte	3, 2

		mAnimCmd4 


.align 2, 0
	anim_0680:
		.4byte anim_data__0680_0




.align 2, 0
	anim_data__0681_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CBFB 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0681:
		.4byte anim_data__0681_0




.align 2, 0
	anim_data__0682_0:
		mGetPalette 0x8D 16 0x90
		mGetTiles 0x1CBFF 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0682:
		.4byte anim_data__0682_0




.align 2, 0
	anim_data__0683_0:
		mGetPalette 0x8D 16 0x80
		mGetTiles 0x1CC3F 4
		.4byte	4, 0

		mGetTiles 0x1CC43 4
		.4byte	4, 1

		mGetTiles 0x1CC47 4
		.4byte	4, 2

		mJumpBack 0x12


.align 2, 0
	anim_0683:
		.4byte anim_data__0683_0




.align 2, 0
	anim_data__0684_0:
		mGetPalette 0x8E 16 0xC0
		mGetTiles 0x1CC4B 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0684_1:
		mGetPalette 0x8E 16 0xC0
		mGetTiles 0x1CC53 8
		.4byte	6, 1

		mGetTiles 0x1CC5B 8
		.4byte	6, 2

		mGetTiles 0x1CC53 8
		.4byte	6, 1

		mGetTiles 0x1CC5B 8
		.4byte	6, 2

		mGetTiles 0x1CC53 8
		.4byte	6, 1

		mGetTiles 0x1CC5B 8
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0684_2:
		mGetPalette 0x8E 16 0xC0
		mGetTiles 0x1CC63 8
		.4byte	8, 3

		mGetTiles 0x1CC6B 8
		.4byte	4, 4

		mGetTiles 0x1CC63 8
		.4byte	8, 3

		mGetTiles 0x1CC6B 8
		.4byte	4, 4

		mGetTiles 0x1CC63 8
		.4byte	8, 3

		mGetTiles 0x1CC6B 8
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0684_3:
		mGetPalette 0x8E 16 0xC0
		mGetTiles 0x1CC73 8
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0684:
		.4byte anim_data__0684_0
		.4byte anim_data__0684_1
		.4byte anim_data__0684_2
		.4byte anim_data__0684_3




.align 2, 0
	anim_data__0685_0:
		mGetPalette 0x8F 16 0x0
		mGetTiles 0x1CC7B 196
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0685:
		.4byte anim_data__0685_0




.align 2, 0
	anim_data__0686_0:
		mGetPalette 0x8F 16 0x0
		.4byte	1, -1

		mGetPalette 0x90 16 0x0
		.4byte	1, -1

		mGetPalette 0x91 16 0x0
		.4byte	1, -1

		mGetPalette 0x92 16 0x0
		.4byte	1, -1

		mGetPalette 0x93 16 0x0
		.4byte	1, -1

		mGetPalette 0x94 16 0x0
		.4byte	1, -1

		mGetPalette 0x95 16 0x0
		.4byte	1, -1

		mJumpBack 0x23


.align 2, 0
	anim_0686:
		.4byte anim_data__0686_0




.align 2, 0
	anim_data__0687_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CD3F 42
		mAnimCmd6 0x0 0x210E9F0
		mAnimCmd6 0x1 0x1617F6E9
		.4byte	3, 0

		mAnimCmd4 

	anim_data__0687_1:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CD69 42
		mAnimCmd6 0x0 0x210E9F0
		mAnimCmd6 0x1 0x1617F6E9
		.4byte	3, 1

		mGetTiles 0x1CD3F 42
		.4byte	3, 0

		mGetTiles 0x1CD93 42
		.4byte	3, 2

		mJumpBack 0x18


.align 2, 0
	anim_0687:
		.4byte anim_data__0687_0
		.4byte anim_data__0687_1




.align 2, 0
	anim_data__0688_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CDBD 4
		.4byte	3, 0

		mGetTiles 0x1CDC1 4
		.4byte	3, 1

		mGetTiles 0x1CDC5 4
		.4byte	3, 2

		mGetTiles 0x1CDC9 4
		.4byte	3, 3

		mGetTiles 0x1CDCD 4
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0688:
		.4byte anim_data__0688_0




.align 2, 0
	anim_data__0689_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CDD1 4
		mAnimCmd6 0x0 0x404FCFC
		.4byte	1, 0

		mGetTiles 0x1CDD5 4
		.4byte	1, 1

		mGetTiles 0x1CDD9 4
		.4byte	1, 2

		mGetTiles 0x1CDDD 4
		.4byte	1, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0689:
		.4byte anim_data__0689_0




.align 2, 0
	anim_data__0690_0:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CDE1 12
		mAnimCmd6 0x0 0x618FAE8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0690_1:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CDED 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0690_2:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CDE1 12
		mAnimCmd6 0x0 0x618FAE8
		.4byte	2, 0

		mGetTiles 0x1CDED 12
		.4byte	4, 1

		mJumpBack 0x10

	anim_data__0690_3:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CDF9 18
		mAnimCmd6 0x0 0x618F0E8
		.4byte	5, 2

		mGetTiles 0x1CE0B 24
		.4byte	3, 3

		mGetTiles 0x1CE23 24
		.4byte	5, 4

		mAnimCmd4 

	anim_data__0690_4:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CE3B 64
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0690:
		.4byte anim_data__0690_0
		.4byte anim_data__0690_1
		.4byte anim_data__0690_2
		.4byte anim_data__0690_3
		.4byte anim_data__0690_4




.align 2, 0
	anim_data__0691_0:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CE7B 12
		mAnimCmd6 0x0 0x618FAE8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0691_1:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CE87 64
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0691_2:
		mGetPalette 0x97 16 0x80
		mGetTiles 0x1CE7B 12
		mAnimCmd6 0x0 0x618FAE8
		.4byte	2, 0

		mGetTiles 0x1CEC7 12
		.4byte	4, 2

		mJumpBack 0x10


.align 2, 0
	anim_0691:
		.4byte anim_data__0691_0
		.4byte anim_data__0691_1
		.4byte anim_data__0691_2




.align 2, 0
	anim_data__0692_0:
		mGetPalette 0x96 16 0x80
		mGetTiles 0x1CED3 4
		.4byte	10, 0

		mGetTiles 0x1CED7 4
		.4byte	10, 1

		mJumpBack 0xD


.align 2, 0
	anim_0692:
		.4byte anim_data__0692_0




.align 2, 0
	anim_data__0693_0:
		mGetPalette 0x98 16 0xC0
		mGetTiles 0x1CEDB 8
		mAnimCmd6 0x0 0x21092108
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0693_1:
		mGetPalette 0x98 16 0xC0
		mGetTiles 0x1CEE3 8
		.4byte	6, 1

		mGetTiles 0x1CEEB 8
		.4byte	6, 2

		mGetTiles 0x1CEE3 8
		.4byte	6, 1

		mGetTiles 0x1CEEB 8
		.4byte	6, 2

		mGetTiles 0x1CEE3 8
		.4byte	6, 1

		mGetTiles 0x1CEEB 8
		.4byte	6, 2

		mAnimCmd4 

	anim_data__0693_2:
		mGetPalette 0x98 16 0xC0
		mGetTiles 0x1CEF3 8
		.4byte	8, 3

		mGetTiles 0x1CEFB 8
		.4byte	4, 4

		mGetTiles 0x1CEF3 8
		.4byte	8, 3

		mGetTiles 0x1CEFB 8
		.4byte	4, 4

		mGetTiles 0x1CEF3 8
		.4byte	8, 3

		mGetTiles 0x1CEFB 8
		.4byte	4, 4

		mAnimCmd4 

	anim_data__0693_3:
		mGetPalette 0x98 16 0xC0
		mGetTiles 0x1CF03 8
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0693:
		.4byte anim_data__0693_0
		.4byte anim_data__0693_1
		.4byte anim_data__0693_2
		.4byte anim_data__0693_3




.align 2, 0
	anim_data__0694_0:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CF0B 64
		mAnimCmd6 0x0 0x1613EAED
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0694_1:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CF4B 64
		mAnimCmd6 0x0 0x1613EAED
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mGetTiles 0x1CF4B 64
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mGetTiles 0x1CF4B 64
		.4byte	6, 1

		mGetTiles 0x1CF8B 64
		.4byte	6, 2

		mJumpBack 0x24

	anim_data__0694_2:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mGetTiles 0x1CFCB 64
		.4byte	5, 3

		mGetTiles 0x1D00B 64
		.4byte	3, 4

		mJumpBack 0x21

	anim_data__0694_3:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D04B 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0694_4:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D08B 64
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0694:
		.4byte anim_data__0694_0
		.4byte anim_data__0694_1
		.4byte anim_data__0694_2
		.4byte anim_data__0694_3
		.4byte anim_data__0694_4




.align 2, 0
	anim_data__0695_0:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D0CB 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0695:
		.4byte anim_data__0695_0




.align 2, 0
	anim_data__0696_0:
		mGetPalette 0x99 16 0xB0
		mGetTiles 0x1D10B 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0696:
		.4byte anim_data__0696_0




.align 2, 0
	anim_data__0697_0:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D14B 12
		.4byte	1, 0

		mGetTiles 0x1D157 12
		.4byte	1, 1

		mGetTiles 0x1D163 12
		.4byte	1, 2

		mJumpBack 0x12


.align 2, 0
	anim_0697:
		.4byte anim_data__0697_0




.align 2, 0
	anim_data__0698_0:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D16F 6
		mAnimCmd6 0x0 0xFF06EDFA
		.4byte	3, 0

		mGetTiles 0x1D175 6
		.4byte	3, 1

		mGetTiles 0x1D17B 6
		.4byte	3, 2

		mGetTiles 0x1D181 6
		.4byte	3, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0698:
		.4byte anim_data__0698_0




.align 2, 0
	anim_data__0699_0:
		mGetTiles 0x1D187 33
		mGetPalette 0x4B 16 0xA0
		mAnimCmd6 0x0 0x102F2FD
		.4byte	5, 0

		mAnimCmd6 0x0 0x102EBFD
		.4byte	5, 1

		mAnimCmd6 0x0 0x102E7FD
		.4byte	5, 2

		mAnimCmd6 0x0 0x102E4FD
		.4byte	5, 3

		mAnimCmd6 0x0 0xFA02E5FD
		.4byte	5, 4

		mAnimCmd6 0x0 0x102E7FD
		.4byte	4, 5

		mAnimCmd6 0x0 0x102EBFD
		.4byte	4, 6

		mAnimCmd6 0x0 0x102EBFD
		.4byte	4, 7

		mAnimCmd6 0x0 0x102F2FD
		.4byte	4, 8

		mAnimCmd6 0x0 0x102F2FD
		.4byte	4, 9

		mAnimCmd4 


.align 2, 0
	anim_0699:
		.4byte anim_data__0699_0




.align 2, 0
	anim_data__0700_0:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D1A8 4
		mAnimCmd6 0x0 0x202FEFE
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0700_1:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D1AC 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0700_2:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D1B0 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0700_3:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D1B4 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0700_4:
		mGetPalette 0x99 16 0x80
		mGetTiles 0x1D1B8 4
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0700:
		.4byte anim_data__0700_0
		.4byte anim_data__0700_1
		.4byte anim_data__0700_2
		.4byte anim_data__0700_3
		.4byte anim_data__0700_4




.align 2, 0
	anim_data__0701_0:
		mGetPalette 0x9A 16 0xB0
		mGetTiles 0x1D1BC 15
		mAnimCmd6 0x0 0xF614E8EC
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0701:
		.4byte anim_data__0701_0




.align 2, 0
	anim_data__0702_0:
		mGetPalette 0x9A 16 0xB0
		mGetTiles 0x1D1CB 32
		mAnimCmd6 0x0 0x10C0F0
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0702:
		.4byte anim_data__0702_0




.align 2, 0
	anim_data__0703_0:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D1EB 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0703_1:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D1EB 64
		.4byte	2, 0

		mGetTiles 0x1D22B 64
		.4byte	2, 1

		mGetTiles 0x1D26B 64
		.4byte	2, 2

		mGetTiles 0x1D2AB 64
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0703_2:
		mGetPalette 0x9B 16 0x90
		mGetTiles 0x1D2EB 64
		mAnimCmd6 0x0 0x10001
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0703:
		.4byte anim_data__0703_0
		.4byte anim_data__0703_1
		.4byte anim_data__0703_2




.align 2, 0
	anim_data__0704_0:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D32B 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0704_1:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D32B 64
		.4byte	2, 0

		mGetTiles 0x1D36B 64
		.4byte	2, 1

		mGetTiles 0x1D3AB 64
		.4byte	2, 2

		mGetTiles 0x1D3EB 64
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0704_2:
		mGetPalette 0x9B 16 0xC0
		mGetTiles 0x1D42B 64
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0704:
		.4byte anim_data__0704_0
		.4byte anim_data__0704_1
		.4byte anim_data__0704_2




.align 2, 0
	anim_data__0705_0:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D46B 64
		mAnimCmd6 0x0 0x1112EFF0
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0705_1:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D46B 64
		mAnimCmd6 0x0 0x1112EFF0
		.4byte	3, 0

		mGetTiles 0x1D4AB 64
		.4byte	3, 1

		mGetTiles 0x1D4EB 64
		.4byte	3, 2

		mGetTiles 0x1D4AB 64
		.4byte	3, 1

		mGetTiles 0x1D46B 64
		mAnimCmd6 0x0 0xFA10EEF0
		.4byte	3, 0

		mAnimCmd4 

	anim_data__0705_2:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D52B 64
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0705_3:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D56B 64
		.4byte	2, 4

		mGetTiles 0x1D5AB 64
		.4byte	2, 5

		mJumpBack 0xD


.align 2, 0
	anim_0705:
		.4byte anim_data__0705_0
		.4byte anim_data__0705_1
		.4byte anim_data__0705_2
		.4byte anim_data__0705_3




.align 2, 0
	anim_data__0706_0:
		mGetPalette 0x9C 16 0x80
		mGetTiles 0x1D5EB 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0706:
		.4byte anim_data__0706_0




.align 2, 0
	anim_data__0707_0:
		mGetTiles 0x1D5EC 32
		mGetPalette 0x9A 16 0x80
		.4byte	2, 0

		.4byte	2, 1

		.4byte	2, 2

		.4byte	2, 3

		.4byte	2, 4

		.4byte	2, 5

		.4byte	2, 6

		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0707:
		.4byte anim_data__0707_0




.align 2, 0
	anim_data__0708_0:
		mGetPalette 0x9D 16 0x10
		mGetTiles 0x1D60C 90
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0708:
		.4byte anim_data__0708_0




.align 2, 0
	anim_data__0709_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D666 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0709:
		.4byte anim_data__0709_0




.align 2, 0
	anim_data__0710_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D6A6 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0710:
		.4byte anim_data__0710_0




.align 2, 0
	anim_data__0711_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D6E6 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0711:
		.4byte anim_data__0711_0




.align 2, 0
	anim_data__0712_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D726 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0712:
		.4byte anim_data__0712_0




.align 2, 0
	anim_data__0713_0:
		mGetPalette 0x34 16 0xA0
		mGetTiles 0x1D766 16
		.4byte	4, 0

		mGetTiles 0x1D776 16
		.4byte	4, 1

		mGetTiles 0x1D786 16
		.4byte	4, 2

		mGetTiles 0x1D796 16
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0713:
		.4byte anim_data__0713_0




.align 2, 0
	anim_data__0714_0:
		mGetTiles 0x1D7A6 32
		mGetPalette 0x9D 16 0x80
		.4byte	2, 0

		.4byte	2, 1

		.4byte	2, 2

		.4byte	2, 3

		.4byte	2, 4

		.4byte	2, 5

		.4byte	2, 6

		.4byte	2, 7

		mJumpBack 0x13


.align 2, 0
	anim_0714:
		.4byte anim_data__0714_0




.align 2, 0
	anim_data__0715_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7C6 6
		.4byte	3, 0

		mGetTiles 0x1D7CC 6
		.4byte	3, 1

		mGetTiles 0x1D7D2 6
		.4byte	3, 2

		mGetTiles 0x1D7D8 9
		.4byte	3, 3

		mGetTiles 0x1D7E1 9
		.4byte	10, 4

		mGetTiles 0x1D7D8 9
		.4byte	3, 3

		mGetTiles 0x1D7D2 6
		.4byte	3, 2

		mGetTiles 0x1D7CC 6
		.4byte	3, 1

		mGetTiles 0x1D7C6 6
		.4byte	3, 0

		mJumpBack 0x30


.align 2, 0
	anim_0715:
		.4byte anim_data__0715_0




.align 2, 0
	anim_data__0716_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7EA 8
		mAnimCmd6 0x1 0x604F1FD
		.4byte	1, 0

		mGetTiles 0x1D7F2 8
		.4byte	1, 1

		mJumpBack 0x10

	anim_data__0716_1:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7FA 8
		mAnimCmd6 0x1 0x605F3FA
		.4byte	1, 2

		mGetTiles 0x1D802 8
		.4byte	1, 3

		mJumpBack 0x10

	anim_data__0716_2:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D80A 16
		mAnimCmd6 0x1 0x506F5F6
		.4byte	1, 4

		mGetTiles 0x1D81A 16
		.4byte	1, 5

		mJumpBack 0x10

	anim_data__0716_3:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D82A 8
		mAnimCmd6 0x1 0x406F9F3
		.4byte	1, 6

		mGetTiles 0x1D832 8
		.4byte	1, 7

		mJumpBack 0x10

	anim_data__0716_4:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D83A 8
		mAnimCmd6 0x1 0x306FCF1
		.4byte	1, 8

		mGetTiles 0x1D842 8
		.4byte	1, 9

		mJumpBack 0x10

	anim_data__0716_5:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D84A 8
		mAnimCmd6 0x1 0x506FCF2
		.4byte	1, 10

		mGetTiles 0x1D852 8
		.4byte	1, 11

		mJumpBack 0x10

	anim_data__0716_6:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D85A 16
		mAnimCmd6 0x1 0xA05FAF5
		.4byte	1, 12

		mGetTiles 0x1D86A 16
		.4byte	1, 13

		mJumpBack 0x10

	anim_data__0716_7:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D87A 12
		mAnimCmd6 0x1 0xD04FAF8
		.4byte	1, 14

		mGetTiles 0x1D886 12
		.4byte	1, 15

		mJumpBack 0x10

	anim_data__0716_8:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7EA 8
		mAnimCmd6 0x1 0xF03FAFC
		.4byte	1, 16

		mGetTiles 0x1D7F2 8
		.4byte	1, 17

		mJumpBack 0x10

	anim_data__0716_9:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D7FA 8
		mAnimCmd6 0x1 0xE07FBFB
		.4byte	1, 18

		mGetTiles 0x1D802 8
		.4byte	1, 19

		mJumpBack 0x10

	anim_data__0716_10:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D80A 16
		mAnimCmd6 0x1 0xC0BFBFA
		.4byte	1, 20

		mGetTiles 0x1D81A 16
		.4byte	1, 21

		mJumpBack 0x10

	anim_data__0716_11:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D82A 8
		mAnimCmd6 0x1 0x80DFBFA
		.4byte	1, 22

		mGetTiles 0x1D832 8
		.4byte	1, 23

		mJumpBack 0x10

	anim_data__0716_12:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D83A 8
		mAnimCmd6 0x1 0x40FFDFA
		.4byte	1, 24

		mGetTiles 0x1D842 8
		.4byte	1, 25

		mJumpBack 0x10

	anim_data__0716_13:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D84A 8
		mAnimCmd6 0x1 0x50EFAFA
		.4byte	1, 26

		mGetTiles 0x1D852 8
		.4byte	1, 27

		mJumpBack 0x10

	anim_data__0716_14:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D85A 16
		mAnimCmd6 0x1 0x60CF5FB
		.4byte	1, 28

		mGetTiles 0x1D86A 16
		.4byte	1, 29

		mJumpBack 0x10

	anim_data__0716_15:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D87A 12
		mAnimCmd6 0x1 0x708F2FC
		.4byte	1, 30

		mGetTiles 0x1D886 12
		.4byte	1, 31

		mJumpBack 0x10


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
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D892 9
		.4byte	3, 0

		mGetTiles 0x1D89B 9
		.4byte	3, 1

		mGetTiles 0x1D8A4 9
		.4byte	3, 2

		mGetTiles 0x1D8AD 4
		.4byte	3, 3

		mGetTiles 0x1D8B1 1
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0717:
		.4byte anim_data__0717_0




.align 2, 0
	anim_data__0718_0:
		mGetPalette 0x34 16 0xD0
		mGetTiles 0x1D8B2 16
		mAnimCmd6 0x0 0x403FCFB
		.4byte	2, 0

		mGetTiles 0x1D8C2 16
		.4byte	2, 1

		mGetTiles 0x1D8D2 16
		.4byte	2, 2

		mGetTiles 0x1D8E2 16
		.4byte	2, 3

		mJumpBack 0x1A


.align 2, 0
	anim_0718:
		.4byte anim_data__0718_0




.align 2, 0
	anim_data__0719_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D8F2 4
		mAnimCmd6 0x0 0x404FCFC
		.4byte	2, 0

		mGetTiles 0x1D8F6 4
		mAnimCmd6 0x0 0x0
		.4byte	2, 1

		mJumpBack 0x13


.align 2, 0
	anim_0719:
		.4byte anim_data__0719_0




.align 2, 0
	anim_data__0720_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D8FA 1
		.4byte	3, 0

		mGetTiles 0x1D8FB 1
		.4byte	3, 1

		mGetTiles 0x1D8FC 1
		.4byte	3, 2

		mGetTiles 0x1D8FD 1
		.4byte	3, 3

		mGetTiles 0x1D8FE 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0720:
		.4byte anim_data__0720_0




.align 2, 0
	anim_data__0721_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D8FF 1
		.4byte	3, 0

		mGetTiles 0x1D900 1
		.4byte	3, 1

		mGetTiles 0x1D901 1
		.4byte	3, 2

		mGetTiles 0x1D902 1
		.4byte	3, 3

		mGetTiles 0x1D903 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0721:
		.4byte anim_data__0721_0




.align 2, 0
	anim_data__0722_0:
		mGetPalette 0x9D 16 0x80
		mGetTiles 0x1D904 1
		.4byte	3, 0

		mGetTiles 0x1D905 1
		.4byte	3, 1

		mGetTiles 0x1D906 1
		.4byte	3, 2

		mGetTiles 0x1D907 1
		.4byte	3, 3

		mGetTiles 0x1D908 1
		.4byte	3, 4

		mJumpBack 0x1C


.align 2, 0
	anim_0722:
		.4byte anim_data__0722_0




.align 2, 0
	anim_data__0723_0:
		mGetPalette 0x9D 16 0x0
		mGetTiles 0x1D909 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0723_1:
		mGetPalette 0x9D 16 0x0
		mGetTiles 0x1D919 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0723_2:
		mGetPalette 0x9E 16 0x0
		mGetTiles 0x1D929 64
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0723:
		.4byte anim_data__0723_0
		.4byte anim_data__0723_1
		.4byte anim_data__0723_2




.align 2, 0
	anim_data__0724_0:
		mGetTiles 0x1D969 16
		mGetPalette 0x34 16 0x70
		mAnimCmd6 0x0 0x10DE5F3
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0724:
		.4byte anim_data__0724_0




.align 2, 0
	anim_data__0725_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1D979 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0725_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1D97D 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0725_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1D981 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0725_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1D985 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0725_4:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x1D989 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0725_5:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1D98D 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0725_6:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D991 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0725_7:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D995 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0725_8:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D999 4
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0725_9:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D99D 4
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0725_10:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9A1 4
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0725_11:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9A5 4
		.4byte	1, 11

		mAnimCmd4 

	anim_data__0725_12:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9A9 4
		.4byte	1, 12

		mAnimCmd4 

	anim_data__0725_13:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D9AD 4
		.4byte	1, 13

		mAnimCmd4 

	anim_data__0725_14:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D9B1 4
		.4byte	1, 14

		mAnimCmd4 

	anim_data__0725_15:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x1D9B5 4
		.4byte	1, 15

		mAnimCmd4 

	anim_data__0725_16:
		mGetPalette 0xA0 16 0xA0
		mGetTiles 0x1D9B9 4
		.4byte	1, 16

		mAnimCmd4 


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
		mGetTiles 0x1D9BD 16
		mGetPalette 0xA1 16 0x60
		.4byte	8, 0

		.4byte	8, 1

		.4byte	8, 2

		.4byte	8, 3

		mJumpBack 0xB


.align 2, 0
	anim_0726:
		.4byte anim_data__0726_0




.align 2, 0
	anim_data__0727_0:
		mGetTiles 0x1D9CD 16
		mGetPalette 0xA1 16 0x60
		mPlaySoundEffect 117
		.4byte	4, 0

		.4byte	4, 1

		.4byte	4, 2

		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0727:
		.4byte anim_data__0727_0




.align 2, 0
	anim_data__0728_0:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9DD 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0728_1:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9DF 2
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0728_2:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9E1 2
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0728_3:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9E3 2
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0728_4:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9E5 2
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0728:
		.4byte anim_data__0728_0
		.4byte anim_data__0728_1
		.4byte anim_data__0728_2
		.4byte anim_data__0728_3
		.4byte anim_data__0728_4




.align 2, 0
	anim_data__0729_0:
		mGetPalette 0xA2 16 0x0
		mGetTiles 0x1D9E7 9
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0729:
		.4byte anim_data__0729_0




.align 2, 0
	anim_data__0730_0:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1D9F0 9
		mAnimCmd6 0x0 0x410E4F0
		.4byte	4, 0

		mGetTiles 0x1D9F9 9
		.4byte	4, 1

		mGetTiles 0x1DA02 9
		.4byte	4, 2

		mGetTiles 0x1DA0B 9
		.4byte	4, 3

		mGetTiles 0x1DA14 6
		.4byte	4, 4

		mGetTiles 0x1DA1A 6
		.4byte	4, 5

		mGetTiles 0x1DA20 9
		.4byte	4, 6

		mGetTiles 0x1DA29 9
		.4byte	4, 7

		mJumpBack 0x2E

	anim_data__0730_1:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x1DA32 9
		.4byte	4, 8

		mGetTiles 0x1DA3B 9
		.4byte	4, 9

		mGetTiles 0x1DA44 9
		.4byte	4, 10

		mGetTiles 0x1DA4D 9
		.4byte	4, 11

		mAnimCmd4 


.align 2, 0
	anim_0730:
		.4byte anim_data__0730_0
		.4byte anim_data__0730_1




.align 2, 0
	anim_data__0731_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DA56 64
		mAnimCmd6 0x0 0x46474547
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0731_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DA96 64
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0731_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DAD6 64
		mAnimCmd6 0x0 0xFF00FF00
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0731_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB16 64
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0731_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB56 14
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0731:
		.4byte anim_data__0731_0
		.4byte anim_data__0731_1
		.4byte anim_data__0731_2
		.4byte anim_data__0731_3
		.4byte anim_data__0731_4




.align 2, 0
	anim_data__0732_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB64 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0732_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB74 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0732_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB84 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0732_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DB94 16
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0732:
		.4byte anim_data__0732_0
		.4byte anim_data__0732_1
		.4byte anim_data__0732_2
		.4byte anim_data__0732_3




.align 2, 0
	anim_data__0733_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x1DBA4 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0733:
		.4byte anim_data__0733_0




.align 2, 0
	anim_data__0734_0:
		mGetPalette 0xA4 16 0x60
		mGetTiles 0x1DBD4 3
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0734:
		.4byte anim_data__0734_0




.align 2, 0
	anim_data__0735_0:
		mGetPalette 0xA5 16 0x60
		mGetTiles 0x1DBD7 26
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0735:
		.4byte anim_data__0735_0




.align 2, 0
	anim_data__0736_0:
		mGetPalette 0xA6 16 0x70
		mGetTiles 0x1DBF1 140
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0736_1:
		mGetPalette 0xA6 16 0x70
		mGetTiles 0x1DC7D 140
		.4byte	5, 1

		mGetTiles 0x1DD09 140
		.4byte	2, 2

		mGetTiles 0x1DD95 140
		.4byte	15, 3

		mAnimCmd4 

	anim_data__0736_2:
		mGetPalette 0xA7 16 0xB0
		mGetTiles 0x1DE21 91
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0736_3:
		mGetPalette 0xA7 16 0xB0
		mGetTiles 0x1DE7C 104
		.4byte	4, 5

		mGetTiles 0x1DEE4 117
		.4byte	4, 6

		mGetTiles 0x1DF59 130
		.4byte	4, 7

		mGetTiles 0x1DFDB 130
		.4byte	4, 8

		mGetTiles 0x1E05D 130
		.4byte	15, 9

		mAnimCmd4 

	anim_data__0736_4:
		mGetPalette 0xA8 16 0x80
		mGetTiles 0x1E0DF 130
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0736_5:
		mGetPalette 0xA8 16 0x80
		mGetTiles 0x1E161 130
		.4byte	4, 11

		mGetTiles 0x1E1E3 143
		.4byte	3, 12

		mGetTiles 0x1E272 144
		.4byte	3, 13

		mGetTiles 0x1E302 144
		.4byte	4, 14

		mGetTiles 0x1E392 144
		.4byte	15, 15

		mAnimCmd4 

	anim_data__0736_6:
		mGetPalette 0xA9 16 0x90
		mGetTiles 0x1E422 140
		.4byte	1, 16

		mAnimCmd4 

	anim_data__0736_7:
		mGetPalette 0xA9 16 0x90
		mGetTiles 0x1E4AE 140
		.4byte	4, 17

		mGetTiles 0x1E53A 140
		.4byte	3, 18

		mGetTiles 0x1E5C6 140
		.4byte	2, 19

		mGetTiles 0x1E652 140
		.4byte	15, 20

		mAnimCmd4 

	anim_data__0736_8:
		mGetPalette 0xAA 16 0xA0
		mGetTiles 0x1E6DE 130
		.4byte	1, 21

		mAnimCmd4 

	anim_data__0736_9:
		mGetPalette 0xAA 16 0xA0
		mGetTiles 0x1E760 130
		.4byte	4, 22

		mGetTiles 0x1E7E2 130
		.4byte	4, 23

		mGetTiles 0x1E864 130
		.4byte	4, 24

		mGetTiles 0x1E8E6 130
		.4byte	5, 25

		mGetTiles 0x1E968 130
		.4byte	15, 26

		mAnimCmd4 

	anim_data__0736_10:
		mGetPalette 0xAB 16 0xC0
		mGetTiles 0x1E9EA 35
		.4byte	1, 27

		mAnimCmd4 

	anim_data__0736_11:
		mGetPalette 0xAB 16 0xC0
		mGetTiles 0x1EA0D 35
		.4byte	3, 28

		mGetTiles 0x1EA30 35
		.4byte	3, 29

		mGetTiles 0x1EA53 35
		.4byte	3, 30

		mGetTiles 0x1EA76 35
		.4byte	2, 31

		mGetTiles 0x1EA99 35
		.4byte	15, 32

		mAnimCmd4 


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
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EABC 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0737_1:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EACC 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0737_2:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EADC 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0737_3:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EAEC 16
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0737_4:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EAFC 16
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0737_5:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EB0C 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0737_6:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EB4C 64
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0737_7:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EB8C 64
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0737_8:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EBCC 64
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0737_9:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EC0C 64
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0xAD 16 0x30
		mGetTiles 0x1EC4C 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0738_1:
		mGetPalette 0xAD 16 0x30
		mGetTiles 0x1EC64 24
		.4byte	3, 1

		mGetTiles 0x1EC7C 24
		.4byte	3, 2

		mGetTiles 0x1EC94 24
		.4byte	3, 3

		mGetTiles 0x1ECAC 24
		.4byte	3, 4

		mJumpBack 0x17


.align 2, 0
	anim_0738:
		.4byte anim_data__0738_0
		.4byte anim_data__0738_1




.align 2, 0
	anim_data__0739_0:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1ECC4 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0739_1:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1ED04 64
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0739_2:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1ED44 64
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0739_3:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1ED84 64
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0739_4:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EDC4 64
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0739_5:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EE04 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0739_6:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EE44 64
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0739_7:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EE84 64
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0739_8:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EEC4 64
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0739_9:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EF04 64
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0739_10:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EF44 64
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0739_11:
		mGetPalette 0xAC 16 0x20
		mGetTiles 0x1EF84 64
		.4byte	1, 11

		mAnimCmd4 


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
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1EFC4 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0740:
		.4byte anim_data__0740_0




.align 2, 0
	anim_data__0741_0:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1EFFA 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0741_1:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F01E 30
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0741_2:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F03C 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0741_3:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F060 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0741_4:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F084 18
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0741_5:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F096 12
		.4byte	1, 5

		mAnimCmd4 


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
		mGetPalette 0xA0 16 0x40
		mGetTiles 0x1F0A2 16
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0742:
		.4byte anim_data__0742_0




.align 2, 0
	anim_data__0743_0:
		mGetPalette 0xAF 16 0x10
		mGetTiles 0x1F0B2 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0743:
		.4byte anim_data__0743_0




.align 2, 0
	anim_data__0744_0:
		mGetPalette 0xAF 16 0x10
		mGetTiles 0x1F0E8 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0744:
		.4byte anim_data__0744_0




.align 2, 0
	anim_data__0745_0:
		mGetPalette 0xAF 16 0x10
		mGetTiles 0x1F11E 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0745:
		.4byte anim_data__0745_0




.align 2, 0
	anim_data__0746_0:
		mGetPalette 0xAF 16 0x10
		mGetTiles 0x1F154 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0746:
		.4byte anim_data__0746_0




.align 2, 0
	anim_data__0747_0:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F18A 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0747_1:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F1AE 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0747_2:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F1CE 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0747_3:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F1F2 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0747_4:
		mGetPalette 0xAE 16 0x10
		mGetTiles 0x1F216 20
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0747:
		.4byte anim_data__0747_0
		.4byte anim_data__0747_1
		.4byte anim_data__0747_2
		.4byte anim_data__0747_3
		.4byte anim_data__0747_4




.align 2, 0
	anim_data__0748_0:
		mGetPalette 0xAF 16 0x10
		mGetTiles 0x1F22A 54
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0748:
		.4byte anim_data__0748_0




.align 2, 0
	anim_data__0749_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F260 6
		.4byte	6, 0

		mGetTiles 0x1F266 6
		.4byte	6, 1

		mGetTiles 0x1F26C 6
		.4byte	6, 2

		mGetTiles 0x1F272 6
		.4byte	6, 3

		mGetTiles 0x1F278 6
		.4byte	6, 4

		mAnimCmd4 

	anim_data__0749_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F278 6
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0749:
		.4byte anim_data__0749_0
		.4byte anim_data__0749_1




.align 2, 0
	anim_data__0750_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F27E 12
		.4byte	6, 0

		mGetTiles 0x1F28A 12
		.4byte	6, 1

		mGetTiles 0x1F296 12
		.4byte	6, 2

		mGetTiles 0x1F2A2 12
		.4byte	6, 3

		mGetTiles 0x1F2AE 12
		.4byte	6, 4

		mGetTiles 0x1F2BA 12
		.4byte	6, 5

		mAnimCmd4 

	anim_data__0750_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F2BA 12
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0750:
		.4byte anim_data__0750_0
		.4byte anim_data__0750_1




.align 2, 0
	anim_data__0751_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F2C6 4
		.4byte	6, 0

		mGetTiles 0x1F2CA 4
		.4byte	6, 1

		mGetTiles 0x1F2CE 6
		.4byte	6, 2

		mGetTiles 0x1F2D4 8
		.4byte	6, 3

		mGetTiles 0x1F2DC 10
		.4byte	6, 4

		mGetTiles 0x1F2E6 10
		.4byte	6, 5

		mGetTiles 0x1F2F0 10
		.4byte	6, 6

		mAnimCmd4 

	anim_data__0751_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F2F0 10
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0751:
		.4byte anim_data__0751_0
		.4byte anim_data__0751_1




.align 2, 0
	anim_data__0752_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F2FA 6
		.4byte	1, 0

		mGetTiles 0x1F300 6
		.4byte	1, 1

		mGetTiles 0x1F306 6
		.4byte	1, 2

		mGetTiles 0x1F30C 6
		.4byte	1, 3

		mGetTiles 0x1F312 6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0752_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F312 6
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0752:
		.4byte anim_data__0752_0
		.4byte anim_data__0752_1




.align 2, 0
	anim_data__0753_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F318 16
		.4byte	6, 0

		mGetTiles 0x1F328 16
		.4byte	6, 1

		mGetTiles 0x1F338 16
		.4byte	6, 2

		mGetTiles 0x1F348 16
		.4byte	6, 3

		mGetTiles 0x1F358 16
		.4byte	6, 4

		mGetTiles 0x1F368 16
		.4byte	6, 5

		mGetTiles 0x1F378 16
		.4byte	6, 6

		mAnimCmd4 

	anim_data__0753_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F378 16
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0753:
		.4byte anim_data__0753_0
		.4byte anim_data__0753_1




.align 2, 0
	anim_data__0754_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F388 4
		.4byte	6, 0

		mGetTiles 0x1F38C 4
		.4byte	6, 1

		mGetTiles 0x1F390 6
		.4byte	6, 2

		mGetTiles 0x1F396 8
		.4byte	6, 3

		mGetTiles 0x1F39E 10
		.4byte	6, 4

		mGetTiles 0x1F3A8 10
		.4byte	6, 5

		mGetTiles 0x1F3B2 18
		.4byte	6, 6

		mGetTiles 0x1F3C4 21
		.4byte	6, 7

		mGetTiles 0x1F3D9 28
		.4byte	6, 8

		mGetTiles 0x1F3F5 21
		.4byte	6, 9

		mAnimCmd4 

	anim_data__0754_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F3F5 21
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_0754:
		.4byte anim_data__0754_0
		.4byte anim_data__0754_1




.align 2, 0
	anim_data__0755_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F40A 36
		.4byte	6, 0

		mGetTiles 0x1F42E 36
		.4byte	6, 1

		mGetTiles 0x1F452 36
		.4byte	6, 2

		mGetTiles 0x1F476 36
		.4byte	6, 3

		mGetTiles 0x1F49A 36
		.4byte	6, 4

		mGetTiles 0x1F4BE 36
		.4byte	6, 5

		mGetTiles 0x1F4E2 36
		.4byte	6, 6

		mGetTiles 0x1F506 36
		.4byte	6, 7

		mGetTiles 0x1F52A 36
		.4byte	6, 8

		mGetTiles 0x1F54E 36
		.4byte	6, 9

		mGetTiles 0x1F572 36
		.4byte	6, 10

		mGetTiles 0x1F596 36
		.4byte	6, 11

		mAnimCmd4 

	anim_data__0755_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F596 36
		.4byte	1, 11

		mAnimCmd4 


.align 2, 0
	anim_0755:
		.4byte anim_data__0755_0
		.4byte anim_data__0755_1




.align 2, 0
	anim_data__0756_0:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F5BA 2
		.4byte	6, 0

		mGetTiles 0x1F5BC 4
		.4byte	6, 1

		mGetTiles 0x1F5C0 6
		.4byte	6, 2

		mGetTiles 0x1F5C6 8
		.4byte	6, 3

		mGetTiles 0x1F5CE 8
		.4byte	6, 4

		mGetTiles 0x1F5D6 10
		.4byte	6, 5

		mGetTiles 0x1F5E0 12
		.4byte	6, 6

		mGetTiles 0x1F5EC 21
		.4byte	6, 7

		mGetTiles 0x1F601 21
		.4byte	6, 8

		mGetTiles 0x1F616 24
		.4byte	6, 9

		mGetTiles 0x1F62E 27
		.4byte	6, 10

		mGetTiles 0x1F649 30
		.4byte	6, 11

		mAnimCmd4 

	anim_data__0756_1:
		mGetPalette 0xB0 16 0x80
		mGetTiles 0x1F649 30
		.4byte	2, 11

		mGetTiles 0x1F667 30
		.4byte	2, 12

		mGetTiles 0x1F685 30
		.4byte	2, 13

		mGetTiles 0x1F6A3 30
		.4byte	2, 14

		mGetTiles 0x1F6C1 30
		.4byte	2, 15

		mGetTiles 0x1F6DF 30
		.4byte	2, 16

		mJumpBack 0x21


.align 2, 0
	anim_0756:
		.4byte anim_data__0756_0
		.4byte anim_data__0756_1




.align 2, 0
	anim_data__0757_0:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F6FD 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0757_1:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F711 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0757_2:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F72B 26
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0757:
		.4byte anim_data__0757_0
		.4byte anim_data__0757_1
		.4byte anim_data__0757_2




.align 2, 0
	anim_data__0758_0:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F745 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0758_1:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F749 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0758_2:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F74D 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0758_3:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F751 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0758_4:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F755 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0758_5:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F759 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0758_6:
		mGetPalette 0xA3 16 0x90
		mGetTiles 0x1F75D 4
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1F761 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0759_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1F765 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0759_2:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1F769 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0759_3:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x1F76D 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0759_4:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x1F771 4
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0759:
		.4byte anim_data__0759_0
		.4byte anim_data__0759_1
		.4byte anim_data__0759_2
		.4byte anim_data__0759_3
		.4byte anim_data__0759_4




.align 2, 0
	anim_data__0760_0:
		mGetPalette 0xB1 16 0xE0
		mGetTiles 0x1F775 9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0760_1:
		mGetPalette 0xB2 16 0xD0
		mGetTiles 0x1F77E 9
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0760_2:
		mGetPalette 0xB2 16 0xD0
		mGetTiles 0x1F787 9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0760_3:
		mGetPalette 0xB3 16 0xC0
		mGetTiles 0x1F790 9
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0760_4:
		mGetPalette 0xB3 16 0xC0
		mGetTiles 0x1F799 9
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0760_5:
		mGetPalette 0xB4 16 0xB0
		mGetTiles 0x1F7A2 9
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0760_6:
		mGetPalette 0xB4 16 0xB0
		mGetTiles 0x1F7AB 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0760_7:
		mGetPalette 0xB1 16 0xE0
		mGetTiles 0x1F7B4 9
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F7BD 30
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0761_1:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F7DB 28
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0761_2:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F7F7 38
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0761_3:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F81D 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0761_4:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F841 32
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0761_5:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F861 24
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0761_6:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F879 32
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0761_7:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F899 30
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0761_8:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F8B7 34
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F8D9 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0762_1:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F8FD 34
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0762_2:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F91F 34
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0762_3:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F941 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0762_4:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F965 34
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0762_5:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F987 36
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0762_6:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9AB 32
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0762_7:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9CB 10
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0762_8:
		mGetPalette 0xB5 16 0xA0
		mGetTiles 0x1F9D5 38
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0xB6 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_1:
		mGetPalette 0xB7 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_2:
		mGetPalette 0xB8 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_3:
		mGetPalette 0xB9 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0763_4:
		mGetPalette 0xBA 16 0x10
		mGetTiles 0x1F9FB 24
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0763:
		.4byte anim_data__0763_0
		.4byte anim_data__0763_1
		.4byte anim_data__0763_2
		.4byte anim_data__0763_3
		.4byte anim_data__0763_4




.align 2, 0
	anim_data__0764_0:
		mGetPalette 0xB6 16 0x10
		mGetTiles 0x1FA13 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0764_1:
		mGetPalette 0xB7 16 0x10
		mGetTiles 0x1FA13 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0764_2:
		mGetPalette 0xB8 16 0x10
		mGetTiles 0x1FA13 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0764_3:
		mGetPalette 0xB9 16 0x10
		mGetTiles 0x1FA13 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0764_4:
		mGetPalette 0xBA 16 0x10
		mGetTiles 0x1FA13 28
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0764:
		.4byte anim_data__0764_0
		.4byte anim_data__0764_1
		.4byte anim_data__0764_2
		.4byte anim_data__0764_3
		.4byte anim_data__0764_4




.align 2, 0
	anim_data__0765_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1FA2F 42
		.4byte	3, 0

		mGetTiles 0x1FA59 42
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0765_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1FA83 16
		.4byte	1, 2

		mGetTiles 0x1FA93 16
		.4byte	1, 3

		mGetTiles 0x1FAA3 16
		.4byte	12, 4

		mGetTiles 0x1FA93 16
		.4byte	2, 3

		mGetTiles 0x1FA83 16
		.4byte	2, 2

		mAnimCmd4 


.align 2, 0
	anim_0765:
		.4byte anim_data__0765_0
		.4byte anim_data__0765_1




.align 2, 0
	anim_data__0766_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1FAB3 24
		.4byte	3, 0

		mGetTiles 0x1FACB 24
		.4byte	3, 1

		mGetTiles 0x1FAE3 24
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0766_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1FAFB 12
		.4byte	1, 3

		mGetTiles 0x1FB07 16
		.4byte	1, 4

		mGetTiles 0x1FB17 16
		.4byte	12, 5

		mGetTiles 0x1FB27 16
		.4byte	2, 6

		mGetTiles 0x1FB37 12
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0766:
		.4byte anim_data__0766_0
		.4byte anim_data__0766_1




.align 2, 0
	anim_data__0767_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1FB43 28
		.4byte	3, 0

		mGetTiles 0x1FB5F 28
		.4byte	3, 1

		mGetTiles 0x1FB7B 28
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0767_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1FB97 20
		.4byte	1, 3

		mGetTiles 0x1FBAB 24
		.4byte	1, 4

		mGetTiles 0x1FBC3 18
		.4byte	12, 5

		mGetTiles 0x1FBD5 24
		.4byte	2, 6

		mGetTiles 0x1FB97 20
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0767:
		.4byte anim_data__0767_0
		.4byte anim_data__0767_1




.align 2, 0
	anim_data__0768_0:
		mGetPalette 0xBB 16 0x0
		mGetTiles 0x1FBED 35
		.4byte	3, 0

		mGetTiles 0x1FC10 28
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0768_1:
		mGetPalette 0xBB 16 0x0
		mGetTiles 0x1FC2C 16
		.4byte	1, 2

		mGetTiles 0x1FC3C 16
		.4byte	1, 3

		mGetTiles 0x1FC4C 16
		.4byte	12, 4

		mGetTiles 0x1FC3C 16
		.4byte	2, 3

		mGetTiles 0x1FC2C 16
		.4byte	2, 2

		mAnimCmd4 


.align 2, 0
	anim_0768:
		.4byte anim_data__0768_0
		.4byte anim_data__0768_1




.align 2, 0
	anim_data__0769_0:
		mGetPalette 0xBC 16 0x0
		mGetTiles 0x1FC5C 24
		.4byte	3, 0

		mGetTiles 0x1FC74 24
		.4byte	3, 1

		mGetTiles 0x1FC8C 24
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0769_1:
		mGetPalette 0xBC 16 0x0
		mGetTiles 0x1FCA4 16
		.4byte	1, 3

		mGetTiles 0x1FCB4 16
		.4byte	1, 4

		mGetTiles 0x1FCC4 16
		.4byte	12, 5

		mGetTiles 0x1FCD4 16
		.4byte	2, 6

		mGetTiles 0x1FCE4 16
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0769:
		.4byte anim_data__0769_0
		.4byte anim_data__0769_1




.align 2, 0
	anim_data__0770_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x1FCF4 9
		.4byte	3, 0

		mGetTiles 0x1FCFD 16
		.4byte	3, 1

		mGetTiles 0x1FD0D 16
		.4byte	3, 2

		mGetTiles 0x1FD1D 16
		.4byte	3, 3

		mGetTiles 0x1FD2D 16
		.4byte	3, 4

		mGetTiles 0x1FD3D 16
		.4byte	3, 5

		mGetTiles 0x1FD4D 12
		.4byte	3, 6

		mAnimCmd4 


.align 2, 0
	anim_0770:
		.4byte anim_data__0770_0




.align 2, 0
	anim_data__0771_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x1FD59 20
		.4byte	8, 0

		mGetTiles 0x1FD6D 30
		.4byte	8, 1

		mGetTiles 0x1FD8B 20
		.4byte	40, 2

		mAnimCmd4 


.align 2, 0
	anim_0771:
		.4byte anim_data__0771_0




.align 2, 0
	anim_data__0772_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x1FD9F 16
		.4byte	10, 0

		mGetTiles 0x1FDAF 20
		.4byte	8, 1

		mGetTiles 0x1FDC3 15
		.4byte	6, 2

		mGetTiles 0x1FDC3 15
		.4byte	6, 2

		mAnimCmd4 


.align 2, 0
	anim_0772:
		.4byte anim_data__0772_0




.align 2, 0
	anim_data__0773_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x1FDD2 20
		.4byte	4, 0

		mGetTiles 0x1FDE6 20
		.4byte	4, 1

		mGetTiles 0x1FDFA 30
		.4byte	8, 2

		mGetTiles 0x1FE18 20
		.4byte	40, 3

		mAnimCmd4 


.align 2, 0
	anim_0773:
		.4byte anim_data__0773_0




.align 2, 0
	anim_data__0774_0:
		mGetPalette 0xBB 16 0x0
		mGetTiles 0x1FE2C 20
		.4byte	4, 0

		mGetTiles 0x1FE40 15
		.4byte	4, 1

		mGetTiles 0x1FE4F 24
		.4byte	8, 2

		mGetTiles 0x1FE67 15
		.4byte	40, 3

		mAnimCmd4 


.align 2, 0
	anim_0774:
		.4byte anim_data__0774_0




.align 2, 0
	anim_data__0775_0:
		mGetPalette 0xBC 16 0x0
		mGetTiles 0x1FE76 20
		.4byte	4, 0

		mGetTiles 0x1FE8A 20
		.4byte	4, 1

		mGetTiles 0x1FE9E 24
		.4byte	8, 2

		mGetTiles 0x1FEB6 20
		.4byte	40, 3

		mAnimCmd4 


.align 2, 0
	anim_0775:
		.4byte anim_data__0775_0




.align 2, 0
	anim_data__0776_0:
		mGetPalette 0xBD 16 0x0
		mGetTiles 0x1FECA 64
		.4byte	2, 0

		mGetTiles 0x1FF0A 64
		.4byte	2, 1

		mGetTiles 0x1FF4A 64
		.4byte	2, 2

		mGetTiles 0x1FF8A 64
		.4byte	2, 3

		mGetTiles 0x1FFCA 64
		.4byte	2, 4

		mGetTiles 0x2000A 64
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0776:
		.4byte anim_data__0776_0




.align 2, 0
	anim_data__0777_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x2004A 64
		.4byte	2, 0

		mGetTiles 0x2008A 64
		.4byte	2, 1

		mGetTiles 0x200CA 64
		.4byte	2, 2

		mGetTiles 0x2010A 64
		.4byte	2, 3

		mGetTiles 0x2014A 64
		.4byte	2, 4

		mGetTiles 0x2018A 64
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0777:
		.4byte anim_data__0777_0




.align 2, 0
	anim_data__0778_0:
		mGetPalette 0xA 16 0x0
		mGetTiles 0x201CA 64
		.4byte	2, 0

		mGetTiles 0x2020A 64
		.4byte	2, 1

		mGetTiles 0x2024A 64
		.4byte	2, 2

		mGetTiles 0x2028A 64
		.4byte	2, 3

		mGetTiles 0x202CA 64
		.4byte	2, 4

		mGetTiles 0x2030A 64
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0778:
		.4byte anim_data__0778_0




.align 2, 0
	anim_data__0779_0:
		mGetPalette 0xBE 16 0x0
		mGetTiles 0x2034A 64
		.4byte	2, 0

		mGetTiles 0x2038A 64
		.4byte	2, 1

		mGetTiles 0x203CA 64
		.4byte	2, 2

		mGetTiles 0x2040A 64
		.4byte	2, 3

		mGetTiles 0x2044A 64
		.4byte	2, 4

		mGetTiles 0x2048A 64
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0779:
		.4byte anim_data__0779_0




.align 2, 0
	anim_data__0780_0:
		mGetPalette 0x25 16 0x0
		mGetTiles 0x204CA 64
		.4byte	2, 0

		mGetTiles 0x2050A 64
		.4byte	2, 1

		mGetTiles 0x2054A 64
		.4byte	2, 2

		mGetTiles 0x2058A 64
		.4byte	2, 3

		mGetTiles 0x205CA 64
		.4byte	2, 4

		mGetTiles 0x2060A 64
		.4byte	2, 5

		mJumpBack 0x21


.align 2, 0
	anim_0780:
		.4byte anim_data__0780_0




.align 2, 0
	anim_data__0781_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2064A 48
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0781_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2067A 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0781_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x20694 32
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0781:
		.4byte anim_data__0781_0
		.4byte anim_data__0781_1
		.4byte anim_data__0781_2




.align 2, 0
	anim_data__0782_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x206B4 15
		.4byte	6, 0

		mGetTiles 0x206C3 16
		.4byte	8, 1

		mGetTiles 0x206D3 20
		.4byte	8, 2

		mGetTiles 0x206E7 16
		.4byte	12, 3

		mGetTiles 0x206E7 16
		.4byte	4, 3

		mGetTiles 0x206E7 16
		.4byte	14, 3

		mAnimCmd4 

	anim_data__0782_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x206E7 16
		.4byte	6, 3

		mGetTiles 0x206F7 16
		.4byte	6, 4

		mGetTiles 0x20707 20
		.4byte	16, 5

		mAnimCmd4 


.align 2, 0
	anim_0782:
		.4byte anim_data__0782_0
		.4byte anim_data__0782_1




.align 2, 0
	anim_data__0783_0:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x2071B 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0783_1:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x2072F 20
		.4byte	3, 1

		mGetTiles 0x20743 24
		.4byte	3, 2

		mGetTiles 0x2075B 24
		.4byte	3, 3

		mAnimCmd4 


.align 2, 0
	anim_0783:
		.4byte anim_data__0783_0
		.4byte anim_data__0783_1




.align 2, 0
	anim_data__0784_0:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x20773 24
		.4byte	6, 0

		mGetTiles 0x20773 24
		.4byte	8, 0

		mGetTiles 0x20773 24
		.4byte	8, 0

		mGetTiles 0x20773 24
		.4byte	12, 0

		mGetTiles 0x2078B 24
		.4byte	4, 1

		mGetTiles 0x207A3 24
		.4byte	14, 2

		mAnimCmd4 

	anim_data__0784_1:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x207BB 24
		.4byte	6, 3

		mGetTiles 0x207D3 24
		.4byte	6, 4

		mGetTiles 0x207EB 24
		.4byte	16, 5

		mAnimCmd4 

	anim_data__0784_2:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x20803 24
		.4byte	1, 6

		mAnimCmd4 


.align 2, 0
	anim_0784:
		.4byte anim_data__0784_0
		.4byte anim_data__0784_1
		.4byte anim_data__0784_2




.align 2, 0
	anim_data__0785_0:
		mGetPalette 0xC0 16 0x0
		mGetTiles 0x2081B 104
		.4byte	3, 0

		mGetTiles 0x20883 104
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0785_1:
		mGetPalette 0xC0 16 0x0
		mGetTiles 0x208EB 48
		.4byte	3, 2

		mGetTiles 0x2091B 48
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0785_2:
		mGetPalette 0xC1 16 0x0
		mGetTiles 0x2094B 104
		.4byte	3, 4

		mGetTiles 0x209B3 104
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0785_3:
		mGetPalette 0xC1 16 0x0
		mGetTiles 0x20A1B 48
		.4byte	3, 6

		mGetTiles 0x20A4B 48
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0785:
		.4byte anim_data__0785_0
		.4byte anim_data__0785_1
		.4byte anim_data__0785_2
		.4byte anim_data__0785_3




.align 2, 0
	anim_data__0786_0:
		mGetPalette 0xC2 16 0x0
		mGetTiles 0x20A7B 80
		.4byte	3, 0

		mGetTiles 0x20ACB 80
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0786_1:
		mGetPalette 0xC2 16 0x0
		mGetTiles 0x20B1B 80
		.4byte	3, 2

		mGetTiles 0x20B6B 70
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0786_2:
		mGetPalette 0xC3 16 0x0
		mGetTiles 0x20BB1 80
		.4byte	3, 4

		mGetTiles 0x20C01 80
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0786_3:
		mGetPalette 0xC3 16 0x0
		mGetTiles 0x20C51 80
		.4byte	3, 6

		mGetTiles 0x20CA1 70
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0786:
		.4byte anim_data__0786_0
		.4byte anim_data__0786_1
		.4byte anim_data__0786_2
		.4byte anim_data__0786_3




.align 2, 0
	anim_data__0787_0:
		mGetPalette 0xC4 16 0x0
		mGetTiles 0x20CE7 99
		.4byte	3, 0

		mGetTiles 0x20D4A 99
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0787_1:
		mGetPalette 0xC4 16 0x0
		mGetTiles 0x20DAD 80
		.4byte	3, 2

		mGetTiles 0x20DFD 80
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0787_2:
		mGetPalette 0xC5 16 0x0
		mGetTiles 0x20E4D 99
		.4byte	3, 4

		mGetTiles 0x20EB0 99
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0787_3:
		mGetPalette 0xC5 16 0x0
		mGetTiles 0x20F13 80
		.4byte	3, 6

		mGetTiles 0x20F63 80
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0787:
		.4byte anim_data__0787_0
		.4byte anim_data__0787_1
		.4byte anim_data__0787_2
		.4byte anim_data__0787_3




.align 2, 0
	anim_data__0788_0:
		mGetPalette 0xC6 16 0x0
		mGetTiles 0x20FB3 72
		.4byte	3, 0

		mGetTiles 0x20FFB 72
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0788_1:
		mGetPalette 0xC6 16 0x0
		mGetTiles 0x21043 56
		.4byte	3, 2

		mGetTiles 0x2107B 64
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0788_2:
		mGetPalette 0xC7 16 0x0
		mGetTiles 0x210BB 72
		.4byte	3, 4

		mGetTiles 0x21103 72
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0788_3:
		mGetPalette 0xC7 16 0x0
		mGetTiles 0x2114B 56
		.4byte	3, 6

		mGetTiles 0x21183 64
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0788:
		.4byte anim_data__0788_0
		.4byte anim_data__0788_1
		.4byte anim_data__0788_2
		.4byte anim_data__0788_3




.align 2, 0
	anim_data__0789_0:
		mGetPalette 0xC8 16 0x0
		mGetTiles 0x211C3 56
		.4byte	3, 0

		mGetTiles 0x211FB 56
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0789_1:
		mGetPalette 0xC8 16 0x0
		mGetTiles 0x21233 42
		.4byte	3, 2

		mGetTiles 0x2125D 42
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0789_2:
		mGetPalette 0xC9 16 0x0
		mGetTiles 0x21287 56
		.4byte	3, 4

		mGetTiles 0x212BF 56
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0789_3:
		mGetPalette 0xC9 16 0x0
		mGetTiles 0x212F7 42
		.4byte	3, 6

		mGetTiles 0x21321 42
		.4byte	3, 7

		mJumpBack 0xD


.align 2, 0
	anim_0789:
		.4byte anim_data__0789_0
		.4byte anim_data__0789_1
		.4byte anim_data__0789_2
		.4byte anim_data__0789_3




.align 2, 0
	anim_data__0790_0:
		mGetPalette 0xCA 16 0x10
		mGetTiles 0x2134B 30
		.4byte	3, 0

		mGetTiles 0x21369 30
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0790_1:
		mGetPalette 0xCB 16 0x10
		mGetTiles 0x21387 30
		.4byte	3, 2

		mGetTiles 0x213A5 30
		.4byte	3, 3

		mJumpBack 0xD


.align 2, 0
	anim_0790:
		.4byte anim_data__0790_0
		.4byte anim_data__0790_1




.align 2, 0
	anim_data__0791_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x213C3 42
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0791_1:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x213ED 42
		.4byte	8, 1

		mGetTiles 0x21417 42
		.4byte	8, 2

		mGetTiles 0x21441 42
		.4byte	8, 3

		mGetTiles 0x2146B 42
		.4byte	8, 4

		mAnimCmd4 

	anim_data__0791_2:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x21495 64
		.4byte	1, 5

		mAnimCmd4 


.align 2, 0
	anim_0791:
		.4byte anim_data__0791_0
		.4byte anim_data__0791_1
		.4byte anim_data__0791_2




.align 2, 0
	anim_data__0792_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214D5 15
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0792:
		.4byte anim_data__0792_0




.align 2, 0
	anim_data__0793_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214E4 6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0793:
		.4byte anim_data__0793_0




.align 2, 0
	anim_data__0794_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214EA 6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0794:
		.4byte anim_data__0794_0




.align 2, 0
	anim_data__0795_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214F0 15
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0795:
		.4byte anim_data__0795_0




.align 2, 0
	anim_data__0796_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x214FF 6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0796:
		.4byte anim_data__0796_0




.align 2, 0
	anim_data__0797_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x21505 6
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0797:
		.4byte anim_data__0797_0




.align 2, 0
	anim_data__0798_0:
		mGetPalette 0xCC 16 0x30
		mGetTiles 0x2150B 4
		.4byte	4, 0

		mGetTiles 0x2150F 4
		.4byte	4, 1

		mGetTiles 0x21513 4
		.4byte	4, 2

		mGetTiles 0x21517 4
		.4byte	4, 3

		mGetTiles 0x2151B 4
		.4byte	4, 4

		mGetTiles 0x2151F 2
		.4byte	4, 5

		mJumpBack 0x21


.align 2, 0
	anim_0798:
		.4byte anim_data__0798_0




.align 2, 0
	anim_data__0799_0:
		mGetPalette 0xCD 16 0x70
		mGetTiles 0x21521 24
		.4byte	1, 0

		mGetTiles 0x21539 24
		.4byte	1, 1

		mGetTiles 0x21551 16
		.4byte	1, 2

		mJumpBack 0x12


.align 2, 0
	anim_0799:
		.4byte anim_data__0799_0




.align 2, 0
	anim_data__0804_0:
		mGetPalette 0xCE 16 0x0
		mGetTiles 0x21561 168
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0804:
		.4byte anim_data__0804_0




.align 2, 0
	anim_data__0805_0:
		mGetPalette 0xCF 16 0x0
		mGetTiles 0x21609 192
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0805:
		.4byte anim_data__0805_0




.align 2, 0
	anim_data__0806_0:
		mGetPalette 0xD0 16 0x0
		mGetTiles 0x216C9 210
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0806:
		.4byte anim_data__0806_0




.align 2, 0
	anim_data__0807_0:
		mGetPalette 0xAA 16 0x0
		mGetTiles 0x2179B 176
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0807:
		.4byte anim_data__0807_0




.align 2, 0
	anim_data__0808_0:
		mGetPalette 0xD1 16 0x0
		mGetTiles 0x2184B 140
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0808:
		.4byte anim_data__0808_0




.align 2, 0
	anim_data__0809_0:
		mGetPalette 0xAB 16 0x10
		mGetTiles 0x218D7 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0809:
		.4byte anim_data__0809_0




.align 2, 0
	anim_data__0810_0:
		mGetPalette 0xAA 16 0x0
		mGetTiles 0x218F5 63
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0810_1:
		mGetPalette 0xAA 16 0x0
		mGetTiles 0x21934 63
		.4byte	3, 1

		mGetTiles 0x21973 63
		.4byte	3, 2

		mGetTiles 0x219B2 70
		.4byte	3, 3

		mGetTiles 0x219F8 70
		.4byte	6, 4

		mGetTiles 0x21A3E 70
		.4byte	4, 5

		mGetTiles 0x21A84 70
		.4byte	2, 6

		mGetTiles 0x21ACA 80
		.4byte	15, 7

		mAnimCmd4 


.align 2, 0
	anim_0810:
		.4byte anim_data__0810_0
		.4byte anim_data__0810_1




.align 2, 0
	anim_data__0815_0:
		mGetPalette 0xD2 16 0xD0
		mGetTiles 0x21B1A 30
		.4byte	8, 0

		mGetTiles 0x21B38 30
		.4byte	8, 1

		mGetTiles 0x21B56 30
		.4byte	8, 2

		mGetTiles 0x21B74 30
		.4byte	8, 3

		mJumpBack 0x17


.align 2, 0
	anim_0815:
		.4byte anim_data__0815_0




.align 2, 0
	anim_data__0816_0:
		mGetPalette 0xD2 16 0xD0
		mGetTiles 0x21B92 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0816_1:
		mGetPalette 0xD2 16 0xD0
		mGetTiles 0x21B96 4
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0816:
		.4byte anim_data__0816_0
		.4byte anim_data__0816_1




.align 2, 0
	anim_data__0817_0:
		mGetPalette 0xD2 16 0xD0
		mGetTiles 0x21B9A 9
		.4byte	3, 0

		mGetTiles 0x21BA3 9
		.4byte	3, 1

		mGetTiles 0x21BAC 9
		.4byte	3, 2

		mGetTiles 0x21BB5 9
		.4byte	3, 3

		mGetTiles 0x21BBE 9
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0817:
		.4byte anim_data__0817_0




.align 2, 0
	anim_data__0818_0:
		mGetPalette 0x2A 16 0x10
		mGetTiles 0x21BC7 24
		.4byte	1, 0

		mGetPalette 0x2A 16 0x20
		mGetTiles 0x21BDF 24
		.4byte	1, 1

		mGetPalette 0x2A 16 0x10
		mGetTiles 0x21BF7 24
		.4byte	1, 2

		mGetPalette 0x2A 16 0x20
		mGetTiles 0x21C0F 24
		.4byte	1, 3

		mJumpBack 0x20


.align 2, 0
	anim_0818:
		.4byte anim_data__0818_0




.align 2, 0
	anim_data__0819_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x21C27 30
		.4byte	2, 0

		mGetTiles 0x21C45 25
		.4byte	2, 1

		mGetTiles 0x21C5E 20
		.4byte	2, 2

		mGetTiles 0x21C72 20
		.4byte	2, 3

		mGetTiles 0x21C86 24
		.4byte	2, 4

		mGetTiles 0x21C9E 25
		.4byte	2, 5

		mGetTiles 0x21CB7 24
		.4byte	2, 6

		mGetTiles 0x21CCF 20
		.4byte	2, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0819:
		.4byte anim_data__0819_0




.align 2, 0
	anim_data__0820_0:
		mGetPalette 0xBF 16 0x80
		mGetTiles 0x21CE3 30
		.4byte	3, 0

		mGetTiles 0x21D01 35
		.4byte	3, 1

		mGetTiles 0x21D24 35
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0820:
		.4byte anim_data__0820_0




.align 2, 0
	anim_data__0821_0:
		mGetPalette 0xD3 16 0xF0
		mGetTiles 0x21D47 4
		.4byte	3, 0

		mGetTiles 0x21D4B 4
		.4byte	3, 1

		mGetTiles 0x21D4F 4
		.4byte	3, 2

		mJumpBack 0x12


.align 2, 0
	anim_0821:
		.4byte anim_data__0821_0




.align 2, 0
	anim_data__0822_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x21D53 35
		.4byte	3, 0

		mGetTiles 0x21D76 35
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0822_1:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x21D99 42
		.4byte	3, 2

		mGetTiles 0x21DC3 42
		.4byte	3, 3

		mJumpBack 0xD


.align 2, 0
	anim_0822:
		.4byte anim_data__0822_0
		.4byte anim_data__0822_1




.align 2, 0
	anim_data__0823_0:
		mGetPalette 0xD4 16 0xE0
		mGetTiles 0x21DED 15
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0823:
		.4byte anim_data__0823_0




.align 2, 0
	anim_data__0824_0:
		mGetPalette 0xD5 16 0xD0
		mGetTiles 0x21DFC 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0824_1:
		mGetPalette 0xD5 16 0xD0
		mGetTiles 0x21E06 21
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0824_2:
		mGetPalette 0xD5 16 0xD0
		mGetTiles 0x21E1B 30
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0824_3:
		mGetPalette 0xD5 16 0xD0
		mGetTiles 0x21E39 80
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0824:
		.4byte anim_data__0824_0
		.4byte anim_data__0824_1
		.4byte anim_data__0824_2
		.4byte anim_data__0824_3




.align 2, 0
	anim_data__0828_0:
		mGetPalette 0xD6 16 0x0
		mGetTiles 0x21E89 56
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0828_1:
		mGetPalette 0xD6 16 0x0
		mGetTiles 0x21EC1 78
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0828_2:
		mGetPalette 0xD6 16 0x0
		mGetTiles 0x21F0F 60
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0828_3:
		mGetPalette 0xD6 16 0x0
		mGetTiles 0x21F4B 96
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0828:
		.4byte anim_data__0828_0
		.4byte anim_data__0828_1
		.4byte anim_data__0828_2
		.4byte anim_data__0828_3




.align 2, 0
	anim_data__0829_0:
		mGetPalette 0xD7 16 0x30
		mGetTiles 0x21FAB 63
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0829_1:
		mGetPalette 0xD7 16 0x30
		mGetTiles 0x21FEA 63
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0829:
		.4byte anim_data__0829_0
		.4byte anim_data__0829_1




.align 2, 0
	anim_data__0830_0:
		mGetPalette 0xD8 16 0xF0
		mGetTiles 0x22029 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0830_1:
		mGetPalette 0xD8 16 0xF0
		mGetTiles 0x22083 90
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0830:
		.4byte anim_data__0830_0
		.4byte anim_data__0830_1




.align 2, 0
	anim_data__0831_0:
		mGetPalette 0xD9 16 0x90
		mGetTiles 0x220DD 3
		.4byte	8, 0

		mGetTiles 0x220E0 3
		.4byte	8, 1

		mGetTiles 0x220E3 3
		.4byte	8, 2

		mGetTiles 0x220E6 3
		.4byte	10, 3

		mGetTiles 0x220DD 3
		.4byte	8, 0

		mGetTiles 0x220E0 3
		.4byte	8, 1

		mGetTiles 0x220E3 3
		.4byte	8, 2

		mGetTiles 0x220E6 3
		.4byte	10, 3

		mJumpBack 0x2B


.align 2, 0
	anim_0831:
		.4byte anim_data__0831_0




.align 2, 0
	anim_data__0832_0:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220E9 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0832_1:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220ED 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0832_2:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FD 1
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0832_3:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FE 1
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0832_4:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x220FF 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0832_5:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x22103 16
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0832_6:
		mGetPalette 0xDA 16 0x70
		mGetTiles 0x22113 64
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0xD8 16 0x30
		mGetTiles 0x22153 8
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0833:
		.4byte anim_data__0833_0




.align 2, 0
	anim_data__0834_0:
		mGetPalette 0xDB 16 0x0
		mGetTiles 0x2215B 20
		.4byte	4, 0

		mGetTiles 0x2216F 20
		.4byte	4, 1

		mAnimCmd4 

	anim_data__0834_1:
		mGetPalette 0xDB 16 0x0
		mGetTiles 0x22183 20
		.4byte	6, 2

		mGetTiles 0x22197 20
		.4byte	6, 3

		mAnimCmd4 

	anim_data__0834_2:
		mGetPalette 0xDB 16 0x0
		mGetTiles 0x221AB 20
		.4byte	6, 4

		mGetTiles 0x221BF 25
		.4byte	12, 5

		mGetTiles 0x221D8 25
		.4byte	4, 6

		mGetTiles 0x221BF 25
		.4byte	4, 5

		mJumpBack 0xA

	anim_data__0834_3:
		mGetPalette 0xDB 16 0x0
		mGetTiles 0x221AB 20
		.4byte	6, 4

		mGetTiles 0x221F1 25
		.4byte	6, 7

		mAnimCmd4 

	anim_data__0834_4:
		mGetPalette 0xDB 16 0x0
		mGetTiles 0x2220A 15
		.4byte	2, 8

		mGetTiles 0x22219 20
		.4byte	2, 9

		mGetTiles 0x2222D 20
		.4byte	2, 10

		mGetTiles 0x22241 20
		.4byte	2, 11

		mJumpBack 0xF


.align 2, 0
	anim_0834:
		.4byte anim_data__0834_0
		.4byte anim_data__0834_1
		.4byte anim_data__0834_2
		.4byte anim_data__0834_3
		.4byte anim_data__0834_4




.align 2, 0
	anim_data__0835_0:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x22255 15
		.4byte	4, 0

		mGetTiles 0x22264 15
		.4byte	4, 1

		mAnimCmd4 

	anim_data__0835_1:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x22273 20
		.4byte	4, 2

		mGetTiles 0x22287 20
		.4byte	4, 3

		mGetTiles 0x2229B 20
		.4byte	4, 4

		mGetTiles 0x222AF 20
		.4byte	4, 5

		mGetTiles 0x222C3 20
		.4byte	6, 6

		mGetTiles 0x222D7 20
		.4byte	2, 7

		mGetTiles 0x222EB 20
		.4byte	2, 8

		mGetTiles 0x222FF 20
		.4byte	6, 9

		mGetTiles 0x22313 20
		.4byte	4, 10

		mGetTiles 0x22327 20
		.4byte	4, 11

		mGetTiles 0x22264 15
		.4byte	4, 1

		mAnimCmd4 

	anim_data__0835_2:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x22255 15
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0835_3:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x2233B 15
		.4byte	6, 12

		mGetTiles 0x2234A 15
		.4byte	40, 13

		mGetTiles 0x22359 20
		.4byte	6, 14

		mGetTiles 0x2236D 20
		.4byte	6, 15

		mGetTiles 0x22381 24
		.4byte	6, 16

		mGetTiles 0x22399 24
		.4byte	6, 17

		mGetTiles 0x223B1 24
		.4byte	2, 18

		mGetTiles 0x223C9 24
		.4byte	2, 19

		mGetTiles 0x223E1 20
		.4byte	2, 20

		mJumpBack 0xF

	anim_data__0835_4:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x223B1 24
		.4byte	2, 18

		mGetTiles 0x223C9 24
		.4byte	2, 19

		mGetTiles 0x223E1 20
		.4byte	2, 20

		mAnimCmd4 

	anim_data__0835_5:
		mGetPalette 0xDC 16 0x0
		mGetTiles 0x223B1 24
		.4byte	2, 18

		mGetTiles 0x223C9 24
		.4byte	2, 19

		mGetTiles 0x223E1 20
		.4byte	2, 20

		mGetPalette 0xDD 16 0x0
		mGetTiles 0x223F5 24
		.4byte	2, 21

		mGetTiles 0x2240D 24
		.4byte	2, 22

		mGetTiles 0x22425 20
		.4byte	2, 23

		mJumpBack 0x24


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
		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mJumpBack 0x20

	anim_data__0836_1:
		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22499 24
		.4byte	2, 4

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x224B1 24
		.4byte	2, 5

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x224C9 24
		.4byte	2, 6

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x224E1 24
		.4byte	2, 7

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x224C9 24
		.4byte	2, 6

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x224E1 24
		.4byte	2, 7

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22499 24
		.4byte	2, 4

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x224B1 24
		.4byte	2, 5

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x224F9 24
		.4byte	2, 8

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22511 24
		.4byte	2, 9

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22529 30
		.4byte	2, 10

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22547 30
		.4byte	2, 11

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22565 24
		.4byte	2, 12

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x2257D 24
		.4byte	2, 13

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22595 30
		.4byte	2, 14

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x225B3 30
		.4byte	2, 15

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x225D1 30
		.4byte	2, 16

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x225EF 30
		.4byte	2, 17

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x2260D 30
		.4byte	2, 18

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x2262B 30
		.4byte	2, 19

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x225D1 30
		.4byte	2, 16

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x225EF 30
		.4byte	2, 17

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x2260D 30
		.4byte	2, 18

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x2262B 30
		.4byte	2, 19

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x225D1 30
		.4byte	2, 16

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x225EF 30
		.4byte	2, 17

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x2260D 30
		.4byte	2, 18

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x2262B 30
		.4byte	2, 19

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x225D1 30
		.4byte	2, 16

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x225EF 30
		.4byte	2, 17

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x2260D 30
		.4byte	2, 18

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x2262B 30
		.4byte	2, 19

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22649 24
		.4byte	2, 20

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22661 24
		.4byte	2, 21

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22439 24
		.4byte	2, 0

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22451 24
		.4byte	2, 1

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22469 24
		.4byte	2, 2

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22481 24
		.4byte	2, 3

		mJumpBack 0x1B0

	anim_data__0836_2:
		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22679 24
		.4byte	2, 22

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22691 24
		.4byte	2, 23

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x226A9 24
		.4byte	2, 24

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x226C1 24
		.4byte	2, 25

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x22679 24
		.4byte	2, 22

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x22691 24
		.4byte	2, 23

		mGetPalette 0xDE 16 0x0
		mGetTiles 0x226D9 24
		.4byte	2, 26

		mGetPalette 0xDF 16 0x0
		mGetTiles 0x226F1 24
		.4byte	2, 27

		mAnimCmd4 

	anim_data__0836_3:
		mGetPalette 0xE0 16 0x40
		mGetTiles 0x22709 48
		.4byte	2, 28

		mGetTiles 0x22739 48
		.4byte	2, 29

		mGetTiles 0x22769 48
		.4byte	2, 30

		mGetTiles 0x22799 48
		.4byte	2, 31

		mJumpBack 0x17


.align 2, 0
	anim_0836:
		.4byte anim_data__0836_0
		.4byte anim_data__0836_1
		.4byte anim_data__0836_2
		.4byte anim_data__0836_3




.align 2, 0
	anim_data__0837_0:
		mGetPalette 0xB2 16 0xA0
		mGetTiles 0x227C9 4
		.4byte	4, 0

		mGetTiles 0x227CD 4
		.4byte	4, 1

		mGetTiles 0x227D1 4
		.4byte	4, 2

		mGetTiles 0x227D5 4
		.4byte	4, 3

		mJumpBack 0x17

	anim_data__0837_1:
		mGetPalette 0xB2 16 0xA0
		mGetTiles 0x227D9 4
		.4byte	4, 4

		mGetTiles 0x227DD 4
		.4byte	4, 5

		mGetTiles 0x227E1 4
		.4byte	4, 6

		mGetTiles 0x227E5 4
		.4byte	4, 7

		mJumpBack 0x17

	anim_data__0837_2:
		mGetPalette 0xB3 16 0xB0
		mGetTiles 0x227E9 4
		.4byte	4, 8

		mGetTiles 0x227ED 4
		.4byte	4, 9

		mGetTiles 0x227F1 4
		.4byte	4, 10

		mGetTiles 0x227F5 4
		.4byte	4, 11

		mJumpBack 0x17

	anim_data__0837_3:
		mGetPalette 0xB3 16 0xB0
		mGetTiles 0x227F9 4
		.4byte	4, 12

		mGetTiles 0x227FD 4
		.4byte	4, 13

		mGetTiles 0x22801 4
		.4byte	4, 14

		mGetTiles 0x22805 4
		.4byte	4, 15

		mJumpBack 0x17

	anim_data__0837_4:
		mGetPalette 0xB4 16 0xC0
		mGetTiles 0x22809 4
		.4byte	4, 16

		mGetTiles 0x2280D 4
		.4byte	4, 17

		mGetTiles 0x22811 4
		.4byte	4, 18

		mGetTiles 0x22815 4
		.4byte	4, 19

		mJumpBack 0x17

	anim_data__0837_5:
		mGetPalette 0xB4 16 0xC0
		mGetTiles 0x22819 4
		.4byte	4, 20

		mGetTiles 0x2281D 4
		.4byte	4, 21

		mGetTiles 0x22821 4
		.4byte	4, 22

		mGetTiles 0x22825 4
		.4byte	4, 23

		mJumpBack 0x17

	anim_data__0837_6:
		mGetPalette 0xB1 16 0xD0
		mGetTiles 0x22829 4
		.4byte	4, 24

		mGetTiles 0x2282D 4
		.4byte	4, 25

		mGetTiles 0x22831 4
		.4byte	4, 26

		mGetTiles 0x22835 4
		.4byte	4, 27

		mJumpBack 0x17


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
		mGetPalette 0x2 16 0x50
		mGetTiles 0x22839 4
		.4byte	2, 0

		mGetTiles 0x2283D 4
		.4byte	2, 1

		mGetTiles 0x22841 4
		.4byte	2, 2

		mGetTiles 0x22845 4
		.4byte	2, 3

		mGetTiles 0x22849 4
		.4byte	2, 4

		mGetTiles 0x2284D 4
		.4byte	2, 5

		mGetTiles 0x22851 4
		.4byte	2, 6

		mGetTiles 0x22839 4
		.4byte	2, 0

		mAnimCmd4 

	anim_data__0838_1:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x22855 1
		.4byte	2, 7

		mGetTiles 0x22839 4
		.4byte	2, 0

		mGetTiles 0x22856 4
		.4byte	2, 8

		mGetTiles 0x2285A 4
		.4byte	2, 9

		mGetTiles 0x2285E 4
		.4byte	2, 10

		mGetTiles 0x22862 4
		.4byte	2, 11

		mGetTiles 0x22839 4
		.4byte	2, 0

		mGetTiles 0x22855 1
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0838:
		.4byte anim_data__0838_0
		.4byte anim_data__0838_1




.align 2, 0
	anim_data__0839_0:
		mGetPalette 0x2B 16 0x60
		mGetTiles 0x22866 15
		.4byte	2, 0

		mGetTiles 0x22875 16
		.4byte	2, 1

		mGetTiles 0x22885 16
		.4byte	2, 2

		mGetTiles 0x22895 16
		.4byte	2, 3

		mJumpBack 0x17

	anim_data__0839_1:
		mGetPalette 0x2B 16 0x60
		mGetTiles 0x228A5 18
		.4byte	3, 4

		mGetTiles 0x228B7 15
		.4byte	3, 5

		mAnimCmd4 


.align 2, 0
	anim_0839:
		.4byte anim_data__0839_0
		.4byte anim_data__0839_1




.align 2, 0
	anim_data__0840_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x228C6 16
		.4byte	8, 0

		mGetTiles 0x228D6 16
		.4byte	8, 1

		mGetTiles 0x228E6 20
		.4byte	8, 2

		mGetTiles 0x228FA 20
		.4byte	8, 3

		mGetTiles 0x2290E 16
		.4byte	8, 4

		mGetTiles 0x2291E 16
		.4byte	8, 5

		mGetTiles 0x2292E 20
		.4byte	8, 6

		mGetTiles 0x22942 20
		.4byte	8, 7

		mJumpBack 0x2B

	anim_data__0840_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22956 20
		.4byte	8, 8

		mGetTiles 0x2296A 16
		.4byte	8, 9

		mGetTiles 0x2297A 16
		.4byte	8, 10

		mGetTiles 0x2298A 20
		.4byte	8, 11

		mGetTiles 0x2299E 16
		.4byte	8, 12

		mGetTiles 0x229AE 16
		.4byte	8, 13

		mGetTiles 0x229BE 16
		.4byte	8, 14

		mGetTiles 0x229CE 20
		.4byte	8, 15

		mJumpBack 0x2B

	anim_data__0840_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x229E2 20
		.4byte	8, 16

		mGetTiles 0x229F6 20
		.4byte	8, 17

		mGetTiles 0x22A0A 25
		.4byte	8, 18

		mGetTiles 0x22A23 20
		.4byte	8, 19

		mGetTiles 0x22A37 20
		.4byte	8, 20

		mGetTiles 0x22A4B 16
		.4byte	8, 21

		mGetTiles 0x22A5B 20
		.4byte	8, 22

		mGetTiles 0x22A6F 25
		.4byte	8, 23

		mJumpBack 0x2B


.align 2, 0
	anim_0840:
		.4byte anim_data__0840_0
		.4byte anim_data__0840_1
		.4byte anim_data__0840_2




.align 2, 0
	anim_data__0841_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22A88 16
		.4byte	4, 0

		mGetTiles 0x22A98 16
		.4byte	4, 1

		mGetTiles 0x22AA8 16
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0841_1:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22AB8 16
		.4byte	6, 3

		mGetTiles 0x22AC8 16
		.4byte	6, 4

		mGetTiles 0x22AD8 16
		.4byte	6, 5

		mGetTiles 0x22AE8 16
		.4byte	8, 6

		mGetTiles 0x22AF8 16
		.4byte	4, 7

		mGetTiles 0x22B08 16
		.4byte	4, 8

		mGetTiles 0x22B18 16
		.4byte	4, 9

		mGetTiles 0x22B28 16
		.4byte	4, 10

		mJumpBack 0x14

	anim_data__0841_2:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22AD8 16
		.4byte	4, 5

		mGetTiles 0x22B38 16
		.4byte	6, 11

		mGetTiles 0x22B48 20
		.4byte	6, 12

		mGetTiles 0x22B5C 16
		.4byte	6, 13

		mGetTiles 0x22B6C 16
		.4byte	6, 14

		mGetTiles 0x22B7C 12
		.4byte	1, 15

		mGetTiles 0x22B88 12
		.4byte	4, 16

		mGetTiles 0x22B7C 12
		.4byte	4, 15

		mJumpBack 0xA

	anim_data__0841_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22B94 12
		.4byte	6, 17

		mGetTiles 0x22BA0 12
		.4byte	6, 18

		mAnimCmd4 

	anim_data__0841_4:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x22BAC 12
		.4byte	3, 19

		mGetTiles 0x22BB8 12
		.4byte	3, 20

		mGetTiles 0x22BC4 16
		.4byte	3, 21

		mGetTiles 0x22BD4 16
		.4byte	2, 22

		mGetTiles 0x22BE4 16
		.4byte	2, 23

		mGetTiles 0x22BF4 16
		.4byte	2, 24

		mJumpBack 0xF


.align 2, 0
	anim_0841:
		.4byte anim_data__0841_0
		.4byte anim_data__0841_1
		.4byte anim_data__0841_2
		.4byte anim_data__0841_3
		.4byte anim_data__0841_4




.align 2, 0
	anim_data__0842_0:
		mGetPalette 0xE1 16 0x0
		mGetTiles 0x22C04 20
		.4byte	4, 0

		mGetTiles 0x22C18 25
		.4byte	4, 1

		mGetTiles 0x22C31 25
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0842_1:
		mGetPalette 0xE1 16 0x0
		mGetTiles 0x22C4A 25
		.4byte	4, 3

		mGetTiles 0x22C63 20
		.4byte	4, 4

		mGetTiles 0x22C77 20
		.4byte	5, 5

		mGetTiles 0x22C8B 20
		.4byte	6, 6

		mGetTiles 0x22C9F 20
		.4byte	6, 7

		mAnimCmd4 

	anim_data__0842_2:
		mGetPalette 0xE1 16 0x0
		mGetTiles 0x22CB3 20
		.4byte	6, 8

		mGetTiles 0x22CC7 20
		.4byte	6, 9

		mGetTiles 0x22CDB 25
		.4byte	12, 10

		mGetTiles 0x22CF4 25
		.4byte	4, 11

		mGetTiles 0x22CDB 25
		.4byte	4, 10

		mJumpBack 0xA

	anim_data__0842_3:
		mGetPalette 0xE1 16 0x0
		mGetTiles 0x22D0D 20
		.4byte	6, 12

		mGetTiles 0x22D21 16
		.4byte	6, 13

		mAnimCmd4 

	anim_data__0842_4:
		mGetPalette 0xE1 16 0x0
		mGetTiles 0x22D31 20
		.4byte	2, 14

		mGetTiles 0x22D45 20
		.4byte	2, 15

		mGetTiles 0x22D59 20
		.4byte	2, 16

		mGetTiles 0x22D6D 20
		.4byte	2, 17

		mJumpBack 0xF


.align 2, 0
	anim_0842:
		.4byte anim_data__0842_0
		.4byte anim_data__0842_1
		.4byte anim_data__0842_2
		.4byte anim_data__0842_3
		.4byte anim_data__0842_4




.align 2, 0
	anim_data__0843_0:
		mGetPalette 0xE2 16 0xE0
		mGetTiles 0x22D81 9
		.4byte	9, 0

		mGetTiles 0x22D8A 9
		.4byte	9, 1

		mGetTiles 0x22D93 9
		.4byte	9, 2

		mGetTiles 0x22D9C 9
		.4byte	9, 3

		mGetTiles 0x22DA5 9
		.4byte	9, 4

		mGetTiles 0x22DAE 9
		.4byte	9, 5

		mGetTiles 0x22D93 9
		.4byte	9, 2

		mGetTiles 0x22D8A 9
		.4byte	9, 1

		mJumpBack 0x2B

	anim_data__0843_1:
		mGetPalette 0xE2 16 0xE0
		mGetTiles 0x22DB7 9
		.4byte	9, 6

		mGetTiles 0x22DC0 9
		.4byte	9, 7

		mGetTiles 0x22DC9 9
		.4byte	9, 8

		mGetTiles 0x22DD2 9
		.4byte	9, 9

		mGetTiles 0x22DDB 9
		.4byte	9, 10

		mGetTiles 0x22DE4 9
		.4byte	9, 11

		mGetTiles 0x22DC9 9
		.4byte	9, 8

		mGetTiles 0x22DC0 9
		.4byte	9, 7

		mJumpBack 0x2B

	anim_data__0843_2:
		mGetPalette 0xE2 16 0xE0
		mGetTiles 0x22DED 9
		.4byte	3, 12

		mGetTiles 0x22DF6 9
		.4byte	3, 13

		mGetTiles 0x22DFF 9
		.4byte	2, 14

		mGetTiles 0x22E08 9
		.4byte	2, 15

		mJumpBack 0xA


.align 2, 0
	anim_0843:
		.4byte anim_data__0843_0
		.4byte anim_data__0843_1
		.4byte anim_data__0843_2




.align 2, 0
	anim_data__0844_0:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x22E11 30
		.4byte	3, 0

		mGetTiles 0x22E2F 35
		.4byte	3, 1

		mGetTiles 0x22E52 35
		.4byte	3, 2

		mJumpBack 0x12

	anim_data__0844_1:
		mGetPalette 0xBF 16 0x90
		mGetTiles 0x22E75 20
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0844:
		.4byte anim_data__0844_0
		.4byte anim_data__0844_1




.align 2, 0
	anim_data__0845_0:
		mGetPalette 0x2 16 0x50
		.4byte	12, -1

		mGetTiles 0x22E89 12
		.4byte	3, 0

		mGetTiles 0x22E95 15
		.4byte	4, 1

		mGetTiles 0x22EA4 12
		.4byte	3, 2

		mGetTiles 0x22EB0 9
		.4byte	2, 3

		mAnimCmd4 


.align 2, 0
	anim_0845:
		.4byte anim_data__0845_0




.align 2, 0
	anim_data__0846_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x22EB9 8
		.4byte	2, 0

		mGetTiles 0x22EC1 12
		.4byte	2, 1

		mGetTiles 0x22ECD 12
		.4byte	2, 2

		mGetTiles 0x22ED9 12
		.4byte	2, 3

		mGetTiles 0x22EE5 12
		.4byte	2, 4

		mGetTiles 0x22EF1 12
		.4byte	2, 5

		mGetTiles 0x22EFD 12
		.4byte	2, 6

		mGetTiles 0x22F09 8
		.4byte	2, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0846:
		.4byte anim_data__0846_0




.align 2, 0
	anim_data__0847_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x22F11 20
		.4byte	2, 0

		mGetTiles 0x22F25 20
		.4byte	2, 1

		mGetTiles 0x22F39 16
		.4byte	2, 2

		mGetTiles 0x22F49 20
		.4byte	2, 3

		mJumpBack 0x17


.align 2, 0
	anim_0847:
		.4byte anim_data__0847_0




.align 2, 0
	anim_data__0848_0:
		mGetTiles 0x22F5D 32
		mGetPalette 0x17 16 0x40
		.4byte	2, 0

		.4byte	2, 1

		.4byte	2, 2

		mAnimCmd6 0x0 0x27412741
		.4byte	2, 3

		.4byte	2, 4

		.4byte	2, 5

		.4byte	2, 6

		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0848:
		.4byte anim_data__0848_0




.align 2, 0
	anim_data__0849_0:
		mGetPalette 0xE3 16 0x70
		mGetTiles 0x22F7D 12
		.4byte	1, 0

		mGetTiles 0x22F89 12
		.4byte	1, 1

		mGetTiles 0x22F95 12
		.4byte	2, 2

		mGetTiles 0x22FA1 12
		.4byte	2, 3

		mGetTiles 0x22FAD 20
		.4byte	2, 4

		mGetTiles 0x22FC1 15
		.4byte	2, 5

		mGetTiles 0x22FD0 15
		.4byte	2, 6

		mGetTiles 0x22FDF 6
		.4byte	2, 7

		mAnimCmd4 


.align 2, 0
	anim_0849:
		.4byte anim_data__0849_0




.align 2, 0
	anim_data__0850_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x22FE5 36
		.4byte	3, 0

		mGetTiles 0x23009 36
		.4byte	3, 1

		mGetTiles 0x2302D 36
		.4byte	3, 2

		mGetTiles 0x23051 36
		.4byte	3, 3

		mGetTiles 0x23075 36
		.4byte	3, 4

		mGetTiles 0x23099 36
		.4byte	3, 5

		mJumpBack 0x21


.align 2, 0
	anim_0850:
		.4byte anim_data__0850_0




.align 2, 0
	anim_data__0851_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x230BD 36
		.4byte	3, 0

		mGetTiles 0x230E1 36
		.4byte	3, 1

		mGetTiles 0x230BD 36
		.4byte	3, 0

		mGetTiles 0x230E1 36
		.4byte	3, 1

		mGetTiles 0x23105 36
		.4byte	3, 2

		mGetTiles 0x23129 36
		.4byte	3, 3

		mGetTiles 0x23105 36
		.4byte	3, 2

		mGetTiles 0x23129 36
		.4byte	3, 3

		mGetTiles 0x2314D 36
		.4byte	3, 4

		mGetTiles 0x23171 36
		.4byte	3, 5

		mGetTiles 0x2314D 36
		.4byte	3, 4

		mGetTiles 0x23171 36
		.4byte	3, 5

		mGetTiles 0x23195 36
		.4byte	3, 6

		mGetTiles 0x231B9 36
		.4byte	3, 7

		mGetTiles 0x23195 36
		.4byte	3, 6

		mGetTiles 0x231B9 36
		.4byte	3, 7

		mJumpBack 0x53


.align 2, 0
	anim_0851:
		.4byte anim_data__0851_0




.align 2, 0
	anim_data__0852_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x231DD 36
		.4byte	2, 0

		mGetTiles 0x23201 36
		.4byte	2, 1

		mGetTiles 0x23225 36
		.4byte	2, 2

		mGetTiles 0x23249 36
		.4byte	2, 3

		mGetTiles 0x2326D 36
		.4byte	2, 4

		mGetTiles 0x23291 36
		.4byte	2, 5

		mJumpBack 0x21

	anim_data__0852_1:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x232B5 6
		.4byte	2, 6

		mGetTiles 0x232BB 6
		.4byte	2, 7

		mGetTiles 0x232C1 9
		.4byte	2, 8

		mGetTiles 0x232CA 9
		.4byte	2, 9

		mGetTiles 0x232D3 9
		.4byte	2, 10

		mGetTiles 0x232DC 9
		.4byte	2, 11

		mGetTiles 0x232E5 1
		.4byte	2, 12

		mGetTiles 0x232E6 1
		.4byte	2, 13

		mGetTiles 0x232E7 4
		.4byte	2, 14

		mGetTiles 0x232EB 4
		.4byte	2, 15

		mGetTiles 0x232EF 4
		.4byte	2, 16

		mGetTiles 0x232F3 4
		.4byte	2, 17

		mAnimCmd4 


.align 2, 0
	anim_0852:
		.4byte anim_data__0852_0
		.4byte anim_data__0852_1




.align 2, 0
	anim_data__0853_0:
		mGetTiles 0x232F7 4
		mGetPalette 0x2 16 0x50
		.4byte	12, 0

		.4byte	12, 1

		.4byte	12, 2

		.4byte	12, 3

		mJumpBack 0xB


.align 2, 0
	anim_0853:
		.4byte anim_data__0853_0




.align 2, 0
	anim_data__0854_0:
		mGetTiles 0x232FB 16
		mGetPalette 0x2 16 0x50
		.4byte	12, 0

		.4byte	12, 1

		.4byte	12, 2

		.4byte	12, 3

		mJumpBack 0xB


.align 2, 0
	anim_0854:
		.4byte anim_data__0854_0




.align 2, 0
	anim_data__0855_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x2330B 2
		.4byte	3, 0

		mGetTiles 0x2330D 8
		.4byte	3, 1

		mGetTiles 0x23315 10
		.4byte	3, 2

		mGetTiles 0x2331F 10
		.4byte	3, 3

		mGetTiles 0x23329 4
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0855:
		.4byte anim_data__0855_0




.align 2, 0
	anim_data__0856_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x2332D 2
		.4byte	3, 0

		mGetTiles 0x2332F 8
		.4byte	3, 1

		mGetTiles 0x23337 8
		.4byte	3, 2

		mGetTiles 0x2333F 5
		.4byte	3, 3

		mGetTiles 0x23344 5
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0856:
		.4byte anim_data__0856_0




.align 2, 0
	anim_data__0857_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x23349 2
		.4byte	3, 0

		mGetTiles 0x2334B 8
		.4byte	3, 1

		mGetTiles 0x23353 8
		.4byte	3, 2

		mGetTiles 0x2335B 4
		.4byte	3, 3

		mGetTiles 0x2335F 4
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0857:
		.4byte anim_data__0857_0




.align 2, 0
	anim_data__0858_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x23363 4
		.4byte	3, 0

		mGetTiles 0x23367 4
		.4byte	3, 1

		mGetTiles 0x2336B 4
		.4byte	3, 2

		mGetTiles 0x2336F 4
		.4byte	3, 3

		mGetTiles 0x23373 2
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0858:
		.4byte anim_data__0858_0




.align 2, 0
	anim_data__0859_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x23375 2
		.4byte	3, 0

		mGetTiles 0x23377 4
		.4byte	3, 1

		mGetTiles 0x2337B 4
		.4byte	3, 2

		mGetTiles 0x2337F 4
		.4byte	3, 3

		mGetTiles 0x23383 2
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0859:
		.4byte anim_data__0859_0




.align 2, 0
	anim_data__0860_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x23385 2
		.4byte	3, 0

		mGetTiles 0x23387 4
		.4byte	3, 1

		mGetTiles 0x2338B 4
		.4byte	3, 2

		mGetTiles 0x2338F 4
		.4byte	3, 3

		mGetTiles 0x23393 2
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0860:
		.4byte anim_data__0860_0




.align 2, 0
	anim_data__0861_0:
		mGetPalette 0xA4 16 0x60
		mGetTiles 0x23395 6
		.4byte	3, 0

		mGetTiles 0x2339B 12
		.4byte	3, 1

		mGetTiles 0x233A7 12
		.4byte	3, 2

		mGetTiles 0x233B3 8
		.4byte	3, 3

		mGetTiles 0x233BB 4
		.4byte	3, 4

		mGetTiles 0x233BF 6
		.4byte	3, 5

		mGetTiles 0x233C5 6
		.4byte	3, 6

		mGetTiles 0x233CB 4
		.4byte	3, 7

		mAnimCmd4 


.align 2, 0
	anim_0861:
		.4byte anim_data__0861_0




.align 2, 0
	anim_data__0862_0:
		mGetPalette 0xA4 16 0x60
		mGetTiles 0x233CF 9
		.4byte	3, 0

		mGetTiles 0x233D8 16
		.4byte	3, 1

		mGetTiles 0x233E8 16
		.4byte	3, 2

		mGetTiles 0x233F8 16
		.4byte	3, 3

		mGetTiles 0x23408 16
		.4byte	3, 4

		mAnimCmd4 


.align 2, 0
	anim_0862:
		.4byte anim_data__0862_0




.align 2, 0
	anim_data__0863_0:
		mGetPalette 0xE4 16 0x0
		mGetTiles 0x23418 4
		.4byte	3, 0

		mGetTiles 0x2341C 4
		.4byte	3, 1

		mGetTiles 0x23420 4
		.4byte	3, 2

		mGetTiles 0x23424 4
		.4byte	3, 3

		mGetTiles 0x23428 4
		.4byte	3, 4

		mGetTiles 0x2342C 4
		.4byte	3, 5

		mGetTiles 0x23430 4
		.4byte	3, 6

		mGetTiles 0x23434 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0863:
		.4byte anim_data__0863_0




.align 2, 0
	anim_data__0864_0:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x23438 4
		.4byte	3, 0

		mGetTiles 0x2343C 4
		.4byte	3, 1

		mGetTiles 0x23440 4
		.4byte	3, 2

		mGetTiles 0x23444 4
		.4byte	3, 3

		mGetTiles 0x23448 4
		.4byte	3, 4

		mGetTiles 0x2344C 4
		.4byte	3, 5

		mGetTiles 0x23450 4
		.4byte	3, 6

		mGetTiles 0x23454 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0864:
		.4byte anim_data__0864_0




.align 2, 0
	anim_data__0865_0:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x23458 4
		.4byte	3, 0

		mGetTiles 0x2345C 4
		.4byte	3, 1

		mGetTiles 0x23460 4
		.4byte	3, 2

		mGetTiles 0x23464 4
		.4byte	3, 3

		mGetTiles 0x23468 4
		.4byte	3, 4

		mGetTiles 0x2346C 4
		.4byte	3, 5

		mGetTiles 0x23470 4
		.4byte	3, 6

		mGetTiles 0x23474 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0865:
		.4byte anim_data__0865_0




.align 2, 0
	anim_data__0866_0:
		mGetPalette 0xBE 16 0x0
		mGetTiles 0x23478 4
		.4byte	3, 0

		mGetTiles 0x2347C 4
		.4byte	3, 1

		mGetTiles 0x23480 4
		.4byte	3, 2

		mGetTiles 0x23484 4
		.4byte	3, 3

		mGetTiles 0x23488 4
		.4byte	3, 4

		mGetTiles 0x2348C 4
		.4byte	3, 5

		mGetTiles 0x23490 4
		.4byte	3, 6

		mGetTiles 0x23494 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0866:
		.4byte anim_data__0866_0




.align 2, 0
	anim_data__0867_0:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x23498 4
		.4byte	3, 0

		mGetTiles 0x2349C 4
		.4byte	3, 1

		mGetTiles 0x234A0 4
		.4byte	3, 2

		mGetTiles 0x234A4 4
		.4byte	3, 3

		mGetTiles 0x234A8 4
		.4byte	3, 4

		mGetTiles 0x234AC 4
		.4byte	3, 5

		mGetTiles 0x234B0 4
		.4byte	3, 6

		mGetTiles 0x234B4 4
		.4byte	3, 7

		mJumpBack 0x2B


.align 2, 0
	anim_0867:
		.4byte anim_data__0867_0




.align 2, 0
	anim_data__0868_0:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x234B8 46
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0868_1:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x234E6 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0868_2:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x234FA 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0868_3:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x2350E 16
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0868_4:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x2351E 28
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0868_5:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x2353A 20
		.4byte	1, 5

		mJumpBack 0x8

	anim_data__0868_6:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x2354E 20
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0868_7:
		mGetPalette 0xE6 16 0x40
		mGetTiles 0x23562 40
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0xE7 16 0x60
		mGetTiles 0x2358A 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0869_1:
		mGetPalette 0xE6 16 0x40
		mGetTiles 0x2359E 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0869_2:
		mGetPalette 0xE5 16 0x30
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0869_3:
		mGetPalette 0xE5 16 0x30
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0869_4:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x235B2 8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0869_5:
		mGetPalette 0xE5 16 0x30
		.4byte	1, -1

		mAnimCmd4 


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
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235BA 4
		.4byte	60, 0

		mAnimCmd4 

	anim_data__0870_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235BE 4
		.4byte	60, 1

		mAnimCmd4 

	anim_data__0870_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235C2 4
		.4byte	60, 2

		mAnimCmd4 

	anim_data__0870_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235C6 4
		.4byte	60, 3

		mAnimCmd4 

	anim_data__0870_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235CA 4
		.4byte	60, 4

		mAnimCmd4 

	anim_data__0870_5:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x235CE 4
		.4byte	60, 5

		mAnimCmd4 


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
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x235D8 24
		.4byte	2, 1

		mGetTiles 0x235F0 24
		.4byte	2, 2

		mGetTiles 0x23608 24
		.4byte	2, 3

		mGetTiles 0x23620 36
		.4byte	3, 4

		mGetTiles 0x23644 24
		.4byte	3, 5

		mGetTiles 0x2365C 24
		.4byte	16, 6

		mAnimCmd4 

	anim_data__0871_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x23674 24
		.4byte	2, 7

		mGetTiles 0x2368C 24
		.4byte	2, 8

		mGetTiles 0x236A4 24
		.4byte	2, 9

		mGetTiles 0x236BC 36
		.4byte	3, 10

		mGetTiles 0x236E0 24
		.4byte	3, 11

		mGetTiles 0x236F8 24
		.4byte	16, 12

		mAnimCmd4 

	anim_data__0871_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x23710 24
		.4byte	2, 13

		mGetTiles 0x23728 24
		.4byte	2, 14

		mGetTiles 0x23740 24
		.4byte	2, 15

		mGetTiles 0x23758 36
		.4byte	3, 16

		mGetTiles 0x2377C 24
		.4byte	3, 17

		mGetTiles 0x23794 24
		.4byte	16, 18

		mAnimCmd4 

	anim_data__0871_3:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x237AC 24
		.4byte	2, 19

		mGetTiles 0x237C4 24
		.4byte	2, 20

		mGetTiles 0x237DC 24
		.4byte	2, 21

		mGetTiles 0x237F4 36
		.4byte	3, 22

		mGetTiles 0x23818 24
		.4byte	3, 23

		mGetTiles 0x23830 24
		.4byte	16, 24

		mAnimCmd4 

	anim_data__0871_4:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x23848 24
		.4byte	2, 25

		mGetTiles 0x23860 24
		.4byte	2, 26

		mGetTiles 0x23878 24
		.4byte	2, 27

		mGetTiles 0x23890 36
		.4byte	3, 28

		mGetTiles 0x238B4 24
		.4byte	3, 29

		mGetTiles 0x238CC 24
		.4byte	16, 30

		mAnimCmd4 

	anim_data__0871_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x235D2 6
		.4byte	2, 0

		mGetTiles 0x238E4 24
		.4byte	2, 31

		mGetTiles 0x238FC 24
		.4byte	2, 32

		mGetTiles 0x23914 24
		.4byte	2, 33

		mGetTiles 0x2392C 36
		.4byte	3, 34

		mGetTiles 0x23818 24
		.4byte	3, 23

		mGetTiles 0x23950 24
		.4byte	16, 35

		mAnimCmd4 


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
		mGetPalette 0x17 16 0x40
		mGetTiles 0x23968 10
		.4byte	2, 0

		mGetTiles 0x23972 10
		.4byte	2, 1

		mGetTiles 0x2397C 10
		.4byte	2, 2

		mGetTiles 0x23986 10
		.4byte	2, 3

		mGetTiles 0x23990 15
		.4byte	2, 4

		mGetTiles 0x2399F 15
		.4byte	2, 5

		mAnimCmd4 


.align 2, 0
	anim_0872:
		.4byte anim_data__0872_0




.align 2, 0
	anim_data__0873_0:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x239AE 1
		.4byte	2, 0

		mGetTiles 0x239AF 1
		.4byte	2, 1

		mJumpBack 0xD

	anim_data__0873_1:
		mGetPalette 0x17 16 0x40
		mGetTiles 0x239AE 1
		.4byte	2, 0

		mGetTiles 0x239AF 1
		.4byte	2, 1

		mGetTiles 0x239AE 1
		.4byte	2, 0

		mGetTiles 0x239AF 1
		.4byte	2, 1

		mGetTiles 0x239AE 1
		.4byte	2, 0

		mGetTiles 0x239AF 1
		.4byte	2, 1

		mGetTiles 0x239B0 1
		.4byte	2, 2

		mGetTiles 0x239B1 1
		.4byte	2, 3

		mGetTiles 0x239B2 1
		.4byte	2, 4

		mGetTiles 0x239B3 1
		.4byte	2, 5

		mAnimCmd4 


.align 2, 0
	anim_0873:
		.4byte anim_data__0873_0
		.4byte anim_data__0873_1




.align 2, 0
	anim_data__0874_0:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x239B4 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0874_1:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x239DA 30
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0874_2:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x239F8 32
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0874_3:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A18 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0874_4:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A2E 44
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0874_5:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A5A 34
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0874_6:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A7C 32
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23A9C 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0875_1:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23AC2 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0875_2:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23ADC 28
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0875_3:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23AF8 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0875_4:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B0E 46
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0875_5:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B3C 30
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0875_6:
		mGetPalette 0xE5 16 0x30
		mGetTiles 0x23B5A 34
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23B7C 46
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0876_1:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23BAA 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0876_2:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23BC4 28
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0876_3:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23BE0 20
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0876_4:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23BF4 44
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0876_5:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23C20 34
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0876_6:
		mGetPalette 0xE8 16 0x30
		mGetTiles 0x23C42 26
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C5C 30
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0877_1:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C7A 30
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0877_2:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23C98 38
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0877_3:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CBE 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0877_4:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CD4 38
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0877_5:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23CFA 22
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0877_6:
		mGetPalette 0xE9 16 0x30
		mGetTiles 0x23D10 30
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23D2E 30
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0878_1:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23D4C 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0878_2:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23D66 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0878_3:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23D8E 18
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0878_4:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23DA0 38
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0878_5:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23DC6 38
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0878_6:
		mGetPalette 0xEA 16 0x30
		mGetTiles 0x23DEC 38
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x34 16 0x70
		mGetTiles 0x23E12 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0879:
		.4byte anim_data__0879_0




.align 2, 0
	anim_data__0880_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x23E16 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0880:
		.4byte anim_data__0880_0




.align 2, 0
	anim_data__0881_0:
		mGetPalette 0x2 16 0x50
		mGetTiles 0x23E1A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 0

		mGetTiles 0x23E22 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 1

		mGetTiles 0x23E2A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 2

		mGetTiles 0x23E32 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 3

		mGetTiles 0x23E3A 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 4

		mGetTiles 0x23E42 8
		mAnimCmd6 0x0 0xEE01EE01
		.4byte	5, 5

		mJumpBack 0x33


.align 2, 0
	anim_0881:
		.4byte anim_data__0881_0




.align 2, 0
	anim_data__0882_0:
		mGetTiles 0x23E4A 16
		mGetPalette 0xA1 16 0x70
		.4byte	6, 0

		.4byte	6, 1

		.4byte	6, 2

		.4byte	6, 3

		mJumpBack 0xB

	anim_data__0882_1:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23E5A 4
		.4byte	6, 4

		mGetTiles 0x23E5E 4
		.4byte	6, 5

		mGetTiles 0x23E62 4
		.4byte	6, 6

		mGetTiles 0x23E66 4
		.4byte	6, 7

		mJumpBack 0x17

	anim_data__0882_2:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23E6A 1
		.4byte	6, 8

		mGetTiles 0x23E6B 1
		.4byte	6, 9

		mGetTiles 0x23E6C 1
		.4byte	6, 10

		mGetTiles 0x23E6D 1
		.4byte	6, 11

		mJumpBack 0x17

	anim_data__0882_3:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23E6E 1
		.4byte	6, 12

		mGetTiles 0x23E6F 1
		.4byte	6, 13

		mGetTiles 0x23E70 1
		.4byte	6, 14

		mGetTiles 0x23E71 1
		.4byte	6, 15

		mJumpBack 0x17

	anim_data__0882_4:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23E72 1
		.4byte	6, 16

		mGetTiles 0x23E73 1
		.4byte	6, 17

		mGetTiles 0x23E74 1
		.4byte	6, 18

		mGetTiles 0x23E75 1
		.4byte	6, 19

		mJumpBack 0x17

	anim_data__0882_5:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23E76 4
		.4byte	6, 20

		mGetTiles 0x23E7A 4
		.4byte	6, 21

		mGetTiles 0x23E7E 4
		.4byte	6, 22

		mGetTiles 0x23E82 4
		.4byte	6, 23

		mJumpBack 0x17

	anim_data__0882_6:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23E86 4
		.4byte	6, 24

		mGetTiles 0x23E8A 4
		.4byte	6, 25

		mGetTiles 0x23E8E 4
		.4byte	6, 26

		mGetTiles 0x23E92 4
		.4byte	6, 27

		mJumpBack 0x17

	anim_data__0882_7:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23E96 1
		.4byte	6, 28

		mGetTiles 0x23E97 1
		.4byte	6, 29

		mGetTiles 0x23E98 1
		.4byte	6, 30

		mGetTiles 0x23E99 1
		.4byte	6, 31

		mJumpBack 0x17

	anim_data__0882_8:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23E9A 1
		.4byte	6, 32

		mGetTiles 0x23E9B 1
		.4byte	6, 33

		mGetTiles 0x23E9C 1
		.4byte	6, 34

		mGetTiles 0x23E9D 1
		.4byte	6, 35

		mJumpBack 0x17

	anim_data__0882_9:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23E9E 1
		.4byte	6, 36

		mGetTiles 0x23E9F 1
		.4byte	6, 37

		mGetTiles 0x23EA0 1
		.4byte	6, 38

		mGetTiles 0x23EA1 1
		.4byte	6, 39

		mJumpBack 0x17

	anim_data__0882_10:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23EA2 1
		.4byte	6, 40

		mGetTiles 0x23EA3 1
		.4byte	6, 41

		mGetTiles 0x23EA4 1
		.4byte	6, 42

		mGetTiles 0x23EA5 1
		.4byte	6, 43

		mJumpBack 0x17

	anim_data__0882_11:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23EA6 1
		.4byte	6, 44

		mGetTiles 0x23EA7 1
		.4byte	6, 45

		mGetTiles 0x23EA8 1
		.4byte	6, 46

		mGetTiles 0x23EA9 1
		.4byte	6, 47

		mJumpBack 0x17

	anim_data__0882_12:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23EAA 1
		.4byte	6, 48

		mGetTiles 0x23EAB 1
		.4byte	6, 49

		mGetTiles 0x23EAC 1
		.4byte	6, 50

		mGetTiles 0x23EAD 1
		.4byte	6, 51

		mJumpBack 0x17

	anim_data__0882_13:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23EAE 1
		.4byte	6, 52

		mGetTiles 0x23EAF 1
		.4byte	6, 53

		mGetTiles 0x23EB0 1
		.4byte	6, 54

		mGetTiles 0x23EB1 1
		.4byte	6, 55

		mJumpBack 0x17

	anim_data__0882_14:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x23EB2 1
		.4byte	6, 56

		mGetTiles 0x23EB3 1
		.4byte	6, 57

		mGetTiles 0x23EB4 1
		.4byte	6, 58

		mGetTiles 0x23EB5 1
		.4byte	6, 59

		mJumpBack 0x17

	anim_data__0882_15:
		mGetPalette 0xEB 16 0xA0
		mGetTiles 0x23EB6 1
		.4byte	6, 60

		mGetTiles 0x23EB7 1
		.4byte	6, 61

		mGetTiles 0x23EB8 1
		.4byte	6, 62

		mGetTiles 0x23EB9 1
		.4byte	6, 63

		mJumpBack 0x17


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
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x23EBA 64
		.4byte	3, 0

		mGetTiles 0x23EFA 64
		.4byte	3, 1

		mJumpBack 0xD

	anim_data__0883_1:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x23F3A 64
		.4byte	3, 2

		mGetTiles 0x23F7A 64
		.4byte	3, 3

		mJumpBack 0xD

	anim_data__0883_2:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x23FBA 64
		.4byte	3, 4

		mGetTiles 0x23FFA 64
		.4byte	3, 5

		mJumpBack 0xD

	anim_data__0883_3:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x2403A 64
		.4byte	3, 6

		mGetTiles 0x2407A 64
		.4byte	3, 7

		mJumpBack 0xD

	anim_data__0883_4:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x240BA 64
		.4byte	3, 8

		mGetTiles 0x240FA 64
		.4byte	3, 9

		mJumpBack 0xD

	anim_data__0883_5:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x2413A 64
		.4byte	3, 10

		mGetTiles 0x2417A 64
		.4byte	3, 11

		mJumpBack 0xD

	anim_data__0883_6:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x241BA 64
		.4byte	3, 12

		mGetTiles 0x241FA 64
		.4byte	3, 13

		mJumpBack 0xD

	anim_data__0883_7:
		mGetPalette 0xEC 16 0x10
		mGetTiles 0x2423A 64
		.4byte	3, 14

		mGetTiles 0x2427A 64
		.4byte	3, 15

		mJumpBack 0xD


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
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x242BA 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0884_1:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x242BC 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0884_2:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x242C0 1
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0884_3:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x242C1 1
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0884:
		.4byte anim_data__0884_0
		.4byte anim_data__0884_1
		.4byte anim_data__0884_2
		.4byte anim_data__0884_3




.align 2, 0
	anim_data__0885_0:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242C2 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0885_1:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242C4 2
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0885_2:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242C6 2
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0885_3:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242C8 2
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0885_4:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242CA 2
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0885_5:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242CC 2
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0885_6:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242CE 2
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0885_7:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242D0 2
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242D2 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0886:
		.4byte anim_data__0886_0




.align 2, 0
	anim_data__0887_0:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x242E6 1
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0887:
		.4byte anim_data__0887_0




.align 2, 0
	anim_data__0888_0:
		mGetPalette 0xED 16 0x80
		mGetTiles 0x242E7 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0888_1:
		mGetPalette 0xED 16 0x80
		mGetTiles 0x242EF 8
		.4byte	3, 1

		mGetTiles 0x242F7 8
		.4byte	3, 2

		mGetTiles 0x242FF 8
		.4byte	3, 3

		mGetTiles 0x24307 8
		.4byte	3, 4

		mJumpBack 0x17


.align 2, 0
	anim_0888:
		.4byte anim_data__0888_0
		.4byte anim_data__0888_1




.align 2, 0
	anim_data__0889_0:
		mGetPalette 0x34 16 0x90
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0889:
		.4byte anim_data__0889_0




.align 2, 0
	anim_data__0890_0:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x2430F 4
		.4byte	3, 0

		mGetTiles 0x24313 4
		.4byte	2, 1

		mJumpBack 0xD

	anim_data__0890_1:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x24317 4
		.4byte	3, 2

		mGetTiles 0x2431B 4
		.4byte	2, 3

		mJumpBack 0xD

	anim_data__0890_2:
		mGetPalette 0xEE 16 0xB0
		mGetTiles 0x2431F 4
		.4byte	3, 4

		mGetTiles 0x24323 4
		.4byte	2, 5

		mJumpBack 0xD


.align 2, 0
	anim_0890:
		.4byte anim_data__0890_0
		.4byte anim_data__0890_1
		.4byte anim_data__0890_2




.align 2, 0
	anim_data__0891_0:
		mGetTiles 0x24327 4
		mGetPalette 0xA1 16 0x70
		.4byte	4, 0

		mAnimCmd4 

	anim_data__0891_1:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x2432B 4
		.4byte	4, 1

		mAnimCmd4 

	anim_data__0891_2:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x2432F 4
		.4byte	4, 2

		mAnimCmd4 

	anim_data__0891_3:
		mGetPalette 0xA1 16 0x70
		mGetTiles 0x24333 4
		.4byte	4, 3

		mAnimCmd4 


.align 2, 0
	anim_0891:
		.4byte anim_data__0891_0
		.4byte anim_data__0891_1
		.4byte anim_data__0891_2
		.4byte anim_data__0891_3




.align 2, 0
	anim_data__0892_0:
		mGetPalette 0xA3 16 0x70
		mGetTiles 0x24337 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0892:
		.4byte anim_data__0892_0




.align 2, 0
	anim_data__0893_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2435F 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0893_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2437F 40
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0893:
		.4byte anim_data__0893_0
		.4byte anim_data__0893_1




.align 2, 0
	anim_data__0894_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x243A7 22
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0894_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x243BD 22
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0894_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x243D3 22
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0894:
		.4byte anim_data__0894_0
		.4byte anim_data__0894_1
		.4byte anim_data__0894_2




.align 2, 0
	anim_data__0895_0:
		mGetPalette 0xB2 16 0xC0
		mGetTiles 0x243E9 9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0895_1:
		mGetPalette 0xB2 16 0xC0
		mGetTiles 0x243F2 9
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0895_2:
		mGetPalette 0xB3 16 0xD0
		mGetTiles 0x243FB 9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0895_3:
		mGetPalette 0xB3 16 0xD0
		mGetTiles 0x24404 9
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0895_4:
		mGetPalette 0xB4 16 0xE0
		mGetTiles 0x2440D 9
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0895_5:
		mGetPalette 0xB4 16 0xE0
		mGetTiles 0x24416 9
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0895_6:
		mGetPalette 0xEF 16 0x20
		mGetTiles 0x2441F 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0895_7:
		mGetPalette 0xEF 16 0x20
		mGetTiles 0x24428 9
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0895_8:
		mGetPalette 0xEF 16 0x20
		mGetTiles 0x24431 9
		.4byte	3, 8

		mGetTiles 0x2443A 9
		.4byte	3, 9

		mGetTiles 0x24443 9
		.4byte	2, 10

		mGetTiles 0x24428 9
		.4byte	2, 7

		mGetTiles 0x2444C 9
		.4byte	2, 11

		mAnimCmd4 


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
		mGetPalette 0xF0 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF1 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF0 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF1 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF2 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF3 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF2 16 0xF0
		.4byte	7, -1

		mGetPalette 0xF1 16 0xF0
		.4byte	7, -1

		mJumpBack 0x28


.align 2, 0
	anim_0896:
		.4byte anim_data__0896_0




.align 2, 0
	anim_data__0897_0:
		mGetPalette 0xF4 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF5 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF6 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF7 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF8 16 0xD0
		.4byte	1, -1

		mGetPalette 0xF9 16 0xD0
		.4byte	1, -1

		mGetPalette 0xFA 16 0xD0
		.4byte	1, -1

		mGetPalette 0xFB 16 0xD0
		.4byte	1, -1

		mJumpBack 0x28


.align 2, 0
	anim_0897:
		.4byte anim_data__0897_0




.align 2, 0
	anim_data__0898_0:
		mGetPalette 0xFC 16 0x20
		.4byte	2, -1

		mGetPalette 0xFD 16 0x20
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0898:
		.4byte anim_data__0898_0




.align 2, 0
	anim_data__0899_0:
		mGetPalette 0xFC 16 0x70
		.4byte	2, -1

		mGetPalette 0xFD 16 0x70
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0899:
		.4byte anim_data__0899_0




.align 2, 0
	anim_data__0900_0:
		mGetPalette 0xFE 16 0x0
		.4byte	20, -1

		mGetPalette 0xFF 16 0x0
		.4byte	20, -1

		mGetPalette 0x100 16 0x0
		.4byte	20, -1

		mJumpBack 0xF

	anim_data__0900_1:
		mGetPalette 0xFF 16 0x10
		.4byte	20, -1

		mGetPalette 0x100 16 0x10
		.4byte	20, -1

		mGetPalette 0xFE 16 0x10
		.4byte	20, -1

		mJumpBack 0xF

	anim_data__0900_2:
		mGetPalette 0x100 16 0x20
		.4byte	20, -1

		mGetPalette 0xFE 16 0x20
		.4byte	20, -1

		mGetPalette 0xFF 16 0x20
		.4byte	20, -1

		mJumpBack 0xF


.align 2, 0
	anim_0900:
		.4byte anim_data__0900_0
		.4byte anim_data__0900_1
		.4byte anim_data__0900_2




.align 2, 0
	anim_data__0901_0:
		mGetPalette 0x101 16 0x90
		.4byte	3, -1

		mGetPalette 0x102 16 0x90
		.4byte	3, -1

		mGetPalette 0x103 16 0x90
		.4byte	3, -1

		mGetPalette 0x104 16 0x90
		.4byte	3, -1

		mGetPalette 0x105 16 0x90
		.4byte	3, -1

		mGetPalette 0x106 16 0x90
		.4byte	3, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0901:
		.4byte anim_data__0901_0




.align 2, 0
	anim_data__0902_0:
		mGetPalette 0xFC 16 0x0
		.4byte	2, -1

		mGetPalette 0xFD 16 0x0
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0902:
		.4byte anim_data__0902_0




.align 2, 0
	anim_data__0903_0:
		mGetPalette 0x107 16 0x30
		.4byte	2, -1

		mGetPalette 0x108 16 0x30
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0903:
		.4byte anim_data__0903_0




.align 2, 0
	anim_data__0904_0:
		mGetPalette 0xFC 16 0x60
		.4byte	2, -1

		mGetPalette 0xFD 16 0x60
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0904:
		.4byte anim_data__0904_0




.align 2, 0
	anim_data__0905_0:
		mGetPalette 0xFC 16 0x60
		.4byte	2, -1

		mGetPalette 0xFD 16 0x60
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0905:
		.4byte anim_data__0905_0




.align 2, 0
	anim_data__0906_0:
		mGetPalette 0x109 16 0x20
		.4byte	100, -1

		mGetPalette 0x10A 16 0x20
		.4byte	8, -1

		mGetPalette 0x10B 16 0x20
		.4byte	8, -1

		mGetPalette 0x10C 16 0x20
		.4byte	8, -1

		mJumpBack 0x14

	anim_data__0906_1:
		mGetPalette 0x10D 16 0x30
		.4byte	8, -1

		mGetPalette 0x10E 16 0x30
		.4byte	8, -1

		mGetPalette 0x10F 16 0x30
		.4byte	100, -1

		mGetPalette 0x110 16 0x30
		.4byte	8, -1

		mJumpBack 0x14

	anim_data__0906_2:
		mGetPalette 0x111 16 0xD0
		.4byte	9, -1

		mGetPalette 0x112 16 0xD0
		.4byte	9, -1

		mGetPalette 0x113 16 0xD0
		.4byte	9, -1

		mGetPalette 0x114 16 0xD0
		.4byte	9, -1

		mJumpBack 0x14


.align 2, 0
	anim_0906:
		.4byte anim_data__0906_0
		.4byte anim_data__0906_1
		.4byte anim_data__0906_2




.align 2, 0
	anim_data__0907_0:
		mGetPalette 0x115 16 0x80
		.4byte	5, -1

		mGetPalette 0x116 16 0x80
		.4byte	5, -1

		mGetPalette 0x117 16 0x80
		.4byte	5, -1

		mGetPalette 0x118 16 0x80
		.4byte	5, -1

		mGetPalette 0x119 16 0x80
		.4byte	5, -1

		mGetPalette 0x11A 16 0x80
		.4byte	5, -1

		mGetPalette 0x11B 16 0x80
		.4byte	5, -1

		mGetPalette 0x11C 16 0x80
		.4byte	5, -1

		mGetPalette 0x11D 16 0x80
		.4byte	5, -1

		mJumpBack 0xA


.align 2, 0
	anim_0907:
		.4byte anim_data__0907_0




.align 2, 0
	anim_data__0908_0:
		mGetPalette 0x11E 16 0x90
		.4byte	5, -1

		mGetPalette 0x11F 16 0x90
		.4byte	5, -1

		mGetPalette 0x120 16 0x90
		.4byte	5, -1

		mGetPalette 0x121 16 0x90
		.4byte	5, -1

		mGetPalette 0x122 16 0x90
		.4byte	5, -1

		mGetPalette 0x123 16 0x90
		.4byte	5, -1

		mGetPalette 0x124 16 0x90
		.4byte	5, -1

		mGetPalette 0x125 16 0x90
		.4byte	5, -1

		mGetPalette 0x126 16 0x90
		.4byte	5, -1

		mJumpBack 0xA


.align 2, 0
	anim_0908:
		.4byte anim_data__0908_0




.align 2, 0
	anim_data__0909_0:
		mGetPalette 0x127 16 0x20
		.4byte	10, -1

		mGetPalette 0x128 16 0x20
		.4byte	10, -1

		mGetPalette 0x129 16 0x20
		.4byte	10, -1

		mJumpBack 0xF


.align 2, 0
	anim_0909:
		.4byte anim_data__0909_0




.align 2, 0
	anim_data__0910_0:
		mGetPalette 0x12A 16 0x10
		.4byte	9, -1

		mGetPalette 0x12B 16 0x10
		.4byte	9, -1

		mGetPalette 0x12C 16 0x10
		.4byte	9, -1

		mGetPalette 0x12D 16 0x10
		.4byte	9, -1

		mGetPalette 0x12E 16 0x10
		.4byte	9, -1

		mGetPalette 0x12F 16 0x10
		.4byte	9, -1

		mGetPalette 0x130 16 0x10
		.4byte	9, -1

		mGetPalette 0x12F 16 0x10
		.4byte	9, -1

		mGetPalette 0x12E 16 0x10
		.4byte	9, -1

		mGetPalette 0x12D 16 0x10
		.4byte	9, -1

		mGetPalette 0x12C 16 0x10
		.4byte	9, -1

		mGetPalette 0x12B 16 0x10
		.4byte	9, -1

		mJumpBack 0x3C


.align 2, 0
	anim_0910:
		.4byte anim_data__0910_0




.align 2, 0
	anim_data__0911_0:
		mGetPalette 0x131 16 0x40
		.4byte	9, -1

		mGetPalette 0x132 16 0x40
		.4byte	9, -1

		mGetPalette 0x133 16 0x40
		.4byte	9, -1

		mGetPalette 0x134 16 0x40
		.4byte	9, -1

		mGetPalette 0x135 16 0x40
		.4byte	9, -1

		mGetPalette 0x136 16 0x40
		.4byte	9, -1

		mGetPalette 0x137 16 0x40
		.4byte	9, -1

		mGetPalette 0x138 16 0x40
		.4byte	9, -1

		mGetPalette 0x137 16 0x40
		.4byte	9, -1

		mGetPalette 0x136 16 0x40
		.4byte	9, -1

		mGetPalette 0x135 16 0x40
		.4byte	9, -1

		mGetPalette 0x134 16 0x40
		.4byte	9, -1

		mJumpBack 0x3C


.align 2, 0
	anim_0911:
		.4byte anim_data__0911_0




.align 2, 0
	anim_data__0912_0:
		mGetPalette 0x139 16 0x50
		.4byte	9, -1

		mGetPalette 0x13A 16 0x50
		.4byte	9, -1

		mGetPalette 0x13B 16 0x50
		.4byte	9, -1

		mGetPalette 0x13C 16 0x50
		.4byte	9, -1

		mGetPalette 0x13D 16 0x50
		.4byte	9, -1

		mGetPalette 0x13E 16 0x50
		.4byte	9, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0912:
		.4byte anim_data__0912_0




.align 2, 0
	anim_data__0913_0:
		mGetPalette 0x13F 16 0x60
		.4byte	9, -1

		mGetPalette 0x140 16 0x60
		.4byte	9, -1

		mGetPalette 0x141 16 0x60
		.4byte	9, -1

		mGetPalette 0x142 16 0x60
		.4byte	9, -1

		mGetPalette 0x143 16 0x60
		.4byte	9, -1

		mGetPalette 0x140 16 0x60
		.4byte	9, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0913:
		.4byte anim_data__0913_0




.align 2, 0
	anim_data__0914_0:
		mGetPalette 0x144 16 0x70
		.4byte	9, -1

		mGetPalette 0x145 16 0x70
		.4byte	9, -1

		mGetPalette 0x146 16 0x70
		.4byte	9, -1

		mGetPalette 0x147 16 0x70
		.4byte	9, -1

		mGetPalette 0x146 16 0x70
		.4byte	9, -1

		mGetPalette 0x145 16 0x70
		.4byte	9, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0914:
		.4byte anim_data__0914_0




.align 2, 0
	anim_data__0915_0:
		mGetPalette 0x148 16 0x10
		.4byte	30, -1

		mGetPalette 0x149 16 0x10
		.4byte	7, -1

		mGetPalette 0x14A 16 0x10
		.4byte	7, -1

		mGetPalette 0x14B 16 0x10
		.4byte	7, -1

		mGetPalette 0x14C 16 0x10
		.4byte	7, -1

		mGetPalette 0x14D 16 0x10
		.4byte	30, -1

		mGetPalette 0x14E 16 0x10
		.4byte	7, -1

		mGetPalette 0x14F 16 0x10
		.4byte	7, -1

		mGetPalette 0x150 16 0x10
		.4byte	7, -1

		mGetPalette 0x151 16 0x10
		.4byte	7, -1

		mGetPalette 0x152 16 0x10
		.4byte	30, -1

		mGetPalette 0x153 16 0x10
		.4byte	7, -1

		mGetPalette 0x154 16 0x10
		.4byte	7, -1

		mGetPalette 0x155 16 0x10
		.4byte	7, -1

		mGetPalette 0x156 16 0x10
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0915:
		.4byte anim_data__0915_0




.align 2, 0
	anim_data__0916_0:
		mGetPalette 0x157 16 0x50
		.4byte	30, -1

		mGetPalette 0x158 16 0x50
		.4byte	7, -1

		mGetPalette 0x159 16 0x50
		.4byte	7, -1

		mGetPalette 0x15A 16 0x50
		.4byte	7, -1

		mGetPalette 0x15B 16 0x50
		.4byte	7, -1

		mGetPalette 0x15C 16 0x50
		.4byte	30, -1

		mGetPalette 0x15D 16 0x50
		.4byte	7, -1

		mGetPalette 0x15E 16 0x50
		.4byte	7, -1

		mGetPalette 0x15F 16 0x50
		.4byte	7, -1

		mGetPalette 0x160 16 0x50
		.4byte	7, -1

		mGetPalette 0x161 16 0x50
		.4byte	30, -1

		mGetPalette 0x162 16 0x50
		.4byte	7, -1

		mGetPalette 0x163 16 0x50
		.4byte	7, -1

		mGetPalette 0x164 16 0x50
		.4byte	7, -1

		mGetPalette 0x165 16 0x50
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0916:
		.4byte anim_data__0916_0




.align 2, 0
	anim_data__0917_0:
		mGetPalette 0x166 16 0x60
		.4byte	30, -1

		mGetPalette 0x167 16 0x60
		.4byte	7, -1

		mGetPalette 0x168 16 0x60
		.4byte	7, -1

		mGetPalette 0x169 16 0x60
		.4byte	7, -1

		mGetPalette 0x16A 16 0x60
		.4byte	7, -1

		mGetPalette 0x16B 16 0x60
		.4byte	30, -1

		mGetPalette 0x16C 16 0x60
		.4byte	7, -1

		mGetPalette 0x16D 16 0x60
		.4byte	7, -1

		mGetPalette 0x16E 16 0x60
		.4byte	7, -1

		mGetPalette 0x16F 16 0x60
		.4byte	7, -1

		mGetPalette 0x170 16 0x60
		.4byte	30, -1

		mGetPalette 0x171 16 0x60
		.4byte	7, -1

		mGetPalette 0x172 16 0x60
		.4byte	7, -1

		mGetPalette 0x173 16 0x60
		.4byte	7, -1

		mGetPalette 0x174 16 0x60
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0917:
		.4byte anim_data__0917_0




.align 2, 0
	anim_data__0918_0:
		mGetPalette 0x175 16 0x40
		.4byte	30, -1

		mGetPalette 0x176 16 0x40
		.4byte	7, -1

		mGetPalette 0x177 16 0x40
		.4byte	7, -1

		mGetPalette 0x178 16 0x40
		.4byte	7, -1

		mGetPalette 0x179 16 0x40
		.4byte	7, -1

		mGetPalette 0x17A 16 0x40
		.4byte	30, -1

		mGetPalette 0x17B 16 0x40
		.4byte	7, -1

		mGetPalette 0x17C 16 0x40
		.4byte	7, -1

		mGetPalette 0x17D 16 0x40
		.4byte	7, -1

		mGetPalette 0x17E 16 0x40
		.4byte	7, -1

		mGetPalette 0x17F 16 0x40
		.4byte	30, -1

		mGetPalette 0x180 16 0x40
		.4byte	7, -1

		mGetPalette 0x181 16 0x40
		.4byte	7, -1

		mGetPalette 0x182 16 0x40
		.4byte	7, -1

		mGetPalette 0x183 16 0x40
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0918:
		.4byte anim_data__0918_0




.align 2, 0
	anim_data__0919_0:
		mGetPalette 0x184 16 0x70
		.4byte	30, -1

		mGetPalette 0x185 16 0x70
		.4byte	7, -1

		mGetPalette 0x186 16 0x70
		.4byte	7, -1

		mGetPalette 0x187 16 0x70
		.4byte	7, -1

		mGetPalette 0x188 16 0x70
		.4byte	7, -1

		mGetPalette 0x189 16 0x70
		.4byte	30, -1

		mGetPalette 0x18A 16 0x70
		.4byte	7, -1

		mGetPalette 0x18B 16 0x70
		.4byte	7, -1

		mGetPalette 0x18C 16 0x70
		.4byte	7, -1

		mGetPalette 0x18D 16 0x70
		.4byte	7, -1

		mGetPalette 0x18E 16 0x70
		.4byte	30, -1

		mGetPalette 0x18F 16 0x70
		.4byte	7, -1

		mGetPalette 0x190 16 0x70
		.4byte	7, -1

		mGetPalette 0x191 16 0x70
		.4byte	7, -1

		mGetPalette 0x192 16 0x70
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0919:
		.4byte anim_data__0919_0




.align 2, 0
	anim_data__0920_0:
		mGetPalette 0x193 16 0x80
		.4byte	30, -1

		mGetPalette 0x194 16 0x80
		.4byte	7, -1

		mGetPalette 0x195 16 0x80
		.4byte	7, -1

		mGetPalette 0x196 16 0x80
		.4byte	7, -1

		mGetPalette 0x197 16 0x80
		.4byte	7, -1

		mGetPalette 0x198 16 0x80
		.4byte	30, -1

		mGetPalette 0x199 16 0x80
		.4byte	7, -1

		mGetPalette 0x19A 16 0x80
		.4byte	7, -1

		mGetPalette 0x19B 16 0x80
		.4byte	7, -1

		mGetPalette 0x19C 16 0x80
		.4byte	7, -1

		mGetPalette 0x19D 16 0x80
		.4byte	30, -1

		mGetPalette 0x19E 16 0x80
		.4byte	7, -1

		mGetPalette 0x19F 16 0x80
		.4byte	7, -1

		mGetPalette 0x1A0 16 0x80
		.4byte	7, -1

		mGetPalette 0x1A1 16 0x80
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0920:
		.4byte anim_data__0920_0




.align 2, 0
	anim_data__0921_0:
		mGetPalette 0x1A2 16 0x90
		.4byte	30, -1

		mGetPalette 0x1A3 16 0x90
		.4byte	7, -1

		mGetPalette 0x1A4 16 0x90
		.4byte	7, -1

		mGetPalette 0x1A5 16 0x90
		.4byte	7, -1

		mGetPalette 0x1A6 16 0x90
		.4byte	7, -1

		mGetPalette 0x1A7 16 0x90
		.4byte	30, -1

		mGetPalette 0x1A8 16 0x90
		.4byte	7, -1

		mGetPalette 0x1A9 16 0x90
		.4byte	7, -1

		mGetPalette 0x1AA 16 0x90
		.4byte	7, -1

		mGetPalette 0x1AB 16 0x90
		.4byte	7, -1

		mGetPalette 0x1AC 16 0x90
		.4byte	30, -1

		mGetPalette 0x1AD 16 0x90
		.4byte	7, -1

		mGetPalette 0x1AE 16 0x90
		.4byte	7, -1

		mGetPalette 0x1AF 16 0x90
		.4byte	7, -1

		mGetPalette 0x1B0 16 0x90
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0921:
		.4byte anim_data__0921_0




.align 2, 0
	anim_data__0922_0:
		mGetPalette 0x127 16 0x20
		.4byte	10, -1

		mGetPalette 0x128 16 0x20
		.4byte	10, -1

		mGetPalette 0x129 16 0x20
		.4byte	10, -1

		mJumpBack 0xF


.align 2, 0
	anim_0922:
		.4byte anim_data__0922_0




.align 2, 0
	anim_data__0923_0:
		mGetPalette 0x1B1 16 0x10
		.4byte	30, -1

		mGetPalette 0x1B2 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B3 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B4 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B5 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B6 16 0x10
		.4byte	30, -1

		mGetPalette 0x1B7 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B8 16 0x10
		.4byte	7, -1

		mGetPalette 0x1B9 16 0x10
		.4byte	7, -1

		mGetPalette 0x1BA 16 0x10
		.4byte	7, -1

		mGetPalette 0x1BB 16 0x10
		.4byte	30, -1

		mGetPalette 0x1BC 16 0x10
		.4byte	7, -1

		mGetPalette 0x1BD 16 0x10
		.4byte	7, -1

		mGetPalette 0x1BE 16 0x10
		.4byte	7, -1

		mGetPalette 0x1BF 16 0x10
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0923:
		.4byte anim_data__0923_0




.align 2, 0
	anim_data__0924_0:
		mGetPalette 0x1C0 16 0x50
		.4byte	30, -1

		mGetPalette 0x1C1 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C2 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C3 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C4 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C5 16 0x50
		.4byte	30, -1

		mGetPalette 0x1C6 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C7 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C8 16 0x50
		.4byte	7, -1

		mGetPalette 0x1C9 16 0x50
		.4byte	7, -1

		mGetPalette 0x1CA 16 0x50
		.4byte	30, -1

		mGetPalette 0x1CB 16 0x50
		.4byte	7, -1

		mGetPalette 0x1CC 16 0x50
		.4byte	7, -1

		mGetPalette 0x1CD 16 0x50
		.4byte	7, -1

		mGetPalette 0x1CE 16 0x50
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0924:
		.4byte anim_data__0924_0




.align 2, 0
	anim_data__0925_0:
		mGetPalette 0x1CF 16 0x60
		.4byte	30, -1

		mGetPalette 0x1D0 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D1 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D2 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D3 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D4 16 0x60
		.4byte	30, -1

		mGetPalette 0x1D5 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D6 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D7 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D8 16 0x60
		.4byte	7, -1

		mGetPalette 0x1D9 16 0x60
		.4byte	30, -1

		mGetPalette 0x1DA 16 0x60
		.4byte	7, -1

		mGetPalette 0x1DB 16 0x60
		.4byte	7, -1

		mGetPalette 0x1DC 16 0x60
		.4byte	7, -1

		mGetPalette 0x1DD 16 0x60
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0925:
		.4byte anim_data__0925_0




.align 2, 0
	anim_data__0926_0:
		mGetPalette 0x1DE 16 0x40
		.4byte	30, -1

		mGetPalette 0x1DF 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E0 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E1 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E2 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E3 16 0x40
		.4byte	30, -1

		mGetPalette 0x1E4 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E5 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E6 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E7 16 0x40
		.4byte	7, -1

		mGetPalette 0x1E8 16 0x40
		.4byte	30, -1

		mGetPalette 0x1E9 16 0x40
		.4byte	7, -1

		mGetPalette 0x1EA 16 0x40
		.4byte	7, -1

		mGetPalette 0x1EB 16 0x40
		.4byte	7, -1

		mGetPalette 0x1EC 16 0x40
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0926:
		.4byte anim_data__0926_0




.align 2, 0
	anim_data__0927_0:
		mGetPalette 0x1ED 16 0x70
		.4byte	30, -1

		mGetPalette 0x1EE 16 0x70
		.4byte	7, -1

		mGetPalette 0x1EF 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F0 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F1 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F2 16 0x70
		.4byte	30, -1

		mGetPalette 0x1F3 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F4 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F5 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F6 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F7 16 0x70
		.4byte	30, -1

		mGetPalette 0x1F8 16 0x70
		.4byte	7, -1

		mGetPalette 0x1F9 16 0x70
		.4byte	7, -1

		mGetPalette 0x1FA 16 0x70
		.4byte	7, -1

		mGetPalette 0x1FB 16 0x70
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0927:
		.4byte anim_data__0927_0




.align 2, 0
	anim_data__0928_0:
		mGetPalette 0x1FC 16 0x80
		.4byte	30, -1

		mGetPalette 0x1FD 16 0x80
		.4byte	7, -1

		mGetPalette 0x1FE 16 0x80
		.4byte	7, -1

		mGetPalette 0x1FF 16 0x80
		.4byte	7, -1

		mGetPalette 0x200 16 0x80
		.4byte	7, -1

		mGetPalette 0x201 16 0x80
		.4byte	30, -1

		mGetPalette 0x202 16 0x80
		.4byte	7, -1

		mGetPalette 0x203 16 0x80
		.4byte	7, -1

		mGetPalette 0x204 16 0x80
		.4byte	7, -1

		mGetPalette 0x205 16 0x80
		.4byte	7, -1

		mGetPalette 0x206 16 0x80
		.4byte	30, -1

		mGetPalette 0x207 16 0x80
		.4byte	7, -1

		mGetPalette 0x208 16 0x80
		.4byte	7, -1

		mGetPalette 0x209 16 0x80
		.4byte	7, -1

		mGetPalette 0x20A 16 0x80
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0928:
		.4byte anim_data__0928_0




.align 2, 0
	anim_data__0929_0:
		mGetPalette 0x20B 16 0x90
		.4byte	30, -1

		mGetPalette 0x20C 16 0x90
		.4byte	7, -1

		mGetPalette 0x20D 16 0x90
		.4byte	7, -1

		mGetPalette 0x20E 16 0x90
		.4byte	7, -1

		mGetPalette 0x20F 16 0x90
		.4byte	7, -1

		mGetPalette 0x210 16 0x90
		.4byte	30, -1

		mGetPalette 0x211 16 0x90
		.4byte	7, -1

		mGetPalette 0x212 16 0x90
		.4byte	7, -1

		mGetPalette 0x213 16 0x90
		.4byte	7, -1

		mGetPalette 0x214 16 0x90
		.4byte	7, -1

		mGetPalette 0x215 16 0x90
		.4byte	30, -1

		mGetPalette 0x216 16 0x90
		.4byte	7, -1

		mGetPalette 0x217 16 0x90
		.4byte	7, -1

		mGetPalette 0x218 16 0x90
		.4byte	7, -1

		mGetPalette 0x219 16 0x90
		.4byte	7, -1

		mJumpBack 0x4B


.align 2, 0
	anim_0929:
		.4byte anim_data__0929_0




.align 2, 0
	anim_data__0930_0:
		mGetPalette 0x21A 16 0x0
		.4byte	100, -1

		mGetPalette 0x21B 16 0x0
		.4byte	15, -1

		mGetPalette 0x21C 16 0x0
		.4byte	15, -1

		mGetPalette 0x21D 16 0x0
		.4byte	100, -1

		mGetPalette 0x21C 16 0x0
		.4byte	15, -1

		mGetPalette 0x21B 16 0x0
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0930:
		.4byte anim_data__0930_0




.align 2, 0
	anim_data__0931_0:
		mGetPalette 0x21E 16 0x10
		.4byte	100, -1

		mGetPalette 0x21F 16 0x10
		.4byte	15, -1

		mGetPalette 0x220 16 0x10
		.4byte	15, -1

		mGetPalette 0x221 16 0x10
		.4byte	100, -1

		mGetPalette 0x220 16 0x10
		.4byte	15, -1

		mGetPalette 0x21F 16 0x10
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0931:
		.4byte anim_data__0931_0




.align 2, 0
	anim_data__0932_0:
		mGetPalette 0x222 16 0x20
		.4byte	100, -1

		mGetPalette 0x223 16 0x20
		.4byte	15, -1

		mGetPalette 0x224 16 0x20
		.4byte	15, -1

		mGetPalette 0x225 16 0x20
		.4byte	100, -1

		mGetPalette 0x224 16 0x20
		.4byte	15, -1

		mGetPalette 0x223 16 0x20
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0932:
		.4byte anim_data__0932_0




.align 2, 0
	anim_data__0933_0:
		mGetPalette 0x226 16 0x30
		.4byte	100, -1

		mGetPalette 0x227 16 0x30
		.4byte	15, -1

		mGetPalette 0x228 16 0x30
		.4byte	15, -1

		mGetPalette 0x229 16 0x30
		.4byte	100, -1

		mGetPalette 0x228 16 0x30
		.4byte	15, -1

		mGetPalette 0x227 16 0x30
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0933:
		.4byte anim_data__0933_0




.align 2, 0
	anim_data__0934_0:
		mGetPalette 0x22A 16 0x40
		.4byte	100, -1

		mGetPalette 0x22B 16 0x40
		.4byte	15, -1

		mGetPalette 0x22C 16 0x40
		.4byte	15, -1

		mGetPalette 0x22D 16 0x40
		.4byte	100, -1

		mGetPalette 0x22C 16 0x40
		.4byte	15, -1

		mGetPalette 0x22B 16 0x40
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0934:
		.4byte anim_data__0934_0




.align 2, 0
	anim_data__0935_0:
		mGetPalette 0x22E 16 0x0
		.4byte	100, -1

		mGetPalette 0x22F 16 0x0
		.4byte	15, -1

		mGetPalette 0x230 16 0x0
		.4byte	15, -1

		mGetPalette 0x231 16 0x0
		.4byte	100, -1

		mGetPalette 0x230 16 0x0
		.4byte	15, -1

		mGetPalette 0x22F 16 0x0
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0935:
		.4byte anim_data__0935_0




.align 2, 0
	anim_data__0936_0:
		mGetPalette 0x232 16 0x10
		.4byte	100, -1

		mGetPalette 0x233 16 0x10
		.4byte	15, -1

		mGetPalette 0x234 16 0x10
		.4byte	15, -1

		mGetPalette 0x235 16 0x10
		.4byte	100, -1

		mGetPalette 0x234 16 0x10
		.4byte	15, -1

		mGetPalette 0x233 16 0x10
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0936:
		.4byte anim_data__0936_0




.align 2, 0
	anim_data__0937_0:
		mGetPalette 0x236 16 0x20
		.4byte	100, -1

		mGetPalette 0x237 16 0x20
		.4byte	15, -1

		mGetPalette 0x238 16 0x20
		.4byte	15, -1

		mGetPalette 0x239 16 0x20
		.4byte	100, -1

		mGetPalette 0x238 16 0x20
		.4byte	15, -1

		mGetPalette 0x237 16 0x20
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0937:
		.4byte anim_data__0937_0




.align 2, 0
	anim_data__0938_0:
		mGetPalette 0x23A 16 0x30
		.4byte	100, -1

		mGetPalette 0x23B 16 0x30
		.4byte	15, -1

		mGetPalette 0x23C 16 0x30
		.4byte	15, -1

		mGetPalette 0x23D 16 0x30
		.4byte	100, -1

		mGetPalette 0x23C 16 0x30
		.4byte	15, -1

		mGetPalette 0x23B 16 0x30
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0938:
		.4byte anim_data__0938_0




.align 2, 0
	anim_data__0939_0:
		mGetPalette 0x23E 16 0x40
		.4byte	100, -1

		mGetPalette 0x23F 16 0x40
		.4byte	15, -1

		mGetPalette 0x240 16 0x40
		.4byte	15, -1

		mGetPalette 0x241 16 0x40
		.4byte	100, -1

		mGetPalette 0x240 16 0x40
		.4byte	15, -1

		mGetPalette 0x23F 16 0x40
		.4byte	15, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0939:
		.4byte anim_data__0939_0




.align 2, 0
	anim_data__0940_0:
		mGetPalette 0x242 16 0x0
		.4byte	4, -1

		mGetPalette 0x243 16 0x0
		.4byte	4, -1

		mGetPalette 0x242 16 0x0
		.4byte	4, -1

		mGetPalette 0x243 16 0x0
		.4byte	4, -1

		mGetPalette 0x242 16 0x0
		.4byte	4, -1

		mGetPalette 0x243 16 0x0
		.4byte	4, -1

		mGetPalette 0x242 16 0x0
		.4byte	4, -1

		mGetPalette 0x243 16 0x0
		.4byte	4, -1

		mGetPalette 0x244 16 0x0
		.4byte	4, -1

		mGetPalette 0x245 16 0x0
		.4byte	4, -1

		mGetPalette 0x244 16 0x0
		.4byte	4, -1

		mGetPalette 0x245 16 0x0
		.4byte	4, -1

		mGetPalette 0x244 16 0x0
		.4byte	4, -1

		mGetPalette 0x245 16 0x0
		.4byte	4, -1

		mGetPalette 0x244 16 0x0
		.4byte	4, -1

		mGetPalette 0x245 16 0x0
		.4byte	4, -1

		mGetPalette 0x246 16 0x0
		.4byte	4, -1

		mGetPalette 0x247 16 0x0
		.4byte	4, -1

		mGetPalette 0x246 16 0x0
		.4byte	4, -1

		mGetPalette 0x247 16 0x0
		.4byte	4, -1

		mGetPalette 0x246 16 0x0
		.4byte	4, -1

		mGetPalette 0x247 16 0x0
		.4byte	4, -1

		mGetPalette 0x246 16 0x0
		.4byte	4, -1

		mGetPalette 0x247 16 0x0
		.4byte	4, -1

		mJumpBack 0x78

	anim_data__0940_1:
		mGetPalette 0x248 16 0x10
		.4byte	4, -1

		mGetPalette 0x249 16 0x10
		.4byte	4, -1

		mGetPalette 0x248 16 0x10
		.4byte	4, -1

		mGetPalette 0x249 16 0x10
		.4byte	4, -1

		mGetPalette 0x248 16 0x10
		.4byte	4, -1

		mGetPalette 0x249 16 0x10
		.4byte	4, -1

		mGetPalette 0x248 16 0x10
		.4byte	4, -1

		mGetPalette 0x249 16 0x10
		.4byte	4, -1

		mGetPalette 0x24A 16 0x10
		.4byte	4, -1

		mGetPalette 0x24B 16 0x10
		.4byte	4, -1

		mGetPalette 0x24A 16 0x10
		.4byte	4, -1

		mGetPalette 0x24B 16 0x10
		.4byte	4, -1

		mGetPalette 0x24A 16 0x10
		.4byte	4, -1

		mGetPalette 0x24B 16 0x10
		.4byte	4, -1

		mGetPalette 0x24A 16 0x10
		.4byte	4, -1

		mGetPalette 0x24B 16 0x10
		.4byte	4, -1

		mGetPalette 0x24C 16 0x10
		.4byte	4, -1

		mGetPalette 0x24D 16 0x10
		.4byte	4, -1

		mGetPalette 0x24C 16 0x10
		.4byte	4, -1

		mGetPalette 0x24D 16 0x10
		.4byte	4, -1

		mGetPalette 0x24C 16 0x10
		.4byte	4, -1

		mGetPalette 0x24D 16 0x10
		.4byte	4, -1

		mGetPalette 0x24C 16 0x10
		.4byte	4, -1

		mGetPalette 0x24D 16 0x10
		.4byte	4, -1

		mJumpBack 0x78

	anim_data__0940_2:
		mGetPalette 0x24E 16 0x20
		.4byte	6, -1

		mGetPalette 0x24F 16 0x20
		.4byte	6, -1

		mGetPalette 0x250 16 0x20
		.4byte	6, -1

		mGetPalette 0x251 16 0x20
		.4byte	6, -1

		mGetPalette 0x252 16 0x20
		.4byte	6, -1

		mGetPalette 0x253 16 0x20
		.4byte	6, -1

		mJumpBack 0x1E

	anim_data__0940_3:
		mGetPalette 0x254 16 0x30
		.4byte	6, -1

		mGetPalette 0x255 16 0x30
		.4byte	6, -1

		mGetPalette 0x256 16 0x30
		.4byte	6, -1

		mGetPalette 0x257 16 0x30
		.4byte	6, -1

		mGetPalette 0x258 16 0x30
		.4byte	6, -1

		mGetPalette 0x259 16 0x30
		.4byte	6, -1

		mJumpBack 0x1E

	anim_data__0940_4:
		mGetPalette 0x25A 16 0x40
		.4byte	4, -1

		mGetPalette 0x25B 16 0x40
		.4byte	4, -1

		mGetPalette 0x25A 16 0x40
		.4byte	4, -1

		mGetPalette 0x25B 16 0x40
		.4byte	4, -1

		mGetPalette 0x25A 16 0x40
		.4byte	4, -1

		mGetPalette 0x25B 16 0x40
		.4byte	4, -1

		mGetPalette 0x25A 16 0x40
		.4byte	4, -1

		mGetPalette 0x25B 16 0x40
		.4byte	4, -1

		mGetPalette 0x25C 16 0x40
		.4byte	4, -1

		mGetPalette 0x25D 16 0x40
		.4byte	4, -1

		mGetPalette 0x25C 16 0x40
		.4byte	4, -1

		mGetPalette 0x25D 16 0x40
		.4byte	4, -1

		mGetPalette 0x25C 16 0x40
		.4byte	4, -1

		mGetPalette 0x25D 16 0x40
		.4byte	4, -1

		mGetPalette 0x25C 16 0x40
		.4byte	4, -1

		mGetPalette 0x25D 16 0x40
		.4byte	4, -1

		mGetPalette 0x25E 16 0x40
		.4byte	4, -1

		mGetPalette 0x25F 16 0x40
		.4byte	4, -1

		mGetPalette 0x25E 16 0x40
		.4byte	4, -1

		mGetPalette 0x25F 16 0x40
		.4byte	4, -1

		mGetPalette 0x25E 16 0x40
		.4byte	4, -1

		mGetPalette 0x25F 16 0x40
		.4byte	4, -1

		mGetPalette 0x25E 16 0x40
		.4byte	4, -1

		mGetPalette 0x25F 16 0x40
		.4byte	4, -1

		mJumpBack 0x78

	anim_data__0940_5:
		mGetPalette 0x260 16 0x50
		.4byte	4, -1

		mGetPalette 0x261 16 0x50
		.4byte	4, -1

		mGetPalette 0x260 16 0x50
		.4byte	4, -1

		mGetPalette 0x261 16 0x50
		.4byte	4, -1

		mGetPalette 0x260 16 0x50
		.4byte	4, -1

		mGetPalette 0x261 16 0x50
		.4byte	4, -1

		mGetPalette 0x262 16 0x50
		.4byte	4, -1

		mGetPalette 0x263 16 0x50
		.4byte	4, -1

		mGetPalette 0x262 16 0x50
		.4byte	4, -1

		mGetPalette 0x263 16 0x50
		.4byte	4, -1

		mGetPalette 0x262 16 0x50
		.4byte	4, -1

		mGetPalette 0x263 16 0x50
		.4byte	4, -1

		mJumpBack 0x3C

	anim_data__0940_6:
		mGetPalette 0x264 16 0x60
		.4byte	3, -1

		mGetPalette 0x265 16 0x60
		.4byte	3, -1

		mGetPalette 0x266 16 0x60
		.4byte	3, -1

		mGetPalette 0x267 16 0x60
		.4byte	3, -1

		mGetPalette 0x268 16 0x60
		.4byte	3, -1

		mGetPalette 0x269 16 0x60
		.4byte	3, -1

		mJumpBack 0x1E

	anim_data__0940_7:
		mGetPalette 0x26A 16 0x70
		.4byte	3, -1

		mGetPalette 0x26B 16 0x70
		.4byte	3, -1

		mGetPalette 0x26C 16 0x70
		.4byte	3, -1

		mGetPalette 0x26D 16 0x70
		.4byte	3, -1

		mGetPalette 0x26E 16 0x70
		.4byte	3, -1

		mGetPalette 0x26F 16 0x70
		.4byte	3, -1

		mJumpBack 0x1E

	anim_data__0940_8:
		mGetPalette 0x270 16 0x80
		.4byte	5, -1

		mGetPalette 0x271 16 0x80
		.4byte	5, -1

		mGetPalette 0x272 16 0x80
		.4byte	5, -1

		mGetPalette 0x273 16 0x80
		.4byte	5, -1

		mGetPalette 0x272 16 0x80
		.4byte	5, -1

		mGetPalette 0x271 16 0x80
		.4byte	5, -1

		mJumpBack 0x1E

	anim_data__0940_9:
		mGetPalette 0x274 16 0x90
		.4byte	1, -1

		mGetPalette 0x274 16 0x90
		.4byte	1, -1

		mGetPalette 0x274 16 0x90
		.4byte	1, -1

		mGetPalette 0x275 16 0x90
		.4byte	1, -1

		mGetPalette 0x276 16 0x90
		.4byte	1, -1

		mGetPalette 0x276 16 0x90
		.4byte	1, -1

		mGetPalette 0x276 16 0x90
		.4byte	1, -1

		mGetPalette 0x275 16 0x90
		.4byte	1, -1

		mJumpBack 0x28

	anim_data__0940_10:
		mGetPalette 0x277 16 0xC0
		.4byte	2, -1

		mGetPalette 0x278 16 0xC0
		.4byte	2, -1

		mJumpBack 0xA

	anim_data__0940_11:
		mGetPalette 0x279 16 0xE0
		.4byte	5, -1

		mGetPalette 0x27A 16 0xE0
		.4byte	5, -1

		mGetPalette 0x27B 16 0xE0
		.4byte	5, -1

		mGetPalette 0x27C 16 0xE0
		.4byte	5, -1

		mJumpBack 0x14


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
		mGetPalette 0x27D 16 0xF0
		.4byte	40, -1

		mGetPalette 0x27E 16 0xF0
		.4byte	7, -1

		mGetPalette 0x27F 16 0xF0
		.4byte	7, -1

		mGetPalette 0x280 16 0xF0
		.4byte	7, -1

		mGetPalette 0x281 16 0xF0
		.4byte	40, -1

		mGetPalette 0x280 16 0xF0
		.4byte	7, -1

		mGetPalette 0x27F 16 0xF0
		.4byte	7, -1

		mGetPalette 0x27E 16 0xF0
		.4byte	7, -1

		mJumpBack 0x28


.align 2, 0
	anim_0941:
		.4byte anim_data__0941_0




.align 2, 0
	anim_data__0942_0:
		mGetPalette 0x282 16 0x90
		.4byte	40, -1

		mGetPalette 0x283 16 0x90
		.4byte	7, -1

		mGetPalette 0x284 16 0x90
		.4byte	7, -1

		mGetPalette 0x285 16 0x90
		.4byte	7, -1

		mGetPalette 0x286 16 0x90
		.4byte	7, -1

		mGetPalette 0x287 16 0x90
		.4byte	7, -1

		mGetPalette 0x288 16 0x90
		.4byte	40, -1

		mGetPalette 0x287 16 0x90
		.4byte	7, -1

		mGetPalette 0x286 16 0x90
		.4byte	7, -1

		mGetPalette 0x285 16 0x90
		.4byte	7, -1

		mGetPalette 0x284 16 0x90
		.4byte	7, -1

		mGetPalette 0x283 16 0x90
		.4byte	7, -1

		mJumpBack 0x3C


.align 2, 0
	anim_0942:
		.4byte anim_data__0942_0




.align 2, 0
	anim_data__0943_0:
		mGetPalette 0x289 16 0xE0
		.4byte	40, -1

		mGetPalette 0x28A 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28B 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28C 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28D 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28E 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28F 16 0xE0
		.4byte	40, -1

		mGetPalette 0x28E 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28D 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28C 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28B 16 0xE0
		.4byte	7, -1

		mGetPalette 0x28A 16 0xE0
		.4byte	7, -1

		mJumpBack 0x3C


.align 2, 0
	anim_0943:
		.4byte anim_data__0943_0




.align 2, 0
	anim_data__0944_0:
		mGetPalette 0x290 16 0x70
		.4byte	7, -1

		mGetPalette 0x291 16 0x70
		.4byte	7, -1

		mGetPalette 0x292 16 0x70
		.4byte	7, -1

		mJumpBack 0xF


.align 2, 0
	anim_0944:
		.4byte anim_data__0944_0




.align 2, 0
	anim_data__0945_0:
		mGetPalette 0x293 16 0x20
		.4byte	7, -1

		mGetPalette 0x294 16 0x20
		.4byte	7, -1

		mGetPalette 0x295 16 0x20
		.4byte	7, -1

		mGetPalette 0x296 16 0x20
		.4byte	7, -1

		mGetPalette 0x297 16 0x20
		.4byte	7, -1

		mGetPalette 0x298 16 0x20
		.4byte	7, -1

		mGetPalette 0x299 16 0x20
		.4byte	7, -1

		mGetPalette 0x29A 16 0x20
		.4byte	7, -1

		mGetPalette 0x29B 16 0x20
		.4byte	7, -1

		mGetPalette 0x29C 16 0x20
		.4byte	7, -1

		mJumpBack 0x32


.align 2, 0
	anim_0945:
		.4byte anim_data__0945_0




.align 2, 0
	anim_data__0946_0:
		mGetPalette 0x29D 16 0x80
		.4byte	10, -1

		mGetPalette 0x29E 16 0x80
		.4byte	10, -1

		mGetPalette 0x29F 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A0 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A1 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A2 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A3 16 0x80
		.4byte	10, -1

		mGetPalette 0x2A4 16 0x80
		.4byte	10, -1

		mJumpBack 0x28


.align 2, 0
	anim_0946:
		.4byte anim_data__0946_0




.align 2, 0
	anim_data__0947_0:
		mGetPalette 0xFC 16 0xB0
		.4byte	2, -1

		mGetPalette 0xFD 16 0xB0
		.4byte	2, -1

		mJumpBack 0xA


.align 2, 0
	anim_0947:
		.4byte anim_data__0947_0




.align 2, 0
	anim_data__0948_0:
		mGetPalette 0x2A5 16 0xC0
		.4byte	9, -1

		mGetPalette 0x2A6 16 0xC0
		.4byte	9, -1

		mGetPalette 0x2A7 16 0xC0
		.4byte	9, -1

		mGetPalette 0x2A8 16 0xC0
		.4byte	9, -1

		mGetPalette 0x2A9 16 0xC0
		.4byte	9, -1

		mGetPalette 0x2AA 16 0xC0
		.4byte	9, -1

		mJumpBack 0x1E


.align 2, 0
	anim_0948:
		.4byte anim_data__0948_0




.align 2, 0
	anim_data__0949_0:
		mGetPalette 0x2AB 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AC 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AD 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AE 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AF 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AE 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AD 16 0x30
		.4byte	9, -1

		mGetPalette 0x2AC 16 0x30
		.4byte	9, -1

		mJumpBack 0x28


.align 2, 0
	anim_0949:
		.4byte anim_data__0949_0




.align 2, 0
	anim_data__0950_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24455 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0950_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24467 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0950_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24479 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0950_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2448B 51
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0950_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x244BE 12
		mAnimCmd6 0x0 0x68386737
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0950_5:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x244CA 12
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0950_6:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x244D6 12
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0950_7:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x244E2 66
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0950_8:
		mGetPalette 0xA1 16 0xF0
		mGetTiles 0x24524 1
		.4byte	6, 8

		mGetTiles 0x24525 2
		.4byte	6, 9

		mGetTiles 0x24527 2
		.4byte	6, 10

		mGetTiles 0x24529 2
		.4byte	6, 11

		mJumpBack 0x17

	anim_data__0950_9:
		mGetPalette 0xA1 16 0xF0
		mGetTiles 0x2452B 1
		.4byte	6, 12

		mGetTiles 0x2452C 2
		.4byte	6, 13

		mGetTiles 0x2452E 2
		.4byte	6, 14

		mGetTiles 0x24530 2
		.4byte	6, 15

		mJumpBack 0x17

	anim_data__0950_10:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x24532 14
		.4byte	1, 16

		mAnimCmd4 


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
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24540 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0951_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24550 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0951_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24560 54
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0951_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24596 39
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0951:
		.4byte anim_data__0951_0
		.4byte anim_data__0951_1
		.4byte anim_data__0951_2
		.4byte anim_data__0951_3




.align 2, 0
	anim_data__0952_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x245BD 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0952_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x245CD 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0952_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x245DD 42
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0952_3:
		mGetPalette 0x2B4 16 0x0
		mGetTiles 0x24607 18
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0952:
		.4byte anim_data__0952_0
		.4byte anim_data__0952_1
		.4byte anim_data__0952_2
		.4byte anim_data__0952_3




.align 2, 0
	anim_data__0953_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24619 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0953_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24641 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0953_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24669 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0953_3:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24691 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0953_4:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x246B9 40
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0953_5:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x246E1 40
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0953_6:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24709 45
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0953_7:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24736 16
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0953_8:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24746 16
		.4byte	1, 8

		mAnimCmd4 

	anim_data__0953_9:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24756 16
		.4byte	1, 9

		mAnimCmd4 

	anim_data__0953_10:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24766 16
		.4byte	1, 10

		mAnimCmd4 

	anim_data__0953_11:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24776 16
		.4byte	1, 11

		mAnimCmd4 

	anim_data__0953_12:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24786 16
		.4byte	1, 12

		mAnimCmd4 

	anim_data__0953_13:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x24796 26
		.4byte	1, 13

		mAnimCmd4 


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
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x247B0 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0954_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x247C2 48
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0954_2:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x247F2 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0954_3:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24822 3
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0954_4:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24825 3
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0954_5:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24828 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0954_6:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24830 2
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0954_7:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24832 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0954_8:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24836 10
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24840 4
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0955_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24844 4
		.4byte	1, 1

		mJumpBack 0x8

	anim_data__0955_2:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24848 4
		.4byte	1, 2

		mJumpBack 0x8

	anim_data__0955_3:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2484C 4
		.4byte	1, 3

		mJumpBack 0x8

	anim_data__0955_4:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24850 4
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__0955_5:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24854 4
		.4byte	1, 5

		mJumpBack 0x8

	anim_data__0955_6:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24858 4
		.4byte	1, 6

		mJumpBack 0x8

	anim_data__0955_7:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2485C 4
		.4byte	1, 7

		mJumpBack 0x8

	anim_data__0955_8:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24860 4
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__0955_9:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24864 4
		.4byte	1, 9

		mJumpBack 0x8

	anim_data__0955_10:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24868 1
		.4byte	1, 10

		mJumpBack 0x8

	anim_data__0955_11:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24869 4
		.4byte	1, 11

		mJumpBack 0x8

	anim_data__0955_12:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2486D 4
		.4byte	1, 12

		mJumpBack 0x8

	anim_data__0955_13:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24871 4
		.4byte	1, 13

		mJumpBack 0x8

	anim_data__0955_14:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24875 4
		.4byte	1, 14

		mJumpBack 0x8

	anim_data__0955_15:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24879 4
		.4byte	1, 15

		mJumpBack 0x8

	anim_data__0955_16:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2487D 4
		.4byte	1, 16

		mJumpBack 0x8

	anim_data__0955_17:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_18:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24881 4
		.4byte	1, 17

		mJumpBack 0x8

	anim_data__0955_19:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_20:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24885 4
		.4byte	1, 18

		mJumpBack 0x8

	anim_data__0955_21:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24889 4
		.4byte	1, 19

		mJumpBack 0x8

	anim_data__0955_22:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2488D 4
		.4byte	1, 20

		mJumpBack 0x8

	anim_data__0955_23:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24891 4
		.4byte	1, 21

		mJumpBack 0x8

	anim_data__0955_24:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24895 4
		.4byte	1, 22

		mJumpBack 0x8

	anim_data__0955_25:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24899 4
		.4byte	1, 23

		mJumpBack 0x8

	anim_data__0955_26:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2489D 4
		.4byte	1, 24

		mJumpBack 0x8

	anim_data__0955_27:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248A1 4
		.4byte	1, 25

		mJumpBack 0x8

	anim_data__0955_28:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248A5 4
		.4byte	1, 26

		mJumpBack 0x8

	anim_data__0955_29:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248A9 4
		.4byte	1, 27

		mJumpBack 0x8

	anim_data__0955_30:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248AD 4
		.4byte	1, 28

		mJumpBack 0x8

	anim_data__0955_31:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248B1 4
		.4byte	1, 29

		mJumpBack 0x8

	anim_data__0955_32:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248B5 4
		.4byte	1, 30

		mJumpBack 0x8

	anim_data__0955_33:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248B9 4
		.4byte	1, 31

		mJumpBack 0x8

	anim_data__0955_34:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248BD 4
		.4byte	1, 32

		mJumpBack 0x8

	anim_data__0955_35:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248C1 4
		.4byte	1, 33

		mJumpBack 0x8

	anim_data__0955_36:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248C5 4
		.4byte	1, 34

		mJumpBack 0x8

	anim_data__0955_37:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248C9 4
		.4byte	1, 35

		mJumpBack 0x8

	anim_data__0955_38:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248CD 4
		.4byte	1, 36

		mJumpBack 0x8

	anim_data__0955_39:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_40:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248D1 4
		.4byte	1, 37

		mJumpBack 0x8

	anim_data__0955_41:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_42:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248D5 4
		.4byte	1, 38

		mJumpBack 0x8

	anim_data__0955_43:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248D9 2
		.4byte	1, 39

		mJumpBack 0x8

	anim_data__0955_44:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248DB 4
		.4byte	1, 40

		mJumpBack 0x8

	anim_data__0955_45:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248DF 4
		.4byte	1, 41

		mJumpBack 0x8

	anim_data__0955_46:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248E3 4
		.4byte	1, 42

		mJumpBack 0x8

	anim_data__0955_47:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248E7 4
		.4byte	1, 43

		mJumpBack 0x8

	anim_data__0955_48:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248EB 4
		.4byte	1, 44

		mJumpBack 0x8

	anim_data__0955_49:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248EF 4
		.4byte	1, 45

		mJumpBack 0x8

	anim_data__0955_50:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248F3 4
		.4byte	1, 46

		mJumpBack 0x8

	anim_data__0955_51:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248F7 4
		.4byte	1, 47

		mJumpBack 0x8

	anim_data__0955_52:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248FB 4
		.4byte	1, 48

		mJumpBack 0x8

	anim_data__0955_53:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x248FF 4
		.4byte	1, 49

		mJumpBack 0x8

	anim_data__0955_54:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24903 4
		.4byte	1, 50

		mJumpBack 0x8

	anim_data__0955_55:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24907 4
		.4byte	1, 51

		mJumpBack 0x8

	anim_data__0955_56:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2490B 4
		.4byte	1, 52

		mJumpBack 0x8

	anim_data__0955_57:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2490F 4
		.4byte	1, 53

		mJumpBack 0x8

	anim_data__0955_58:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24913 4
		.4byte	1, 54

		mJumpBack 0x8

	anim_data__0955_59:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24917 4
		.4byte	1, 55

		mJumpBack 0x8

	anim_data__0955_60:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2491B 4
		.4byte	1, 56

		mJumpBack 0x8

	anim_data__0955_61:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_62:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2491F 4
		.4byte	1, 57

		mJumpBack 0x8

	anim_data__0955_63:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_64:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24923 4
		.4byte	1, 58

		mJumpBack 0x8

	anim_data__0955_65:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24927 4
		.4byte	1, 59

		mJumpBack 0x8

	anim_data__0955_66:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2492B 4
		.4byte	1, 60

		mJumpBack 0x8

	anim_data__0955_67:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2492F 4
		.4byte	1, 61

		mJumpBack 0x8

	anim_data__0955_68:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24933 4
		.4byte	1, 62

		mJumpBack 0x8

	anim_data__0955_69:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24937 4
		.4byte	1, 63

		mJumpBack 0x8

	anim_data__0955_70:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2493B 4
		.4byte	1, 64

		mJumpBack 0x8

	anim_data__0955_71:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2493F 4
		.4byte	1, 65

		mJumpBack 0x8

	anim_data__0955_72:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24943 4
		.4byte	1, 66

		mJumpBack 0x8

	anim_data__0955_73:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24947 4
		.4byte	1, 67

		mJumpBack 0x8

	anim_data__0955_74:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2494B 4
		.4byte	1, 68

		mJumpBack 0x8

	anim_data__0955_75:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_76:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_77:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_78:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2494F 4
		.4byte	1, 69

		mJumpBack 0x8

	anim_data__0955_79:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24953 2
		.4byte	1, 70

		mJumpBack 0x8

	anim_data__0955_80:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24955 4
		.4byte	1, 71

		mJumpBack 0x8

	anim_data__0955_81:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24959 4
		.4byte	1, 72

		mJumpBack 0x8

	anim_data__0955_82:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2495D 4
		.4byte	1, 73

		mJumpBack 0x8

	anim_data__0955_83:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24961 4
		.4byte	1, 74

		mJumpBack 0x8

	anim_data__0955_84:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24965 2
		.4byte	1, 75

		mJumpBack 0x8

	anim_data__0955_85:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24967 4
		.4byte	1, 76

		mJumpBack 0x8

	anim_data__0955_86:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2496B 4
		.4byte	1, 77

		mJumpBack 0x8

	anim_data__0955_87:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2496F 4
		.4byte	1, 78

		mJumpBack 0x8

	anim_data__0955_88:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24973 4
		.4byte	1, 79

		mJumpBack 0x8

	anim_data__0955_89:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24977 2
		.4byte	1, 80

		mJumpBack 0x8

	anim_data__0955_90:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24979 4
		.4byte	1, 81

		mJumpBack 0x8

	anim_data__0955_91:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2497D 2
		.4byte	1, 82

		mJumpBack 0x8

	anim_data__0955_92:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2497F 4
		.4byte	1, 83

		mJumpBack 0x8

	anim_data__0955_93:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24983 4
		.4byte	1, 84

		mJumpBack 0x8

	anim_data__0955_94:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24987 4
		.4byte	1, 85

		mJumpBack 0x8

	anim_data__0955_95:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2498B 4
		.4byte	1, 86

		mJumpBack 0x8

	anim_data__0955_96:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2498F 4
		.4byte	1, 87

		mJumpBack 0x8

	anim_data__0955_97:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24993 4
		.4byte	1, 88

		mJumpBack 0x8

	anim_data__0955_98:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24997 4
		.4byte	1, 89

		mJumpBack 0x8

	anim_data__0955_99:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2499B 4
		.4byte	1, 90

		mJumpBack 0x8

	anim_data__0955_100:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2499F 4
		.4byte	1, 91

		mJumpBack 0x8

	anim_data__0955_101:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249A3 4
		.4byte	1, 92

		mJumpBack 0x8

	anim_data__0955_102:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249A7 4
		.4byte	1, 93

		mJumpBack 0x8

	anim_data__0955_103:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249AB 4
		.4byte	1, 94

		mJumpBack 0x8

	anim_data__0955_104:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249AF 4
		.4byte	1, 95

		mJumpBack 0x8

	anim_data__0955_105:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249B3 4
		.4byte	1, 96

		mJumpBack 0x8

	anim_data__0955_106:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249B7 4
		.4byte	1, 97

		mJumpBack 0x8

	anim_data__0955_107:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249BB 4
		.4byte	1, 98

		mJumpBack 0x8

	anim_data__0955_108:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249BF 4
		.4byte	1, 99

		mJumpBack 0x8

	anim_data__0955_109:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_110:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249C3 4
		.4byte	1, 100

		mJumpBack 0x8

	anim_data__0955_111:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249C7 4
		.4byte	1, 101

		mJumpBack 0x8

	anim_data__0955_112:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249CB 4
		.4byte	1, 102

		mJumpBack 0x8

	anim_data__0955_113:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249CF 4
		.4byte	1, 103

		mJumpBack 0x8

	anim_data__0955_114:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249D3 4
		.4byte	1, 104

		mJumpBack 0x8

	anim_data__0955_115:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249D7 4
		.4byte	1, 105

		mJumpBack 0x8

	anim_data__0955_116:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249DB 4
		.4byte	1, 106

		mJumpBack 0x8

	anim_data__0955_117:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249DF 4
		.4byte	1, 107

		mJumpBack 0x8

	anim_data__0955_118:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249E3 4
		.4byte	1, 108

		mJumpBack 0x8

	anim_data__0955_119:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249E7 4
		.4byte	1, 109

		mJumpBack 0x8

	anim_data__0955_120:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249EB 4
		.4byte	1, 110

		mJumpBack 0x8

	anim_data__0955_121:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249EF 4
		.4byte	1, 111

		mJumpBack 0x8

	anim_data__0955_122:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249F3 4
		.4byte	1, 112

		mJumpBack 0x8

	anim_data__0955_123:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249F7 4
		.4byte	1, 113

		mJumpBack 0x8

	anim_data__0955_124:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249FB 4
		.4byte	1, 114

		mJumpBack 0x8

	anim_data__0955_125:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x249FF 4
		.4byte	1, 115

		mJumpBack 0x8

	anim_data__0955_126:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A03 4
		.4byte	1, 116

		mJumpBack 0x8

	anim_data__0955_127:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A07 4
		.4byte	1, 117

		mJumpBack 0x8

	anim_data__0955_128:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A0B 4
		.4byte	1, 118

		mJumpBack 0x8

	anim_data__0955_129:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A0F 4
		.4byte	1, 119

		mJumpBack 0x8

	anim_data__0955_130:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A13 4
		.4byte	1, 120

		mJumpBack 0x8

	anim_data__0955_131:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A17 4
		.4byte	1, 121

		mJumpBack 0x8

	anim_data__0955_132:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A1B 4
		.4byte	1, 122

		mJumpBack 0x8

	anim_data__0955_133:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A1F 4
		.4byte	1, 123

		mJumpBack 0x8

	anim_data__0955_134:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A23 4
		.4byte	1, 124

		mJumpBack 0x8

	anim_data__0955_135:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A27 4
		.4byte	1, 125

		mJumpBack 0x8

	anim_data__0955_136:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A2B 4
		.4byte	1, 126

		mJumpBack 0x8

	anim_data__0955_137:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A2F 4
		.4byte	1, 127

		mJumpBack 0x8

	anim_data__0955_138:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A33 4
		.4byte	1, 128

		mJumpBack 0x8

	anim_data__0955_139:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A37 4
		.4byte	1, 129

		mJumpBack 0x8

	anim_data__0955_140:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A3B 2
		.4byte	1, 130

		mJumpBack 0x8

	anim_data__0955_141:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A3D 2
		.4byte	1, 131

		mJumpBack 0x8

	anim_data__0955_142:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_143:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A3F 2
		.4byte	1, 132

		mJumpBack 0x8

	anim_data__0955_144:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A41 4
		.4byte	1, 133

		mJumpBack 0x8

	anim_data__0955_145:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A45 4
		.4byte	1, 134

		mJumpBack 0x8

	anim_data__0955_146:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A49 4
		.4byte	1, 135

		mJumpBack 0x8

	anim_data__0955_147:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A4D 4
		.4byte	1, 136

		mJumpBack 0x8

	anim_data__0955_148:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A51 4
		.4byte	1, 137

		mJumpBack 0x8

	anim_data__0955_149:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A55 4
		.4byte	1, 138

		mJumpBack 0x8

	anim_data__0955_150:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A59 4
		.4byte	1, 139

		mJumpBack 0x8

	anim_data__0955_151:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A5D 4
		.4byte	1, 140

		mJumpBack 0x8

	anim_data__0955_152:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A61 4
		.4byte	1, 141

		mJumpBack 0x8

	anim_data__0955_153:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A65 4
		.4byte	1, 142

		mJumpBack 0x8

	anim_data__0955_154:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A69 4
		.4byte	1, 143

		mJumpBack 0x8

	anim_data__0955_155:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A6D 4
		.4byte	1, 144

		mJumpBack 0x8

	anim_data__0955_156:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A71 4
		.4byte	1, 145

		mJumpBack 0x8

	anim_data__0955_157:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A75 4
		.4byte	1, 146

		mJumpBack 0x8

	anim_data__0955_158:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A79 4
		.4byte	1, 147

		mJumpBack 0x8

	anim_data__0955_159:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A7D 4
		.4byte	1, 148

		mJumpBack 0x8

	anim_data__0955_160:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A81 4
		.4byte	1, 149

		mJumpBack 0x8

	anim_data__0955_161:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A85 4
		.4byte	1, 150

		mJumpBack 0x8

	anim_data__0955_162:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A89 4
		.4byte	1, 151

		mJumpBack 0x8

	anim_data__0955_163:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A8D 4
		.4byte	1, 152

		mJumpBack 0x8

	anim_data__0955_164:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A91 4
		.4byte	1, 153

		mJumpBack 0x8

	anim_data__0955_165:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A95 4
		.4byte	1, 154

		mJumpBack 0x8

	anim_data__0955_166:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A99 4
		.4byte	1, 155

		mJumpBack 0x8

	anim_data__0955_167:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24A9D 4
		.4byte	1, 156

		mJumpBack 0x8

	anim_data__0955_168:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AA1 4
		.4byte	1, 157

		mJumpBack 0x8

	anim_data__0955_169:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AA5 4
		.4byte	1, 158

		mJumpBack 0x8

	anim_data__0955_170:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AA9 4
		.4byte	1, 159

		mJumpBack 0x8

	anim_data__0955_171:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AAD 4
		.4byte	1, 160

		mJumpBack 0x8

	anim_data__0955_172:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AB1 4
		.4byte	1, 161

		mJumpBack 0x8

	anim_data__0955_173:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AB5 4
		.4byte	1, 162

		mJumpBack 0x8

	anim_data__0955_174:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_175:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_176:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AB9 4
		.4byte	1, 163

		mJumpBack 0x8

	anim_data__0955_177:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24ABD 4
		.4byte	1, 164

		mJumpBack 0x8

	anim_data__0955_178:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AC1 4
		.4byte	1, 165

		mJumpBack 0x8

	anim_data__0955_179:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AC5 4
		.4byte	1, 166

		mJumpBack 0x8

	anim_data__0955_180:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AC9 4
		.4byte	1, 167

		mJumpBack 0x8

	anim_data__0955_181:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24ACD 4
		.4byte	1, 168

		mJumpBack 0x8

	anim_data__0955_182:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AD1 4
		.4byte	1, 169

		mJumpBack 0x8

	anim_data__0955_183:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AD5 4
		.4byte	1, 170

		mJumpBack 0x8

	anim_data__0955_184:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AD9 4
		.4byte	1, 171

		mJumpBack 0x8

	anim_data__0955_185:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24ADD 4
		.4byte	1, 172

		mJumpBack 0x8

	anim_data__0955_186:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AE1 4
		.4byte	1, 173

		mJumpBack 0x8

	anim_data__0955_187:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AE5 4
		.4byte	1, 174

		mJumpBack 0x8

	anim_data__0955_188:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AE9 4
		.4byte	1, 175

		mJumpBack 0x8

	anim_data__0955_189:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AED 4
		.4byte	1, 176

		mJumpBack 0x8

	anim_data__0955_190:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AF1 4
		.4byte	1, 177

		mJumpBack 0x8

	anim_data__0955_191:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AF5 4
		.4byte	1, 178

		mJumpBack 0x8

	anim_data__0955_192:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AF9 4
		.4byte	1, 179

		mJumpBack 0x8

	anim_data__0955_193:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24AFD 4
		.4byte	1, 180

		mJumpBack 0x8

	anim_data__0955_194:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B01 4
		.4byte	1, 181

		mJumpBack 0x8

	anim_data__0955_195:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B05 4
		.4byte	1, 182

		mJumpBack 0x8

	anim_data__0955_196:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B09 4
		.4byte	1, 183

		mJumpBack 0x8

	anim_data__0955_197:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B0D 4
		.4byte	1, 184

		mJumpBack 0x8

	anim_data__0955_198:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B11 4
		.4byte	1, 185

		mJumpBack 0x8

	anim_data__0955_199:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B15 4
		.4byte	1, 186

		mJumpBack 0x8

	anim_data__0955_200:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B19 4
		.4byte	1, 187

		mJumpBack 0x8

	anim_data__0955_201:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B1D 4
		.4byte	1, 188

		mJumpBack 0x8

	anim_data__0955_202:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B21 4
		.4byte	1, 189

		mJumpBack 0x8

	anim_data__0955_203:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B25 4
		.4byte	1, 190

		mJumpBack 0x8

	anim_data__0955_204:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B29 4
		.4byte	1, 191

		mJumpBack 0x8

	anim_data__0955_205:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B2D 4
		.4byte	1, 192

		mJumpBack 0x8

	anim_data__0955_206:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B31 4
		.4byte	1, 193

		mJumpBack 0x8

	anim_data__0955_207:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B35 4
		.4byte	1, 194

		mJumpBack 0x8

	anim_data__0955_208:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_209:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B39 4
		.4byte	1, 195

		mJumpBack 0x8

	anim_data__0955_210:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B3D 4
		.4byte	1, 196

		mJumpBack 0x8

	anim_data__0955_211:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B41 4
		.4byte	1, 197

		mJumpBack 0x8

	anim_data__0955_212:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B45 4
		.4byte	1, 198

		mJumpBack 0x8

	anim_data__0955_213:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B49 4
		.4byte	1, 199

		mJumpBack 0x8

	anim_data__0955_214:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B4D 4
		.4byte	1, 200

		mJumpBack 0x8

	anim_data__0955_215:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B51 4
		.4byte	1, 201

		mJumpBack 0x8

	anim_data__0955_216:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B55 4
		.4byte	1, 202

		mJumpBack 0x8

	anim_data__0955_217:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B59 4
		.4byte	1, 203

		mJumpBack 0x8

	anim_data__0955_218:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B5D 4
		.4byte	1, 204

		mJumpBack 0x8

	anim_data__0955_219:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B61 4
		.4byte	1, 205

		mJumpBack 0x8

	anim_data__0955_220:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B65 4
		.4byte	1, 206

		mJumpBack 0x8

	anim_data__0955_221:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B69 4
		.4byte	1, 207

		mJumpBack 0x8

	anim_data__0955_222:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B6D 4
		.4byte	1, 208

		mJumpBack 0x8

	anim_data__0955_223:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B71 4
		.4byte	1, 209

		mJumpBack 0x8

	anim_data__0955_224:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B75 4
		.4byte	1, 210

		mJumpBack 0x8

	anim_data__0955_225:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B79 4
		.4byte	1, 211

		mJumpBack 0x8

	anim_data__0955_226:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B7D 4
		.4byte	1, 212

		mJumpBack 0x8

	anim_data__0955_227:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B81 4
		.4byte	1, 213

		mJumpBack 0x8

	anim_data__0955_228:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B85 4
		.4byte	1, 214

		mJumpBack 0x8

	anim_data__0955_229:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B89 4
		.4byte	1, 215

		mJumpBack 0x8

	anim_data__0955_230:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B8D 4
		.4byte	1, 216

		mJumpBack 0x8

	anim_data__0955_231:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B11 4
		.4byte	1, 185

		mJumpBack 0x8

	anim_data__0955_232:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B91 4
		.4byte	1, 217

		mJumpBack 0x8

	anim_data__0955_233:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B95 4
		.4byte	1, 218

		mJumpBack 0x8

	anim_data__0955_234:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B99 4
		.4byte	1, 219

		mJumpBack 0x8

	anim_data__0955_235:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24B9D 4
		.4byte	1, 220

		mJumpBack 0x8

	anim_data__0955_236:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BA1 4
		.4byte	1, 221

		mJumpBack 0x8

	anim_data__0955_237:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BA5 4
		.4byte	1, 222

		mJumpBack 0x8

	anim_data__0955_238:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BA9 4
		.4byte	1, 223

		mJumpBack 0x8

	anim_data__0955_239:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BAD 4
		.4byte	1, 224

		mJumpBack 0x8

	anim_data__0955_240:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BB1 4
		.4byte	1, 225

		mJumpBack 0x8

	anim_data__0955_241:
		mGetPalette 0x2B3 16 0x0
		.4byte	1, -1

		mJumpBack 0x5

	anim_data__0955_242:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BB5 4
		.4byte	1, 226

		mJumpBack 0x8

	anim_data__0955_243:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BB9 4
		.4byte	1, 227

		mJumpBack 0x8

	anim_data__0955_244:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BBD 4
		.4byte	1, 228

		mJumpBack 0x8

	anim_data__0955_245:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BC1 4
		.4byte	1, 229

		mJumpBack 0x8

	anim_data__0955_246:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BC5 4
		.4byte	1, 230

		mJumpBack 0x8

	anim_data__0955_247:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BC9 4
		.4byte	1, 231

		mJumpBack 0x8

	anim_data__0955_248:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BCD 4
		.4byte	1, 232

		mJumpBack 0x8

	anim_data__0955_249:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BD1 4
		.4byte	1, 233

		mJumpBack 0x8

	anim_data__0955_250:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BD5 4
		.4byte	1, 234

		mJumpBack 0x8

	anim_data__0955_251:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BD9 4
		.4byte	1, 235

		mJumpBack 0x8

	anim_data__0955_252:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BDD 4
		.4byte	1, 236

		mJumpBack 0x8

	anim_data__0955_253:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BE1 4
		.4byte	1, 237

		mJumpBack 0x8

	anim_data__0955_254:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BE5 4
		.4byte	1, 238

		mJumpBack 0x8

	anim_data__0955_255:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24BE9 4
		.4byte	1, 239

		mJumpBack 0x8


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
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24BED 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0956_1:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24C1F 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0956_2:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24C51 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0956_3:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24C83 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0956_4:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24CB5 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0956_5:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24CE7 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0956_6:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24D19 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0956_7:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x24D4B 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0956_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24D7D 39
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24DA4 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0957_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24DCC 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0957_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24DF4 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0957_3:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24E1C 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0957_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24E44 51
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0957_5:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24E77 63
		.4byte	1, 5

		mAnimCmd4 


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
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x24EB6 28
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0958:
		.4byte anim_data__0958_0




.align 2, 0
	anim_data__0959_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x24ED2 66
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0959_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24F14 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0959_2:
		mGetPalette 0x2B6 16 0x10
		mGetTiles 0x24F38 36
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0959:
		.4byte anim_data__0959_0
		.4byte anim_data__0959_1
		.4byte anim_data__0959_2




.align 2, 0
	anim_data__0960_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24F5C 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0960_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x24F6C 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0960_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x24F7C 42
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0960:
		.4byte anim_data__0960_0
		.4byte anim_data__0960_1
		.4byte anim_data__0960_2




.align 2, 0
	anim_data__0961_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x24FA6 48
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0961_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24FD6 28
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0961:
		.4byte anim_data__0961_0
		.4byte anim_data__0961_1




.align 2, 0
	anim_data__0962_0:
		mGetPalette 0x2B7 16 0x0
		mGetTiles 0x24FF2 1
		.4byte	6, 0

		mGetTiles 0x24FF3 2
		.4byte	6, 1

		mGetTiles 0x24FF5 2
		.4byte	6, 2

		mGetTiles 0x24FF7 1
		.4byte	6, 3

		mJumpBack 0x17

	anim_data__0962_1:
		mGetPalette 0x2B7 16 0x0
		mGetTiles 0x24FF8 1
		.4byte	6, 4

		mGetTiles 0x24FF9 2
		.4byte	6, 5

		mGetTiles 0x24FFB 2
		.4byte	6, 6

		mGetTiles 0x24FFD 1
		.4byte	6, 7

		mJumpBack 0x17


.align 2, 0
	anim_0962:
		.4byte anim_data__0962_0
		.4byte anim_data__0962_1




.align 2, 0
	anim_data__0963_0:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x24FFE 4
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__0963_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25002 4
		.4byte	1, 1

		mJumpBack 0x8

	anim_data__0963_2:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25006 4
		.4byte	1, 2

		mJumpBack 0x8

	anim_data__0963_3:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2500A 4
		.4byte	1, 3

		mJumpBack 0x8

	anim_data__0963_4:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2500E 4
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__0963_5:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25012 4
		.4byte	1, 5

		mJumpBack 0x8

	anim_data__0963_6:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25016 4
		.4byte	1, 6

		mJumpBack 0x8

	anim_data__0963_7:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2501A 4
		.4byte	1, 7

		mJumpBack 0x8

	anim_data__0963_8:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2501E 4
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__0963_9:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25022 4
		.4byte	1, 9

		mJumpBack 0x8

	anim_data__0963_10:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x25026 4
		.4byte	1, 10

		mJumpBack 0x8

	anim_data__0963_11:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x2502A 4
		.4byte	1, 11

		mJumpBack 0x8

	anim_data__0963_12:
		mGetPalette 0x2B8 16 0x70
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0963_13:
		mGetPalette 0x2B9 16 0x80
		.4byte	1, -1

		mAnimCmd4 


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
		mGetPalette 0x2BA 16 0x20
		.4byte	1, -1

		mAnimCmd4 

	anim_data__0964_1:
		mGetPalette 0x2BB 16 0x40
		.4byte	1, -1

		mAnimCmd4 


.align 2, 0
	anim_0964:
		.4byte anim_data__0964_0
		.4byte anim_data__0964_1




.align 2, 0
	anim_data__0965_0:
		mGetPalette 0x2BC 16 0x20
		mGetTiles 0x2502E 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0965_1:
		mGetPalette 0x2BC 16 0x20
		mGetTiles 0x25038 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0965_2:
		mGetPalette 0x2BC 16 0x80
		mGetTiles 0x25042 1
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0965:
		.4byte anim_data__0965_0
		.4byte anim_data__0965_1
		.4byte anim_data__0965_2




.align 2, 0
	anim_data__0966_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x25043 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0966:
		.4byte anim_data__0966_0




.align 2, 0
	anim_data__0967_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x25057 42
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0967:
		.4byte anim_data__0967_0




.align 2, 0
	anim_data__0968_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x25081 64
		.4byte	5, 0

		mGetTiles 0x250C1 64
		.4byte	5, 1

		mGetTiles 0x25101 64
		.4byte	5, 2

		mGetTiles 0x25141 72
		.4byte	5, 3

		mGetTiles 0x25189 72
		.4byte	5, 4

		mGetTiles 0x251D1 72
		.4byte	5, 5

		mGetTiles 0x25219 64
		.4byte	5, 6

		mGetTiles 0x25259 64
		.4byte	5, 7

		mGetTiles 0x25299 72
		.4byte	5, 8

		mGetTiles 0x25189 72
		.4byte	5, 4

		mGetTiles 0x251D1 72
		.4byte	5, 5

		mJumpBack 0x3A

	anim_data__0968_1:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x252E1 40
		.4byte	1, 9

		mAnimCmd4 


.align 2, 0
	anim_0968:
		.4byte anim_data__0968_0
		.4byte anim_data__0968_1




.align 2, 0
	anim_data__0969_0:
		mGetPalette 0x2BF 16 0x70
		mGetTiles 0x25309 96
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0969:
		.4byte anim_data__0969_0




.align 2, 0
	anim_data__0970_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x25369 48
		.4byte	6, 0

		mGetTiles 0x25399 48
		.4byte	4, 1

		mGetTiles 0x253C9 42
		.4byte	3, 2

		mGetTiles 0x253F3 42
		.4byte	10, 3

		mGetTiles 0x253C9 42
		.4byte	5, 2

		mGetTiles 0x25399 48
		.4byte	5, 1

		mGetTiles 0x25369 48
		.4byte	10, 0

		mGetTiles 0x2541D 48
		.4byte	5, 4

		mGetTiles 0x2544D 48
		.4byte	5, 5

		mGetTiles 0x2541D 48
		.4byte	5, 4

		mGetTiles 0x25369 48
		.4byte	5, 0

		mAnimCmd4 


.align 2, 0
	anim_0970:
		.4byte anim_data__0970_0




.align 2, 0
	anim_data__0971_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x2547D 64
		.4byte	5, 0

		mGetTiles 0x254BD 64
		.4byte	5, 1

		mGetTiles 0x254FD 63
		.4byte	5, 2

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x25572 54
		.4byte	3, 4

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x254FD 63
		.4byte	3, 2

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x25572 54
		.4byte	3, 4

		mGetTiles 0x2553C 54
		.4byte	3, 3

		mGetTiles 0x254FD 63
		.4byte	5, 2

		mGetTiles 0x254BD 64
		.4byte	5, 1

		mGetTiles 0x2547D 64
		.4byte	5, 0

		mAnimCmd4 


.align 2, 0
	anim_0971:
		.4byte anim_data__0971_0




.align 2, 0
	anim_data__0972_0:
		mGetPalette 0x2C0 16 0x60
		mGetTiles 0x255A8 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0972:
		.4byte anim_data__0972_0




.align 2, 0
	anim_data__0973_0:
		mGetPalette 0x2BE 16 0x50
		mGetTiles 0x255BC 48
		.4byte	5, 0

		mGetTiles 0x255EC 56
		.4byte	5, 1

		mGetTiles 0x25624 48
		.4byte	10, 2

		mGetTiles 0x25654 48
		.4byte	5, 3

		mGetTiles 0x25684 56
		.4byte	10, 4

		mGetTiles 0x256BC 48
		.4byte	5, 5

		mGetTiles 0x256EC 56
		.4byte	5, 6

		mGetTiles 0x25724 48
		.4byte	10, 7

		mGetTiles 0x25754 48
		.4byte	5, 8

		mGetTiles 0x25784 56
		.4byte	10, 9

		mGetTiles 0x25784 56
		.4byte	5, 9

		mGetTiles 0x257BC 56
		.4byte	5, 10

		mGetTiles 0x257F4 56
		.4byte	10, 11

		mGetTiles 0x2582C 56
		.4byte	5, 12

		mGetTiles 0x25864 56
		.4byte	10, 13

		mGetTiles 0x25864 56
		.4byte	5, 13

		mGetTiles 0x255EC 56
		.4byte	5, 1

		mGetTiles 0x2589C 56
		.4byte	10, 14

		mGetTiles 0x258D4 56
		.4byte	5, 15

		mGetTiles 0x2590C 56
		.4byte	10, 16

		mGetTiles 0x25864 56
		.4byte	5, 13

		mJumpBack 0x6C


.align 2, 0
	anim_0973:
		.4byte anim_data__0973_0




.align 2, 0
	anim_data__0974_0:
		mGetPalette 0x2C1 16 0x70
		mGetTiles 0x25944 64
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0974:
		.4byte anim_data__0974_0




.align 2, 0
	anim_data__0975_0:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25984 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0975_1:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x259B6 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0975_2:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x259E8 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0975_3:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A1A 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0975_4:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A4C 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0975_5:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25A7E 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0975_6:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25AB0 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0975_7:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25AE2 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0975_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x25B14 26
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25B2E 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0976_1:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25B60 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0976_2:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25B92 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0976_3:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25BC4 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0976_4:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25BF6 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0976_5:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25C28 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0976_6:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25C5A 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0976_7:
		mGetPalette 0x2C2 16 0x30
		mGetTiles 0x25C8C 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0976_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x25CBE 30
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25CDC 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0977_1:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25D0E 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0977_2:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25D40 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0977_3:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25D72 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0977_4:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25DA4 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0977_5:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25DD6 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0977_6:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25E08 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0977_7:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25E3A 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0977_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x25E6C 24
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25E84 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0978_1:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25EB6 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0978_2:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25EE8 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0978_3:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25F1A 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0978_4:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25F4C 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0978_5:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25F7E 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0978_6:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25FB0 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0978_7:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x25FE2 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0978_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26014 30
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26032 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0979_1:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26064 50
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0979_2:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26096 50
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0979_3:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x260C8 50
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0979_4:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x260FA 50
		.4byte	1, 4

		mAnimCmd4 

	anim_data__0979_5:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x2612C 50
		.4byte	1, 5

		mAnimCmd4 

	anim_data__0979_6:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x2615E 50
		.4byte	1, 6

		mAnimCmd4 

	anim_data__0979_7:
		mGetPalette 0x2B5 16 0x30
		mGetTiles 0x26190 50
		.4byte	1, 7

		mAnimCmd4 

	anim_data__0979_8:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x261C2 24
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x261DA 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0980_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x261EC 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0980_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x261FE 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0980_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26210 38
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0980_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26236 17
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0980:
		.4byte anim_data__0980_0
		.4byte anim_data__0980_1
		.4byte anim_data__0980_2
		.4byte anim_data__0980_3
		.4byte anim_data__0980_4




.align 2, 0
	anim_data__0981_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26247 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0981_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26259 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0981_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x2626B 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0981_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2627D 38
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0981_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x262A3 17
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0981:
		.4byte anim_data__0981_0
		.4byte anim_data__0981_1
		.4byte anim_data__0981_2
		.4byte anim_data__0981_3
		.4byte anim_data__0981_4




.align 2, 0
	anim_data__0982_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262B4 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0982_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262C6 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0982_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x262D8 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0982_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x262EA 44
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0982_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26316 17
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0982:
		.4byte anim_data__0982_0
		.4byte anim_data__0982_1
		.4byte anim_data__0982_2
		.4byte anim_data__0982_3
		.4byte anim_data__0982_4




.align 2, 0
	anim_data__0983_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26327 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0983_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26339 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0983_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2634B 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0983_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2635D 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0983_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26385 21
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0983:
		.4byte anim_data__0983_0
		.4byte anim_data__0983_1
		.4byte anim_data__0983_2
		.4byte anim_data__0983_3
		.4byte anim_data__0983_4




.align 2, 0
	anim_data__0984_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2639A 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0984_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x263AC 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0984_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x263BE 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0984_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x263D0 46
		.4byte	1, 3

		mAnimCmd4 

	anim_data__0984_4:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x263FE 15
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_0984:
		.4byte anim_data__0984_0
		.4byte anim_data__0984_1
		.4byte anim_data__0984_2
		.4byte anim_data__0984_3
		.4byte anim_data__0984_4




.align 2, 0
	anim_data__0985_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x2640D 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0985_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x2641D 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0985_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2642D 46
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0985_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2645B 38
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0985:
		.4byte anim_data__0985_0
		.4byte anim_data__0985_1
		.4byte anim_data__0985_2
		.4byte anim_data__0985_3




.align 2, 0
	anim_data__0986_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26481 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0986_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26491 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0986_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x264A1 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0986_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x264D1 44
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0986:
		.4byte anim_data__0986_0
		.4byte anim_data__0986_1
		.4byte anim_data__0986_2
		.4byte anim_data__0986_3




.align 2, 0
	anim_data__0987_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x264FD 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0987_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2650D 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0987_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2651D 80
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0987_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2656D 42
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0987:
		.4byte anim_data__0987_0
		.4byte anim_data__0987_1
		.4byte anim_data__0987_2
		.4byte anim_data__0987_3




.align 2, 0
	anim_data__0988_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26597 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0988_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x265A7 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0988_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x265B7 68
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0988_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x265FB 63
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0988:
		.4byte anim_data__0988_0
		.4byte anim_data__0988_1
		.4byte anim_data__0988_2
		.4byte anim_data__0988_3




.align 2, 0
	anim_data__0989_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2663A 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0989_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2664A 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0989_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2665A 60
		.4byte	1, 2

		mAnimCmd4 

	anim_data__0989_3:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26696 22
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_0989:
		.4byte anim_data__0989_0
		.4byte anim_data__0989_1
		.4byte anim_data__0989_2
		.4byte anim_data__0989_3




.align 2, 0
	anim_data__0990_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266AC 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0990_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266BC 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0990_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x266CC 28
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0990:
		.4byte anim_data__0990_0
		.4byte anim_data__0990_1
		.4byte anim_data__0990_2




.align 2, 0
	anim_data__0991_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266E8 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0991_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x266F8 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0991_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26708 50
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0991:
		.4byte anim_data__0991_0
		.4byte anim_data__0991_1
		.4byte anim_data__0991_2




.align 2, 0
	anim_data__0992_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2673A 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0992_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x2674A 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0992_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x2675A 28
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0992:
		.4byte anim_data__0992_0
		.4byte anim_data__0992_1
		.4byte anim_data__0992_2




.align 2, 0
	anim_data__0993_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26776 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0993_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26786 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0993_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26796 28
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0993:
		.4byte anim_data__0993_0
		.4byte anim_data__0993_1
		.4byte anim_data__0993_2




.align 2, 0
	anim_data__0994_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x267B2 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0994_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x267C2 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__0994_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x267D2 45
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_0994:
		.4byte anim_data__0994_0
		.4byte anim_data__0994_1
		.4byte anim_data__0994_2




.align 2, 0
	anim_data__0995_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x267FF 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__0995_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26831 20
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_0995:
		.4byte anim_data__0995_0
		.4byte anim_data__0995_1




.align 2, 0
	anim_data__0996_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26845 46
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0996:
		.4byte anim_data__0996_0




.align 2, 0
	anim_data__0997_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26873 60
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0997:
		.4byte anim_data__0997_0




.align 2, 0
	anim_data__0998_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x268AF 38
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0998:
		.4byte anim_data__0998_0




.align 2, 0
	anim_data__0999_0:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x268D5 46
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_0999:
		.4byte anim_data__0999_0




.align 2, 0
	anim_data__1000_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26903 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1000_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26923 24
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1000:
		.4byte anim_data__1000_0
		.4byte anim_data__1000_1




.align 2, 0
	anim_data__1001_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x2693B 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1001_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26957 28
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1001:
		.4byte anim_data__1001_0
		.4byte anim_data__1001_1




.align 2, 0
	anim_data__1002_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26973 34
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1002_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26995 30
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1002:
		.4byte anim_data__1002_0
		.4byte anim_data__1002_1




.align 2, 0
	anim_data__1003_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269B3 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1003_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269B3 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1003:
		.4byte anim_data__1003_0
		.4byte anim_data__1003_1




.align 2, 0
	anim_data__1004_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269C7 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1004_1:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x269E7 26
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1004:
		.4byte anim_data__1004_0
		.4byte anim_data__1004_1




.align 2, 0
	anim_data__1005_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A01 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1005_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A29 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1005_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A51 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1005_3:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26A79 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1005_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26AA1 34
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1005:
		.4byte anim_data__1005_0
		.4byte anim_data__1005_1
		.4byte anim_data__1005_2
		.4byte anim_data__1005_3
		.4byte anim_data__1005_4




.align 2, 0
	anim_data__1006_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26AC3 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1006_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26AEB 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1006_2:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26B13 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1006_3:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26B3B 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1006_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26B63 38
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1006:
		.4byte anim_data__1006_0
		.4byte anim_data__1006_1
		.4byte anim_data__1006_2
		.4byte anim_data__1006_3
		.4byte anim_data__1006_4




.align 2, 0
	anim_data__1007_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26B89 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1007_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26BB1 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1007_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26BD9 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1007_3:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26C01 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1007_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26C29 28
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1007:
		.4byte anim_data__1007_0
		.4byte anim_data__1007_1
		.4byte anim_data__1007_2
		.4byte anim_data__1007_3
		.4byte anim_data__1007_4




.align 2, 0
	anim_data__1008_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26C45 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1008_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26C6D 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1008_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26C95 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1008_3:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26CBD 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1008_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26CE5 30
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1008:
		.4byte anim_data__1008_0
		.4byte anim_data__1008_1
		.4byte anim_data__1008_2
		.4byte anim_data__1008_3
		.4byte anim_data__1008_4




.align 2, 0
	anim_data__1009_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26D03 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1009_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26D2B 40
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1009_2:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26D53 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1009_3:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26D7B 40
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1009_4:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26DA3 28
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1009:
		.4byte anim_data__1009_0
		.4byte anim_data__1009_1
		.4byte anim_data__1009_2
		.4byte anim_data__1009_3
		.4byte anim_data__1009_4




.align 2, 0
	anim_data__1010_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26DBF 22
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1010:
		.4byte anim_data__1010_0




.align 2, 0
	anim_data__1011_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26DD5 26
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1011:
		.4byte anim_data__1011_0




.align 2, 0
	anim_data__1012_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26DEF 26
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1012:
		.4byte anim_data__1012_0




.align 2, 0
	anim_data__1013_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26E09 26
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1013:
		.4byte anim_data__1013_0




.align 2, 0
	anim_data__1014_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26E23 28
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1014:
		.4byte anim_data__1014_0




.align 2, 0
	anim_data__1015_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26E3F 32
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1015_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x26E5F 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1015_2:
		mGetPalette 0x2B6 16 0x10
		mGetTiles 0x26E83 36
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1015:
		.4byte anim_data__1015_0
		.4byte anim_data__1015_1
		.4byte anim_data__1015_2




.align 2, 0
	anim_data__1016_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26EA7 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1016:
		.4byte anim_data__1016_0




.align 2, 0
	anim_data__1017_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26EC5 44
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1017:
		.4byte anim_data__1017_0




.align 2, 0
	anim_data__1018_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26EF1 44
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1018:
		.4byte anim_data__1018_0




.align 2, 0
	anim_data__1019_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x26F1D 36
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1019:
		.4byte anim_data__1019_0




.align 2, 0
	anim_data__1020_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F41 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1020_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F51 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1020_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26F61 26
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1020:
		.4byte anim_data__1020_0
		.4byte anim_data__1020_1
		.4byte anim_data__1020_2




.align 2, 0
	anim_data__1021_0:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F7B 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1021_1:
		mGetPalette 0x2C3 16 0x10
		mGetTiles 0x26F8B 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1021_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26F9B 24
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1021:
		.4byte anim_data__1021_0
		.4byte anim_data__1021_1
		.4byte anim_data__1021_2




.align 2, 0
	anim_data__1022_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26FB3 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1022_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26FC3 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1022_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x26FD3 38
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1022:
		.4byte anim_data__1022_0
		.4byte anim_data__1022_1
		.4byte anim_data__1022_2




.align 2, 0
	anim_data__1023_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x26FF9 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1023_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x27009 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1023_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x27019 40
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1023:
		.4byte anim_data__1023_0
		.4byte anim_data__1023_1
		.4byte anim_data__1023_2




.align 2, 0
	anim_data__1024_0:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x27041 16
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1024_1:
		mGetPalette 0x2B0 16 0x10
		mGetTiles 0x27051 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1024_2:
		mGetPalette 0x2B1 16 0x60
		mGetTiles 0x27061 36
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1024:
		.4byte anim_data__1024_0
		.4byte anim_data__1024_1
		.4byte anim_data__1024_2




.align 2, 0
	anim_data__1025_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x27085 42
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1025_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x270AF 26
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1025:
		.4byte anim_data__1025_0
		.4byte anim_data__1025_1




.align 2, 0
	anim_data__1026_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x270C9 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1026_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x270E5 26
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1026:
		.4byte anim_data__1026_0
		.4byte anim_data__1026_1




.align 2, 0
	anim_data__1027_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x270FF 42
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1027_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x27129 24
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1027:
		.4byte anim_data__1027_0
		.4byte anim_data__1027_1




.align 2, 0
	anim_data__1028_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x27141 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1028_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x27169 24
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1028:
		.4byte anim_data__1028_0
		.4byte anim_data__1028_1




.align 2, 0
	anim_data__1029_0:
		mGetPalette 0x2B2 16 0x50
		mGetTiles 0x27181 40
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1029_1:
		mGetPalette 0x2B3 16 0x0
		mGetTiles 0x271A9 26
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1029:
		.4byte anim_data__1029_0
		.4byte anim_data__1029_1




.align 2, 0
	anim_data__1030_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x271C3 32
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1030:
		.4byte anim_data__1030_0




.align 2, 0
	anim_data__1031_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x271E3 26
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1031:
		.4byte anim_data__1031_0




.align 2, 0
	anim_data__1032_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x271FD 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1032:
		.4byte anim_data__1032_0




.align 2, 0
	anim_data__1033_0:
		mGetPalette 0x2BD 16 0x10
		mGetTiles 0x2722D 34
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1033:
		.4byte anim_data__1033_0




.align 2, 0
	anim_data__1034_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2724F 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1034_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27257 8
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1034:
		.4byte anim_data__1034_0
		.4byte anim_data__1034_1




.align 2, 0
	anim_data__1035_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2725F 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1035_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27267 12
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1035:
		.4byte anim_data__1035_0
		.4byte anim_data__1035_1




.align 2, 0
	anim_data__1036_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27273 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1036_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2727B 12
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1036:
		.4byte anim_data__1036_0
		.4byte anim_data__1036_1




.align 2, 0
	anim_data__1037_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27287 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1037_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x27291 10
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1037:
		.4byte anim_data__1037_0
		.4byte anim_data__1037_1




.align 2, 0
	anim_data__1038_0:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x2729B 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1038_1:
		mGetPalette 0x2C4 16 0x20
		mGetTiles 0x272A3 12
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1038:
		.4byte anim_data__1038_0
		.4byte anim_data__1038_1




.align 2, 0
	anim_data__1039_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272AF 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1039:
		.4byte anim_data__1039_0




.align 2, 0
	anim_data__1040_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272C3 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1040:
		.4byte anim_data__1040_0




.align 2, 0
	anim_data__1041_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272D7 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1041:
		.4byte anim_data__1041_0




.align 2, 0
	anim_data__1042_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272EB 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1042:
		.4byte anim_data__1042_0




.align 2, 0
	anim_data__1043_0:
		mGetPalette 0xA4 16 0x20
		mGetTiles 0x272FF 20
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1043:
		.4byte anim_data__1043_0




.align 2, 0
	anim_data__1044_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27313 28
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1044:
		.4byte anim_data__1044_0




.align 2, 0
	anim_data__1045_0:
		mGetPalette 0x4A 16 0x90
		mGetTiles 0x2732F 46
		mAnimCmd6 0x0 0x2000200
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1045:
		.4byte anim_data__1045_0




.align 2, 0
	anim_data__1046_0:
		mGetPalette 0xD8 16 0xF0
		mGetTiles 0x2735D 90
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1046:
		.4byte anim_data__1046_0




.align 2, 0
	anim_data__1047_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273B7 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1047_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273BB 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1047_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273BF 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1047_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273C3 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1047_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273C7 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1047_5:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273CB 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1047_6:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273CF 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1047_7:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273D3 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1047_8:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273D7 4
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1047_9:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273DB 4
		.4byte	1, 9

		mAnimCmd4 

	anim_data__1047_10:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273DF 4
		.4byte	1, 10

		mAnimCmd4 

	anim_data__1047_11:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273E3 16
		.4byte	1, 11

		mAnimCmd4 

	anim_data__1047_12:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x273F3 16
		.4byte	1, 12

		mAnimCmd4 

	anim_data__1047_13:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27403 16
		.4byte	1, 13

		mAnimCmd4 

	anim_data__1047_14:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27413 16
		.4byte	1, 14

		mAnimCmd4 

	anim_data__1047_15:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27423 16
		.4byte	1, 15

		mAnimCmd4 

	anim_data__1047_16:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x27433 16
		.4byte	1, 16

		mAnimCmd4 


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
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27443 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1048_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27457 16
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1048_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27467 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1048_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2746B 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1048_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27471 6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1048_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27477 6
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1048_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2747D 6
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1048_7:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27483 6
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1048_8:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27489 6
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1048_9:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2748F 20
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274A3 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1049_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274BF 28
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1049_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274DB 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1049_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x274FF 30
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1049_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2751D 28
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1049_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27539 22
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1049_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2754F 30
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1049_7:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2756D 26
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1049_8:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x27587 30
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x275A5 1
		.4byte	7, 0

		mGetTiles 0x275A6 2
		.4byte	7, 1

		mGetTiles 0x275A8 2
		.4byte	7, 2

		mGetTiles 0x275AA 2
		.4byte	7, 3

		mJumpBack 0x17

	anim_data__1050_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x275AC 1
		.4byte	7, 4

		mGetTiles 0x275AD 2
		.4byte	7, 5

		mGetTiles 0x275AF 2
		.4byte	7, 6

		mGetTiles 0x275B1 2
		.4byte	7, 7

		mJumpBack 0x17


.align 2, 0
	anim_1050:
		.4byte anim_data__1050_0
		.4byte anim_data__1050_1




.align 2, 0
	anim_data__1051_0:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275B3 22
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1051_1:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275C9 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1051_2:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275E9 22
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1051_3:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x275FF 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1051_4:
		mGetPalette 0x2C6 16 0x60
		mGetTiles 0x27615 10
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1051_5:
		mGetPalette 0x2C7 16 0x70
		.4byte	1, -1

		mAnimCmd4 


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
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x2761F 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1052_1:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27637 42
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1052_2:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27661 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1052_3:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27685 30
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1052_4:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x276A3 8
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1052:
		.4byte anim_data__1052_0
		.4byte anim_data__1052_1
		.4byte anim_data__1052_2
		.4byte anim_data__1052_3
		.4byte anim_data__1052_4




.align 2, 0
	anim_data__1053_0:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x276AB 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1053_1:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x276C3 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1053_2:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x276E7 42
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1053_3:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27711 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1053_4:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27735 20
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1053:
		.4byte anim_data__1053_0
		.4byte anim_data__1053_1
		.4byte anim_data__1053_2
		.4byte anim_data__1053_3
		.4byte anim_data__1053_4




.align 2, 0
	anim_data__1054_0:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27749 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1054_1:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27761 48
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1054_2:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27791 36
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1054_3:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x277B5 32
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1054_4:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x277D5 8
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1054:
		.4byte anim_data__1054_0
		.4byte anim_data__1054_1
		.4byte anim_data__1054_2
		.4byte anim_data__1054_3
		.4byte anim_data__1054_4




.align 2, 0
	anim_data__1055_0:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x277DD 44
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1055_1:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27809 44
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1055_2:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27835 38
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1055_3:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x2785B 32
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1055_4:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x2787B 8
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1055:
		.4byte anim_data__1055_0
		.4byte anim_data__1055_1
		.4byte anim_data__1055_2
		.4byte anim_data__1055_3
		.4byte anim_data__1055_4




.align 2, 0
	anim_data__1056_0:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27883 20
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1056_1:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27897 44
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1056_2:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x278C3 40
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1056_3:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x278EB 28
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1056_4:
		mGetPalette 0x2C8 16 0x60
		mGetTiles 0x27907 12
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1056:
		.4byte anim_data__1056_0
		.4byte anim_data__1056_1
		.4byte anim_data__1056_2
		.4byte anim_data__1056_3
		.4byte anim_data__1056_4




.align 2, 0
	anim_data__1057_0:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x27913 108
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1057_1:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x2797F 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1057_2:
		mGetPalette 0x2CA 16 0x10
		mGetTiles 0x2798B 8
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1057_3:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x27993 168
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1057_4:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x27A3B 168
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1057_5:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x27AE3 168
		.4byte	1, 5

		mAnimCmd4 


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
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27B8B 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1058_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27C33 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1058_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27CDB 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1058_3:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27D83 12
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1058_4:
		mGetPalette 0x2CC 16 0x10
		mGetTiles 0x27D8F 12
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1058:
		.4byte anim_data__1058_0
		.4byte anim_data__1058_1
		.4byte anim_data__1058_2
		.4byte anim_data__1058_3
		.4byte anim_data__1058_4




.align 2, 0
	anim_data__1059_0:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27D9B 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1059_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27E43 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1059_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27EEB 168
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1059:
		.4byte anim_data__1059_0
		.4byte anim_data__1059_1
		.4byte anim_data__1059_2




.align 2, 0
	anim_data__1060_0:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x27F93 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1060_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x2803B 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1060_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x280E3 168
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1060:
		.4byte anim_data__1060_0
		.4byte anim_data__1060_1
		.4byte anim_data__1060_2




.align 2, 0
	anim_data__1061_0:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x2818B 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1061_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x28233 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1061_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x282DB 168
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1061:
		.4byte anim_data__1061_0
		.4byte anim_data__1061_1
		.4byte anim_data__1061_2




.align 2, 0
	anim_data__1062_0:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x28383 168
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1062_1:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x2842B 168
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1062_2:
		mGetPalette 0x2CB 16 0x0
		mGetTiles 0x284D3 168
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1062:
		.4byte anim_data__1062_0
		.4byte anim_data__1062_1
		.4byte anim_data__1062_2




.align 2, 0
	anim_data__1063_0:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2857B 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1063_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2859F 34
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1063_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x285C1 34
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1063_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x285E3 36
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1063_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28607 34
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1063_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28629 36
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1063_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2864D 32
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1063_7:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2866D 10
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1063_8:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28677 38
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2869D 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1064_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x286C1 34
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1064_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x286E3 24
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1064_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x286FB 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1064_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28711 24
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1064_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28729 28
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1064_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28745 24
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x2875D 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1065_1:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28783 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1065_2:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287A9 26
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1065_3:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287C3 22
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1065_4:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287D9 28
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1065_5:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x287F5 34
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1065_6:
		mGetPalette 0x2C5 16 0x0
		mGetTiles 0x28817 22
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x2882D 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1066:
		.4byte anim_data__1066_0




.align 2, 0
	anim_data__1067_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x28855 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1067:
		.4byte anim_data__1067_0




.align 2, 0
	anim_data__1068_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x2887D 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1068:
		.4byte anim_data__1068_0




.align 2, 0
	anim_data__1069_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x288A5 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1069:
		.4byte anim_data__1069_0




.align 2, 0
	anim_data__1070_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x288CD 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1070:
		.4byte anim_data__1070_0




.align 2, 0
	anim_data__1071_0:
		mGetPalette 0x5D 16 0xF0
		mGetTiles 0x288F5 40
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1071:
		.4byte anim_data__1071_0




.align 2, 0
	anim_data__1072_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2891D 22
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1072_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x28933 8
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1072:
		.4byte anim_data__1072_0
		.4byte anim_data__1072_1




.align 2, 0
	anim_data__1073_0:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x2893B 50
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1073_1:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x2896D 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1073_2:
		mGetPalette 0x2CA 16 0x10
		mGetTiles 0x28993 32
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1073_3:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x289B3 168
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1073_4:
		mGetPalette 0x2C9 16 0x0
		mGetTiles 0x28A5B 168
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1073:
		.4byte anim_data__1073_0
		.4byte anim_data__1073_1
		.4byte anim_data__1073_2
		.4byte anim_data__1073_3
		.4byte anim_data__1073_4




.align 2, 0
	anim_data__1074_0:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28B03 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1074_1:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28B5D 51
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1074_2:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28B90 57
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1074_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28BC9 66
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1074_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28C0B 66
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1074_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28C4D 66
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1074_6:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28C8F 15
		.4byte	1, 6

		mJumpBack 0x8

	anim_data__1074_7:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28C9E 30
		.4byte	1, 7

		mJumpBack 0x8

	anim_data__1074_8:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28CBC 4
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__1074_9:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28CC0 4
		.4byte	1, 9

		mJumpBack 0x8

	anim_data__1074_10:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28CC4 4
		.4byte	1, 10

		mJumpBack 0x8

	anim_data__1074_11:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28CC8 30
		.4byte	1, 11

		mAnimCmd4 

	anim_data__1074_12:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28CE6 66
		.4byte	1, 12

		mAnimCmd4 

	anim_data__1074_13:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28D28 6
		.4byte	1, 13

		mJumpBack 0x8

	anim_data__1074_14:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28D2E 8
		.4byte	1, 14

		mJumpBack 0x8

	anim_data__1074_15:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28D36 8
		.4byte	1, 15

		mJumpBack 0x8

	anim_data__1074_16:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28D3E 8
		.4byte	1, 16

		mJumpBack 0x8

	anim_data__1074_17:
		mGetPalette 0x2CF 16 0x60
		mGetTiles 0x28D46 12
		.4byte	1, 17

		mAnimCmd4 

	anim_data__1074_18:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28D52 18
		.4byte	1, 18

		mAnimCmd4 


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
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x28D64 48
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1075_1:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x28D94 48
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1075:
		.4byte anim_data__1075_0
		.4byte anim_data__1075_1




.align 2, 0
	anim_data__1076_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28DC4 46
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1076_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28DF2 42
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1076_2:
		mGetPalette 0x2D1 16 0x10
		mGetTiles 0x28E1C 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1076_3:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E28 18
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1076_4:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E3A 6
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1076_5:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E40 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1076_6:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E48 8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1076_7:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E50 8
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1076_8:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E58 8
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1076_9:
		mGetPalette 0xA1 16 0x60
		mGetTiles 0x28E60 1
		.4byte	4, 9

		mGetTiles 0x28E61 1
		.4byte	4, 10

		mGetTiles 0x28E62 1
		.4byte	4, 11

		mGetTiles 0x28E63 1
		.4byte	4, 12

		mJumpBack 0x17

	anim_data__1076_10:
		mGetPalette 0x2D1 16 0x10
		.4byte	1, -1

		mAnimCmd4 


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
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E64 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1077_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E6A 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1077_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E70 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1077_3:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E7C 8
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1077_4:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E84 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1077_5:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E8C 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1077_6:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E94 8
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1077_7:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28E9C 12
		.4byte	1, 7

		mAnimCmd4 


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
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EA8 4
		.4byte	1, 0

		mJumpBack 0x8

	anim_data__1078_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EAC 2
		.4byte	1, 1

		mJumpBack 0x8

	anim_data__1078_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EAE 4
		.4byte	1, 2

		mJumpBack 0x8

	anim_data__1078_3:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EB2 4
		.4byte	1, 3

		mJumpBack 0x8

	anim_data__1078_4:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EB6 4
		.4byte	1, 4

		mJumpBack 0x8

	anim_data__1078_5:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EBA 4
		.4byte	1, 5

		mJumpBack 0x8

	anim_data__1078_6:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EBE 4
		.4byte	1, 6

		mJumpBack 0x8

	anim_data__1078_7:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EC2 4
		.4byte	1, 7

		mJumpBack 0x8

	anim_data__1078_8:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28EC6 4
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__1078_9:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x28ECA 4
		.4byte	1, 9

		mJumpBack 0x8


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
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28ECE 84
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1079_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28F22 75
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1079_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x28F6D 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1079_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28F9D 68
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1079_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x28FE1 68
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1079_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29025 68
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1079_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x29069 10
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1079_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29073 10
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1079_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x2907D 36
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1079_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x290A1 50
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x290D3 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1080_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x2912D 75
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1080_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29178 69
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1080_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x291BD 88
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1080_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29215 88
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1080_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2926D 88
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1080_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x292C5 15
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1080_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x292D4 21
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1080_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x292E9 42
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1080_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29313 51
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29346 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1081_1:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x293A0 57
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1081_2:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x293D9 39
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1081_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29400 60
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1081_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2943C 60
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1081_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29478 60
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1081_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x294B4 18
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1081_7:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x294C6 18
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1081_8:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x294D8 69
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1081_9:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2951D 69
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29562 90
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1082_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x295BC 45
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1082_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x295E9 69
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1082_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x2962E 68
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1082_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29672 68
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1082_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x296B6 68
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1082_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x296FA 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1082_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29703 15
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1082_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29712 46
		.4byte	1, 8

		mJumpBack 0x8

	anim_data__1082_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29740 51
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x29773 45
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1083_1:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x297A0 51
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1083_2:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x297D3 69
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1083_3:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29818 60
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1083_4:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29854 64
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1083_5:
		mGetPalette 0x2CD 16 0x70
		mGetTiles 0x29894 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1083_6:
		mGetPalette 0x2D3 16 0x60
		mGetTiles 0x298D4 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1083_7:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x298DD 15
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1083_8:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x298EC 63
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1083_9:
		mGetPalette 0x2D2 16 0x70
		mGetTiles 0x2992B 51
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x2995E 38
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1084_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29984 46
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1084_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x299B2 14
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1084_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x299C0 10
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1084:
		.4byte anim_data__1084_0
		.4byte anim_data__1084_1
		.4byte anim_data__1084_2
		.4byte anim_data__1084_3




.align 2, 0
	anim_data__1085_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x299CA 57
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1085_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A03 46
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1085_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29A31 10
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1085_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A3B 14
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1085:
		.4byte anim_data__1085_0
		.4byte anim_data__1085_1
		.4byte anim_data__1085_2
		.4byte anim_data__1085_3




.align 2, 0
	anim_data__1086_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A49 51
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1086_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29A7C 72
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1086_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29AC4 10
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1086_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29ACE 14
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1086:
		.4byte anim_data__1086_0
		.4byte anim_data__1086_1
		.4byte anim_data__1086_2
		.4byte anim_data__1086_3




.align 2, 0
	anim_data__1087_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29ADC 75
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1087_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29B27 69
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1087_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29B6C 9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1087_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29B75 15
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1087:
		.4byte anim_data__1087_0
		.4byte anim_data__1087_1
		.4byte anim_data__1087_2
		.4byte anim_data__1087_3




.align 2, 0
	anim_data__1088_0:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29B84 72
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1088_1:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29BCC 75
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1088_2:
		mGetPalette 0x2D5 16 0x10
		mGetTiles 0x29C17 6
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1088_3:
		mGetPalette 0x2D4 16 0x0
		mGetTiles 0x29C1D 10
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1088:
		.4byte anim_data__1088_0
		.4byte anim_data__1088_1
		.4byte anim_data__1088_2
		.4byte anim_data__1088_3




.align 2, 0
	anim_data__1089_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C27 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1089_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C2D 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1089_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C37 10
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1089_3:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C41 6
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1089_4:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C47 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1089_5:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C4F 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1089_6:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C57 8
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C5F 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1090_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C67 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1090_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C71 12
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1090:
		.4byte anim_data__1090_0
		.4byte anim_data__1090_1
		.4byte anim_data__1090_2




.align 2, 0
	anim_data__1091_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C7D 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1091_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C89 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1091_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C95 8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1091:
		.4byte anim_data__1091_0
		.4byte anim_data__1091_1
		.4byte anim_data__1091_2




.align 2, 0
	anim_data__1092_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29C9D 12
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1092_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CA9 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1092_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CB5 10
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1092:
		.4byte anim_data__1092_0
		.4byte anim_data__1092_1
		.4byte anim_data__1092_2




.align 2, 0
	anim_data__1093_0:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CBF 10
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1093_1:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CC9 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1093_2:
		mGetPalette 0x2CE 16 0x0
		mGetTiles 0x29CD3 8
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1093:
		.4byte anim_data__1093_0
		.4byte anim_data__1093_1
		.4byte anim_data__1093_2




.align 2, 0
	anim_data__1094_0:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29CDB 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1094_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x29CFF 38
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1094_2:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29D25 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1094_3:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29DCD 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1094:
		.4byte anim_data__1094_0
		.4byte anim_data__1094_1
		.4byte anim_data__1094_2
		.4byte anim_data__1094_3




.align 2, 0
	anim_data__1095_0:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29E75 34
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1095_1:
		mGetPalette 0x2D8 16 0x10
		mGetTiles 0x29E97 28
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1095_2:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29EB3 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1095_3:
		mGetPalette 0x2D6 16 0x0
		mGetTiles 0x29F5B 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1095:
		.4byte anim_data__1095_0
		.4byte anim_data__1095_1
		.4byte anim_data__1095_2
		.4byte anim_data__1095_3




.align 2, 0
	anim_data__1096_0:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A003 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1096_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x2A027 32
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1096_2:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A047 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1096_3:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A0EF 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1096:
		.4byte anim_data__1096_0
		.4byte anim_data__1096_1
		.4byte anim_data__1096_2
		.4byte anim_data__1096_3




.align 2, 0
	anim_data__1097_0:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A197 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1097_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x2A1BB 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1097_2:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A1DF 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1097_3:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A287 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1097:
		.4byte anim_data__1097_0
		.4byte anim_data__1097_1
		.4byte anim_data__1097_2
		.4byte anim_data__1097_3




.align 2, 0
	anim_data__1098_0:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A32F 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1098_1:
		mGetPalette 0x2D7 16 0x10
		mGetTiles 0x2A353 36
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1098_2:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A377 168
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1098_3:
		mGetPalette 0x2D9 16 0x0
		mGetTiles 0x2A41F 168
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1098:
		.4byte anim_data__1098_0
		.4byte anim_data__1098_1
		.4byte anim_data__1098_2
		.4byte anim_data__1098_3




.align 2, 0
	anim_data__1099_0:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4C7 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1099_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4CD 6
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1099_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4D3 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1099_3:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4DF 12
		.4byte	1, 3

		mAnimCmd4 


.align 2, 0
	anim_1099:
		.4byte anim_data__1099_0
		.4byte anim_data__1099_1
		.4byte anim_data__1099_2
		.4byte anim_data__1099_3




.align 2, 0
	anim_data__1100_0:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4EB 6
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1100_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4F1 10
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1100_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2A4FB 10
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1100:
		.4byte anim_data__1100_0
		.4byte anim_data__1100_1
		.4byte anim_data__1100_2




.align 2, 0
	anim_data__1101_0:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A505 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1101_1:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A50D 8
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1101_2:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A515 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1101_3:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A521 8
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1101_4:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A529 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1101_5:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A531 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1101_6:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A539 8
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A541 8
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1102_1:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A549 12
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1102_2:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A555 12
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1102_3:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A561 8
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1102_4:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A569 8
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1102_5:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A571 8
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1102_6:
		mGetPalette 0x2DA 16 0x90
		mGetTiles 0x2A579 8
		.4byte	1, 6

		mAnimCmd4 


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
		mGetPalette 0x2DB 16 0x80
		mGetTiles 0x2A581 48
		.4byte	3, 0

		mGetTiles 0x2A5B1 48
		.4byte	3, 1

		mGetTiles 0x2A5E1 48
		.4byte	3, 2

		mGetTiles 0x2A611 48
		.4byte	3, 3

		mGetTiles 0x2A641 48
		.4byte	3, 4

		mGetTiles 0x2A671 48
		.4byte	3, 5

		mGetTiles 0x2A6A1 42
		.4byte	3, 6

		mGetTiles 0x2A6CB 49
		.4byte	3, 7

		mGetTiles 0x2A6FC 56
		.4byte	3, 8

		mGetTiles 0x2A734 56
		.4byte	3, 9

		mGetTiles 0x2A76C 56
		.4byte	3, 10

		mGetTiles 0x2A7A4 56
		.4byte	3, 11

		mGetTiles 0x2A7DC 56
		.4byte	3, 12

		mAnimCmd4 

	anim_data__1103_1:
		mGetPalette 0x2DB 16 0x80
		mGetTiles 0x2A7A4 56
		.4byte	3, 11

		mGetTiles 0x2A76C 56
		.4byte	3, 10

		mGetTiles 0x2A814 56
		.4byte	3, 13

		mGetTiles 0x2A76C 56
		.4byte	3, 10

		mGetTiles 0x2A7A4 56
		.4byte	3, 11

		mGetTiles 0x2A7DC 56
		.4byte	3, 12

		mJumpBack 0x21


.align 2, 0
	anim_1103:
		.4byte anim_data__1103_0
		.4byte anim_data__1103_1




.align 2, 0
	anim_data__1104_0:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A84C 48
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1104_1:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A87C 48
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1104_2:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A8AC 48
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1104_3:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A8DC 48
		.4byte	3, 3

		mGetTiles 0x2A90C 48
		.4byte	3, 4

		mGetTiles 0x2A93C 48
		.4byte	3, 5

		mGetTiles 0x2A96C 48
		.4byte	3, 6

		mAnimCmd4 

	anim_data__1104_4:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A99C 48
		.4byte	3, 7

		mAnimCmd4 

	anim_data__1104_5:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2A9CC 48
		.4byte	3, 8

		mGetTiles 0x2A9FC 48
		.4byte	3, 9

		mGetTiles 0x2AA2C 48
		.4byte	3, 10

		mGetTiles 0x2AA5C 48
		.4byte	3, 11

		mAnimCmd4 

	anim_data__1104_6:
		mGetPalette 0x2D0 16 0x80
		mGetTiles 0x2AA8C 48
		.4byte	3, 12

		mAnimCmd4 


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
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AABC 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1105_1:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC0 2
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1105_2:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC2 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1105_3:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAC6 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1105_4:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AACA 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1105_5:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AACE 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1105_6:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAD2 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1105_7:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AAD6 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1105_8:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AADA 4
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1105_9:
		mGetPalette 0x2CE 16 0xA0
		mGetTiles 0x2AADE 4
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AAE2 46
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1106:
		.4byte anim_data__1106_0




.align 2, 0
	anim_data__1107_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB10 34
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1107:
		.4byte anim_data__1107_0




.align 2, 0
	anim_data__1108_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB32 46
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1108:
		.4byte anim_data__1108_0




.align 2, 0
	anim_data__1109_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB60 38
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1109:
		.4byte anim_data__1109_0




.align 2, 0
	anim_data__1110_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2AB86 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1110:
		.4byte anim_data__1110_0




.align 2, 0
	anim_data__1111_0:
		mGetPalette 0xE5 16 0xB0
		mGetTiles 0x2ABA4 30
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1111:
		.4byte anim_data__1111_0




.align 2, 0
	anim_data__1112_0:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABC2 18
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1112_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABD4 18
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1112_2:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABE6 18
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1112_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ABF8 18
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1112_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2AC0A 18
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1112:
		.4byte anim_data__1112_0
		.4byte anim_data__1112_1
		.4byte anim_data__1112_2
		.4byte anim_data__1112_3
		.4byte anim_data__1112_4




.align 2, 0
	anim_data__1113_0:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AC1C 84
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1113_1:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AC70 84
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1113_2:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2ACC4 84
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1113_3:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AD18 84
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1113_4:
		mGetPalette 0x2DD 16 0xC0
		mGetTiles 0x2AD6C 84
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1113:
		.4byte anim_data__1113_0
		.4byte anim_data__1113_1
		.4byte anim_data__1113_2
		.4byte anim_data__1113_3
		.4byte anim_data__1113_4




.align 2, 0
	anim_data__1114_0:
		mGetPalette 0xAC 16 0x80
		mGetTiles 0x2ADC0 9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1114_1:
		mGetPalette 0xAC 16 0x80
		mGetTiles 0x2ADC9 9
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1114_2:
		mGetPalette 0xAC 16 0x80
		mGetTiles 0x2ADD2 9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1114_3:
		mGetPalette 0xAC 16 0x80
		mGetTiles 0x2ADDB 9
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1114_4:
		mGetPalette 0xAC 16 0x80
		mGetTiles 0x2ADE4 9
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1114:
		.4byte anim_data__1114_0
		.4byte anim_data__1114_1
		.4byte anim_data__1114_2
		.4byte anim_data__1114_3
		.4byte anim_data__1114_4




.align 2, 0
	anim_data__1115_0:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ADED 36
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1115_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2ADED 36
		.4byte	1, 0

		mGetTiles 0x2AE11 36
		.4byte	1, 1

		mGetTiles 0x2AE35 36
		.4byte	1, 2

		mGetTiles 0x2AE59 36
		.4byte	1, 3

		mGetTiles 0x2AE7D 36
		.4byte	1, 4

		mGetTiles 0x2AEA1 36
		.4byte	1, 5

		mGetTiles 0x2AEC5 36
		.4byte	1, 6

		mGetTiles 0x2AEE9 30
		.4byte	1, 7

		mGetTiles 0x2AF07 30
		.4byte	1, 8

		mGetTiles 0x2AF25 30
		.4byte	1, 9

		mGetTiles 0x2AF43 30
		.4byte	1, 10

		mGetTiles 0x2AF61 30
		.4byte	1, 11

		mGetTiles 0x2AF7F 25
		.4byte	1, 12

		mGetTiles 0x2AF98 25
		.4byte	1, 13

		mGetTiles 0x2AFB1 25
		.4byte	1, 14

		mGetTiles 0x2AFCA 25
		.4byte	1, 15

		mGetTiles 0x2AFE3 25
		.4byte	1, 16

		mGetTiles 0x2AFFC 20
		.4byte	1, 17

		mGetTiles 0x2B010 20
		.4byte	1, 18

		mGetTiles 0x2B024 20
		.4byte	1, 19

		mGetTiles 0x2B038 20
		.4byte	1, 20

		mGetTiles 0x2B04C 20
		.4byte	1, 21

		mGetTiles 0x2B060 25
		.4byte	1, 22

		mGetTiles 0x2B079 25
		.4byte	1, 23

		mGetTiles 0x2B092 25
		.4byte	1, 24

		mGetTiles 0x2B0AB 25
		.4byte	1, 25

		mGetTiles 0x2B0C4 25
		.4byte	1, 26

		mGetTiles 0x2B0DD 30
		.4byte	1, 27

		mGetTiles 0x2B0FB 30
		.4byte	1, 28

		mGetTiles 0x2B119 30
		.4byte	1, 29

		mGetTiles 0x2B137 30
		.4byte	1, 30

		mGetTiles 0x2B155 30
		.4byte	1, 31

		mGetTiles 0x2B173 36
		.4byte	1, 32

		mGetTiles 0x2B197 36
		.4byte	1, 33

		mGetTiles 0x2B1BB 36
		.4byte	1, 34

		mGetTiles 0x2B1DF 36
		.4byte	1, 35

		mGetTiles 0x2B203 36
		.4byte	1, 36

		mGetTiles 0x2B227 36
		.4byte	1, 37

		mJumpBack 0xC1


.align 2, 0
	anim_1115:
		.4byte anim_data__1115_0
		.4byte anim_data__1115_1




.align 2, 0
	anim_data__1116_0:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B24B 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1116_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B28B 64
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1116_2:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B2CB 64
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1116_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B30B 64
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1116_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B34B 64
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1116_5:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B38B 64
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1116_6:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B3CB 64
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1116_7:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B40B 64
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1116_8:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B44B 64
		.4byte	1, 8

		mAnimCmd4 


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
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B48B 35
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1117_1:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B4AE 20
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1117_2:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B4C2 20
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1117_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B4D6 35
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1117_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B4F9 35
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1117_5:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B51C 20
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1117_6:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B530 20
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1117_7:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B544 35
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1117_8:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B567 35
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1117_9:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B58A 20
		.4byte	1, 9

		mAnimCmd4 

	anim_data__1117_10:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B59E 20
		.4byte	1, 10

		mJumpBack 0x8

	anim_data__1117_11:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B5B2 35
		.4byte	1, 11

		mAnimCmd4 

	anim_data__1117_12:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B5D5 35
		.4byte	1, 12

		mAnimCmd4 

	anim_data__1117_13:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B5F8 20
		.4byte	1, 13

		mAnimCmd4 

	anim_data__1117_14:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B60C 20
		.4byte	1, 14

		mAnimCmd4 

	anim_data__1117_15:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B620 35
		.4byte	1, 15

		mAnimCmd4 

	anim_data__1117_16:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B643 35
		.4byte	1, 16

		mAnimCmd4 

	anim_data__1117_17:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B666 20
		.4byte	1, 17

		mAnimCmd4 

	anim_data__1117_18:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B67A 20
		.4byte	1, 18

		mAnimCmd4 

	anim_data__1117_19:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B68E 35
		.4byte	1, 19

		mJumpBack 0x8

	anim_data__1117_20:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B6B1 35
		.4byte	1, 20

		mAnimCmd4 

	anim_data__1117_21:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B6D4 20
		.4byte	1, 21

		mAnimCmd4 

	anim_data__1117_22:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B6E8 20
		.4byte	1, 22

		mAnimCmd4 

	anim_data__1117_23:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B6FC 35
		.4byte	1, 23

		mAnimCmd4 

	anim_data__1117_24:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B71F 35
		.4byte	1, 24

		mAnimCmd4 

	anim_data__1117_25:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B742 20
		.4byte	1, 25

		mAnimCmd4 

	anim_data__1117_26:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B756 20
		.4byte	1, 26

		mAnimCmd4 

	anim_data__1117_27:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B76A 35
		.4byte	1, 27

		mAnimCmd4 

	anim_data__1117_28:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B78D 25
		.4byte	1, 28

		mAnimCmd4 

	anim_data__1117_29:
		mGetPalette 0x2DC 16 0xF0
		.4byte	1, -1

		mAnimCmd4 

	anim_data__1117_30:
		mGetPalette 0x2DC 16 0xF0
		.4byte	1, -1

		mAnimCmd4 

	anim_data__1117_31:
		mGetPalette 0x2DC 16 0xF0
		.4byte	1, -1

		mAnimCmd4 

	anim_data__1117_32:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B7A6 35
		.4byte	1, 29

		mAnimCmd4 

	anim_data__1117_33:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B7C9 20
		.4byte	1, 30

		mAnimCmd4 

	anim_data__1117_34:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B7DD 20
		.4byte	1, 31

		mAnimCmd4 

	anim_data__1117_35:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B7F1 35
		.4byte	1, 32

		mAnimCmd4 

	anim_data__1117_36:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B814 35
		.4byte	1, 33

		mAnimCmd4 

	anim_data__1117_37:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B837 20
		.4byte	1, 34

		mAnimCmd4 

	anim_data__1117_38:
		mGetPalette 0x2DE 16 0xF0
		mGetTiles 0x2B84B 20
		.4byte	1, 35

		mAnimCmd4 

	anim_data__1117_39:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B85F 35
		.4byte	1, 36

		mAnimCmd4 


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
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B882 9
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1118_1:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B88B 9
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1118_2:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B894 9
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1118_3:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B89D 9
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1118_4:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8A6 9
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1118_5:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8AF 9
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1118_6:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8B8 9
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1118_7:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8C1 9
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1118_8:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8CA 9
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1118_9:
		mGetPalette 0x2DC 16 0xF0
		mGetTiles 0x2B8D3 9
		.4byte	1, 9

		mAnimCmd4 


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
		mGetPalette 0xA3 16 0x60
		.4byte	1, -1

		mAnimCmd4 

	anim_data__1119_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8DC 2
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1119_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8DE 1
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1119_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8DF 2
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1119_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8E1 2
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1119_5:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8E3 2
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1119_6:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8E5 2
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1119_7:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8E7 1
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1119_8:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8E8 2
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1119_9:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8EA 2
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1119_10:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8EC 2
		.4byte	1, 9

		mAnimCmd4 

	anim_data__1119_11:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8EE 2
		.4byte	1, 10

		mAnimCmd4 

	anim_data__1119_12:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F0 1
		.4byte	1, 11

		mAnimCmd4 

	anim_data__1119_13:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F1 1
		.4byte	1, 12

		mAnimCmd4 

	anim_data__1119_14:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F2 1
		.4byte	1, 13

		mAnimCmd4 

	anim_data__1119_15:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F3 2
		.4byte	1, 14

		mAnimCmd4 

	anim_data__1119_16:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F5 2
		.4byte	1, 15

		mAnimCmd4 

	anim_data__1119_17:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F7 2
		.4byte	1, 16

		mAnimCmd4 

	anim_data__1119_18:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8F9 2
		.4byte	1, 17

		mAnimCmd4 

	anim_data__1119_19:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8FB 2
		.4byte	1, 18

		mAnimCmd4 

	anim_data__1119_20:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8FD 2
		.4byte	1, 19

		mAnimCmd4 

	anim_data__1119_21:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B8FF 2
		.4byte	1, 20

		mAnimCmd4 

	anim_data__1119_22:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B901 2
		.4byte	1, 21

		mAnimCmd4 

	anim_data__1119_23:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B903 2
		.4byte	1, 22

		mAnimCmd4 

	anim_data__1119_24:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B905 2
		.4byte	1, 23

		mAnimCmd4 

	anim_data__1119_25:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B907 2
		.4byte	1, 24

		mAnimCmd4 

	anim_data__1119_26:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B909 2
		.4byte	1, 25

		mAnimCmd4 

	anim_data__1119_27:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B90B 2
		.4byte	1, 26

		mAnimCmd4 

	anim_data__1119_28:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B90D 2
		.4byte	1, 27

		mAnimCmd4 

	anim_data__1119_29:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B90F 2
		.4byte	1, 28

		mAnimCmd4 

	anim_data__1119_30:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B911 2
		.4byte	1, 29

		mAnimCmd4 

	anim_data__1119_31:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B913 2
		.4byte	1, 30

		mAnimCmd4 

	anim_data__1119_32:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B915 2
		.4byte	1, 31

		mAnimCmd4 

	anim_data__1119_33:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B917 2
		.4byte	1, 32

		mAnimCmd4 

	anim_data__1119_34:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B919 2
		.4byte	1, 33

		mAnimCmd4 

	anim_data__1119_35:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B91B 2
		.4byte	1, 34

		mAnimCmd4 

	anim_data__1119_36:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B91D 2
		mAnimCmd6 0x0 0xFF00FF00
		.4byte	1, 35

		mAnimCmd4 

	anim_data__1119_37:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B91F 2
		.4byte	1, 36

		mAnimCmd4 

	anim_data__1119_38:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B921 2
		.4byte	1, 37

		mAnimCmd4 

	anim_data__1119_39:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B923 2
		.4byte	1, 38

		mAnimCmd4 

	anim_data__1119_40:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B925 2
		.4byte	1, 39

		mAnimCmd4 

	anim_data__1119_41:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B927 2
		.4byte	1, 40

		mAnimCmd4 

	anim_data__1119_42:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B929 2
		.4byte	1, 41

		mAnimCmd4 

	anim_data__1119_43:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B92B 2
		.4byte	1, 42

		mAnimCmd4 

	anim_data__1119_44:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B92D 2
		.4byte	1, 43

		mAnimCmd4 

	anim_data__1119_45:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B92F 2
		.4byte	1, 44

		mAnimCmd4 

	anim_data__1119_46:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B931 2
		.4byte	1, 45

		mAnimCmd4 

	anim_data__1119_47:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B933 2
		.4byte	1, 46

		mAnimCmd4 

	anim_data__1119_48:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B935 2
		.4byte	1, 47

		mAnimCmd4 

	anim_data__1119_49:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B937 2
		.4byte	1, 48

		mAnimCmd4 

	anim_data__1119_50:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B939 2
		.4byte	1, 49

		mAnimCmd4 

	anim_data__1119_51:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B93B 2
		.4byte	1, 50

		mAnimCmd4 

	anim_data__1119_52:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B93D 2
		.4byte	1, 51

		mAnimCmd4 

	anim_data__1119_53:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B93F 2
		.4byte	1, 52

		mAnimCmd4 

	anim_data__1119_54:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B941 2
		.4byte	1, 53

		mAnimCmd4 

	anim_data__1119_55:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B943 2
		.4byte	1, 54

		mAnimCmd4 

	anim_data__1119_56:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B945 2
		.4byte	1, 55

		mAnimCmd4 

	anim_data__1119_57:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B947 2
		.4byte	1, 56

		mAnimCmd4 

	anim_data__1119_58:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B949 2
		.4byte	1, 57

		mAnimCmd4 

	anim_data__1119_59:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B94B 2
		.4byte	1, 58

		mAnimCmd4 

	anim_data__1119_60:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B94D 2
		.4byte	1, 59

		mAnimCmd4 

	anim_data__1119_61:
		mGetTiles 0x2B94F 2
		.4byte	1, 60

		mJumpBack 0x5

	anim_data__1119_62:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B951 1
		.4byte	1, 61

		mAnimCmd4 

	anim_data__1119_63:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B952 1
		.4byte	1, 62

		mAnimCmd4 

	anim_data__1119_64:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B953 1
		.4byte	1, 63

		mAnimCmd4 

	anim_data__1119_65:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B954 1
		.4byte	1, 64

		mAnimCmd4 

	anim_data__1119_66:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B955 1
		.4byte	1, 65

		mAnimCmd4 

	anim_data__1119_67:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B956 1
		.4byte	1, 66

		mAnimCmd4 

	anim_data__1119_68:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B957 1
		.4byte	1, 67

		mAnimCmd4 

	anim_data__1119_69:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B958 1
		.4byte	1, 68

		mAnimCmd4 

	anim_data__1119_70:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B959 1
		.4byte	1, 69

		mAnimCmd4 

	anim_data__1119_71:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B95A 2
		.4byte	1, 70

		mAnimCmd4 

	anim_data__1119_72:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B95C 1
		.4byte	1, 71

		mAnimCmd4 

	anim_data__1119_73:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B95D 1
		.4byte	1, 72

		mAnimCmd4 

	anim_data__1119_74:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B95E 2
		.4byte	1, 73

		mAnimCmd4 

	anim_data__1119_75:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B960 1
		mAnimCmd6 0x0 0xD150D15
		.4byte	1, 74

		mAnimCmd4 

	anim_data__1119_76:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B961 1
		.4byte	1, 75

		mAnimCmd4 

	anim_data__1119_77:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B962 1
		.4byte	1, 76

		mAnimCmd4 

	anim_data__1119_78:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B963 1
		.4byte	1, 77

		mAnimCmd4 

	anim_data__1119_79:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B964 1
		.4byte	1, 78

		mAnimCmd4 

	anim_data__1119_80:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B965 2
		.4byte	1, 79

		mAnimCmd4 

	anim_data__1119_81:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B967 2
		.4byte	1, 80

		mAnimCmd4 

	anim_data__1119_82:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B969 1
		.4byte	1, 81

		mAnimCmd4 

	anim_data__1119_83:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96A 1
		.4byte	1, 82

		mAnimCmd4 

	anim_data__1119_84:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96B 1
		.4byte	1, 83

		mAnimCmd4 

	anim_data__1119_85:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96C 1
		.4byte	1, 84

		mAnimCmd4 

	anim_data__1119_86:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96D 1
		.4byte	1, 85

		mAnimCmd4 

	anim_data__1119_87:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96E 1
		.4byte	1, 86

		mAnimCmd4 

	anim_data__1119_88:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B96F 1
		.4byte	1, 87

		mAnimCmd4 

	anim_data__1119_89:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B970 2
		.4byte	1, 88

		mAnimCmd4 

	anim_data__1119_90:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B972 1
		.4byte	1, 89

		mAnimCmd4 

	anim_data__1119_91:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B973 2
		.4byte	1, 90

		mAnimCmd4 

	anim_data__1119_92:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B975 2
		.4byte	1, 91

		mAnimCmd4 

	anim_data__1119_93:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B977 2
		.4byte	1, 92

		mAnimCmd4 

	anim_data__1119_94:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B979 1
		.4byte	1, 93

		mAnimCmd4 


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
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B97A 4
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1120:
		.4byte anim_data__1120_0




.align 2, 0
	anim_data__1121_0:
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B97E 24
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1121_1:
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B996 24
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1121_2:
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B9AE 27
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1121_3:
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B9C9 18
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1121_4:
		mGetPalette 0xAC 16 0x30
		mGetTiles 0x2B9DB 27
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1121:
		.4byte anim_data__1121_0
		.4byte anim_data__1121_1
		.4byte anim_data__1121_2
		.4byte anim_data__1121_3
		.4byte anim_data__1121_4




.align 2, 0
	anim_data__1122_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2B9F6 28
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1122_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA12 36
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1122:
		.4byte anim_data__1122_0
		.4byte anim_data__1122_1




.align 2, 0
	anim_data__1123_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA36 14
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1123_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA44 14
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1123_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA52 16
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1123_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA62 16
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1123_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA72 18
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1123_5:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA84 18
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1123_6:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BA96 18
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1123_7:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BAA8 18
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1123_8:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BABA 18
		.4byte	1, 8

		mAnimCmd4 

	anim_data__1123_9:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BACC 18
		.4byte	1, 9

		mAnimCmd4 

	anim_data__1123_10:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BADE 18
		.4byte	1, 10

		mAnimCmd4 


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
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BAF0 26
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1124_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB0A 26
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1124_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB24 26
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1124:
		.4byte anim_data__1124_0
		.4byte anim_data__1124_1
		.4byte anim_data__1124_2




.align 2, 0
	anim_data__1125_0:
		mGetPalette 0x0 16 0x0
		mGetTiles 0x2BB3E 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1125_1:
		mGetPalette 0x9 16 0x0
		mGetTiles 0x2BB42 4
		mAnimCmd6 0x0 0x20002
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1125_2:
		mGetPalette 0x16 16 0x0
		mGetTiles 0x2BB46 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1125_3:
		mGetPalette 0x7 16 0x0
		mGetTiles 0x2BB4A 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1125_4:
		mGetPalette 0x9F 16 0x0
		mGetTiles 0x2BB4E 4
		.4byte	1, 4

		mAnimCmd4 


.align 2, 0
	anim_1125:
		.4byte anim_data__1125_0
		.4byte anim_data__1125_1
		.4byte anim_data__1125_2
		.4byte anim_data__1125_3
		.4byte anim_data__1125_4




.align 2, 0
	anim_data__1126_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB52 32
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1126:
		.4byte anim_data__1126_0




.align 2, 0
	anim_data__1127_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB72 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1127_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB76 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1127_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB7A 4
		.4byte	1, 2

		mAnimCmd4 

	anim_data__1127_3:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB7E 4
		.4byte	1, 3

		mAnimCmd4 

	anim_data__1127_4:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB82 4
		.4byte	1, 4

		mAnimCmd4 

	anim_data__1127_5:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB86 4
		.4byte	1, 5

		mAnimCmd4 

	anim_data__1127_6:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB8A 4
		.4byte	1, 6

		mAnimCmd4 

	anim_data__1127_7:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB8E 4
		.4byte	1, 7

		mAnimCmd4 

	anim_data__1127_8:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB92 4
		.4byte	1, 8

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB96 4
		.4byte	1, 9

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB9A 4
		.4byte	1, 10

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BB9E 4
		.4byte	1, 11

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBA2 4
		.4byte	1, 12

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBA6 4
		.4byte	1, 13

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBAA 4
		.4byte	1, 14

		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBAE 4
		.4byte	1, 15

		mJumpBack 0x40


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
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBB2 1
		.4byte	119, 0

		mGetTiles 0x2BBB3 1
		.4byte	4, 1

		mGetTiles 0x2BBB4 1
		.4byte	4, 2

		mGetTiles 0x2BBB5 1
		.4byte	4, 3

		mGetTiles 0x2BBB6 1
		.4byte	4, 4

		mGetTiles 0x2BBB2 1
		.4byte	119, 0

		mJumpBack 0x21


.align 2, 0
	anim_1128:
		.4byte anim_data__1128_0




.align 2, 0
	anim_data__1129_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBB7 4
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1129_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBBB 4
		.4byte	1, 1

		mAnimCmd4 

	anim_data__1129_2:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBBF 4
		.4byte	1, 2

		mAnimCmd4 


.align 2, 0
	anim_1129:
		.4byte anim_data__1129_0
		.4byte anim_data__1129_1
		.4byte anim_data__1129_2




.align 2, 0
	anim_data__1130_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BBC3 64
		.4byte	1, 0

		mAnimCmd4 

	anim_data__1130_1:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BC03 64
		.4byte	1, 1

		mAnimCmd4 


.align 2, 0
	anim_1130:
		.4byte anim_data__1130_0
		.4byte anim_data__1130_1




.align 2, 0
	anim_data__1131_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BC43 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1131:
		.4byte anim_data__1131_0




.align 2, 0
	anim_data__1132_0:
		mGetPalette 0xA3 16 0x60
		mGetTiles 0x2BC73 48
		.4byte	1, 0

		mAnimCmd4 


.align 2, 0
	anim_1132:
		.4byte anim_data__1132_0
