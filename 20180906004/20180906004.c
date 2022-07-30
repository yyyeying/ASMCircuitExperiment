#include<pic.h>
#include "ASCII.h"

#define uchar unsigned char
#define uint unsigned int

#define LINE_ONE		0x80
#define LINE_TWO		0x90
#define LINE_THREE		0x88
#define LINE_FOUR		0x98

//__CONFIG(0x3B31);
__CONFIG(0x3545);

void delay(uint x)
{
	uint a,b;
	for(a=x;a>0;a--)
		for(b=110;b>0;b--);
}

#define RS RA1
#define RW RA2
#define E  RA3

int temp = 0;
int humd = 0;
int pm = 0;

const uchar space[16]=
{SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE};

const uchar welcome[16]=
{SPACE,SPACE,SPACE,SPACE,CAP_W,LOW_E,LOW_L,LOW_C,LOW_O,LOW_M,LOW_E,NOTE_EX,SPACE,SPACE,SPACE,SPACE};

const uchar huanyingshiyong[16]=
{0x20,0x20,0x20,0x20,0xbb,0xb6,0xd3,0xad,0xca,0xb9,0xd3,0xc3,0x20,0x20,0x20,0x20};

const uchar wangweijun[16]=
{SPACE,CAP_W,CAP_A,CAP_N,CAP_G,SPACE,CAP_W,CAP_E,CAP_I,SPACE,CAP_J,CAP_U,CAP_N,SPACE,SPACE,SPACE}; 

const uchar wangweijunch[16]=
{0xCD,0xF5,0xE7,0xE2,0xBF,0xA4,0xA3,0xAC,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE};

const uchar zhenlajich[16]=
{0xD5,0xE6,0xC0,0xAC,0xBB,0xF8,0xA1,0xA3,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE,SPACE};

const uchar zhenlaji[16]=
{SPACE,CAP_Z,CAP_H,CAP_E,CAP_N,SPACE,CAP_L,CAP_A,SPACE,CAP_J,CAP_I,SPACE,SPACE,SPACE,SPACE,SPACE};

uchar wendu[16]=
{0xce,0xc2,0xb6,0xc8,NOTE_COLON,SPACE,NUM_ZERO,NUM_ZERO,NOTE_PERIOD,NUM_ZERO,0xa1,0xe6,SPACE,SPACE,SPACE};

uchar shidu[16]=
{0xca,0xaa,0xb6,0xc8,NOTE_COLON,SPACE,NUM_ZERO,NUM_ZERO,NUM_ZERO,NOTE_PERIOD,NUM_ZERO,0x25,SPACE,SPACE,SPACE,SPACE};

uchar pm25[16]=
{CAP_P,CAP_M,NUM_TWO,NOTE_PERIOD,NUM_FIVE,NOTE_COLON,NUM_ZERO,NUM_ZERO,NUM_ZERO,NUM_ZERO,LOW_U,LOW_G,0x2F,LOW_M,0x5e,NUM_TWO};

void port_init()
{
	ADCON1=0X07;   //����RA,RE��Ϊ���ֿ�
  	TRISA=0X00;    //����RA��Ϊ�����
	TRISD=0X00;
	TRISB=0xFF;
	OPTION_REG=0X8F;   //��Ƶ��WDT����Ƶ��Ϊ128
}

void lcd_enable(void)
{
  	RS=0;         //д����
  	RW=0;         //д����
  	E=0;          //�͵�ƽ�ź�
 	delay(10);  	//�͵�ƽ�źű���
 	E=1;          //���ߵ�ƽ�ź�
}

void lcd_writebyte(uchar data)
{
  	PORTD	= data;   //��RD��д����
  	RS=1;         	//д����
  	RW=0;         //д����
  	E=0;          //�͵�ƽ�ź�
  	delay(10);  	//�͵�ƽ�źű���
  	E=1;          //���ߵ�ƽ�ź�
}

void lcd_writedata(const uchar *ptt)
{
  	uchar i;
  	for(i=0;i<16;i++)         //д16���ֽ�����
  	{
    	lcd_writebyte(ptt[i]);  //���д����
  	}
}

