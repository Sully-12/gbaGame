@ score.s

.global score

score:
    @r0 and r1 map to the sprites x coordinates
    @store on the stack 
    
    sub sp, sp, #4
    str lr, [sp]

    sub sp, sp, #4
    str r4, [sp]

    sub sp, sp, #4
    str r5, [sp]

    @move the values to their respective "stack spot"
    mov r4, r0
    mov r5, r1

    b .modIt
    cmp r0, #0
    bne .end
    add r4, r4, #1
    
    mov r5, r0
    b .modIt
    cmp r0, #0
    bne .end

    add r4, r4, #1
    b .end


.modIt:
    and r0, r0, #0x100
    mov pc, lr

.end:

    mov r0, r4

    @reload the values stored back into place
    ldr r5, [sp]
    add sp, sp, #4

    ldr r4, [sp]
    add sp, sp, #4

    ldr lr, [sp]
    add sp, sp, #4

    mov r2, #10
    mul r0, r2, r0

    @return 
    mov pc, lr
