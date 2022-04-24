	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0413_1
song0413_1:	@ 0x08C864C8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 38
	.byte	VOICE	, 108
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N03	, En4, v092
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			As4, v076
	.byte	W03
	.byte			Dn5, v104
	.byte	W03
	.byte			Fn5, v088
	.byte	W03
	.byte			As5, v080
	.byte	W03
	.byte			Cn6, v088
	.byte	W03
	.byte			Gn5, v076
	.byte	W03
	.byte			En5, v092
	.byte	W03
	.byte			Cn5, v088
	.byte	W03
	.byte			Gn4, v096
	.byte	W03
	.byte		N05	, En4, v092
	.byte	W05
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0413_2
song0413_2:	@ 0x08C864F8
	.byte	KEYSH	, 0
	.byte	VOICE	, 109
	.byte	VOL	, v077
	.byte	PAN	, c_v
	.byte		N03	, Cn4, v096
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Fn4, v076
	.byte	W03
	.byte			As4, v064
	.byte	W03
	.byte			Dn5, v096
	.byte	W03
	.byte			Fn5, v100
	.byte	W03
	.byte			En5, v092
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			Gn4, v080
	.byte	W03
	.byte			En4, v092
	.byte	W03
	.byte		N05	, Cn4, v096
	.byte	W05
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0413_3
song0413_3:	@ 0x08C86524
	.byte	KEYSH	, 0
	.byte	VOICE	, 64
	.byte	VOL	, v058
	.byte	PAN	, c_v
	.byte		N03	, En3, v092
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			As3, v076
	.byte	W03
	.byte			Dn4, v104
	.byte	W03
	.byte			Fn4, v088
	.byte	W03
	.byte			As4, v080
	.byte	W03
	.byte			Cn5, v088
	.byte	W03
	.byte			Gn4, v076
	.byte	W03
	.byte			En4, v092
	.byte	W03
	.byte			Cn4, v088
	.byte	W03
	.byte			Gn3, v096
	.byte	W03
	.byte		N05	, En3, v092
	.byte	W05
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0413_4
song0413_4:	@ 0x08C86552
	.byte	KEYSH	, 0
	.byte	VOICE	, 63
	.byte	VOL	, v046
	.byte	PAN	, c_v
	.byte		N03	, Cn3, v096
	.byte	W03
	.byte			As2
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fn3, v076
	.byte	W03
	.byte			As3, v064
	.byte	W03
	.byte			Dn4, v096
	.byte	W03
	.byte			Fn4, v100
	.byte	W03
	.byte			En4, v092
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte			En3, v092
	.byte	W03
	.byte		N05	, Cn3, v096
	.byte	W05
	.byte	FINE

	.align 2
	.global song0413
song0413:	@ 0x08C86580
	.byte	4		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup010		@ voicegroup/tone

	.word	song0413_1		@ track
	.word	song0413_2		@ track
	.word	song0413_3		@ track
	.word	song0413_4		@ track
