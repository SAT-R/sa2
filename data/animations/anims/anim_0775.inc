

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


anim_0775:
	.4byte anim_data__0775_0
