tmr0			equ		0x01				;TMR0
pcl				equ		0x02	
status			equ		0x03				;״̬�Ĵ���
option_reg 		equ		0x81				;ѡ��Ĵ���
intcon			equ		0x0b				;�жϿ��ƼĴ���
rp0				equ		0x05				;״̬�Ĵ����е�ҳѡλRP0
porta			equ		0x05				;ʪ�ȴ�����-RA0
trisa			equ		0x85
portb			equ		0x06				;2LCD������-RB0-RB7
trisb			equ		0x86
portc			equ		0x07				;�¶ȴ�����-RC0
trisc			equ		0x87		
portd			equ		0x08				;RS-RD0 RW-RD1 E-RD2
trisd			equ 	0x88	
porte			equ		0x09				
trise			equ		0x89
adcon0			equ		0x1f
adcon1			equ		0x9f	
intcon			equ		0x0b
adresh			equ		0x1e
adresl			equ		0x9e
t0if			equ		0x02
pir1			equ		0x0c
go				equ		0x02
adif			equ		0x06
c				equ		0x00


var_delay1		equ		0x20				;��ʱ����1
var_delay2		equ		0x21				;��ʱ����2

var_temp_hund	equ		0x2c				;�������¶ȵİ�λBCD��
var_temp_ten	equ		0x22				;�������¶�ֵ��ʮλBCD��
var_temp_one	equ		0x23				;�������¶ȵĸ�λBCD��
var_temp_p		equ		0x24				;�������¶ȵ�ʮ��λBCD��
var_temp_hs		equ		0x25				;�Ӵ��������յ��¶ȵĸ��ֽ�
var_temp_ls		equ		0x26				;�Ӵ��������յ��¶ȵĵ��ֽ�
var_temp		equ		0x27				;�Ӵ��������յ��¶ȵ���������

hund			equ		0x28				;�ڶ�����תBCD�Ĺ����е��м����
ten				equ		0x29
one				equ		0x2a
num				equ		0x2b
point			equ		0x2e



var_ds_bit		equ		0x34				;���¶ȴ��������յ�1bit����
var_ds_write	equ		0x30				;׼��д���¶ȴ�����������
var_ds_i		equ		0x31				;����
var_ds_read		equ		0x32				;���¶ȴ��������յ�1byte����


var_humd_hund	equ		0x41
var_humd_ten	equ		0x42
var_humd_one	equ		0x43
var_humd_p		equ		0x46
var_humd		equ		0x44
var_humd_get	equ		0x47
var_humd_get2	equ		0x45

var_us			equ		0x33				;����΢�뼶��ʱ�ı���
var_us2			equ		0x50				;����΢�뼶��ʱ�ı���

var_display		equ		0x35
var_display_i	equ		0x36

#define CHAR_SPACE     0x20

#define NUM_ZERO    	0x30
#define NUM_ONE     	0x31
#define NUM_TWO     	0x32
#define NUM_THREE   	0x33
#define NUM_FOUR    	0x34
#define NUM_FIVE    	0x35
#define NUM_SIX     	0x36
#define NUM_SEVEN   	0x37
#define NUM_EIGHT   	0x38
#define NUM_NINE    	0x39

#define NOTE_COLON  	0x3A        		;ð��
#define NOTE_PERIOD 	0x2E       			;���
#define NOTE_EX     	0x21        		;��̾��
#define NOTE_PER		0x25				;�ٷֺ�

#define CAP_C       	0x43
#define CAP_E       	0x45
#define CAP_L       	0x4C
#define CAP_M       	0x4D
#define CAP_O       	0x4F
#define CAP_W       	0x57

const_line1		equ		0x80				;LCD���е�ַ
const_line2		equ		0x90
const_line3		equ		0x88
const_line4		equ		0x98

PCLATH			equ		0x0a

				org		0000h
main	
				nop
