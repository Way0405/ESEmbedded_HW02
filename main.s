.syntax unified

.word 0x20000100
.word _start

.global _start
.type _start, %function
_start:
	nop

	//
	//branch w/o link
	//
	b	initial_1

initial_1:
	nop
	MOV r1,#1
	MOV r2,#2
	MOV r3,#3
        MOV r4,#4
        MOV r5,#5
        MOV r6,#6
	
	b 	label_a
label_a://observe the behavior of pop 
	nop
	PUSH    {r1}
	PUSH	{R2}
	push	{r3}
	push	{r4}
	PUSH	{r5}
	push	{r6}
	pop	{r1,r2,r3,r4,r5,r6}
 
  
	b	initial_2
initial_2:
        nop
        MOV r1,#1
        MOV r2,#2
        MOV r3,#3
        MOV r4,#4
        MOV r5,#5
        MOV r6,#6

        b       label_b
label_b:
        nop
        push     {r1,r2,r3,r4,r5,r6}
        Pop    {r1}
        Pop    {R2}
        pop    {r3}
        pop    {r4}
        Pop    {r5}
        pop    {r6}

        push     {r1,r2,r3,r4,r5,r6}
        Pop    {r6}
        Pop    {r5}
        pop    {r4}
        pop    {r3}
        Pop    {r2}
        pop    {r1}

	
	b	sleep       
sleep:
	nop
	bl	_start
