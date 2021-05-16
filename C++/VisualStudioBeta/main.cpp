#include <iostream>

int test() {
	auto a{ 2 };
		return a++;
	}

int test2() {
	auto a{ 3 };
	return ++a;
}

int test3() {
	auto a{ 4 };
	a += 1;
	return a;
}
int main()
{
	auto a1{ test() };
	auto a2{ test2() };
	auto a3{ test3() };
	std::cout << "Values are " << a1 << " " << a2 << " " << a3<<std::endl;
	
	return 0;
}