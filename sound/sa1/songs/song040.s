	.include "asm/macros/c_decl.inc"
	.include "asm/macros/portable.inc"
	.include "sound/MPlayDef.s"

	mSectionRodata

	@********************** Track  1 **********************@

	mAlignWord
	.global song040_1
song040_1:	@ 0x087B5F10
	.byte	KEYSH	, 0
	.byte	TEMPO	, 63
	.byte	VOICE	, 127
	.byte	VOL	, v115
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W48
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
song040_1_1:
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v076
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v080
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_1_1
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte		N06	, Dn1, v068
	.byte	W06
	.byte			Dn1, v044
	.byte	W06
	.byte			Cs1, v127
	.byte	W12
	.byte		N06	
	.byte	W06
	.byte			Cs1, v124
	.byte	W06
	.byte		N12	, Cn1, v127
	.byte		N96	, Gn2
	.byte	W12
	.byte	W12
	.byte		N12	, Ds1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
song040_1_2:
	.byte		N12	, Cn1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, Ds1, v076
	.byte	W12
	.byte	PEND
song040_1_3:
	.byte	W12
	.byte		N12	, Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte		N06	, Cn1, v127
	.byte		N12	, Dn1, v040
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte	W06
	.byte		N12	, Cs1
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, Ds1, v076
	.byte	W12
	.byte	PEND
song040_1_4:
	.byte	W12
	.byte		N12	, Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v084
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N24	, Ds1, v076
	.byte	W12
	.byte	PEND
song040_1_5:
	.byte	W12
	.byte		N12	, Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_1_2
	.byte	PATT	
		mPtr	song040_1_3
	.byte	PATT	
		mPtr	song040_1_4
	.byte	PATT	
		mPtr	song040_1_5
	.byte	PATT	
		mPtr	song040_1_2
	.byte	PATT	
		mPtr	song040_1_3
	.byte	PATT	
		mPtr	song040_1_4
	.byte	PATT	
		mPtr	song040_1_5
	.byte	PATT	
		mPtr	song040_1_2
	.byte	PATT	
		mPtr	song040_1_3
	.byte	W12
	.byte		N12	, Dn1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v076
	.byte	W12
	.byte			Dn1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v080
	.byte	W12
	.byte			Dn1, v040
	.byte		N12	, Gs1, v127
	.byte	W12
	.byte			Cs1
	.byte		N12	, Dn1, v084
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, Ds1, v076
	.byte	W12
	.byte	W12
	.byte		N12	, Ds1, v032
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v044
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Cn1, v127
	.byte	W12
	.byte		N06	, Cs1
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cn1
	.byte		N66	, Cs2
	.byte	W18
	.byte		N05	, Cs1
	.byte	W06
	.byte		N12	, Cn1
	.byte	W12
	.byte		N05	, Gn1
	.byte	W06
	.byte			Cs1
	.byte	W06
	.byte		N12	, Cn1
	.byte		N24	, Ds1, v072
	.byte	W12
song040_1_6:
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte	PEND
song040_1_7:
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Cn1, v127
	.byte		N24	, Ds1, v084
	.byte	W12
	.byte	PEND
song040_1_8:
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte		N12	, Ds1, v060
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte	W06
	.byte	PEND
	.byte		N06	
	.byte		N36	, Cs2, v084
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte	W06
	.byte		N12	, Cs1, v068
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N36	, Gn2, v084
	.byte	W18
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte	W12
	.byte		N05	, Cs1
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N24	, Ds1, v072
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_6
	.byte	PATT	
		mPtr	song040_1_7
	.byte	PATT	
		mPtr	song040_1_8
	.byte		N06	, Cn1, v127
	.byte		N36	, Cs2, v084
	.byte	W06
	.byte		N06	, Cn1, v127
	.byte	W06
	.byte		N12	, Cs1, v068
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v044
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Cn1
	.byte		N36	, Fs2, v084
	.byte	W24
	.byte		N06	, Cs1, v127
	.byte	W12
	.byte			Cn1
	.byte		N12	, Dn1, v044
	.byte	W12
	.byte		N06	, Cn1, v127
	.byte		N36	, Gn2, v084
	.byte	W12
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
song040_1_9:
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
song040_1_11:
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N05	, An1
	.byte	W06
	.byte		N11	, Gn1
	.byte	W12
	.byte	PEND
song040_1_10:
	.byte		N12	, Cn1, v127
	.byte		N36	, Fs2
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v040
	.byte		N40	, Gn2, v127
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W06
	.byte		N05	, An1, v127
	.byte	W06
	.byte		N12	, Dn1, v040
	.byte		N11	, Gn1, v127
	.byte	W12
	.byte	PEND
	.byte		N12	, Cn1
	.byte		N36	, Fs2
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v040
	.byte		N40	, Gn2, v127
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N12	, Ds1, v040
	.byte	W12
	.byte		N11	, Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N05	, Cs1, v127
	.byte		N12	, Ds1, v072
	.byte	W06
	.byte		N05	, Cs1, v127
	.byte	W06
	.byte	PATT	
		mPtr	song040_1_10
	.byte		N12	, Cn1, v127
	.byte		N12	, Dn1, v040
	.byte		N32	, Fs2, v127
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Dn1, v040
	.byte		N32	, Gn2, v127
	.byte	W12
	.byte		N12	, Dn1, v040
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Dn1, v040
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N12	, Dn1, v040
	.byte		N06	, An1, v127
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte		N12	, Dn1, v040
	.byte		N06	, Gn1, v127
	.byte	W06
	.byte			Cs1
	.byte	W06
	.byte		N12	, Cn1
	.byte		N44	, Gn2
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte		N11	, Ds1, v060
	.byte	W12
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_11
	.byte		N12	, Cn1, v127
	.byte		N48	, Fs2
	.byte	W24
	.byte		N12	, Cs1
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte		N11	, Cs1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte		N12	, Cs1
	.byte		N12	, Ds1, v076
	.byte		N96	, Gn2, v127
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte		N12	, Ds1, v052
	.byte	W06
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte		N12	, Cs1
	.byte		N12	, Ds1, v076
	.byte		N48	, Fs2, v127
	.byte	W12
	.byte		N12	, Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte		N12	, Cn1
	.byte		N48	, Gn2
	.byte	W24
	.byte		N12	, Cs1
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v052
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v052
	.byte	W12
	.byte	PATT	
		mPtr	song040_1_9
	.byte	PATT	
		mPtr	song040_1_9
	.byte		N12	, Cn1, v127
	.byte		N12	, Ds1, v084
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cs1, v127
	.byte		N12	, Ds1, v076
	.byte	W12
	.byte			Ds1, v060
	.byte	W12
	.byte			Cn1, v127
	.byte		N12	, Ds1, v080
	.byte	W12
	.byte		N06	, Cs1, v127
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte			An1
	.byte	W06
	.byte			Gs1
	.byte	W06
	.byte			Gn1
	.byte	W06
	.byte			Fs1
	.byte	W06
	.byte		N12	, Cs1
	.byte		N06	, Ds1, v084
	.byte	W48
	.byte		N12	, Cn1, v127
	.byte		N06	, Ds1, v084
	.byte	W12
	.byte	FINE

	@********************** Track  2 **********************@

	.global song040_2
song040_2:	@ 0x087B64F8
	.byte	KEYSH	, 0
	.byte	VOICE	, 12
	.byte	VOL	, v060
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	W48
song040_2_1:
	.byte		N03	, Gn4, v124
	.byte	W12
	.byte			Gn5, v092
	.byte	W06
	.byte			Dn5, v088
	.byte	W06
	.byte			Gn4, v084
	.byte	W06
	.byte			Gn5, v080
	.byte	W06
	.byte			Dn5, v076
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Gn5, v072
	.byte	W06
	.byte			Dn5, v068
	.byte	W06
	.byte			Gn4, v064
	.byte	W06
	.byte			Gn5, v060
	.byte	W06
	.byte			Dn5, v056
	.byte	W06
	.byte			Gn4, v052
	.byte	W06
	.byte			Gn5, v048
	.byte	W06
	.byte			Dn5, v044
	.byte	W06
	.byte	PEND
song040_2_2:
	.byte		N03	, Gn4, v044
	.byte	W06
	.byte			Gn5, v040
	.byte	W06
	.byte			Dn5, v036
	.byte	W06
	.byte			Gn4, v032
	.byte	W06
	.byte			Gn5, v028
	.byte	W06
	.byte			Dn5, v024
	.byte	W06
	.byte			Gn4, v020
	.byte	W06
	.byte			Gn5, v016
	.byte	W06
	.byte			Dn5, v012
	.byte	W06
	.byte			Gn4
	.byte	W06
	.byte			Gn5, v008
	.byte	W06
	.byte			Dn5, v004
	.byte	W30
	.byte	PEND
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
song040_2_3:
	.byte		N03	, An4, v124
	.byte	W12
	.byte			An5, v092
	.byte	W06
	.byte			Dn5, v088
	.byte	W06
	.byte			An4, v084
	.byte	W06
	.byte			An5, v080
	.byte	W06
	.byte			Dn5, v076
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			An5, v072
	.byte	W06
	.byte			Dn5, v068
	.byte	W06
	.byte			An4, v064
	.byte	W06
	.byte			An5, v060
	.byte	W06
	.byte			Dn5, v056
	.byte	W06
	.byte			An4, v052
	.byte	W06
	.byte			An5, v048
	.byte	W06
	.byte			Dn5, v044
	.byte	W06
	.byte	PEND
song040_2_4:
	.byte		N03	, An4, v044
	.byte	W06
	.byte			An5, v040
	.byte	W06
	.byte			Dn5, v036
	.byte	W06
	.byte			An4, v032
	.byte	W06
	.byte			An5, v028
	.byte	W06
	.byte			Dn5, v024
	.byte	W06
	.byte			An4, v020
	.byte	W06
	.byte			An5, v016
	.byte	W06
	.byte			Dn5, v012
	.byte	W06
	.byte			An4
	.byte	W06
	.byte			An5, v008
	.byte	W06
	.byte			Dn5, v004
	.byte	W30
	.byte	PEND
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
song040_2_5:
	.byte		N03	, Gs4, v124
	.byte	W12
	.byte			Gs5, v092
	.byte	W06
	.byte			Cs5, v088
	.byte	W06
	.byte			Gs4, v084
	.byte	W06
	.byte			Gs5, v080
	.byte	W06
	.byte			Cs5, v076
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs5, v072
	.byte	W06
	.byte			Cs5, v068
	.byte	W06
	.byte			Gs4, v064
	.byte	W06
	.byte			Gs5, v060
	.byte	W06
	.byte			Cs5, v056
	.byte	W06
	.byte			Gs4, v052
	.byte	W06
	.byte			Gs5, v048
	.byte	W06
	.byte			Cs5, v044
	.byte	W06
	.byte	PEND
