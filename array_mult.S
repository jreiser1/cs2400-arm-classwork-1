L7		FILL		200
		
main
		sub		sp, sp, #8
		movs		r3, #0
		str		r3, [sp, #4]
		b		L2
L5
		movs		r3, #0
		str		r3, [sp]
		b		L3
L4
		ldr		r3, [sp, #4]
		ldr		r2, [sp]
		;mul		r3, r2, r3
		stmdb	sp!, {r2, r3}
		bl		mult
		mov		r3, r0
		lsls		r1, r3, #1
		adr		r0, L7
		ldr		r2, [sp, #4]
		mov		r3, r2
		lsls		r3, r3, #2
		add		r3, r3, r2
		ldr		r2, [sp]
		add		r3, r3, r2
		str		r1, [r0, r3, lsl #2]
		ldr		r3, [sp]
		adds		r3, r3, #1
		str		r3, [sp]
L3
		ldr		r3, [sp]
		cmp		r3, #4
		ble		L4
		ldr		r3, [sp, #4]
		adds		r3, r3, #1
		str		r3, [sp, #4]
L2
		ldr		r3, [sp, #4]
		cmp		r3, #9
		ble		L5
		movs		r3, #0
		mov		r0, r3
		add		sp, sp, #8
		;bx		lr
		end
		
mult
		ldmia	sp!, {r0, r1} ;load operands onto the stack
		stmdb	sp!, {r4, r5}
		mov		r2, #1	;shift tracking bit
		mov		r3, #0	;counter
		mov		r4, #0	;result register
		mov		r5, #0	;temp
loop
		cmp		r3, #33	;compare to make sure result isnt too large
		beq		move
		tst		r2, r0	; testing bit to see if its 1
		lsl		r2, r2, #1	; shift r2 left by 1 bit
		add		r3, r3, #1
		beq		loop
		mov		r5, r1 ;storing r1 into temp register
		lsl		r5, r5, r3
		add		r4, r4, r5
		bal		loop
		
move
		mov		r0, r4
		ldmia	sp!, {r4, r5}
		mov		pc, lr
