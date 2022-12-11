

anim_company_logo_variant_0:
	mGetPalette 0xD6 16 0x0
	mGetTiles 0x21E89 56
	.4byte	1, 0

	mAnimCmd4 

anim_company_logo_variant_1:
	mGetPalette 0xD6 16 0x0
	mGetTiles 0x21EC1 78
	.4byte	1, 1

	mAnimCmd4 

anim_company_logo_variant_2:
	mGetPalette 0xD6 16 0x0
	mGetTiles 0x21F0F 60
	.4byte	1, 2

	mAnimCmd4 

anim_company_logo_variant_3:
	mGetPalette 0xD6 16 0x0
	mGetTiles 0x21F4B 96
	.4byte	1, 3

	mAnimCmd4 


anim_company_logo:
	.4byte anim_company_logo_variant_0
	.4byte anim_company_logo_variant_1
	.4byte anim_company_logo_variant_2
	.4byte anim_company_logo_variant_3
