	.align 2
	.global gSongTable
gSongTable:	@ 0x0201A4A4
	song dummy_song_header, 0, 0
	song mus_garden, 0, 0
	song mus_goodbye_chao, 0, 0
	song dummy_song_header, 0, 0
	song mus_minigame, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song se_msgbox_select, 2, 2
	song se_confirm, 2, 2
	song song0013, 2, 2
	song se_msgbox, 2, 2
	song se_chao_walk, 2, 2
	song song0016, 2, 2
	song song0017, 2, 2
	song song0018, 2, 2
	song song0019, 2, 2
	song se_snore, 2, 2
	song song0021, 2, 2
	song se_gauge_expands, 2, 2
	song se_minigame_lost, 2, 2
	song song0024, 2, 2
	song song0025, 2, 2
	song se_toy_trumpet, 2, 2
	song song0027, 2, 2
	song song0028, 2, 2
	song song0029, 2, 2
	song song0030, 2, 2
	song se_speech_bubble, 2, 2
	song song0032, 2, 2
	song se_hatch, 2, 2
	song song0034, 2, 2
	song se_gauge_lvl_up, 2, 2
	song se_toy_trumpet_novice, 2, 2

	.align 2
dummy_song_header:
	.byte 0, 0, 0, 0
