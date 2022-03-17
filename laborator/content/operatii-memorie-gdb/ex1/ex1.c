#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {
	int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};
	int n = sizeof(v) / sizeof(int);
	unsigned char *char_ptr = (unsigned char*)v;
	printf("Parcurgere din octet in octet:\n");
	for (int i = 0; i < sizeof(v); i++)
		printf("%p -> 0x%x\n", char_ptr + i, *(char_ptr + i));
    unsigned short *short_ptr = (unsigned short*)v;
    printf("Parcurgere din 2 octeti in 2 octeti\n");
    for (int i = 0; i < sizeof(v) / sizeof(short); i++)
    	printf("%p -> 0x%x\n", short_ptr + i, *(short_ptr + i));
    int *int_ptr = v;
    printf("Parcurgere din 4 octeti in 4 octeti\n");
    for (int i = 0; i < n; i++)
    	printf("%p -> 0x%x\n", int_ptr + i, *(int_ptr + i));
    return 0;
}
