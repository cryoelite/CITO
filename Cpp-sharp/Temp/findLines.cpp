#include <iostream>
#include <filesystem>
#include <fstream>

using namespace std;
using namespace filesystem;
int dirIterator(directory_iterator dir1, int lineCount = 0)
{

	while (dir1 != directory_iterator())
	{

		auto dir = *dir1++;
		auto pathObj = dir.path();
		if (pathObj.filename().string()[0] != '.'){
			if (pathObj.has_extension())
			{

				auto filePath = dir.path();
					auto fileExtension = filePath.extension();

					if (fileExtension == ".dart")
					{
						ifstream fileObject{ filePath };
							string line;
							while (!getline(fileObject, line).eof())
								++lineCount;
					}
			}
			else {

				auto dir2 = directory_iterator(pathObj);
				lineCount = dirIterator(dir2, lineCount);
			}
		}
		
	}

	return lineCount;
}

int main()
{
	auto folderPath = filesystem::current_path();
	auto dir1 = directory_iterator(folderPath);
	cout << "Line count is : " << dirIterator(dir1) << endl;
	return 0;
}