; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:39:43 by Peer          #+#    #+#                  ;
;    Updated: 2020/06/11 18:46:08 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_write
extern ___error

WRITE_ID	equ 0x2000004

_ft_write:
	mov	rax, WRITE_ID
	syscall
	jc	error
	ret

error:
	mov r15, rax
	call ___error
	mov [rax], r15
	mov	rax, -1
	ret
	