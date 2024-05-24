

anim_msg_jp_try_again_variant_0:
	mGetPalette 0x2C6, 16, 0x60
	mGetTiles 0x275B3, 22
	.4byte	1, 0

	mAnimCmd4 

anim_msg_jp_try_again_variant_1:
	mGetPalette 0x2C6, 16, 0x60
	mGetTiles 0x275C9, 32
	.4byte	1, 1

	mAnimCmd4 

anim_msg_jp_try_again_variant_2:
	mGetPalette 0x2C6, 16, 0x60
	mGetTiles 0x275E9, 22
	.4byte	1, 2

	mAnimCmd4 

anim_msg_jp_try_again_variant_3:
	mGetPalette 0x2C6, 16, 0x60
	mGetTiles 0x275FF, 22
	.4byte	1, 3

	mAnimCmd4 

anim_msg_jp_try_again_variant_4:
	mGetPalette 0x2C6, 16, 0x60
	mGetTiles 0x27615, 10
	.4byte	1, 4

	mAnimCmd4 

anim_msg_jp_try_again_variant_5:
	mGetPalette 0x2C7, 16, 0x70
	.4byte	1, -1

	mAnimCmd4 


anim_msg_jp_try_again:
	.4byte anim_msg_jp_try_again_variant_0
	.4byte anim_msg_jp_try_again_variant_1
	.4byte anim_msg_jp_try_again_variant_2
	.4byte anim_msg_jp_try_again_variant_3
	.4byte anim_msg_jp_try_again_variant_4
	.4byte anim_msg_jp_try_again_variant_5
