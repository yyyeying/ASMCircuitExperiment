status	equ		3h
portc	equ		7h
trisc	equ		87h
portb	equ		6h
trisb	equ		86h
n1		equ		d'14'
data1	equ		20h
n2		equ		d'230'
data2	equ		21h

rp0		equ		5h
		org		000h
		nop
		bsf		status,	rp0
		movlw	00h
		movwf	trisb
		movlw	00h
		movwf	trisc
		bcf		status, rp0
		movlw  00h
		movwf	portb

	
		call	down
		movlw	b'00000001'
		movwf	portc                  
		call    down	
		movlw	b'00001000'	; 退格 close display
		movwf	portc
		call	down
		movlw	b'00000110'	;确认回应 clear screen
		movwf	portc
		call 	down
 		movlw	b'00001100'	;换页键 clear screen
 		movwf	portc
 		call 	down
		bcf 	portb,0
		movlw	b'00000001'
		movwf	portc	
		call 	down
		movlw	b'00000001'
		movwf	portb
		movlw	b'00100000';空格
		movwf	portc
		call 	down
		movlw	b'01010111';W
		movwf	portc	
		call 	down
		movlw	b'01000101';E
		movwf	portc	
		call 	down


down	bsf portb,1
		nop
		nop
		nop
		bcf portb,1
		call delay
		return

delay
		movlw	n1
		movwf	data1
lp0		movlw	n2
		movwf	data2
lp1		decfsz	data2,1
		goto	lp1
		decfsz	data1,1
		goto 	lp0
		return
		end