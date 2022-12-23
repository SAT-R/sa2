	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0002_1
song0002_1:	@ 0x0201E614
	.byte	KEYSH	, 0
	.byte	TEMPO	, 40
	.byte	VOICE	, 72
	.byte	VOL	, v075
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 38
	.byte	MOD	, 25
	.byte	MODT	, 2
	.byte		N23	, En3, v127
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Cn3
	.byte	W24
song0002_1_1:
	.byte		N23	, Dn3, v127
	.byte	W24
	.byte			En3
	.byte	W24
	.byte			Fn3
	.byte	W24
	.byte	PEND
	.byte			En3
	.byte	W24
	.byte		N11	, Dn3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Bn2, v120
	.byte	W12
	.byte		N10	, En3, v127
	.byte	W04
song0002_1_4:
	.byte	W08
song0002_1_2:
	.byte		N23	, En3, v127
	.byte	W24
	.byte		N18	, An2
	.byte	W24
	.byte		N11	
	.byte	W12
	.byte			Bn2
	.byte	W12
	.byte	PEND
song0002_1_3:
	.byte		N23	, Cn3, v127
	.byte	W24
	.byte		N22	, An2
	.byte	W24
	.byte		N11	, Bn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte	PEND
	.byte		N54	, An2
	.byte	W72
	.byte		N23	, En3
	.byte	W24
	.byte			An2
	.byte	W24
	.byte			Cn3
	.byte	W24
	.byte	PATT	
		.word	song0002_1_1
	.byte		N23	, En3, v127
	.byte	W24
	.byte		N11	, Dn3
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			Bn2, v120
	.byte	W12
	.byte		N10	, En3, v127
	.byte	W12
	.byte	PATT	
		.word	song0002_1_2
	.byte	PATT	
		.word	song0002_1_3
	.byte		N68	, An2, v127
	.byte	W72
	.byte		N44	
	.byte	W48
	.byte		N23	, Gn2
	.byte	W24
	.byte		TIE	, An2
	.byte	W72
	.byte	W68
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W64
	.byte	GOTO	
		.word	song0002_1_4
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0002_2
song0002_2:	@ 0x0201E6C2
	.byte	KEYSH	, 0
	.byte	VOICE	, 54
	.byte	VOL	, v070
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N11	, An1, v112
	.byte	W12
	.byte			En2, v100
	.byte	W12
	.byte		N44	, An2, v092
	.byte	W48
song0002_2_1:
	.byte		N11	, An1, v104
	.byte	W12
	.byte			Fn2, v108
	.byte	W12
	.byte		N44	, An2, v100
	.byte	W48
	.byte	PEND
	.byte		N11	, An1, v108
	.byte	W12
	.byte			En2, v092
	.byte	W12
	.byte		N23	, An2, v104
	.byte	W24
	.byte			Gn1, v124
	.byte	W16
song0002_2_4:
	.byte	W08
song0002_2_2:
	.byte		N11	, Fn1, v124
	.byte	W12
	.byte			Cn2, v116
	.byte	W12
	.byte		N23	, Fn2, v084
	.byte	W24
	.byte		N11	, Fn1, v096
	.byte	W12
	.byte			En1, v112
	.byte	W12
	.byte	PEND
