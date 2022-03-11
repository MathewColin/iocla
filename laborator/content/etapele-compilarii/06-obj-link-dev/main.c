extern int price, qty;

int main(void)
{
	/*
	 * TODO: Make it so you print:
	 *    price is 21
	 *    quantity is 42
	 * without directly calling a printing function from an existing
	 * library(do NOT use printf, fprintf, fwrite, ...).
	 */
	set_price(21);
	qty = 42;
	print_price();
	print_quantity();
	return 0;
}
