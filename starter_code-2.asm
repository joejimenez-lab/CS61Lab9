.orig x3000
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]


;push_val(3) pushes the value 3 onto the stack [4,3]



;push_val(2) pushes the value 2 onto the stack [4,3,2]



;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]



;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]

    
    LEA R3 Stack
    
    AND R4 R4 #0    ; will contain ans
    

    AND R1, R1, #0
    ADD R1 R1 #4
    
    LD R6, Push_val
    JSRR R6
  
    
    AND R1, R1, #0
    ADD R1 R1 #3
    
    LD R6, Push_val
    JSRR R6


    AND R1, R1, #0
    ADD R1 R1 #2
    
    LD R6, Push_val
    JSRR R6






    LEA R3 Stack
    LDR R5 R3 #1    ; read operator
    LDR R2 R3 #2   ; reload n2 in R2


    ADD R4 R5 R2
    
    LD R6, add_val
    JSRR R6
    
HALT   

Stack    .BLKW #3
Push_Val .fill x3400
add_val     .fill x3800



;move the top value of the stack into r4
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

    STR R1 R3 #0
    ADD R3 R3 #1

    ret

.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack


    LDR R5, R3, #0
    
    ADD R3, R3, #2
    
    
    AND R1, R1, #0
    STR R1 R3 #0
    ADD R3 R3 #-1
    
    AND R1, R1, #0
    STR R1 R3 #0
    ADD R3 R3 #-1
    
    
    ADD R3 R3 #1
    ADD R1 R1 R4
    
    STR R1 R3 #0
    ADD R3 R3 #2
    
    
    ADD R4, R4, R5
    
    ADD R3 R3 #-2
    AND R1, R1, #0
    STR R1 R3 #0
    ADD R3 R3 #-1
    
    STR R4, R3, #0

ret
.end



.orig x4200 ;;data you might need

.end


