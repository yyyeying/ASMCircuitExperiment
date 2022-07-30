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
# 4 "C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
	dw 0x3B31 ;#
	FNCALL	_main,_delay
	FNROOT	_main
	global	_PORTD
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTD	set	8
	global	_TRISD
_TRISD	set	136
	file	"20180906002.as"
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
	global	??_main
??_main:	; 0 bytes @ 0x6
	global	main@i
main@i:	; 1 bytes @ 0x6
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          13      7       7
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           85      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay
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
;; (0) _main                                                 1     1      0     105
;;                                              6 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                6     4      2      75
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            D      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               D      7       7       1       53.8%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
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
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 13 in file "C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l1764:	
;20180906002.c: 14: unsigned char i;
;20180906002.c: 15: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	17
	
l1766:	
;20180906002.c: 17: PORTD = 0x01;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	18
	
l1768:	
;20180906002.c: 18: for(i=0;i<8;i++)
	clrf	(main@i)
	line	20
	
l1772:	
;20180906002.c: 19: {
;20180906002.c: 20: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	21
	
l1774:	
;20180906002.c: 21: PORTD=PORTD<<1;
	clrc
	rlf	(8),f	;volatile
	line	18
	
l1776:	
	incf	(main@i),f
	
l1778:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1772
u30:
	goto	l1766
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	24
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay
psect	text20,local,class=CODE,delta=2
global __ptext20
__ptext20:

;; *************** function _delay *****************
;; Defined at:
;;		line 7 in file "C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
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
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text20
	file	"C:\myFiles\CircuitExperiment\20180906002\20180906002.c"
	line	7
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+status,0]
	line	9
	
l1744:	
;20180906002.c: 8: unsigned int a,b;
;20180906002.c: 9: for(a=x;a>0;a--)
	movf	(delay@x+1),w
	movwf	(delay@a+1)
	movf	(delay@x),w
	movwf	(delay@a)
	
l1746:	
	movf	((delay@a+1)),w
	iorwf	((delay@a)),w
	skipz
	goto	u11
	goto	u10
u11:
	goto	l1750
u10:
	goto	l689
	line	10
	
l1750:	
;20180906002.c: 10: for(b=110;b>0;b--);
	movlw	06Eh
	movwf	(delay@b)
	clrf	(delay@b+1)
	
l1756:	
	movlw	low(01h)
	subwf	(delay@b),f
	movlw	high(01h)
	skipc
	decf	(delay@b+1),f
	subwf	(delay@b+1),f
	
l1758:	
	movf	((delay@b+1)),w
	iorwf	((delay@b)),w
	skipz
	goto	u21
	goto	u20
u21:
	goto	l1756
u20:
	line	9
	
l1760:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	goto	l1746
	line	11
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text21,local,class=CODE,delta=2
global __ptext21
__ptext21:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
