#include <stdio.h>

int main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2, 100};
	int max;
	int i;
	int n;
	/* TODO: Implement finding the maximum value in the vector */
	max = v[0];
	i = 0;
	n = sizeof(v) / sizeof(int);
Det_Max:
	if (max < v[i])
		max = v[i];
	i++;
	if (i < n)
		goto Det_Max;

	printf("%d\n", max);
	/*(void) i;
	(void) max;*/
}
