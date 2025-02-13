## SEGA RALLY CHAMPIONSHIP

SA2 Rom starts at 0x87B0000 in the prototype.

The rom also starts at `0x87B0000` indicating that it's in the middle of the rodata

Starts in the middle of `Map_zone_3_act_1_fg0`.

`Map_zone_3_act_1_fg0` is correct from `0x87B0000`

Zone 3 act 1 header matches

`Tileset_AnimTiles_zone_3_act_2_fg` is the same but truncated from `0x87c0000`

From then, all these are truncated with `0xff`
```map
                0x087c0080                CollHeightMap_zone_3_act_2_fg
                0x087c1c80                CollTileRot_zone_3_act_2_fg
                0x087c2000                CollFlags_zone_3_act_2_fg
                0x087c20e0                Metatiles_zone_3_act_2_fg
                0x087d00c0                Map_zone_3_act_2_fg0
                0x087d5bf8                Map_zone_3_act_2_fg1
                0x087db730                MapHeader_zone_3_act_2_fg0
                0x087db754                MapHeader_zone_3_act_2_fg1
                0x087db778                CollHeader_zone_3_act_2_fg
                0x087db79c                Palette_zone_3_act_boss_fg
                0x087db99c                Tileset_zone_3_act_boss_fg
                0x087dc31c                CollHeightMap_zone_3_act_boss_fg
                0x087dc57c                CollTileRot_zone_3_act_boss_fg
                0x087dc5c8                CollFlags_zone_3_act_boss_fg
                0x087dc5dc                Metatiles_zone_3_act_boss_fg
                0x087dc93c                Map_zone_3_act_boss_fg0
                0x087dca2c                Map_zone_3_act_boss_fg1
                0x087dcb1c                MapHeader_zone_3_act_boss_fg0
                0x087dcb40                MapHeader_zone_3_act_boss_fg1
                0x087dcb64                CollHeader_zone_3_act_boss_fg
                0x087dcb88                Palette_zone_4_act_1_fg
                0x087dcd88                Tileset_zone_4_act_1_fg
                0x087e3e08                CollHeightMap_zone_4_act_1_fg
                0x087e5a28                CollTileRot_zone_4_act_1_fg
                0x087e5dac                CollFlags_zone_4_act_1_fg
                0x087e5e90                Metatiles_zone_4_act_1_fg
                0x087ff030                Map_zone_4_act_1_fg0
                
```

Zone 4 act 1 headers match, but fg0 is corrupted

Zone 4 act 2 matches

Zone 5 differs

Yet to find the headers so can't confirm addresses

Zone 6 act 1 differs
- headers match
- Palette doesn't match
- Anim tiles don't match
- Coll tile rot doesn't match
- Metatiles don't match

Matches until

0x894...
```
                0x0894058c                Tilemap_zone_2_act_1_bg
                0x0894158c                zone_2_act_1_bg
                0x089415a8                Palette_sky_canyon_clouds_foreground
                0x089417a8                Tiles_sky_canyon_clouds_foreground
                0x08942088                Tilemap_sky_canyon_clouds_foreground
                0x08942648                sky_canyon_clouds_foreground
                0x08942664                Palette_zone_5_act_1_bg
                0x08942864                Tiles_zone_5_act_1_bg
                0x089445c4                Tilemap_zone_5_act_1_bg
                0x08944b84                zone_5_act_1_bg
                0x08944ba0                Palette_unk_space_bg
                0x08944da0                Tiles_unk_space_bg
                0x08944fe0                Tilemap_unk_space_bg
                0x089454e0                unk_space_bg
                0x089454fc                Palette_zone_7_act_1_bg
                0x089456fc                Tiles_zone_7_act_1_bg
                0x089476fc                Tilemap_zone_7_act_1_bg
                0x08947efc                zone_7_act_1_bg
                0x08947f18                Palette_zone_6_act_1_bg
                0x08948118                Tiles_zone_6_act_1_bg
                0x08948c18                Tilemap_zone_6_act_1_bg
                0x08949418                zone_6_act_1_bg
                0x08949434                Palette_techno_base_bg_purple_grid
                0x08949634                Tiles_techno_base_bg_purple_grid
                0x08949a74                Tilemap_techno_base_bg_purple_grid
                0x0894a274                techno_base_bg_purple_grid
                0x0894a290                Palette_techno_base_bg_circuit_mask
                0x0894a490                Tiles_techno_base_bg_circuit_mask
                0x0894a650                Tilemap_techno_base_bg_circuit_mask
                0x0894ae50                techno_base_bg_circuit_mask
                0x0894ae6c                Palette_zone_1_act_dummy_bg
                0x0894b06c                Tiles_zone_1_act_dummy_bg
                0x0894d84c                Tilemap_zone_1_act_dummy_bg
                0x0894e04c                zone_1_act_dummy_bg
                0x0894e068                Palette_zone_final_act_ta53_bg
                0x0894e268                Tiles_zone_final_act_ta53_bg
```
To 0x895...