void lcd_writegb2312(const uchar *ptt)
{
  	uchar i;
  	for(i=0;i<8;i++)         
  	{
    	lcd_writebyte(ptt[i]);  //���д����
  	}
}

void lcd_init(void)
{
  	PORTD=0X01;    //�����ʾ
  	lcd_enable();
  	PORTD=0X38;    //8λ2��5*7����
  	lcd_enable();
  	PORTD=0X0e;    //��ʾ������꿪����˸
  	lcd_enable();
  	PORTD=0X06;    //���ֲ������������
  	lcd_enable();
}


void lcd_display(uint line, uchar word[])
{	
	switch(line)
	{
		case 1:PORTD = LINE_ONE;
			break;
		case 2:PORTD = LINE_TWO;
			break;
		case 3:PORTD = LINE_THREE;
			break;
		case 4:PORTD = LINE_FOUR;  
 	}                 
  	lcd_enable();
  	lcd_writedata(word);           //������ʾ����
}

void scan()
{
	if(RB0==1)
	{
		delay(10);
		if(RB0==1)
		{
			temp++;
			while(RB0!=0)
			{
				if(RB0==0)
				{
					delay(10);
					if(RB0==0)
						break;
				}
			}
		}
	}
	if(RB1==1)
	{
		delay(10);
		if(RB1==1)
		{
			humd++;
			while(RB1!=0)
			{
				if(RB1==0)
				{
					delay(10);
					if(RB1==0)
						break;
				}
			}
		}
	}
	if(RB2==1)
	{
		delay(10);
		if(RB2==1)
		{
			pm++;
			while(RB2!=0)
			{
				if(RB2==0)
				{
					delay(10);
					if(RB2==0)
						break;
				}
			}
		}
	}
}

uchar trans_to_ASCII(int num)
{
	switch(num)
	{
		case 0: return NUM_ZERO;
			break;
		case 1: return NUM_ONE;
			break;
		case 2: return NUM_TWO;
			break;
		case 3: return NUM_THREE;
			break;
		case 4: return NUM_FOUR;
			break;
		case 5: return NUM_FIVE;
			break;
		case 6: return NUM_SIX;
			break;
		case 7: return NUM_SEVEN;
			break;
		case 8: return NUM_EIGHT;
			break;
		case 9: return NUM_NINE;
	}
}

void temp_trans()
{
	int hund,ten,one;
	hund=temp/100;
	ten=(temp-(hund*100))/10;
	one=temp-(hund*100)-(ten*10);
	//wendu[6]=trans_to_ASCII(hund);
	wendu[6]=trans_to_ASCII(ten);
	wendu[7]=trans_to_ASCII(one);
}

void humd_trans()
{
	int hund,ten,one;
	hund=humd/100;
	ten=(humd-(hund*100))/10;
	one=humd-(hund*100)-(ten*10);
	shidu[6]=trans_to_ASCII(hund);
	shidu[7]=trans_to_ASCII(ten);
	shidu[8]=trans_to_ASCII(one);
}

void pm_trans()
{
	int hund,ten,one;
	hund=pm/100;
	ten=(pm-(hund*100))/10;
	one=pm-(hund*100)-(ten*10);
	pm25[7]=trans_to_ASCII(hund);
	pm25[8]=trans_to_ASCII(ten);
	pm25[9]=trans_to_ASCII(one);
}



void main()
{
	port_init();           //���ö˿ڳ�ʼ������
  	lcd_init();            //����LCD��ʼ������
	lcd_display(1,space);
	lcd_display(2,huanyingshiyong);
	lcd_display(3,welcome);
	lcd_display(4,space);
	delay(2000);
	lcd_display(2,space);
	lcd_display(3,space);
  	while(1)
  	{
		CLRWDT();            //�忴�Ź�
    	lcd_display(1,wendu);
		lcd_display(2,shidu);
		lcd_display(3,pm25);
		lcd_display(4,space);
		scan();
		temp_trans();
		humd_trans();
		pm_trans();
  	}
}