;******************************************�˿������������
				movlw	0x41
				movwf	adcon0				;ADCON0����7,6λѡ��ʱ��Ƶ�ʣ���5-3λѡ��ת��ͨ������2λת��״̬��־����0λת��������
											;01000001��ʱ��Ƶ��f/8��ͨ��RA0��ת������
				bsf	 	status,rp0 			;�����ļ��Ĵ�������1
				movlw	0xff
				movwf	trisa				;�˿�RA0 ����
				movlw	0x00			
				movwf	trisb				;�˿�B ���		
				movlw  	0x00
				movwf	trisc
				movlw	0x00
				movwf 	trisd				;�˿�D ���
				movlw	0x85		
				movwf	adcon1				;ADCON1,����λѡ��ADC�������루0���Ҷ��루1��������λȷ��ģ��ںͲο���ѹ
											;10000101���Ҷ��룬RA3ΪVref��RA0ΪA��
				;movlw	0x01
				movlw	0x87
				movwf	option_reg			;��Ƶ����Ϊ"1:256"
				bcf	 	status,rp0			;�ָ����ļ��Ĵ�������0
			
;********************************************LCD��ʼ��
				movlw	0x00
				movwf	portd				;ָ�����
					
				movlw	0x01				;�����ʾ
				call	lcd_display

				movlw	0x38				;8λ2��5*7����
				call	lcd_display

				movlw	0x06				;���ֲ������������
				call	lcd_display

				movlw	0x0c					
				call	lcd_display
				
				movlw	0x01
				call	lcd_display

;********************************************LCD��ʾ���ݻ�ӭ����
				call	lcd_enable			;ѡ��
				movlw	const_line2
				call	lcd_display

				movlw	0x01				;�������ģʽ
				movwf	portd

				call	four_space

				movlw	0xbb			;��
				call	lcd_display
				
				movlw	0xb6
				call	lcd_display

				movlw	0xd3			;ӭ
				call	lcd_display

				movlw	0xad			
				call	lcd_display

				movlw	0xca			;ʹ
				call	lcd_display

				movlw	0xb9			
				call	lcd_display

				movlw	0xd3			;��
				call	lcd_display

				movlw	0xc3
				call	lcd_display

				call	lcd_enable		;ѡ��
				movlw	const_line3
				call	lcd_display

				movlw	0x01			;�������ģʽ
				movwf	portd

				call	four_space

				movlw	CAP_W
				call	lcd_display

				movlw	CAP_E
				call	lcd_display

				movlw	CAP_L
				call	lcd_display

				movlw	CAP_C
				call	lcd_display

				movlw	CAP_O
				call	lcd_display

				movlw	CAP_M
				call	lcd_display

				movlw	CAP_E
				call	lcd_display

				movlw	NOTE_EX
				call	lcd_display

				call	delay1000
				call	delay1000
				call	delay1000

				call	delay
				call	lcd_enable		
				movlw	0x01			;�����ʾ
				call	lcd_display

				movlw	0x04
				movwf	var_display

;**************************************�¶ȼ�������ݴ���

start			
				clrf	portc
				call	get_temp		;���û�ȡ�¶��ӳ���

				;movlw	b'00010000'		;�����¶ȴ��������ݸ�ʽ��д�Ĳ������� 25.0625
				;movwf	var_temp_hs

				;movlw	b'00011100'
				;movwf	var_temp_ls


				movf	var_temp_ls,0	;���Ƶ��ֽ�
				movwf	var_temp

				rrf		var_temp,1		;����4λ
				rrf		var_temp,1
				rrf		var_temp,1
				rrf		var_temp,1
				bcf		var_temp,4		;�������λ�������¶ȵ��������ֵĵ���λ
				bcf		var_temp,5
				bcf		var_temp,6
				bcf		var_temp,7
				rlf		var_temp_hs,1	;���ֽ�����4λ
				rlf		var_temp_hs,1
				rlf		var_temp_hs,1
				rlf		var_temp_hs,1
				bcf		var_temp_hs,3	;�������λ�������¶ȵ��������ֵĸ���λ
				bcf		var_temp_hs,2
				bcf		var_temp_hs,1
				bcf		var_temp_hs,0
				movf	var_temp_hs,0
				addwf	var_temp,1		;������λ�͵���λ��ӻ���¶ȵ���������
				movf	var_temp,0
				call	temp_bcd		;ת��ΪBCD��
