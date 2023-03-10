#include <iostream>
class X {  // no final means class can be inherited
public:
    virtual void yo() {  /// virtual function, means it can be overridden
    }
    virtual ~X() {  // normal destructor
        std::cout << "Xd" << '\n';
    }
};

class Y : public X {
public:
    void yo() override {}
    virtual ~Y() { std::cout << "Yd" << '\n'; }
};
class Z : public Y {
public:
    void yo() override {}
    virtual ~Z() { std::cout << "Zd" << '\n'; }
};

int main() {
    Z z{};
    X* yp{ &z };
    delete yp;

}
