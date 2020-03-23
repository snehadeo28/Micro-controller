Org 0000h			//initialize memory location 0000h
ljmp main			//transfers the control to label main

Org 000bh			//initialize memory location 000bh
cpl p1.2			//logically compliment p1.2
mov tl0,#06h			//move immediate data 06h to tl0
mov th0,#0ffh			//move immediate data 0ffh to th0
reti				//ends the isr

main:				//label named main
mov tmod,#01h	// move immediate data 01h to tmod
mov tl0,#06h		//move immediate data 06h to tl0
mov th0,#0ffh		//move immediate data 0ffh to th0
mov ie,#82h		// move immediate data 82h to ie
setb tcon.4		//set tcon.4 bit to 1

here:				//label named here
Sjmp here		//transfer control to label here

end