Matches until

0x898...
```map
                0x08980064                Tiles_unknown_message_box_white_small
                0x089801a4                Tilemap_unknown_message_box_white_small
                0x08980348                unknown_message_box_white_small
                0x08980364                Palette_mp_vs_background_text
                0x08980564                Tiles_mp_vs_background_text
                0x089808e4                Tilemap_mp_vs_background_text
                0x089810e4                mp_vs_background_text
                0x08981100                Palette_egg_saucer_wheel_copy
                0x08981300                Tiles_egg_saucer_wheel_copy
                0x089824a0                Tilemap_egg_saucer_wheel_copy
                0x08982628                egg_saucer_wheel_copy
                0x08982644                Palette_regular_final_boss
                0x08982844                Tiles_regular_final_boss
                0x089839e4                Tilemap_regular_final_boss
                0x08983e94                regular_final_boss
                0x08983eb0                Palette_extra_boss_cockpit
                0x089840b0                Tiles_extra_boss_cockpit
                0x08985170                Tilemap_extra_boss_cockpit
                0x089851cc                extra_boss_cockpit
                0x089851e8                Palette_extra_boss_background_copy
                0x089853e8                Tiles_extra_boss_background_copy
                0x089874c8                Tilemap_extra_boss_background_copy
                0x089879c8                extra_boss_background_copy
                0x089879e4                Palette_cutscene_vanilla_kidnapped_full_map
                0x08987be4                Tiles_cutscene_vanilla_kidnapped_full_map
                0x08989a44                Tilemap_cutscene_vanilla_kidnapped_full_map
                0x0898a244                cutscene_vanilla_kidnapped_full_map
                0x0898a260                Palette_cutscene_vanilla_kidnapped_full_map_copy
                0x0898a460                Tiles_cutscene_vanilla_kidnapped_full_map_copy
                0x0898c2c0                Tilemap_cutscene_vanilla_kidnapped_full_map_copy
                0x0898cac0                cutscene_vanilla_kidnapped_full_map_copy
                0x0898cadc                Palette_cutscene_vanilla_kidnapped_super_sonic_art
                0x0898ccdc                Tiles_cutscene_vanilla_kidnapped_super_sonic_art
                0x0898ea3c                Tilemap_cutscene_vanilla_kidnapped_super_sonic_art
                0x0898ec2c                cutscene_vanilla_kidnapped_super_sonic_art
                0x0898ec48                Palette_options_time_record_bg0
                0x0898ee48                Tiles_options_time_record_bg0
                0x0898ee88                Tilemap_options_time_record_bg0
                0x0898f338                options_time_record_bg0
                0x0898f354                Palette_options_enter_name_characters
                0x0898f554                Tiles_options_enter_name_characters

```
To 0x899...

Matches until 

