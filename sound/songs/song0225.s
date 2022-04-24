	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0225_1
song0225_1:	@ 0x08C82570
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 25
	.byte	VOL	, v100
	.byte	BENDR	, 10
	.byte	LFOS	, 17
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 77
	.byte	BEND	, c_v-28
	.byte		N03	, Cn3, v127
	.byte	W01
	.byte	VOL	, v099
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v097
	.byte	BEND	, c_v-26
	.byte	W01
	.byte	VOL	, v096
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v094
	.byte	BEND	, c_v-24
	.byte		N02	, Gs3
	.byte	W01
	.byte	VOL	, v092
	.byte	BEND	, c_v-23
	.byte	W01
	.byte	VOL	, v091
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v089
	.byte	BEND	, c_v-21
	.byte		N02	, Gs2
	.byte	W01
	.byte	VOL	, v088
	.byte	BEND	, c_v-20
	.byte	W01
	.byte	VOL	, v086
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v085
	.byte	BEND	, c_v-17
	.byte		N02	, Ds3
	.byte	W01
	.byte	VOL	, v083
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v-15
	.byte	W01
	.byte	VOL	, v080
	.byte	BEND	, c_v-14
	.byte		N03	, Cn3
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v-12
	.byte	W01
	.byte	VOL	, v076
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v074
	.byte	BEND	, c_v-10
	.byte		N02	, Gs3
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v071
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v-6
	.byte		N02	, Gs2
	.byte	W01
	.byte	VOL	, v068
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v-19
	.byte		N02	, Ds3
	.byte	W01
	.byte	VOL	, v063
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v-19
	.byte		N03	, Cn3
	.byte	W01
	.byte	VOL	, v059
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v056
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v055
	.byte	BEND	, c_v-19
	.byte		N02	, Gs3
	.byte	W01
	.byte	VOL	, v053
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v050
	.byte	BEND	, c_v-19
	.byte		N02	, Gs2
	.byte	W01
	.byte	VOL	, v048
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v045
	.byte	BEND	, c_v-19
	.byte		N02	, Ds3
	.byte	W01
	.byte	BEND	, c_v-19
	.byte	W01
	.byte		c_v-19
	.byte	W01
	.byte		c_v-19
	.byte		N09	, Fs3
	.byte	W03
	.byte	VOL	, v037
	.byte	W06
	.byte		v027
	.byte	W06
	.byte		v018
	.byte	W06
	.byte		v009
	.byte	W06
	.byte		v000
	.byte	FINE

	.align 2
	.global song0225
song0225:	@ 0x08C82668
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	30		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0225_1		@ track
