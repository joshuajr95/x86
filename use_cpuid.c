#include <stdio.h>



int main(int argc, char *argv[])
{
	char a[12];
	asm(
		"mov %eax, 0h"
		"cpuid"
		: "=r" (a)
		: "r" ()
		: "eax");
	

	return 0;
}
