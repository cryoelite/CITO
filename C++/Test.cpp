#include<iostream>
#include<Windows.h>
#include<memory>
#include<chrono>
#include<thread>
#include<algorithm>
#include<string>
#include<conio.h>
int main()
{
	using namespace std;
	constexpr int hSize = 120;
	constexpr int wSize = 40;
	constexpr int totalSize = hSize * wSize;
	wchar_t* screen = new wchar_t[totalSize];
	wchar_t* swbuffer = new wchar_t[hSize];
	fill(&swbuffer[0], &swbuffer[hSize - 1], '_');
	wstring swString{ L"FPS=%3.2f" };
	wcscpy_s(swbuffer, swString.size() + 1, swString.c_str());

	HANDLE hConsole = CreateConsoleScreenBuffer(GENERIC_READ | GENERIC_WRITE, 0, NULL, CONSOLE_TEXTMODE_BUFFER, NULL);
	DWORD dBytesWritten{};
	SetConsoleActiveScreenBuffer(hConsole);
	auto tp1 = chrono::system_clock::now();
	auto tp2 = chrono::system_clock::now();
	system("Pause");
	while (1)
	{
		tp2 = chrono::system_clock::now();
		chrono::duration<float> elapsedTime = tp2 - tp1;
		tp1 = tp2;
		float fEp = elapsedTime.count();
		fill(&screen[0], &screen[totalSize - 1], 'O');
		screen[totalSize - 1] = '\0';


		swprintf_s(screen, hSize + 1, swbuffer, 1.0f / fEp);
        
		WriteConsoleOutputCharacterA(hConsole,screen, totalSize, { 0,0 }, &dBytesWritten);
		if (_kbhit())
			break;
	}cout << "Ya";
	return 0;

}