song040_2_6:
	.byte		N03	, Gs4, v044
	.byte	W06
	.byte			Gs5, v040
	.byte	W06
	.byte			Cs5, v036
	.byte	W06
	.byte			Gs4, v032
	.byte	W06
	.byte			Gs5, v028
	.byte	W06
	.byte			Cs5, v024
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte			Gs5, v016
	.byte	W06
	.byte			Cs5, v012
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs5, v008
	.byte	W06
	.byte			Cs5, v004
	.byte	W30
	.byte	PEND
song040_2_7:
	.byte		N03	, As4, v124
	.byte	W12
	.byte			As5, v092
	.byte	W06
	.byte			Ds5, v088
	.byte	W06
	.byte			As4, v084
	.byte	W06
	.byte			As5, v080
	.byte	W06
	.byte			Ds5, v076
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			As5, v072
	.byte	W06
	.byte			Ds5, v068
	.byte	W06
	.byte			As4, v064
	.byte	W06
	.byte			As5, v060
	.byte	W06
	.byte			Ds5, v056
	.byte	W06
	.byte			As4, v052
	.byte	W06
	.byte			As5, v048
	.byte	W06
	.byte			Ds5, v044
	.byte	W06
	.byte	PEND
song040_2_8:
	.byte		N03	, As4, v044
	.byte	W06
	.byte			As5, v040
	.byte	W06
	.byte			Ds5, v036
	.byte	W06
	.byte			As4, v032
	.byte	W06
	.byte			As5, v028
	.byte	W06
	.byte			Ds5, v024
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte			As5, v016
	.byte	W06
	.byte			Ds5, v012
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			As5, v008
	.byte	W06
	.byte			Ds5, v004
	.byte	W30
	.byte	PEND
	.byte	PATT	
		mPtr	song040_2_5
	.byte	PATT	
		mPtr	song040_2_6
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
song040_2_9:
	.byte		N03	, Fs4, v124
	.byte	W12
	.byte			Fs5, v092
	.byte	W06
	.byte			Bn4, v088
	.byte	W06
	.byte			Fs4, v084
	.byte	W06
	.byte			Fs5, v080
	.byte	W06
	.byte			Bn4, v076
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Fs5, v072
	.byte	W06
	.byte			Bn4, v068
	.byte	W06
	.byte			Fs4, v064
	.byte	W06
	.byte			Fs5, v060
	.byte	W06
	.byte			Bn4, v056
	.byte	W06
	.byte			Fs4, v052
	.byte	W06
	.byte			Fs5, v048
	.byte	W06
	.byte			Bn4, v044
	.byte	W06
	.byte	PEND
song040_2_10:
	.byte		N03	, Fs4, v044
	.byte	W06
	.byte			Fs5, v040
	.byte	W06
	.byte			Bn4, v036
	.byte	W06
	.byte			Fs4, v032
	.byte	W06
	.byte			Fs5, v028
	.byte	W06
	.byte			Bn4, v024
	.byte	W06
	.byte			Fs4, v020
	.byte	W06
	.byte			Fs5, v016
	.byte	W06
	.byte			Bn4, v012
	.byte	W06
	.byte			Fs4
	.byte	W06
	.byte			Fs5, v008
	.byte	W06
	.byte			Bn4, v004
	.byte	W30
	.byte	PEND
	.byte	PATT	
		mPtr	song040_2_5
	.byte	PATT	
		mPtr	song040_2_6
	.byte	PATT	
		mPtr	song040_2_9
	.byte	PATT	
		mPtr	song040_2_10
	.byte	PATT	
		mPtr	song040_2_3
	.byte	PATT	
		mPtr	song040_2_4
song040_2_11:
	.byte		N03	, As4, v124
	.byte	W12
	.byte			As5, v092
	.byte	W06
	.byte			Fn5, v088
	.byte	W06
	.byte			As4, v084
	.byte	W06
	.byte			As5, v080
	.byte	W06
	.byte			Fn5, v076
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			As5, v072
	.byte	W06
	.byte			Fn5, v068
	.byte	W06
	.byte			As4, v064
	.byte	W06
	.byte			As5, v060
	.byte	W06
	.byte			Fn5, v056
	.byte	W06
	.byte			As4, v052
	.byte	W06
	.byte			As5, v048
	.byte	W06
	.byte			Fn5, v044
	.byte	W06
	.byte	PEND
song040_2_12:
	.byte		N03	, As4, v044
	.byte	W06
	.byte			As5, v040
	.byte	W06
	.byte			Fn5, v036
	.byte	W06
	.byte			As4, v032
	.byte	W06
	.byte			As5, v028
	.byte	W06
	.byte			Fn5, v024
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte			As5, v016
	.byte	W06
	.byte			Fn5, v012
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			As5, v008
	.byte	W06
	.byte			Fn5, v004
	.byte	W30
	.byte	PEND
	.byte	PATT	
		mPtr	song040_2_11
	.byte	PATT	
		mPtr	song040_2_12
	.byte	PATT	
		mPtr	song040_2_11
	.byte	PATT	
		mPtr	song040_2_12
	.byte	PATT	
		mPtr	song040_2_11
	.byte	PATT	
		mPtr	song040_2_12
	.byte		N03	, Gs4, v124
	.byte	W12
	.byte			Gs5, v092
	.byte	W06
	.byte			Ds5, v088
	.byte	W06
	.byte			Gs4, v084
	.byte	W06
	.byte			Gs5, v080
	.byte	W06
	.byte			Ds5, v076
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs5, v072
	.byte	W06
	.byte			Ds5, v068
	.byte	W06
	.byte			Gs4, v064
	.byte	W06
	.byte			Gs5, v060
	.byte	W06
	.byte			Ds5, v056
	.byte	W06
	.byte			Gs4, v052
	.byte	W06
	.byte			Gs5, v048
	.byte	W06
	.byte			Ds5, v044
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs5, v040
	.byte	W06
	.byte			Ds5, v036
	.byte	W06
	.byte			Gs4, v032
	.byte	W06
	.byte			Gs5, v028
	.byte	W06
	.byte			Ds5, v024
	.byte	W06
	.byte			Gs4, v020
	.byte	W06
	.byte			Gs5, v016
	.byte	W06
	.byte			Ds5, v012
	.byte	W06
	.byte			Gs4
	.byte	W06
	.byte			Gs5, v008
	.byte	W06
	.byte			Ds5, v004
	.byte	W30
	.byte	PATT	
		mPtr	song040_2_1
	.byte	PATT	
		mPtr	song040_2_2
	.byte		N03	, Fn4, v124
	.byte	W12
	.byte			Fn5, v092
	.byte	W06
	.byte			Cn5, v088
	.byte	W06
	.byte			Fn4, v084
	.byte	W06
	.byte			Fn5, v080
	.byte	W06
	.byte			Cn5, v076
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn5, v072
	.byte	W06
	.byte			Cn5, v068
	.byte	W06
	.byte			Fn4, v064
	.byte	W06
	.byte			Fn5, v060
	.byte	W06
	.byte			Cn5, v056
	.byte	W06
	.byte			Fn4, v052
	.byte	W06
	.byte			Fn5, v048
	.byte	W06
	.byte			Cn5, v044
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn5, v040
	.byte	W06
	.byte			Cn5, v036
	.byte	W06
	.byte			Fn4, v032
	.byte	W06
	.byte			Fn5, v028
	.byte	W06
	.byte			Cn5, v024
	.byte	W06
	.byte			Fn4, v020
	.byte	W06
	.byte			Fn5, v016
	.byte	W06
	.byte			Cn5, v012
	.byte	W06
	.byte			Fn4
	.byte	W06
	.byte			Fn5, v008
	.byte	W06
	.byte			Cn5, v004
	.byte	W30
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
	.byte	PATT	
		mPtr	song040_2_7
	.byte	PATT	
		mPtr	song040_2_8
	.byte	PATT	
		mPtr	song040_2_7
	.byte		N03	, As4, v044
	.byte	W06
	.byte			As5, v040
	.byte	W06
	.byte			Ds5, v036
	.byte	W06
	.byte			As4, v032
	.byte	W06
	.byte			As5, v028
	.byte	W06
	.byte			Ds5, v024
	.byte	W06
	.byte			As4, v020
	.byte	W06
	.byte			As5, v016
	.byte	W06
	.byte			Ds5, v012
	.byte	W06
	.byte			As4
	.byte	W06
	.byte			As5, v008
	.byte	W06
	.byte			Ds5, v004
	.byte	W03
	.byte	FINE

	@********************** Track  3 **********************@

	.global song040_3
song040_3:	@ 0x087B68CB
	.byte	KEYSH	, 0
	.byte	VOICE	, 76
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N36	, Fs3, v076
	.byte	W36
	.byte		N60	, Gs3
	.byte	W60
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		TIE	, As3, v068
	.byte	W96
	.byte	W07
	.byte		EOT	
	.byte	W05
	.byte		N19	
	.byte	W24
	.byte		N32	, As3, v064
	.byte	W36
	.byte		N23	, As3, v056
	.byte	W24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	, Fn3, v076
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N96	, Ds3, v068
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte			Fs3
	.byte	W96
	.byte	FINE

	@********************** Track  4 **********************@

	.global song040_4
