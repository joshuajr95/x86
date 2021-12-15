#include <stdio.h>
#include <stdlib.h>


int add(int x, int y)
{
	return x + y;
}


int main(int argc, char *argv[])
{
	int x = atoi(argv[0]);
	int y = atoi(argv[1]);
	printf("Val: %d\n", add(x, y));

	return 0;
}
