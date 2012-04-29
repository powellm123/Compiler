#ifndef SemanticAction_h
#define SemanticAction_h

#include"symbleTable.h"
#include "Icode.h"
#include <string>

using namespace std;

namespace SemanticAction
{
	//vector<string> icode;

	class sar
	{
	protected:
		symbleTable::identifertype id;
		
	public:
		int type;
		sar(){}
		virtual ~sar()
		{

		}
		sar(symbleTable::identifertype id)
			: id(id), type(0)
		{}

		symbleTable::identifertype& _id()
		{
			return id;
		}
	};

	class id_sar : public sar
	{
	public:
		id_sar(symbleTable::identifertype i)
		{
			id = i;
			type = 1;
		}
	};

	class lit_sar : public sar
	{
	public:
		lit_sar(const string& str)
		{
			type = 2;
			id.value = str;
		}
	};

	class type_sar : public sar
	{
	public:
		type_sar(const string& str)
		{
			type = 3;
			id.data.type = str;
		}
	};

	class arr_sar : public sar
	{
		int loc;
	public:
		sar* exp;
		arr_sar(sar* idsr, sar* exp)
			: exp(exp)
		{
			type = 4;
			id = idsr->_id();
			//loc = atoi(exp->_id().value.c_str());
			//id.data.type = id.data.type.substr(2, id.data.type.size());
		}
	};

	class al_sar : public sar
	{
		vector<symbleTable::identifertype> args;
		string str;
	public:
		al_sar()
		{
			str = ")";
			type = 6;
		}
		void add(sar *s)
		{
			// Icode///////////////////////////////

			///////////////////////////////////////////
			if(str == ")" ){
				str = s->_id().data.type + str;
				args.push_back(s->_id());
			}
			else{
				str = s->_id().data.type + "," + str;
				args.push_back(s->_id());
			}
		}
		void end()
		{
			str = "(" + str;
		}

		vector<symbleTable::identifertype>& theArgs()
		{
			return args;
		}
		string& get_str()
		{
			return str;
		}
	};

	class func_sar : public sar
	{
		vector<symbleTable::identifertype> args;
	public:
		~func_sar()
		{
		}
		func_sar(sar* idsr, al_sar* alsar)
		{
			type = 5;
			args = alsar->theArgs();
			id = idsr->_id();
			id.value = idsr->_id().value + alsar->get_str();
		}
		vector<symbleTable::identifertype>& theArgs()
		{
			return args;
		}
	};

	class bal_sar : public sar
	{
	public:
		bal_sar(const string& str)
		{
			id.value = str;
			type = 7;		
		}

	};

	class new_sar : public sar
	{
		vector<symbleTable::identifertype> args;
	public:
		new_sar(sar* idsr, al_sar* alsar)
		{
			type = 5;
			args = alsar->theArgs();
			//id = idsr->_id();
			id.value = idsr->_id().data.type + alsar->get_str();
		}

		new_sar(sar* func)
		{
			type = 5;
			id = func->_id();
		}

		new_sar(func_sar* func)
		{
			type = 5;
			args = func->theArgs();
			id = func->_id();
			//id.value = idsr->_id().data.type + alsar->get_str();
		}

		new_sar(symbleTable::identifertype& idsr)
		{
			type = 5;
			id = idsr;
		}

		vector<symbleTable::identifertype>& theArgs()
		{
			return args;
		}

		/*new_sar(symbleTable::identifertype rsar, al_sar* alsr)			
		{
			//id = i;
			id = rsar;
			type = 8;
			secondsar = alsr;
			id.kind = symbleTable::noneK;
		}*/
	};

	class ref_sar : public sar
	{
	public:
		ref_sar(symbleTable::identifertype i)
		{
			id = i;
			type = 9;
		}
	};

	bool checkbool(sar*);
	void setScope(const string& str);
	const int& getErrors();
	void setlinenum(int x);
	const int& getlinenumber();
	symbleTable::identifertype Get_topSASid();
	void _iPush(const symbleTable::identifertype &id);// Identifier Push
	void _lPush(const string&, const string&);// Literal Push
	void _oPush(const string&);	// Operator Push
	void _tPush(const string&);// Type Push
	void _vPush(const symbleTable::identifertype &id);// Variable Push
	void _iExist(const string&);	// Identifier Exists
	void _rExist(const string&, const symbleTable::identifertype&);	// Member Reference Exists
	void _tExist(const string&);	// Type Exists
	void _bal();	// Beginning of Argument List
	void _eal();	// End of Argument List
	void _func();	// Function
	void _arr();	// Array Reference
	void _if();		// If
	void _while();	//While
	void _return(const string&);	//Return
	void _cout();	//Cout
	void _cin();	//Cin
	void _atoi();	//ASCII To Integer
	void _itoa();	// Integer to ASCII
	void _newObj();	// New Object
	void _newarray(const string&);	// New Array
	void _cd(const string&,  const string&);		// Constructor Declaration
	void _dot();	// Dot Operator (Not Used)
	void _cParen();	// Closing Parenthesis
	void _cSquBracket();	// Closing Square Bracket
	void _arg();	// Argument
	void _eoe(bool removeSAS = true);	// End of Expression
	void _plus();	// Add Operator
	void _sub();	// Subtract Operator
	void _star();	// Multiply Operator
	void _div();	// Divide Operator
	void _equal();	// Assignment Operator
	void _less();	// Less Than Operator
	void _greater();	// Greater Than Operator
	void _equalequal();	// Equal Operator
	void _lessequal();	// Less Than or Equal Operator
	void _greaterequal();	// Greater Than or Equal Operator
	void _and();	// And Operator
	void _or();		// Or Operator
	void _notEqual();	// Not equal Operator
}

#endif