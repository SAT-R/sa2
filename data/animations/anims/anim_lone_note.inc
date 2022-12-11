

anim_lone_note_variant_0:
	mGetPalette 0x6C 16 0x70
	mGetTiles 0x1B006 2
	.4byte	1, 0

	mAnimCmd4 

anim_lone_note_variant_1:
	mGetPalette 0x6C 16 0x70
	mGetTiles 0x1B008 2
	.4byte	1, 1

	mAnimCmd4 


anim_lone_note:
	.4byte anim_lone_note_variant_0
	.4byte anim_lone_note_variant_1
