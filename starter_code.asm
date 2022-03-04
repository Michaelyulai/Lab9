.orig x3000
;this stack lab computes the polish notation of a set of calls

; set top of stack
LD  R6, STACK_ADDR

;push_val(4) pushes the value 4 onto the stack [4]
AND r0, r0, x0
ADD r0, r0, #4
LD  r5, PUSH_VAL_ADDR
JSRR r5

;push_val(3) pushes the value 3 onto the stack [4,3]
AND r0, r0, x0
ADD r0, r0, #3
LD  r5, PUSH_VAL_ADDR
JSRR r5


;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND r0, r0, x0
ADD r0, r0, #2
LD  r5, PUSH_VAL_ADDR
JSRR r5


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD  r5, ADD_VAL_ADDR
JSRR r5


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD  r5, ADD_VAL_ADDR
JSRR r5



;move the top value of the stack into r4
LDR R4, R6, #0
ADD R6, R6, #1

halt
STACK_ADDR          .FILL xFE00
PUSH_VAL_ADDR       .FILL x3400
ADD_VAL_ADDR        .FILL x3800
.end




;---------------------------------------------------------------------------------
; push_val - pushes the value on R0 to stack
;
; parameter: R0 - the value to be pushed on stack
;
; returns: nothing
;---------------------------------------------------------------------------------
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

ADD R6, R6, #-1
STR R0, R6, #0
ret
.end
;---------------------------------------------------------------------------------
; add_val - pops two values from stack adds them and then pushes the result in the stack
;
; parameter: none
;
; returns: nothing
;---------------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1

ADD R0, R0, R1

; push the value on stack
ADD R6, R6, #-1
STR R0, R6, #0
ret
.end



.orig x4200 ;;data you might need

.end
; remote data
.orig xFD00
STACK_DATA   .BLKW   x101
.end 

