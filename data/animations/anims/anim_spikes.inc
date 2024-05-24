

anim_spikes_variant_0:
	mGetPalette 0x4A, 16, 0x90
	mGetTiles 0x1A940, 16
	mAnimCmd6 0x0, 0xFE8F0
	.4byte	1, 0

	mAnimCmd4 

anim_spikes_variant_1:
	mGetPalette 0x4A, 16, 0x90
	mGetTiles 0x1A950, 4
	.4byte	1, 1

	mAnimCmd4 

anim_spikes_variant_2:
	mGetPalette 0x4A, 16, 0x90
	mGetTiles 0x1A954, 8
	.4byte	1, 2

	mAnimCmd4 

anim_spikes_variant_3:
	mGetPalette 0x4A, 16, 0x90
	mGetTiles 0x1A95C, 16
	mAnimCmd6 0x0, 0xF18F000
	.4byte	1, 3

	mAnimCmd4 


anim_spikes:
	.4byte anim_spikes_variant_0
	.4byte anim_spikes_variant_1
	.4byte anim_spikes_variant_2
	.4byte anim_spikes_variant_3
