#include<iostream> 
int main(){ 
    auto a{8L};
    auto c{2};
    auto b{a*c};
    std::cout<<typeid(b).name()<<std::endl; 
    return 0; 
} 
// cl /EHsc /std:c++17