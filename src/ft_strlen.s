; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:42 by Peer          #+#    #+#                  ;
;    Updated: 2020/07/22 16:45:47 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen

_ft_strlen:
	xor rax, rax				; i = 0;
	cmp rdi, 0
	je	ret						; return if input = NULL

loop:
	mov sil, byte[rdi + rax]
	cmp sil, byte 0				; check if \0
	je ret
	inc rax						; i++;
	jmp loop

ret:
	ret