song040_4:	@ 0x087B693F
	.byte	KEYSH	, 0
	.byte	VOICE	, 80
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 56
	.byte	LFODL	, 0
	.byte	MOD	, 0
	.byte	MODT	, 2
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W54
	.byte		N05	, Bn0, v084
	.byte	W01
	.byte		N07	, Cn1, v088
	.byte	W01
	.byte		N08	, Dn1, v080
	.byte	W01
	.byte		N02	, En1, v044
	.byte	W04
	.byte		N04	, En1, v092
	.byte	W02
	.byte			Fn1, v084
	.byte	W02
	.byte			Gn1, v096
	.byte	W02
	.byte			An1, v084
	.byte	W01
	.byte		N03	, Bn1, v096
	.byte	W02
	.byte			Cn2, v100
	.byte	W01
	.byte			Dn2, v104
	.byte	W02
	.byte			En2, v116
	.byte	W01
	.byte			Fn2, v108
	.byte	W01
	.byte		N04	, Gn2, v104
	.byte	W02
	.byte			An2, v100
	.byte	W01
	.byte		N05	, Bn2, v084
	.byte	W02
	.byte		N03	, Cn3, v052
	.byte	W04
	.byte		TIE	, Dn3, v080
	.byte	W12
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N08	, Dn3, v108
	.byte	W12
	.byte		N19	
	.byte	W24
	.byte		N32	, Dn3, v112
	.byte	W36
	.byte		N11	, Dn3, v104
	.byte	W12
	.byte		N32	, Fn2, v116
	.byte	W12
	.byte	W24
	.byte		N44	, Fn3, v104
	.byte	W48
	.byte		N11	, Fn3, v108
	.byte	W12
	.byte		N56	, Gn3, v092
	.byte	W12
	.byte	W48
	.byte		N23	, Gn3, v072
	.byte	W24
	.byte		N11	, Gn2, v092
	.byte	W12
	.byte		N56	, Dn3, v116
	.byte	W12
	.byte	W48
	.byte		N20	, Dn3, v104
	.byte	W24
	.byte			Dn3, v076
	.byte	W24
	.byte		N05	, Dn3, v104
	.byte	W12
	.byte		N22	, Dn3, v088
	.byte	W24
	.byte		N30	, Dn3, v112
	.byte	W36
	.byte		N11	
	.byte	W12
	.byte		N56	, Fn3
	.byte	W12
	.byte	W48
	.byte		N09	, Fn3, v104
	.byte	W12
	.byte		N23	
	.byte	W24
	.byte		N32	, Gn3, v108
	.byte	W12
	.byte	W24
	.byte		N17	, Gn3, v096
	.byte	W24
	.byte		N09	, Gn3, v100
	.byte	W12
	.byte		N11	, Gn3, v120
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte		N56	, An2, v120
	.byte	W12
	.byte	W48
	.byte		N44	, An2, v108
	.byte	W48
	.byte		N06	, An2, v104
	.byte	W12
	.byte		N19	
	.byte	W24
	.byte		N30	, An2, v108
	.byte	W36
	.byte		N11	, An2, v104
	.byte	W12
	.byte		N56	, Cn3, v120
	.byte	W12
	.byte	W48
	.byte		N09	, Cn3, v108
	.byte	W12
	.byte		N23	, Cn3, v116
	.byte	W24
	.byte		N32	, Dn3, v120
	.byte	W12
	.byte	W24
	.byte		N22	, Dn3, v112
	.byte	W24
	.byte		N07	, Dn3, v124
	.byte	W12
	.byte		N22	, Dn3, v116
	.byte	W24
	.byte		N54	, An2, v108
	.byte	W12
	.byte	W48
	.byte		N09	, An2, v096
	.byte	W12
	.byte		N19	, An2, v104
	.byte	W24
	.byte		N10	, An2, v092
	.byte	W12
	.byte		N21	, An2, v108
	.byte	W24
	.byte		N09	, An2, v092
	.byte	W12
	.byte		N30	
	.byte	W36
	.byte		N10	, An2, v084
	.byte	W12
	.byte		N56	, Cn3, v104
	.byte	W12
	.byte	W48
	.byte		N08	, Cn3, v092
	.byte	W12
	.byte		N20	, Cn3, v108
	.byte	W24
	.byte			Dn3
	.byte	W12
	.byte	W12
	.byte		N32	, Dn3, v112
	.byte	W36
	.byte		N08	
	.byte	W12
	.byte		N09	
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		TIE	, En3, v096
	.byte	W12
	.byte	W92
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte		N30	, En3, v120
	.byte	W30
	.byte	W01
	.byte		N02	, Dn3, v064
	.byte	W04
	.byte			Cn3, v060
	.byte	W02
	.byte			Bn2, v076
	.byte	W02
	.byte			An2, v072
	.byte	W03
	.byte			Gn2, v036
	.byte	W32
	.byte	W02
	.byte		N05	, Dn1, v076
	.byte	W01
	.byte		N02	, Cn1, v064
	.byte	W01
	.byte		N06	, En1, v048
	.byte	W03
	.byte		N04	, Fn1, v056
	.byte	W02
	.byte			Gn1, v088
	.byte	W02
	.byte			An1, v084
	.byte	W01
	.byte			Bn1, v076
	.byte	W02
	.byte			Cn2, v084
	.byte	W01
	.byte			Dn2, v092
	.byte	W02
	.byte			En2, v100
	.byte	W01
	.byte			Fn2, v096
	.byte	W02
	.byte			Gn2, v084
	.byte	W02
	.byte		N16	, An2, v052
	.byte	W24
	.byte		N17	, An2, v096
	.byte	W24
	.byte		N09	, An2, v104
	.byte	W12
	.byte		N08	, An2, v044
	.byte	W12
	.byte		N21	, An2, v092
	.byte	W24
	.byte		N11	, An2, v060
	.byte	W36
	.byte		N12	, An2, v116
	.byte	W24
	.byte		N09	, An2, v108
	.byte	W12
	.byte		N11	, An2, v076
	.byte	W12
	.byte		N54	, Dn3, v120
	.byte	W12
	.byte	W48
	.byte		N20	, Dn3, v096
	.byte	W24
	.byte		N20	
	.byte	W24
	.byte		N32	, Fn3, v116
	.byte	W36
	.byte			Gn3, v124
	.byte	W36
	.byte		N11	, Gn2, v120
	.byte	W12
	.byte			An2
	.byte	W12
	.byte		N20	, An2, v108
	.byte	W36
	.byte		N07	, An2, v056
	.byte	W12
	.byte		N17	, An2, v108
	.byte	W24
	.byte		N32	, An2, v100
	.byte	W24
	.byte	W12
	.byte		N12	
	.byte	W24
	.byte		N24	, An2, v108
	.byte	W36
	.byte		N11	, An2, v092
	.byte	W12
	.byte		N80	, Dn3, v116
	.byte	W12
	.byte	W72
	.byte		N19	, Dn3, v100
	.byte	W24
	.byte		N30	, Fn2, v120
	.byte	W36
	.byte		N44	, Gn2, v108
	.byte	W48
	.byte		TIE	, Gs2, v120
	.byte	W12
	.byte	W96
	.byte	W42
	.byte	W01
	.byte		EOT	
	.byte	W05
	.byte		N44	, Gs2, v104
	.byte	W48
	.byte		TIE	, As2, v088
	.byte	W96
	.byte	W09
	.byte		EOT	
	.byte	W03
	.byte		N19	, As2, v112
	.byte	W24
	.byte		N56	, As2, v088
	.byte	W60
	.byte		TIE	, Gs2, v080
	.byte	W96
	.byte	W44
	.byte		EOT	
	.byte	W04
	.byte		N09	, Gs2, v092
	.byte	W12
	.byte		N32	, Gs2, v088
	.byte	W36
	.byte		N44	, As2, v096
	.byte	W48
	.byte		N88	, As2, v112
	.byte	W48
	.byte	W48
	.byte		N08	, As2, v092
	.byte	W12
	.byte		N32	
	.byte	W36
	.byte		TIE	, Fs2, v096
	.byte	W96
	.byte	W44
	.byte	W01
	.byte		EOT	
	.byte	W03
	.byte		N09	, Fs2, v092
	.byte	W12
	.byte		N32	, Fs2, v096
	.byte	W36
	.byte		N90	, Cs3, v100
	.byte	W96
	.byte		N09	, Cs3, v084
	.byte	W12
	.byte		N20	, Cs3, v096
	.byte	W24
	.byte		N48	
	.byte	W60
	.byte		N32	, Fs2, v104
	.byte	W36
	.byte		N56	, Gs2, v116
	.byte	W60
	.byte	W96
	.byte		N32	, Gn2, v112
	.byte	W36
	.byte		N48	, An2, v124
	.byte	W60
	.byte		N32	, As2, v116
	.byte	W36
	.byte		N56	, Cn3, v124
	.byte	W60
	.byte		N92	, Fn3, v112
	.byte	W96
	.byte		N06	, Fn3, v108
	.byte	W12
	.byte		N21	, Fn3, v100
	.byte	W24
	.byte		N56	, Fn3, v116
	.byte	W60
	.byte	W96
	.byte	W96
	.byte		N88	, Fn3, v100
	.byte	W96
	.byte		N06	, Fn3, v096
	.byte	W12
	.byte		N19	, Fn3, v108
	.byte	W24
	.byte		N56	
	.byte	W60
	.byte		N92	, Ds3, v112
	.byte	W96
	.byte		N68	, Ds3, v068
	.byte	W72
	.byte		N23	, En3, v127
	.byte	W24
	.byte		N92	, Ds3, v104
	.byte	W96
	.byte		N07	
	.byte	W12
	.byte		N42	, Ds3, v108
	.byte	W48
	.byte		N20	, Ds3, v092
	.byte	W24
	.byte		N11	, Ds3, v104
	.byte	W12
	.byte	W96
	.byte		N88	, Cs3, v108
	.byte	W96
	.byte		N92	, Ds3
	.byte	W96
	.byte		N64	, Fn3, v100
	.byte	W96
	.byte		N92	, As2, v127
	.byte	W96
	.byte		N07	, As2, v068
	.byte	W12
	.byte		N21	, As2, v100
	.byte	W24
	.byte		N60	, As2, v127
	.byte	W60
	.byte		TIE	, Ds3, v104
	.byte	W96
	.byte	W01
	.byte		EOT	
	.byte	W92
	.byte	W03
	.byte		N92	, As2, v116
	.byte	W96
	.byte		N07	
	.byte	W12
	.byte		N22	, As2, v104
	.byte	W24
	.byte		N56	, As2, v120
	.byte	W60
	.byte		N92	, Fs3, v112
	.byte	W96
	.byte	W96
	.byte		TIE	, As2, v116
	.byte	W96
	.byte	W80
	.byte		EOT	
	.byte		N05	, Bn2, v020
	.byte	W01
	.byte		N07	, Cn3, v072
	.byte	W04
	.byte		N05	, Dn3, v060
	.byte	W02
	.byte			En3, v064
	.byte	W02
	.byte		N06	, Fn3, v056
	.byte	W02
	.byte			Gn3, v032
	.byte	W01
	.byte		N04	, An3, v024
	.byte	W04
	.byte		TIE	, As3, v108
	.byte	W96
	.byte	W88
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		N11	, As3, v127
	.byte	W48
	.byte		N10	, As2, v112
	.byte	W10
	.byte	FINE

	@********************** Track  5 **********************@

	.global song040_5
song040_5:	@ 0x087B6C2D
	.byte	KEYSH	, 0
	.byte	VOICE	, 45
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W84
	.byte		N17	, Gn1, v104
	.byte	W12
	.byte	W12
	.byte		N05	, Gn1, v096
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1, v092
	.byte	W12
	.byte			Gn1, v096
	.byte	W12
	.byte			Gn1, v088
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte			Gn1, v104
	.byte	W12
	.byte			Gn1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N17	, As1
	.byte	W12
song040_5_1:
	.byte	W12
	.byte		N05	, As1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	, Cn2
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N17	, Gn1
	.byte	W12
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N17	, As1
	.byte	W12
	.byte	PATT	
		mPtr	song040_5_1
	.byte	W12
	.byte		N05	, Cn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N17	, Dn2
	.byte	W12
song040_5_2:
	.byte	W12
	.byte		N05	, Dn2, v112
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
song040_5_3:
	.byte		N05	, Dn3, v112
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Dn3
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N17	, Fn2
	.byte	W12
	.byte	PEND
