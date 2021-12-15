#include <stdio.h>
#define MASK 0x100



int main (int argc, char* argv[]) {
	int a = 0x1301;
	
	if(a & MASK) {
		return 1;
	}
	else {
		return 2;
	}
}
