; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:44:11 by Peer          #+#    #+#                  ;
;    Updated: 2020/07/23 19:10:58 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_read
extern	___error

_ft_read:
	mov rax, 0x2000003			; read id
	syscall						; read
	jc error
	ret

error:
	mov r10, rax				; save rax
	push r10
	call ___error				; get that errno boyyy
	mov	[rax], r10				; restore rax
	pop r10
	mov	rax, -1
	ret
