#include<iostream>
#include<opencv2/opencv.hpp>
#include "IFlag.h"
#include<string>


int main()
{
	using namespace std;
	using namespace cv;

	/*constexpr int hSize = 90;
	constexpr int wSize = 160;

	IFlag flag(wSize,hSize);
	flag.setCSize({ (SHORT)wSize,(SHORT)hSize });
	flag.runApp(0,1);

	cout << "Ya";*/
	String imageFile{ "G:/img/qi-sheng-luo-009.jpg" };
	char** state{};
	Mat image{ imread(imageFile) };
	if (image.empty())
		return -1;
	String windowName{ imageFile[0] };


		return 0;
}