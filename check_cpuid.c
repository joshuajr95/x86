#include <stdio.h>




int main(int argc, char *argv[])
{
	int output;
	asm ( "pushfd;
		pop %eax;
		or %eax, 00200000h;

	return 0;
}
