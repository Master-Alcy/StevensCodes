#include <iostream>
#include <cstdint>

int main() {
	char e = 'a'; // 1 byte (usually)    sizeof(char) == 1
	short d = 1h; // >= 2 bytes (16 bits) <= int
	int a = 1; //  4 bytes  signed or unsigned???
	signed int sa;
	unsigned int ua;
	long b = 124124125515L; // short <= int <= long <= long long 
  long long c = 12412151241241LL; //
	uint32_t x;
	uint64_t y;
}
