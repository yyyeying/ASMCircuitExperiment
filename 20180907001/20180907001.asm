tmr0			equ		0x01				;TMR0
pcl				equ		0x02	
status			equ		0x03				;状态寄存器
option_reg 		equ		0x81				;选项寄存器
intcon			equ		0x0b				;中断控制寄存器
rp0				equ		0x05				;状态寄存器中的页选位RP0
porta			equ		0x05				;湿度传感器-RA0
trisa			equ		0x85
portb			equ		0x06				;2LCD数据线-RB0-RB7
trisb			equ		0x86
portc			equ		0x07				;温度传感器-RC0
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


var_delay1		equ		0x20				;延时变量1
var_delay2		equ		0x21				;延时变量2

var_temp_hund	equ		0x2c				;处理后的温度的百位BCD码
var_temp_ten	equ		0x22				;处理后的温度值的十位BCD码
var_temp_one	equ		0x23				;处理后的温度的个位BCD码
var_temp_p		equ		0x24				;处理后的温度的十分位BCD码
var_temp_hs		equ		0x25				;从传感器接收的温度的高字节
var_temp_ls		equ		0x26				;从传感器接收的温度的低字节
var_temp		equ		0x27				;从传感器接收的温度的整数部分

hund			equ		0x28				;在二进制转BCD的过程中的中间变量
ten				equ		0x29
one				equ		0x2a
num				equ		0x2b
point			equ		0x2e



var_ds_bit		equ		0x34				;从温度传感器接收的1bit数据
var_ds_write	equ		0x30				;准备写给温度传感器的数据
var_ds_i		equ		0x31				;变量
var_ds_read		equ		0x32				;从温度传感器接收的1byte数据


var_humd_hund	equ		0x41
var_humd_ten	equ		0x42
var_humd_one	equ		0x43
var_humd_p		equ		0x46
var_humd		equ		0x44
var_humd_get	equ		0x47
var_humd_get2	equ		0x45

var_us			equ		0x33				;用于微秒级延时的变量
var_us2			equ		0x50				;用于微秒级延时的变量

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

#define NOTE_COLON  	0x3A        		;冒号
#define NOTE_PERIOD 	0x2E       			;句号
#define NOTE_EX     	0x21        		;感叹号
#define NOTE_PER		0x25				;百分号

#define CAP_C       	0x43
#define CAP_E       	0x45
#define CAP_L       	0x4C
#define CAP_M       	0x4D
#define CAP_O       	0x4F
#define CAP_W       	0x57

const_line1		equ		0x80				;LCD各行地址
const_line2		equ		0x90
const_line3		equ		0x88
const_line4		equ		0x98

PCLATH			equ		0x0a

				org		0000h
main	
				nop
;******************************************端口输入输出设置
				movlw	0x41
				movwf	adcon0				;ADCON0，第7,6位选择时钟频率，第5-3位选择转换通道，第2位转换状态标志，第0位转换器开关
											;01000001，时钟频率f/8，通道RA0，转换器开
				bsf	 	status,rp0 			;设置文件寄存器的体1
				movlw	0xff
				movwf	trisa				;端口RA0 输入
				movlw	0x00			
				movwf	trisb				;端口B 输出		
				movlw  	0x00
				movwf	trisc
				movlw	0x00
				movwf 	trisd				;端口D 输出
				movlw	0x85		
				movwf	adcon1				;ADCON1,第七位选择ADC结果左对齐（0）右对齐（1），后四位确定模拟口和参考电压
											;10000101，右对齐，RA3为Vref，RA0为A口
				;movlw	0x01
				movlw	0x87
				movwf	option_reg			;分频比设为"1:256"
				bcf	 	status,rp0			;恢复到文件寄存器的体0
			
;********************************************LCD初始化
				movlw	0x00
				movwf	portd				;指令输出
					
				movlw	0x01				;清除显示
				call	lcd_display

				movlw	0x38				;8位2行5*7点阵
				call	lcd_display

				movlw	0x06				;文字不动，光标右移
				call	lcd_display

				movlw	0x0c					
				call	lcd_display
				
				movlw	0x01
				call	lcd_display

;********************************************LCD显示数据欢迎界面
				call	lcd_enable			;选行
				movlw	const_line2
				call	lcd_display

				movlw	0x01				;数据输出模式
				movwf	portd

				call	four_space

				movlw	0xbb			;欢
				call	lcd_display
				
				movlw	0xb6
				call	lcd_display

				movlw	0xd3			;迎
				call	lcd_display

				movlw	0xad			
				call	lcd_display

				movlw	0xca			;使
				call	lcd_display

				movlw	0xb9			
				call	lcd_display

				movlw	0xd3			;用
				call	lcd_display

				movlw	0xc3
				call	lcd_display

				call	lcd_enable		;选行
				movlw	const_line3
				call	lcd_display

				movlw	0x01			;数据输出模式
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
				movlw	0x01			;清除显示
				call	lcd_display

				movlw	0x04
				movwf	var_display

