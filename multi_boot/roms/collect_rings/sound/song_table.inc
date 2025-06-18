
	.align 2
	.global gSongTable
gSongTable:	@ 0x02016D8C
	song mus_dummy, 0, 0
	song mus_vs_select_pak_mode, 0, 0
	song mus_vs_2, 0, 0
	song mus_vs_lobby, 0, 0
	song mus_fanfare, 1, 1
	song mus_vs_3, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song mus_dummy, 0, 0
	song se_select, 2, 2
	song se_spin_attack, 2, 2
	song se_spin_dash_release, 2, 2
	song se_brake, 2, 2
	song se_jump, 2, 2
	song se_ring_copy, 3, 3
	song se_rings_lost, 3, 3
	song se_life_lost, 2, 2
	song se_time_up, 2, 2
	song se_item_box_2, 2, 2
	song se_spring, 2, 2
	song se_spikes, 2, 2
	song se_alarm_1, 2, 2
	song se_216, 2, 2
	song se_springy_spring, 2, 2
	song se_276, 2, 2
	song se_grinding, 2, 2

	.align 2
	.global mus_dummy
mus_dummy:	@ 0x02016E64
	.byte	0		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	0		@ reverb
