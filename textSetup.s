@textSetup.s

.global textSetup

@This function will reset the data in the text screen to be zero
textSetup:
    @Store the data in importnat memory spots first
    .storeStuff: 
        sub sp, sp, #4
        str lr, [sp]

        sub sp, sp, #4
        str r4, [sp]
        
        sub sp, sp, #4
        str r5, [sp]    

    @Set the variables default values
    .initializeStuff:
        @32x32=1024
        mov r1, #1024
        @Need to replace with 0
        mov r2, #0
        @The start of the array
        mov r4, r0
        @Where at in the array
        mov r5, #0
    
    @Continue iterating until all pixels have been cleared
    .iterate:
        @See if end condition has been met
        cmp r5, r1
        beq .done
        @Store a zero at this position
        strb r2, [r4, r5]
        @Increment the counter
        add r5, r5, #1
        @Go back to the top
        b .iterate

    @Reload the saved data and return
    .done:
        ldr r5, [sp]
        add sp, sp, #4

        ldr r4, [sp]
        add sp, sp, #4

        ldr lr, [sp]
        add sp, sp, #4

        mov pc, lr
        
        
