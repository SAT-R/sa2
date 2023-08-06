.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

    thumb_func_start StageInit_Dummy
StageInit_Dummy:
    bx lr
    .align 2, 0


	thumb_func_start stageBgUpdateDummy
stageBgUpdateDummy: @ 0x0801E130
	bx lr
	.align 2, 0
