#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

int my_strcmp(const char *s1, const char *s2);
void *my_memcpy(void *dest, const void *src, size_t n);
char *my_strcpy(char *dest, const char *src);

int main() {
	char s1[] = "Abracadabra";
	char s2[] = "Abracababra";
	char src[] = "Learn IOCLA, you must!";
	char *dest = malloc(sizeof(src));

	/*
	Decomentati pe rand cate un assert pe masura ce implementati o functie.
	Daca functia voastra este implementata corect atunci asertia se va realiza
	cu succes. In caz contrar, programul va crapa.
	*/
	assert(my_strcmp(s1, s2) == strcmp(s1, s2));
	assert(my_memcpy(dest, src, sizeof(src)) == memcpy(dest, src, sizeof(src)));
	assert(my_strcpy(dest, src) == strcpy(dest, src));
	free(dest);

	return 0;
}

int my_strcmp(const char *s1, const char *s2)
{
	int l1, l2, L;
	l1 = strlen(s1);
	l2 = strlen(s2);
	if (l1 < l2)
		L = l1;
	else
		L = l2;
	for (int i = 0; i <= L; i++) {
		if (*(s1 +i) != *(s2 + i))
			return s1[i] - s2[i];
	}
	return 0;
}

void *my_memcpy(void *dest, const void *src, size_t n)
{
	char *d = (char *)dest;
	char *s = (char *)src;
	for (int i = 0; i < n; i++)
		*(d + i) = *(s + i);
	return (void *)d;
}

char *my_strcpy(char *dest, const char *src)
{
	int L = strlen(src);
	for (int i = 0; i <= L; i++)
		*(dest + i) = *(src + i);
	return (char *)dest;
}
