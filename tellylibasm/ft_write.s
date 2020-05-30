; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 14:59:40 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 14:59:40 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_write
extern	___error
	
_ft_write:                                  ; rdi = file descriptor, rsi = string, rdx = byte count
            mov         rax, 0x2000004      ; BSD / MacOS calling convention unlike Linux
            syscall
    		jc         	error               ; error sets carry flag, rax = errno
            ret
error:
			mov			r15, rax 			; save errno 
			call		___error			; retrieve address to errno
			mov			[rax], r15			; put errno in return value of __error (pointer to errno)
			mov			rax, -1
			ret