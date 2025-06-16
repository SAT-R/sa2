.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"
.include "../../../asm/macros/m4a.inc"
.include "../../../asm/macros/music_voice.inc"

.section .rodata

.include "sound/voicegroups/voicegroup000.inc"
.include "sound/voicegroups/voicegroup001.inc"
.include "sound/voicegroups/voicegroup002.inc"
	.align 2
	.global ProgrammableWaveData_2016CCC
ProgrammableWaveData_2016CCC:
	.incbin "sound/programmable_wave_samples/02016CCC.pcm"

	.align 2
	.global ProgrammableWaveData_2016CDC
ProgrammableWaveData_2016CDC:
	.incbin "sound/programmable_wave_samples/02016CDC.pcm"

	.align 2
	.global ProgrammableWaveData_2016CEC
ProgrammableWaveData_2016CEC:
	.incbin "sound/programmable_wave_samples/02016CEC.pcm"

	.align 2
	.global ProgrammableWaveData_2016CFC
ProgrammableWaveData_2016CFC:
	.incbin "sound/programmable_wave_samples/02016CFC.pcm"

	.align 2
	.global ProgrammableWaveData_2016D0C
ProgrammableWaveData_2016D0C:
	.incbin "sound/programmable_wave_samples/02016D0C.pcm"

	.align 2
	.global ProgrammableWaveData_2016D1C
ProgrammableWaveData_2016D1C:
	.incbin "sound/programmable_wave_samples/02016D1C.pcm"

	.align 2
	.global ProgrammableWaveData_2016D2C
ProgrammableWaveData_2016D2C:
	.incbin "sound/programmable_wave_samples/02016D2C.pcm"

	.align 2
	.global ProgrammableWaveData_2016D3C
ProgrammableWaveData_2016D3C:
	.incbin "sound/programmable_wave_samples/02016D3C.pcm"

	.align 2
	.global ProgrammableWaveData_2016D4C
ProgrammableWaveData_2016D4C:
	.incbin "sound/programmable_wave_samples/02016D4C.pcm"

	.align 2
	.global gMPlayTable
gMPlayTable:	@ 0x02016D5C
	music_player gMPlayInfo_BGM, gMPlayTrack_BGM, 16, 0
	music_player gMPlayInfo_SE1, gMPlayTrack_SE1, 16, 0
	music_player gMPlayInfo_SE2, gMPlayTrack_SE2, 16, 0
	music_player gMPlayInfo_SE3, gMPlayTrack_SE3, 16, 0

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


	.align 2
	.global gUnknown_02016E68
gUnknown_02016E68:
	.incbin "sound/direct_sound_samples/02016E68.bin"

	.align 2
	.global gUnknown_02017368
gUnknown_02017368:
	.incbin "sound/direct_sound_samples/02017368.bin"

	.align 2
	.global gUnknown_020178A0
gUnknown_020178A0:
	.incbin "sound/direct_sound_samples/020178A0.bin"

	.align 2
	.global gUnknown_02017D58
gUnknown_02017D58:
	.incbin "sound/direct_sound_samples/02017D58.bin"

	.align 2
	.global gUnknown_02018260
gUnknown_02018260:
	.incbin "sound/direct_sound_samples/02018260.bin"

	.align 2
	.global gUnknown_020186F4
gUnknown_020186F4:
	.incbin "sound/direct_sound_samples/020186F4.bin"

	.align 2
	.global gUnknown_020197C8
gUnknown_020197C8:
	.incbin "sound/direct_sound_samples/020197C8.bin"

.include "sound/songs/song001.s"
.include "sound/songs/song002.s"
.include "sound/songs/song003.s"
.include "sound/songs/song004.s"
.include "sound/songs/song005.s"
.include "sound/songs/song010.s"
.include "sound/songs/song011.s"
.include "sound/songs/song012.s"
.include "sound/songs/song013.s"
.include "sound/songs/song014.s"
.include "sound/songs/se_ring_copy.s"
.include "sound/songs/song016.s"
.include "sound/songs/song017.s"
.include "sound/songs/song018.s"
.include "sound/songs/song019.s"
.include "sound/songs/song020.s"
.include "sound/songs/song021.s"
.include "sound/songs/song022.s"
.include "sound/songs/song023.s"
.include "sound/songs/song024.s"
.include "sound/songs/song025.s"
.include "sound/songs/song026.s"
