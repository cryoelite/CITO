#include<iostream>
#include<sstream>
#include<vector>
#include<string>
#include "a1.h"

class Yo : public Pop
{
public:
	int a{};
	int b{};
	int c{};
	using Pop::Pop;
};
int main()
{
	using namespace std;
	Yo yo{};
	cout << yo.a << " " << yo.b;
	/*	FILE* file;
	errno_t op = freopen_s(&file, "lolo.txt", "r", stdin);
	if (op == EINVAL)
	{
		cout << "Ya , not doing it";
	}
	else {


		vector<string> sArray{};
		string temp{};
		while (getline(cin, temp))
		{
			sArray.push_back(temp);
		}

		for (auto& x : sArray)
			cout << "\n" << x;
	}*/
	return 0;

}
