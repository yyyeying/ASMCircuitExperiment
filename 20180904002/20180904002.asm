pcl		equ		02h
status	equ		03h
rp0		equ		05h
rc		equ		07h
trisc	equ		87h

		org		0000h
		goto	main
		org		0005h	
main	bsf		status, rp0
		clrf	trisc
		bcf		status, rp0
		movf	20h, 0
		andlw	0fh
		call	convert
		movwf 	rc
stop	goto 	stop

convert	
		addwf	pcl, 1
table	retlw	3fh		;0
		retlw	06h		;1
		retlw	5bh		;2
		retlw	4fh		;3
		retlw	66h		;4
		retlw	6dh		;5
		retlw	7dh		;6
		retlw	07h		;7
		retlw	7fh		;8
		retlw	6fh		;9
		retlw	77h		;A
		retlw	7ch		;B
		retlw	39h		;C
		retlw	5eh		;D
		retlw	79h		;E
		retlw	71h		;F
		end