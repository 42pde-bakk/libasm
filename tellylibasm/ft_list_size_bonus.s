; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:00:49 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 15:00:49 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_size

_ft_list_size:                              ;rdi = begin_list address
                mov     rax, 0
                cmp     rdi, 0
                je      return
                mov     rcx, rdi            ; put beginning element in register
                jmp     increment
compare:
                cmp     rcx, 0              ; check if element exists 
                je      return
increment:
                inc     rax
                mov     rcx, [rcx + 8]      ; move to next element
                jmp     compare
return:
                ret