; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:46:47 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/18 16:39:56 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_strdup
extern _malloc

_ft_strdup:
    cmp     rdi, 0
    je      error
    mov     rcx, 0

inc_len:
    inc     rcx

len:
    cmp     byte[rdi + rcx], 0
    jne     inc_len                 ; get string length (for the malloc call)

allocate:
    mov     rbx, rdi
    mov     rdi, rcx
    push    rdi
    call    _malloc
    pop     rdi
    cmp     rax, 0
    je      error
    mov     rcx, 0

copy:
    mov     dl, byte[rbx + rcx]
    mov     byte[rax + rcx], dl
    cmp     dl, 0
    je      return
    inc     rcx
    jmp     copy

error:
    mov     rax, 0
    ret

return:
    ret