;************
;闪烁跑马灯
;************
tmr0		equ		01h			;计数器0
pcl			equ		02h			;计数器低字节寄存器
status		equ		03h			;状态寄存器
option_reg	equ 	81h			;选项寄存器
intcon		equ 	0bh			;中断控制寄存器
portc		equ 	07h			;端口C数据寄存器
trisc		equ 	87h			;端口C方向控制寄存器
tmr0_b		equ 	0			;TMR0寄存器初始值
dly1		equ 	20h			;延时变量1
dly2		equ 	21h			;延时变量2
w			equ 	0			;定义W的指示位
f			equ 	1			;定义RAM的指示位
rp0			equ 	5			;定义页选位（STATUS的第五位）
t0if		equ 	2			;TMR0的中断标志位
w_temp		equ 	7fh			;在体0上定义临时备份寄存器
portc_b		equ 	23h			;显示缓冲区计时器，真正控制哪个灯亮的
flag		equ 	24h			;亮灭标志位（只使用该地址的最后一位）
;********************************复位向量****************************
			org		000h		;定义程序存放区域的起始地址
			nop					;设置一条ICD必须的空操作
			goto 	main	
;********************************中断向量和中断服务子程序************
			org 	004h		;中断向量
tmr0serv						;中断服务程序
			movwf 	w_temp		;复制W到他的备份寄存器w_temp中
			bcf 	intcon,t0if	;清除intcon中的第t0if（2）位，清除TMR0溢出中断标志位
			incf	flag,f		;flag内容+1，即亮灭标志位反转
			btfss	flag,0		;若flag的第0位为1，则跳一步
			goto	jump0		;前往点亮子程序
			clrf	portc		;portc清零，则全部熄灭
			goto	jump1		;前往jump1
jump0		movf	portc_b, w	;将缓冲区内容传至W
			movwf	portc		;将W内容送至portc
jump1		movlw	tmr0_b		;将寄存器初始值（0）送至W
			movwf 	tmr0		;将W内容送至TMR0
			movf	w_temp, w	;将备份寄存器中的内容恢复
			retfie				;中断服务程序返回
;********************************主程序*****************************
main
			bsf		status,rp0	;STATUS的第五位（RP0体选位）置1
			movlw	0
			movwf	trisc		;方向控制码0送入trisc
			movlw 	07h			
			movwf	option_reg	;07h给option_reg
			bcf		status, rp0	;STATUS的第五位（RP0体选位）置0
			movlw	0a0h		
			movwf	intcon		;0A0H给intcon
			bcf		intcon,t0if	;intcon的第t0if（2）位置0
			movlw	tmr0_b
			movwf	tmr0		;TMR0赋初值
			movlw	b'10000000'	
			movwf	portc_b		;缓冲器寄存器赋值
loop		call	delay		
			rrf		portc_b, f	;带进位标志右移portc_b
			goto	loop

delay
			movlw	0ffh
			movwf 	dly1		;外循环dly1赋值255
lp0			movlw	0ffh		
			movwf	dly2		;内循环dly2赋值255
lp1			decfsz	dly2, f
			goto	lp1
			decfsz	dly1, f
			goto	lp0
			return
			end
