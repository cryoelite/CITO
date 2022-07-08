#include <iostream>
#include<algorithm>
#include<string>
#include<string_view>

using namespace std;

bool isLetter(char letter) {
    auto intLetter{ static_cast<int>(tolower(letter)) };
    if ((intLetter >= 97 && intLetter <= 122) || intLetter == 32)
        return false;
    return true;

}
bool isPalindrome(string inp) {

    auto removedIt{ remove_if(inp.begin(),inp.end(), &isLetter) };
    inp.erase(removedIt,inp.end());

    cout << inp.size();
    auto startIt{ inp.begin() };
    auto endIt{ inp.end()-1 };
    while (startIt != endIt)
    {
        if (*startIt != *endIt)
            return false;
         ++startIt;
        --endIt;
    }

    return true;
    
}
int main()
{
    cout<<isPalindrome("abc,.[;sdxxdscb;'.a");
}
