

anim_cloud_variant_0:
	mGetTiles 0x1962D 64
	mGetPalette 0x32 16 0x90
	mAnimCmd6 0x0 0xFF0EE3F1
	.4byte	6, 0

	mAnimCmd6 0x0 0xFF0EE3F1
	.4byte	6, 1

	mAnimCmd6 0x0 0xFF0EE3F1
	.4byte	6, 2

	mAnimCmd6 0x0 0xFF0EE3F1
	.4byte	6, 3

	mAnimCmd4 


anim_cloud:
	.4byte anim_cloud_variant_0
