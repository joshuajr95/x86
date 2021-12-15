#include <stdio.h>


int thing = 5;

int static_thing = 20;

void testDirection(int *addressToTest) {
	int tester;
	
	if(&tester < addressToTest) {
		printf("Stack growing downward.");
	}
	
	else if(&tester > addressToTest) {
		printf("Stack growing upward.");
	}

	else {
		printf("Some unknown error occurred.");
	}
}


int main(int argc, char* argv[]) {
	int testThing;
	int secondTestThing;

	testDirection(&testThing);
}
