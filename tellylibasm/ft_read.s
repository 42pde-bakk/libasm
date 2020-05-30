; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:00:31 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 15:00:31 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_read
extern	___error
	
_ft_read:                                   ; rdi = fd, rsi = bufferstring, rdx = bytes to read
            mov         rax, 0x2000003      ; BSD / MacOS calling convention, unlike Linux
            syscall
            jc          error               ; error sets carry flag, rax = errno
            ret
error:
			mov			r15, rax 			; save errno	
			call		___error			; retrieve address to errno
			mov			[rax], r15			; put errno in pointer to errno (return value of __error)
            mov         rax, -1
            ret
