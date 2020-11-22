#include <chrono>
#include <iostream>
#include <math.h>
class TP
{
    std::chrono::system_clock::duration tp{};

public:
    TP()
    {
        tp = std::chrono::system_clock::now().time_since_epoch();
    }
    int now()
    {
        auto currentTime{std::chrono::system_clock::now().time_since_epoch()};
        auto timeElapsed = std::chrono::duration_cast<std::chrono::microseconds>(currentTime - tp);
        return timeElapsed.count();
    }
};

int fact(int n)
{
    if (n == 0)
        return 1;
    return n * fact(n - 1);
}

int main()
{
    using namespace std;

    TP timeObject;
    int num = 6;
    double calc{};
    double C{4266880 * sqrt(10005)};
    double K{6}, M{1}, L{13591409}, X{1};
    for (int i{}; i < num; i++)
    {
     /*    double chS{}; */
        double Mi{}, Li{}, Xi{}, Ki{};
       /*  chS = fact(6 * i) * (545140134 * i) + 13591409;
        chS /= fact(3 * i) * pow(fact(i), 3) * pow(-262537412640768000, i); */
        Ki = K + 12;
        Mi = M * ((pow(K, 3) - (16 * K)) / pow(i + 1, 3));
        Li = L + 545140134;
        Xi = X * (-262537412640768000);
        X = Xi;
        K = Ki;
        M = Mi;
        L = Li;
        calc = C * pow((Mi * Li) / Xi, -1);
    }
    cout << "Time taken:" << timeObject.now() << "\nNumber:" <<  calc;
    return 0;
}