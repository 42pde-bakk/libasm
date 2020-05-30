; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_remove_if_bonus.s                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:00:56 by abobas        #+#    #+#                  ;
;    Updated: 2020/05/05 13:34:13 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_remove_if
extern _free

_ft_list_remove_if:                                         ; rdi = **begin_list, rsi = *data_ref, rdx = *strcmp
                            push    rdi
                            cmp     rdi, 0                  ; check if begin_list pointer is not void
                            je      return
                            cmp     rdx, 0                  ; check if strcmp is not void
                            je      return
                            mov     rdi, [rdi]              ; **begin_list so dereference
first_element:
                            cmp     rdi, 0                  ; check if end of list
                            je      return
                            push    rdi
                            push    rsi
                            push    rdx
                            mov     rdi, [rdi + 0]          ; put current_element.data in 1st argument
                            call    rdx                     ; call strcmp
                            pop     rdx
                            pop     rsi
                            pop     rdi
                            cmp     rax, 0                  ; check if reference data and current_element.data are equal
                            jne     traverse
                            mov     r12, [rdi]              ; put current_element in register
                            mov     r14, [rdi + 8]          ; put next_element in register
                            cmp     r14, 0                  ; check if first and last element
                            je      empty_list              ; if first and last element, jump empty_list
                            mov     r14, [r14]              ; dereference next_element
                            mov     r13, [rdi + 8]          ; put next_element in register
                            mov     [rdi], r14              ; make next_element begin_list pointer
                            mov     r13, [r13 + 8]          ; put next_element.next in register
                            mov     [rdi + 8], r13          ; put next_element.next in current_element.next
                            push    rdi
                            push    rsi
                            push    rdx
                            mov     rdi, r12                ; put old current_element in 1st argument
							push	rdi
                            call    _free                   ; free old current_element
							pop		rdi
                            pop     rdx
                            pop     rsi
                            pop     rdi
                            jmp     first_element
traverse:
                            mov     r10, rdi                 ; save current element in register
                            mov     rdi, [rdi + 8]           ; current element is now next element
list_loop:
                            cmp     rdi, 0                   ; check if end of list
                            je      return
                            push    rdi
                            push    rsi
                            push    rdx
                            mov     rdi, [rdi + 0]          ; put current_element.data in 1st argument
                            call    rdx                     ; call strcmp
                            pop     rdx
                            pop     rsi
                            pop     rdi
                            cmp     rax, 0                  ; check if reference data and current_element.data are equal
                            jne     traverse
                            mov     r12, [rdi]              ; put current_element in register
                            mov     r13, [rdi + 8]          ; put next_element in register
                            mov     [r10 + 8], r13          ; put next_element in previous_element.next
                            push    rdi
                            push    rsi
                            push    rdx
                            mov     rdi, r12                ; put old current_element in 1st argument
							push	rdi
                            call    _free                   ; free old current_element
							pop		rdi
                            pop     rdx
                            pop     rsi
                            pop     rdi                  
                            jmp     traverse
return:
                            pop     rdi
                            ret
empty_list:
                            mov     rdi, r12                ; put old current_element in 1st argument
							push	rdi
                            call    _free                   ; free old current_element
							pop		rdi
                            pop     rdi
                            mov     [rdi], r14
                            ret


              
                            


