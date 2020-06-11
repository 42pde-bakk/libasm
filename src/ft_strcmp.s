; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:55 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/11 18:32:03 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp

_ft_strcmp:
	xor rax, rax 			; clean index counter
	jmp loop

loop:
	mov bl, [rdi + rax]		; move strings into registers
	mov cl, [rsi + rax]
	cmp bl, cl
	jne ret					; if not the same, return
	cmp bl, 0
	je ret					; if delim, return
	inc rax
	jmp loop

ret:
	sub bl, cl				; get return value
	movsx rax, bl
	ret