song040_5_4:
	.byte	W12
	.byte		N05	, Fn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	, Gn2
	.byte	W12
	.byte	PEND
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N17	, Dn2
	.byte	W12
	.byte	PATT	
		mPtr	song040_5_2
	.byte	PATT	
		mPtr	song040_5_3
	.byte	PATT	
		mPtr	song040_5_4
	.byte	W12
	.byte		N05	, Gn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte		N17	, An2
	.byte	W12
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W36
	.byte		N23	, An1
	.byte	W24
	.byte		N05	, Cn2
	.byte	W12
	.byte			Cs2
	.byte	W12
	.byte		N17	, Dn2
	.byte	W12
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
song040_5_5:
	.byte		N05	, Dn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	, Cn2
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PATT	
		mPtr	song040_5_5
	.byte	PATT	
		mPtr	song040_5_5
	.byte		N05	, Gn1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	, Cn2
	.byte	W24
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N17	, Cs2
	.byte	W12
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
song040_5_7:
	.byte		N05	, Cs2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
song040_5_6:
	.byte		N05	, Ds2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_6
	.byte	PATT	
		mPtr	song040_5_7
	.byte	PATT	
		mPtr	song040_5_7
song040_5_8:
	.byte		N05	, Cn2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_8
song040_5_9:
	.byte		N05	, Bn1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_9
song040_5_10:
	.byte		N05	, As1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_10
	.byte		N32	, Gs1, v112
	.byte	W36
	.byte		N23	, As1
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, Gs2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte		N11	, As2
	.byte	W12
	.byte		N32	, Bn1
	.byte	W36
	.byte		N23	, Cs2
	.byte	W24
	.byte		N05	, As2
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte		N11	, Cs2
	.byte	W12
	.byte		N32	, An1
	.byte	W36
	.byte		N23	, Bn1
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte		N05	, An2
	.byte	W06
	.byte			As2
	.byte	W06
	.byte		N11	, Bn2
	.byte	W12
	.byte		N32	, Cn2
	.byte	W36
	.byte		N23	, Fn2
	.byte	W24
	.byte		N05	, Ds3
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte		N11	, Fn2
	.byte	W12
song040_5_11:
	.byte		N05	, As1, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
song040_5_12:
	.byte		N05	, As2, v112
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_11
	.byte		N05	, As2, v112
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte	PATT	
		mPtr	song040_5_11
	.byte	PATT	
		mPtr	song040_5_12
	.byte	PATT	
		mPtr	song040_5_11
	.byte		N05	, As2, v112
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			An1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W12
	.byte			Gs1
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Gn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fs2
	.byte	W12
	.byte			Fs1
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Fn1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As2
	.byte	W12
	.byte			As1
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gs2
	.byte	W06
	.byte			An2
	.byte	W06
	.byte		N11	, As2
	.byte	W12
song040_5_13:
	.byte		N05	, Ds2, v112
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Ds3
	.byte	W12
	.byte			Ds2
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte	PEND
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte	PATT	
		mPtr	song040_5_13
	.byte		N05	, Ds2, v112
	.byte	W48
	.byte			Ds1
	.byte	W05
	.byte	FINE

	@********************** Track  6 **********************@

	.global song040_6
song040_6:	@ 0x087B6FA0
	.byte	KEYSH	, 0
	.byte	VOICE	, 74
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 23
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte		TIE	, Gn1, v096
	.byte	W96
	.byte			Dn2
	.byte	W96
	.byte	W96
	.byte	W80
	.byte	W03
	.byte		EOT	, Gn1
	.byte			Dn2
	.byte	W01
	.byte		N22	, Gn3, v127
	.byte	W12
	.byte	W12
	.byte		N09	
	.byte	W84
	.byte	W60
	.byte		N11	, As3
	.byte	W12
	.byte		N05	, An3, v120
	.byte	W12
	.byte		N68	, Gn3, v127
	.byte	W12
	.byte	W60
	.byte		N11	, Dn3, v108
	.byte	W12
	.byte		N05	, En3
	.byte	W12
	.byte		N64	, Gn3, v127
	.byte	W12
	.byte	W60
	.byte		N11	, Dn3, v108
	.byte	W12
	.byte		N08	, En3, v096
	.byte	W12
	.byte		N21	, Gn3, v127
	.byte	W12
	.byte	W12
	.byte		N11	
	.byte	W84
	.byte	W60
	.byte			As3
	.byte	W12
	.byte		N05	, An3, v112
	.byte	W12
	.byte		N68	, Gn3, v127
	.byte	W12
	.byte	W60
	.byte		N05	, Dn3, v088
	.byte	W12
	.byte		N03	, En3, v096
	.byte	W12
	.byte		N64	, Gn3, v124
	.byte	W12
	.byte	W72
	.byte		N04	, Gs3, v112
	.byte	W12
	.byte		N44	, An3
	.byte	W12
	.byte	W36
	.byte		N10	, An3, v108
	.byte	W60
song040_6_1:
	.byte	W60
	.byte		N11	, Cn4, v112
	.byte	W12
	.byte		N06	, Bn3, v104
	.byte	W12
	.byte		N60	, An3, v124
	.byte	W12
	.byte	PEND
song040_6_2:
	.byte	W60
	.byte		N11	, Cn3, v108
	.byte	W12
	.byte		N05	, Dn3, v104
	.byte	W12
	.byte		N68	, An3, v116
	.byte	W12
	.byte	PEND
	.byte	W60
	.byte		N16	, An3, v108
	.byte	W24
	.byte		N40	, An3, v120
	.byte	W12
	.byte	W36
	.byte		N11	, An3, v116
	.byte	W60
	.byte	PATT	
		mPtr	song040_6_1
	.byte	PATT	
		mPtr	song040_6_2
	.byte	W60
	.byte		N11	, An3, v116
	.byte	W12
	.byte		N08	, Bn3, v096
	.byte	W12
	.byte		N56	, Cs4, v120
	.byte	W12
	.byte	W48
	.byte		N44	
	.byte	W48
	.byte		N13	
	.byte	W60
	.byte		N05	, An3, v116
	.byte	W12
	.byte		N11	, Fn4, v127
	.byte	W12
	.byte		N21	, Dn4, v124
	.byte	W12
	.byte	W24
	.byte		N16	, Cn4, v104
	.byte	W24
	.byte		N15	, Bn3, v127
	.byte	W24
	.byte		N17	, As3
	.byte	W24
song040_6_3:
	.byte		N18	, An3, v124
	.byte	W24
	.byte		N10	, Dn4
	.byte	W12
	.byte		N24	, Gn3, v120
	.byte	W36
	.byte		N11	, Fn3, v084
	.byte	W12
	.byte		N76	, Dn3, v096
	.byte	W12
	.byte	PEND
	.byte	W72
	.byte		N20	, Dn3, v112
	.byte	W24
	.byte		N11	, Fn3, v120
	.byte	W12
	.byte			En3, v100
	.byte	W12
	.byte			Dn3, v112
	.byte	W12
	.byte		N23	, En3, v120
	.byte	W24
	.byte		N11	, Dn3, v100
	.byte	W12
	.byte			Cn3, v108
	.byte	W12
	.byte		N23	, Dn3, v127
	.byte	W12
	.byte	W12
	.byte		N10	, Dn4, v124
	.byte	W36
	.byte		N11	, Cn4, v104
	.byte	W24
	.byte		N15	, Bn3, v127
	.byte	W24
	.byte	PATT	
		mPtr	song040_6_3
	.byte	W72
	.byte		N20	, Dn3, v112
	.byte	W24
	.byte	VOL	, v110
	.byte		N11	, Fn3, v100
	.byte	W12
	.byte			En3, v096
	.byte	W12
	.byte		N09	, Dn3, v104
	.byte	W12
	.byte		N19	, En3, v120
	.byte	W24
	.byte		N10	, Fn3, v096
	.byte	W12
	.byte			Gn3, v092
	.byte	W12
	.byte		TIE	, Gs3, v108
	.byte	W10
	.byte	VOL	, v110
	.byte	W02
	.byte		v109
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v104
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v095
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v085
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v080
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v075
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v065
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v060
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v055
	.byte	W01
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W01
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W01
	.byte		v045
	.byte	W01
	.byte		v044
	.byte	W02
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W01
	.byte		v038
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W01
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W01
	.byte		v028
	.byte	W01
	.byte		v026
	.byte	W01
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W01
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		EOT	
	.byte	VOL	, v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W92
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		v110
	.byte	W96
	.byte		v110
	.byte		N36	, Bn2, v084
	.byte		N36	, Ds3
	.byte	W05
	.byte	VOL	, v097
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v110
	.byte	W04
	.byte		N60	, Cs3, v096
	.byte		N60	, Fn3
	.byte	W05
	.byte	VOL	, v107
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v110
	.byte	W05
	.byte		v110
	.byte		N36	, Ds3, v116
	.byte		N36	, Fs3
	.byte	W05
	.byte	VOL	, v097
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v110
	.byte	W04
	.byte		N60	, Fn3, v127
	.byte		N60	, Gs3
	.byte	W05
	.byte	VOL	, v107
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v110
	.byte	W05
	.byte		v110
	.byte		N36	, Cn3, v096
	.byte		N36	, En3
	.byte	W05
	.byte	VOL	, v097
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v110
	.byte	W04
	.byte		N60	, Dn3, v104
	.byte		N60	, Fs3
	.byte	W05
	.byte	VOL	, v107
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v110
	.byte	W05
	.byte		v110
	.byte		N36	, Ds3, v120
	.byte		N36	, Gn3
	.byte	W05
	.byte	VOL	, v097
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v070
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v090
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v110
	.byte	W04
	.byte		N60	, Fn3, v127
	.byte		N60	, An3
	.byte	W05
	.byte	VOL	, v107
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v056
	.byte	W01
	.byte		v057
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v059
	.byte	W01
	.byte		v061
	.byte	W01
	.byte		v062
	.byte	W01
	.byte		v063
	.byte	W01
	.byte		v064
	.byte	W01
	.byte		v066
	.byte	W01
	.byte		v067
	.byte	W01
	.byte		v068
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v071
	.byte	W01
	.byte		v072
	.byte	W01
	.byte		v073
	.byte	W01
	.byte		v074
	.byte	W01
	.byte		v076
	.byte	W01
	.byte		v077
	.byte	W01
	.byte		v078
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v081
	.byte	W01
	.byte		v082
	.byte	W01
	.byte		v083
	.byte	W01
	.byte		v084
	.byte	W01
	.byte		v086
	.byte	W01
	.byte		v087
	.byte	W01
	.byte		v088
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v091
	.byte	W01
	.byte		v092
	.byte	W01
	.byte		v093
	.byte	W01
	.byte		v094
	.byte	W01
	.byte		v096
	.byte	W01
	.byte		v097
	.byte	W01
	.byte		v098
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v100
	.byte	W01
	.byte		v101
	.byte	W01
	.byte		v102
	.byte	W01
	.byte		v103
	.byte	W01
	.byte		v105
	.byte	W01
	.byte		v106
	.byte	W01
	.byte		v107
	.byte	W01
	.byte		v108
	.byte	W01
	.byte		v110
	.byte	W05
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N04	, Fn2, v104
	.byte		N04	, Fn3
	.byte	W04
	.byte			Gn2, v120
	.byte		N04	, Gn3
	.byte	W04
	.byte			Gs2, v112
	.byte		N04	, Gs3
	.byte	W04
	.byte			As2, v124
	.byte		N04	, As3
	.byte	W04
	.byte			Cn3, v116
	.byte		N04	, Cn4
	.byte	W04
	.byte			Dn3, v127
	.byte		N04	, Dn4
	.byte	W04
	.byte		N08	, Ds3
	.byte		N08	, Ds4
	.byte	W96
