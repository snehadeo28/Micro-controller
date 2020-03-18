 		org 00h
	    ljmp start

; elements of multiplication

		org 100h
		multiplier: db 10H
		multiplicand_lb: db 34H
		multiplicand_hb: db 12H 
	  
	  


start: call mult
       call display
 here: jmp here

 	   ; main program  logic

  mult: mov dptr, #multiplier
        clr a
		movc a,@a+dptr
		mov b,a
		inc dptr
		mov dptr,#multiplicand_lb
		clr a
		movc a,@a+dptr
		mul ab			; aXb result  a=lower byte ,b=higher byte
		mov r0,a
		mov r1,b
		mov dptr,#multiplier
		clr a
		movc a,@a+dptr
		mov b,a
		mov dptr,#multiplicand_hb
		clr a
		movc a,@a+dptr
		mul ab
		add a,r1
		mov r6,a
		jnc dn
		inc b
	dn: ret

	;***********display logic*****

   display: mov a,b
            
			mov p2,a	 ;higher byte
			
			mov a,r6	  ; middle byte
		
			mov p2,a
			
			mov a,r0	  ; last byte
		
			mov p2,a
			
			ret

  end