temp_con		movf	hund,0
				movwf	var_temp_hund
				movf	ten,0
				movwf	var_temp_ten
				movf	one,0
				movwf	var_temp_one

				movf	var_temp_ls,0
				movwf	var_temp_p		;���Ƶ��ֽ�
				bcf		var_temp_p,4	;�������λ������¶ȵ�С������
				bcf		var_temp_p,5
				bcf		var_temp_p,6
				bcf		var_temp_p,7
				movf	var_temp_p,0	;��С�����ֳ���10�����10����С������
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				swapf	var_temp_p,1	;����λ�����λ����
				bcf		var_temp_p,4	;�������λ�����ʮ��λ�Ķ�������
				bcf		var_temp_p,5
				bcf		var_temp_p,6
				bcf		var_temp_p,7
				call	temp_bcd_p		;ת��ΪBCD��
temp_conp		movf	one,0
				movwf	var_temp_p		;����¶ȵ�ʮ��λ��BCD��
						
				
;***************************************��һ�� �¶���ʾ					
				call	lcd_enable	
				movlw	const_line1
				call	lcd_display

				movlw	0x01			;�������ģʽ
				movwf	portd

				movlw	0xce			;��
				call	lcd_display

				movlw	0xc2			
				call	lcd_display

				movlw	0xb6			;��
				call	lcd_display
				
				movlw	0xc8
				call	lcd_display

				movlw	NOTE_COLON
				call	lcd_display

				movf	var_temp_hund,0	;��ÿһλ��BCD��ת��ΪASCII��
				;bsf		PCLATH,3
				call	convert
				;bcf		PCLATH,3
				call	lcd_display

				movf	var_temp_ten,0
				;bsf		PCLATH,3		
				call	convert
				call	lcd_display
				
				movf	var_temp_one,0
				;bsf		PCLATH,3
				call	convert
				call	lcd_display

				movlw	NOTE_PERIOD
				call	lcd_display

				movf	var_temp_p,0
				call	convert
				call	lcd_display

				movlw	0xa1
				call	lcd_display

				movlw	0xe6
				call	lcd_display

;**************************************ʪ�ȼ�������ݴ���
				call	humd_get
				comf	var_humd_get,1
				bcf		var_humd_get,2
				bcf		var_humd_get,3
				bcf		var_humd_get,4
				bcf		var_humd_get,5
				bcf		var_humd_get,6
				bcf		var_humd_get,7
				comf	var_humd_get2,1
				call	nhumd_bcd
humd_con		movf	hund,0
				movwf	var_humd_hund
				movf	ten,0
				movwf	var_humd_ten
				movf	one,0
				movwf	var_humd_one
				movf	point,0
				movwf	var_humd_p

;**************************************�ڶ��� ʪ����ʾ
				call	lcd_enable		;ѡ��
				movlw	const_line2
				call	lcd_display

				movlw	0x01			;�������ģʽ
				movwf	portd

				movlw	0xca			;ʪ
				call	lcd_display

				movlw	0xaa
				call	lcd_display

				movlw	0xb6			;��
				call	lcd_display

				movlw	0xc8
				call	lcd_display

				movlw	NOTE_COLON
				call	lcd_display

				movf	var_humd_hund,0
				;bsf		PCLATH,3
				call	convert
				;movlw	NUM_ZERO
				call	lcd_display

				movf	var_humd_ten,0
				;bsf		PCLATH,3
				call	convert
				;movlw	NUM_ZERO
				call	lcd_display

				movf	var_humd_one,0
				;bsf		PCLATH,3
				call	convert
				;movlw	NUM_ZERO
				call	lcd_display

				movlw	NOTE_PERIOD
				call	lcd_display

				movf	var_humd_p,0
				call	convert
				;movlw	NUM_ZERO
				call	lcd_display

				movlw	NOTE_PER
				call	lcd_display

