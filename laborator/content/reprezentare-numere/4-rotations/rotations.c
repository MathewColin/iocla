#include <stdio.h>

void rotate_right(int *number, int bits)
{
	/* TODO */
	bits = bits % 32;
	*number = (*number >> bits) | (*number << (32 - bits));
} 

void rotate_left(int *number, int bits)
{
	/* TODO */
	bits = bits % 32;
	*number = (*number << bits) | (*number >> (32 - bits));
}

int main()
{
	/* TODO: Test functions */
	int nr, rot;
	scanf("%d%d", &nr, &rot);
	rotate_left(&nr, rot); // rotate_right(&nr, rot);
	printf("%d\n", nr);
	return 0;
}

