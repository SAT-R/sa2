

anim_circus_variant_0:
	mGetPalette 0x3A, 16, 0xD0
	mGetTiles 0x19C8E, 16
	mAnimCmd6 0x0, 0x7E6F9
	.4byte	1, 0

	mAnimCmd4 

anim_circus_variant_1:
	mGetPalette 0x3A, 16, 0xD0
	mGetTiles 0x19C8E, 16
	mAnimCmd6 0x0, 0x7E6F9
	.4byte	3, 0

	mGetTiles 0x19C9E, 12
	.4byte	6, 1

	mAnimCmd4 

anim_circus_variant_2:
	mGetPalette 0x3A, 16, 0xD0
	mGetTiles 0x19CAA, 18
	mAnimCmd6 0x0, 0x7E6F9
	.4byte	1, 2

	mAnimCmd4 

anim_circus_variant_3:
	mGetPalette 0x3A, 16, 0xD0
	mGetTiles 0x19CBC, 20
	mAnimCmd6 0x0, 0x7E6F9
	.4byte	3, 3

	mAnimCmd4 


anim_circus:
	.4byte anim_circus_variant_0
	.4byte anim_circus_variant_1
	.4byte anim_circus_variant_2
	.4byte anim_circus_variant_3