song0002_2_3:
	.byte		N11	, Dn1, v116
	.byte	W12
	.byte			An1, v120
	.byte	W12
	.byte		N23	, Fn2, v088
	.byte	W24
	.byte			En1, v124
	.byte	W24
	.byte	PEND
	.byte		N11	, An1, v120
	.byte	W12
	.byte			En2, v112
	.byte	W12
	.byte		N40	, An2, v096
	.byte	W48
	.byte		N11	, An1, v112
	.byte	W12
	.byte			En2, v100
	.byte	W12
	.byte		N44	, An2, v092
	.byte	W48
	.byte	PATT	
		.word	song0002_2_1
	.byte		N11	, An1, v108
	.byte	W12
	.byte			En2, v092
	.byte	W12
	.byte		N23	, An2, v104
	.byte	W24
	.byte			Gn1, v124
	.byte	W24
	.byte	PATT	
		.word	song0002_2_2
	.byte	PATT	
		.word	song0002_2_3
	.byte		N11	, Fn1, v120
	.byte	W12
	.byte			Cn2, v112
	.byte	W12
	.byte		N44	, Fn2, v096
	.byte	W48
	.byte		N11	, Gn1, v120
	.byte	W12
	.byte			Dn2, v112
	.byte	W12
	.byte		N23	, Gn2, v096
	.byte	W24
	.byte			Gn1
	.byte	W24
	.byte		N11	, An1, v120
	.byte	W12
	.byte			En2, v112
	.byte	W12
	.byte		N23	, An2, v096
	.byte	W24
	.byte			En2
	.byte	W24
	.byte		N64	, An1
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W64
	.byte	GOTO	
		.word	song0002_2_4
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0002_3
song0002_3:	@ 0x0201E79F
	.byte	KEYSH	, 0
	.byte	VOICE	, 55
	.byte	VOL	, v120
	.byte	PAN	, c_v
	.byte	BENDR	, 3
	.byte	LFOS	, 33
	.byte	MOD	, 0
	.byte	MODT	, 0
	.byte		N11	, Cn2, v127
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N11	
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			Cn3
	.byte	W08
	.byte			En2
	.byte	W12
song0002_3_1:
	.byte		N11	, Dn2, v127
	.byte	W02
	.byte			Fn2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte	PEND
	.byte			Cn2
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N11	
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Bn2
	.byte	W08
	.byte			En2
	.byte	W04
song0002_3_4:
	.byte	W08
song0002_3_2:
	.byte		N11	, Cn2, v127
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte		N11	
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			Cn3
	.byte	W08
	.byte			Fn2
	.byte	W12
	.byte	PEND
song0002_3_3:
	.byte		N11	, Dn2, v127
	.byte	W02
	.byte			Fn2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			En2
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Bn2
	.byte	W08
	.byte			En2
	.byte	W12
	.byte	PEND
	.byte			Cn2
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			Cn2
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N11	
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			Cn3
	.byte	W08
	.byte			En2
	.byte	W12
	.byte	PATT	
		.word	song0002_3_1
	.byte		N11	, Cn2, v127
	.byte	W02
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N11	
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Bn2
	.byte	W08
	.byte			En2
	.byte	W12
	.byte	PATT	
		.word	song0002_3_2
	.byte	PATT	
		.word	song0002_3_3
	.byte		N11	, Cn2, v127
	.byte	W02
	.byte			Fn2
	.byte	W02
	.byte			An2
	.byte	W08
	.byte			An1
	.byte	W12
	.byte			Cn2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Fn2
	.byte	W12
	.byte			Dn2
	.byte	W02
	.byte			Gn2
	.byte	W02
	.byte			Bn2
	.byte	W08
	.byte			Bn1
	.byte	W12
	.byte			Dn2
	.byte	W12
	.byte			Gn2
	.byte	W12
	.byte			Dn2
	.byte	W02
	.byte		N09	, Gn2
	.byte	W02
	.byte		N11	, Bn2
	.byte	W08
	.byte			Gn2
	.byte	W12
	.byte			En2
	.byte	W02
	.byte			An2
	.byte	W02
	.byte			Cn3
	.byte	W08
	.byte			Cn2
	.byte	W12
	.byte			En2
	.byte	W12
	.byte			An2
	.byte	W12
	.byte			Cn3
	.byte	W12
	.byte			En3
	.byte	W12
	.byte		N44	, Cn3
	.byte	W02
	.byte			En3
	.byte	W02
	.byte			An3
	.byte	W68
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W72
	.byte	W64
	.byte	GOTO	
		.word	song0002_3_4
	.byte	FINE

	.align 2
	.global song0002
song0002:	@ 0x0201E8D0
	.byte	3		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup000		@ voicegroup/tone

	.word	song0002_1		@ track
	.word	song0002_2		@ track
	.word	song0002_3		@ track
