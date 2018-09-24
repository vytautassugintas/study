; Įsvesti tris sveikus skaičius; 
; Atspasdinti jų 16-tainį kodą, ir sumą - dešimtainėje sistemoje 
; Kompiliuojame (linux terminale): nasm nasmpvz4.asm -fbin -o nasmpvz4.com
; Paleidimas (linux terminale): dosbox nasmpvz4.com
%include 'nasmmac.inc'          ; Pagalbiniai makrosai
;------------------------------------------------------------------------
org 100h                        ; visos COM programos prasideda nuo 100h
                                ; Be to, DS=CS=ES=SS !

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text                   ; kodas prasideda cia 

   startas:                     ; nuo cia vykdomas kodas
   
   ; --------------------------------------------- Ivestis -------------
   macPutString 'Ivesk pirma skaiciu', crlf, '$'
   call procGetInt16
   mov [sk1], ax
   macNewLine 
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   macPutString 'Ivesk antra skaiciu', crlf, '$'
   call procGetInt16
   mov [sk2], ax
   macNewLine 
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   macPutString 'Ivesk trecia skaiciu', crlf, '$'
   call procGetInt16
   mov [sk3], ax
   macNewLine 
  
   
   ; -------------------------------- Spausdinimas 16- taineje sistemoje -
   macPutString 'Ivesta: $'   
   mov ax, [sk1]
   call procPutHexWord
   macPutString ', $'   
   mov ax, [sk2]
   call procPutHexWord
   macPutString ', $'   
      mov ax, [sk3]
   call procPutHexWord
   macPutString crlf, ' $'  
 
   ; -------------------------------- Suma ir spausdinimas 10- taineje sistemoje -

   mov ax, [sk1]
   add ax, word [sk2]
   add ax, word [sk3]
   call procPutInt16
   ; -------------------------------- Baigiame -----------------------------------
   exit 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%include 'nasmlib.asm'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



section .data                   ; duomenys

 sk1:
    dw 00
 sk2:
    dw 00
 sk3:
    dw 00
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .bss                    ; neinicializuoti duomenys  


