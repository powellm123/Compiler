#include "syntax.h"

namespace syntax
{
	Scanner* scan;   //"./SyntaxTortureTest.kxi"); 
	
	static string scope;
	static char symid;
	static string value;
	static symbleTable::Kinds  kind;
	static symbleTable::Data   data;
	static symbleTable::identifertype thetoken;
	static int error = 0;
	static string literals;

	//static vector<string> icode;
	string valuearglist;
	int pass = 0;

	void symTbDump()
	{
		symbleTable::dump();
	}
	void gen_error(const token& t, const string& str)
	{
		if(t.str1 == "EMPTY" && str == ";"){
			cerr<<"Need to add a space after the last }";
			system("pause");
			exit(0);
			//throw "end";
		}
		else{
			cerr<<t.linenum<< " Got "<<t.str1<<" Looking for "<<str<<endl;
			cerr<<"   misspelled Statement or type could be a problem\n   or wrong combation of symbles put together"<<endl;
			++error;
		}
	}
	void gen_error(int linenum, const string& str)
	{
		cerr<<linenum<<" "<<str<<endl;
	}
	void prev_token()
	{
		//goes back one token
		scan->get_prev();
	}
	token get_nextToken()
	{
		token t = scan->get_Next();
		SemanticAction::setlinenum(t.linenum);
		return t;
	}
	const string& get_scope()
	{
		return scope;
	}
	void prev_scope()
	{
		if(scope != "g")
		{
			int loc = 0;
			while(scope.find(".", loc+1) != -1)
				loc = scope.find(".", loc+1);
			scope = scope.substr(0, loc);
		}
	}
	bool identifier()
	{
		token t;
		t = get_nextToken();

		if(t.str1[0] >= 'a' && t.str1[0] <= 'z' || t.str1[0] >= 'A' && t.str1[0] <= 'Z')
		{
			if(t.tktype != keyword){
				value = t.str1;
				//symid = 'V';
				return true;
			}
		}
		prev_token();
		return false;
	}

