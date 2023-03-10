#include<iostream>
#include "x.h"

template<typename T>
T yo(T x, T y) {
	return x + y;
}

void pp() {
	std::cout<< yo(2, 3) <<'\n';
}
