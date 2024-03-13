global _start
extern printf, scanf

section .data
	message db "How high to go? Enter the maximum Fibonaci number:", 0x0a
	outFormat db "%d", 0x0a, 0x00
	inFormat db "%d", 0x00

section .bss
	userInput resb 1	;Reserve 1 byte for user input in getInput

section .text
_start:
	call printMessage	;print intro msg
	call getInput		;get the max number from user input
	call initFib		;set initial values
	call loopFib		;calculate fib numbers
	call Exit		;Exit program

printMessage:
	mov rax, 1 		;Set syscall number 1, write
	mov rdi, 1 		;fd 1 for stdout, 1st syscall arg
	mov rsi,message 	;pointer to message in data, 2nd arg in syscall
	mov rdx, 50 		;print lengt of 20 bytes, 3rd argument in syscall
	syscall 		;call write syscall
	ret			;Return

getInput:
	sub rsp, 8		;align stack to 16-bytes
	mov rdi, inFormat	;set 1st parameter
	mov rsi, userInput	;set 2nd parameter
	call scanf		;call scanf(inFormat, userInput)
	add rsp, 8		;restore stack alignment
	ret

initFib:
        mov rax, 0 		;Set init value F0=0
	xor rbx, rbx 		;Set init value F1=0, xor variant
	inc rbx 		;Increase register bl with one, F1=1
	ret
loopFib:
	call printFib		;call printFib to print current fib number
	add rax, rbx 		;Values rax+rbx, store in register rax, get the next number
	xchg rax, rbx 		;Swap values in rax and rbx
	cmp rbx,[userInput]	;Do rbx-userInput value
	js loopFib 		;Back to loop start if rbx-10<0
	ret

printFib:
	push rax		;push rax to stack
	push rbx		;push rbx to stack
	mov rdi, outFormat	;set 1 argument, print format
	mov rsi, rbx		;set 2nd argument, the fib number stores in rbx
	call printf		;printf(outFormat, rbx)
	pop rbx			;restore register rbx from stack
	pop rax			;restore rax
	ret

Exit:
	mov rax, 60 		;set syscall number 60, exit
	mov rdi, 0 		;0, exit without errors, 1st syscall arg
	syscall 		;call exit syscall