song040_6_4:
	.byte	W12
	.byte		N11	, As2, v080
	.byte		N11	, As3
	.byte	W12
	.byte		N09	, Cn3, v084
	.byte		N09	, Cn4
	.byte	W12
	.byte		N07	, Ds3, v088
	.byte		N07	, Ds4
	.byte	W24
	.byte		N16	, Ds2, v080
	.byte		N16	, Ds3
	.byte	W24
	.byte		TIE	, Ds2, v072
	.byte		TIE	, Ds3
	.byte	W12
	.byte	PEND
	.byte	W96
	.byte	W24
	.byte	W03
	.byte		EOT	, Ds2
	.byte			Ds3
	.byte	W44
	.byte	W01
	.byte		N04	, Fn2, v104
	.byte		N04	, Fn3
	.byte	W04
	.byte			Gn2, v120
	.byte		N04	, Gn3
	.byte	W04
	.byte			Gs2, v112
	.byte		N04	, Gs3
	.byte	W04
	.byte			As2, v124
	.byte		N04	, As3
	.byte	W04
	.byte			Cn3, v116
	.byte		N04	, Cn4
	.byte	W04
	.byte			Dn3, v127
	.byte		N04	, Dn4
	.byte	W04
	.byte		N08	, Ds3
	.byte		N08	, Ds4
	.byte	W96
	.byte	PATT	
		mPtr	song040_6_4
	.byte	W96
	.byte	W24
	.byte	W03
	.byte		EOT	, Ds2
	.byte			Ds3
	.byte	W44
	.byte	W01
	.byte		N04	, Fn2, v104
	.byte		N04	, Fn3
	.byte	W04
	.byte			Gn2, v120
	.byte		N04	, Gn3
	.byte	W04
	.byte			Gs2, v112
	.byte		N04	, Gs3
	.byte	W04
	.byte			As2, v124
	.byte		N04	, As3
	.byte	W04
	.byte			Cn3, v116
	.byte		N04	, Cn4
	.byte	W04
	.byte			Dn3, v127
	.byte		N04	, Dn4
	.byte	W04
	.byte		N80	, Ds3, v068
	.byte		N08	, Ds4, v127
	.byte	W84
	.byte		N05	, Ds3, v108
	.byte	W06
	.byte			Ds3, v124
	.byte	W06
	.byte		N88	, Ds3, v100
	.byte		N88	, Gn3
	.byte	W96
	.byte		N78	
	.byte		N80	, As3, v124
	.byte	W84
	.byte		N04	, Gn3, v100
	.byte		N05	, As3, v124
	.byte	W06
	.byte		N04	, Gn3, v108
	.byte		N05	, As3, v127
	.byte	W06
	.byte		N84	, Gn3
	.byte		N88	, As3
	.byte	W96
	.byte		N12	, Ds3, v124
	.byte		N13	, Ds4, v127
	.byte	W48
	.byte		N14	, Ds1, v124
	.byte		N14	, Ds2, v127
	.byte	W14
	.byte	FINE

	@********************** Track  7 **********************@

	.global song040_7
song040_7:	@ 0x087B7547
	.byte	KEYSH	, 0
	.byte	VOICE	, 85
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	VOL	, v127
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
song040_7_1:
	.byte		N05	, Gn2, v100
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte			Gn2, v088
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte			Gn2, v104
	.byte	W12
	.byte	PEND
	.byte			Gn2, v100
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte	PATT	
		mPtr	song040_7_1
	.byte		N05	, Gn2, v100
	.byte	W12
	.byte			Gn2, v096
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			Gn2, v092
	.byte	W12
	.byte			Gn2, v096
	.byte	W06
	.byte			Gn2, v088
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Gn2, v096
	.byte	W05
	.byte	FINE

	@********************** Track  8 **********************@

	.global song040_8
song040_8:	@ 0x087B75A8
	.byte	KEYSH	, 0
	.byte	VOICE	, 0
	.byte	VOL	, v055
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 2
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W92
	.byte	BEND	, c_v-64
	.byte	W04
	.byte		TIE	, Gn4, v100
	.byte	W72
	.byte	W03
	.byte	BEND	, c_v-64
	.byte	W02
	.byte		c_v-59
	.byte	W01
	.byte		c_v-54
	.byte	W02
	.byte		c_v-49
	.byte	W01
	.byte		c_v-44
	.byte	W02
	.byte		c_v-39
	.byte	W01
	.byte		c_v-34
	.byte	W02
	.byte		c_v-29
	.byte	W01
	.byte		c_v-24
	.byte	W02
	.byte		c_v-19
	.byte	W01
	.byte		c_v-14
	.byte	W02
	.byte		c_v-9
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte	W02
	.byte	W80
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N22	, Gn3, v127
	.byte	W12
	.byte	W12
	.byte		N09	
	.byte	W84
	.byte	W60
	.byte		N11	, Dn4
	.byte	W12
	.byte		N05	, Cn4, v120
	.byte	W12
	.byte		N68	, As3, v127
	.byte	W12
	.byte	W60
	.byte		N11	, Fn3, v108
	.byte	W12
	.byte		N05	, Gn3
	.byte	W12
	.byte		N64	, Cn4, v127
	.byte	W12
	.byte	W60
	.byte		N11	, Gn3, v108
	.byte	W12
	.byte		N08	, An3, v096
	.byte	W12
	.byte		N21	, Bn3, v127
	.byte	W12
	.byte	W12
	.byte		N11	
	.byte	W84
	.byte	W60
	.byte			Dn4
	.byte	W12
	.byte		N05	, Cn4, v112
	.byte	W12
	.byte		N68	, As3, v127
	.byte	W12
	.byte	W60
	.byte		N05	, Fn3, v088
	.byte	W12
	.byte		N03	, Gn3, v096
	.byte	W12
	.byte		N64	, Cn4, v124
	.byte	W12
	.byte	W72
	.byte		N04	, Cs4, v112
	.byte	W12
	.byte		N44	, Dn4
	.byte	W12
	.byte	W36
	.byte		N10	, Dn4, v108
	.byte	W60
song040_8_1:
	.byte	W60
	.byte		N11	, An4, v127
	.byte	W12
	.byte		N06	, Gn4
	.byte	W12
	.byte		N60	, Fn4
	.byte	W12
	.byte	PEND
song040_8_2:
	.byte	W60
	.byte		N17	, Fn3, v127
	.byte	W24
	.byte		N66	, Dn4
	.byte	W12
	.byte	PEND
	.byte	W60
	.byte		N11	
	.byte	W12
	.byte		N05	, En4
	.byte	W12
	.byte			Fn4
	.byte	W06
	.byte		N32	, Fs4
	.byte	W06
	.byte	W36
	.byte		N10	
	.byte	W60
	.byte	PATT	
		mPtr	song040_8_1
	.byte	PATT	
		mPtr	song040_8_2
	.byte	W60
	.byte		N11	, Fn4, v127
	.byte	W12
	.byte		N08	, Gn4
	.byte	W12
	.byte		N23	, En4
	.byte	W12
	.byte	W12
	.byte		N28	, An4
	.byte	W36
	.byte		N42	, En4
	.byte	W48
	.byte		N13	, En3
	.byte	W60
	.byte		N05	, An3
	.byte	W12
	.byte		N11	, Fn4
	.byte	W12
	.byte		N21	, Dn4
	.byte	W12
	.byte	W24
	.byte		N16	, Cn4
	.byte	W24
	.byte		N15	, Bn3
	.byte	W24
	.byte		N17	, As3
	.byte	W24
	.byte		N18	, An3
	.byte	W24
	.byte		N10	, Dn4
	.byte	W12
	.byte		N24	, Gn3
	.byte	W36
	.byte		N11	, Fn3
	.byte	W12
	.byte		N76	, Dn3
	.byte	W12
	.byte	W72
	.byte		N20	, Gn3
	.byte	W24
	.byte		N11	, Dn4
	.byte	W12
	.byte			Cn4
	.byte	W12
	.byte			As3
	.byte	W12
	.byte		N23	, Cn4
	.byte	W24
	.byte		N11	, As3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte			Fs3
	.byte	W12
	.byte		N11	
	.byte	W12
	.byte		N10	, Fs4
	.byte	W36
	.byte		N11	, Cn4
	.byte	W24
	.byte		N15	, Bn3
	.byte	W24
	.byte		N18	, An3
	.byte	W24
	.byte		N10	, Dn4
	.byte	W12
	.byte		N24	, Gn3
	.byte	W36
	.byte		N11	, Dn4
	.byte	W12
	.byte		N76	, Gn3
	.byte	W12
	.byte	W72
	.byte		N20	, Dn3
	.byte	W24
	.byte	VOL	, v055
	.byte		N11	, Dn4, v100
	.byte	W12
	.byte			Cn4, v096
	.byte	W12
	.byte		N09	, As3, v104
	.byte	W12
	.byte		N19	, Cn4, v120
	.byte	W24
	.byte		N10	, Dn4, v096
	.byte	W12
	.byte			En4, v092
	.byte	W12
	.byte		TIE	, Fn4, v108
	.byte	W09
	.byte	VOL	, v055
	.byte	W03
	.byte		v054
	.byte	W01
	.byte		v053
	.byte	W02
	.byte		v052
	.byte	W01
	.byte		v051
	.byte	W01
	.byte		v050
	.byte	W02
	.byte		v049
	.byte	W01
	.byte		v048
	.byte	W01
	.byte		v047
	.byte	W02
	.byte		v046
	.byte	W01
	.byte		v045
	.byte	W02
	.byte		v044
	.byte	W01
	.byte		v043
	.byte	W01
	.byte		v042
	.byte	W02
	.byte		v041
	.byte	W01
	.byte		v040
	.byte	W01
	.byte		v039
	.byte	W02
	.byte		v038
	.byte	W01
	.byte		v037
	.byte	W02
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	W01
	.byte		v034
	.byte	W02
	.byte		v033
	.byte	W01
	.byte		v032
	.byte	W01
	.byte		v031
	.byte	W02
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	W02
	.byte		v028
	.byte	W01
	.byte		v027
	.byte	W01
	.byte		v026
	.byte	W02
	.byte		v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	W02
	.byte		v022
	.byte	W01
	.byte		v021
	.byte	W02
	.byte		v020
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W02
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W02
	.byte		v014
	.byte	W01
	.byte		v013
	.byte	W02
	.byte		v012
	.byte	W01
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W02
	.byte		v009
	.byte	W01
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W02
	.byte		v006
	.byte	W01
	.byte		v005
	.byte	W02
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W01
	.byte		v002
	.byte	W02
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W14
	.byte		EOT	
	.byte	W08
	.byte	VOICE	, 2
	.byte	VOL	, v065
	.byte	PAN	, c_v
	.byte	BENDR	, 12
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 2
	.byte	MODT	, 0
	.byte	W96
