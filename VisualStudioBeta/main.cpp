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
    int num{};

   
    cin >> num;
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
    int answer{};
    vector<int> arr{ 0,0,1,1,0,1,0,1,0,1};
    while (num != 0)
    {
        int temp{ num % 10 };
        num = num / 10;
        if (arr[temp] == 1)
            answer += temp;
    }
    
    cout << answer;
    return 0;
}
