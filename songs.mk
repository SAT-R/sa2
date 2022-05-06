STD_REVERB = 0

$(MID_BUILDDIR)/%.o: $(MID_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -I sound -o $@ $<

$(MID_SUBDIR)/mus_intro.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G21  -V120
    
$(MID_SUBDIR)/mus_title_fanfare.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G11  -V120
    
$(MID_SUBDIR)/song0003.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/song0004.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V108
    
$(MID_SUBDIR)/song0005.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V115
    
$(MID_SUBDIR)/song0006.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V108
    
$(MID_SUBDIR)/song0007.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/song0009.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V100
    
$(MID_SUBDIR)/song0013.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0014.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0015.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0016.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0017.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0018.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0019.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0020.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0021.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/song0022.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/song0023.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0024.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V120
    
$(MID_SUBDIR)/song0025.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/song0026.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V110
    
$(MID_SUBDIR)/song0027.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0028.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V92
    
$(MID_SUBDIR)/song0029.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song0031.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G9  -V86
    
$(MID_SUBDIR)/song0032.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0033.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0034.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V110
    
$(MID_SUBDIR)/song0035.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/song0036.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/song0037.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V100
    
$(MID_SUBDIR)/song0038.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V100
    
$(MID_SUBDIR)/song0041.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V110
    
$(MID_SUBDIR)/song0042.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G20  -V100
    
$(MID_SUBDIR)/song0043.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/song0044.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V98
    
$(MID_SUBDIR)/song0045.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V100
    
$(MID_SUBDIR)/song0046.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G14  -V100
    
$(MID_SUBDIR)/song0048.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0049.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V94
    
$(MID_SUBDIR)/song0050.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V100
    
$(MID_SUBDIR)/song0051.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/song0052.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/song0053.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V115
    
$(MID_SUBDIR)/song0054.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/song0055.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G9  -V100
    
$(MID_SUBDIR)/song0056.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G9  -V85
    
$(MID_SUBDIR)/song0057.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V92
    
$(MID_SUBDIR)/song0058.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/song0059.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/song0061.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V110
    
$(MID_SUBDIR)/song0064.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/song0066.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G23  -V105
    
$(MID_SUBDIR)/song0102.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/song0103.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0104.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0105.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/se_select.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_return.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/se_menu_cursor_move.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0109.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V110
    
$(MID_SUBDIR)/song0110.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song0111.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0112.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0113.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song0114.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/song0115.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P15 -V75
    
$(MID_SUBDIR)/song0116.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V75
    
$(MID_SUBDIR)/song0117.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/song0118.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V127
    
$(MID_SUBDIR)/song0119.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P40 -V127
    
$(MID_SUBDIR)/song0120.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V127
    
$(MID_SUBDIR)/song0121.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V107
    
$(MID_SUBDIR)/song0125.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P30 -V100
    
$(MID_SUBDIR)/song0126.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P30 -V110
    
$(MID_SUBDIR)/song0127.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P30 -V120
    
$(MID_SUBDIR)/song0128.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0129.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0131.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0135.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0138.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P50 -V127
    
$(MID_SUBDIR)/song0139.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V70
    
$(MID_SUBDIR)/song0140.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0141.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0142.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V110
    
$(MID_SUBDIR)/song0143.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0144.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0145.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0146.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V64
    
$(MID_SUBDIR)/song0147.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V100
    
$(MID_SUBDIR)/song0148.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0149.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V89
    
$(MID_SUBDIR)/song0150.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P50 -V127
    
$(MID_SUBDIR)/song0151.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V100
    
$(MID_SUBDIR)/song0152.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0153.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V120
    
$(MID_SUBDIR)/song0154.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0155.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0156.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0157.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V90
    
$(MID_SUBDIR)/song0158.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G0 -P20 -V90
    
$(MID_SUBDIR)/song0159.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0160.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0161.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0162.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0163.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0164.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0165.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0166.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0167.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0168.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G3 -P20 -V120
    
$(MID_SUBDIR)/song0169.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V88
    
$(MID_SUBDIR)/song0170.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V88
    
$(MID_SUBDIR)/song0201.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0202.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0203.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0204.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0205.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0206.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0208.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0209.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0210.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0211.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0212.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V127
    
$(MID_SUBDIR)/song0213.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V96
    
$(MID_SUBDIR)/song0214.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0215.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0216.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0217.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0218.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0219.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0220.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0221.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0222.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0223.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0224.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0225.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/song0226.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/song0227.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0228.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0229.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0230.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0231.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0232.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P15 -V100
    
$(MID_SUBDIR)/song0234.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0235.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0236.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0237.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V65
    
$(MID_SUBDIR)/song0238.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0239.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0241.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0242.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0243.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0244.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0245.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0246.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0248.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0249.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0250.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0251.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0252.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0253.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0254.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0255.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song0256.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V92
    
$(MID_SUBDIR)/song0257.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0258.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0259.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0260.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0261.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0262.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0263.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0264.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0265.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0266.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0267.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0268.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0269.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0270.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0271.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0272.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0273.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0274.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P30 -V100
    
$(MID_SUBDIR)/song0275.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0276.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0277.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0278.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0279.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0280.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0281.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song0282.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song0283.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0284.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V98
    
$(MID_SUBDIR)/song0285.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0286.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song0287.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0288.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0289.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0290.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0291.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0292.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V90
    
$(MID_SUBDIR)/song0293.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0294.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0295.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0296.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0297.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V100
    
$(MID_SUBDIR)/song0298.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P40 -V100
    
$(MID_SUBDIR)/song0300.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0301.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0302.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0303.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0304.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0305.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0306.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0307.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0308.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0309.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0310.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0311.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0312.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0313.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0314.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0315.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0316.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0317.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0318.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0319.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0320.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0321.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0322.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0323.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0324.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V127
    
$(MID_SUBDIR)/song0325.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0326.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0327.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0328.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0329.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0331.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0332.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G6 -P20 -V120
    
$(MID_SUBDIR)/song0333.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G5 -P20 -V120
    
$(MID_SUBDIR)/song0401.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G8  -V103
    
$(MID_SUBDIR)/song0402.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G8  -V107
    
$(MID_SUBDIR)/song0403.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G8  -V110
    
$(MID_SUBDIR)/song0404.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G8  -V100
    
$(MID_SUBDIR)/song0405.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V110
    
$(MID_SUBDIR)/song0406.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G22  -V99
    
$(MID_SUBDIR)/song0407.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G7  -V120
    
$(MID_SUBDIR)/song0408.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V105
    
$(MID_SUBDIR)/song0410.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V90
    
$(MID_SUBDIR)/song0411.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G23 -P255 -V105
    
$(MID_SUBDIR)/song0412.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/song0413.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/song0414.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V77
    
$(MID_SUBDIR)/song0415.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G13  -V105
    
$(MID_SUBDIR)/song0504.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V105
    
$(MID_SUBDIR)/song0505.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V110
    
$(MID_SUBDIR)/song0506.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -R$(STD_REVERB) -G10  -V110
