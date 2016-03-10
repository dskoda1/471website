/*
Author: Geoffrey Martinez
CS 471
9/30/99
test of compilation of  page 84, Ghezzi, figure 2.21
*/

#include <stdlib.h>
#include <iostream.h>

void GiveValue(int& fX, int& fY, int& fW, int& fZ, int& fA, int& fB, int& fC, int& fD);

void main()
{
	int gx=0;
	int gy=0;
	int gw=0;
	int gz=0;
	int ga=0;
	int gb=0;
	int gc=0;
	int gd=0;
	GiveValue(gx, gy, gw, gz, ga, gb, gc, gd);
	cout << "Initial Values give by GiveValue():\n";
	cout << "X=1, Y=2, W=3, Z=10, A=50, B=51, C=52, D=53\n\n\n";
	cout << "Nested Block assignments:\n";
	cout << "X=20,21 Y=4, W=6 \n\n\n";
	cout << "Actual Values:\n";
	cout << "X=" << gx << " Y=" << gy << " W=" << gw << " Z=" << gz << " A=" << ga << " B=" << gb
		 << " C=" << gc << " D=" << gd << "\n";

}

void GiveValue(int& fX, int& fY, int& fW, int& fZ, int& fA, int& fB, int& fC, int& fD)
{
	int yes=1;
	int also=1;
	int x, y, w;
	x=1;
	y=2;
	w=3;
	while(yes<=1)
	{	
		int x,z;
		x=20;
		z=10;
		fZ=z;
		while(also<=1)
		{
			int y;
			y=4;
			also++;
		}
		if(also>0)
		{
			int x, w;
			x=21;
			w=6;
		}
		yes++;
	}
	if(yes>0)
	{
		int a,b,c,d;
		a=50;
		b=51;
		c=52;
		d=53;
		fA=a;
		fB=b;
		fC=c;
		fD=d;
	}
//Here, after all the nested loops/blocks, I'll assign values.
	fX=x;
	fY=y;
	fW=w;
}/*End GetValue()*/
