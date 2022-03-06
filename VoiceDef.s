@***
@
@ VoiceDef.s V0.2
@ (C) 2015 ipatix
@                    
@**************************************************************@

@***
@ Output Device
@**********************@

	.equ	DirectSound, 	0x00
	.equ	SquareWave1,	0x01
	.equ	SquareWave2,	0x02
	.equ	ProgWave,	0x03
	.equ	ProgNoise,	0x04
	.equ	ASquareWave1,	0x09
	.equ	ASquareWave2,	0x0A
	.equ	AProgWave,	0x0B
	.equ	AProgNoise,	0x0C
	.equ	DirectSoundFix,	0x08
	.equ	DirectReverse,	0x10
	.equ	DirectRevFix,	0x18
	.equ	DirectComp,	0x20
	.equ	ReverseComp,	0x30

@***
@ Table Types
@**********************@

	.equ	KeySplit, 	0x40
	.equ	DrumTable,	0x80

@***
@ Wave Patterns
@**********************@

	.equ	WaveDuty75,	0x03
	.equ	WaveDuty50, 	0x02
	.equ	WaveDuty25,	0x01
	.equ	WaveDuty12,	0x00

	.equ	FineNoise,	0x00
	.equ	RoughNoise,	0x01

@***
@ Keys
@**********************@

	.equ	CnM2,	0		@
	.equ	CsM2,	1		@
	.equ	DnM2,	2		@
	.equ	DsM2,	3		@
	.equ	EnM2,	4		@
	.equ	FnM2,	5		@
	.equ	FsM2,	6		@
	.equ	GnM2,	7		@
	.equ	GsM2,	8		@
	.equ	AnM2,	9		@
	.equ	AsM2,	10		@
	.equ	BnM2,	11		@
	.equ	CnM1,	12		@
	.equ	CsM1,	13		@
	.equ	DnM1,	14		@
	.equ	DsM1,	15		@
	.equ	EnM1,	16		@
	.equ	FnM1,	17		@
	.equ	FsM1,	18		@
	.equ	GnM1,	19		@
	.equ	GsM1,	20		@
	.equ	AnM1,	21		@
	.equ	AsM1,	22		@
	.equ	BnM1,	23		@
	.equ	Cn0,	24		@
	.equ	Cs0,	25		@
	.equ	Dn0,	26		@
	.equ	Ds0,	27		@
	.equ	En0,	28		@
	.equ	Fn0,	29		@
	.equ	Fs0,	30		@
	.equ	Gn0,	31		@
	.equ	Gs0,	32		@
	.equ	An0,	33		@
	.equ	As0,	34		@
	.equ	Bn0,	35		@
	.equ	Cn1,	36		@
	.equ	Cs1,	37		@
	.equ	Dn1,	38		@
	.equ	Ds1,	39		@
	.equ	En1,	40		@
	.equ	Fn1,	41		@
	.equ	Fs1,	42		@
	.equ	Gn1,	43		@
	.equ	Gs1,	44		@
	.equ	An1,	45		@
	.equ	As1,	46		@
	.equ	Bn1,	47		@
	.equ	Cn2,	48		@
	.equ	Cs2,	49		@
	.equ	Dn2,	50		@
	.equ	Ds2,	51		@
	.equ	En2,	52		@
	.equ	Fn2,	53		@
	.equ	Fs2,	54		@
	.equ	Gn2,	55		@
	.equ	Gs2,	56		@
	.equ	An2,	57		@
	.equ	As2,	58		@
	.equ	Bn2,	59		@
	.equ	Cn3,	60		@
	.equ	Cs3,	61		@
	.equ	Dn3,	62		@
	.equ	Ds3,	63		@
	.equ	En3,	64		@
	.equ	Fn3,	65		@
	.equ	Fs3,	66		@
	.equ	Gn3,	67		@
	.equ	Gs3,	68		@
	.equ	An3,	69		@ 440Hz
	.equ	As3,	70		@
	.equ	Bn3,	71		@
	.equ	Cn4,	72		@
	.equ	Cs4,	73		@
	.equ	Dn4,	74		@
	.equ	Ds4,	75		@
	.equ	En4,	76		@
	.equ	Fn4,	77		@
	.equ	Fs4,	78		@
	.equ	Gn4,	79		@
	.equ	Gs4,	80		@
	.equ	An4,	81		@
	.equ	As4,	82		@
	.equ	Bn4,	83		@
	.equ	Cn5,	84		@
	.equ	Cs5,	85		@
	.equ	Dn5,	86		@
	.equ	Ds5,	87		@
	.equ	En5,	88		@
	.equ	Fn5,	89		@
	.equ	Fs5,	90		@
	.equ	Gn5,	91		@
	.equ	Gs5,	92		@
	.equ	An5,	93		@
	.equ	As5,	94		@
	.equ	Bn5,	95		@
	.equ	Cn6,	96		@
	.equ	Cs6,	97		@
	.equ	Dn6,	98		@
	.equ	Ds6,	99		@
	.equ	En6,	100		@
	.equ	Fn6,	101		@
	.equ	Fs6,	102		@
	.equ	Gn6,	103		@
	.equ	Gs6,	104		@
	.equ	An6,	105		@
	.equ	As6,	106		@
	.equ	Bn6,	107		@
	.equ	Cn7,	108		@
	.equ	Cs7,	109		@
	.equ	Dn7,	110		@
	.equ	Ds7,	111		@
	.equ	En7,	112		@
	.equ	Fn7,	113		@
	.equ	Fs7,	114		@
	.equ	Gn7,	115		@
	.equ	Gs7,	116		@
	.equ	An7,	117		@
	.equ	As7,	118		@
	.equ	Bn7,	119		@
	.equ	Cn8,	120		@
	.equ	Cs8,	121		@
	.equ	Dn8,	122		@
	.equ	Ds8,	123		@
	.equ	En8,	124		@
	.equ	Fn8,	125		@
	.equ	Fs8,	126		@
	.equ	Gn8,	127		@

@***
@ center value of PAN
@******************************************************@

	.equ	c_v,	0xC0		@ -64 ~ +63

