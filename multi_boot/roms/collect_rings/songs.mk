STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	@echo "$(AS) <flags> -I sound -o $@ $<"
	@$(PREPROC) $< "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -
    
$(MID_SUBDIR)/mus_vs_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105
    
$(MID_SUBDIR)/mus_vs_3.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105

$(MID_SUBDIR)/mus_vs_lobby.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105
    
$(MID_SUBDIR)/mus_vs_select_pak_mode.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105

$(MID_SUBDIR)/se_select.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_return.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90

$(MID_SUBDIR)/se_spin_attack.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V110
    
$(MID_SUBDIR)/se_spin_dash_release.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75

$(MID_SUBDIR)/se_grinding.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_brake.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_jump.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_ring_copy.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_rings_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V127
    
$(MID_SUBDIR)/se_life_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127

$(MID_SUBDIR)/se_time_up.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V89
    
$(MID_SUBDIR)/se_item_box_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127

$(MID_SUBDIR)/se_151.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V100

$(MID_SUBDIR)/se_spring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120
    
$(MID_SUBDIR)/se_spikes.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90

$(MID_SUBDIR)/se_alarm_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120

$(MID_SUBDIR)/se_springy_spring.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V88

$(MID_SUBDIR)/se_216.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V118

$(MID_SUBDIR)/se_276.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100

$(MID_SUBDIR)/mus_fanfare.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P255 -V105
