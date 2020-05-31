; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:39:43 by Peer          #+#    #+#                  ;
;    Updated: 2020/05/31 15:10:18 by Peer          ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_write
extern __error

_ft_write:					; rdi = file descriptor, rsi = string, rdx = byte count
	mov		rax, 0x2000001	; BSD calling convention (syscall 4 = read on mac, 1 on linux)
	syscall
	jc		error			;error sets carry flag, rax = errno
	ret

error:
	mov		r15, rax		; save errno 
	call	___error	; retrieve address to errno
	mov		[rax], r15	; put errno in return value of __error (pointer to errno)
	mov		rax, -1
	ret
			