0x8A7...
```
                0x08a70b44                Tilemap_unlocked_tiny_chao_garden_fr
                0x08a70ce8                unlocked_tiny_chao_garden_fr
                0x08a70d04                Palette_storyframe_sonic_finds_friends
                0x08a70f04                Tiles_storyframe_sonic_finds_friends
                0x08a72f84                Tilemap_storyframe_sonic_finds_friends
                0x08a73434                storyframe_sonic_finds_friends
                0x08a73450                Palette_credits_10
                0x08a73650                Tiles_credits_10
                0x08a74430                Tilemap_credits_10
                0x08a748e0                credits_10
                0x08a748fc                Palette_unlocked_tiny_chao_garden_de
                0x08a74afc                Tiles_unlocked_tiny_chao_garden_de
                0x08a75b1c                Tilemap_unlocked_tiny_chao_garden_de
                0x08a75cc0                unlocked_tiny_chao_garden_de
                0x08a75cdc                Palette_storyframe_sonic_pats_tails
                0x08a75edc                Tiles_storyframe_sonic_pats_tails
                0x08a77e9c                Tilemap_storyframe_sonic_pats_tails
                0x08a7834c                storyframe_sonic_pats_tails
                0x08a78368                Palette_credits_11
                0x08a78568                Tiles_credits_11
                0x08a78e48                Tilemap_credits_11
                0x08a792f8                credits_11
                0x08a79314                Palette_unlocked_tiny_chao_garden_it
                0x08a79514                Tiles_unlocked_tiny_chao_garden_it
                0x08a7a0f4                Tilemap_unlocked_tiny_chao_garden_it
                0x08a7a298                unlocked_tiny_chao_garden_it
                0x08a7a2b4                Palette_storyframe_cream_hugs_vanilla
                0x08a7a4b4                Tiles_storyframe_cream_hugs_vanilla
                0x08a7c4d4                Tilemap_storyframe_cream_hugs_vanilla
                0x08a7c984                storyframe_cream_hugs_vanilla
                0x08a7c9a0                Palette_credits_12
                0x08a7cba0                Tiles_credits_12
                0x08a7d4e0                Tilemap_credits_12
                0x08a7d990                credits_12
                0x08a7d9ac                Palette_unlocked_tiny_chao_garden_jp
                0x08a7dbac                Tiles_unlocked_tiny_chao_garden_jp
                0x08a7e80c                Tilemap_unlocked_tiny_chao_garden_jp
                0x08a7ecbc                unlocked_tiny_chao_garden_jp
                0x08a7ecd8                Palette_storyframe_cream_tails_vanilla_look_around
                0x08a7eed8                Tiles_storyframe_cream_tails_vanilla_look_around
```
To 0x8a8...

Matches until

0x8A9...
```
                0x08a90538                Tilemap_unlocked_sound_test_de
                0x08a906dc                unlocked_sound_test_de
                0x08a906f8                Palette_storyframe_sonic_leaves_1
                0x08a908f8                Tiles_storyframe_sonic_leaves_1
                0x08a92cd8                Tilemap_storyframe_sonic_leaves_1
                0x08a93188                storyframe_sonic_leaves_1
                0x08a931a4                Palette_credits_17
                0x08a933a4                Tiles_credits_17
                0x08a94444                Tilemap_credits_17
                0x08a948f4                credits_17
                0x08a94910                Palette_unlocked_sound_test_it
                0x08a94b10                Tiles_unlocked_sound_test_it
                0x08a957f0                Tilemap_unlocked_sound_test_it
                0x08a95994                unlocked_sound_test_it
                0x08a959b0                Palette_storyframe_sonic_leaves_10
                0x08a95bb0                Tiles_storyframe_sonic_leaves_10
                0x08a97fd0                Tilemap_storyframe_sonic_leaves_10
                0x08a98480                storyframe_sonic_leaves_10
                0x08a9849c                Palette_credits_18
                0x08a9869c                Tiles_credits_18
                0x08a98fdc                Tilemap_credits_18
                0x08a9948c                credits_18
                0x08a994a8                Palette_unlocked_sound_test_jp
                0x08a996a8                Tiles_unlocked_sound_test_jp
                0x08a9a428                Tilemap_unlocked_sound_test_jp
                0x08a9a5cc                unlocked_sound_test_jp
                0x08a9a5e8                Palette_storyframe_sonic_leaves_2
                0x08a9a7e8                Tiles_storyframe_sonic_leaves_2
                0x08a9cbc8                Tilemap_storyframe_sonic_leaves_2
                0x08a9d078                storyframe_sonic_leaves_2
                0x08a9d094                Palette_credits_19
                0x08a9d294                Tiles_credits_19
                0x08a9d814                Tilemap_credits_19
                0x08a9dcc4                credits_19
                0x08a9dce0                Palette_unlocked_sound_test_es
                0x08a9dee0                Tiles_unlocked_sound_test_es
                0x08a9ef80                Tilemap_unlocked_sound_test_es
                0x08a9f124                unlocked_sound_test_es
                0x08a9f140                Palette_storyframe_sonic_leaves_3
                0x08a9f340                Tiles_storyframe_sonic_leaves_3
```
To 0x8AA...

