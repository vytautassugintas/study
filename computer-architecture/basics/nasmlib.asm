;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procParseInt16:
   ; input:  dx - address to string ASCIIZ (char*) to parse; 
   ; 
   ; output: ax - parsed number; bx - updated address after parsing; 
   ;         CF is 1, if there was parsing error (empty string) 
   ; input number must be CORRECT
   push dx
   push cx
   push si
   push di
   mov bx, dx
   mov ax, 0
   mov si, 0              ; number of digits 
   mov cl, 0              ; 0 - if nonnegative, 1 - otherwise
   ; eating spaces:
   .leading_spaces:
      cmp [bx], byte ' '
      jne .next1
      inc bx
      jmp .leading_spaces
    
   .next1:
      cmp [bx], byte 0          ; the end of the string?
      jne .next2
      jmp .endParsing
   .next2:
      cmp [bx], byte '-'   ; the minus
      jne .digits
      mov cl, 1            ; negative number
      inc bx
   
   .digits:
      cmp [bx], byte '0'          
      jb  .lessThanNumeric
      cmp [bx], byte '9'          
      jbe  .updateAX
      .lessThanNumeric: 
         jmp .endParsing
      .updateAX:
         mov dx, 10
         mul dx
         mov dh, 0 
         mov dl, [bx]
         sub dl, '0'
         add ax, dx
         inc si
      inc bx 
      jmp .digits
   .endParsing:
      cmp si, 0                   ; empty string?
      je .setErrorAndReturn
      clc
      cmp cl, 1
      je .negateAndReturn
      jmp .return
   
   .negateAndReturn:
      neg ax
      jmp .return
          
   .setErrorAndReturn:
      stc

   .return:        
   pop di
   pop si
   pop cx
   pop dx
   ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procInt16ToStr:
   ; input:  ax - int16 to convert; 
   ; 
   ; output: dx - address to string's buffer
   ;      
   push di    
   push si
   push cx
   push bx
   push dx
   mov bx, dx
   mov cx, 0     
   mov si, 0         
   cmp ax, word 0
   jge .next
     mov cl, 1
     mov [bx], byte '-'
     inc bx
     neg ax

  
  .next:
     mov dx, 0
     mov di, 10
     div di
     add dl, '0'
     mov [bx], dl
     inc bx
     inc si
     cmp ax, 0
     je .setSign
     jmp .next
    
  .setSign:
     


  .reverse:
  ;   inc bx
     mov [bx], byte 0             ; asciiz
     dec bx

     pop dx
     push dx
     mov di, dx 
    
     cmp cl, 1
     jne .Ok
     inc di
     
     .Ok:
     mov ax, si
     shr ax, 1
     mov cx, ax
     cmp cx, 0
     je .return
     
     .loopByDigits:
        mov al, [di]
        mov ah, [bx]
        mov [di], ah
        mov [bx], al
        dec bx
        inc di
        loop .loopByDigits

  .return: 
  pop dx
  pop bx
  pop cx
  pop si
  pop di
  ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procGetStr:
   ; read asciiz from keyboard
   ; input:  dx - address to string buffer, al - max. length of the string; 
   ; output: dx - asciiz string; CF is 1, if there were some errors 
   push bx
   mov bx, dx
   mov [bx], al
   mov ah, 0x0a
   int 0x21
   inc bx
   mov ch, 0
   mov cl, [bx]
   inc bx
   .loopBySymbols:
       mov al, [bx]
       mov [bx-2], al
       inc bx
       loop .loopBySymbols 
   mov [bx-2], byte 0
   pop bx
   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procPutStr:
   ; print asciiz string to stdout 
   ; input:  dx - asciiz string;
   ; output: nothing 
   push bx
   push dx 
   push ax
   mov bx, dx
   .loopBySymbols:
      mov dl, [bx]
      cmp dl, 0
      je .return
        mov ah, 0x02
        int 0x21
        inc bx
      jmp .loopBySymbols
	
   .return:
      pop ax
      pop dx
      pop bx
      ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procNewLine:
   ; prints \n 
   jmp .begin
   .localData:
   db 0x0D, 0x0A, 0x00
   
   .begin: 
  
   push dx 
   push ax
   mov dx, .localData
   call procPutStr
   pop ax
   pop dx
   ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procPutWord:
   ; input: ax 
   jmp .begin
   .localData:
   db '0x     ', 0
   
   .begin: 
   push dx 
   push ax
   push cx
   push bx
   push si


   mov bx, ax

   mov cx, 4
   mov si, 0
   .loop4:   
      mov dx, bx
      and dh, 0xF0
      times 4 shr dh, 1
      mov dl, dh 
      add dl, '0'
      cmp dl, '9'
      jle .print
         sub  dl, '0'
         add  dl, ('A'-10)
      .print:
      mov [.localData + si + 2], dl
      times 4 shl bx, 1
      inc si 
      loop .loop4
   
   mov dx, .localData
   call procPutStr
   pop si
   pop bx
   pop cx
   pop ax
   pop dx
   ret 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
