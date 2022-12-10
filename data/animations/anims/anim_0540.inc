
.align 2, 0
	anim_data__0540_0:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A862 8
		mAnimCmd6 0x0 0x8F2F0
		.4byte	1, 0

		mGetTiles 0x1A86A 8
		.4byte	1, 1

		mGetTiles 0x1A872 8
		.4byte	1, 2

		mJumpBack 0x15

	anim_data__0540_1:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A87A 12
		mAnimCmd6 0x0 0x209F3F0
		.4byte	1, 3

		mGetTiles 0x1A886 12
		.4byte	1, 4

		mGetTiles 0x1A892 12
		.4byte	1, 5

		mJumpBack 0x15

	anim_data__0540_2:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A89E 12
		mAnimCmd6 0x0 0x209F4F0
		.4byte	1, 6

		mGetTiles 0x1A8AA 12
		.4byte	1, 7

		mGetTiles 0x1A8B6 12
		.4byte	1, 8

		mJumpBack 0x15

	anim_data__0540_3:
		mGetPalette 0x49 16 0x70
		mGetTiles 0x1A8C2 16
		mAnimCmd6 0x0 0x709EEF0
		.4byte	1, 9

		mGetTiles 0x1A8D2 16
		.4byte	1, 10

		mGetTiles 0x1A8E2 16
		.4byte	1, 11

		mJumpBack 0x15

	anim_data__0540_4:
		mGetPalette 0x49 16 0x70
		mGetTiles 0x1A8F2 12
		mAnimCmd6 0x0 0x607F2F0
		.4byte	1, 12

		mGetTiles 0x1A8FE 12
		.4byte	1, 13

		mGetTiles 0x1A90A 12
		.4byte	1, 14

		mJumpBack 0x15

	anim_data__0540_5:
		mGetPalette 0x34 16 0x70
		mGetTiles 0x1A916 8
		mAnimCmd6 0x0 0x1000F8F2
		.4byte	1, 15

		mGetTiles 0x1A91E 8
		.4byte	1, 16

		mGetTiles 0x1A926 8
		.4byte	1, 17

		mJumpBack 0x15


.align 2, 0
	anim_0540:
		.4byte anim_data__0540_0
		.4byte anim_data__0540_1
		.4byte anim_data__0540_2
		.4byte anim_data__0540_3
		.4byte anim_data__0540_4
		.4byte anim_data__0540_5