Matches until

0x8AA...
```
                0x08aa1700                Tilemap_storyframe_sonic_leaves_3
                0x08aa1bb0                storyframe_sonic_leaves_3
                0x08aa1bcc                Palette_credits_20
                0x08aa1dcc                Tiles_credits_20
                0x08aa30ac                Tilemap_credits_20
                0x08aa355c                credits_20
                0x08aa3578                Palette_unlocked_bosses_time_attack_en
                0x08aa3778                Tiles_unlocked_bosses_time_attack_en
                0x08aa43b8                Tilemap_unlocked_bosses_time_attack_en
                0x08aa455c                unlocked_bosses_time_attack_en
                0x08aa4578                Palette_storyframe_sonic_leaves_4
                0x08aa4778                Tiles_storyframe_sonic_leaves_4
                0x08aa67f8                Tilemap_storyframe_sonic_leaves_4
                0x08aa6ca8                storyframe_sonic_leaves_4
                0x08aa6cc4                Palette_credits_21
                0x08aa6ec4                Tiles_credits_21
                0x08aa7744                Tilemap_credits_21
                0x08aa7bf4                credits_21
                0x08aa7c10                Palette_unlocked_bosses_time_attack_fr
                0x08aa7e10                Tiles_unlocked_bosses_time_attack_fr
                0x08aa8d90                Tilemap_unlocked_bosses_time_attack_fr
                0x08aa8f34                unlocked_bosses_time_attack_fr
                0x08aa8f50                Palette_storyframe_sonic_leaves_5
                0x08aa9150                Tiles_storyframe_sonic_leaves_5
                0x08aab210                Tilemap_storyframe_sonic_leaves_5
                0x08aab6c0                storyframe_sonic_leaves_5
                0x08aab6dc                Palette_credits_22
                0x08aab8dc                Tiles_credits_22
                0x08aac95c                Tilemap_credits_22
                0x08aace0c                credits_22
                0x08aace28                Palette_unlocked_bosses_time_attack_de
                0x08aad028                Tiles_unlocked_bosses_time_attack_de
                0x08aadea8                Tilemap_unlocked_bosses_time_attack_de
                0x08aae04c                unlocked_bosses_time_attack_de
                0x08aae068                Palette_storyframe_sonic_leaves_6
                0x08aae268                Tiles_storyframe_sonic_leaves_6
                0x08ab03c8                Tilemap_storyframe_sonic_leaves_6
                0x08ab0878                storyframe_sonic_leaves_6
                0x08ab0894                Palette_credits_23
                0x08ab0a94                Tiles_credits_23
                0x08ab13d4                Tilemap_credits_23
                0x08ab1884                credits_23
                0x08ab18a0                Palette_unlocked_bosses_time_attack_it
                0x08ab1aa0                Tiles_unlocked_bosses_time_attack_it
                0x08ab2bc0                Tilemap_unlocked_bosses_time_attack_it
                0x08ab2d64                unlocked_bosses_time_attack_it
                0x08ab2d80                Palette_storyframe_sonic_leaves_7
                0x08ab2f80                Tiles_storyframe_sonic_leaves_7
                0x08ab52a0                Tilemap_storyframe_sonic_leaves_7
                0x08ab5750                storyframe_sonic_leaves_7
                0x08ab576c                Palette_credits_24
                0x08ab596c                Tiles_credits_24
                0x08ab5dcc                Tilemap_credits_24
                0x08ab627c                credits_24
                0x08ab6298                Palette_unlocked_bosses_time_attack_jp
                0x08ab6498                Tiles_unlocked_bosses_time_attack_jp
                0x08ab7458                Tilemap_unlocked_bosses_time_attack_jp
                0x08ab75fc                unlocked_bosses_time_attack_jp
                0x08ab7618                Palette_storyframe_sonic_leaves_8
                0x08ab7818                Tiles_storyframe_sonic_leaves_8
                0x08ab9c38                Tilemap_storyframe_sonic_leaves_8
                0x08aba0e8                storyframe_sonic_leaves_8
                0x08aba104                Palette_credits_copyright
                0x08aba304                Tiles_credits_copyright
                0x08abaa24                Tilemap_credits_copyright
                0x08abaad8                credits_copyright
                0x08abaaf4                Palette_unlocked_bosses_time_attack_es
                0x08abacf4                Tiles_unlocked_bosses_time_attack_es
                0x08abba94                Tilemap_unlocked_bosses_time_attack_es
                0x08abbc38                unlocked_bosses_time_attack_es
                0x08abbc54                Palette_storyframe_sonic_leaves_9
                0x08abbe54                Tiles_storyframe_sonic_leaves_9
                0x08abe274                Tilemap_storyframe_sonic_leaves_9
                0x08abe724                storyframe_sonic_leaves_9
                0x08abe740                Palette_credits_presented_by_sega
                0x08abe940                Tiles_credits_presented_by_sega
                0x08abff20                Tilemap_credits_presented_by_sega
                0x08ac03d0                credits_presented_by_sega
                0x08ac03ec                Palette_unlocked_amy_en
                0x08ac05ec                Tiles_unlocked_amy_en
                0x08ac0eec                Tilemap_unlocked_amy_en
                0x08ac1090                unlocked_amy_en
                0x08ac10ac                Palette_storyframe_cream_unlock_0_sepia
                0x08ac12ac                Tiles_storyframe_cream_unlock_0_sepia
                0x08ac2f8c                Tilemap_storyframe_cream_unlock_0_sepia
                0x08ac343c                storyframe_cream_unlock_0_sepia
                0x08ac3458                Palette_unused_credits_frame_manual_production_copy
                0x08ac3658                Tiles_unused_credits_frame_manual_production_copy
                0x08ac4858                Tilemap_unused_credits_frame_manual_production_copy
                0x08ac4d08                unused_credits_frame_manual_production_copy
                0x08ac4d24                Palette_unlocked_amy_fr
                0x08ac4f24                Tiles_unlocked_amy_fr
                0x08ac5d44                Tilemap_unlocked_amy_fr
                0x08ac5ee8                unlocked_amy_fr
                0x08ac5f04                Palette_storyframe_cream_unlock_1_sepia
                0x08ac6104                Tiles_storyframe_cream_unlock_1_sepia
                0x08ac7bc4                Tilemap_storyframe_cream_unlock_1_sepia
                0x08ac8074                storyframe_cream_unlock_1_sepia
                0x08ac8090                Palette_unlocked_amy_de
                0x08ac8290                Tiles_unlocked_amy_de
                0x08ac9210                Tilemap_unlocked_amy_de
                0x08ac93b4                unlocked_amy_de
                0x08ac93d0                Palette_storyframe_tails_unlock_1_sepia
                0x08ac95d0                Tiles_storyframe_tails_unlock_1_sepia
                0x08acb1b0                Tilemap_storyframe_tails_unlock_1_sepia
                0x08acb660                storyframe_tails_unlock_1_sepia
                0x08acb67c                Palette_cutscene_post_extra_boss_bg
                0x08acb87c                Tiles_cutscene_post_extra_boss_bg
                0x08accc5c                Tilemap_cutscene_post_extra_boss_bg
                0x08acdc5c                cutscene_post_extra_boss_bg
 src/lib/m4a/m4a_tables.o(.rodata)
 .rodata        0x08acdc78      0x2d8 src/lib/m4a/m4a_tables.o
                0x08acdc78                gMPlayJumpTableTemplate
                0x08acdd08                gScaleTable
                0x08acddbc                gFreqTable
                0x08acddec                gPcmSamplesPerVBlankTable
                0x08acde04                gCgbScaleTable
                0x08acde88                gCgbFreqTable
                0x08acdea0                gNoiseTable
                0x08acdedc                gCgb3Vol
                0x08acdeec                gClockTable
                0x08acdf20                gXcmdTable
 data/sound_data.o(.rodata)
 .rodata        0x08acdf50   0x18564b data/sound_data.o
                0x08acdf50                voicegroup000
                0x08ace3a0                voicegroup001
                0x08ace550                voicegroup002
                0x08ace784                voicegroup003
                0x08acebd4                voicegroup004
                0x08aced90                voicegroup005
                0x08acf384                voicegroup006
                0x08acf510                voicegroup007
                0x08acfb10                voicegroup008
                0x08ad0110                voicegroup009
                0x08ad0710                voicegroup010
                0x08ad0d10                voicegroup011
                0x08ad1160                voicegroup012
                0x08ad1544                voicegroup013
                0x08ad1b44                voicegroup014
                0x08ad1f94                voicegroup015
                0x08ad2108                voicegroup016
                0x08ad2558                voicegroup017
                0x08ad2948                voicegroup018
                0x08ad2abc                voicegroup019
                0x08ad30bc                voicegroup020
                0x08ad36bc                voicegroup021
                0x08ad3cbc                voicegroup022
                0x08ad42bc                voicegroup023
                0x08ad470c                voicegroup024
                0x08ad4f1c                gMPlayTable
                0x08ad4f4c                gSongTable
                0x08ad5f28                DirectSoundWaveData_1
                0x08ad73fc                DirectSoundWaveData_2
                0x08ad8810                DirectSoundWaveData_3
                0x08ad9140                DirectSoundWaveData_4
                0x08ad98b0                DirectSoundWaveData_5
                0x08adb1a4                DirectSoundWaveData_6
                0x08ade2d0                DirectSoundWaveData_7
                0x08ade918                DirectSoundWaveData_8
```
To 0x8AE...

Matches until

0x8AF...
```
                0x08af0160                DirectSoundWaveData_16
                0x08af2584                DirectSoundWaveData_17
```
To 0x8B0...


Matches until

0x8B3...
```
                0x08af2584                DirectSoundWaveData_17
```
To 0x8B4...

Matches until

0x8B5...
```
                0x08af2584                DirectSoundWaveData_17
```
To 0x8B6...


Matches until

0x8B7...
```
                0x08af2584                DirectSoundWaveData_17
```
To 0x8B8...

Matches until

0x8C0...
```
                0x08af2584                DirectSoundWaveData_17
 *fill*         0x08c5359b        0x1 00000000
 .rodata        0x08c5359c      0x8d0 sound/songs/midi/mus_intro.o
                0x08c53e40                mus_intro
```
To 0x8BD...

Rest of the rom matches.



Conclusion:

Yet to be determined, but initial investigation indicates this is the **ACTUAL** SA2 Europe rom which was somehow interlaced into the
rally rom.

It's possible that when they compiled the rom the linker memory was not clean? It doesn't make much sense.

Give away factors so far:

- Why do all the memory addresses align perfectly with the real rom?
- Why does the data which differs happen to align on memory boundaries?
- Why are some of the differences just corrupts
