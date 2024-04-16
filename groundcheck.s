@ groundcheck.s

.global groundcheck
groundcheck:
    mov r1, #55
    cmp r0, r1
    bgt .larger
    mov r0, #1
    b .done
    .larger:
    mov r0, #0
    b .done

    .done:
    mov pc, lr
