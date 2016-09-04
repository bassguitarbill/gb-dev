SECTION "rom", HOME

INCLUDE "gameboy.z80"

REPT 8
    ret
    REPT 7
        nop
    ENDR
ENDR

; $0040 VBLANK interrupt handler
jp draw
REPT 5
    nop
ENDR
; $0048 status interrupt (use for hblank?)
jp stat
REPT 5
    nop
ENDR
; $0050 timer interrupt
jp timer
REPT 5
    nop
ENDR
; $0058 serial interrupt
jp serial
REPT 5
    nop
ENDR
; $0060 joypad interrupt
jp joypad
REPT 5
    nop
ENDR

; $0068 free parking
DS $98

; $0100 startup handler
nop
jp main

; $0104 - $0133: The Nintendo Logo.
DB $CE, $ED, $66, $66, $CC, $0D, $00, $0B
DB $03, $73, $00, $83, $00, $0C, $00, $0D
DB $00, $08, $11, $1F, $88, $89, $00, $0E
DB $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
DB $BB, $BB, $67, $63, $6E, $0E, $EC, $CC
DB $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

; $0134 title (11 bytes)
DB "LINUX GMBOY"

; $013F manufacturer code
DS 4

; $0143 GBC flag
DB BOOT_GBC_UNSUPPORTED

; $0144 Licensee code
DB "WR"

; $0146 Super Gameboy flag
DB BOOT_SGB_UNSUPPORTED

; $0147 Cart type
DB BOOT_CART_ROM

; $0148 ROM size
DB BOOT_ROM_32K

; $0149 RAM size
DB BOOT_RAM_NONE

; $014A Destination
DB BOOT_DEST_INTERNATIONAL

; $014B Old licensee code
DB $33 ; Idk

; $014C ROM version number
DB $00

; $014D Header checksum (assembler will patch this)
DB $FF

; $014E Global checksum (assembler will patch this)
DB $AC, $0D

; $0150 The code, baby!
main:
.loop:
	halt
  	jr .loop

draw:
stat:
timer:
serial:
joypad:
reti

INCLUDE "memory.z80"
