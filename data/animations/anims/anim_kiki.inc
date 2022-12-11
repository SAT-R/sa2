

anim_kiki_variant_0:
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

anim_kiki_variant_1:
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


anim_kiki:
	.4byte anim_kiki_variant_0
	.4byte anim_kiki_variant_1
