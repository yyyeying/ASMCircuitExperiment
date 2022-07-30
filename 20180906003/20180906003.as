opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	dw 0x3B31 ;#
	FNCALL	_main,_dispDelay
	FNCALL	_dispDelay,_disp
	FNCALL	_disp,_delay
	FNROOT	_main
	global	_table
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	line	6
_table:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	retlw	077h
	retlw	07Ch
	retlw	039h
	retlw	05Eh
	retlw	079h
	retlw	071h
	global	_table
	global	_PORTA
_PORTA	set	5
	global	_PORTD
_PORTD	set	8
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	file	"20180906003.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_disp
?_disp:	; 0 bytes @ 0x0
	global	?_dispDelay
?_dispDelay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@x
delay@x:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	delay@a
delay@a:	; 2 bytes @ 0x2
	ds	2
	global	delay@b
delay@b:	; 2 bytes @ 0x4
	ds	2
	global	??_disp
??_disp:	; 0 bytes @ 0x6
	global	disp@num
disp@num:	; 1 bytes @ 0x6
	ds	1
	global	??_dispDelay
??_dispDelay:	; 0 bytes @ 0x7
	global	dispDelay@num
dispDelay@num:	; 1 bytes @ 0x7
	ds	1
	global	dispDelay@i
dispDelay@i:	; 2 bytes @ 0x8
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@num
main@num:	; 4 bytes @ 0x0
	ds	4
;;Data sizes: Strings 0, constant 16, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          13     10      10
;; BANK0           80      4       4
;; BANK1           80      0       0
;; BANK3           85      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; dispDelay@num	PTR unsigned char  size(1) Largest target is 4
;;		 -> main@num(BANK0[4]), 
;;
;; disp@num	PTR unsigned char  size(1) Largest target is 4
;;		 -> main@num(BANK0[4]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_dispDelay
;;   _dispDelay->_disp
;;   _disp->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     606
;;                                              0 BANK0      4     4      0
;;                          _dispDelay
;; ---------------------------------------------------------------------------------
;; (1) _dispDelay                                            3     3      0     270
;;                                              7 COMMON     3     3      0
;;                               _disp
;; ---------------------------------------------------------------------------------
;; (2) _disp                                                 1     1      0     202
;;                                              6 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                6     4      2     114
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _dispDelay
;;     _disp
;;       _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            D      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               D      A       A       1       76.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      4       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            55      0       0       8        0.0%
;;BANK3               55      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 38 in file "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  num             4    0[BANK0 ] unsigned char [4]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_dispDelay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	line	38
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	39
	
l1895:	
;20180906003.c: 39: TRISA = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	40
;20180906003.c: 40: TRISD = 0;
	clrf	(136)^080h	;volatile
	line	41
	
l1897:	
;20180906003.c: 41: unsigned char num[4] = {0,0,0,0};
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@num)
	clrf	(main@num+1)
	clrf	(main@num+2)
	clrf	(main@num+3)
	line	44
	
