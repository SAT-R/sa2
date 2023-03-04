
%_tiles_1.4bpp: %_tiles_1.png
	$(GFX) $< $@ -num_tiles 1

%_tiles_2.4bpp: %_tiles_2.png
	$(GFX) $< $@ -num_tiles 2

%_tiles_4.4bpp: %_tiles_4.png
	$(GFX) $< $@ -num_tiles 4

%_tiles_8.4bpp: %_tiles_8.png
	$(GFX) $< $@ -num_tiles 8

%_tiles_16.4bpp: %_tiles_16.png
	$(GFX) $< $@ -num_tiles 16

%_tiles_32.4bpp: %_tiles_32.png
	$(GFX) $< $@ -num_tiles 32

%_tiles_64.4bpp: %_tiles_64.png
	$(GFX) $< $@ -num_tiles 64

tileset_%.4bpp: tileset_%.png
	$(GFX) $< $@ -ignore_trailing

a%.4bpp: a%.png
	$(GFX) $< $@ -split_into_oam_shapes
