; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:51 by Peer          #+#    #+#                  ;
;    Updated: 2020/05/30 15:28:50 by Peer          ########   odam.nl          ;
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
	mov d1, byte [rsi + rax]	;move src char to register
	mov byte [rdi + rax], d1	;move register into dest string
	cmp	d1, 0					;check delimiter
	je	ret
	inc	rax
	jmp	loop

error:
	mov	rax, 0					;return null
	ret

ret:
	mov rax, rdi				;return dest string
	ret
