org 0x7c00

BaseOfStack equ 0x7c00

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