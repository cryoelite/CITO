#include <iostream>

class P
{
public:
	static inline int c{ 20 };
	void f1(double a);
	static void f2(double b)
	{

	}
};

int main()
{
	using namespace std;
	
	P::c = 2;

	return 0;
}