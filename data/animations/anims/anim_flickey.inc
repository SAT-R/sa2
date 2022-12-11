

anim_flickey_variant_0:
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

anim_flickey_variant_1:
	mGetPalette 0x3F 16 0xC0
	mGetTiles 0x1A0AB 20
	mAnimCmd6 0x0 0xFC0AE2F6
	.4byte	3, 4

	mGetTiles 0x1A0BF 20
	.4byte	3, 5

	mJumpBack 0x10

anim_flickey_variant_2:
	mGetPalette 0x3F 16 0xC0
	mGetTiles 0x1A0D3 20
	mAnimCmd6 0x0 0xAE6F6
	.4byte	5, 6

	mGetTiles 0x1A0E7 20
	.4byte	5, 7

	mGetTiles 0x1A0FB 16
	.4byte	5, 8

	mAnimCmd4 


anim_flickey:
	.4byte anim_flickey_variant_0
	.4byte anim_flickey_variant_1
	.4byte anim_flickey_variant_2
