memory	FILL		1024
		bal		main
		;R10		is counter
		mov		R10,#0
malloc
		;r0		has memory size
		adr		R1,memory
		add		R1,R1,R10	;set pointer to end of data
		
		;store	size in first word
		str		R0,[R1]
		
		;count	the size + the 4-bytes
		add		R0,R0,#4
		add		R10,R10,R0
		
		mov		R0,R1
		add		R0,R0,#4
		mov		PC,r14
		
free
		;r0		points to the memor location
		mov		R2,R0
		sub		R2,R2,#4
		ldr		R1,[R2] ;size
		sub		R10,R10,R1
		sub		R10,R10,#4
		;pointer	counter is correct
		mov		PC,r14
		
main
		mov		R0,#4
		bl		malloc
		;r0		has the memory pointer
		bl		free
		
		
end