#include <stdio.h>


int add(int x, int y)
{
	return x + y;
}

int main(int argc, char *argv[])
{
	int x = 5;
	int y = 4;

	printf("Result: %d\n", add(x, y));

	return 0;
}