	//Start of the language functions
	bool keyword_function(class token& t)
	{
		if(t.tktype == keyword)
			return true;
		return false;
	}
	bool modifier_function()
	{
		token t = get_nextToken();
		if(t.str1 == "public" || t.str1 == "private"){
			if(t.str1 == "public")
				data.accessMod = symbleTable::_public;
			if(t.str1 == "private")
				data.accessMod = symbleTable::_private;
			return true;
		}
		prev_token();
		return false;
	}
	bool type_function(bool a )
	{
		token t = get_nextToken();
		if(t.str1 == "int" || t.str1 == "char" || t.str1 == "bool" || t.str1 == "void"){
			data.type = t.str1;
			kind = symbleTable::Kinds::ivar;
			//symid = 'K';
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_tPush(t.str1);
			///////////////////////////////
			return true;

		}
		else {
			prev_token();
			if (class_name_function(true)){
				data.type = t.str1;
				kind = symbleTable::Kinds::ivar;
				//symid = 'K';
				///////Semantic Action/////////
				if(pass == 2)
					SemanticAction::_tPush(t.str1);
				///////////////////////////////

				return true;
			}
		return false;
		}
	}
	bool class_name_function(bool function, bool isClass)
	{
		token t = get_nextToken();
		prev_token();
		symbleTable::identifertype id;
		id.data.type = t.str1;
		if(identifier() ){
			if( (isClass && !keyword_function(t)) || ( pass == 1 || symbleTable::find_nonbasetype(id)))
			{
				//if(function)
				//	scope += "."+ t.str1;
				return true;
			}
			prev_token();
		}
		return false;
	}
	bool character_literal_function()
	{
		token t = get_nextToken();
		if(t.str1 != "\'"){
			prev_token();
			return false;
		}

		character_function();

		t = get_nextToken();
		if(t.str1 != "\'")
			gen_error(t, "\'");
		
		if(pass == 1)
			{
				//symbleTable::KINDS = symbleTable::Kinds.tvar;
				if(literals[0] == '\'')
					symbleTable::add("g", 'l', literals, symbleTable::tvar, symbleTable::Data("char"));
				else
					symbleTable::add("g", 'l', "'" + literals + "'", symbleTable::tvar, symbleTable::Data("char"));

			}
		///////Semantic Action/////////
		if(pass == 2){
			if(literals[0] != '\'')
				literals = "'" + literals + "'";
			SemanticAction::_lPush(literals, "char");
		}
		///////////////////////////////

		return true;		
	}
	bool numeric_literal_function()
	{
		token t = get_nextToken();
		if(t.str1 == "+"){
			number_function();
			if(pass == 1)
			{
				//symbleTable::KINDS = symbleTable::Kinds.tvar;
				symbleTable::add("g", 'l', literals, symbleTable::tvar, symbleTable::Data("int"));
			}
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_lPush( literals, "int" /* pass in the number */);
			///////////////////////////////
			return true;
		}
		else{
			if(t.str1 != "-"){
				prev_token();
				if(number_function()){
					if(pass == 1)
					{
						symbleTable::add("g", 'l', literals, symbleTable::tvar, symbleTable::Data("int"));
					}

					///////Semantic Action/////////
					if(pass == 2)
						SemanticAction::_lPush( literals, "int" /* pass in the number */);
					///////////////////////////////

					return true;
				}
			}
			else{
				if(number_function()){
					literals = "-" + literals;
					if(pass == 1)
					{
						symbleTable::add("g", 'l', literals, symbleTable::tvar, symbleTable::Data("int"));
					}
					///////Semantic Action/////////
					if(pass == 2)
						SemanticAction::_lPush(literals, "int" /* pass in the number */);
					///////////////////////////////

					return true;
				}
			}
		}
		//prev_token();
		return false;
	}
	bool number_function()
	{
		token t = get_nextToken();
		if(t.tktype == number){
			literals = t.str1;
			return true;

		}
		prev_token();
		return false;
	}
	bool character_function()
	{
		if(nonprintable_ascii_function())
			return true;
		else if(printable_ascii_function())
			return true;
		prev_token();
		return false;
	}
	bool printable_ascii_function()
	{
		token t = get_nextToken();
		if(t.str1.size() == 1)
		{
			int a = t.str1[0];
			if(a >= 32 && a <= 126){
				literals = "'";
				literals.append(t.str1.substr(0,1));
				literals.append("'");
				return true;
			}
		}
		return false;
	}
	bool nonprintable_ascii_function()
	{
		token t = get_nextToken();
		if(t.str1[0] == '\\' )
		{
			string pair = t.str1;
			t = get_nextToken();
			pair += t.str1;
			if(pair == "\\r" || pair == "\\n" || pair == "\\t"){
				literals = pair;
				return true;
			}
		}
		else if(t.str1.size() == 1)
		{
			char a = t.str1[0];
			if(a >= 32 && a <= 126){
				literals = t.str1;
				return true;
			}
		}
		return false;
	}

