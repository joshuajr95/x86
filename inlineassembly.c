#include <stdio.h>



int main(int argc, char *argv[])
{
	
	__asm__("movl %ecx, %eax");

	printf("Got here!");

	return 0;
}
