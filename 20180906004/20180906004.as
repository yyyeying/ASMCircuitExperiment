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
# 13 "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	psect config,class=CONFIG,delta=2 ;#
# 13 "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	dw 0x3545 ;#
	FNCALL	_main,_port_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_display
	FNCALL	_main,_delay
	FNCALL	_main,_scan
	FNCALL	_main,_temp_trans
	FNCALL	_main,_humd_trans
	FNCALL	_main,_pm_trans
	FNCALL	_lcd_display,_lcd_enable
	FNCALL	_lcd_display,_lcd_writedata
	FNCALL	_lcd_init,_lcd_enable
	FNCALL	_lcd_writedata,_lcd_writebyte
	FNCALL	_pm_trans,___awdiv
	FNCALL	_pm_trans,___wmul
	FNCALL	_pm_trans,_trans_to_ASCII
	FNCALL	_humd_trans,___awdiv
	FNCALL	_humd_trans,___wmul
	FNCALL	_humd_trans,_trans_to_ASCII
	FNCALL	_temp_trans,___awdiv
	FNCALL	_temp_trans,___wmul
	FNCALL	_temp_trans,_trans_to_ASCII
	FNCALL	_scan,_delay
	FNCALL	_lcd_writebyte,_delay
	FNCALL	_lcd_enable,_delay
	FNROOT	_main
	global	_pm25
	global	_shidu
	global	_wendu
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	57

;initializer for _pm25
	retlw	050h
	retlw	04Dh
	retlw	032h
	retlw	02Eh
	retlw	035h
	retlw	03Ah
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	075h
	retlw	067h
	retlw	02Fh
	retlw	06Dh
	retlw	05Eh
	retlw	032h
	line	54

;initializer for _shidu
	retlw	0CAh
	retlw	0AAh
	retlw	0B6h
	retlw	0C8h
	retlw	03Ah
	retlw	020h
	retlw	030h
	retlw	030h
	retlw	030h
	retlw	02Eh
	retlw	030h
	retlw	025h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	line	51

;initializer for _wendu
	retlw	0CEh
	retlw	0C2h
	retlw	0B6h
	retlw	0C8h
	retlw	03Ah
	retlw	020h
	retlw	030h
	retlw	030h
	retlw	02Eh
	retlw	030h
	retlw	0A1h
	retlw	0E6h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	0
	global	_huanyingshiyong
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	36
_huanyingshiyong:
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	0BBh
	retlw	0B6h
	retlw	0D3h
	retlw	0ADh
	retlw	0CAh
	retlw	0B9h
	retlw	0D3h
	retlw	0C3h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	global	_space
psect	strings
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	30
_space:
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	0
	global	_welcome
psect	strings
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	33
_welcome:
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	057h
	retlw	065h
	retlw	06Ch
	retlw	063h
	retlw	06Fh
	retlw	06Dh
	retlw	065h
	retlw	021h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	global	_huanyingshiyong
	global	_space
	global	_welcome
	global	_humd
	global	_pm
	global	_temp
	global	_PORTD
_PORTD	set	8
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_ADCON1
_ADCON1	set	159
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	file	"20180906004.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_humd:
       ds      2

_pm:
       ds      2

_temp:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	57
_pm25:
       ds      16

psect	dataBANK0
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	54
_shidu:
       ds      16

psect	dataBANK0
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	51
_wendu:
       ds      16

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+48)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
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
	global	?_port_init
?_port_init:	; 0 bytes @ 0x0
	global	??_port_init
??_port_init:	; 0 bytes @ 0x0
	global	?_lcd_enable
?_lcd_enable:	; 0 bytes @ 0x0
	global	?_lcd_writebyte
?_lcd_writebyte:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_scan
?_scan:	; 0 bytes @ 0x0
	global	?_temp_trans
?_temp_trans:	; 0 bytes @ 0x0
	global	?_humd_trans
?_humd_trans:	; 0 bytes @ 0x0
	global	?_pm_trans
?_pm_trans:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_trans_to_ASCII
?_trans_to_ASCII:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	delay@x
delay@x:	; 2 bytes @ 0x0
	global	trans_to_ASCII@num
trans_to_ASCII@num:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_trans_to_ASCII
??_trans_to_ASCII:	; 0 bytes @ 0x2
	global	delay@a
delay@a:	; 2 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	delay@b
delay@b:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	??_lcd_enable
??_lcd_enable:	; 0 bytes @ 0x6
	global	??_lcd_writebyte
??_lcd_writebyte:	; 0 bytes @ 0x6
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_scan
??_scan:	; 0 bytes @ 0x6
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x6
	global	lcd_writebyte@data
lcd_writebyte@data:	; 1 bytes @ 0x6
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_lcd_writedata
?_lcd_writedata:	; 0 bytes @ 0x7
	global	lcd_writedata@ptt
lcd_writedata@ptt:	; 2 bytes @ 0x7
	ds	1
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	??_lcd_writedata
??_lcd_writedata:	; 0 bytes @ 0x9
	global	lcd_writedata@i
lcd_writedata@i:	; 1 bytes @ 0x9
	ds	1
	global	??_lcd_display
??_lcd_display:	; 0 bytes @ 0xA
	global	??_temp_trans
??_temp_trans:	; 0 bytes @ 0xA
	global	??_humd_trans
??_humd_trans:	; 0 bytes @ 0xA
	global	??_pm_trans
??_pm_trans:	; 0 bytes @ 0xA
	global	??_main
