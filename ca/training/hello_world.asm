; Kompiliuojame (linux terminale): nasm nasmpvz1.asm -fbin -o nasmpvz1.com
org 100h  ; bc compile to .com file

section .text
  start:
    mov ah, 09
    mov dx, msg
    int 0x21
    mov ah, 0x4c
    int 0x21

section .data
  msg:
    db 'Hello World', 0x0D, 0x0A, '$'