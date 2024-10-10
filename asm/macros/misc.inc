.macro mDataSize label:req
  .size \label, .-\label
.endm

.macro RGB r:req g:req b:req
  .short ((\r << 0) | (\g << 5) | (\b << 10))
.endm
