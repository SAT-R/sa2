@ From pret:
@ Due to the way mks4agb (tool) works, key split table labels can
@ appear before the actual start of the key split table data. If you look at
@ the first keysplit table (KeySplitTable1), you'll notice it's offset backwards
@ by 18 bytes (not in SA2!). This is because the key split tables don't map instruments
@ for the entire note range (0-127)--they only map subsets, and the upper
@ and lower ranges aren't necessarily 0 or 127.
@
@ For example if a key split table maps an note range of 10-20, then the key
@ split table label will be offset 10 bytes before the actual key split data
@ begins. Therefore, the notes naturally map to the key split table without
@ any extra offset calculation.

    mAlignWord
	@********************** KeySplit **********************@

#if (defined(__aarch64__) || defined(__x86_64__))
.set MP2KVoiceGroup_size, 0x18
#else
.set MP2KVoiceGroup_size, 0xC
#endif

	.global KeySplitTable1
.set KeySplitTable1, . - (3 * MP2KVoiceGroup_size)	@ 0x00000000
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	0
	.byte	0
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	56
	.byte	57
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	58
	.byte	59
	.byte	60
	.byte	0
	.byte	61
	.byte	62
	.byte	63
	.byte	64
	.byte	65
	.byte	0
	.byte	75
	.byte	76
	.byte	77
	.byte	78
	.byte	79
	.byte	80
	.byte	81
	.byte	82
	.byte	83
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
