#include<stdio.h> 
int main(){ 
    int i=2, j=0; 
    j = (i++ +  ++i)* ++i; 
    printf("%d", j); 
    return 0; 
} 