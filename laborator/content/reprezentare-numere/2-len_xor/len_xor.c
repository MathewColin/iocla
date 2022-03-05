#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define max_length 25

int my_strlen(const char *str)
{
	/* TODO */
	int adv = 1;
	/*for (int i = 0; adv; i++) {
		if (!(*(str + i)))
			return i;
	}*/
	int i = 0;
	while (adv) {
		if (!(*(str + i)))
			return i;
		i++;
	}
	return -1;
}

void equality_check(const char *str)
{
	/* TODO */
	int i = 0, l;
	l = my_strlen(str);
	while (i < l) {
		int x = i + (1 << i);
		if (x >= l)
			x %= l;
		if (!(*(str + i) ^ *(str + x)))
			printf("Address of %c is: %p\n", *(str + i), str + i);
		i++;
	}
}

int main(void)
{
	/* TODO: Test functions */
	char *str = (char *)malloc(max_length);
	if (!str) {
		printf("Malloc failed\n");
		exit(-1);
	}
	scanf("%s", str);
	printf("Lungimea sirului este %d\n", my_strlen(str));
	equality_check(str);
	free(str);
	return 0;
}

