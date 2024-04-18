@textSetup.s

.global textSetup

textSetup:
    .storeStuff: 
        sub sp, sp, #4
        str lr, [sp]

        sub sp, sp, #4
        str r4, [sp]
        
        sub sp, sp, #4
        str r5, [sp]    

    .initializeStuff:
        mov r1, #1024
        mov r2, #0
        mov r4, r0
        mov r5, #0

    .iterate:
        cmp r5, r1
        beq .done
        strb r2, [r4, r5]
        add r5, r5, #1
        b .iterate

    .done:
        ldr r5, [sp]
        add sp, sp, #4

        ldr r4, [sp]
        add sp, sp, #4

        ldr lr, [sp]
        add sp, sp, #4

        mov pc, lr
        
        
