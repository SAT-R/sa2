.equiv TRACK_SIZE, 0x50
.equiv NUM_TRACKS_BGM, 16
.equiv NUM_TRACKS_SE1, 16
.equiv NUM_TRACKS_SE2, 16
.equiv NUM_TRACKS_SE3, 16

#if !PORTABLE
.section ewram_data
#endif

gMPlayTrack_BGM:
    .space TRACK_SIZE * NUM_TRACKS_BGM

gMPlayTrack_SE1:
    .space TRACK_SIZE * NUM_TRACKS_SE1

gMPlayTrack_SE2:
    .space TRACK_SIZE * NUM_TRACKS_SE2

gMPlayTrack_SE3:
    .space TRACK_SIZE * NUM_TRACKS_SE3

	mSectionRodata

	mAlignWord
	.global C_DECL(gMPlayTable)
C_DECL(gMPlayTable):
	music_player C_DECL(gMPlayInfo_BGM), gMPlayTrack_BGM, NUM_TRACKS_BGM, 0
	music_player C_DECL(gMPlayInfo_SE1), gMPlayTrack_SE1, NUM_TRACKS_SE1, 0
	music_player C_DECL(gMPlayInfo_SE2), gMPlayTrack_SE2, NUM_TRACKS_SE2, 0
	music_player C_DECL(gMPlayInfo_SE3), gMPlayTrack_SE3, NUM_TRACKS_SE3, 0
