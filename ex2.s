@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
@Implement gcd subroutine to find gcd of arg1 and arg2
@ gcd:
gcd:
sub sp,sp,#8

str r8,[sp,#4]
str r7,[sp,#0]
loopgcd:mov r7,r0
mov r8,r1

cmp r1,#0
ble exitloop
divis:
sub r7,r7,r8
cmp r7,r8
bgt divis
mov r9,r7
mov r0,r1
mov r1,r9
b loopgcd
exitloop:


ldr r8,[sp,#4]
ldr r7,[sp,#0]
add sp,sp,#8
mov pc,lr



@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64 	@the value a
	mov r5, #24 	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "gcd(%d,%d) = %d\n"

