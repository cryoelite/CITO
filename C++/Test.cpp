#include<iostream> 
int main(){ 
    auto a{0.1};
    auto b{0.2};
    auto c{0.3};
    std::cout<<"it is "<<std::boolalpha<<(a+b==c)<<std::endl; 
    return 0; 
} 
// cl /EHsc /std:c++17