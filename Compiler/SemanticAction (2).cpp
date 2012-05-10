#include "SemanticAction.h"
#include "symbleTable.h"
#include "Icode.h"
#include "syntax.h"
#include <vector>
namespace SemanticAction
{
////////////////Vars///////////////////////////
	struct oper
	{
		string op;
		int presidence;
	};
	static vector<sar*> SAStack;
	static vector<oper> OPStack;
	static int tempnumber = 0;
	static string currentScope;
	static int ERRORS = 0;
	static int linenum = 0;
	//for ICODE
	//static vector<string> commands;
	
///////////////////////////////////////////////

///////////Helper function/////////////////////
	void setlinenum(int x)
	{
		linenum = x;
	}
	const int& getlinenumber()
	{
		return linenum;
	}
	const int& getErrors()
	{
		return ERRORS;
	}
	void gen_error(const string& str)
	{
		cerr<<linenum << " SA ERROR: " << str<<endl;
		ERRORS++;
	}
	void gen_error(const string& str, sar* s)
	{
		if(s->_id().scope != "")
			cerr<<linenum<<" SA ERROR: "<<str<<" scope " << s->_id().scope<<" value " << s->_id().value <<endl; 
		else
			cerr<<linenum<<" SA ERROR: A Symble is not Defined"<<endl;
		ERRORS++;
	}
	void gen_error(const string& str, sar* s1, sar* s2)
	{
		cerr<<linenum<<" SA ERROR: "<<str<<" scope " << s1->_id().scope<<" value " << s1->_id().value <<" AND "
		<<"scope " << s2->_id().scope<<" value " << s2->_id().value <<endl;
		ERRORS++;
	}
	sar* gensym(const symbleTable::identifertype& id,const string& type, char symid = 't')
	{
		symbleTable::identifertype tid = id;
		//if(symid == 'R')
		//	tid.data.type = "int";
		//else
			tid.data.type = type;

		stringstream ss;
		ss << tempnumber++;
		tid.value = symid + ss.str();
		tid.symid = symid + symbleTable::get_valuenumber();
		tid.scope = syntax::get_scope();
		tid.kind = id.kind;
		symbleTable::putinSymTbl(tid.scope, tid);
		return new sar(tid);
	}
	bool checkbool(sar* s)
	{
		return s->_id().data.type == "bool";
	}
	bool foundintable(sar *s)
	{
		return symbleTable::check_in_symbletable(s->_id().scope, s->_id().value);	
	}
	bool checkinscope(sar* s1, sar* s2)
	{
		string scope = "g." + s1->_id().data.type;
		return symbleTable::check_in_symbletable(scope, s2->_id().value);	
	}
	symbleTable::identifertype getinscope(sar* s1, sar* s2)
	{
		string scope = "g." + s1->_id().data.type;
		return symbleTable::get_symTbl(scope, s2->_id().value); // symbleTable::get_from_symbletable(scope, s2->_id().value);
	}
	int findPres(string op)
	{
		switch (op[0])
		{
		case '*':
		case '/':
			return 13;
		case '+':
		case '-':
			return 11;
		case '<':
		case '>':
			return 9;
		case '!':
		case '=':
			if(op.size() > 1 && op[1] == '=')
				return 7;
			return 1;
			
		case '(':
		case '[':
			return 15;
		}
		return 0;
	}
	void doSemAct(const oper &t)
	{
		switch (t.op[0])
		{
		case '*':
			_star();
			break;
		case '/':
			_div();
			break;
		case '+':
			_plus();
			break;
		case '-':
			_sub();
			break;
		case '<':
			if(t.op == "<=")
				_lessequal();
			else
				_less();
			break;
		case '>':
			if(t.op == ">=")
				_greaterequal();
			else
				_greater();
			break;
		case '=':
			if(t.op == "==")
				_equalequal();
			else
				_equal();
			break;
		case '(':
			break;
		case '[':
			break;
		default:
			if(t.op == "&&")
				_and();
			if(t.op == "||")
				_or();
			if(t.op == "!=")
				_notEqual();
			break;
		}
	}
	sar* pop_sar()
	{
		if(SAStack.empty()){
//			gen_error("Nothing on the Semantic Action Stack");
			return new sar();
		}
		sar *top_sar = SAStack.back();
		SAStack.pop_back();

		return top_sar;
	}
	bool sametype(sar *s1, sar *s2)
	{
		if(s1->_id().data.type == s2->_id().data.type || s1->_id().symid.find('R') != -1 || s2->_id().symid.find('R') != -1 || s1->_id().value == "null" ||  s2->_id().value == "null" )
			return true;

		return false;
	}
	void setScope(const string& str)
	{
		currentScope = str;
	}
////////////////////////////////////////////////////////////////
	symbleTable::identifertype Get_topSASid()
	{
		return SAStack.back()->_id();
	}
//////////////////SemanticAction functions//////////////////////
	////////////////////////////////////////////////////
////////PUSH action/////////////////////////////////////////////
	void _iPush(const symbleTable::identifertype &id){	// Identifier Push
		SAStack.push_back(new id_sar(id));
	}
	void _lPush(const string& str, const string& type){	// Literal Push
		sar* lsar = new lit_sar(str);
		lsar->_id() =  symbleTable::get_symTbl(symbleTable::get_symTbl("g", str).symid); //.data.type = type;
		//lsar->_id().scope = "g";
		//lsar->_id().symid = "l" + symbleTable::get_valuenumber();
		//lsar->_id().kind = symbleTable::Kinds.noneK;
		//lsar->_id().data.accessMod = symbleTable::AccessMod._public;
		SAStack.push_back(lsar);
	}
	void _oPush(const string &operat){	// Operator Push
		oper temp;
		temp.op = operat;
		temp.presidence = findPres(operat);
		
		while(!OPStack.empty() && (OPStack.back().presidence >= temp.presidence))
		{
			doSemAct(OPStack.back());
			OPStack.pop_back();
		}
		if(temp.presidence == 15)
			temp.presidence = -1;
		OPStack.push_back(temp);

	}
	void _tPush(const string &str){	// Type Push
		SAStack.push_back(new type_sar(str));
	}
	void _vPush(const symbleTable::identifertype &id){	// Variable Push
		SAStack.push_back(new sar(id));
	}
/////////////////////////////////////

/////////Exist action////////////////
	void _iExist(const string& scope){	// Identifier Exists
	//	Pop the top SAR (e.g., top_sar = SAS.pop()) \
	//	from the SAS.  The top SAR can be a simple variable,\
	//	a function call or an array reference.\
	//	Test if the top SAR exists in the current scope. \
	//	Push a SAR onto the SAS to indicate that the \
	//	identifier exists (e.g., SAS.push(id_sar)) \
	//	or generate an error.

		sar *top_sar = pop_sar();

		if(top_sar->type == 4)
		{
			//auto idsar = new id_sar(symbleTable::get_symTbl(top_sar->_id().scope, top_sar->_id().value));
			//idsar->_id().data.type = idsar->_id().data.type.substr(2, idsar->_id().data.type.size());
			
			//cerr <<"I am An Array" << top_sar->_id().symid;

			arr_sar* idsar = dynamic_cast<arr_sar*>( top_sar);
			idsar->_id().data.type = idsar->_id().data.type.substr(2, idsar->_id().data.type.size());
			
			auto arrayId = top_sar->_id();
			string a;


			if(arrayId.data.type == "int" || arrayId.data.type == "char" || arrayId.data.type == "bool" ){
				idsar->_id().kind = symbleTable::Aref;
				//a = "Aref";
			}
			else{
				idsar->_id().kind = symbleTable::CAref;
				//a = "CAref";
			}


			sar *temp = gensym(idsar->_id(), idsar->_id().data.type, 'R');
			//cerr << "i am a " << a<<endl;
			Icode_h::Math("ADD", arrayId.symid, idsar->exp->_id().symid, temp->_id().symid);
			
			SAStack.push_back(temp);

		} else if(top_sar->type == 5) //Kinds.Func
		{
			if(foundintable(top_sar)){
				Icode_h::frame(top_sar->_id().symid, "this");
				//SAStack.push_back(new id_sar(symbleTable::get_symTbl(top_sar->_id().scope, top_sar->_id().value)));

				//cerr <<"I am A function" << top_sar->_id().symid;

				func_sar* fs = dynamic_cast<func_sar*>( top_sar);

				vector<string> prams;

				for(vector<symbleTable::identifertype>::iterator arg = fs->theArgs().begin(); arg != fs->theArgs().end(); arg++)
				{
					prams.push_back(arg->symid);
				}
				// NOTE:  Trying to add () on the end of DemoC

				while( !prams.empty())
				{
					Icode_h::push(prams.back());
					prams.pop_back();
				}
				Icode_h::call(top_sar->_id().value);
				sar *temp = gensym(top_sar->_id(), top_sar->_id().data.type);
				SAStack.push_back(temp);
				Icode_h::peek(temp->_id().symid);
			}
			else{
				gen_error("Function not defined in table for", top_sar);
				return;
			}

		} else if(top_sar->_id().kind >= 3 || top_sar->_id().kind == symbleTable::Class) // Kinds.ivar through Kinds.tvar
		{
			if(foundintable(top_sar)){
				SAStack.push_back(new id_sar(symbleTable::get_symTbl(top_sar->_id().scope, top_sar->_id().value)));
			}
			else{
				gen_error("Varable not defined in table for", top_sar);
				return ;
			}
		}
		else{
			gen_error("no defined kind for", top_sar);
				return;
		}
	}
	void _rExist(const string& scope, const symbleTable::identifertype& id){	// Member Reference Exists
		sar *top_sar = pop_sar();
		sar *next_sar = pop_sar();
		func_sar *tsar = dynamic_cast<func_sar*>( top_sar);

		if(!foundintable(next_sar)){
			gen_error("not defined in table for", next_sar);
			return ;
		}
		SAStack.push_back(new id_sar(symbleTable::get_symTbl(next_sar->_id().scope, next_sar->_id().value)));

		next_sar = pop_sar();

		if(!checkinscope(next_sar, top_sar)){
			gen_error("not in scope", top_sar);
			return;
		}
		SAStack.push_back(new id_sar(getinscope(next_sar, top_sar)));

		top_sar = pop_sar();

		if(top_sar->_id().data.accessMod != symbleTable::AccessMod::_public){
			gen_error("not public", top_sar);
			return;
		}

		if(top_sar->_id().kind >= symbleTable::Kinds::ivar &&top_sar->_id().kind <= symbleTable::Kinds::tvar)
		{
			//if(foundintable(top_sar)){
			//	SAStack.push_back(new id_sar(symbleTable::get_symTbl(top_sar->_id().scope, top_sar->_id().value)));
			//}
			//else{
			//	gen_error("Array not defined in table for", top_sar);
			//	return;
			//}

			sar *reftemp = gensym(top_sar->_id(), top_sar->_id().data.type, 'R');
			Icode_h::ref(top_sar->_id().symid, next_sar->_id().symid, reftemp->_id().symid);
			//SAStack.pop_back();
			SAStack.push_back(new ref_sar(reftemp->_id()));
		}else	if( top_sar->_id().kind == symbleTable::Kinds::Func)
		{
			
			sar* templ = new new_sar( tsar);
			Icode_h::frame(top_sar->_id().symid, next_sar->_id().symid);
			vector<string> prams;
			for(vector<symbleTable::identifertype>::iterator arg = tsar->theArgs().begin(); arg != tsar->theArgs().end(); arg++)
			{
				prams.push_back(arg->symid);
			}

			while( !prams.empty())
			{
				Icode_h::push(prams.back());
				prams.pop_back();
			}

			Icode_h::call(templ->_id().value);
			sar *temp = gensym(templ->_id(), templ->_id().data.type); // new new_sar(gensym(top_sar->_id(), top_sar->_id().data.type)->_id(), tsar);
			SAStack.push_back(temp);
			Icode_h::peek(temp->_id().symid);
		} else if(top_sar->type == 4)
		{
			sar *reftemp = gensym(top_sar->_id(), top_sar->_id().data.type, 'R');
			reftemp->_id().data.type = reftemp->_id().data.type.substr(2, reftemp->_id().data.type.size());

			auto arrayId = top_sar->_id();

			sar *temp = gensym(top_sar->_id(), top_sar->_id().data.type);

			Icode_h::Math("ADD", arrayId.symid, reftemp->_id().symid, temp->_id().symid);

			SAStack.push_back(new ref_sar(reftemp->_id()));
		}else{
			gen_error("no defined kind", top_sar);
			return ;
		}
	}
	void _tExist(const string& scope){	// Type Exists
		sar *top_sar = pop_sar();

		if(symbleTable::find_nonbasetype(top_sar->_id()) || top_sar->_id().data.type == "int" || top_sar->_id().data.type == "char" 
			|| top_sar->_id().data.type == "bool" || top_sar->_id().data.type == "void" )
		{

		}
		else
		{
			gen_error("Not a defined type", top_sar);
		}
	}
/////////////////////////////////////
/////////Argument List///////////////
	void _bal(){	// Beginning of Argument List
		SAStack.push_back(new bal_sar("bal"));
	}
	void _eal(){	// End of Argument List
		sar *top_sar;
		symbleTable::identifertype id();
		al_sar* alsar = new al_sar();

		while(!SAStack.empty() && SAStack.back()->_id().value != "bal"){	//if not bal_sar add to al_sar
			top_sar = pop_sar();
			if(top_sar->_id().symid.find('R') == -1)
				alsar->add(top_sar);
			else{
				alsar->add(top_sar);
				//pop_sar();
			}
		}
		alsar->end();
		if(!SAStack.empty())
			SAStack.pop_back();
		//SAStack.push_
		SAStack.push_back(alsar);
	}
/////////////////////////////////////

