#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char *str)
{
	/* TODO */
	int adv = 1;
	int i = 0;
	while (adv) {
		if (!(*(str + i)))
			return i;
		i++;
	}
	return -1;
}

void mirror(char *s)
{
	/* TODO */
	int i = 0;
	int l = my_strlen(s) / 2;
	int L = my_strlen(s);
	while (i < l) {
		char c = *(s + i);
		*(s + i) = *(s + L - i - 1);
		*(s + L - i - 1) = c;
		i++;
	}
	return;
}

int main()
{
	/* TODO: Test function */
	char s[101];
	scanf("%s", s);
	mirror(s);
	printf("%s\n", s);
	return 0;
}

