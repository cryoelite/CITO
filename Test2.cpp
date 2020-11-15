#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
int main()
{
    using namespace std;
    string inp{};
    getline(cin, inp);
    vector<string> participants{};
    vector<string> Totaldifference{};
    vector<string> winners{};

    auto splitter = [&](vector<string> &names) mutable {
        stringstream inpStream{inp};
        inpStream << inp;
        string temp;
        while (getline(inpStream, temp, ' '))
            names.push_back(temp);
    };
    splitter(participants);

    getline(cin, inp);

    splitter(winners);
    sort(participants.begin(), participants.end());
    sort(winners.begin(), winners.end());
    set_difference(participants.begin(), participants.end(), winners.begin(), winners.end(), Totaldifference.begin());
    /* auto ib = winners.begin();
    participants.erase(std::remove_if(
        participants.begin(), participants.end(),
        [&](string x) -> bool {
            while (ib != winners.end() && *ib < x)
                ++ib;
            return (ib != winners.end() && *ib == x);
        })); */
    for (auto &x : Totaldifference)
    {
        cout << x << " ";
    }
    return 0;
}