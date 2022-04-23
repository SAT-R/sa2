STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<

$(MID_SUBDIR)/song0001.s: %.s: %.mid
	$(MID) $< $@ -E -R$(STD_REVERB) -G21
