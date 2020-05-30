; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_sort_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:00:41 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 15:00:41 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_list_sort

_ft_list_sort:                                  ; rdi = **begin_list, rsi = *strcmp
                cmp     rdi, 0                  ; check if address to first element exists
                je      return
                cmp     rsi, 0                  ; check if pointer to function exists
                je      return
                mov     r15, [rdi]              ; save begin_list for reset
                mov     rdi, [rdi]              ; **begin_list so dereference
loop:
                cmp     rdi, 0
                je      return
                mov     r9, [rdi + 8]           ; put next elements's address in register
                cmp     r9, 0                   ; check if end of list
                je      return
                push    rdi
                push    rsi
                mov     rax, rsi                 ; move strcmp to register
                mov     r14, [rdi + 8]           ; rdi + 8 = next element
                mov     rsi, [r14 + 0]           ; move next.data to strcmp 2nd argument
                mov     rdi, [rdi + 0]           ; move current.data to strcmp 1st argument
                call    rax                      ; call strcmp
                pop     rsi
                pop     rdi
                jns     exchange                 ; jump if negative flag is not set (negative return value means next.data is larger than current.data)
traverse:
                mov     rdi, [rdi + 8]           ; current element is now next element
                jmp     loop
exchange:
                cmp     rax, 0
                je      traverse
                mov     r10, [rdi + 0]           ; put current.data in register
                mov     r11, [r14 + 0]           ; put next.data in register
                mov     [r14 + 0], r10           ; swap next.data for current.data
                mov     [rdi + 0], r11           ; swap current.data for next.data
                mov     rdi, r15                 ; reset current element to first element
                jmp     loop
return:
                mov     rax, 0
                ret
