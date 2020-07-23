; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: Peer <pde-bakk@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/05/30 15:39:43 by Peer          #+#    #+#                  ;
;    Updated: 2020/07/23 18:57:13 by pde-bakk      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_write
extern	___error

_ft_write:
	mov	rax, 0x2000004		; put write_id in rax so syscall knows which syscall to do
	syscall
	jc error
	ret

error:
	mov r10, rax			; backup write return value
	push r10
	call ___error			; get errno
	mov [rax], r10			; put write return value back while keeping rax's memory address
	pop r10
	mov	rax, -1
	ret
	