; Isvesti eilute ABCDEFGH, po to - sukeisti 1-a ir 8-a simbolius  vietomis, o 4-a ir 5-a pakeisti raide 'Z' 
; Kompiliuojame (linux terminale): nasm nasmpvz2.asm -fbin -o nasmpvz2.com
; Paleidimas (dosbox terminale): nasmpvz2.com

;------------------------------------------------------------------------
org 100h                        ; visos COM programos prasideda nuo 100h
                                ; Be to, DS=CS=ES=SS !

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text                   ; kodas prasideda cia 

   startas:                     ; nuo cia vykdomas kodas
   mov ah, 09
   mov dx, pranesimas
   int 0x21

   mov al, [pranesimas]            ; 1-as simbolis
   mov bl, [pranesimas+7]          ; 8-as simbolis

   mov [pranesimas], bl            ; keiciame 1-a 8-uoju
   mov [pranesimas+7], al          ; keiciame 8-a 1-uoju 

   mov [pranesimas+3], word 'ZZ'        ; 4-a ir 5-a -> 'ZZ'
 
   mov ah, 09
   mov dx, pranesimas
   int 0x21


   mov ah, 0x4c                  ; tiesiog bagiame
   int 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data                   ; duomenys

   pranesimas:
      db 'ABCDEFGH', 0x0D, 0x0A, '$'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .bss                    ; neinicializuoti duomenys  


