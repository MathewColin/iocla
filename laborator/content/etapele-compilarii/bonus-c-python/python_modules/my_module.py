def say(something='Something default'):
    print(something)

# TODO
# Definiți o nouă funcție care întoarce poziția primei
# apariții a celui de-al doilea șir în cadrul primului,
# dacă al doilea șir este un subșir al primului șir
# și -1 în caz contrar.

def subsir(haystack, needle):
	i = 0
	j = 0
	n = len(haystack)
	m = len(needle)
	if m == 0:
		return 0
	while i < n and n - i + 1 >= m:
		if haystack[i] == needle[i]:
			temp = i
			while j < m and i < n and needle[j] == needle[i]:
				i += 1;
				j += 1;
			if j == m:
				return temp
			i = temp + 1
			j = 0
		else:
			i += 1;
	return -1 

