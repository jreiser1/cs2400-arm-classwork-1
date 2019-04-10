memory	FILL		1024
		bal		main
		
malloc
		adr		r1, memory
		str		r0, [r1]
		mov		pc, r14
		
free
		adr		r1, memory
		mov		r2, #0
		str		r2, [r1]
		mov		pc, r14
		
main
		mov		r0, #4
		bl		malloc
		
		bl		free
		
		end
