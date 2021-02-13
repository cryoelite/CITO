#pragma once


#include<Windows.h>
#include<chrono>
#include<string>
#include<algorithm>
#include<conio.h>
#include<vector>
#include<math.h>
#include<thread>


enum class STATE {
	FIRST,
	SECOND,
	THIRD,
	DEFAULT,
};

class IFlag
{


	int hSize ;
	int wSize ;
	int totalSize;
	wchar_t* screen;
	double sinVal;
	const inline static double PI = 2 * acos(0.0);
	int axes;

	COORD coord;
	HANDLE hConsole;
	std::wstring swString;
	HANDLE defHandle;



	
	DWORD dBytesWritten{};

	std::chrono::system_clock::time_point tp1;
	std::chrono::system_clock::time_point tp2;

	void drawIt(STATE& state);
public:
	
	IFlag(int,int);
	void runApp(const int&, const int&);
	void setCSize(COORD);
	
	~IFlag();
};

