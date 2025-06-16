	.align 2
	.global gMPlayTable
gMPlayTable:	@ 0x02016D5C
	music_player gMPlayInfo_BGM, gMPlayTrack_BGM, 16, 0
	music_player gMPlayInfo_SE1, gMPlayTrack_SE1, 16, 0
	music_player gMPlayInfo_SE2, gMPlayTrack_SE2, 16, 0
	music_player gMPlayInfo_SE3, gMPlayTrack_SE3, 16, 0

