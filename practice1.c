#include <stdio.h>



int main(int argc, char* argv[]) {
	int a = 1, b = 2;
	
	if(a==b) {
		return 1;
	}
	
	if(a > b) {
		return 2;
	}

	if(a < b) {
		return 3;
	}
	
	return -1;
}
