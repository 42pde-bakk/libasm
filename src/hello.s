; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    hello.s                                            :+:    :+:             ;
;                                                      +:+                     ;
;    By: peerdb <peerdb@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/03/20 13:16:20 by peerdb         #+#    #+#                 ;
;    Updated: 2020/03/20 13:21:27 by peerdb        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _start

section	.data
	msg db "Hello, World!", 10
	len equ $ - msg

section	.text
		global _start

_start:
	mov rax, 1 ; sys_write
	mov rdi, 1 ; stdout fd
	mov rsi, msg ; bytes to write
	mov rdx, len ; nr of bytes to write
	syscall; perform system call

	mov rax, 60
	mov rdi, 0
	syscall
	