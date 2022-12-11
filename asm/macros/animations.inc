.equ AnimCmd_GetTiles,            -1
.equ AnimCmd_GetPalette,          -2
.equ AnimCmd_JumpBack,            -3
.equ AnimCmd_4,                   -4
.equ AnimCmd_PlaySoundEffect,     -5
.equ AnimCmd_6,                   -6
.equ AnimCmd_TranslateSprite,     -7
.equ AnimCmd_8,                   -8
.equ AnimCmd_SetIdAndVariant,     -9
.equ AnimCmd_10,                  -10
.equ AnimCmd_11,                  -11
.equ AnimCmd_12,                  -12

.equ NUM_ANIMATION_TABLE_ENTRIES, 1133


.macro mGetTiles tile_index:req, num_tiles_to_copy:req
.4byte AnimCmd_GetTiles
  .4byte \tile_index
  .4byte \num_tiles_to_copy
.endm

.macro mGetPalette pal_id:req, num_colors_to_copy:req, insert_offset:req
.4byte AnimCmd_GetPalette
  .4byte \pal_id
  .2byte \num_colors_to_copy
  .2byte \insert_offset
.endm

.macro mJumpBack offset:req
.4byte AnimCmd_JumpBack
  .4byte \offset
.endm

.macro mAnimCmd4
.4byte AnimCmd_4
.endm

.macro mPlaySoundEffect songId:req
.4byte AnimCmd_PlaySoundEffect
  .2byte \songId
  .space 2
.endm

.macro mAnimCmd6 unk4:req, unk8:req
.4byte AnimCmd_6
  .4byte \unk4
  .4byte \unk8
.endm

.macro mTranslateSprite x:req y:req
.4byte AnimCmd_TranslateSprite
  .2byte \x
  .2byte \y
.endm

.macro mAnimCmd8 unk4:req, unk8:req
.4byte AnimCmd_8
  .4byte \unk4
  .4byte \unk8
.endm

.macro mSetIdAndVariant animId:req, variant:req
.4byte AnimCmd_SetIdAndVariant
  .2byte \animId
   .2byte \variant
.endm

.macro mAnimCmd10 unk4:req, unk8:req, unkC:req
.4byte AnimCmd_10
  .4byte \unk4
  .4byte \unk8
  .4byte \unkC
.endm

.macro mAnimCmd11 unk4:req
.4byte AnimCmd_11
  .4byte \unk4
.endm

.macro mAnimCmd12 unk4:req
.4byte AnimCmd_12
  .4byte \unk4
.endm

