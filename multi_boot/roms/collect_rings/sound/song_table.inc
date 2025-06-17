
	.align 2
	.global gSongTable
gSongTable:	@ 0x02016D8C
	song mus_dummy, 0, 0
	song mus_vs_select_pak_mode, 0, 0
	song song002, 0, 0
	song mus_vs_lobby, 0, 0
	song mus_fanfare, 1, 1
	song song005, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song song010, 2, 2
	song se_spin_attack, 2, 2
	song se_spin_dash_release, 2, 2
	song se_brake, 2, 2
	song se_jump, 2, 2
	song se_ring_copy, 3, 3
	song se_rings_lost, 3, 3
	song se_life_lost, 2, 2
	song song018, 2, 2
	song se_item_box_2, 2, 2
	song se_spring, 2, 2
	song se_spikes, 2, 2
	song song022, 2, 2
	song se_216, 2, 2
	song song024, 2, 2
	song se_276, 2, 2
	song se_grinding, 2, 2

	.align 2
	.global mus_dummy
mus_dummy:	@ 0x02016E64
	.byte	0		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	0		@ reverb
