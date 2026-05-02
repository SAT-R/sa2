		.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"
	.include "asm/macros/m4a.inc"
	.include "asm/macros/music_voice.inc"
	.include "asm/macros/c_decl.inc"
    
@; TODO: Convert this all to C
mSectionRodata
	.include "sound/sa1/voice_groups.inc"
	.include "sound/sa1/keysplit_tables.inc"
	.include "sound/sa1/programmable_wave_data.inc"
	.include "sound/sa1/music_player_table.inc"
	.include "sound/sa1/song_table.inc"
	.include "sound/sa1/direct_sound_data.inc"
