STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	@echo "$(AS) <flags> -I sound -o $@ $<"
	@$(AS) $(ASFLAGS) -I sound -o $@ $<

$(MID_SUBDIR)/song0001.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V100
    
$(MID_SUBDIR)/song0002.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V120
    
$(MID_SUBDIR)/song0004.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0  -V100
    
$(MID_SUBDIR)/song0011.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V85
    
$(MID_SUBDIR)/song0012.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0013.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V66
    
$(MID_SUBDIR)/song0014.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/song0015.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V80
    
$(MID_SUBDIR)/song0016.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0017.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V68
    
$(MID_SUBDIR)/song0018.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V80
    
$(MID_SUBDIR)/song0019.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0020.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0021.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0022.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0023.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V115
    
$(MID_SUBDIR)/song0024.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0025.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0026.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
    
$(MID_SUBDIR)/song0027.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0028.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
    
$(MID_SUBDIR)/song0029.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0030.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0031.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song0032.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0033.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V127
    
$(MID_SUBDIR)/song0034.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V95
    
$(MID_SUBDIR)/song0035.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/song0036.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V105
