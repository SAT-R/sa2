

anim_data__0906_0:
	mGetPalette 0x109, 16, 0x20
	.4byte	100, -1

	mGetPalette 0x10A, 16, 0x20
	.4byte	8, -1

	mGetPalette 0x10B, 16, 0x20
	.4byte	8, -1

	mGetPalette 0x10C, 16, 0x20
	.4byte	8, -1

	mJumpBack 0x14

anim_data__0906_1:
	mGetPalette 0x10D, 16, 0x30
	.4byte	8, -1

	mGetPalette 0x10E, 16, 0x30
	.4byte	8, -1

	mGetPalette 0x10F, 16, 0x30
	.4byte	100, -1

	mGetPalette 0x110, 16, 0x30
	.4byte	8, -1

	mJumpBack 0x14

anim_data__0906_2:
	mGetPalette 0x111, 16, 0xD0
	.4byte	9, -1

	mGetPalette 0x112, 16, 0xD0
	.4byte	9, -1

	mGetPalette 0x113, 16, 0xD0
	.4byte	9, -1

	mGetPalette 0x114, 16, 0xD0
	.4byte	9, -1

	mJumpBack 0x14


anim_0906:
	.4byte anim_data__0906_0
	.4byte anim_data__0906_1
	.4byte anim_data__0906_2
