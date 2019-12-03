org 0x7c00

BaseOfStack equ 0x7c00
BaseOfLoader equ 0x1000
OffsetOfLoader equ 0x00

RootDirSectors equ 14
SectorNumOfRootDirStart equ 19
SectorNumOfFAT1Start equ 1
SectorBalance equ 17

jmp short Label_Start
nop
BS_OEMName db 'MINEboot'
BPB_BytesPerSec dw 512
BPB_SecPerClus db 1
BPB_RsvdSecCnt dw 1
BPB_NumFATs db 2
BPB_RootEntCnt dw 224
BPB_TotSec16 dw 2880
BPB_Media db 0xf0
BPB_FATSz16 dw 9
BPB_SecPerTrk dw 18
BPB_NumHeads dw 2


Label_Start:

mov ax, cs
mov ds, ax
mov es, ax
mov ss, ax
mov sp, BaseOfStack

mov ax, 0600h
mov bx, 0700h
mov cx, 0000h
mov dx, 0ffffh
int 10h

mov ax, 0200h
mov bx, 0000h
mov dx, 0000h
int 10h

mov ax, 1301h
mov bx, 0004h
mov cx, 10
mov dx, 0000h
push ax
mov ax, ds
mov es, ax
pop ax
mov bp, StartBootMessage
int 10h

xor ah, ah
xor dl, dl
int 13h

jmp $

StartBootMessage: db "Start Boot"

times 510 - ($ - $$) db 0
dw 0xaa55