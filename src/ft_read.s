; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:44:11 by Peer          #+#    #+#                  ;
;    Updated: 2020/07/22 16:39:01 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_read
extern	___error

_ft_read:
	mov rax, 0x2000003			; read id
	syscall
	jc error
	ret

error:
	mov r10, rax				; save rax
	call ___error				; get that errno boyyy
	mov	[rax], r10				; restore rax
	mov	rax, -1
	ret
	