
	.align 2
	.global gSongTable
gSongTable:	@ 0x02016D8C
	song song000, 0, 0
	song song001, 0, 0
	song song002, 0, 0
	song song003, 0, 0
	song song004, 1, 1
	song song005, 0, 0
	song song000, 0, 0
	song song000, 0, 0
	song song000, 0, 0
	song song000, 0, 0
	song song010, 2, 2
	song song011, 2, 2
	song song012, 2, 2
	song song013, 2, 2
	song song014, 2, 2
	song se_ring_copy, 3, 3
	song song016, 3, 3
	song song017, 2, 2
	song song018, 2, 2
	song song019, 2, 2
	song song020, 2, 2
	song song021, 2, 2
	song song022, 2, 2
	song song023, 2, 2
	song song024, 2, 2
	song song025, 2, 2
	song song026, 2, 2

	.align 2
	.global song000
song000:	@ 0x02016E64
	.byte	0		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	0		@ reverb
