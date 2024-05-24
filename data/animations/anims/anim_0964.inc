

anim_data__0964_0:
	mGetPalette 0x2BA, 16, 0x20
	.4byte	1, -1

	mAnimCmd4 

anim_data__0964_1:
	mGetPalette 0x2BB, 16, 0x40
	.4byte	1, -1

	mAnimCmd4 


anim_0964:
	.4byte anim_data__0964_0
	.4byte anim_data__0964_1
