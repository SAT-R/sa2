	.section .rodata

.include "../asm/macros/m4a.inc"
.include "../asm/macros/music_voice.inc"

.include "sound/voicegroups/voicegroup000.inc"
.include "sound/voicegroups/voicegroup001.inc"

	.align 2
	.global ProgrammableWaveData_201A3E4
ProgrammableWaveData_201A3E4:
	.incbin "sound/programmable_wave_samples/0201A3E4.pcm"

	.align 2
	.global ProgrammableWaveData_201A3F4
ProgrammableWaveData_201A3F4:
	.incbin "sound/programmable_wave_samples/0201A3F4.pcm"

	.align 2
	.global ProgrammableWaveData_201A404
ProgrammableWaveData_201A404:
	.incbin "sound/programmable_wave_samples/0201A404.pcm"

	.align 2
	.global ProgrammableWaveData_201A414
ProgrammableWaveData_201A414:
	.incbin "sound/programmable_wave_samples/0201A414.pcm"

	.align 2
	.global ProgrammableWaveData_201A424
ProgrammableWaveData_201A424:
	.incbin "sound/programmable_wave_samples/0201A424.pcm"

	.align 2
	.global ProgrammableWaveData_201A434
ProgrammableWaveData_201A434:
	.incbin "sound/programmable_wave_samples/0201A434.pcm"

	.align 2
	.global ProgrammableWaveData_201A444
ProgrammableWaveData_201A444:
	.incbin "sound/programmable_wave_samples/0201A444.pcm"

	.align 2
	.global ProgrammableWaveData_201A454
ProgrammableWaveData_201A454:
	.incbin "sound/programmable_wave_samples/0201A454.pcm"

	.align 2
	.global ProgrammableWaveData_201A464
ProgrammableWaveData_201A464:
	.incbin "sound/programmable_wave_samples/0201A464.pcm"

	.align 2
	.global gMPlayTable
gMPlayTable:	@ 0x0201A474
	music_player gUnknown_030063C0, gUnknown_03001B20, 16, 0
	music_player gUnknown_03006400, gUnknown_03002020, 16, 0
	music_player gUnknown_03006440, gUnknown_03002520, 16, 0
	music_player gUnknown_03006490, gUnknown_03002A20, 16, 0

	.align 2
	.global gSongTable
gSongTable:	@ 0x0201A4A4
	song dummy_song_header, 0, 0
	song song0001, 0, 0
	song song0002, 0, 0
	song dummy_song_header, 0, 0
	song song0004, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song dummy_song_header, 0, 0
	song song0011, 2, 2
	song song0012, 2, 2
	song song0013, 2, 2
	song song0014, 2, 2
	song song0015, 2, 2
	song song0016, 2, 2
	song song0017, 2, 2
	song song0018, 2, 2
	song song0019, 2, 2
	song song0020, 2, 2
	song song0021, 2, 2
	song song0022, 2, 2
	song song0023, 2, 2
	song song0024, 2, 2
	song song0025, 2, 2
	song song0026, 2, 2
	song song0027, 2, 2
	song song0028, 2, 2
	song song0029, 2, 2
	song song0030, 2, 2
	song song0031, 2, 2
	song song0032, 2, 2
	song song0033, 2, 2
	song song0034, 2, 2
	song song0035, 2, 2
	song song0036, 2, 2

	.align 2
dummy_song_header:
	.byte 0, 0, 0, 0

	.align 2
	.global DirectSoundData_0201A5D0
DirectSoundData_0201A5D0:
	.incbin "sound/direct_sound_samples/0201A5D0.bin"

	.align 2
	.global DirectSoundData_0201AC64
DirectSoundData_0201AC64:
	.incbin "sound/direct_sound_samples/0201AC64.bin"

	.align 2
	.global DirectSoundData_0201B3E4
DirectSoundData_0201B3E4:
	.incbin "sound/direct_sound_samples/0201B3E4.bin"

	.align 2
	.global DirectSoundData_0201C77C
DirectSoundData_0201C77C:
	.incbin "sound/direct_sound_samples/0201C77C.bin"

	.align 2
	.global DirectSoundData_0201CE90
DirectSoundData_0201CE90:
	.incbin "sound/direct_sound_samples/0201CE90.bin"

	.align 2
	.global DirectSoundData_0201D2B4
DirectSoundData_0201D2B4:
	.incbin "sound/direct_sound_samples/0201D2B4.bin"

	.align 2
	.global DirectSoundData_0201DBEC
DirectSoundData_0201DBEC:
	.incbin "sound/direct_sound_samples/0201DBEC.bin"