	void _func(){	// Function
		sar *alsar = pop_sar();
		//check if alsr is a al_sar

		sar *idsr = pop_sar();
		//check if idsr is a id_sar

		al_sar* als = dynamic_cast<al_sar*> (alsar);
		if(als != nullptr){
			SAStack.push_back(new func_sar(idsr, als));

			///////ICODE/////
			//Icode_h::call(idsr->_id().symid);
			////////////////
		}
		else{
			gen_error("isnt a set of aruments", alsar);
			return;
		}
	}
	void _arr(){	// Array Reference
		sar *exp = pop_sar();
		sar *arrayname = pop_sar();
		
		if(exp->_id().data.type != "int"){
			gen_error("expresion isnt an int type", exp);
			return;
		}

		auto ids = exp->_id();
		ids.data.type = "int";

		int size;

		string type = arrayname->_id().data.type;
		type = type.substr(2, type.size());
		if(symbleTable::find_nonbasetype(type))
			size = symbleTable::getclassmembersCount(type);
		else
			if(type == "char")
				size = 1;
			else
				size = 4;
		sar *tempamount = gensym(arrayname->_id(), type);
		
		Icode_h::Math("MUL", exp->_id().symid, symbleTable::getLitSymb(size), tempamount->_id().symid);

		SAStack.push_back(new arr_sar(arrayname, tempamount));
	}

//////////Statment Actions///////////
	void _if(){	
		// If
		sar *exp = pop_sar();

		if(!checkbool(exp)){
			gen_error("not bool", exp);
			return;
		}
		Icode_h::Branch("BF", exp->_id().symid, "if");
		//Icode_h::Boolean("BF", 
	}
	void _while(){
		//While
		sar *exp = pop_sar();
		
		if(!checkbool(exp)){
			gen_error("not bool", exp);
			return;
		}
		Icode_h::Branch("BF", exp->_id().symid, "whilen");
	}
	void _return(const string& scope){
		//Return
		//sar *exp = pop_sar();
		
		string str = scope.substr(scope.find_last_of(".")+1, scope.size());
		string type = symbleTable::findfunctiontypefromscope(scope);
		if(!((type == "" && str == "main") || type == "void"))
		{
			sar *exp = pop_sar();
			if(exp->_id().data.type == type)
			{
				//////Icode/////////
				Icode_h::RETURN(exp->_id().symid);
				////////////////////
			}else{
				gen_error("not same type as return type", exp);
				return;
			}
		}
		else{
			sar *exp = pop_sar();
			if(exp->_id().kind != symbleTable::Func && exp->_id().data.type.size() != 0)
				gen_error("Function is void can't return anything");
			else{
				SAStack.push_back(exp);
				Icode_h::RTN();
			}
		}
	}
	void _cout(){	//Cout
		sar *exp = pop_sar();
		
		if(exp->_id().data.type != "char" && exp->_id().data.type != "int"){
			gen_error("not char or a int", exp);
			return;
		}

		/////Icode///////
		if(exp->_id().data.type == "int")
			Icode_h::writeI(exp->_id().symid);
		else
			Icode_h::writeC(exp->_id().symid);
		///////////////////
	}
	void _cin(){	//Cin
		sar *exp = pop_sar();
		
		if(exp->_id().data.type != "char" && exp->_id().data.type != "int"){
			gen_error("not char", exp);
			return;
		}

		/////Icode///////
		if(exp->_id().data.type == "int")
			Icode_h::readI(exp->_id().symid);
		else
			Icode_h::readC(exp->_id().symid);
		///////////////////

	}
	void _atoi(){	//ASCII To Integer
		sar *exp = pop_sar();
		
		if(exp->_id().data.type != "char"){
			gen_error("not char", exp);
			return;
		}

		//Push a SAR for the integer onto the SAS.
		SAStack.push_back(gensym(exp->_id(), "int"));
	}
	void _itoa(){	// Integer to ASCII
		sar *exp = pop_sar();
		
		if(exp->_id().data.type != "int"){
			gen_error("not int", exp);
			return;
		}

		//Push a SAR for the character onto the SAS.

		SAStack.push_back(gensym(exp->_id(), "char"));

	}
/////////////////////////////////////
///////////New Actions///////////////
	void _newObj(){	// New Object
		sar *alsr = pop_sar();

		al_sar* al = dynamic_cast<al_sar*>(alsr);
		if(al != nullptr)
		{
			sar *tysar = pop_sar();
			sar *theobj = pop_sar();
			//func_sar* fun = 
			SAStack.push_back(theobj);
			//sar* nsr = gensym(al->_id(),tysar->_id().data.type);

			//nsr->_id() = symbleTable::get_symTbl("g." + tysar->_id().data.type, tysar->_id().data.type);
			
			auto ids = symbleTable::get_symTbl("g." + tysar->_id().data.type, tysar->_id().data.type);
			id_sar* idsar = new id_sar(ids);
			//new_sar* func = new new_sar(idsar, al);
			//dynamic_cast<al_sar*>(SAStack.pop_back());
			//SAStack.push_back(new new_sar(nsr, al));

			Icode_h::newi(idsar->_id().data.type, theobj->_id().symid);

			Icode_h::frame(idsar->_id().symid, theobj->_id().symid);
			string pr = "(";
			vector<string> prams;
			auto a = al->theArgs();
			for(auto iter = a.begin(); iter != a.end(); ++iter)
			{
				prams.push_back(iter->symid);
				if(iter == a.begin())
					pr += iter->data.type;
				else
					pr += "," + iter->data.type;
			}
			pr += ")";
			while(!prams.empty())
			{
				Icode_h::push(prams.back());
				prams.pop_back();
			}

			Icode_h::call(idsar->_id().value + pr);
			sar *temp = gensym(idsar->_id(), idsar->_id().data.type);
			SAStack.push_back(temp);
			Icode_h::peek(temp->_id().symid);

		}
		else{
			gen_error("No Argument list given", alsr);
			return;
		}
	}
	void _newarray(const string& scope){	// New Array
		sar *exp = pop_sar();

		
		if(exp->_id().data.type != "int")
			gen_error("Need int to put as size for Array", exp);

		sar *tysar = pop_sar();
		string type = tysar->_id().data.type;

		if( !symbleTable::find_nonbasetype(type) && type != "int" && type != "char" && type != "bool")
			gen_error(type + " is not a defined type");
		
		auto ids = exp->_id();
		ids.value += "[]"; // ids.data.type;
		ids.data.type = "@:" + tysar->_id().data.type;
		ids.scope = scope;

		sar *tempamount = gensym(exp->_id(), tysar->_id().data.type);

		Icode_h::Math("MUL", symbleTable::getLitSymb(4), exp->_id().symid, tempamount->_id().symid);

		sar *temp = gensym(ids, ids.data.type);

		Icode_h::newa(tempamount->_id().symid, temp->_id().symid);

		SAStack.push_back(new new_sar(temp));
	}
	void _cd(const string& curclass,  const string& str){
	// Constructor Declaration
	//	Check that identifier for the constructor \
	//	matches the name of the class.  \
	//	Note:  The name of the class should be part \
	//	of the scope in which the constructor is declared.
	//	sar *topsar = pop_sar();
		if(curclass == str)
		{
			///////ICODE/////
			//Icode_h::call(idsr->_id().symid);
			////////////////
		}
		else{
			gen_error("Constructior isnt the same of the class name");
			return;
		}
	}
//////////////////////////////////
////////Var Types/////////////////
	void _dot(){	// Dot Operator (Not Used)
	}
	void _cParen(){	// Closing Parenthesis
		while(!OPStack.empty() && OPStack.back().op != "(")
		{
			doSemAct(OPStack.back());
			OPStack.pop_back();
		}
		if(OPStack.empty()){
			gen_error("No ( for )");
			return;
		}
		else
			OPStack.pop_back();

	}
	void _cSquBracket(){	// Closing Square Bracket
		while(!OPStack.empty() && OPStack.back().op != "[")
		{
			doSemAct(OPStack.back());
			OPStack.pop_back();
		}
		if(OPStack.empty())
			gen_error("No [ for ]");
		else
			OPStack.pop_back();


	}
	void _arg(){	// Argument #,
		while(!OPStack.empty() && OPStack.back().op != "(")
		{
			doSemAct(OPStack.back());
			OPStack.pop_back();
		}
		if(OPStack.empty()){
			gen_error("No ( for ,");
			return;
		}
		////ICODE/////////
//		Icode_h::push(SAStack.back()->_id().symid);
		/////////////////
	}
	void _eoe(bool removeSAS){	// End of Expression
		while(!OPStack.empty())
		{
			doSemAct(OPStack.back());
			OPStack.pop_back();
		}

		while(!SAStack.empty() && removeSAS)
		{
			SAStack.pop_back();
		}
	}
////////////////////////////////////
/////////Operator action////////////