song040_8_3:
	.byte	W48
	.byte		N04	, Ds2, v004
	.byte	W04
	.byte			Fn2
	.byte	W04
	.byte			Gn2, v008
	.byte	W04
	.byte			As2, v012
	.byte	W04
	.byte			Ds3
	.byte	W04
	.byte			Fn3, v016
	.byte	W04
	.byte			Gn3, v020
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Ds4, v024
	.byte	W04
	.byte			As3, v028
	.byte	W04
	.byte			Gn3, v032
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte	PEND
song040_8_4:
	.byte		N04	, Ds3, v036
	.byte	W04
	.byte			Fn3, v040
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As3, v044
	.byte	W04
	.byte			Ds4, v048
	.byte	W04
	.byte			Fn4, v052
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4, v056
	.byte	W04
	.byte			Ds5, v060
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4, v064
	.byte	W04
	.byte			Fn4, v068
	.byte	W04
	.byte			Ds4, v072
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			Gn4, v076
	.byte	W04
	.byte			As4, v080
	.byte	W04
	.byte			Ds5
	.byte	W04
	.byte			Fn5, v084
	.byte	W04
	.byte			Gn5, v072
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Ds6, v068
	.byte	W04
	.byte			As5
	.byte	W04
	.byte			Gn5, v064
	.byte	W04
	.byte			Fn5
	.byte	W04
	.byte	PEND
	.byte			Ds5, v060
	.byte	W04
	.byte			As4, v056
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			Fn4, v052
	.byte	W04
	.byte			Gn4
	.byte	W04
	.byte			As4, v048
	.byte	W04
	.byte			Ds5, v044
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gn4, v040
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			Ds4, v036
	.byte	W04
	.byte			As3, v032
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			Fn3, v028
	.byte	W04
	.byte			Gn3
	.byte	W04
	.byte			As3, v024
	.byte	W04
	.byte			Ds4, v020
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gn3, v016
	.byte	W04
	.byte			Fn3
	.byte	W04
	.byte			Ds3, v012
	.byte	W04
	.byte			As2
	.byte	W04
	.byte			Ds2, v008
	.byte	W08
	.byte	W96
	.byte	PATT	
		mPtr	song040_8_3
	.byte	PATT	
		mPtr	song040_8_4
	.byte		N04	, Fs5, v060
	.byte	W04
	.byte			Cs5, v056
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Gs4, v052
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Cs5, v048
	.byte	W04
	.byte			Fs5, v044
	.byte	W04
	.byte			Cs5
	.byte	W04
	.byte			As4, v040
	.byte	W04
	.byte			Gs4
	.byte	W04
	.byte			Fs4, v036
	.byte	W04
	.byte			Cs4, v032
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Gs3, v028
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Cs4, v024
	.byte	W04
	.byte			Fs4, v020
	.byte	W04
	.byte			Cs4
	.byte	W04
	.byte			As3, v016
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte			Fs3, v012
	.byte	W04
	.byte			Cs3
	.byte	W04
	.byte			Fs2, v008
	.byte	W08
	.byte	W96
	.byte	W96
	.byte			Fs2, v020
	.byte	W04
	.byte			Gs2
	.byte	W04
	.byte			As2, v024
	.byte	W04
	.byte			Cs3, v028
	.byte	W04
	.byte			Fs3
	.byte	W04
	.byte			Gs3, v032
	.byte	W04
	.byte			As3, v036
	.byte	W04
	.byte			Cs4
	.byte	W04
	.byte			Fs4, v040
	.byte	W04
	.byte			Cs4, v044
	.byte	W04
	.byte			As3, v048
	.byte	W04
	.byte			Gs3
	.byte	W04
	.byte			Fs3, v052
	.byte	W04
	.byte			Gs3, v056
	.byte	W04
	.byte			As3
	.byte	W04
	.byte			Cs4, v060
	.byte	W04
	.byte			Fs4, v064
	.byte	W04
	.byte			Gs4, v068
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Cs5, v072
	.byte	W04
	.byte			Fs5, v076
	.byte	W04
	.byte			Cs5
	.byte	W04
	.byte			As4, v080
	.byte	W04
	.byte			Gs4, v084
	.byte	W04
	.byte	W36
	.byte		N06	, Cs4, v044
	.byte	W06
	.byte			As3, v040
	.byte	W06
	.byte			Fs4, v044
	.byte	W06
	.byte			Cs4, v040
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			As3, v048
	.byte	W06
	.byte			Gs3, v060
	.byte	W06
	.byte			Fs3, v056
	.byte	W06
	.byte			Cs3, v060
	.byte	W06
	.byte	W36
	.byte			Ds3, v036
	.byte	W06
	.byte			As2, v048
	.byte	W06
	.byte			Bn2, v036
	.byte	W06
	.byte			Ds3, v044
	.byte	W06
	.byte			Gs3, v056
	.byte	W06
	.byte			Fs3, v048
	.byte	W06
	.byte			Fn3, v040
	.byte	W06
	.byte			Gs3, v060
	.byte	W06
	.byte			Cs4
	.byte	W12
	.byte	W36
	.byte			Dn4, v044
	.byte	W06
	.byte			Bn3, v040
	.byte	W06
	.byte			Gn4, v044
	.byte	W06
	.byte			Dn4, v040
	.byte	W06
	.byte			Bn3, v044
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3, v048
	.byte	W06
	.byte			An3, v060
	.byte	W06
	.byte			Gn3, v056
	.byte	W06
	.byte			Dn3, v060
	.byte	W06
	.byte	W36
	.byte			Gn3, v044
	.byte	W06
	.byte			Ds3, v036
	.byte	W06
	.byte			Fn3, v040
	.byte	W06
	.byte			Gn3, v044
	.byte	W06
	.byte			An3, v048
	.byte	W06
	.byte			As3, v044
	.byte	W06
	.byte		N04	, Gn3, v036
	.byte	W04
	.byte			An3, v044
	.byte	W04
	.byte			As3, v036
	.byte	W04
	.byte			Cn4, v032
	.byte	W04
	.byte			Dn4, v040
	.byte	W04
	.byte			Ds4, v044
	.byte	W04
	.byte		TIE	, Fn4, v048
	.byte	W96
	.byte	W68
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N04	, Fn3, v036
	.byte	W04
	.byte			Gn3, v040
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			As3, v048
	.byte	W04
	.byte			Cn4, v036
	.byte	W04
	.byte			Dn4, v048
	.byte	W04
	.byte		N96	, Ds4
	.byte	W96
	.byte		N48	, As4
	.byte	W48
	.byte			An4
	.byte	W48
	.byte		TIE	, Fn4
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N04	, Fn3, v036
	.byte	W04
	.byte			Gn3, v040
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			As3, v048
	.byte	W04
	.byte			Cn4, v036
	.byte	W04
	.byte			Dn4, v048
	.byte	W04
	.byte		N96	, Cn4
	.byte	W96
	.byte		N48	
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte			Cs4
	.byte	W24
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, As3
	.byte	W96
	.byte		N96	
	.byte	W96
	.byte			Cn4
	.byte	W96
	.byte			Dn4
	.byte	W96
	.byte		TIE	, As3
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Cn4
	.byte	W96
	.byte			Ds4
	.byte	W96
	.byte		TIE	, As3
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Bn3
	.byte	W96
	.byte			Ds4
	.byte	W96
	.byte		TIE	, As3
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N12	, Ds4, v044
	.byte	W48
	.byte			Ds3
	.byte	W12
	.byte	FINE

	@********************** Track  9 **********************@

	.global song040_9
song040_9:	@ 0x087B798F
	.byte	KEYSH	, 0
	.byte	VOICE	, 77
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N36	, Ds4, v056
	.byte	W48
	.byte		N28	, Gn4, v112
	.byte	W48
	.byte		N36	, As4, v120
	.byte	W48
	.byte		N44	, Gs4, v127
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N09	, Gn4, v112
	.byte	W48
	.byte		N30	, As4, v127
	.byte	W48
	.byte		N36	, Bn4, v116
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N12	, Fs4, v112
	.byte	W48
	.byte		N30	, As4, v120
	.byte	W48
	.byte			Cs5, v124
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N44	, As3, v100
	.byte		N44	, Fn4
	.byte	W48
	.byte			Dn4, v104
	.byte		N44	, As4
	.byte	W48
	.byte			Fn4, v092
	.byte		N44	, Dn5
	.byte	W48
	.byte		N92	, Gn4, v120
	.byte		N92	, Ds5
	.byte	W96
	.byte		N76	, As3, v052
	.byte		N76	, Gn4
	.byte	W96
	.byte	W48
	.byte		N44	, Dn4, v060
	.byte		N44	, As4
	.byte	W48
	.byte			Fn4, v112
	.byte		N44	, Dn5
	.byte	W48
	.byte			As4, v088
	.byte		N44	, Fn5
	.byte	W48
	.byte		N72	, Gn4, v092
	.byte		N72	, Ds5
	.byte	W84
	.byte		N05	, Fn4, v072
	.byte		N05	, Dn5
	.byte	W06
	.byte			En4
	.byte		N05	, Cs5
	.byte	W06
	.byte		N68	, Ds4, v080
	.byte		N68	, Cn5
	.byte	W72
	.byte		N23	, Ds4, v096
	.byte		N23	, Cn5
	.byte	W24
	.byte		N44	, Gs4, v112
	.byte		N44	, Ds5
	.byte	W48
	.byte		N48	, Cn4
	.byte		N48	, Gs4
	.byte	W48
	.byte	W24
	.byte		N19	, Cn4, v080
	.byte		N19	, Gs4
	.byte	W24
	.byte		N23	, Gs4, v084
	.byte		N23	, Fn5
	.byte	W24
	.byte		N22	, Gn4, v096
	.byte		N22	, Ds5
	.byte	W24
	.byte		N68	, Fn4, v104
	.byte		N68	, Dn5
	.byte	W72
	.byte		N28	, Dn4, v068
	.byte		N28	, As4
	.byte	W24
	.byte	W48
	.byte		N21	, Cn5, v124
	.byte		N21	, Gs5
	.byte	W24
	.byte		N18	, As4, v072
	.byte		N18	, Gn5
	.byte	W24
	.byte		N44	, Cn5, v120
	.byte		N44	, Gn5
	.byte	W48
	.byte		N60	, Gs4, v088
	.byte		N60	, Ds5
	.byte	W48
	.byte	W24
	.byte		N23	, Fn4, v080
	.byte		N23	, Dn5
	.byte	W24
	.byte			Gn4
	.byte		N23	, Ds5
	.byte	W24
	.byte			Gs4, v100
	.byte		N23	, Fn5
	.byte	W24
	.byte		N30	, Gn4, v116
	.byte		N30	, Ds5
	.byte	W30
	.byte	FINE

	@********************** Track  10 **********************@

	.global song040_10
