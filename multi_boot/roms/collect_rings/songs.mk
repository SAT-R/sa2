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

$(MID_SUBDIR)/se_spin_attack__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/se_spin_dash_release.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75

$(MID_SUBDIR)/se_grinding.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_brake__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_jump__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/se_ring_copy.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/se_rings_lost__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_life_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127

$(MID_SUBDIR)/se_time_up.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V89
    
$(MID_SUBDIR)/se_itembox_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127

$(MID_SUBDIR)/se_151.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V100

$(MID_SUBDIR)/se_spring__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120
    
$(MID_SUBDIR)/se_spikes.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90

$(MID_SUBDIR)/se_alarm_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120

$(MID_SUBDIR)/se_springy_spring__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V108

$(MID_SUBDIR)/se_216__collect_rings.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V118

$(MID_SUBDIR)/se_276.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G3 -P20 -V100

$(MID_SUBDIR)/mus_fanfare.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P255 -V105