	void _plus(){	// Add Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), s2->_id().data.type);
			SAStack.push_back(temp);
			//sar* news1 = get_temp(sar *s1);

			Icode_h::Math("ADD", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _sub(){	// Subtract Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), s2->_id().data.type);
			SAStack.push_back(temp);
			Icode_h::Math("SUB", s1->_id().symid, s2->_id().symid, temp->_id().symid);

		}
	}
	void _star(){	// Multiply Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{

			sar *temp = gensym(s2->_id(), s2->_id().data.type);
			SAStack.push_back(temp);
			Icode_h::Math("MUL", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _div(){	// Divide Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), s2->_id().data.type);
			SAStack.push_back(temp);
			Icode_h::Math("DIV", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _equal(){	// Assignment Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			//sar *temp = gensym(s2->_id(), s2->_id().data.type);
			//SAStack.push_back(temp);

			Icode_h::move(s1->_id().symid, s2->_id().symid);
			
		}
		
	}
	void _less(){	// Less Than Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("LT", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _greater(){	// Greater Than Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2))
			gen_error("Not Same Type", s1, s2);
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("GT", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _equalequal(){	// Equal Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("EQ", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _lessequal(){	// Less Than or Equal Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("LE", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _greaterequal(){	// Greater Than or Equal Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("GE", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _and(){	// And Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("AND", s1->_id().symid, s2->_id().symid, temp->_id().symid);

		}
	}
	void _or(){		// Or Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("OR", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
	void _notEqual(){	// Not equal Operator
		sar* s1 = pop_sar();
		sar* s2 = pop_sar();
		
		if(!sametype(s1, s2)){
			gen_error("Not Same Type", s1, s2);
			return;
		}
		else
		{
			sar *temp = gensym(s2->_id(), "bool");
			SAStack.push_back(temp);
			Icode_h::Boolean("NE", s1->_id().symid, s2->_id().symid, temp->_id().symid);
		}
	}
////////////////////////////////////
}