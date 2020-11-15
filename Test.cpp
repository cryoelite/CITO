#include<iostream>
#include<vector>
#include<string>
#include<sstream>
#include<algorithm>
int main()
{
    using namespace std;
    int num{};
    vector<int> arr{};
    string inp{};
    
    cin>>num;
    cin.ignore(numeric_limits<streamsize>::max(),'\n');
    getline(cin,inp);
    stringstream temp(inp);
    while(getline(temp,inp,' '))
        arr.push_back(stoi(inp));
    int arSize{(int)arr.size()};
    sort(arr.begin(),arr.end());
    cout<<arr[(arSize-1)]+arr[(arSize-2)];
    return 0;
}