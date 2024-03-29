	.equiv TRACK_SIZE, 0x50
	.equiv NUM_TRACKS_BGM, 16
	.equiv NUM_TRACKS_SE1, 16
	.equiv NUM_TRACKS_SE2, 16
	.equiv NUM_TRACKS_SE3, 16

    .section .bss

gMPlayTrack_BGM:
    .space TRACK_SIZE * NUM_TRACKS_BGM
    .size gMPlayTrack_BGM, .-gMPlayTrack_BGM

gMPlayTrack_SE1:
    .space TRACK_SIZE * NUM_TRACKS_SE1
    .size gMPlayTrack_SE1, .-gMPlayTrack_SE1

gMPlayTrack_SE2:
    .space TRACK_SIZE * NUM_TRACKS_SE2
    .size gMPlayTrack_SE2, .-gMPlayTrack_SE2

gMPlayTrack_SE3:
    .space TRACK_SIZE * NUM_TRACKS_SE3
    .size gMPlayTrack_SE3, .-gMPlayTrack_SE3

	.section .rodata

	.align 2
	.global gMPlayTable
gMPlayTable:	@ 0x0201A474
	music_player gMPlayInfo_BGM, gMPlayTrack_BGM, NUM_TRACKS_BGM, 0
	music_player gMPlayInfo_SE1, gMPlayTrack_SE1, NUM_TRACKS_SE1, 0
	music_player gMPlayInfo_SE2, gMPlayTrack_SE2, NUM_TRACKS_SE2, 0
	music_player gMPlayInfo_SE3, gMPlayTrack_SE3, NUM_TRACKS_SE2, 0