;**************************************温度检测与数据处理

start			
				clrf	portc
				call	get_temp		;调用获取温度子程序

				;movlw	b'00010000'		;按照温度传感器数据格式编写的测试数据 25.0625
				;movwf	var_temp_hs

				;movlw	b'00011100'
				;movwf	var_temp_ls


				movf	var_temp_ls,0	;复制低字节
				movwf	var_temp

				rrf		var_temp,1		;右移4位
				rrf		var_temp,1
				rrf		var_temp,1
				rrf		var_temp,1
				bcf		var_temp,4		;清除高四位，这是温度的整数部分的低四位
				bcf		var_temp,5
				bcf		var_temp,6
				bcf		var_temp,7
				rlf		var_temp_hs,1	;高字节左移4位
				rlf		var_temp_hs,1
				rlf		var_temp_hs,1
				rlf		var_temp_hs,1
				bcf		var_temp_hs,3	;清除低四位，这是温度的整数部分的高四位
				bcf		var_temp_hs,2
				bcf		var_temp_hs,1
				bcf		var_temp_hs,0
				movf	var_temp_hs,0
				addwf	var_temp,1		;将高四位和低四位相加获得温度的整数部分
				movf	var_temp,0
				call	temp_bcd		;转换为BCD码
temp_con		movf	hund,0
				movwf	var_temp_hund
				movf	ten,0
				movwf	var_temp_ten
				movf	one,0
				movwf	var_temp_one

				movf	var_temp_ls,0
				movwf	var_temp_p		;复制低字节
				bcf		var_temp_p,4	;清除高四位，获得温度的小数部分
				bcf		var_temp_p,5
				bcf		var_temp_p,6
				bcf		var_temp_p,7
				movf	var_temp_p,0	;将小数部分乘以10，获得10倍的小数部分
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				addwf	var_temp_p,1
				swapf	var_temp_p,1	;低四位与高四位交换
				bcf		var_temp_p,4	;清除高四位，获得十分位的二进制码
				bcf		var_temp_p,5
				bcf		var_temp_p,6
				bcf		var_temp_p,7
				call	temp_bcd_p		;转换为BCD码
temp_conp		movf	one,0
				movwf	var_temp_p		;获得温度的十分位的BCD码
						
				
;***************************************第一行 温度显示					
				call	lcd_enable	
				movlw	const_line1
				call	lcd_display

				movlw	0x01			;数据输出模式
				movwf	portd

				movlw	0xce			;温
				call	lcd_display

				movlw	0xc2			
				call	lcd_display

				movlw	0xb6			;度
				call	lcd_display
				
				movlw	0xc8
				call	lcd_display

				movlw	NOTE_COLON
				call	lcd_display

				movf	var_temp_hund,0	;将每一位的BCD码转换为ASCII码
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

;**************************************湿度检测与数据处理
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

;**************************************第二行 湿度显示
				call	lcd_enable		;选行
				movlw	const_line2
				call	lcd_display

				movlw	0x01			;数据输出模式
				movwf	portd

				movlw	0xca			;湿
				call	lcd_display

				movlw	0xaa
				call	lcd_display

				movlw	0xb6			;度
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

;**************************************第四行内容
				call	lcd_enable		;选行
				movlw	const_line4
				call	lcd_display

				movlw	0x01			;数据输出模式
				movwf	portd

				call	four_space

				movlw	0xce			;温
				call	lcd_display

				movlw	0xc2			
				call	lcd_display

				movlw	0xca			;湿
				call	lcd_display
				
				movlw	0xaa
				call	lcd_display

				movlw	0xb6			;度
				call	lcd_display
				
				movlw	0xc8
				call	lcd_display

				movlw	0xbc			;计
				call	lcd_display
				
				movlw	0xc6
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				movlw	CHAR_SPACE
				call	lcd_display

				goto	start


;******************************************子程序列表
;*****************************************BCD码转为ASCII码
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
			
;********************************************LCD使能端控制
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
			
;********************************************10ms延时
delay			movlw	0x0c
				movwf	var_delay1
loop0			movlw	0x98
				movwf	var_delay2