	//start symbol
	int startpass1(const string& fname)
	{
		pass = 1;
		scan = new Scanner( fname);
		compiliation_unit_function();
		return error;
	}
	int startpass2(const string& fname)
	{
		pass = 2;
		scan->restartfile();
		compiliation_unit_function();
		error = SemanticAction::getErrors();
		if(!error)
		{
			//Icode_h::dumpicode();
			if(Tcode::StartTcode(Icode_h::icode))
				Tcode::dumpTCode();
			else
				++error;
		}

		return error;
	}
	bool compiliation_unit_function()
	{
		if(pass == 2){
			Icode_h::SetUpMain();
		}
		scope = "g";
		while(class_declaration_function())
		{;}
		token t = get_nextToken();
		if(t.str1 != "void"){
			gen_error(t, "void or class \n Rest of Error are most likly wrong");
		}
		t = get_nextToken();
		if(t.str1 != "main")
			gen_error(t, "main");
		t = get_nextToken();
		if(t.str1 != "(")
			gen_error(t, "(");
		t = get_nextToken();
		if(t.str1 != ")")
			gen_error(t,")");

		scope += ".main";

		if(pass == 1)
		{
			symbleTable::Data data;
			//data.accessMod = 2;
			data.type = "void";
			symbleTable::add("g", 'F', "main", symbleTable::Kinds::Func, data);
		}

		if(pass == 2)
		{
			vector<string> st;
			Icode_h::pushLable("main", st);
			Icode_h::popLable("", st);
			Icode_h::func(symbleTable::get_symTbl("g", "main").symid);
		}

		method_body_function();
		return true;
	}
	//Declarations
	bool class_declaration_function(){
		token t = get_nextToken();
		if(t.str1 != "class"){
			prev_token();
			return false;
		}
		symid = 'C';
		data = symbleTable::emptyData;
		kind = symbleTable::Class;
		data.type = "Class";
		class_name_function(true, true);
		if(pass == 1)
			symbleTable::add("g", symid, value, kind, data);

		t = get_nextToken();
		if(t.str1 != "{")
			gen_error(t, "{");
		scope += "." + value;
		while(class_member_declaration_function())	{;}
		t = get_nextToken();
		if(t.str1 != "}")
			gen_error(t, "}");
		
		//back step to the gobal scope
		prev_scope();
		return true;
	}
	bool class_member_declaration_function(){
		token t;
		if(modifier_function()){
			symid = 'V';
			//kind = symbleTable::ivar;
			if(!type_function())
			{
				t = get_nextToken();
				gen_error(t, "type");
			}
			//////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_tExist(scope);
			//////////////////////////////

			//t = get_nextToken();
			//cout<<t.str1<<endl;
			//prev_token();
			if(!identifier())
			{
				t = get_nextToken();
				gen_error(t, "identifier \n   This could be a constructor that has wrong syntax");
			}
			//cout<<
			if(!field_declaration_function())
			{
				t = get_nextToken();
				gen_error(t, "field_declaration");
			}
			if(pass == 1)
				symbleTable::add(scope, symid, value, kind, data);
					//cerr<<t.toString()<<"already exists in symbol table";
		}
		else{
			//prev_token();
			if(!constructor_declaration_function()){

				t = get_nextToken();
				if(t.str1.find("}") == -1)
					gen_error(t, "a Constructor or Function or Class Member starter");
				prev_token();
				return false;
			}
		}
		return true;
	}
	bool field_declaration_function(){
		token t = get_nextToken();
		if(t.str1 == "("){
			string curscope = scope;
			string curvalue = value;
			char cursymid = 'F';
			symbleTable::Kinds curkind = symbleTable::Func;
			symbleTable::Data curdata = data;

			scope += "." + value;
			parameter_list_function(true);

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			curvalue += valuearglist;
			if(pass == 1)
				symbleTable::add(curscope, cursymid, curvalue, curkind, curdata);
			////////Semantic Action//////
			if(pass == 2){ 
				thetoken = symbleTable::get_symTbl(curscope, curvalue);
				SemanticAction::_vPush(thetoken);

				Icode_h::pushLable(curvalue, Icode_h::labelstack);
				Icode_h::popLable("", Icode_h::labelstack);

				Icode_h::func(thetoken.symid);
			}
			////////////////////////////
			method_body_function();
			if(pass == 2)
			{
				//Icode_h::RTN();
			}
			//prev_scope();
			string str = scope;
		}
		else{
			if(t.str1 == "[")
			{
				t = get_nextToken();
				if(t.str1 != "]")
					gen_error(t, "]");
				t = get_nextToken();
				data.type = "@:" + data.type;
			}

			if(t.str1 == "="){

				/////// Semantic Action//////
				if(pass == 2) 
					SemanticAction::_oPush("=");
				////////////////////////

				assignment_expression_function();
				t = get_nextToken();
			}
			if(t.str1 != ";")
				gen_error(t, ";");
			///////Semantic Action///////
			if(pass == 2)
				SemanticAction::_eoe();
			//////////////////////////////
		}

			return true;
	}
	bool constructor_declaration_function()
	{
		//class_name "(" [parameter_list] ")" method_body ;
		string curscope = scope;
		token t = get_nextToken();
		prev_token();
		if(!class_name_function(false, true))
			return false;
		
		/////////Semantic Action///////
		if(pass == 2)
			SemanticAction::_cd(scope.substr(scope.find_last_of(".")+1, scope.size()), t.str1);
		////////////////////////////////

		t = get_nextToken();
		if(t.str1 != "("){
			prev_token();
			prev_token();
			return false;
			//gen_error(t, "( assumes that this is a constructor");
		}
		string curvalue = value;
		char cursymid = 'F';
		symbleTable::Kinds curkind = symbleTable::Func;
		symbleTable::Data curdata = data;
		curdata.type = scope.substr(scope.find(".")+1, scope.size()); //"Con";

		scope += "." + value;
		parameter_list_function(true);

		t = get_nextToken();
		if(t.str1 != ")")
			gen_error(t,")");

		curvalue += valuearglist;
		if(pass == 1)
			symbleTable::add(curscope, cursymid, curvalue, curkind, curdata);
		/////////Semantic Action///////////
		if(pass == 2){ //Semantic Action
			thetoken = symbleTable::getToken(curscope, cursymid, curvalue, curkind, curdata);
		
			Icode_h::pushLable(curvalue, Icode_h::labelstack);
			Icode_h::popLable("", Icode_h::labelstack);

			Icode_h::func(thetoken.symid);
		}
		///////////////////////////////////

		method_body_function();
		
		if(pass == 2)
		{
			Icode_h::RETURN("this");
		}
		//prev_scope();
		string str = scope;
		return true;
	}
	bool method_body_function()
	{
		token t = get_nextToken();
		if(t.str1 != "{")
			gen_error(t, "{");

		data.accessMod = symbleTable::_private;
		symid = 'K';
		if(pass == 2)
		{
			//Icode_h::func("func");
		}

		while(variable_declaration_function()){;}

		while(statement_function()) {;}

		t = get_nextToken();
		if(t.str1 != "}")
			gen_error(t, "}");

		if(pass == 2)
		{
			Icode_h::RTN();
		}
		prev_scope();

		return true;
	}
	bool variable_declaration_function()
	{
		token t;
		if(!type_function()){
			return false;
		}
		///////Semantic Action/////////
		if(pass == 2)
			SemanticAction::_tExist(scope);
		///////////////////////////////

		if(!identifier()){
			prev_token();
			return false;
		}

		t = get_nextToken();
		if(t.str1 == "[")
		{
			t = get_nextToken();
			if(t.str1 != "]")
				gen_error(t, "]");
			data.type = "@:" + data.type;
			t = get_nextToken();
		}

		if(pass == 1){
			symbleTable::add(scope, symid, value, kind, data);
		}

		//////Semantic Action/////////
		if(pass == 2){
			SemanticAction::_vPush(symbleTable::getToken(scope, symid, value, kind, data));
		}
		/////////////////////////////
		
		if(t.str1 == "="){
			////////Semantic Action//////////
			if(pass == 2)
				SemanticAction::_oPush("=");
			/////////////////////////////////

			assignment_expression_function();
			t = get_nextToken();
		}
		
		if(t.str1 != ";")
			gen_error(t, ";");

		////////Semantic Action////////
		if(pass == 2)
			SemanticAction::_eoe();
		///////////////////////////////

		return true;
	}
	bool parameter_list_function(bool function)
	{
		//  parameter { "," parameter }
		//cerr << "Here in the Parameter_list_function";
		symid = 'P';
		valuearglist = "(";
		token t;
		do {
			parameter_function(function);
			if((t = get_nextToken()).str1 == ","){
				valuearglist += ",";
			}
		}while(t.str1 == ",");

		prev_token();
		valuearglist += ")";

		//cerr<< "current valuearglist is " << valuearglist << endl;

		return true;
	}
	bool parameter_function(bool function)
	{
		token t;
		if( !type_function()){
			return false;
		}
		if(function)
			valuearglist += data.type;

		///////Semantic Action/////////
		if(pass == 2)
			SemanticAction::_tExist(scope);
		//////////////////////////////

		if(!identifier()){
			t = get_nextToken();
			gen_error(t, "identifier");
		}

		t = get_nextToken();
		if(t.str1 == "[")
		{
			t = get_nextToken();
			if(t.str1 != "]")
				gen_error(t, "]");
			data.type = "@:" + data.type;
			//t = get_nextToken();
		}
		else
			prev_token();
		if(pass == 1){
			symbleTable::add(scope, symid, value, kind, data);
			//	cerr<<t.toString()<<"already exists in symbol table";
		}
		if(pass == 2)
		{
			//Icode_h::push(symbleTable::get_symTbl(scope, value).symid);
		}
		return true;
	}
	bool statement_function()
	{
		token t;
		t = get_nextToken();

		if(t.str1 == "{")
		{
			while(statement_function())
			{;}

			t = get_nextToken();
			if(t.str1 != "}")
				gen_error(t, "}");

			prev_token();
		}
		else {if(t.str1 == "if")
		{
			t = get_nextToken();
			if(t.str1 != "(")
				gen_error(t, "(");

			////////Semantic Action//////////
			if(pass == 2)
				SemanticAction::_oPush("(");
			/////////////////////////////////

			expression_function();

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			////////Semantic Action///////////
			vector<string> ifstack;
			if(pass == 2){
				SemanticAction::_cParen();
				SemanticAction::_if();
				
				Icode_h::pushLable("if", ifstack);
			}
			/////////////////////////////////
			bool hasclos = false;
			t = get_nextToken();
			if(t.str1 == "{")
				hasclos = true;
			prev_token();

			statement_function();
			if(pass == 2)
				Icode_h::popLable("if", ifstack);
			t = get_nextToken();
			if(t.str1 == "}" && hasclos)
				t = get_nextToken();
			if(t.str1 == "else"){
				if(pass == 2){
					Icode_h::pushLable("else", ifstack);
					Icode_h::JMP(ifstack.back());
				}
				hasclos = false;
				t = get_nextToken();
				if(t.str1 == "{")
					hasclos = true;
				prev_token();

				statement_function();

				if(pass == 2)
					Icode_h::popLable("else", ifstack);
				
				if(hasclos)
					t = get_nextToken();
			}
			else{
				prev_token();
			}
			return true;
		}
		else {if(t.str1 == "while")
		{
			string str;
			vector<string> whstack;
			if(pass == 2){
				Icode_h::pushLable("whileb", whstack);
				str = whstack.back();
				Icode_h::popLable("whileb", whstack);
			}
			t = get_nextToken();
			if(t.str1 != "(")
				gen_error(t, "(");

			////////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("(");
			////////////////////////////////

			expression_function();

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			/////////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen();
				SemanticAction::_while();
			}
			////////////////////////////////

			if(pass == 2){
				Icode_h::pushLable("whilen", whstack);
			}

			statement_function();

			if(pass == 2){
				Icode_h::JMP(str);
				Icode_h::popLable("whilen", whstack);
			}

			t = get_nextToken();
			return true;
		}
		else {if(t.str1 == "return")
		{
			expression_function();
			
			t = get_nextToken();
			if(t.str1 != ";")
				gen_error(t, ";");

			//////////Semantic Action///////////
			if(pass == 2){
				SemanticAction::_eoe(false);
				SemanticAction::_return(scope);
				SemanticAction::_eoe();
			}
			/////////////////////////////////////
		}
		else {if(t.str1 == "cout")
		{
			t = get_nextToken();
			if(t.str1 != "<<")
				gen_error(t, "<<");

			expression_function();
			
			t = get_nextToken();
			if(t.str1 != ";")
				gen_error(t, ";");

			/////////Semantic Action///////
			if(pass == 2){
				SemanticAction::_eoe(false);
				SemanticAction::_cout();
				SemanticAction::_eoe();

			}
			////////////////////////////////
			return true;
		}
		else {if(t.str1 == "cin")
		{
			t = get_nextToken();
			if(t.str1 != ">>")
				gen_error(t, ">>");

			expression_function();
			
			t = get_nextToken();
			if(t.str1 != ";")
				gen_error(t, ";");

			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_eoe(false);
				SemanticAction::_cin();
				SemanticAction::_eoe();
			}
			//////////////////////////////
			return true;
		}
		else{
			prev_token();
			if(	expression_function()){
				t = get_nextToken();
				if(t.str1 != ";")
					gen_error(t, ";");

				////////Semantic Action//////////
				if(pass == 2){
					SemanticAction::_eoe();
				}
				////////////////////////////////
				return true;
			}
		}}}}}}
		return false;
	}
	bool expression_function()
	{
		/*************************
		expression::=
			"(" expression ")" [ expressionz ]
			| "true" [ expressionz ]
			| "false" [ expressionz ]
			| "null" [ expressionz ]
			| numeric_literal [ expressionz ]
			| character_literal [ expressionz ]
			| identifier [ fn_arr_member ] [ member_refz ] [ expressionz ]
		;
		*************************/
		token t;
		t = get_nextToken();

		//cerr << "Expression !";

		if(t.str1 == "(")
		{
			///////Semantic Action//////////
			if(pass == 2){
				SemanticAction::_oPush("(");
			}
			///////////////////////////////

			if(!expression_function()){
				t = get_nextToken();
				gen_error(t, "expression");
				//return true;
			}
			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen();
			}
			///////////////////////////////

			expressionz_function();
			return true;
		}
		else {if(t.str1 == "true")
		{
			if(pass == 1)
			{
				symbleTable::add("g", 'l', "true", symbleTable::ivar, symbleTable::Data("bool"));
			}
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_lPush(string("true"), "bool");
			}
			///////////////////////////////
			expressionz_function();
			return true;
		}else {if(t.str1 == "false")
		{
			if(pass == 1)
			{
				symbleTable::add("g", 'l', "false", symbleTable::ivar, symbleTable::Data("bool"));
			}
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_lPush(string("false"), "bool");
			}
			///////////////////////////////
			expressionz_function();
			return true;
		}else {if(t.str1 == "null")
		{
			if(pass == 1)
			{
				symbleTable::add("g", 'l', "null", symbleTable::ivar, symbleTable::Data("Class"));
			}
			////////Semantic Action////////
			if(pass == 2){
				SemanticAction::_lPush(string("null"), "Class");
			}
			///////////////////////////////

			expressionz_function();
			return true;
		}else {
		prev_token();
		if(numeric_literal_function())
		{
			expressionz_function();
			return true;
		}else {if(character_literal_function())
		{
			expressionz_function();
			return true;
		}else {if(identifier())
		{
			/////////Semantic Action/////////
			if(pass == 2){
				thetoken = symbleTable::get_symTbl(scope, value);
				SemanticAction::_iPush(thetoken);
			}
			////////////////////////////////
			fn_arr_member_function();

			/////Semantic Action/////
			if(pass == 2){
				SemanticAction::_iExist(scope);
			}
			/////////////////////////

			if(member_refz_function(thetoken))
			{
				//if(pass == 2 ){
					//symbleTable::identifertype id = SemanticAction::Get_topSASid();
					//if( id.symid.find('F') != -1){
					//	//Icode_h::call(SemanticAction::Get_topSASid().value);
					//}
				//}
			}
			if(!expressionz_function()){
				t = get_nextToken();
				if(t.str1.find(';') == -1 && t.str1.find(',') == -1 && t.str1.find(')') == -1 && t.str1.find(']') == -1)
					gen_error(t, "an expression modifer like * or =");
				prev_token();
			}
			return true;
		}}}}}}}

		return false;
	}
	bool fn_arr_member_function()
	{
		//"(" [ argument_list ] ")" | "[" expression "]"
		token t;
		t = get_nextToken();
		if(t.str1 == "(")
		{
			//cerr << "found Function\n";
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_oPush("(");
				SemanticAction::_bal();
			}
			///////////////////////////////

			argument_list_function();

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen();
				//Icode_h::push(SemanticAction::Get_topSASid().symid);
				SemanticAction::_eal();
				SemanticAction::_func();
			}
			//////////////////////////////

			return true;
		}
		else{
			if(t.str1 == "[")
			{
				///////Semantic Action/////////
				if(pass == 2){
					SemanticAction::_oPush("[");
				}
				///////////////////////////////

				if(!expression_function())
				{
					t = get_nextToken();
					if(t.str1 == "]"){
						prev_token();
					}
					gen_error(t, "Extression");
				}
				t = get_nextToken();
				if(t.str1 != "]")
					gen_error(t, "]");
				data.type = "@:" + data.type;

				///////Semantic Action/////////
				if(pass == 2){
					SemanticAction::_cSquBracket();
					SemanticAction::_arr();
				}
				////////////////////////////////

				return true;
			}

		}
		prev_token();
		return false;
	}
	bool argument_list_function()
	{
		// expression { "," expression }
		token t;
		symid = 'P';
		while(expression_function())
		{
			//cerr << "argument_list\n";
			if(get_nextToken().str1 != ",")
			{
				prev_token();
				break;
			}
			///////Semantic Action/////////
			if(pass == 2){
				//cerr<<
				
				SemanticAction::_arg();
			}
			//////////////////////////////
		}
		return true;

	}
	bool member_refz_function(const symbleTable::identifertype& id)
	{
		//  "." identifier [ fn_arr_member ] [ member_refz ]
		token t;
		t = get_nextToken();
		if(t.str1 != "."){
			prev_token();
			return false;
		}
		identifier();

		///////Semantic Action/////////
		if(pass == 2){
			if(id.scope.find(id.data.type) != -1)
				thetoken = symbleTable::get_symTbl(id.scope, value);
			else
				thetoken = symbleTable::get_symTbl("g." + id.data.type, value);
			SemanticAction::_iPush(thetoken);
		}
		////////////////////////////////

		fn_arr_member_function();
		
		///////Semantic Action/////////
		if(pass == 2){
			SemanticAction::_rExist(scope, id);
		}
		////////////////////////////////
		member_refz_function(thetoken);

		return true;
	}
	bool expressionz_function()
	{
		//   "=" assignment_expression 
		//	| "&&" expression		/* logical connective expression */
		//	| "||" expression		/* logical connective expression */
		//	| "==" expression		/* boolean expression */
		//	| "!=" expression		/* boolean expression */
		//	| "<=" expression		/* boolean expression */
		//	| ">=" expression		/* boolean expression */
		//	| "<" expression		/* boolean expression */
		//	| ">" expression		/* boolean expression */
		//	| "+" expression		/* mathematical expression */
		//	| "-" expression		/* mathematical expression */
		//	| "*" expression		/* mathematical expression */
		//	| "/" expression		/* mathematical expression */

		token t;
		t = get_nextToken();

		if(t.str1 == "=")
		{
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_oPush("=");
				SemanticAction::setScope(scope);
			}
			///////////////////////////////

			//NOTE: find way to know if it needs to be == not =

			assignment_expression_function();
			return true;
		}
		else {if(t.str1 == "&&")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("&&");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "||")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("||");
			////////////////////////////////
			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "==")
		{
			///////Semantic Action/////////
			if(pass == 2) 
				SemanticAction::_oPush("==");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "!=")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("!=");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "<=")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("<=");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == ">=")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush(">=");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == ">")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush(">");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "<")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("<");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "+")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("+");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "-")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("-");
			///////////////////////////////
			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "*")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("*");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}else {if(t.str1 == "/")
		{
			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("/");
			////////////////////////////////

			if(!expression_function())
				gen_error(t, "");
			return true;
		}
		else{
			prev_token();
		}}}}}}}}}}}}}
		return false;
	}
	bool assignment_expression_function()
	{
			//  expression
			//| "this"
			//| "new" type new_declaration
			//| "atoi" "(" expression ")"
			//| "itoa" "(" expression ")"
				
		token t;
		t = get_nextToken();
		
		if(t.str1 == "this")
		{
			return true;
		}
		else {if(t.str1 == "new")
		{
			if(!type_function())
				gen_error( t.linenum, "No Object can be made of this type bacause its not a valid type");
			if(!new_declaration_function())
				gen_error( t.linenum, "No Object can be made of this type bacause its not a valid type");
			return true;
		}
		else {if(t.str1 == "atoi")
		{
			t = get_nextToken();
			if(t.str1 != "(")
				gen_error(t, "(");

			///////Semantic Action/////////
			if(pass == 2)
				SemanticAction::_oPush("(");
			////////////////////////////////

			if(!expression_function())
				gen_error(t, "");

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen();
				SemanticAction::_atoi();
			}
			//////////////////////////////

			return true;
		}
		else {if(t.str1 == "itoa")
		{
			t = get_nextToken();
			if(t.str1 != "(")
				gen_error(t, "(");

			///////Semantic Action/////////
			if(pass == 2) 
				SemanticAction::_oPush("(");
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");

			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");

			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen();
				SemanticAction::_itoa();
			}
			////////////////////////////////

			return true;
		}
		else {
			prev_token();
			if(expression_function())
			{
				return true;
			}
			//prev_token();
		}}}}
		return false;
	}
	bool new_declaration_function()
	{
		//"(" [ argument_list ] ")"
		//| "[" expression "]"

		token t;
		t = get_nextToken();

		if(t.str1 == "(")
		{
			///////Semantic Action/////////
			if(pass == 2){ 
				SemanticAction::_oPush("(");
				SemanticAction::_bal();
			}
			///////////////////////////////

			argument_list_function();
		
			t = get_nextToken();
			if(t.str1 != ")")
				gen_error(t, ")");
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_cParen(); 
				SemanticAction::_eal();
				SemanticAction::_newObj();
			}
			////////////////////////////////

			return true;
		}
		else {if(t.str1 == "[")
		{
			///////Semantic Action/////////
			if(pass == 2){
				SemanticAction::_oPush("[");
			}
			///////////////////////////////

			if(!expression_function())
				gen_error(t, "");
		
			t = get_nextToken();
			if(t.str1 != "]")
				gen_error(t, "]");
			data.type = "@:" + data.type;

			symbleTable::add("", 'R', "", kind, data);

			///////Semantic Action/////////////
			if(pass == 2){
				SemanticAction::_cSquBracket(); 
				SemanticAction::_newarray(scope);
			}///////////////////////////////

			return true;
		}
		else{
			prev_token();
			return false;
		}}
	}
}