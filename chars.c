#include <stdio.h>



int main(int argc, char* argv[]) {

	char displayString[] = "Hello, world.\n";
	displayString[2] += 1;
	printf("%s", displayString);

	return 0;
}
