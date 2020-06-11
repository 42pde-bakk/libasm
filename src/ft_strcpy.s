; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:51 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/11 18:22:46 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

_ft_strcpy:
	xor	rbx, rbx				;index
	cmp	rdi, 0					;check if dest=NULL
	je	error
	cmp	rsi, 0					;check if src=NULL
	je	error

loop:
	mov al, byte[rsi + rbx]		;move src char to register
	mov byte[rdi + rbx], al		;move register into dest string
	cmp	al, 0					;check delimiter
	je	ret
	inc	rbx
	jmp	loop

error:
	mov	rax, 0					;return null
	ret

ret:
	mov rax, rdi				;return dest string
	ret
