org 100h

section	.text
  start:
    mov dx, a
    call procPutStr

%include 'nasmlib.asm'

section .data
  a:
    dw "123"
  b:
    dw 1111