.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

// Used in save module, but not sure what B70 and B74 yet
// refer to

	thumb_func_start sub_80854DC
sub_80854DC: @ 0x080854DC
	ldr r3, _080854F4 @ =gUnknown_03005B70
	ldr r1, _080854F8 @ =gUnknown_03005B74
	ldr r0, [r3]
	ldr r2, [r1]
	str r2, [r3]
	ldr r3, _080854FC @ =0x37119371
	adds r0, r0, r3
	adds r0, r0, r2
	str r0, [r1]
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_080854F4: .4byte gUnknown_03005B70
_080854F8: .4byte gUnknown_03005B74
_080854FC: .4byte 0x37119371

	thumb_func_start sub_8085500
sub_8085500: @ 0x08085500
	ldr r2, _0808550C @ =gUnknown_03005B70
	str r0, [r2]
	ldr r0, _08085510 @ =gUnknown_03005B74
	str r1, [r0]
	bx lr
	.align 2, 0
_0808550C: .4byte gUnknown_03005B70
_08085510: .4byte gUnknown_03005B74
