#include <stdio.h>

int main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = 3; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
	int m;
	/* TODO: Implement binary search */
Cont:
	m = start + (end - start) / 2;
	if (v[m] == dest)
		goto M_found;
	if (start > end) {
		m = -1;
		goto M_notfound;
	}
	if (v[m] < dest) {
		start = m + 1;
		goto Cont;
	}
	if (v[m] > dest) {
		end = m - 1;
		goto Cont;
	}
M_notfound:
	printf("Dest not found\n");
M_found:
	if (m != -1)
		printf("%d\n", m);
	return 0;
}
