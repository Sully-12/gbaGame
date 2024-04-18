@calcXscroll.s

.global calcXscroll

calcXscroll:
    @given just the input of xscroll
    cmp r0, #256
    blt .first
    cmp r0, #768
    blt .second
    cmp r0, #1280
    blt .third
    
    mov r0, #4
    b .end

    .first:
        mov r0, #1
        b .end
    .second:
        mov r0, #2
        b .end
    .third:
        mov r0, #3
        b .end

    .end:
        mov pc, lr
