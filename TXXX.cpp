#include <iostream>
#include <set>
#include <algorithm>
#include <math.h>
#include <vector>

void largestNumber(int &n, int &k)
{
    using namespace std;

    vector<int> revN{};
    set<int> answer{};
    vector<int> origN{};
    vector<int> answerN{};
    while (n != 0)
    {
        int temp{n % 10};
        n /= 10;
        revN.push_back(temp);
    }
    int num{(int)revN.size() - k};
    while (next_permutation(revN.begin(), revN.end()))
    {
        int elem{};
        auto it{revN.begin()};
        for (int i{num - 1}; i >= 0; --i)
        {
            elem += pow(10, i) * (*it++);
        }
        answer.insert(elem);
    }
    int maxElem{*max_element(answer.begin(), answer.end())};
    while (maxElem != 0)
    {
        int temp{maxElem % 10};
        maxElem /= 10;
        origN.push_back(temp);
    }
    reverse(origN.begin(),origN.end());
    

    
}
int main()
{
    int n{};
    int k{};
    std::cin >> n;
    std::cin.ignore(256, '\n');
    std::cin >> k;
    std::cin.ignore(256, '\n');
    largestNumber(n, k);
}