; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:44:11 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/11 17:56:06 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_read
extern	___error

_ft_read:					;rdi = fd, rsi = buffer, rdx = bytes to be read
	mov		rax, 0x2000000	; read id
	syscall
	jc		error			; sets rax to errno
	ret

error:
	mov		r9, rax		;save errno
	call	___error			;get errno address
	mov		rax, r9		;return errno address
	mov		rax, -1
	ret
	