song040_10:	@ 0x087B7A96
	.byte	KEYSH	, 0
	.byte	VOICE	, 93
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W84
	.byte		N20	, Gn3, v112
	.byte	W12
	.byte	W12
	.byte		N11	, Gn3, v096
	.byte	W12
	.byte		N05	, As3, v068
	.byte		N11	, Bn3, v084
	.byte		N11	, Dn4, v096
	.byte	W12
	.byte			Gn3, v084
	.byte	W12
	.byte			Cn4
	.byte		N11	, En4, v088
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N05	, As3, v056
	.byte		N11	, Bn3, v076
	.byte		N11	, Dn4, v080
	.byte	W12
	.byte		N16	, Gn3, v096
	.byte	W12
	.byte	W12
	.byte		N11	, Gn3, v108
	.byte	W12
	.byte		N05	, As3, v072
	.byte		N10	, Bn3, v084
	.byte		N10	, Dn4, v096
	.byte	W12
	.byte			Gn3, v084
	.byte	W12
	.byte			Cn4
	.byte		N10	, En4, v096
	.byte	W12
	.byte		N11	, Gn3, v076
	.byte	W12
	.byte		N03	, As3, v072
	.byte		N09	, Bn3, v084
	.byte		N09	, Dn4, v096
	.byte	W12
	.byte		N40	, Fn3, v108
	.byte		N44	, Dn4, v104
	.byte	W12
	.byte	W36
	.byte		N07	, Fn3, v088
	.byte		N08	, Dn4, v080
	.byte	W12
	.byte			Fn3, v084
	.byte		N08	, Dn4, v104
	.byte	W12
	.byte		N06	, Fn3, v096
	.byte		N07	, Dn4, v092
	.byte	W12
	.byte			Fn3, v080
	.byte		N11	, Dn4, v096
	.byte	W12
	.byte		N28	, Gn3, v120
	.byte		N30	, En4, v108
	.byte	W12
	.byte	W24
	.byte		N18	, Gn3, v096
	.byte		N19	, En4
	.byte	W24
	.byte		N08	, Gn3, v092
	.byte		N09	, En4, v096
	.byte	W12
	.byte		N20	, Gn3, v104
	.byte		N13	, En4, v096
	.byte	W24
	.byte		N03	, As3, v084
	.byte		N21	, Bn3
	.byte		N21	, Dn4, v092
	.byte	W12
	.byte	W12
	.byte		N10	, Gn3, v100
	.byte	W12
	.byte		N05	, As3, v076
	.byte		N11	, Bn3, v072
	.byte		N11	, Dn4, v092
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte			Cn4, v084
	.byte		N11	, En4, v096
	.byte	W12
	.byte			Gn3
	.byte	W12
	.byte		N03	, As3, v068
	.byte		N11	, Bn3, v080
	.byte		N11	, Dn4, v096
	.byte	W12
	.byte		N17	, Gn3, v092
	.byte	W12
	.byte	W12
	.byte		N11	, Gn3, v104
	.byte	W12
	.byte		N04	, As3, v072
	.byte		N11	, Bn3, v076
	.byte		N11	, Dn4, v096
	.byte	W12
	.byte			Gn3, v088
	.byte	W12
	.byte			Cn4, v076
	.byte		N11	, En4, v100
	.byte	W12
	.byte		N09	, Gn3, v080
	.byte	W12
	.byte		N06	, As3
	.byte		N10	, Bn3, v068
	.byte		N08	, Dn4, v084
	.byte	W12
	.byte		N44	, Fn3, v116
	.byte		N44	, Dn4, v108
	.byte	W12
	.byte	W36
	.byte		N08	, Fn3, v092
	.byte		N07	, Dn4, v108
	.byte	W12
	.byte			Fn3, v104
	.byte		N08	, Dn4
	.byte	W12
	.byte		N19	, Fn3, v092
	.byte		N23	, Dn4, v104
	.byte	W24
	.byte		N30	, Gn3, v116
	.byte		N32	, En4, v108
	.byte	W12
	.byte	W24
	.byte		N18	, Gn3, v092
	.byte		N19	, En4, v100
	.byte	W24
	.byte		N07	, Gn3, v088
	.byte		N07	, En4, v108
	.byte	W12
	.byte		N18	, Gn3, v092
	.byte		N08	, En4
	.byte	W12
	.byte		N07	, En4, v108
	.byte	W12
	.byte		N19	, An3, v096
	.byte		N24	, Fs4, v124
	.byte	W12
	.byte	W12
	.byte		N09	, An3, v076
	.byte	W12
	.byte		N08	, Dn4, v088
	.byte		N11	, Fs4, v108
	.byte	W12
	.byte		N09	, An3, v052
	.byte	W12
	.byte		N03	, Ds4, v072
	.byte		N10	, En4, v096
	.byte		N11	, Gn4
	.byte	W12
	.byte			An3, v072
	.byte	W12
	.byte		N08	, Dn4, v096
	.byte		N11	, Fs4, v108
	.byte	W12
	.byte		N18	, An3, v064
	.byte	W12
	.byte	W12
	.byte		N09	, An3, v100
	.byte	W12
	.byte		N08	, Dn4
	.byte		N11	, Fs4, v112
	.byte	W12
	.byte			An3, v072
	.byte	W12
	.byte		N05	, Ds4, v088
	.byte		N10	, En4, v076
	.byte		N11	, Gn4, v100
	.byte	W12
	.byte			An3, v084
	.byte	W12
	.byte		N08	, Dn4, v096
	.byte		N10	, Fs4, v100
	.byte	W12
	.byte		N40	, An3, v092
	.byte		N40	, Fn4, v076
	.byte	W12
	.byte	W36
	.byte		N09	, An3, v088
	.byte		N08	, Fn4, v096
	.byte	W12
	.byte		N09	, An3, v108
	.byte		N09	, Fn4, v112
	.byte	W12
	.byte		N19	, An3, v104
	.byte		N21	, Fn4
	.byte	W24
	.byte		N32	, Bn3
	.byte		N32	, Dn4
	.byte	W12
	.byte	W24
	.byte		N08	, Bn3, v088
	.byte		N09	, Dn4, v120
	.byte	W12
	.byte		N20	, Bn3, v108
	.byte		N20	, Gn4, v112
	.byte	W24
	.byte		N07	, Bn3, v068
	.byte		N09	, Dn4, v092
	.byte	W12
	.byte		N05	, Bn3, v084
	.byte		N09	, Gn4, v104
	.byte	W12
	.byte		N20	, An3, v072
	.byte		N20	, Fs4
	.byte	W12
	.byte	W12
	.byte		N11	, An3, v080
	.byte	W12
	.byte		N09	, Dn4, v100
	.byte		N11	, Fs4, v108
	.byte	W12
	.byte			An3, v056
	.byte	W12
	.byte		N05	, Ds4, v096
	.byte		N12	, En4, v076
	.byte		N13	, Gn4, v104
	.byte	W12
	.byte		N11	, An3, v076
	.byte	W12
	.byte			Dn4, v096
	.byte		N11	, Fs4, v108
	.byte	W12
	.byte		N16	, An3, v076
	.byte	W12
	.byte	W12
	.byte		N12	
	.byte	W12
	.byte		N11	, Dn4, v100
	.byte		N11	, Fs4, v104
	.byte	W12
	.byte			An3, v080
	.byte	W12
	.byte		N06	, Ds4, v068
	.byte		N09	, En4, v076
	.byte		N10	, Gn4, v096
	.byte	W12
	.byte		N11	, An3, v092
	.byte	W12
	.byte		N08	, Dn4, v096
	.byte		N09	, Fs4, v108
	.byte	W12
	.byte		N30	, An3, v100
	.byte		N36	, Fn4, v112
	.byte	W12
	.byte	W36
	.byte		N05	, An3, v076
	.byte		N08	, Fn4, v096
	.byte	W12
	.byte			An3
	.byte		N08	, Fn4
	.byte	W12
	.byte		N09	, An3, v104
	.byte		N10	, Fn4, v092
	.byte	W12
	.byte		N07	, An3, v076
	.byte		N12	, Fn4, v064
	.byte	W12
	.byte		N05	, Bn3, v112
	.byte		N28	, Dn4, v104
	.byte	W12
	.byte	W24
	.byte		N11	, Cn4, v076
	.byte		N14	, Gn4, v100
	.byte	W24
	.byte		N08	, Bn3, v084
	.byte		N08	, Gn4, v104
	.byte	W12
	.byte		N06	, Bn3, v044
	.byte		N08	, Gn4, v072
	.byte	W12
	.byte		N06	, Bn3, v068
	.byte		N07	, Gn4, v092
	.byte	W12
	.byte		N13	, Dn4, v096
	.byte		N15	, An4, v108
	.byte	W12
	.byte	W12
	.byte		N08	, Dn4, v096
	.byte		N07	, An4, v084
	.byte	W12
	.byte			Dn4, v096
	.byte		N08	, An4, v112
	.byte	W12
	.byte		N06	, Dn4, v088
	.byte		N08	, An4, v096
	.byte	W12
	.byte			Dn4
	.byte		N07	, An4, v084
	.byte	W12
	.byte			Dn4, v096
	.byte		N08	, An4, v112
	.byte	W12
	.byte		N06	, Dn4, v088
	.byte		N08	, An4, v096
	.byte	W12
	.byte		N10	, Dn4, v092
	.byte		N10	, An4, v104
	.byte	W12
	.byte		N14	, Cs4, v116
	.byte		N12	, An4, v124
	.byte	W36
	.byte		N10	, Cs4, v116
	.byte		N19	, An4, v112
	.byte	W24
	.byte		N07	, Cs4, v104
	.byte		N07	, An4, v096
	.byte	W12
	.byte		N11	, Cs4, v080
	.byte		N09	, An4, v100
	.byte	W24
	.byte	W12
	.byte		N02	, Dn4, v084
	.byte		N03	, An4
	.byte	W12
	.byte		N10	, Fn4, v112
	.byte		N14	, An4, v108
	.byte	W12
	.byte		N06	, Fs4, v072
	.byte	W12
	.byte		N10	, Dn4, v096
	.byte		N11	, An4, v092
	.byte	W12
	.byte		N04	, An3, v032
	.byte	W12
	.byte		N10	, Dn4, v096
	.byte		N10	, An4, v100
	.byte	W12
	.byte		N03	, An3, v072
	.byte	W12
	.byte		N07	, An3, v096
	.byte		N07	, Cn4
	.byte	W12
	.byte		N08	, An3, v084
	.byte		N11	, Cn4
	.byte	W12
	.byte		N06	, Gn3, v076
	.byte		N05	, Bn3
	.byte	W12
	.byte		N14	, Fs3, v096
	.byte		N16	, An3, v084
	.byte	W24
	.byte		N09	, Dn3, v076
	.byte	W12
	.byte		N10	, Fs3, v084
	.byte		N11	, An3, v096
	.byte	W12
	.byte		N13	, Dn3, v092
	.byte	W12
	.byte	W12
	.byte		N06	, An3, v108
	.byte		N07	, Cn4, v104
	.byte	W12
	.byte		N17	, An3, v084
	.byte		N16	, Cn4, v096
	.byte	W24
	.byte		N14	, Gn3, v104
	.byte		N17	, Bn3, v096
	.byte	W24
	.byte		N11	, Fn3
	.byte		N14	, An3, v088
	.byte	W24
	.byte		N11	, As3, v116
	.byte		N11	, Dn4, v112
	.byte	W12
	.byte			Fn3, v088
	.byte	W12
	.byte		N08	, As3, v096
	.byte		N07	, Dn4
	.byte	W12
	.byte		N22	, Cn4, v108
	.byte		N21	, En4, v116
	.byte	W24
	.byte		N09	, Gn3, v088
	.byte	W12
	.byte		N11	, Cn4, v092
	.byte		N11	, En4, v104
	.byte	W12
	.byte			An3, v088
	.byte	W12
	.byte		N13	
	.byte	W12
	.byte		N06	, Dn4, v080
	.byte	W12
	.byte		N10	, An3, v084
	.byte		N10	, Fs4
	.byte	W12
	.byte			An3
	.byte		N10	, Fs4
	.byte	W12
	.byte		N09	, Fn4, v108
	.byte		N14	, An4, v104
	.byte	W12
	.byte		N06	, Fs4, v096
	.byte	W12
	.byte		N08	, Dn4, v100
	.byte		N11	, An4, v092
	.byte	W12
	.byte		N08	, An3, v032
	.byte	W12
	.byte		N06	, An3, v100
	.byte		N06	, Cn4, v108
	.byte	W12
	.byte		N09	, An3, v096
	.byte		N11	, Cn4
	.byte	W12
	.byte		N08	, Gn3, v080
	.byte		N04	, Bn3, v084
	.byte	W12
	.byte		N14	, Fs3, v068
	.byte		N16	, An3
	.byte	W24
	.byte		N08	, Dn3, v072
	.byte	W12
	.byte		N10	, Fs3, v080
	.byte		N11	, An3, v096
	.byte	W12
	.byte		N13	, Dn3, v076
	.byte	W12
	.byte	W12
	.byte		N06	, An3, v104
	.byte		N06	, Cn4
	.byte	W12
	.byte		N17	, An3, v084
	.byte		N17	, Cn4, v076
	.byte	W24
	.byte		N12	, Gn3, v104
	.byte		N17	, Bn3, v096
	.byte	W24
	.byte		N10	, Fs3, v080
	.byte		N10	, An3, v068
	.byte	W12
	.byte		N06	, Dn3, v080
	.byte	W12
	.byte		N11	, As3, v108
	.byte		N24	, Dn4, v112
	.byte	W12
	.byte		N11	, Fn3, v084
	.byte	W12
	.byte		N08	, As3, v100
	.byte	W12
	.byte		N21	, Cn4, v104
	.byte		N20	, En4
	.byte	W24
	.byte		N11	, Gn3, v096
	.byte	W12
	.byte			Cn4
	.byte		N11	, En4
	.byte	W12
	.byte		N21	, Cs4, v104
	.byte		N20	, Fn4
	.byte	W12
	.byte	W09
	.byte	FINE

	@********************** Track  11 **********************@

	.global song040_11
