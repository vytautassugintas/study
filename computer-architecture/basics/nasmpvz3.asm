; Isvesti ABCD, po to - BCDE naudojant tą pačią eilutę ir INC operaciją 
; Kompiliuojame (linux terminale): nasm nasmpvz3.asm -fbin -o nasmpvz2.com
; Paleidimas (dosbox terminale): nasmpvz3.com

;------------------------------------------------------------------------
org 100h                        ; visos COM programos prasideda nuo 100h
                                ; Be to, DS=CS=ES=SS !

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text                   ; kodas prasideda cia 

   startas:                     ; nuo cia vykdomas kodas
   mov ah, 09
   mov dx, pranesimas
   int 0x21

   inc byte [pranesimas]             ; 1-as simbolis keičiasi: A -> B
   inc byte [pranesimas+1]           ; 2-as simbolis keičiasi: B -> C
   inc byte [pranesimas+2]           ; -----,,-----
   inc byte [pranesimas+3]           ; -----,,-----


   mov ah, 09
   mov dx, pranesimas
   int 0x21


   mov ah, 0x4c                  ; tiesiog bagiame
   int 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data                   ; duomenys

   pranesimas:
      db 'ABCD', 0x0D, 0x0A, '$'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .bss                    ; neinicializuoti duomenys  


