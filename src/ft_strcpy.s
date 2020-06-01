; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:51 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/01 15:30:35 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

_ft_strcpy:
	xor	rax, rax				;index
	cmp	rdi, 0					;check if dest=NULL
	je	error
	cmp	rsi, 0					;check if src=NULL
	je	error

loop:
	mov r8b, byte [rsi + rax]	;move src char to register
	mov byte [rdi + rax], r8b	;move register into dest string
	cmp	r8b, 0					;check delimiter
	je	ret
	inc	rax
	jmp	loop

error:
	mov	rax, 0					;return null
	ret

ret:
	mov rax, rdi				;return dest string
	ret
