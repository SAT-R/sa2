

anim_spike_screen_variant_0:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4B6 42
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 0

	mGetTiles 0x1B4E0 42
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 1

	mJumpBack 0x13

anim_spike_screen_variant_1:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B50A 18
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 2

	mGetTiles 0x1B51C 18
	mAnimCmd6 0x0 0x15300000
	.4byte	8, 3

	mJumpBack 0x13

anim_spike_screen_variant_2:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4B6 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 0

	mAnimCmd4 

anim_spike_screen_variant_3:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B4E0 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 1

	mAnimCmd4 

anim_spike_screen_variant_4:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B52E 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 4

	mAnimCmd4 

anim_spike_screen_variant_5:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B558 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 5

	mAnimCmd4 

anim_spike_screen_variant_6:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B582 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 6

	mAnimCmd4 

anim_spike_screen_variant_7:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B5AC 42
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 7

	mAnimCmd4 

anim_spike_screen_variant_8:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B50A 18
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 2

	mAnimCmd4 

anim_spike_screen_variant_9:
	mGetPalette 0x73 16 0xB0
	mGetTiles 0x1B51C 18
	mAnimCmd6 0x0 0x15300000
	.4byte	1, 3

	mAnimCmd4 


anim_spike_screen:
	.4byte anim_spike_screen_variant_0
	.4byte anim_spike_screen_variant_1
	.4byte anim_spike_screen_variant_2
	.4byte anim_spike_screen_variant_3
	.4byte anim_spike_screen_variant_4
	.4byte anim_spike_screen_variant_5
	.4byte anim_spike_screen_variant_6
	.4byte anim_spike_screen_variant_7
	.4byte anim_spike_screen_variant_8
	.4byte anim_spike_screen_variant_9
