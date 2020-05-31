; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:44:11 by Peer          #+#    #+#                  ;
;    Updated: 2020/05/31 15:10:21 by Peer          ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_read
extern	__eror

_ft_read:					;rdi = fd, rsi = buffer, rdx = bytes to be read
	mov		rax, 0x2000000	; BSD calling convention (syscall 3 = read on mac, 0 on linux)
	syscall
	jc		_error			; sets rax to errno
	ret

error:
	mov		r9, rax		;save errno
	call	__error			;get errno address
	mov		rax, r9		;return errno address
	mov		rax, -1
	ret