;**************************************����������
				call	lcd_enable		;ѡ��
				movlw	const_line4
				call	lcd_display

				movlw	0x01			;�������ģʽ
				movwf	portd

				call	four_space

				movlw	0xce			;��
				call	lcd_display

				movlw	0xc2			
				call	lcd_display

				movlw	0xca			;ʪ
				call	lcd_display
				
				movlw	0xaa
				call	lcd_display

				movlw	0xb6			;��
				call	lcd_display
				
				movlw	0xc8
				call	lcd_display

				movlw	0xbc			;��
				call	lcd_display
				
				movlw	0xc6
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				goto	start


;******************************************�ӳ����б�
;*****************************************BCD��תΪASCII��
convert			addwf	pcl,1
table			retlw	NUM_ZERO
				retlw	NUM_ONE
				retlw	NUM_TWO
				retlw	NUM_THREE
				retlw	NUM_FOUR
				retlw	NUM_FIVE
				retlw	NUM_SIX
				retlw	NUM_SEVEN
				retlw	NUM_EIGHT
				retlw	NUM_NINE
				return
			
;********************************************LCDʹ�ܶ˿���
lcd_enable		movlw	00h
				movwf	portd				;E=0, RW=0, RS=0
				call	delay
				movlw	40h
				movwf	portd				;E=1, RW=0, RS=0
				call	delay
				return

lcd_display		movwf	portb
				bsf		portd,2				;E=1, RW=0, RS=1
				call	delay
				bcf		portd,2				;E=0, RW=0, RS=1
				call	delay
				return
			
;********************************************10ms��ʱ
delay			movlw	0x0c
				movwf	var_delay1
loop0			movlw	0x98
				movwf	var_delay2
loop1			decfsz	var_delay2, 1
				goto	loop1
				decfsz	var_delay1, 1
				goto	loop0
				return

;*******************************************100ms��ʱ
delay100		call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				call	delay
				return

;*****************************************+1s
delay1000		call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				call	delay100
				return

delay15us		movlw	0x04			;1
				movwf	var_us			;1
loop2			decfsz	var_us,1		;1/2
				goto	loop2			;2
				return					;2

delay30us		movlw	0x09			;1
				movwf	var_us			;1
loop7			decfsz	var_us,1		;1/2
				goto	loop7			;2
				return					;2

delay45us		movlw	0x0e			;1
				movwf	var_us			;1
loop8			decfsz	var_us,1		;1/2
				goto	loop8			;2
				return					;2		

delay70us		movlw	0x17			;1
				movwf	var_us			;1
loop3			decfsz	var_us,1		;1/2
				goto	loop3			;2
				return					;2

delay500us		movlw	0x07			;1
				movwf	var_us			;1
loop4			movlw	0x0f
				movwf	var_us2
loop9			decfsz	var_us2
				goto	loop9
				decfsz	var_us,1		;1/2
				goto	loop4			;2
				return					;2

delay750us		movlw	0x07
				movwf	var_us
loop5			movlw	0x17
				movwf	var_us2
loop6			decfsz	var_us2,1
				goto	loop6
				decfsz	var_us
				goto	loop5
				return



