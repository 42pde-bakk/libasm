; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/29 14:31:55 by Peer          #+#    #+#                  ;
;    Updated: 2020/05/30 15:38:39 by Peer          ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp

_ft_strcmp:
	xor rax, rax
	cmp	rdi, 0					;check if str1=NULL
	je	error_s1
	cmp	rsi, 0					;check if str2=NULL
	je	error_s2

loop:
	mov r10b, byte [rdi + rax]	;move into registers
	mov r9b, byte [rsi + rax]
	cmp r10b, r9b				;compare if theyre the same
	jne	ret						;if not equal, jump to return
	cmp r10b, 0					;check delim
	je	ret
	inc rax
	jmp	loop

error_s1:
	cmp	rsi, 0					;check if both are NULL
	je	error
	mov	r9b, byte[rsi]
	mov	r10b, 0
	jmp ret

error_s2:
	mov	r10b, byte[rdi]
	mov r9b, 0
	jpm ret

error:
	mov	rax, 0
	ret

ret:
	sub r10b, r9b
	mov rax, r10b
	ret
	