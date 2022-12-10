

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


anim_0574:
	.4byte anim_data__0574_0
	.4byte anim_data__0574_1
	.4byte anim_data__0574_2
