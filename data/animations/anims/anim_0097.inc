
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
