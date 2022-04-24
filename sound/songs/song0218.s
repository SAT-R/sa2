	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0218_1
song0218_1:	@ 0x08C82340
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 18
	.byte	VOL	, v100
	.byte	LFOS	, 51
	.byte	BENDR	, 15
	.byte	MODT	, 0
	.byte	PAN	, c_v
	.byte	MOD	, 60
	.byte		N05	, Fs2, v127
	.byte	W06
	.byte	VOL	, v092
	.byte		N90	, Gn3
	.byte	W06
	.byte	VOL	, v085
	.byte	W06
	.byte		v078
	.byte	W06
	.byte		v071
	.byte	W06
	.byte		v064
	.byte	W06
	.byte		v057
	.byte	W06
	.byte		v050
	.byte	W06
	.byte		v043
	.byte	W06
	.byte		v036
	.byte	W06
	.byte		v029
	.byte	W06
	.byte		v022
	.byte	W06
	.byte		v014
	.byte	W06
	.byte		v007
	.byte	W06
	.byte		v000
	.byte	W12
	.byte	FINE

	.align 2
	.global song0218
song0218:	@ 0x08C82378
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0218_1		@ track
