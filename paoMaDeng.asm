;************
;��˸�����
;************
tmr0		equ		01h			;������0
pcl			equ		02h			;���������ֽڼĴ���
status		equ		03h			;״̬�Ĵ���
option_reg	equ 	81h			;ѡ��Ĵ���
intcon		equ 	0bh			;�жϿ��ƼĴ���
portc		equ 	07h			;�˿�C���ݼĴ���
trisc		equ 	87h			;�˿�C������ƼĴ���
tmr0_b		equ 	0			;TMR0�Ĵ�����ʼֵ
dly1		equ 	20h			;��ʱ����1
dly2		equ 	21h			;��ʱ����2
w			equ 	0			;����W��ָʾλ
f			equ 	1			;����RAM��ָʾλ
rp0			equ 	5			;����ҳѡλ��STATUS�ĵ���λ��
t0if		equ 	2			;TMR0���жϱ�־λ
w_temp		equ 	7fh			;����0�϶�����ʱ���ݼĴ���
portc_b		equ 	23h			;��ʾ��������ʱ�������������ĸ�������
flag		equ 	24h			;�����־λ��ֻʹ�øõ�ַ�����һλ��
;********************************��λ����****************************
			org		000h		;����������������ʼ��ַ
			nop					;����һ��ICD����Ŀղ���
			goto 	main	
;********************************�ж��������жϷ����ӳ���************
			org 	004h		;�ж�����
tmr0serv						;�жϷ������
			movwf 	w_temp		;����W�����ı��ݼĴ���w_temp��
			bcf 	intcon,t0if	;���intcon�еĵ�t0if��2��λ�����TMR0����жϱ�־λ
			incf	flag,f		;flag����+1���������־λ��ת
			btfss	flag,0		;��flag�ĵ�0λΪ1������һ��
			goto	jump0		;ǰ�������ӳ���
			clrf	portc		;portc���㣬��ȫ��Ϩ��
			goto	jump1		;ǰ��jump1
jump0		movf	portc_b, w	;�����������ݴ���W
			movwf	portc		;��W��������portc
jump1		movlw	tmr0_b		;���Ĵ�����ʼֵ��0������W
			movwf 	tmr0		;��W��������TMR0
			movf	w_temp, w	;�����ݼĴ����е����ݻָ�
			retfie				;�жϷ�����򷵻�
;********************************������*****************************
main
			bsf		status,rp0	;STATUS�ĵ���λ��RP0��ѡλ����1
			movlw	0
			movwf	trisc		;���������0����trisc
			movlw 	07h			
			movwf	option_reg	;07h��option_reg
			bcf		status, rp0	;STATUS�ĵ���λ��RP0��ѡλ����0
			movlw	0a0h		
			movwf	intcon		;0A0H��intcon
			bcf		intcon,t0if	;intcon�ĵ�t0if��2��λ��0
			movlw	tmr0_b
			movwf	tmr0		;TMR0����ֵ
			movlw	b'10000000'	
			movwf	portc_b		;�������Ĵ�����ֵ
loop		call	delay		
			rrf		portc_b, f	;����λ��־����portc_b
			goto	loop

delay
			movlw	0ffh
			movwf 	dly1		;��ѭ��dly1��ֵ255
lp0			movlw	0ffh		
			movwf	dly2		;��ѭ��dly2��ֵ255
lp1			decfsz	dly2, f
			goto	lp1
			decfsz	dly1, f
			goto	lp0
			return
			end
