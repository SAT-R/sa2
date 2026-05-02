.equiv NUM_TRACKS_BGM, 16
.equiv NUM_TRACKS_SE1, 16
.equiv NUM_TRACKS_SE2, 16
.equiv NUM_TRACKS_SE3, 16

	mSectionRodata

	mAlignWord
	.global C_DECL(gMPlayTable)
C_DECL(gMPlayTable):
	music_player C_DECL(gMPlayInfo_BGM), C_DECL(gMPlayTrack_BGM), NUM_TRACKS_BGM, 0
mAlignWord
	music_player C_DECL(gMPlayInfo_SE1), C_DECL(gMPlayTrack_SE1), NUM_TRACKS_SE1, 0
mAlignWord
	music_player C_DECL(gMPlayInfo_SE2), C_DECL(gMPlayTrack_SE2), NUM_TRACKS_SE2, 0
mAlignWord
	music_player C_DECL(gMPlayInfo_SE3), C_DECL(gMPlayTrack_SE3), NUM_TRACKS_SE3, 0