song040_11:	@ 0x087B7E63
	.byte	KEYSH	, 0
	.byte	VOICE	, 95
	.byte	VOL	, v110
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W48
	.byte		N44	, Gs2, v100
	.byte	W48
	.byte		N92	, Cs3, v116
	.byte	W48
	.byte		N44	, Gs3, v112
	.byte	W48
	.byte			Ds3, v076
	.byte		N92	, Gn3, v088
	.byte	W48
	.byte		N44	, As2, v076
	.byte	W48
	.byte			As2, v080
	.byte		N92	, Ds3, v068
	.byte	W48
	.byte		N44	, Cn3, v080
	.byte	W48
	.byte			Gs2, v096
	.byte		TIE	, Cs3
	.byte	W48
	.byte		N44	, Fn3, v084
	.byte	W48
	.byte			Gs3, v092
	.byte	W44
	.byte	W03
	.byte		EOT	, Cs3
	.byte	W01
	.byte		N44	, Fn3, v096
	.byte		N44	, Cs4, v068
	.byte	W48
	.byte			Gn3, v100
	.byte		N92	, Ds4
	.byte	W48
	.byte		N44	, As2
	.byte	W48
	.byte		N48	, Fn3, v112
	.byte		N92	, As3, v100
	.byte	W48
	.byte		N44	, Ds3, v112
	.byte	W48
	.byte		TIE	, Bn2, v092
	.byte		N44	, Fs3, v080
	.byte	W48
	.byte			Fn3, v112
	.byte	W48
	.byte			Fs3, v104
	.byte	W44
	.byte	W03
	.byte		EOT	, Bn2
	.byte	W01
	.byte		N44	, Bn2, v124
	.byte		N44	, Ds4
	.byte	W48
	.byte			Fs3
	.byte		N92	, Cs4
	.byte	W48
	.byte		N44	, Cs3, v104
	.byte	W48
	.byte			Fs3, v100
	.byte		N92	, Fs4, v120
	.byte	W48
	.byte		N44	, As3, v100
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte			As2, v080
	.byte	W48
	.byte			As3, v104
	.byte	W48
	.byte		N92	, Gs3, v088
	.byte	W96
	.byte		N44	, Ds3, v068
	.byte	W48
	.byte			Gs3, v080
	.byte	W48
	.byte		TIE	, Gn3, v096
	.byte	W96
	.byte	W30
	.byte	W01
	.byte		EOT	
	.byte	W64
	.byte	W01
	.byte		N92	, Bn2, v080
	.byte	W96
	.byte		N44	, Fs3
	.byte	W48
	.byte			Bn3, v096
	.byte	W48
	.byte		TIE	, As3, v108
	.byte	W96
	.byte	W64
	.byte	W01
	.byte		EOT	
	.byte	W07
	.byte		N23	, As2, v112
	.byte	W24
	.byte		TIE	, As3, v124
	.byte	W96
	.byte	W44
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N44	, As2, v112
	.byte	W44
	.byte	W03
	.byte	FINE

	@********************** Track  12 **********************@

	.global song040_12
song040_12:	@ 0x087B7F59
	.byte	KEYSH	, 0
	.byte	VOICE	, 98
	.byte	VOL	, v127
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 31
	.byte	LFODL	, 22
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte	W48
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W36
	.byte		N06	, Cs4, v116
	.byte	W06
	.byte			As3, v112
	.byte	W06
	.byte			Fs4, v116
	.byte	W06
	.byte			Cs4, v112
	.byte	W06
	.byte			As3, v116
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			As3, v120
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Fs3, v124
	.byte	W06
	.byte			Cs3, v127
	.byte	W06
	.byte	W36
	.byte			Ds3, v108
	.byte	W06
	.byte			As2, v120
	.byte	W06
	.byte			Bn2, v104
	.byte	W06
	.byte			Ds3, v116
	.byte	W06
	.byte			Gs3, v124
	.byte	W06
	.byte			Fs3, v120
	.byte	W06
	.byte			Fn3, v108
	.byte	W06
	.byte			Gs3, v127
	.byte	W06
	.byte			Cs4
	.byte	W12
	.byte	W36
	.byte			Dn4, v116
	.byte	W06
	.byte			Bn3, v112
	.byte	W06
	.byte			Gn4, v116
	.byte	W06
	.byte			Dn4, v112
	.byte	W06
	.byte			Bn3, v116
	.byte	W06
	.byte			Gn3
	.byte	W06
	.byte			Bn3, v120
	.byte	W06
	.byte			An3, v127
	.byte	W06
	.byte			Gn3, v124
	.byte	W06
	.byte			Dn3, v127
	.byte	W06
	.byte	W36
	.byte			Gn3, v116
	.byte	W06
	.byte			Ds3, v108
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Gn3, v112
	.byte	W06
	.byte			An3, v116
	.byte	W06
	.byte			As3
	.byte	W06
	.byte		N04	, Gn3, v104
	.byte	W04
	.byte			An3, v112
	.byte	W04
	.byte			As3, v108
	.byte	W04
	.byte			Cn4, v100
	.byte	W04
	.byte			Dn4, v108
	.byte	W04
	.byte			Ds4, v116
	.byte	W04
	.byte	VOL	, v060
	.byte		TIE	, Fn4
	.byte	W96
	.byte	W68
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N04	, Fn3, v104
	.byte	W04
	.byte			Gn3, v108
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			As3, v120
	.byte	W04
	.byte			Cn4, v104
	.byte	W04
	.byte			Dn4, v116
	.byte	W04
	.byte		N96	, Ds4
	.byte	W96
	.byte		N48	, As4
	.byte	W48
	.byte			An4
	.byte	W48
	.byte		TIE	, Fn4
	.byte	W96
	.byte	W72
	.byte		EOT	
	.byte		N04	, Fn3, v104
	.byte	W04
	.byte			Gn3, v108
	.byte	W04
	.byte			An3
	.byte	W04
	.byte			As3, v120
	.byte	W04
	.byte			Cn4, v104
	.byte	W04
	.byte			Dn4, v116
	.byte	W04
	.byte		N96	, Ds4
	.byte	W96
	.byte		N48	
	.byte	W48
	.byte		N24	
	.byte	W24
	.byte			En4
	.byte	W24
	.byte		TIE	, Ds4
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Dn4
	.byte	W96
	.byte			En4
	.byte	W96
	.byte			Ds4
	.byte	W96
	.byte			Gs4
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Ds4
	.byte	W96
	.byte			Gs4
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		N96	, Ds4
	.byte	W96
	.byte			Fs4
	.byte	W96
	.byte		TIE	, Gn4
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte		TIE	
	.byte	W96
	.byte	W96
	.byte		EOT	
	.byte	FINE

	mAlignWord
	.global C_DECL(song040)
C_DECL(song040):	@ 0x087B8084
	.byte	12		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	178		@ reverb

mAlignWord
	mPtr	voicegroup000		@ voicegroup/tone

	mPtr	song040_1		@ track
	mPtr	song040_2		@ track
	mPtr	song040_3		@ track
	mPtr	song040_4		@ track
	mPtr	song040_5		@ track
	mPtr	song040_6		@ track
	mPtr	song040_7		@ track
	mPtr	song040_8		@ track
	mPtr	song040_9		@ track
	mPtr	song040_10		@ track
	mPtr	song040_11		@ track
	mPtr	song040_12		@ track
