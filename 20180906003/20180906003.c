#include<pic.h>
#define uchar unsigned char
#define uint unsigned int
__CONFIG(0x3B31);

const uchar table[] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71};

void delay(uint x)
{
	uint a,b;
	for(a=x;a>0;a--)
		for(b=110;b>0;b--);
}

void disp(uchar num[4])
{
	PORTD = table[num[0]];
	PORTA = 0x08;
	delay(2); 	
	PORTD = table[num[1]];
	PORTA = 0x04;
	delay(2); 	
	PORTD = table[num[2]];
	PORTA = 0x02;
	delay(2); 	
	PORTD = table[num[3]];
	PORTA = 0x01;
	delay(2); 	
}

void dispDelay(uchar num[4])
{
	for(int i = 0;i < 125;i++)	
		disp(num);
}

void main()
{
	TRISA = 0;
	TRISD = 0;
	uchar num[4] = {0,0,0,0};
	while(1)
	{	
		dispDelay(num);
		num[3]++;
		if(num[3]==10)
		{
			num[3] = 0;
			num[2]++;
		}
		if(num[2]==10)
		{
			num[2] = 0;
			num[1]++;
		}
		if(num[1]==10)
		{
			num[1] = 0;
			num[0]++;
		}
		if(num[0]==10)
		{
			num[0] = 0;
			num[1] = 0;
			num[2] = 0;
			num[3] = 0;
		}
		
	}
	while(1);
}