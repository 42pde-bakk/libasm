; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:42 by Peer          #+#    #+#                  ;
;    Updated: 2020/05/30 15:05:58 by Peer          ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

_ft_strlen:
	xor rax, rax	;set rax to 0
	cmp rdi, 0		;check if input string is NULL
	je	ret			;jump to ret if equal

loop:
	mov sil, byte[rdi + rax]
	cmp sil, byte 0
	je ret
	inc rax
	jmp loop

ret:
	ret
