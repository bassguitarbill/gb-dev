AD_LIB=../lib/assemblydigest/gameboy
ASM=~/bin/rgbasm
LNK=~/bin/rgblink
FIX=~/bin/rgbfix

gbmake: game.asm
	cp $(AD_LIB)/memory.z80 .
	cp $(AD_LIB)/gameboy.z80 .
	$(ASM) -o game.obj game.asm
	$(LNK) -m game.map -n game.sym -o game.gb game.obj
	$(FIX) -p 0 -v game.gb
	make clean

clean:
	rm gameboy.z80 memory.z80
	rm game.obj game.map game.sym


run:
	make gbmake
	gambatte-qt game.gb
