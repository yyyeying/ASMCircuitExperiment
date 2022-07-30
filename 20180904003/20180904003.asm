status		equ		3h
portb		equ		6h
trisb		equ		86h
portc		equ		7h
trisc		equ		87h
portd		equ		8h
trisd		equ		88h
data1		equ		20h
data2		equ		21h
number		equ		22h
n1			equ		d'13'
n2			equ		0ffh

rp0			equ		5h
rp1			equ		6h

			org		000h
			nop
			bsf		status, rp0
			movlw	00h
			movwf	trisc
			movlw	00h
			movwf	trisb
			movlw	0ffh
			movwf	trisd
			bcf		status, rp0
			movlw	00h
			movwf	portc
check		btfsc	portd, 0
			goto 	check
			call	delay
			btfsc	portd, 0
			goto	check
			incf	number
check1		btfss	portd, 0
			goto	check1
			call	delay
			btfss	portd, 0
			goto	check1
			goto	check

delay
			movlw	n1
			movwf	data1
lp0			movlw	n2
			movwf	data2
lp1			decfsz	data2,1
			goto	lp1
			decfsz	data1,1
			goto 	lp0
			return
			end