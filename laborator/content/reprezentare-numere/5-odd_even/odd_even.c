#include <stdio.h>
#include <stdlib.h>

#define NUMBER_of_BITS 32

void print_binary(int number, int nr_bits)
{
	/* TODO */
	printf("0b");
	for (int i = nr_bits - 1; i > 0; i--) {
		int mask = (1 << i);
		if (number & mask)
			printf("1");
		else
			printf("0");
	}
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	/* TODO */
	for (int i = 0; i < n; i++) {
		int mask = 1;
		if (mask & (*(numbers + i)))
			printf("Ox%08x\n", *(numbers + i)); // odd number
		else
			print_binary(*(numbers + i), NUMBER_of_BITS); // even number
	}

}

int main()
{
	/* TODO: Test functions */
	int v[] = {214, 71, 84, 134, 86}; //example
	int n = 5;
	check_parity(v, n);
	return 0;
}
