; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 14:59:57 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 14:59:57 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

_ft_strlen:                                 ;rdi = string
                mov     rax, 0
                cmp     rdi, 0              ;check input string
                je      return
                jmp     compare
increment:
                inc     rax                 ;increment return value
                inc     rdi                 ;increment char in string
compare:
                cmp     byte[rdi], 0        ;check delimiter
                jne     increment
return:
                ret
