#include <iostream>
#include<chrono>

class Timer
{
	std::chrono::steady_clock::time_point startPoint;
	Timer()
	{
		startPoint = std::chrono::steady_clock::now();
	}
	void calcTime()
	{
		auto endPoint = std::chrono::steady_clock::now();
		std::cout << "\n Time taken: " << std::chrono::duration_cast<std::chrono::milliseconds>(endPoint - startPoint).count() << std::endl;
	}
};

enum dir
{
	DEF,
	INCR,
	DECR,
};
void sortedFuck(int* arr, int arrSize)
{
	using namespace std;


}

bool comparator(int& firstElem, int& secondElem, dir biDir)
{
	if (biDir == INCR)
	{
		if (firstElem < secondElem)
			return true;
		else
			return false;
	}
	if (firstElem > secondElem)
		return true;
	else
		return false;

}


int main()
{
	using namespace std;
	int arr[]{ 3,7,4,8,6,2,1,5 };
	int arrSize = 8;
	if (arrSize % 2 != 0)
		cout << "Need an even sized sequence to sort.";
	else
		sortedFuck(arr, 8);
	return 0;
}