#include "IFlag.h"


IFlag::IFlag()
{
	screen = new wchar_t[totalSize];
	swbuffer = new wchar_t[hSize];
	std::fill(&swbuffer[0], &swbuffer[hSize - 1], '_');
	swString = L"FPS=%3.2f" ;
	wcscpy_s(swbuffer, swString.size() + 1, swString.c_str());
	hConsole = CreateConsoleScreenBuffer(GENERIC_READ | GENERIC_WRITE, 0, NULL, CONSOLE_TEXTMODE_BUFFER, NULL);
	SetConsoleActiveScreenBuffer(hConsole);
	tp1 = std::chrono::system_clock::now();
	tp2 = std::chrono::system_clock::now();

}

void IFlag::runApp()
{
	std::fill(&screen[0], &screen[totalSize - 1], 'O');
	screen[totalSize - 1] = '\0';
	while (1)
	{
		tp2 = std::chrono::system_clock::now();
		std::chrono::duration<float> elapsedTime = tp2 - tp1;
		tp1 = tp2;
		float fEp = elapsedTime.count();
		
		


		swprintf_s(screen, (uintmax_t)hSize + 1, swbuffer, 1.0f / fEp);

		WriteConsoleOutputCharacter(hConsole, screen, totalSize, { 0,0 }, &dBytesWritten);
		if (_kbhit())
			break;
	}
}