??_main:	; 0 bytes @ 0xA
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xA
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_lcd_display
?_lcd_display:	; 0 bytes @ 0x0
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x0
	global	lcd_display@line
lcd_display@line:	; 2 bytes @ 0x0
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	lcd_display@word
lcd_display@word:	; 2 bytes @ 0x2
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x2
	ds	2
	global	temp_trans@one
temp_trans@one:	; 2 bytes @ 0x4
	global	humd_trans@one
humd_trans@one:	; 2 bytes @ 0x4
	global	pm_trans@one
pm_trans@one:	; 2 bytes @ 0x4
	ds	2
	global	temp_trans@hund
temp_trans@hund:	; 2 bytes @ 0x6
	global	humd_trans@ten
humd_trans@ten:	; 2 bytes @ 0x6
	global	pm_trans@ten
pm_trans@ten:	; 2 bytes @ 0x6
	ds	2
	global	temp_trans@ten
temp_trans@ten:	; 2 bytes @ 0x8
	global	humd_trans@hund
humd_trans@hund:	; 2 bytes @ 0x8
	global	pm_trans@hund
pm_trans@hund:	; 2 bytes @ 0x8
	ds	2
;;Data sizes: Strings 0, constant 48, data 48, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          13     10      10
;; BANK0           80     10      64
;; BANK1           80      0       0
;; BANK3           85      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; lcd_display@word	PTR unsigned char  size(2) Largest target is 16
;;		 -> welcome(CODE[16]), huanyingshiyong(CODE[16]), space(CODE[16]), pm25(BANK0[16]), 
;;		 -> shidu(BANK0[16]), wendu(BANK0[16]), 
;;
;; lcd_writedata@ptt	PTR const unsigned char  size(2) Largest target is 16
;;		 -> welcome(CODE[16]), huanyingshiyong(CODE[16]), space(CODE[16]), pm25(BANK0[16]), 
;;		 -> shidu(BANK0[16]), wendu(BANK0[16]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _lcd_display->_lcd_writedata
;;   _lcd_writedata->_lcd_writebyte
;;   _pm_trans->___awdiv
;;   _humd_trans->___awdiv
;;   _temp_trans->___awdiv
;;   _scan->_delay
;;   _lcd_writebyte->_delay
;;   _lcd_enable->_delay
;;   ___awdiv->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_temp_trans
;;   _main->_humd_trans
;;   _main->_pm_trans
;;   _pm_trans->___awdiv
;;   _humd_trans->___awdiv
;;   _temp_trans->___awdiv
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
;; (0) _main                                                 0     0      0    2357
;;                          _port_init
;;                           _lcd_init
;;                        _lcd_display
;;                              _delay
;;                               _scan
;;                         _temp_trans
;;                         _humd_trans
;;                           _pm_trans
;; ---------------------------------------------------------------------------------
;; (1) _lcd_display                                          4     0      4     384
;;                                              0 BANK0      4     0      4
;;                         _lcd_enable
;;                      _lcd_writedata
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     114
;;                         _lcd_enable
;; ---------------------------------------------------------------------------------
;; (2) _lcd_writedata                                        3     1      2     226
;;                                              7 COMMON     3     1      2
;;                      _lcd_writebyte
;; ---------------------------------------------------------------------------------
;; (1) _pm_trans                                             6     6      0     551
;;                                              4 BANK0      6     6      0
;;                            ___awdiv
;;                             ___wmul
;;                     _trans_to_ASCII
;; ---------------------------------------------------------------------------------
;; (1) _humd_trans                                           6     6      0     551
;;                                              4 BANK0      6     6      0
;;                            ___awdiv
;;                             ___wmul
;;                     _trans_to_ASCII
;; ---------------------------------------------------------------------------------
;; (1) _temp_trans                                           6     6      0     529
;;                                              4 BANK0      6     6      0
;;                            ___awdiv
;;                             ___wmul
;;                     _trans_to_ASCII
;; ---------------------------------------------------------------------------------
;; (1) _scan                                                 0     0      0     114
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _lcd_writebyte                                        1     1      0     136
;;                                              6 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _lcd_enable                                           0     0      0     114
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              8     4      4     300
;;                                              6 COMMON     4     0      4
;;                                              0 BANK0      4     4      0
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _trans_to_ASCII                                       2     0      2      22
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _port_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                6     4      2     114
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _port_init
;;   _lcd_init
;;     _lcd_enable
;;       _delay
;;   _lcd_display
;;     _lcd_enable
;;       _delay
;;     _lcd_writedata
;;       _lcd_writebyte
;;         _delay
;;   _delay
;;   _scan
;;     _delay
;;   _temp_trans
;;     ___awdiv
;;       ___wmul (ARG)
;;     ___wmul
;;     _trans_to_ASCII
;;   _humd_trans
;;     ___awdiv
;;       ___wmul (ARG)
;;     ___wmul
;;     _trans_to_ASCII
;;   _pm_trans
;;     ___awdiv
;;       ___wmul (ARG)
;;     ___wmul
;;     _trans_to_ASCII
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               55      0       0       9        0.0%
;;BITBANK3            55      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      4E      12        0.0%
;;ABS                  0      0      4A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      A      40       5       80.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               D      A       A       1       76.9%
;;BITCOMMON            D      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 252 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_port_init
;;		_lcd_init
;;		_lcd_display
;;		_delay
;;		_scan
;;		_temp_trans
;;		_humd_trans
;;		_pm_trans
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	252
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	253
	
l2689:	
;20180906004.c: 253: port_init();
	fcall	_port_init
	line	254
;20180906004.c: 254: lcd_init();
	fcall	_lcd_init
	line	255
	
l2691:	
;20180906004.c: 255: lcd_display(1,space);
	clrf	(?_lcd_display)
	incf	(?_lcd_display),f
	clrf	(?_lcd_display+1)
	movlw	low((_space-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	256
	
l2693:	
;20180906004.c: 256: lcd_display(2,huanyingshiyong);
	movlw	02h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_huanyingshiyong-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	257
	
l2695:	
;20180906004.c: 257: lcd_display(3,welcome);
	movlw	03h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_welcome-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	258
	
l2697:	
;20180906004.c: 258: lcd_display(4,space);
	movlw	04h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_space-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	259
;20180906004.c: 259: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	260
	
l2699:	
;20180906004.c: 260: lcd_display(2,space);
	movlw	02h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_space-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	261
	
l2701:	
;20180906004.c: 261: lcd_display(3,space);
	movlw	03h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_space-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	264
	
l2703:	
# 264 "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
clrwdt ;#
psect	maintext
	line	265
	
l2705:	
;20180906004.c: 265: lcd_display(1,wendu);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_lcd_display)
	incf	(?_lcd_display),f
	clrf	(?_lcd_display+1)
	movlw	(_wendu&0ffh)
	movwf	(0+?_lcd_display+02h)
	movlw	(0x0/2)
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	266
	
l2707:	
;20180906004.c: 266: lcd_display(2,shidu);
	movlw	02h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	(_shidu&0ffh)
	movwf	(0+?_lcd_display+02h)
	movlw	(0x0/2)
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	267
	
l2709:	
;20180906004.c: 267: lcd_display(3,pm25);
	movlw	03h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	(_pm25&0ffh)
	movwf	(0+?_lcd_display+02h)
	movlw	(0x0/2)
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	268
	
l2711:	
;20180906004.c: 268: lcd_display(4,space);
	movlw	04h
	movwf	(?_lcd_display)
	clrf	(?_lcd_display+1)
	movlw	low((_space-__stringbase))
	movwf	(0+?_lcd_display+02h)
	movlw	80h
	movwf	(1+?_lcd_display+02h)
	fcall	_lcd_display
	line	269
;20180906004.c: 269: scan();
	fcall	_scan
	line	270
	
l2713:	
;20180906004.c: 270: temp_trans();
	fcall	_temp_trans
	line	271
	
l2715:	
;20180906004.c: 271: humd_trans();
	fcall	_humd_trans
	line	272
	
l2717:	
;20180906004.c: 272: pm_trans();
	fcall	_pm_trans
	goto	l2703
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	274
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_display
psect	text225,local,class=CODE,delta=2
global __ptext225
__ptext225:

;; *************** function _lcd_display *****************
;; Defined at:
;;		line 120 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;  line            2    0[BANK0 ] unsigned int 
;;  word            2    2[BANK0 ] PTR unsigned char 
;;		 -> welcome(16), huanyingshiyong(16), space(16), pm25(16), 
;;		 -> shidu(16), wendu(16), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_enable
;;		_lcd_writedata
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text225
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	120
	global	__size_of_lcd_display
	__size_of_lcd_display	equ	__end_of_lcd_display-_lcd_display
	
_lcd_display:	
	opt	stack 4
; Regs used in _lcd_display: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	121
	
l2671:	
;20180906004.c: 121: switch(line)
	goto	l2681
	line	123
	
l2673:	
	movlw	(080h)
	movwf	(8)	;volatile
	line	124
;20180906004.c: 124: break;
	goto	l2683
	line	125
	
l2675:	
	movlw	(090h)
	movwf	(8)	;volatile
	line	126
;20180906004.c: 126: break;
	goto	l2683
	line	127
	
l2677:	
	movlw	(088h)
	movwf	(8)	;volatile
	line	128
;20180906004.c: 128: break;
	goto	l2683
	line	129
	
l2679:	
	movlw	(098h)
	movwf	(8)	;volatile
	line	130
;20180906004.c: 130: }
	goto	l2683
	line	121
	
l2681:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (lcd_display@line+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2739
	goto	l2683
	opt asmopt_on
	
l2739:	
; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           23    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (lcd_display@line),w
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2673
	xorlw	2^1	; case 2
	skipnz
	goto	l2675
	xorlw	3^2	; case 3
	skipnz
	goto	l2677
	xorlw	4^3	; case 4
	skipnz
	goto	l2679
	goto	l2683
	opt asmopt_on

	line	131
	
l2683:	
;20180906004.c: 131: lcd_enable();
	fcall	_lcd_enable
	line	132
	
l2685:	
;20180906004.c: 132: lcd_writedata(word);
	movf	(lcd_display@word+1),w
	movwf	(?_lcd_writedata+1)
	movf	(lcd_display@word),w
	movwf	(?_lcd_writedata)
	fcall	_lcd_writedata
	line	133
	
l746:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_display
	__end_of_lcd_display:
;; =============== function _lcd_display ends ============

	signat	_lcd_display,8312
	global	_lcd_init
psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 107 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_enable
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text226
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	107
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	108
	
l2659:	
;20180906004.c: 108: PORTD=0X01;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(8)	;volatile
	line	109
	
l2661:	
;20180906004.c: 109: lcd_enable();
	fcall	_lcd_enable
	line	110
	
l2663:	
;20180906004.c: 110: PORTD=0X38;
	movlw	(038h)
	movwf	(8)	;volatile
	line	111
;20180906004.c: 111: lcd_enable();
	fcall	_lcd_enable
	line	112
	
l2665:	
;20180906004.c: 112: PORTD=0X0e;
	movlw	(0Eh)
	movwf	(8)	;volatile
	line	113
	
l2667:	
;20180906004.c: 113: lcd_enable();
	fcall	_lcd_enable
	line	114
;20180906004.c: 114: PORTD=0X06;
	movlw	(06h)
	movwf	(8)	;volatile
	line	115
	
l2669:	
;20180906004.c: 115: lcd_enable();
	fcall	_lcd_enable
	line	116
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_writedata
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:

;; *************** function _lcd_writedata *****************
;; Defined at:
;;		line 89 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;  ptt             2    7[COMMON] PTR const unsigned char 
;;		 -> welcome(16), huanyingshiyong(16), space(16), pm25(16), 
;;		 -> shidu(16), wendu(16), 
;; Auto vars:     Size  Location     Type
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_writebyte
;; This function is called by:
;;		_lcd_display
;; This function uses a non-reentrant model
;;
psect	text227
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	89
	global	__size_of_lcd_writedata
	__size_of_lcd_writedata	equ	__end_of_lcd_writedata-_lcd_writedata
	
_lcd_writedata:	
	opt	stack 4
; Regs used in _lcd_writedata: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	91
	
l2647:	
;20180906004.c: 90: unsigned char i;
;20180906004.c: 91: for(i=0;i<16;i++)
	clrf	(lcd_writedata@i)
	line	93
	
l2653:	
;20180906004.c: 92: {
;20180906004.c: 93: lcd_writebyte(ptt[i]);
	movf	(lcd_writedata@i),w
	addwf	(lcd_writedata@ptt),w
	movwf	fsr0
	movf	(lcd_writedata@ptt+1),w
	skipnc
	incf	(lcd_writedata@ptt+1),w
	movwf	btemp+1
	fcall	stringtab
	fcall	_lcd_writebyte
	line	91
	
l2655:	
	incf	(lcd_writedata@i),f
	
l2657:	
	movlw	(010h)
	subwf	(lcd_writedata@i),w
	skipc
	goto	u541
	goto	u540
u541:
	goto	l2653
u540:
	line	95
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_writedata
	__end_of_lcd_writedata:
;; =============== function _lcd_writedata ends ============

	signat	_lcd_writedata,4216
	global	_pm_trans
psect	text228,local,class=CODE,delta=2
global __ptext228
__ptext228:

;; *************** function _pm_trans *****************
;; Defined at:
;;		line 239 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  hund            2    8[BANK0 ] int 
;;  ten             2    6[BANK0 ] int 
;;  one             2    4[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___wmul
;;		_trans_to_ASCII
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text228
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	239
	global	__size_of_pm_trans
	__size_of_pm_trans	equ	__end_of_pm_trans-_pm_trans
	
_pm_trans:	
	opt	stack 6
; Regs used in _pm_trans: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	241
	
l2637:	
;20180906004.c: 240: int hund,ten,one;
;20180906004.c: 241: hund=pm/100;
	movlw	064h
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_pm+1),w
	movwf	1+(?___awdiv)+02h
	movf	(_pm),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(pm_trans@hund+1)
	movf	(0+(?___awdiv)),w
	movwf	(pm_trans@hund)
	line	242
;20180906004.c: 242: ten=(pm-(hund*100))/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(pm_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(pm_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(_pm),w
	addwf	(0+(?___wmul)),w
	movwf	0+(?___awdiv)+02h
	movf	(_pm+1),w
	skipnc
	incf	(_pm+1),w
	addwf	(1+(?___wmul)),w
	movwf	1+0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(pm_trans@ten+1)
	movf	(0+(?___awdiv)),w
	movwf	(pm_trans@ten)
	line	243
;20180906004.c: 243: one=pm-(hund*100)-(ten*10);
	movf	(pm_trans@ten+1),w
	movwf	(?___wmul+1)
	movf	(pm_trans@ten),w
	movwf	(?___wmul)
	movlw	low(-10)
	movwf	0+(?___wmul)+02h
	movlw	high(-10)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(pm_trans@one+1)
	movf	(0+(?___wmul)),w
	movwf	(pm_trans@one)
	movf	(pm_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(pm_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addwf	(pm_trans@one),f
	skipnc
	incf	(pm_trans@one+1),f
	movf	(1+(?___wmul)),w
	addwf	(pm_trans@one+1),f
	
l2639:	
	movf	(_pm),w
	addwf	(pm_trans@one),f
	skipnc
	incf	(pm_trans@one+1),f
	movf	(_pm+1),w
	addwf	(pm_trans@one+1),f
	line	244
	
l2641:	
;20180906004.c: 244: pm25[7]=trans_to_ASCII(hund);
	movf	(pm_trans@hund+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(pm_trans@hund),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_pm25)+07h
	line	245
	
l2643:	
;20180906004.c: 245: pm25[8]=trans_to_ASCII(ten);
	movf	(pm_trans@ten+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(pm_trans@ten),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_pm25)+08h
	line	246
	
l2645:	
;20180906004.c: 246: pm25[9]=trans_to_ASCII(one);
	movf	(pm_trans@one+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(pm_trans@one),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_pm25)+09h
	line	247
	
l794:	
	return
	opt stack 0
GLOBAL	__end_of_pm_trans
	__end_of_pm_trans:
;; =============== function _pm_trans ends ============

	signat	_pm_trans,88
	global	_humd_trans
psect	text229,local,class=CODE,delta=2
global __ptext229
__ptext229:

;; *************** function _humd_trans *****************
;; Defined at:
;;		line 228 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  hund            2    8[BANK0 ] int 
;;  ten             2    6[BANK0 ] int 
;;  one             2    4[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___wmul
;;		_trans_to_ASCII
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text229
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	228
	global	__size_of_humd_trans
	__size_of_humd_trans	equ	__end_of_humd_trans-_humd_trans
	
_humd_trans:	
	opt	stack 6
; Regs used in _humd_trans: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	230
	
l2627:	
;20180906004.c: 229: int hund,ten,one;
;20180906004.c: 230: hund=humd/100;
	movlw	064h
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_humd+1),w
	movwf	1+(?___awdiv)+02h
	movf	(_humd),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(humd_trans@hund+1)
	movf	(0+(?___awdiv)),w
	movwf	(humd_trans@hund)
	line	231
;20180906004.c: 231: ten=(humd-(hund*100))/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(humd_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(humd_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(_humd),w
	addwf	(0+(?___wmul)),w
	movwf	0+(?___awdiv)+02h
	movf	(_humd+1),w
	skipnc
	incf	(_humd+1),w
	addwf	(1+(?___wmul)),w
	movwf	1+0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(humd_trans@ten+1)
	movf	(0+(?___awdiv)),w
	movwf	(humd_trans@ten)
	line	232
;20180906004.c: 232: one=humd-(hund*100)-(ten*10);
	movf	(humd_trans@ten+1),w
	movwf	(?___wmul+1)
	movf	(humd_trans@ten),w
	movwf	(?___wmul)
	movlw	low(-10)
	movwf	0+(?___wmul)+02h
	movlw	high(-10)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(humd_trans@one+1)
	movf	(0+(?___wmul)),w
	movwf	(humd_trans@one)
	movf	(humd_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(humd_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addwf	(humd_trans@one),f
	skipnc
	incf	(humd_trans@one+1),f
	movf	(1+(?___wmul)),w
	addwf	(humd_trans@one+1),f
	
l2629:	
	movf	(_humd),w
	addwf	(humd_trans@one),f
	skipnc
	incf	(humd_trans@one+1),f
	movf	(_humd+1),w
	addwf	(humd_trans@one+1),f
	line	233
	
l2631:	
;20180906004.c: 233: shidu[6]=trans_to_ASCII(hund);
	movf	(humd_trans@hund+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(humd_trans@hund),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_shidu)+06h
	line	234
	
l2633:	
;20180906004.c: 234: shidu[7]=trans_to_ASCII(ten);
	movf	(humd_trans@ten+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(humd_trans@ten),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_shidu)+07h
	line	235
	
l2635:	
;20180906004.c: 235: shidu[8]=trans_to_ASCII(one);
	movf	(humd_trans@one+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(humd_trans@one),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_shidu)+08h
	line	236
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_humd_trans
	__end_of_humd_trans:
;; =============== function _humd_trans ends ============

	signat	_humd_trans,88
	global	_temp_trans
psect	text230,local,class=CODE,delta=2
global __ptext230
__ptext230:

;; *************** function _temp_trans *****************
;; Defined at:
;;		line 217 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ten             2    8[BANK0 ] int 
;;  hund            2    6[BANK0 ] int 
;;  one             2    4[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;;		___wmul
;;		_trans_to_ASCII
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text230
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	217
	global	__size_of_temp_trans
	__size_of_temp_trans	equ	__end_of_temp_trans-_temp_trans
	
_temp_trans:	
	opt	stack 6
; Regs used in _temp_trans: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	219
	
l2619:	
;20180906004.c: 218: int hund,ten,one;
;20180906004.c: 219: hund=temp/100;
	movlw	064h
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_temp+1),w
	movwf	1+(?___awdiv)+02h
	movf	(_temp),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(temp_trans@hund+1)
	movf	(0+(?___awdiv)),w
	movwf	(temp_trans@hund)
	line	220
;20180906004.c: 220: ten=(temp-(hund*100))/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(temp_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(temp_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(_temp),w
	addwf	(0+(?___wmul)),w
	movwf	0+(?___awdiv)+02h
	movf	(_temp+1),w
	skipnc
	incf	(_temp+1),w
	addwf	(1+(?___wmul)),w
	movwf	1+0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(temp_trans@ten+1)
	movf	(0+(?___awdiv)),w
	movwf	(temp_trans@ten)
	line	221
;20180906004.c: 221: one=temp-(hund*100)-(ten*10);
	movf	(temp_trans@ten+1),w
	movwf	(?___wmul+1)
	movf	(temp_trans@ten),w
	movwf	(?___wmul)
	movlw	low(-10)
	movwf	0+(?___wmul)+02h
	movlw	high(-10)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(temp_trans@one+1)
	movf	(0+(?___wmul)),w
	movwf	(temp_trans@one)
	movf	(temp_trans@hund+1),w
	movwf	(?___wmul+1)
	movf	(temp_trans@hund),w
	movwf	(?___wmul)
	movlw	low(-100)
	movwf	0+(?___wmul)+02h
	movlw	high(-100)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(0+(?___wmul)),w
	addwf	(temp_trans@one),f
	skipnc
	incf	(temp_trans@one+1),f
	movf	(1+(?___wmul)),w
	addwf	(temp_trans@one+1),f
	
l2621:	
	movf	(_temp),w
	addwf	(temp_trans@one),f
	skipnc
	incf	(temp_trans@one+1),f
	movf	(_temp+1),w
	addwf	(temp_trans@one+1),f
	line	223
	
l2623:	
;20180906004.c: 223: wendu[6]=trans_to_ASCII(ten);
	movf	(temp_trans@ten+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(temp_trans@ten),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_wendu)+06h
	line	224
	
l2625:	
;20180906004.c: 224: wendu[7]=trans_to_ASCII(one);
	movf	(temp_trans@one+1),w
	movwf	(?_trans_to_ASCII+1)
	movf	(temp_trans@one),w
	movwf	(?_trans_to_ASCII)
	fcall	_trans_to_ASCII
	movwf	0+(_wendu)+07h
	line	225
	
l788:	
	return
	opt stack 0
GLOBAL	__end_of_temp_trans
	__end_of_temp_trans:
;; =============== function _temp_trans ends ============

	signat	_temp_trans,88
	global	_scan
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:

;; *************** function _scan *****************
;; Defined at:
;;		line 136 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text231
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	136
	global	__size_of_scan
	__size_of_scan	equ	__end_of_scan-_scan
	
_scan:	
	opt	stack 6
; Regs used in _scan: [wreg+status,2+status,0+pclath+cstack]
	line	137
	
l2581:	
;20180906004.c: 137: if(RB0==1)
	btfss	(48/8),(48)&7
	goto	u391
	goto	u390
u391:
	goto	l749
u390:
	line	139
	
l2583:	
;20180906004.c: 138: {
;20180906004.c: 139: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	140
	
l2585:	
;20180906004.c: 140: if(RB0==1)
	btfss	(48/8),(48)&7
	goto	u401
	goto	u400
u401:
	goto	l749
u400:
	line	142
	
l2587:	
;20180906004.c: 141: {
;20180906004.c: 142: temp++;
	incf	(_temp),f
	skipnz
	incf	(_temp+1),f
	line	143
;20180906004.c: 143: while(RB0!=0)
	goto	l751
	
l752:	
	line	145
;20180906004.c: 144: {
;20180906004.c: 145: if(RB0==0)
	btfsc	(48/8),(48)&7
	goto	u411
	goto	u410
u411:
	goto	l751
u410:
	line	147
	
l2589:	
;20180906004.c: 146: {
;20180906004.c: 147: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	148
	
l2591:	
;20180906004.c: 148: if(RB0==0)
	btfsc	(48/8),(48)&7
	goto	u421
	goto	u420
u421:
	goto	l751
u420:
	goto	l749
	line	151
	
l751:	
	line	143
	btfsc	(48/8),(48)&7
	goto	u431
	goto	u430
u431:
	goto	l752
u430:
	line	153
	
l749:	
	line	154
;20180906004.c: 150: }
;20180906004.c: 151: }
;20180906004.c: 152: }
;20180906004.c: 153: }
;20180906004.c: 154: if(RB1==1)
	btfss	(49/8),(49)&7
	goto	u441
	goto	u440
u441:
	goto	l756
u440:
	line	156
	
l2595:	
;20180906004.c: 155: {
;20180906004.c: 156: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	157
	
l2597:	
;20180906004.c: 157: if(RB1==1)
	btfss	(49/8),(49)&7
	goto	u451
	goto	u450
u451:
	goto	l756
u450:
	line	159
	
l2599:	
;20180906004.c: 158: {
;20180906004.c: 159: humd++;
	incf	(_humd),f
	skipnz
	incf	(_humd+1),f
	line	160
;20180906004.c: 160: while(RB1!=0)
	goto	l758
	
l759:	
	line	162
;20180906004.c: 161: {
;20180906004.c: 162: if(RB1==0)
	btfsc	(49/8),(49)&7
	goto	u461
	goto	u460
u461:
	goto	l758
u460:
	line	164
	
l2601:	
;20180906004.c: 163: {
;20180906004.c: 164: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	165
	
l2603:	
;20180906004.c: 165: if(RB1==0)
	btfsc	(49/8),(49)&7
	goto	u471
	goto	u470
u471:
	goto	l758
u470:
	goto	l756
	line	168
	
l758:	
	line	160
	btfsc	(49/8),(49)&7
	goto	u481
	goto	u480
u481:
	goto	l759
u480:
	line	170
	
l756:	
	line	171
;20180906004.c: 167: }
;20180906004.c: 168: }
;20180906004.c: 169: }
;20180906004.c: 170: }
;20180906004.c: 171: if(RB2==1)
	btfss	(50/8),(50)&7
	goto	u491
	goto	u490
u491:
	goto	l770
u490:
	line	173
	
l2607:	
;20180906004.c: 172: {
;20180906004.c: 173: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	174
	
l2609:	
;20180906004.c: 174: if(RB2==1)
	btfss	(50/8),(50)&7
	goto	u501
	goto	u500
u501:
	goto	l770
u500:
	line	176
	
l2611:	
;20180906004.c: 175: {
;20180906004.c: 176: pm++;
	incf	(_pm),f
	skipnz
	incf	(_pm+1),f
	line	177
;20180906004.c: 177: while(RB2!=0)
	goto	l765
	
l766:	
	line	179
;20180906004.c: 178: {
;20180906004.c: 179: if(RB2==0)
	btfsc	(50/8),(50)&7
	goto	u511
	goto	u510
u511:
	goto	l765
u510:
	line	181
	
l2613:	
;20180906004.c: 180: {
;20180906004.c: 181: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	182
	
l2615:	
;20180906004.c: 182: if(RB2==0)
	btfsc	(50/8),(50)&7
	goto	u521
	goto	u520
u521:
	goto	l765
u520:
	goto	l770
	line	185
	
l765:	
	line	177
	btfsc	(50/8),(50)&7
	goto	u531
	goto	u530
u531:
	goto	l766
u530:
	line	188
	
l770:	
	return
	opt stack 0
GLOBAL	__end_of_scan
	__end_of_scan:
;; =============== function _scan ends ============

	signat	_scan,88
	global	_lcd_writebyte
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:

;; *************** function _lcd_writebyte *****************
;; Defined at:
;;		line 79 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
;;		_lcd_writedata
;; This function uses a non-reentrant model
;;
psect	text232
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	79
	global	__size_of_lcd_writebyte
	__size_of_lcd_writebyte	equ	__end_of_lcd_writebyte-_lcd_writebyte
	
_lcd_writebyte:	
	opt	stack 4
; Regs used in _lcd_writebyte: [wreg+status,2+status,0+pclath+cstack]
;lcd_writebyte@data stored from wreg
	movwf	(lcd_writebyte@data)
	line	80
	
l2569:	
;20180906004.c: 80: PORTD = data;
	movf	(lcd_writebyte@data),w
	movwf	(8)	;volatile
	line	81
	
l2571:	
;20180906004.c: 81: RA1=1;
	bsf	(41/8),(41)&7
	line	82
	
l2573:	
;20180906004.c: 82: RA2=0;
	bcf	(42/8),(42)&7
	line	83
	
l2575:	
;20180906004.c: 83: RA3=0;
	bcf	(43/8),(43)&7
	line	84
	
l2577:	
;20180906004.c: 84: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	85
	
l2579:	
;20180906004.c: 85: RA3=1;
	bsf	(43/8),(43)&7
	line	86
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_writebyte
	__end_of_lcd_writebyte:
;; =============== function _lcd_writebyte ends ============

	signat	_lcd_writebyte,4216
	global	_lcd_enable
psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:

;; *************** function _lcd_enable *****************
;; Defined at:
;;		line 70 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_lcd_init
;;		_lcd_display
;; This function uses a non-reentrant model
;;
psect	text233
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	70
	global	__size_of_lcd_enable
	__size_of_lcd_enable	equ	__end_of_lcd_enable-_lcd_enable
	
_lcd_enable:	
	opt	stack 5
; Regs used in _lcd_enable: [wreg+status,2+status,0+pclath+cstack]
	line	71
	
l2563:	
;20180906004.c: 71: RA1=0;
	bcf	(41/8),(41)&7
	line	72
;20180906004.c: 72: RA2=0;
	bcf	(42/8),(42)&7
	line	73
;20180906004.c: 73: RA3=0;
	bcf	(43/8),(43)&7
	line	74
	
l2565:	
;20180906004.c: 74: delay(10);
	movlw	0Ah
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	75
	
l2567:	
;20180906004.c: 75: RA3=1;
	bsf	(43/8),(43)&7
	line	76
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_enable
	__end_of_lcd_enable:
;; =============== function _lcd_enable ends ============

	signat	_lcd_enable,88
	global	___awdiv
psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] int 
;;  dividend        2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    2[BANK0 ] int 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       4       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_trans
;;		_humd_trans
;;		_pm_trans
;; This function uses a non-reentrant model
;;
psect	text234
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2519:	
	clrf	(___awdiv@sign)
	line	10
	
l2521:	
	btfss	(___awdiv@divisor+1),7
	goto	u321
	goto	u320
u321:
	goto	l2527
u320:
	line	11
	
l2523:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l2525:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l2527:	
	btfss	(___awdiv@dividend+1),7
	goto	u331
	goto	u330
u331:
	goto	l2533
u330:
	line	15
	
l2529:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2531:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l2533:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2535:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u341
	goto	u340
u341:
	goto	l2555
u340:
	line	20
	
l2537:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l2541
	line	22
	
l2539:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l2541:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u351
	goto	u350
u351:
	goto	l2539
u350:
	line	26
	
l2543:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l2545:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u365
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u365:
	skipc
	goto	u361
	goto	u360
u361:
	goto	l2551
u360:
	line	28
	
l2547:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2549:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l2551:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l2553:	
	decfsz	(___awdiv@counter),f
	goto	u371
	goto	u370
u371:
	goto	l2543
u370:
	line	34
	
l2555:	
	movf	(___awdiv@sign),w
	skipz
	goto	u380
	goto	l2559
u380:
	line	35
	
l2557:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l2559:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___wmul
psect	text235,local,class=CODE,delta=2
global __ptext235
__ptext235:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_trans
;;		_humd_trans
;;		_pm_trans
;; This function uses a non-reentrant model
;;
psect	text235
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2503:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l2505:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u301
	goto	u300
u301:
	goto	l2509
u300:
	line	8
	
l2507:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l2509:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l2511:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l2513:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u311
	goto	u310
u311:
	goto	l2505
u310:
	line	12
	
l2515:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l1486:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_trans_to_ASCII
psect	text236,local,class=CODE,delta=2
global __ptext236
__ptext236:

;; *************** function _trans_to_ASCII *****************
;; Defined at:
;;		line 191 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;  num             2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_trans
;;		_humd_trans
;;		_pm_trans
;; This function uses a non-reentrant model
;;
psect	text236
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	191
	global	__size_of_trans_to_ASCII
	__size_of_trans_to_ASCII	equ	__end_of_trans_to_ASCII-_trans_to_ASCII
	
_trans_to_ASCII:	
	opt	stack 6
; Regs used in _trans_to_ASCII: [wreg-fsr0h+status,2+status,0]
	line	192
	
l2437:	
;20180906004.c: 192: switch(num)
	goto	l2499
	line	194
	
l2439:	
	movlw	(030h)
	goto	l775
	line	196
	
l2445:	
	movlw	(031h)
	goto	l775
	line	198
	
l2451:	
	movlw	(032h)
	goto	l775
	line	200
	
l2457:	
	movlw	(033h)
	goto	l775
	line	202
	
l2463:	
	movlw	(034h)
	goto	l775
	line	204
	
l2469:	
	movlw	(035h)
	goto	l775
	line	206
	
l2475:	
	movlw	(036h)
	goto	l775
	line	208
	
l2481:	
	movlw	(037h)
	goto	l775
	line	210
	
l2487:	
	movlw	(038h)
	goto	l775
	line	212
	
l2493:	
	movlw	(039h)
	goto	l775
	line	192
	
l2499:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (trans_to_ASCII@num+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2741
	goto	l775
	opt asmopt_on
	
l2741:	
; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           31    16 (average)
; direct_byte           38     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is simple_byte

	movf (trans_to_ASCII@num),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2439
	xorlw	1^0	; case 1
	skipnz
	goto	l2445
	xorlw	2^1	; case 2
	skipnz
	goto	l2451
	xorlw	3^2	; case 3
	skipnz
	goto	l2457
	xorlw	4^3	; case 4
	skipnz
	goto	l2463
	xorlw	5^4	; case 5
	skipnz
	goto	l2469
	xorlw	6^5	; case 6
	skipnz
	goto	l2475
	xorlw	7^6	; case 7
	skipnz
	goto	l2481
	xorlw	8^7	; case 8
	skipnz
	goto	l2487
	xorlw	9^8	; case 9
	skipnz
	goto	l2493
	goto	l775
	opt asmopt_on

	line	214
	
l775:	
	return
	opt stack 0
GLOBAL	__end_of_trans_to_ASCII
	__end_of_trans_to_ASCII:
;; =============== function _trans_to_ASCII ends ============

	signat	_trans_to_ASCII,4217
	global	_port_init
psect	text237,local,class=CODE,delta=2
global __ptext237
__ptext237:

;; *************** function _port_init *****************
;; Defined at:
;;		line 61 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text237
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	61
	global	__size_of_port_init
	__size_of_port_init	equ	__end_of_port_init-_port_init
	
_port_init:	
	opt	stack 7
; Regs used in _port_init: [wreg+status,2]
	line	62
	
l2077:	
;20180906004.c: 62: ADCON1=0X07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	63
	
l2079:	
;20180906004.c: 63: TRISA=0X00;
	clrf	(133)^080h	;volatile
	line	64
	
l2081:	
;20180906004.c: 64: TRISD=0X00;
	clrf	(136)^080h	;volatile
	line	65
;20180906004.c: 65: TRISB=0xFF;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	66
;20180906004.c: 66: OPTION_REG=0X8F;
	movlw	(08Fh)
	movwf	(129)^080h	;volatile
	line	67
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_port_init
	__end_of_port_init:
;; =============== function _port_init ends ============

	signat	_port_init,88
	global	_delay
psect	text238,local,class=CODE,delta=2
global __ptext238
__ptext238:

;; *************** function _delay *****************
;; Defined at:
;;		line 16 in file "C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
;;		_lcd_enable
;;		_lcd_writebyte
;;		_scan
;;		_main
;; This function uses a non-reentrant model
;;
psect	text238
	file	"C:\myFiles\CircuitExperiment\20180906004\20180906004.c"
	line	16
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg+status,2+status,0]
	line	18
	
l2417:	
;20180906004.c: 17: unsigned int a,b;
;20180906004.c: 18: for(a=x;a>0;a--)
	movf	(delay@x+1),w
	movwf	(delay@a+1)
	movf	(delay@x),w
	movwf	(delay@a)
	
l2419:	
	movf	((delay@a+1)),w
	iorwf	((delay@a)),w
	skipz
	goto	u281
	goto	u280
u281:
	goto	l2423
u280:
	goto	l715
	line	19
	
l2423:	
;20180906004.c: 19: for(b=110;b>0;b--);
	movlw	06Eh
	movwf	(delay@b)
	clrf	(delay@b+1)
	
l2429:	
	movlw	low(01h)
	subwf	(delay@b),f
	movlw	high(01h)
	skipc
	decf	(delay@b+1),f
	subwf	(delay@b+1),f
	
l2431:	
	movf	((delay@b+1)),w
	iorwf	((delay@b)),w
	skipz
	goto	u291
	goto	u290
u291:
	goto	l2429
u290:
	line	18
	
l2433:	
	movlw	low(01h)
	subwf	(delay@a),f
	movlw	high(01h)
	skipc
	decf	(delay@a+1),f
	subwf	(delay@a+1),f
	goto	l2419
	line	20
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text239,local,class=CODE,delta=2
global __ptext239
__ptext239:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
