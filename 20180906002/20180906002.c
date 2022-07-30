#include<pic.h>
#define uchar unsigned char
#define uint unsigned int
__CONFIG(0x3B31);

void delay(uint x)
{
	uint a,b;
	for(a=x;a>0;a--)
		for(b=110;b>0;b--);
}

void main(){
	uchar i;
	TRISD = 0x00;
	while(1){
		PORTD = 0x01;
		for(i=0;i<8;i++)
		{
			delay(500);
			PORTD=PORTD<<1;
		}
	}
}
