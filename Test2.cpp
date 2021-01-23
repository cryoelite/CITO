#include <iostream>
#include <string>
using namespace std;

int ArrayChallenge(string strArr[], int arrLength) {
  int num{};
  for(int i{};i<arrLength;++i)
  {
      if(strArr[0][i]!=strArr[1][i])
        num++;
  }
  return num;

}

int main(void) { 
   
  // keep this function call here
  string A[] = {"10011","10100"};
  int arrLength = sizeof(A) ;
  cout<<arrLength<<"\n";
  cout << ArrayChallenge(A, arrLength);
  return 0;
    
}