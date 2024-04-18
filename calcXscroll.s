@calcXscroll.s

.global calcXscroll
@This function calculates how fast the screen should be scrolling
@Based on how far into the game the user has made it
calcXscroll:
    @r0 = xscroll distance
    @Check if made it around one time
    cmp r0, #256
    blt .first
    @Check second time
    cmp r0, #768
    blt .second
    @Third time
    cmp r0, #1280
    blt .third
    
    @4+ times by this point
    mov r0, #4
    b .end

    @Give each one its necessary scroll speed
    .first:
        mov r0, #1
        b .end
    .second:
        mov r0, #2
        b .end
    .third:
        mov r0, #3
        b .end

    @Return the speed to scroll
    .end:
        mov pc, lr
