;=================================================
; Name: Joe Jimenez
; Email: joe.jimenez@email.ucr.edu
; 
; Lab: lab 7, ex 3
; Lab section: 25
; TA: James Luo
; 
;=================================================

; test harness
.orig x3000
    
        LD R6, STACK_ADDR

		AND R0, R0, #0
		ADD R0, R0, #5
		
		LD R5, FACT_ADDR
		JSRR R5
		
		HALT
				 
				 

;-----------------------------------------------------------------------------------------------
; test harness local data:

FACT_ADDR .FILL x3100
STACK_ADDR .FILL xFE00

;===============================================================================================
.end

; subroutines:

.ORIG x3100
FACT ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0


    ADD R1, R0, #-1
    BRz DONE
    ADD R1, R0, #0
    ADD R0, R1, #-1
    JSR FACT
    LD R5, MUL_ADDR
    JSRR R5
    
DONE 
LDR R1, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

    RET
    
MUL_ADDR .FILL x3200

Save1_3100 .BLKW 1
Save7_3100 .BLKW 1
.END



.ORIG x3200
MUL 
ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
    

    ADD R2, R0, #0
    AND R0, R0, #0
    
LOOP ADD R0, R0, R1

    ADD R2, R2, #-1
    BRp LOOP
    
    LDR R2, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

    RET
    

.END
