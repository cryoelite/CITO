#include <iostream>
#include <vector>
#include <numeric>
#include <math.h>

std::vector<int> genPrime(const int& last)
{

    using namespace std;
    vector<int> arr(last);
    iota(arr.begin(), arr.end(), 0);
    arr[0] = 0;
    arr[1] = 0;
    for (int i{ 2 }; i < arr.size(); ++i)
    {
        for (int j{ 2 }; i * j < arr.size(); ++j)
            arr[i * j] = 0;
    }

    return arr;
}

bool checkPrime(int i, const std::vector<int>& arr)
{
    if (arr[i] == 0)
        return false;
    return true;
}



int main()
{

    using namespace std;
    
    
    cout << "ur mum gay";
    return 0;
}
