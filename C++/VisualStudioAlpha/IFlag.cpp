#include "IFlag.h"


IFlag::IFlag(int w, int h)
{


	wSize = w;
	hSize = h;
	totalSize = hSize * wSize;
	screen = new wchar_t[totalSize];
	swString = L"FPS=";
	axes = 3;

	defHandle = GetStdHandle(STD_OUTPUT_HANDLE);
	hConsole = CreateConsoleScreenBuffer(GENERIC_READ | GENERIC_WRITE, 0, NULL, CONSOLE_TEXTMODE_BUFFER, NULL);
	SetConsoleActiveScreenBuffer(hConsole);
	tp1 = std::chrono::system_clock::now();
	tp2 = std::chrono::system_clock::now();
	coord.X = 0;
	coord.Y = 0;
	sinVal = 0;

}

void IFlag::runApp(const int& x, const int& y)
{

	screen[totalSize - 1] = '\0';
	coord.X = x;
	coord.Y = y;
	STATE state = STATE::FIRST;
	std::fill(&screen[0], &screen[totalSize - 1], ' ');
	while (!_kbhit() && state != STATE::DEFAULT)
	{

		tp2 = std::chrono::system_clock::now();
		std::chrono::duration<float> elapsedTime = tp2 - tp1;
		tp1 = tp2;
		std::wstring fEp{ swString + std::to_wstring(1.0f / elapsedTime.count()) };

		WriteConsoleOutputCharacterW(hConsole, fEp.c_str(), 10, { 0,0 }, &dBytesWritten);

		drawIt(state);

		std::this_thread::sleep_for(std::chrono::milliseconds(25));
	}

}

void IFlag::drawIt(STATE& state)
{
	using namespace std;

	switch (state)
	{
	case STATE::FIRST:
		if (axes < totalSize)
		{
			screen[axes] = 'X';
			axes += wSize;
		}
		else
		{
			axes = (hSize / 2) * wSize;
			state = static_cast<STATE>(static_cast<int>(state) + 1);
		}
		break;
	case STATE::SECOND:
		if (axes < ((hSize / 2) * wSize) + wSize)
			screen[axes++] = 'X';
		else
		{
			axes = +3;
			state = static_cast<STATE>(static_cast<int>(state) + 1);
		}
		break;
	case STATE::THIRD:
		if (axes < wSize)
		{
			int temp = sin(sinVal * PI) * 100;
			
			sinVal += 0.01;
			temp = (temp * hSize) / 100;
			
			if (temp <= 0)
				temp = abs(temp/2) + (hSize / 2);
			else
				temp = (hSize / 2) - (temp/2);
			
			screen[(temp*wSize)+axes] = 'O';
			axes++;
		}
		else
			state = static_cast<STATE>(static_cast<int>(state) + 1);
		break;
	case STATE::DEFAULT:
		break;
	default:
		break;
	}

	WriteConsoleOutputCharacterW(hConsole, screen, totalSize, coord, &dBytesWritten);


}

IFlag::~IFlag()
{

	WriteConsoleOutputCharacterW(defHandle, screen, totalSize, { 0,5 }, &dBytesWritten);
	CloseHandle(hConsole);
	delete screen;
}


void IFlag::setCSize(COORD coord)
{
	CONSOLE_SCREEN_BUFFER_INFOEX consoleSize;
	consoleSize.cbSize = sizeof(consoleSize);
	GetConsoleScreenBufferInfoEx(hConsole, &consoleSize);

	consoleSize.dwSize = coord;
	consoleSize.srWindow.Left = 0;
	consoleSize.srWindow.Right = coord.X;
	consoleSize.srWindow.Top = 0;
	consoleSize.srWindow.Bottom = coord.Y;
	consoleSize.dwMaximumWindowSize = coord;

	SetConsoleScreenBufferInfoEx(hConsole, &consoleSize);
	SetConsoleScreenBufferInfoEx(defHandle, &consoleSize);
	CONSOLE_FONT_INFOEX consoleFont;
	consoleFont.cbSize = sizeof(consoleFont);
	consoleFont.nFont = 0;
	consoleFont.dwFontSize.X = 8;
	consoleFont.dwFontSize.Y = 7;
	consoleFont.FontFamily = FF_DONTCARE;
	consoleFont.FontWeight = FW_NORMAL;
	
	SetCurrentConsoleFontEx(hConsole, false, &consoleFont);
	SetCurrentConsoleFontEx(defHandle, false, &consoleFont);
}
