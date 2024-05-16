.include "asm/macros/c_decl.inc"

.equiv TRACK_SIZE, 0x50
.equiv NUM_TRACKS_BGM, 16
.equiv NUM_TRACKS_SE1, 16
.equiv NUM_TRACKS_SE2, 16
.equiv NUM_TRACKS_SE3, 16

.section ewram_data

C_DECL(gMPlayTrack_BGM):
    .space TRACK_SIZE * NUM_TRACKS_BGM

C_DECL(gMPlayTrack_SE1):
    .space TRACK_SIZE * NUM_TRACKS_SE1

C_DECL(gMPlayTrack_SE2):
    .space TRACK_SIZE * NUM_TRACKS_SE2

C_DECL(gMPlayTrack_SE3):
    .space TRACK_SIZE * NUM_TRACKS_SE3

	.section .rodata

	.align 2
	.global gMPlayTable
gMPlayTable:
	music_player C_DECL(gMPlayInfo_BGM), C_DECL(gMPlayTrack_BGM), NUM_TRACKS_BGM, 0
	music_player C_DECL(gMPlayInfo_SE1), C_DECL(gMPlayTrack_SE1), NUM_TRACKS_SE1, 0
	music_player C_DECL(gMPlayInfo_SE2), C_DECL(gMPlayTrack_SE2), NUM_TRACKS_SE2, 0
	music_player C_DECL(gMPlayInfo_SE3), C_DECL(gMPlayTrack_SE3), NUM_TRACKS_SE3, 0
