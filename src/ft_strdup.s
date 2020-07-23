; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: pde-bakk <pde-bakk@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/07/22 14:52:25 by pde-bakk      #+#    #+#                  ;
;    Updated: 2020/07/23 19:34:20 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strdup
extern _ft_strlen
extern _malloc

section .text

_ft_strdup:
	cmp rdi, 0						; Check if incoming string is NULL
	je error
	call _ft_strlen					; rax = ft_strlen(str)
	push rdi					; Stack allignment part 1
	inc rax							; we also need a spot for \0
	mov rdi, rax					; save rax value in rdi (argument for malloc)
	call _malloc					
	cmp rax, 0						; Check the malloc return
	pop rdi						; Stack allignment part 2
	je error
	xor r9, r9						; i = 0

loop:
	mov r8b, [rdi + r9]
	mov byte [rax + r9], r8b		; Copy value into malloced string
	cmp r8b, 0						; Check for \0
	je ret
	inc r9							; i++;
	jmp loop

error:
	mov rax, 0						; if an error happens, return NULL

ret:
	ret
