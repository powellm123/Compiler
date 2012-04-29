#ifndef syntax_h
#define syntax_h

#include "scanner.h"
#include "symbleTable.h"
#include "SemanticAction.h"
#include "Icode.h"
#include "Tcode.h"
#include "definitions.h"

namespace syntax
{
	void prev_scope();
	const string& get_scope();
	void gen_error();
	void gen_error(token, string);
	void prev_token();
	token get_nextToken();
	bool identifier();
	bool keyword_function(const token& t);
	bool modifier_function();
	bool type_function(bool = false);
	bool class_name_function(bool function = true, bool isClass = false);
	bool character_literal_function();
	bool numeric_literal_function();
	bool number_function();
	bool character_function();
	bool printable_ascii_function();
	bool nonprintable_ascii_function();
	//start symbol
	int startpass1(const string& fname = "./test.txt");
	int startpass2(const string& fname = "./test.txt");

	bool compiliation_unit_function();

	bool class_declaration_function();
	bool class_member_declaration_function();
	bool field_declaration_function();
	bool constructor_declaration_function();
	bool method_body_function();
	bool variable_declaration_function();
	bool parameter_list_function(bool function = false);
	bool parameter_function(bool function = false); 
	bool statement_function();
	bool expression_function();
	bool fn_arr_member_function();
	bool argument_list_function();
	bool member_refz_function(const symbleTable::identifertype&);
	bool expressionz_function();
	bool assignment_expression_function();
	bool new_declaration_function();
	void symTbDump();

}

#endif