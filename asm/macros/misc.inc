.macro mDataSize label
  .size \label, .-\label
.endm

.macro RGB r g b
  .2byte ((\r << 0) | (\g << 5) | (\b << 10))
.endm
