	.align 2
	.global gSongTable
gSongTable:	@ 0x0201A4A4
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(mus_garden), 0, 0
	song C_DECL(mus_goodbye_chao), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(mus_minigame), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(dummy_song_header), 0, 0
	song C_DECL(se_msgbox_select), 2, 2
	song C_DECL(se_confirm), 2, 2
	song C_DECL(song0013), 2, 2
	song C_DECL(se_msgbox), 2, 2
	song C_DECL(se_chao_walk), 2, 2
	song C_DECL(song0016), 2, 2
	song C_DECL(song0017), 2, 2
	song C_DECL(song0018), 2, 2
	song C_DECL(song0019), 2, 2
	song C_DECL(se_snore), 2, 2
	song C_DECL(song0021), 2, 2
	song C_DECL(se_gauge_expands), 2, 2
	song C_DECL(se_minigame_lost), 2, 2
	song C_DECL(song0024), 2, 2
	song C_DECL(song0025), 2, 2
	song C_DECL(se_toy_trumpet), 2, 2
	song C_DECL(song0027), 2, 2
	song C_DECL(song0028), 2, 2
	song C_DECL(song0029), 2, 2
	song C_DECL(song0030), 2, 2
	song C_DECL(se_speech_bubble), 2, 2
	song C_DECL(song0032), 2, 2
	song C_DECL(se_hatch), 2, 2
	song C_DECL(song0034), 2, 2
	song C_DECL(se_gauge_lvl_up), 2, 2
	song C_DECL(se_toy_trumpet_novice), 2, 2

	.align 2
C_DECL(dummy_song_header):
	.byte 0, 0, 0, 0
