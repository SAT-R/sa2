STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	@echo "$(AS) <flags> -I sound -o $@ $<"
	@$(PREPROC) $< $(PLATFORM) "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -

    # Voicegroup (-G) 003 in SA2!
$(MID_SUBDIR)/se_ring_copy.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V100

$(MID_SUBDIR)/song001.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song002.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song003.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song004.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V108
    
$(MID_SUBDIR)/song005.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song006.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V105
    
$(MID_SUBDIR)/song007.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V108
    
$(MID_SUBDIR)/song008.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V108
    
$(MID_SUBDIR)/song009.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V61
    
$(MID_SUBDIR)/song010.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V115
    
$(MID_SUBDIR)/song011.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V111
    
$(MID_SUBDIR)/song012.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song013.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V127
    
$(MID_SUBDIR)/song014.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song015.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song016.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song017.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song018.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V110
    
$(MID_SUBDIR)/song019.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V105
    
$(MID_SUBDIR)/song020.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V110
    
$(MID_SUBDIR)/song021.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song022.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V110
    
$(MID_SUBDIR)/song023.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song024.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song025.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song026.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song027.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V90
    
$(MID_SUBDIR)/song028.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5  -V115
    
$(MID_SUBDIR)/song029.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song030.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song031.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song032.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/song033.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V103
    
$(MID_SUBDIR)/song034.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5  -V117
    
$(MID_SUBDIR)/song035.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song036.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V100
    
$(MID_SUBDIR)/song037.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song038.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song039.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V127
    
$(MID_SUBDIR)/song040.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R178 -G0  -V127
    
$(MID_SUBDIR)/song041.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song042.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/mus_sp_stage_trick.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V115
    
$(MID_SUBDIR)/song044.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song045.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V85
    
$(MID_SUBDIR)/song046.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V92
    
$(MID_SUBDIR)/song047.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V100
    
$(MID_SUBDIR)/song048.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V103
    
$(MID_SUBDIR)/song049.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G6  -V118
    
$(MID_SUBDIR)/song050.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V105
    
$(MID_SUBDIR)/song051.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V110
    
$(MID_SUBDIR)/song052.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105
    
$(MID_SUBDIR)/song053.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105
    
$(MID_SUBDIR)/song054.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V105
    
$(MID_SUBDIR)/song102.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V100
    
$(MID_SUBDIR)/song103.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song104.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song105.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song106.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song107.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song108.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song109.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V110
    
$(MID_SUBDIR)/song110.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song111.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song112.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song113.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song114.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song115.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song116.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song117.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V100
    
$(MID_SUBDIR)/song118.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V127
    
$(MID_SUBDIR)/song119.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song120.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song121.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V107
    
$(MID_SUBDIR)/song122.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song123.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song124.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V107
    
$(MID_SUBDIR)/song125.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song126.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V110
    
$(MID_SUBDIR)/song127.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song128.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song129.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song130.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song131.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song132.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V110
    
$(MID_SUBDIR)/song133.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V105
    
$(MID_SUBDIR)/song134.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V110
    
$(MID_SUBDIR)/song135.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V120
    
$(MID_SUBDIR)/song136.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V110
    
$(MID_SUBDIR)/song137.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V107
    
$(MID_SUBDIR)/song138.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song139.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song140.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song141.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V120
    
$(MID_SUBDIR)/song142.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V110
    
$(MID_SUBDIR)/song143.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song144.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song145.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song146.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V64
    
$(MID_SUBDIR)/song147.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song148.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song149.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song150.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song151.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song152.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song153.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song154.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7 -P20 -V86
    
$(MID_SUBDIR)/song155.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7 -P20 -V74
    
$(MID_SUBDIR)/song156.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song157.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song158.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song159.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song160.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song161.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song162.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V114
    
$(MID_SUBDIR)/song163.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song164.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song166.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V89
    
$(MID_SUBDIR)/song167.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song168.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/song169.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song170.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V120
    
$(MID_SUBDIR)/song171.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song172.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song173.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song174.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song175.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V88
    
$(MID_SUBDIR)/song176.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V88
    
$(MID_SUBDIR)/song177.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song178.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V55
    
$(MID_SUBDIR)/song179.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song180.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song181.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song182.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song183.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song184.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song185.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V88
    
$(MID_SUBDIR)/song188.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song189.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song190.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song191.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song192.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song193.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song194.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song195.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song196.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song198.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song199.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song200.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song201.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song202.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G4 -P20 -V100
    
$(MID_SUBDIR)/song203.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V88
    
$(MID_SUBDIR)/song204.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song205.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song206.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V85
    
$(MID_SUBDIR)/song207.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V85
    
$(MID_SUBDIR)/song208.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V85
    
$(MID_SUBDIR)/song209.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song210.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song211.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song212.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V72
    
$(MID_SUBDIR)/song213.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V72
    
$(MID_SUBDIR)/song214.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V72
    
$(MID_SUBDIR)/song215.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song216.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song217.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song218.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song219.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song220.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song221.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song222.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song223.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song224.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song301.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V77
    
$(MID_SUBDIR)/song302.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V77
    
$(MID_SUBDIR)/song303.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V77
    
$(MID_SUBDIR)/song304.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V105
    
$(MID_SUBDIR)/song305.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song306.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G7  -V110

$(MID_SUBDIR)/song307.s: %.s: %.mid
	$(MID2AGB) $< $@ -C $(MIDI_COMMENTS) -E -R$(STD_REVERB) -G0  -V120
