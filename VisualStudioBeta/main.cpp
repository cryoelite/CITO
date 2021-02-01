#include<iostream>
#include<Windows.h>
#include<memory>
#include<chrono>
#include<thread>
int main()
{
	using namespace std;
	constexpr int hSize = 120;
	constexpr int wSize = 40;
	constexpr int totalSize = hSize * wSize;
	wchar_t* screen = new wchar_t[totalSize];
	HANDLE hConsole = CreateConsoleScreenBuffer(GENERIC_READ | GENERIC_WRITE, 0, NULL, CONSOLE_TEXTMODE_BUFFER, NULL);
	DWORD dBytesWritten{};
	SetConsoleActiveScreenBuffer(hConsole);

	screen[totalSize - 1] = '\0';
	screen[4] = 'X';



	WriteConsoleOutputCharacter(hConsole, screen, totalSize, { 0,0 }, &dBytesWritten);

	return 0;

}