loop1			decfsz	var_delay2, 1
				goto	loop1
				decfsz	var_delay1, 1
				goto	loop0
				return

;*******************************************100ms延时
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



;*****************************************温度传感器控制
;*****************************************获取温度
get_temp		call	ds_reset			;初始化传感器
				movlw	0xcc				;0xcc跳过ROM指令，用于只有一个传感器的时候。
				call	ds_write			;DS18B20支持传感器组网，每个传感器都有一个64位的ROM地址
											;组网时需要发送ROM匹配指令，单个传感器时不用，直接发送0xcc跳过。
				movlw	0x44				;0x44温度转换指令
				call	ds_write			
				call	delay750us			;延时750us
				call	ds_reset			;初始化传感器
				movlw	0xcc				;0xcc跳过ROM指令
				call	ds_write
				movlw	0xbe				;0xbe读暂存器指令，DS18B20的暂存器共有9个字节，最后2字节存储的是当前的温度值
				call	ds_write			
				call	ds_read
				movf	var_ds_read,0		;读低字节
				movwf	var_temp_ls
				call	ds_read
				movf	var_ds_read,0		;读高字节
				movwf	var_temp_hs
				return

;*****************************************温度传感器初始化
;初始化步骤：
;输出高电平
;延时
;输出低电平
;延时480-960us
;输出高电平
;若初始化成功，则会在15-60us后返回一个低电平
ds_reset		movlw	0x01
				movwf	var_ds_bit
ds_reset_loop	bsf		status,rp0
				bcf		trisc,0
				bcf		status,rp0
				bsf		portc,0				;输出高电平
				nop							;延时2us
				nop
				bcf		portc,0				;输出低电平
				call	delay750us			;延时750us
				bsf		portc,0				;输出高电平
				call	delay70us			;延时70us
				bsf	 	status,rp0			;输入模式
				bsf		trisc,0;
				bcf	 	status,rp0
				btfsc	portc,0				;读取数据，如果返回一个低电平，说明传感器初始化成功
				goto	ds_reset_loop		;如果没有返回低电平，需要重新初始化
				call	delay500us			;延时500us
				bsf		status,rp0			;输出模式
				bcf		trisc,0
				bcf		status,rp0
				bsf		portc,0				;输出高电平
				nop
				return

;*****************************************温度传感器输出8bit数据
;写数据步骤：
;输出低电平
;延时15us
;从低到高发送数据
;延时45us
;输出高电平
;重复以上步骤直至发送完数据，要从低位到高位发送
;输出高电平
ds_write		movwf	var_ds_write
				movlw	0x08
				movwf	var_ds_i
				bsf		status,rp0			;输出模式
				bcf		trisc,0
				bcf		status,rp0			
ds_write_loop	bsf		portc,0				;输出高电平
				nop							;延时2us
				nop
				bcf		portc,0				;输出低电平
				call	delay15us			;延时15us
				rrf		var_ds_write,1		;右移一位，末位会进入status的C
				btfss	status,c			;判断末位为0或1
				goto	write_0				
				bsf		portc,0				;末位为1，输出高电平
				goto	write_1
write_0			bcf		portc,0				;末位为0，输出低电平
write_1			call	delay45us			;延时45us
				bsf		portc,0				;输出高电平
				decfsz	var_ds_i,1
				goto	ds_write_loop
				return

;*****************************************从温度传感器读8bit数据
;读数据步骤：
;输出高电平
;延时2us
;输出低电平
;延时6us
;输出高电平
;延时4us
;读状态位并进行处理
;延时30us
;重复以上步骤，直至读完一个字节，传感器会由低位至高位发送数据
ds_read			
				clrf	var_ds_read
				movlw	0x08
				movwf	var_ds_i
ds_read_loop	
				clrf	var_ds_bit
				bsf		status,rp0			;输出模式
				bcf		trisc,0
				bcf		status,rp0	
				bcf		portc,0				;输出低电平
				nop							;延时6us
				nop
				nop
				nop
				nop
				nop
				bsf		portc,0				;输出高电平
				nop							;延时4us
				nop
				nop
				nop
				bsf	 	status,rp0
				bsf		trisc,0				;输入模式
				bcf	 	status,rp0			;根据传感器返回的数据更改status的C
				bsf		status,c
				btfss	portc,0
				bcf		status,c
				rrf		var_ds_read,1		;右移读取的数据，这样status的C会存入数据中
				call	delay70us			;延时70us
				decfsz	var_ds_i,1
				goto	ds_read_loop
				return


;******************************************二进制数转为BCD码
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

;*******************************************湿度传感器读取
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
			
			
			
