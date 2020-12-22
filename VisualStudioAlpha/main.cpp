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

void sortedFuck(int* arr)
{
	using namespace std;
	cout << arr[5];

}


int main()
{
	using namespace std;
	int arr[]{ 3,7,4,8,6,2,1,5 };
	sortedFuck(arr);
	return 0;
}