l1899:	
;20180906003.c: 43: {
;20180906003.c: 44: dispDelay(num);
	movlw	(main@num)&0ffh
	fcall	_dispDelay
	line	45
	
l1901:	
;20180906003.c: 45: num[3]++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	0+(main@num)+03h,f
	line	46
	
l1903:	
;20180906003.c: 46: if(num[3]==10)
	movf	0+(main@num)+03h,w
	xorlw	0Ah
	skipz
	goto	u111
	goto	u110
u111:
	goto	l1909
u110:
	line	48
	
l1905:	
;20180906003.c: 47: {
;20180906003.c: 48: num[3] = 0;
	clrf	0+(main@num)+03h
	line	49
	
l1907:	
;20180906003.c: 49: num[2]++;
	incf	0+(main@num)+02h,f
	line	51
	
l1909:	
;20180906003.c: 50: }
;20180906003.c: 51: if(num[2]==10)
	movf	0+(main@num)+02h,w
	xorlw	0Ah
	skipz
	goto	u121
	goto	u120
u121:
	goto	l1915
u120:
	line	53
	
l1911:	
;20180906003.c: 52: {
;20180906003.c: 53: num[2] = 0;
	clrf	0+(main@num)+02h
	line	54
	
l1913:	
;20180906003.c: 54: num[1]++;
	incf	0+(main@num)+01h,f
	line	56
	
l1915:	
;20180906003.c: 55: }
;20180906003.c: 56: if(num[1]==10)
	movf	0+(main@num)+01h,w
	xorlw	0Ah
	skipz
	goto	u131
	goto	u130
u131:
	goto	l1921
u130:
	line	58
	
l1917:	
;20180906003.c: 57: {
;20180906003.c: 58: num[1] = 0;
	clrf	0+(main@num)+01h
	line	59
	
l1919:	
;20180906003.c: 59: num[0]++;
	incf	(main@num),f
	line	61
	
l1921:	
;20180906003.c: 60: }
;20180906003.c: 61: if(num[0]==10)
	movf	(main@num),w
	xorlw	0Ah
	skipz
	goto	u141
	goto	u140
u141:
	goto	l1899
u140:
	line	63
	
l1923:	
;20180906003.c: 62: {
;20180906003.c: 63: num[0] = 0;
	clrf	(main@num)
	line	64
;20180906003.c: 64: num[1] = 0;
	clrf	0+(main@num)+01h
	line	65
;20180906003.c: 65: num[2] = 0;
	clrf	0+(main@num)+02h
	line	66
;20180906003.c: 66: num[3] = 0;
	clrf	0+(main@num)+03h
	goto	l1899
	line	70
	
l712:	
	goto	l712
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	71
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dispDelay
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _dispDelay *****************
;; Defined at:
;;		line 32 in file "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
;; Parameters:    Size  Location     Type
;;  num             1    wreg     PTR unsigned char 
;;		 -> main@num(4), 
;; Auto vars:     Size  Location     Type
;;  num             1    7[COMMON] PTR unsigned char 
;;		 -> main@num(4), 
;;  i               2    8[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_disp
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	line	32
	global	__size_of_dispDelay
	__size_of_dispDelay	equ	__end_of_dispDelay-_dispDelay
	
_dispDelay:	
	opt	stack 5
; Regs used in _dispDelay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;dispDelay@num stored from wreg
	movwf	(dispDelay@num)
	line	33
	
l1883:	
;20180906003.c: 33: for(int i = 0;i < 125;i++)
	clrf	(dispDelay@i)
	clrf	(dispDelay@i+1)
	line	34
	
l1889:	
;20180906003.c: 34: disp(num);
	movf	(dispDelay@num),w
	fcall	_disp
	line	33
	
l1891:	
	incf	(dispDelay@i),f
	skipnz
	incf	(dispDelay@i+1),f
	
l1893:	
	movf	(dispDelay@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u105
	movlw	low(07Dh)
	subwf	(dispDelay@i),w
u105:

	skipc
	goto	u101
	goto	u100
u101:
	goto	l1889
u100:
	line	35
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_dispDelay
	__end_of_dispDelay:
;; =============== function _dispDelay ends ============

	signat	_dispDelay,4216
	global	_disp
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _disp *****************
;; Defined at:
;;		line 16 in file "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
;; Parameters:    Size  Location     Type
;;  num             1    wreg     PTR unsigned char 
;;		 -> main@num(4), 
;; Auto vars:     Size  Location     Type
;;  num             1    6[COMMON] PTR unsigned char 
;;		 -> main@num(4), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_dispDelay
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	line	16
	global	__size_of_disp
	__size_of_disp	equ	__end_of_disp-_disp
	
_disp:	
	opt	stack 5
; Regs used in _disp: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;disp@num stored from wreg
	movwf	(disp@num)
	line	17
	
l1863:	
;20180906003.c: 17: PORTD = table[num[0]];
	movf	(disp@num),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	low((_table-__stringbase))
	movwf	fsr0
	fcall	stringdir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	18
	
l1865:	
;20180906003.c: 18: PORTA = 0x08;
	movlw	(08h)
	movwf	(5)	;volatile
	line	19
	
l1867:	
;20180906003.c: 19: delay(2);
	movlw	02h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	20
	
l1869:	
;20180906003.c: 20: PORTD = table[num[1]];
	movf	(disp@num),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	addlw	low((_table-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(8)	;volatile
	line	21
	
l1871:	
;20180906003.c: 21: PORTA = 0x04;
	movlw	(04h)
	movwf	(5)	;volatile
	line	22
;20180906003.c: 22: delay(2);
	movlw	02h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	23
	
l1873:	
;20180906003.c: 23: PORTD = table[num[2]];
	movf	(disp@num),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	addlw	low((_table-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(8)	;volatile
	line	24
	
l1875:	
;20180906003.c: 24: PORTA = 0x02;
	movlw	(02h)
	movwf	(5)	;volatile
	line	25
	
l1877:	
;20180906003.c: 25: delay(2);
	movlw	02h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	26
	
l1879:	
;20180906003.c: 26: PORTD = table[num[3]];
	movf	(disp@num),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	addlw	low((_table-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(8)	;volatile
	line	27
;20180906003.c: 27: PORTA = 0x01;
	movlw	(01h)
	movwf	(5)	;volatile
	line	28
	
l1881:	
;20180906003.c: 28: delay(2);
	movlw	02h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	29
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_disp
	__end_of_disp:
;; =============== function _disp ends ============

	signat	_disp,4216
	global	_delay
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:

;; *************** function _delay *****************
;; Defined at:
;;		line 9 in file "C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  b               2    4[COMMON] unsigned int 
;;  a               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_disp
;; This function uses a non-reentrant model
;;
psect	text88
	file	"C:\myFiles\CircuitExperiment\20180906003\20180906003.c"
	line	9
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+status,0]
	line	11
	
l1843:	
;20180906003.c: 10: unsigned int a,b;
;20180906003.c: 11: for(a=x;a>0;a--)
	movf	(delay@x+1),w
	movwf	(delay@a+1)
	movf	(delay@x),w
	movwf	(delay@a)
	
l1845:	
	movf	((delay@a+1)),w
	iorwf	((delay@a)),w
	skipz
	goto	u81
	goto	u80
u81:
	goto	l1849
u80:
	goto	l691
	line	12
	
l1849:	
;20180906003.c: 12: for(b=110;b>0;b--);
	movlw	06Eh
	movwf	(delay@b)
	clrf	(delay@b+1)
	
l1855:	
	movlw	low(01h)
	subwf	(delay@b),f
	movlw	high(01h)
	skipc
	decf	(delay@b+1),f
	subwf	(delay@b+1),f
	
l1857:	
	movf	((delay@b+1)),w
	iorwf	((delay@b)),w
	skipz
	goto	u91
	goto	u90
u91:
	goto	l1855
u90:
	line	11
	
l1859:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	goto	l1845
	line	13
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
