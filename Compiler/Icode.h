#include "definitions.h"
#include "symbleTable.h"
#pragma once
namespace Icode_h
{
	struct quad{
		string label;
		string instr;
		string operand1;
		string operand2;
		string operand3;
		quad(const string& instr = "", const string& op1 = "", const string& op2 = "", const string& op3 = "", const string& lab = "")
			: label(lab), instr(instr), operand1(op1), operand2(op2), operand3(op3)
		{
		}

		friend ostream& operator<<(ostream& out, const quad& q)
		{
			if(q.label != "")
				out << q.label<<" ";
			else
				out<<"\t";
			out << q.instr<<" ";
			if(q.operand1 != "")
				out << q.operand1;
			if(q.operand2 != "")
				out<< ", "<<q.operand2;
			if(q.operand3 != "")
				out<< ", "<<q.operand3;
			return out;
		}
	};
	
	void dumpicode();
	static quad q;
	static vector<quad> icode;
	static vector<string> labelstack;
	
	vector<quad>& get_quadlist();
	void SetUpMain();
	void push(const string& symId);
	void pop(const string& symId);
	void peek(const string& symId);
	void move(const string& symId1, const string& symId2);
	void move(int num, const string& symId);
	void ref(const string& symId1, const string& symId2, const string& tempsymid);
	void JMP(const string& label);
	void Math(const string& instr, const string& a, const string& b, const string& c);
	void Math(const string& instr, const string& a, int num, const string& c);
	void Boolean(const string& instr, const string& a, const string& b, const string& c);
	void heap(const string&);
	void frame(const string& func, const string& object);
	void call(const string& func);
	void RTN();
	void RETURN(const string&);
	void func(const string& funcid);
	void newi(const string&, const string& A);
	void newa(const string& R, const string& A);
	void write(const string& Aid);
	void read(const string& Aid);
	void writeC(const string& Aid);
	void readC(const string& Aid);
	void writeI(const string& Aid);
	void readI(const string& Aid);
	void Branch(const string& instr, const string& Aid, const string& whereitsfrom);
	string backLabel();
	void pushLable(const string&, vector<string>&);
	void popLable(const string&, vector<string>&);
	void backpatch(const string& str1, const string& str2);
}