/*****************************************************
 1) Compile with g++ and no options.  Execute program and note results.
 2) Compile with g++ and the -O2 (optimization) option.  Execute program and note results.
 3) Remove comment surrounding 
	cout << cnt << " " << bestFrac << endl;
    in visit's body. Compile with g++ and the -O2 option.  Execute program and note results. 

Need to compile with -O2 option and without output
***********************************8*/

#include <string>
#include <vector>
#include <iostream>
using namespace std;
class Test {
public:
int visit(vector<string> vs) {
	int best = -1;
	double bestFrac = 2;
	for (int i = 0; i < vs.size(); i++) {
		double cnt = 0;
		for (int a = 0; a < vs[i].size(); a++) cnt += vs[i][a] == '1' ? 1 : 0;
		cnt /= vs[i].size();
		/**** remove this comment for third experiment
		 cout <<"Addition cout >> cnt:"<< cnt << " bestFrac: " << bestFrac << endl;
		******************************/
		if (cnt < bestFrac) {
			bestFrac = cnt;
			best = i;
		}
	}		
	return best;
}
};
int main (){
vector<string> v;
 Test t;

 v.push_back("11122211222111111112121");
 v.push_back("11122211222111111112121");
 cout<<" Print out the value returned by call to visit\n   ";
 cout << t.visit(v)<<"\n";
 
 return 0;
}

