#pragma once

#include<string>
#include<Windows.h>
#include<chrono>
#include<algorithm>
#include<conio.h>

class IFlag
{

	inline static int hSize = 852;
	inline static int wSize = 480;
	inline static int totalSize = hSize * wSize;
	wchar_t* screen;
	wchar_t* swbuffer;
	
	std::wstring swString;
	

	HANDLE hConsole;
	DWORD dBytesWritten{};
	
	std::chrono::system_clock::time_point tp1;
	std::chrono::system_clock::time_point tp2;

	
public:
	IFlag();
	void runApp();
};

