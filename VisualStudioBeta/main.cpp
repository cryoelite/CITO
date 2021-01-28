#include <cmath>
#include <iostream>
#include <cstring>

#ifndef _UNISTD_H
#define _UNISTD_H    1

/* This is intended as a drop-in replacement for unistd.h on Windows.
 * Please add functionality as neeeded.
 * https://stackoverflow.com/a/826027/1202830
 */

#include <stdlib.h>
#include <io.h>
#include "getopt.h" /* getopt at: https://gist.github.com/ashelly/7776712 */
#include <process.h> /* for getpid() and the exec..() family */
#include <direct.h> /* for _getcwd() and _chdir() */

#define srandom srand
#define random rand

 /* Values for the second argument to access.
	These may be OR'd together.  */
#define R_OK    4       /* Test for read permission.  */
#define W_OK    2       /* Test for write permission.  */
	//#define   X_OK    1       /* execute permission - unsupported in windows*/
#define F_OK    0       /* Test for existence.  */

#define access _access
#define dup2 _dup2
#define execve _execve
#define ftruncate _chsize
#define unlink _unlink
#define fileno _fileno
#define getcwd _getcwd
#define chdir _chdir
#define isatty _isatty
#define lseek _lseek
/* read, write, and close are NOT being #defined here, because while there are file handle specific versions for Windows, they probably don't work for sockets. You need to look at your app and consider whether to call e.g. closesocket(). */

#ifdef _WIN64
#define ssize_t __int64
#else
#define ssize_t long
#endif

#define STDIN_FILENO 0
#define STDOUT_FILENO 1
#define STDERR_FILENO 2
/* should be in some equivalent to <sys/types.h> */
typedef __int8            int8_t;
typedef __int16           int16_t;
typedef __int32           int32_t;
typedef __int64           int64_t;
typedef unsigned __int8   uint8_t;
typedef unsigned __int16  uint16_t;
typedef unsigned __int32  uint32_t;
typedef unsigned __int64  uint64_t;

#endif /* unistd.h  */
#include <windows.h>
#define PI 3.14159265358979323846
using namespace std;

//declaration
void cross(double r[3], double a[3], double b[3]);
double magnitute(double r[3]);
void normalize(double r[3]);
double dot(double a[3], double b[3]);
void transformVector(double vec[3], const double m[16]);
void invert(double inv[16], const double matrix[16]);
float sign(float Ax, float Ay, float Bx, float By, float Cx, float Cy);
int orientation(int p[2], int q[2], int r[2]);

void transformVector(double vec[3], const double m[16])
{
    double 	tx = vec[0] * m[0] + vec[1] * m[4] + vec[2] * m[8] + m[12],
        ty = vec[0] * m[1] + vec[1] * m[5] + vec[2] * m[9] + m[13],
        tz = vec[0] * m[2] + vec[1] * m[6] + vec[2] * m[10] + m[14];
    vec[0] = tx;
    vec[1] = ty;
    vec[2] = tz;
}

