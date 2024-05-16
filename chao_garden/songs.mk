STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	@echo "$(AS) <flags> -I sound -o $@ $<"
	@$(PREPROC) $< "" | $(ASM_PSEUDO_OP_CONV) | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@

$(MID_SUBDIR)/mus_garden.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V100
    
$(MID_SUBDIR)/mus_goodbye_chao.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/mus_minigame.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V100
    
$(MID_SUBDIR)/se_msgbox_select.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V85
    
$(MID_SUBDIR)/se_confirm.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0013.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V66
    
$(MID_SUBDIR)/se_msgbox.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/se_chao_walk.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V80
    
$(MID_SUBDIR)/song0016.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0017.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V68
    
$(MID_SUBDIR)/song0018.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V80
    
$(MID_SUBDIR)/song0019.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_snore.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0021.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_gauge_expands.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_minigame_lost.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V115
    
$(MID_SUBDIR)/song0024.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0025.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_toy_trumpet.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
    
$(MID_SUBDIR)/song0027.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0028.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
    
$(MID_SUBDIR)/song0029.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0030.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_speech_bubble.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song0032.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/se_hatch.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song0034.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/se_gauge_lvl_up.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/se_toy_trumpet_novice.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
