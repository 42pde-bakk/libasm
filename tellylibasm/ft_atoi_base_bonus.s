; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_atoi_base_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: abobas <abobas@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/30 15:01:10 by abobas        #+#    #+#                  ;
;    Updated: 2020/04/30 15:01:10 by abobas        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  _ft_atoi_base

_ft_atoi_base:                                                  ; rdi = string, rsi = base
                    mov         rbx, 0                          ; base length
                    cmp         rdi, 0
                    je          error
                    cmp         rsi, 0
                    je          error
                    mov         rax, 0
                    jmp         base_loop
base_inc:
                    inc         rbx
base_loop:
                    cmp         byte[rsi + rbx], 0              ; stopping condition for base checker
                    je          base_end                        ; return base
                    mov         rcx, rbx                        ; base checker index
base_checker_inc:
                    inc         rcx
base_checker_loop:
                    cmp         byte[rsi + rcx], 0              ; delimiter
                    je          base_check
                    mov         r13b, byte[rsi + rcx]
                    cmp         byte[rsi + rbx], r13b           ; check for duplicate base characters
                    je          error
                    jmp         base_checker_inc
base_check:
			        cmp		    byte[rsi + rbx], 43	            ; '+'
			        je		    error
			        cmp		    byte[rsi + rbx], 45	            ; '-'
			        je		    error
                    cmp		    byte[rsi + rbx], 32 	        ; ' '
			        je		    error
			        cmp		    byte[rsi + rbx], 9	            ; '\t'
			        je		    error
			        cmp		    byte[rsi + rbx], 10	            ; '\n'
			        je		    error
			        cmp	        byte[rsi + rbx], 13 	        ; '\r'
			        je		    error
			        cmp		    byte[rsi + rbx], 11 	        ; '\v'
			        je		    error
			        cmp		    byte[rsi + rbx], 12	            ; '\f'
                    je          error
                    jmp         base_inc
base_end:
                    cmp         rbx, 1
                    jle         error
                    mov         r12, 0                          ; string_index
                    jmp         whitespace
whitespace_inc:
                    inc         r12
whitespace:
                    cmp		    byte[rdi + r12], 32 	        ; ' '
			        je		    whitespace_inc
			        cmp		    byte[rdi + r12], 9	            ; '\t'
			        je		    whitespace_inc
			        cmp		    byte[rdi + r12], 10	            ; '\n'
			        je		    whitespace_inc
			        cmp	        byte[rdi + r12], 13 	        ; '\r'
			        je		    whitespace_inc
			        cmp		    byte[rdi + r12], 11 	        ; '\v'
			        je		    whitespace_inc
			        cmp		    byte[rdi + r12], 12	            ; '\f'
                    je          whitespace_inc
                    mov         r13, 1                          ; negative bool
                    jmp         plus_minus
is_neg:
                    imul        r13, -1
plus_min_inc:
                    inc         r12
plus_minus:
                    cmp		    byte[rdi + r12], 45	            ; '-'
			        je          is_neg
                    cmp		    byte[rdi + r12], 43	            ; '+'
			        je		    plus_min_inc
                    jmp         atoi_loop
atoi_inc:
                    inc         r12
atoi_loop:
                    cmp         byte[rdi + r12], 0              ; end of string
                    je          return
                    mov         r14, 0                          ; base char index
                    jmp         atoi_index
atoi_index_inc:
                    inc         r14
atoi_index:
                    mov         r15b, byte[rsi + r14]           ; put base char in register
                    cmp         r15b, 0
                    je          return
                    cmp         byte[rdi + r12], r15b           ; is base char same as string char
                    jne         atoi_index_inc
return_value:
                    imul        rax, rbx                        ; multiply total by baselength
                    jo          long_max                        ; jump if overflow
                    add         rax, r14                        ; add base char to return value
                    jmp         atoi_inc                
error:
                    mov         rax, 0
                    ret
neg_rax:
                    neg         rax                             ; return negative
                    ret
long_max:
                    mov         rax, -1
                    cmp         r13, 0                          ; check negative_bool
                    jl          error                           ; not actually an error, but returning 0 with negative long overflow like intended
return:
                    cmp         r13, 0                          ; check negative_bool
                    jl          neg_rax
                    ret