;*****************************************�¶ȴ���������
;*****************************************��ȡ�¶�
get_temp		call	ds_reset			;��ʼ��������
				movlw	0xcc				;0xcc����ROMָ�����ֻ��һ����������ʱ��
				call	ds_write			;DS18B20֧�ִ�����������ÿ������������һ��64λ��ROM��ַ
											;����ʱ��Ҫ����ROMƥ��ָ�����������ʱ���ã�ֱ�ӷ���0xcc������
				movlw	0x44				;0x44�¶�ת��ָ��
				call	ds_write			
				call	delay750us			;��ʱ750us
				call	ds_reset			;��ʼ��������
				movlw	0xcc				;0xcc����ROMָ��
				call	ds_write
				movlw	0xbe				;0xbe���ݴ���ָ�DS18B20���ݴ�������9���ֽڣ����2�ֽڴ洢���ǵ�ǰ���¶�ֵ
				call	ds_write			
				call	ds_read
				movf	var_ds_read,0		;�����ֽ�
				movwf	var_temp_ls
				call	ds_read
				movf	var_ds_read,0		;�����ֽ�
				movwf	var_temp_hs
				return

;*****************************************�¶ȴ�������ʼ��
;��ʼ�����裺
;����ߵ�ƽ
;��ʱ
;����͵�ƽ
;��ʱ480-960us
;����ߵ�ƽ
;����ʼ���ɹ��������15-60us�󷵻�һ���͵�ƽ
ds_reset		movlw	0x01
				movwf	var_ds_bit
ds_reset_loop	bsf		status,rp0
				bcf		trisc,0
				bcf		status,rp0
				bsf		portc,0				;����ߵ�ƽ
				nop							;��ʱ2us
				nop
				bcf		portc,0				;����͵�ƽ
				call	delay750us			;��ʱ750us
				bsf		portc,0				;����ߵ�ƽ
				call	delay70us			;��ʱ70us
				bsf	 	status,rp0			;����ģʽ
				bsf		trisc,0;
				bcf	 	status,rp0
				btfsc	portc,0				;��ȡ���ݣ��������һ���͵�ƽ��˵����������ʼ���ɹ�
				goto	ds_reset_loop		;���û�з��ص͵�ƽ����Ҫ���³�ʼ��
				call	delay500us			;��ʱ500us
				bsf		status,rp0			;���ģʽ
				bcf		trisc,0
				bcf		status,rp0
				bsf		portc,0				;����ߵ�ƽ
				nop
				return

;*****************************************�¶ȴ��������8bit����
;д���ݲ��裺
;����͵�ƽ
;��ʱ15us
;�ӵ͵��߷�������
;��ʱ45us
;����ߵ�ƽ
;�ظ����ϲ���ֱ�����������ݣ�Ҫ�ӵ�λ����λ����
;����ߵ�ƽ
ds_write		movwf	var_ds_write
				movlw	0x08
				movwf	var_ds_i
				bsf		status,rp0			;���ģʽ
				bcf		trisc,0
				bcf		status,rp0			
ds_write_loop	bsf		portc,0				;����ߵ�ƽ
				nop							;��ʱ2us
				nop
				bcf		portc,0				;����͵�ƽ
				call	delay15us			;��ʱ15us
				rrf		var_ds_write,1		;����һλ��ĩλ�����status��C
				btfss	status,c			;�ж�ĩλΪ0��1
				goto	write_0				
				bsf		portc,0				;ĩλΪ1������ߵ�ƽ
				goto	write_1
write_0			bcf		portc,0				;ĩλΪ0������͵�ƽ
write_1			call	delay45us			;��ʱ45us
				bsf		portc,0				;����ߵ�ƽ
				decfsz	var_ds_i,1
				goto	ds_write_loop
				return

;*****************************************���¶ȴ�������8bit����
;�����ݲ��裺
;����ߵ�ƽ
;��ʱ2us
;����͵�ƽ
;��ʱ6us
;����ߵ�ƽ
;��ʱ4us
;��״̬λ�����д���
;��ʱ30us
;�ظ����ϲ��裬ֱ������һ���ֽڣ����������ɵ�λ����λ��������
ds_read			
				clrf	var_ds_read
				movlw	0x08
				movwf	var_ds_i