void invert(double inv[16], const double matrix[16])
{
    double det;
    int i;

    inv[0] = matrix[5] * matrix[10] * matrix[15] -
        matrix[5] * matrix[11] * matrix[14] -
        matrix[9] * matrix[6] * matrix[15] +
        matrix[9] * matrix[7] * matrix[14] +
        matrix[13] * matrix[6] * matrix[11] -
        matrix[13] * matrix[7] * matrix[10];

    inv[4] = -matrix[4] * matrix[10] * matrix[15] +
        matrix[4] * matrix[11] * matrix[14] +
        matrix[8] * matrix[6] * matrix[15] -
        matrix[8] * matrix[7] * matrix[14] -
        matrix[12] * matrix[6] * matrix[11] +
        matrix[12] * matrix[7] * matrix[10];

    inv[8] = matrix[4] * matrix[9] * matrix[15] -
        matrix[4] * matrix[11] * matrix[13] -
        matrix[8] * matrix[5] * matrix[15] +
        matrix[8] * matrix[7] * matrix[13] +
        matrix[12] * matrix[5] * matrix[11] -
        matrix[12] * matrix[7] * matrix[9];

    inv[12] = -matrix[4] * matrix[9] * matrix[14] +
        matrix[4] * matrix[10] * matrix[13] +
        matrix[8] * matrix[5] * matrix[14] -
        matrix[8] * matrix[6] * matrix[13] -
        matrix[12] * matrix[5] * matrix[10] +
        matrix[12] * matrix[6] * matrix[9];

    inv[1] = -matrix[1] * matrix[10] * matrix[15] +
        matrix[1] * matrix[11] * matrix[14] +
        matrix[9] * matrix[2] * matrix[15] -
        matrix[9] * matrix[3] * matrix[14] -
        matrix[13] * matrix[2] * matrix[11] +
        matrix[13] * matrix[3] * matrix[10];

    inv[5] = matrix[0] * matrix[10] * matrix[15] -
        matrix[0] * matrix[11] * matrix[14] -
        matrix[8] * matrix[2] * matrix[15] +
        matrix[8] * matrix[3] * matrix[14] +
        matrix[12] * matrix[2] * matrix[11] -
        matrix[12] * matrix[3] * matrix[10];

    inv[9] = -matrix[0] * matrix[9] * matrix[15] +
        matrix[0] * matrix[11] * matrix[13] +
        matrix[8] * matrix[1] * matrix[15] -
        matrix[8] * matrix[3] * matrix[13] -
        matrix[12] * matrix[1] * matrix[11] +
        matrix[12] * matrix[3] * matrix[9];

    inv[13] = matrix[0] * matrix[9] * matrix[14] -
        matrix[0] * matrix[10] * matrix[13] -
        matrix[8] * matrix[1] * matrix[14] +
        matrix[8] * matrix[2] * matrix[13] +
        matrix[12] * matrix[1] * matrix[10] -
        matrix[12] * matrix[2] * matrix[9];

    inv[2] = matrix[1] * matrix[6] * matrix[15] -
        matrix[1] * matrix[7] * matrix[14] -
        matrix[5] * matrix[2] * matrix[15] +
        matrix[5] * matrix[3] * matrix[14] +
        matrix[13] * matrix[2] * matrix[7] -
        matrix[13] * matrix[3] * matrix[6];

    inv[6] = -matrix[0] * matrix[6] * matrix[15] +
        matrix[0] * matrix[7] * matrix[14] +
        matrix[4] * matrix[2] * matrix[15] -
        matrix[4] * matrix[3] * matrix[14] -
        matrix[12] * matrix[2] * matrix[7] +
        matrix[12] * matrix[3] * matrix[6];

    inv[10] = matrix[0] * matrix[5] * matrix[15] -
        matrix[0] * matrix[7] * matrix[13] -
        matrix[4] * matrix[1] * matrix[15] +
        matrix[4] * matrix[3] * matrix[13] +
        matrix[12] * matrix[1] * matrix[7] -
        matrix[12] * matrix[3] * matrix[5];

    inv[14] = -matrix[0] * matrix[5] * matrix[14] +
        matrix[0] * matrix[6] * matrix[13] +
        matrix[4] * matrix[1] * matrix[14] -
        matrix[4] * matrix[2] * matrix[13] -
        matrix[12] * matrix[1] * matrix[6] +
        matrix[12] * matrix[2] * matrix[5];

    inv[3] = -matrix[1] * matrix[6] * matrix[11] +
        matrix[1] * matrix[7] * matrix[10] +
        matrix[5] * matrix[2] * matrix[11] -
        matrix[5] * matrix[3] * matrix[10] -
        matrix[9] * matrix[2] * matrix[7] +
        matrix[9] * matrix[3] * matrix[6];

    inv[7] = matrix[0] * matrix[6] * matrix[11] -
        matrix[0] * matrix[7] * matrix[10] -
        matrix[4] * matrix[2] * matrix[11] +
        matrix[4] * matrix[3] * matrix[10] +
        matrix[8] * matrix[2] * matrix[7] -
        matrix[8] * matrix[3] * matrix[6];

    inv[11] = -matrix[0] * matrix[5] * matrix[11] +
        matrix[0] * matrix[7] * matrix[9] +
        matrix[4] * matrix[1] * matrix[11] -
        matrix[4] * matrix[3] * matrix[9] -
        matrix[8] * matrix[1] * matrix[7] +
        matrix[8] * matrix[3] * matrix[5];

    inv[15] = matrix[0] * matrix[5] * matrix[10] -
        matrix[0] * matrix[6] * matrix[9] -
        matrix[4] * matrix[1] * matrix[10] +
        matrix[4] * matrix[2] * matrix[9] +
        matrix[8] * matrix[1] * matrix[6] -
        matrix[8] * matrix[2] * matrix[5];

    det = matrix[0] * inv[0] + matrix[1] * inv[4] + matrix[2] * inv[8] + matrix[3] * inv[12];

    det = 1.0 / det;

    for (i = 0; i < 16; i++)
        inv[i] *= det;
}

