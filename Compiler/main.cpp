#include "syntax.h"
int main(int argc, char* argv[])
{
	string str;
	if(argc == 1){
		str = "test.txt";
	}
	else
		str = argv[1];
	str = "./" + str;

	cerr<<"File "<<str<<endl;
	if(syntax::startpass1(str)){ // pass 1: start symbol
		cerr<< "Exiting due to ERRORS!";
		return 0;
	}
	if(!syntax::startpass2()) // pass 2: start symbol
		cerr<<"Success!";
	return 0;
}