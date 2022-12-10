

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


anim_0855:
	.4byte anim_data__0855_0
