#include<pic.h>


__CONFIG(0x3B31);
void main(){
	TRISD = 0xfe;
	PORTD = 0X01;
	//TRISD2 = 0;		//Î»²Ù×÷
	//RD2 = 1;
	while(1);
}