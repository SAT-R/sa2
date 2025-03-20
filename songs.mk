STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	@echo "$(AS) <flags> -I sound -o $@ $<"
	@$(PREPROC) $< "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -

$(MID_SUBDIR)/mus_intro.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G21  -V120
    
$(MID_SUBDIR)/mus_title_fanfare.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G11  -V120
    
$(MID_SUBDIR)/mus_character_selection.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/mus_ta_course_selection.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V108
    
$(MID_SUBDIR)/mus_course_selection_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V115
    
$(MID_SUBDIR)/mus_course_selection_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V108
    
$(MID_SUBDIR)/mus_time_attack_menu.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/mus_options.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V100
    
$(MID_SUBDIR)/mus_leaf_forest__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_leaf_forest__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_hot_crater__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_hot_crater__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_music_plant__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_music_plant__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_ice_paradise__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_ice_paradise__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_sky_canyon__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/mus_sky_canyon__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/mus_techno_base__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_techno_base__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V120
    
$(MID_SUBDIR)/mus_egg_utopia__act_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/mus_egg_utopia__act_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/mus_xx__final_zone.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_true_area_53.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V92
    
$(MID_SUBDIR)/mus_invincibility.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/mus_drowning.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G9  -V86
    
$(MID_SUBDIR)/mus_boss.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_boss_pinch.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_boss_knuckles.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/mus_7_boss.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/mus_7_boss_pinch.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/mus_final_boss.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V100
    
$(MID_SUBDIR)/mus_final_boss_pinch.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V100
    
$(MID_SUBDIR)/mus_game_over.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/mus_final_ending.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G20  -V100
    
$(MID_SUBDIR)/mus_extra_ending.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/mus_staff_credits.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/mus_demo_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V100
    
$(MID_SUBDIR)/mus_demo_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G14  -V100
    
$(MID_SUBDIR)/mus_extra_demo_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_extra_demo_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/mus_special_stage_intro.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V100
    
$(MID_SUBDIR)/mus_special_stage.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/mus_special_stage_pinch.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/mus_achievement.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/mus_special_stage_clear.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/mus_special_stage_result.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G9  -V100
    
$(MID_SUBDIR)/mus_chaos_emerald.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G9  -V85
    
$(MID_SUBDIR)/mus_special_stage_result_lose.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V92
    
$(MID_SUBDIR)/mus_vs_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/mus_vs_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/mus_connection_pending.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V110
    
$(MID_SUBDIR)/mus_vs_lobby.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/mus_vs_select_pak_mode.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/se_ring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_shift.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_success.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_abort.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_select.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_return.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_menu_cursor_move.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_spin_attack.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V110
    
$(MID_SUBDIR)/se_spin_dash_release.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_sonic_skid_attack.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_sonic_midair_somersault.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_sonic_insta_shield.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_114.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_brake.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P15 -V75
    
$(MID_SUBDIR)/se_jump.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_ring_copy.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_rings_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V127
    
$(MID_SUBDIR)/se_life_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P40 -V127
    
$(MID_SUBDIR)/se_tails_propeller_flying.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V127
    
$(MID_SUBDIR)/se_tails_tail_swipe.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V107
    
$(MID_SUBDIR)/se_125.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P30 -V100
    
$(MID_SUBDIR)/se_126.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P30 -V110
    
$(MID_SUBDIR)/se_127.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P30 -V120
    
$(MID_SUBDIR)/se_amy_ground_hammer.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_amy_super_hammer_attack.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_amy_hammer_swirl.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_sa1_goal_post.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_item_box.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P50 -V127
    
$(MID_SUBDIR)/se_timer.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/se_stage_result_counter.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_stage_result_counter_done.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_pause_screen.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V110
    
$(MID_SUBDIR)/se_143.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_144.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_145.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_146.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V64
    
$(MID_SUBDIR)/se_spin.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_148.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_time_up.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V89
    
$(MID_SUBDIR)/se_item_box_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P50 -V127
    
$(MID_SUBDIR)/se_151.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/se_checkpoint.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_spring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120
    
$(MID_SUBDIR)/se_spikes.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_speed_booster.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_156.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_157.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V90
    
$(MID_SUBDIR)/se_air_bubble.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_alarm_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_5.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_6.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_7.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_8.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_9.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_alarm_10.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_springy_pole.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V88
    
$(MID_SUBDIR)/se_springy_spring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V88
    
$(MID_SUBDIR)/voice__announcer__sonic_advance_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__sonic.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__tails.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__knuckles.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__amy.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__cream.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__go.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/voice__announcer__congratulations.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/se_map_move.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V96
    
$(MID_SUBDIR)/se_map_214.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_map_move_end.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_216.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_217.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_218.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_219.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_delete_game_data.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_221.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_222.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_223.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_224.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_225.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/se_226.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/se_cream_flying.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_228.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_cream_cheese_attack.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_230.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_231.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_long_brake.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P15 -V100
    
$(MID_SUBDIR)/se_234.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_235.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_236.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_237.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V65
    
$(MID_SUBDIR)/se_238.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_239.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_241.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_242.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_243.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_244.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_245.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_246.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_248.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_249.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_250.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_251.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_252.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_253.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_254.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_255.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/se_256.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V92
    
$(MID_SUBDIR)/se_257.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_258.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_259.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_260.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_261.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_262.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_263.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_264.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_265.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_266.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_267.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_268.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_269.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_suction.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_271.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_272.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_273.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_274.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/se_275.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_276.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_277.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_278.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_279.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_280.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_281.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/se_282.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/se_283.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_284.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/se_285.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_286.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/se_287.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_288.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_289.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_290.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_291.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_ice_paradise_slide.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/se_293.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_techno_base_note_block.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_295.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_296.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_297.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/se_special_ring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P40 -V100
    
$(MID_SUBDIR)/se_music_plant_spring_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_spring_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_spring_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_spring_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_crash_hit.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_5.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_6.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_7.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_notes_8.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_5.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_glockenspiel_6.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_enter_horn.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_exit_horn.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_enter_horn2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_exit_horn2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_horn3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_chord.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/se_music_plant_piano.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_flute_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_flute_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_flute_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_music_plant_flute_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_331.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_332.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/se_333.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/mus_act_clear.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G8  -V103
    
$(MID_SUBDIR)/mus_boss_clear.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G8  -V107
    
$(MID_SUBDIR)/mus_final_clear.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G8  -V110
    
$(MID_SUBDIR)/mus_extra_clear.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G8  -V100
    
$(MID_SUBDIR)/mus_time_attack_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V110
    
$(MID_SUBDIR)/mus_time_attack_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G22  -V99
    
$(MID_SUBDIR)/mus_1_up.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/mus_message_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V105
    
$(MID_SUBDIR)/mus_got_all_chaos_emeralds.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V90
    
$(MID_SUBDIR)/mus_fanfare.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G23 -P255 -V105
    
$(MID_SUBDIR)/mus_vs_exit.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/mus_vs_success.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/mus_vs_miss.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/mus_message.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G13  -V105
    
$(MID_SUBDIR)/mus_504.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V105
    
$(MID_SUBDIR)/mus_505.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V110
    
$(MID_SUBDIR)/mus_506.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G10  -V110
