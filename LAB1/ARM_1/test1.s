.fpu vfp

.data
MAX_SIZE:
    .word 100
float_two:
    .float 2.0
x:
    .word 10
f:
    .float 3.14
arr1:
    .space 40  @ 10 * 4 bytes for int
arr2:
    .space 100 @ 5 * 5 * 4 bytes for float
y:
    .word 0
g:
    .float 0.0

.text
.global main
main:
    push {fp, lr}

    @ y = x + 5
    ldr r1, =x
    ldr r2, [r1]
    add r2, r2, #5
    ldr r3, =y
    str r2, [r3]

    @ g = f * 2.0
    ldr r1, =f
    vldr s0, [r1]
    vldr s1, =float_two
    vmul.f32 s0, s0, s1
    ldr r1, =g
    vstr s0, [r1]

    @ if (x > y)
    ldr r1, =x
    ldr r2, [r1]
    ldr r1, =y
    ldr r3, [r1]
    cmp r2, r3
    bgt .x_greater
    beq .x_equal
    blt .x_less

add:
    push {lr}         @ 保存返回地址
    add r0, r0, r1    @ r0 = r0 + r1
    pop {lr}          @ 恢复返回地址
    bx lr             @ 返回到调用者

multiply:
    push {lr}               @ 保存返回地址
    vmul.f32 s0, s0, s1     @ s0 = s0 * s1
    pop {lr}                @ 恢复返回地址
    bx lr                   @ 返回到调用者


.x_greater:
    ldr r0, =str_x_greater
    bl printf
    b .after_if

.x_equal:
    ldr r0, =str_x_equal
    bl printf
    b .after_if

.x_less:
    ldr r0, =str_x_less
    bl printf

.after_if:
    @ while loop
    mov r4, #0  @ i = 0
.while_loop:
    cmp r4, #5
    bge .after_while
    ldr r0, =str_value_of_i
    mov r1, r4
    bl printf
    add r4, r4, #1
    b .while_loop

.after_while:
    @ function calls (assuming add and multiply functions are defined elsewhere)
    ldr r1, =x
    ldr r2, [r1]
    ldr r1, =y
    ldr r3, [r1]
    bl add
    mov r5, r0  @ sum

    ldr r1, =f
    vldr s0, [r1]
    ldr r1, =g
    vldr s1, [r1]
    bl multiply
    vmov r6, s0  @ product

    ldr r0, =str_sum_product
    mov r1, r5
    mov r2, r6
    bl printf

    @ array operations and other parts of the code would go here...

    pop {fp, lr}
    bx lr

str_x_greater:
    .asciz "x is greater than y\n"
str_x_equal:
    .asciz "x is equal to y\n"
str_x_less:
    .asciz "x is less than y\n"
str_value_of_i:
    .asciz "Value of i: %d\n"
str_sum_product:
    .asciz "Sum: %d, Product: %.2f\n"
