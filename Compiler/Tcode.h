#include "definitions.h"
#include "Icode.h"
#include "symbleTable.h"
namespace Tcode
{
	struct assembly{
		string label;
		string instr;
		string operand1;
		string operand2;
		string comment;
		assembly(const string& inst = "", const string& op1 = "", const string& op2 = "", const string& lab = "", const string& comment = "")
			: label(lab), instr(inst), operand1(op1), operand2(op2), comment(comment)
		{
		}

	};

	static int labelnumber = 0;
	static int labelendnum = 0;
	static string curlabelnum = "";
	static string curlabelend = "";

	string tostring(int i);
	void StartTcode(vector<Icode_h::quad>);
	void dumpTCode();

	string getlableName(const string& label);
	
	string getLocation(const string&);
	//void getintoRegister(const string&, const string&, const string& = "", bool RHS = false, const string& = "FP"){}
	//void putfromRegister(const string&, const string&, const string& = "", bool RHS = false, const string& = "FP"){}
	void storeLits();


	//////V2 Function Names/////////
	string getOffset(const string& symid);

	
	void getLoc(const string&, const string&, const string& = "", bool = false, bool = false);
	void getValue(const string&, const string&, const string& = "");

	/////////////////////////////////



	void Boolean();
	void Branch();
	void call();
	void frame();
	void func();
	void JMP();
	void newa();
	void newi();
	void Math();
	void move();
	void push();
	void pop();
	void peek();
	void read();
	void readC();
	void readI();
	void ref();
	void RETURN();
	void RTN();
	void write();
	void writeC();
	void writeI();

}