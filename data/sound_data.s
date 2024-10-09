	.include "asm/macros/portable.inc"
	.include "asm/macros/m4a.inc"
	.include "asm/macros/music_voice.inc"
	.include "asm/macros/c_decl.inc"

mSectionRodata
	.include "sound/voice_groups.inc"
	.include "sound/keysplit_tables.inc"
	.include "sound/programmable_wave_data.inc"
	.include "sound/music_player_table.inc"
	.include "sound/song_table.inc"
	.include "sound/direct_sound_data.inc"