ds_read_loop	
				clrf	var_ds_bit
				bsf		status,rp0			;���ģʽ
				bcf		trisc,0
				bcf		status,rp0	
				bcf		portc,0				;����͵�ƽ
				nop							;��ʱ6us
				nop
				nop
				nop
				nop
				nop
				bsf		portc,0				;����ߵ�ƽ
				nop							;��ʱ4us
				nop
				nop
				nop
				bsf	 	status,rp0
				bsf		trisc,0				;����ģʽ
				bcf	 	status,rp0			;���ݴ��������ص����ݸ���status��C
				bsf		status,c
				btfss	portc,0
				bcf		status,c
				rrf		var_ds_read,1		;���ƶ�ȡ�����ݣ�����status��C�����������
				call	delay70us			;��ʱ70us
				decfsz	var_ds_i,1
				goto	ds_read_loop
				return


;******************************************��������תΪBCD��
temp_bcd		movwf	num
				clrf	hund
				clrf	ten
				clrf	one
				decfsz	num,0
				goto	inc
				goto	temp_con
inc				incf	one,1
				btfsc	one,3
				goto	dec_one_pre
con0			btfsc	ten,3
				goto	dec_ten_pre
con1			decfsz	num,1
				goto	inc
				goto	temp_con
				
dec_one_pre		btfsc	one,1
				call	dec_one
				goto	con0

dec_one			clrf	one
				incf	ten,1
				goto	con0	

dec_ten_pre		btfsc	ten,1
				call	dec_ten
				goto	con1

dec_ten			clrf	ten
				incf	hund,1
				goto	con1

temp_bcd_p		movwf	num
				clrf	one
				decfsz	num,0
				goto	inc2
				goto	temp_conp
inc2			incf	one,1
				btfsc	one,3
				goto	dec_one_pre2
con2			decfsz	num,1
				goto	inc2
				goto	temp_conp

dec_one_pre2	btfsc	one,1
				clrf	one
				goto	con2

four_space		movlw	CHAR_SPACE
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display
				return

;*******************************************ʪ�ȴ�������ȡ
humd_get		;clrf	adresh
				;clrf	adresl
				
loop_humd_get	btfss	intcon,t0if
				goto	loop_humd_get
				bcf		intcon,t0if
				bsf		adcon0,go
loop_humd_wait	btfss	pir1,adif
				goto	loop_humd_wait
				movf	adresh,0
				movf	adresh,0
				movwf	var_humd_get
				bsf	 	status,rp0
				movf	adresl,0
				bcf	 	status,rp0
				movwf	var_humd_get2
				return

nhumd_bcd		clrf	hund
				movlw	0x02
				movwf	ten
				clrf	one
				clrf	point
				incf	var_humd_get,1
inc4			incf	point,1
				incf	point,1
				btfsc	point,3
				goto	dec_point_pre5
con9			btfsc	one,3
				goto	dec_one_pre5
con10			btfsc	ten,3
				goto	dec_ten_pre5
con11			decfsz	hund,0
				goto	con12
				movlw	0x01
				movwf	hund
				clrf	ten
				clrf	one
				clrf	point
				goto	humd_con
con12			decfsz	var_humd_get2,1
				goto	inc4
				decfsz	var_humd_get,1
				goto	inc4
				goto	humd_con
		
dec_point_pre5	btfsc	point,1
				call	dec_point5
				goto	con9

dec_point5		clrf	point
				incf	one,1
				goto	con9

dec_one_pre5	btfsc	point,1
				call	dec_one5
				goto	con10

dec_one5		clrf	one
				incf	ten,1
				goto	con10

dec_ten_pre5	btfsc	ten,1
				call	dec_ten5
				goto	con11

dec_ten5		clrf	ten
				incf	hund,1
				goto	con11
				
				end
			
			
			
