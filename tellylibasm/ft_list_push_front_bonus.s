; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_push_front_bonus.s                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:01:02 by abobas        #+#    #+#                  ;
;    Updated: 2020/05/05 13:31:50 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_list_push_front
extern  _malloc

_ft_list_push_front:                                    ; rdi = begin_list, rsi = data
                        cmp         rdi, 0
                        je          error
                        push        rdi
                        push        rsi
allocate_element:
                        mov         rdi, 16             ; t_list = 16 bytes
						push		rdi
                        call        _malloc             ; allocate new struct
						pop			rdi
                        pop         rsi
                        pop         rdi
                        cmp         rax, 0              ; malloc protect
                        je          error        
fill_element:
                        mov         [rax + 0], rsi      ; put data in new element
                        mov         rbx, [rdi]          ; 
                        mov         [rax + 8], rbx      ; put pointer to old first element's address as next in new element
                        mov         [rdi], rax          ; change begin_list address to new element
                        ret
error:
                        mov         rax, 0
                        ret

