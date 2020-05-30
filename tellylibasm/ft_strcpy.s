; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:00:16 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 15:00:16 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_strcpy

_ft_strcpy:                                 ;rdi = destination string, rsi = source string
                mov     rbx, 0              ;index
                cmp     rdi, 0              ;check first input string
                je      error
                cmp     rsi, 0              ;check second input string
                je      error
                jmp     copy
increment:
                inc     rbx
copy:
                mov     al, byte[rsi + rbx] ;put source char in register
                mov     byte[rdi + rbx], al ;put register in dest string
                cmp     al, 0               ;check delimiter
                je      return
                jmp     increment
error:
                mov     rax, 0              ;return null
                ret
return:
                mov     rax, rdi            ;move destination string to return value
                ret   