void cross(double r[3], double a[3], double b[3])
{
    r[0] = a[1] * b[2] - a[2] * b[1];
    r[1] = a[2] * b[0] - a[0] * b[2];
    r[2] = a[0] * b[1] - a[1] * b[0];
}

double magnitute(double r[3])
{
    return sqrt(r[0] * r[0] + r[1] * r[1] + r[2] * r[2]);
}

void normalize(double r[3])
{
    double len = magnitute(r);
    r[0] /= len;
    r[1] /= len;
    r[2] /= len;
}
void scale(double a[3], double k)
{
    a[0] *= k;
    a[1] *= k;
    a[2] *= k;
}
double dot(double a[3], double b[3])
{
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
}

void vector(double a[3], double b[3], double c[3])
{
    a[0] = b[0] - c[0];
    a[1] = b[1] - c[1];
    a[2] = b[2] - c[2];
}

double clamp(double x, double min, double max)
{
    if (x < min)
        x = min;
    else if (x > max)
        x = max;
    return x;
}


#define WIDTH 800
#define HEIGHT 600

//widht and height of each character in pixels
const int dW = 4, dH = 8;

//set cursor at start to avoid flickering
void gotoxy(short x, short y)
{
	COORD coord = { x, y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}
char palette[] = " .:;~=#OB8%&";


typedef struct Ball {
	double center[3];
	double radius;
	double color;		//on the interval from 0 (dark) to 1 (light)
	double coeff;		//on the scale from 0 to 1 how much does the ball reflect light (1 means it's the perfect mirror)
} ball;

class camera
{
public:
	double x, y, z;
	double matrix[16], inv[16];
	camera(double r, double alfa, double beta)
	{
		//alfa is camera's angle along the xy plane.
		//beta is camera's angle along z axis
		//r is the distance from the camera to the origin
		double a = sin(alfa), b = cos(alfa), c = sin(beta), d = cos(beta);
		x = r * b * d;
		y = r * a * d;
		z = r * c;

		//matrix
		matrix[3] = matrix[7] = matrix[11] = 0;
		matrix[15] = 1;
		//x
		matrix[0] = -a;
		matrix[1] = b;
		matrix[2] = 0;
		//y
		matrix[4] = b * c;
		matrix[5] = a * c;
		matrix[6] = -d;
		//z
		matrix[8] = b * d;
		matrix[9] = a * d;
		matrix[10] = c;

		matrix[12] = x;
		matrix[13] = y;
		matrix[14] = z;

		//invert
		invert(inv, matrix);
	}
	double rayTrace(double origin[3], double unit[3], ball balls[], int n, double altitute, double coeff, int limit)
	{
		double color;
		double distanceToPlane = -(origin[2] + altitute) / unit[2];	//this is signed distance
		int index = -1;
		double distance;
		for (int i = 0; i < n; i++)
		{
			double diff[3];
			vector(diff, origin, balls[i].center);
			double discriminant = dot(unit, diff) * dot(unit, diff) + balls[i].radius * balls[i].radius - dot(diff, diff);
			if (discriminant < 0)	continue;
			distance = -dot(unit, diff) - sqrt(discriminant);
			if (distance <= 0)	continue;
			index = i;
			break;
		}
		if (index == -1)
		{
			if (unit[2] > 0)
			{
				return 0;		//ray hit the sky
			}
			else				//ray hit the groung
			{
				double
					tx = origin[0] + distanceToPlane * unit[0],
					ty = origin[1] + distanceToPlane * unit[1];
				double color = clamp(1 / (1 + distanceToPlane / 10), 0, 1);
				double origin2[3] =
				{
					origin[0] + distanceToPlane * unit[0],
					origin[1] + distanceToPlane * unit[1],
					origin[2] + distanceToPlane * unit[2]
				};
				double unit2[3] =
				{
					unit[0],
					unit[1],
					-unit[2]
				};
				if ((int)(floor(tx) + floor(ty)) % 2 == 0)
					return (1 - coeff) * color + coeff * rayTrace(origin2, unit2, balls, n, altitute, coeff, limit - 1);
				else
					return 0;
			}

		}

		if (unit[2]<0 && distance>distanceToPlane)	//ray hit the groung
		{
			double
				tx = origin[0] + distanceToPlane * unit[0],
				ty = origin[1] + distanceToPlane * unit[1];
			return (double)((int)(floor(tx) + floor(ty)) % 2);
		}
		//ray hit a ball
		double origin2[3] =
		{
			origin[0] + unit[0] * distance,
			origin[1] + unit[1] * distance,
			origin[2] + unit[2] * distance
		};
		double normal[3];
		vector(normal, origin2, balls[index].center);
		normalize(normal);
		double k = 2 * dot(unit, normal);
		scale(normal, k);
		double unit2[3];
		vector(unit2, unit, normal);
		if (limit = 0)	return balls[index].color;
		return (1 - balls[index].coeff) * balls[index].color + balls[index].coeff * rayTrace(origin2, unit2, balls, n, altitute, coeff, limit - 1);
	}
};

int main()
{

	//ball declaration::
	ball balls[3];
	balls[0].center[0] = 0;
	balls[0].center[1] = 0;
	balls[0].center[2] = 0;
	balls[0].radius = 1;
	balls[0].color = 1;
	balls[0].coeff = 0.9;
	balls[1].center[0] = -3;
	balls[1].center[1] = 0;
	balls[1].center[2] = 0;
	balls[1].radius = 0.5;
	balls[1].color = 1;
	balls[1].coeff = 0.7;
	balls[2].center[0] = 0;
	balls[2].center[1] = -3;
	balls[2].center[2] = 0;
	balls[2].radius = 0.5;
	balls[2].color = 1;
	balls[2].coeff = 0.7;

	double alfa = 0, beta = PI / 2, r = 1.9;


	//starting screen
	for (int i = 0; i < HEIGHT / dH; i++) {
		for (int j = 0; j < WIDTH / dW; j++) {
			printf("@");
		}
		printf("\n");
	}
	getchar();
	gotoxy(0, 0);


	while (1)
	{
		char platno[HEIGHT / dH][WIDTH / dW];
		camera cam(r, alfa, beta);

		for (int i = 0; i < HEIGHT / dH; i++) {
			for (int j = 0; j < WIDTH / dW; j++) {
				platno[i][j] = 0;
			}
		}

		for (int i = 0; i < HEIGHT / dH; i++) {
			for (int j = 0; j < WIDTH / dW; j++) {
				double origin[3] =
				{
					cam.x,
					cam.y,
					cam.z
				};

				double unit[3] =
				{
					-((double)(j - WIDTH / dW / 2) + 0.5) / (double)(WIDTH / dW / 2),
					((double)(i - HEIGHT / dH / 2) + 0.5) / (double)(WIDTH / dH / 2),
					-1
				};
				transformVector(unit, cam.matrix);
				unit[0] -= cam.x;
				unit[1] -= cam.y;
				unit[2] -= cam.z;
				normalize(unit);
				double luminance = cam.rayTrace(origin, unit, balls, 3, 2, 0.3, 5);
				int color = (int)((strlen(palette) - 1) * luminance);
				platno[i][j] = palette[color];
			}
		}

		//display:
		for (int i = 0; i < HEIGHT / dH; i++) {
			for (int j = 0; j < WIDTH / dW; j++) {
				printf("%c", platno[i][j]);
			}
			printf("\n");
		}

		//instead of system("cls") i used this because it looks smoother
		gotoxy(0, 0);
		//update camera position
		alfa += 0.03 * PI;
		if (beta > PI / 20)beta -= 0.03 * PI;
	}
	return 0;
}