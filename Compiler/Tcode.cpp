#include "Tcode.h"

namespace Tcode
{
	static vector<assembly> AssC;
	static vector<Icode_h::quad> quad;
	static vector<Icode_h::quad>::iterator currentquad;


	void StartTcode(vector<Icode_h::quad> qi)
	{

		quad = Icode_h::get_quadlist();
		currentquad = quad.begin();

		while(currentquad != quad.end())
		{
			if(currentquad->instr == "LT" || currentquad->instr == "GT" || currentquad->instr == "NE" || currentquad->instr == "EQ" || currentquad->instr == "LE" || currentquad->instr == "GE")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# Boolean"));
				Boolean();
			}else if(currentquad->instr == "BF" || currentquad->instr == "BT")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# Branch"));
				Branch();
			}else if(currentquad->instr == "CALL")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# CALL"));
				call();
			}else if(currentquad->instr == "FRAME")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# FRAME"));
				frame();
			}else if(currentquad->instr == "FUNC")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# FUNC"));
				func();
			}else if(currentquad->instr == "JMP")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# JMP"));
				JMP();
			}else if(currentquad->instr == "NEWI")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# NEWI"));
				newi();
			}else if(currentquad->instr == "NEW")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# NEWA"));
				newa();
			}else if(currentquad->instr == "ADD" || currentquad->instr == "ADI" 
				|| currentquad->instr == "SUB" || currentquad->instr == "MUL" 
				|| currentquad->instr == "DIV" || currentquad->instr == "AND" 
				|| currentquad->instr == "OR")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# Math"));
				Math();
			}else if(currentquad->instr == "MOV" || currentquad->instr == "MOVI")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# MOVE"));
				move();
			}else if(currentquad->instr == "PUSH")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# PUSH"));
				push();
			}else if(currentquad->instr == "POP")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# POP"));
				pop();
			}else if(currentquad->instr == "PEEK")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# PEEK"));
				peek();
			}else if(currentquad->instr == "READ")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# READ"));
				read();
			}else if(currentquad->instr == "RDC")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# RDC"));
				readC();
			}else if(currentquad->instr == "RDI")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# RDI"));
				readI();
			}else if(currentquad->instr == "REF")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# REF"));
				ref();
			}else if(currentquad->instr == "RETURN")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# RETURN"));
				RETURN();
			}else if(currentquad->instr == "RTN")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# RTN"));
				RTN();
			}else if(currentquad->instr == "WRITE")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# WRITE"));
				write();
			}else if(currentquad->instr == "WRTC")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# WRTC"));
				writeC();
			}else if(currentquad->instr == "WRTI")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# WRTI"));
				writeI();
			}else if(currentquad->instr == "QUIT")
			{
				Tcode::AssC.push_back(assembly("\t", "\t", "#" + currentquad->operand1 +" " + currentquad->operand2 +" " + currentquad->operand3, "# QUIT"));
				Tcode::AssC.push_back(assembly("JMP", "exit", "",""));
				Tcode::AssC.push_back(assembly("STR", "PC", "OUTPUT","ERROR"));
				Tcode::AssC.push_back(assembly("TRP", "1", "",""));
				Tcode::AssC.push_back(assembly("TRP", "0", "","exit"));

				Tcode::AssC.push_back(assembly("LDB", "R0", "nl","Debug"));	

				Tcode::AssC.push_back(assembly("STB", "R0", "OUTPUT",""));	
				Tcode::AssC.push_back(assembly("TRP", "3", "",""));

				Tcode::AssC.push_back(assembly("SUB", "R0", "R0",""));
				Tcode::AssC.push_back(assembly("ADI", "R0", "25",""));
				Tcode::AssC.push_back(assembly("STR", "R0", "OUTPUT",""));	
				Tcode::AssC.push_back(assembly("TRP", "1", "",""));
				Tcode::AssC.push_back(assembly("TRP", "0", "",""));
				Tcode::AssC.push_back(assembly(".BYT", "10", "","nl"));

			}else if(currentquad->instr == "START")
			{
				//Tcode::AssC.push_back(assembly("", "", "", "# START"));
				//Tcode::AssC.push_back(assembly("RUN", "R0", "START", ""));
			}else{
				cerr << "Not a command " << currentquad->instr; 
			}

			currentquad++;
		}
		storeLits();
	}
	void storeLits()
	{
		vector<symbleTable::identifertype> lists = (symbleTable::getLiters());
		while(!lists.empty()){
			symbleTable::identifertype id = lists.back();
			if(id.value != "null" && id.value != "true" && id.value != "false" ){
				if(id.data.type == "char"){
					if(id.value.find("\\") != -1){ 
						if(id.value.find("n") != -1)
							Tcode::AssC.push_back(assembly(".BYT", "10" , "", id.symid));
						if(id.value.find("r") != -1)
							Tcode::AssC.push_back(assembly(".BYT", "13" , "", id.symid));
						if(id.value.find("t") != -1)
							Tcode::AssC.push_back(assembly(".BYT", "9" , "", id.symid));
					}
					else
						Tcode::AssC.push_back(assembly(".BYT", id.value , "", id.symid));
				}
				else
					Tcode::AssC.push_back(assembly(".INT", id.value, "", id.symid));
			}
			else if(id.value == "null" || id.value == "false" ){
				Tcode::AssC.push_back(assembly(".INT", "0" , "", id.symid));				
			}
			else if ( id.value == "true" ){
				Tcode::AssC.push_back(assembly(".INT", "1" , "", id.symid));
			}
			lists.pop_back();
		}
		Tcode::AssC.push_back(assembly(".INT", "stFREE", "", "FREE"));
		Tcode::AssC.push_back(assembly(".INT", "0", "", "stFREE"));

	}
	void dumpTCode()
	{
		for(vector<assembly>::iterator it = AssC.begin(); it != AssC.end(); it++)
		{
			if(it->comment != "")
				cout<<it->label<<"\t"<<it->instr<<"\t"<<it->operand1<<"\t"<<it->operand2<<"\t\t\t# "<<it->comment<<endl;
			else
				cout<<it->label<<"\t"<<it->instr<<"\t"<<it->operand1<<"\t"<<it->operand2<<endl;

		}
	}

	////////////////////////////HELPER FUNCTIONS//////////////////////////////////
	string getOffset(const string& symid)
	{
		stringstream ss;
		int x;
		if(symid == "this")
		{
			x = -8;
		}
		else{
			symbleTable::identifertype id = symbleTable::get_symTbl(symid);
			string scope = id.scope.substr(0, id.scope.find_last_of('.'));
			string func =  id.scope.substr(id.scope.find_last_of('.')+1, id.scope.size());
			if( id.symid.find('t') != -1 || id.symid.find('P') != -1 || id.symid.find('R') != -1 || id.symid.find('K') != -1 || symbleTable::get_symTbl(scope, func).symid.find('F') != -1)
				x = -4 * symbleTable::getLocation(symid) - 12;
			else
				x = 4 * symbleTable::getLocation(symid);
		}
		ss<< x;
		return ss.str();
	}
	string getCountSize(const string& func)
	{
		stringstream ss;
		ss << -4 * symbleTable::getcount(symbleTable::findscopefromfunc(func));
		return ss.str();
	}
	string getlableName(const string& label)
	{
		if(label == "BRN")
		{
			return curlabelnum;// + ss.str();
		}
		else if(label == "BRNEND")
		{
			return curlabelend; // + ss.str();
		}else{
			return label;
		}
	}
	string getObjSize(const string& amount)
	{
		stringstream ss;
		ss << stoi(amount) * 4;
		return ss.str();
	}

	void makelabel(const string& label)
	{
		stringstream ss;
		if(label == "BRN")
		{
			ss << labelnumber++;
			curlabelnum = label + ss.str();
		}
		else if(label == "BRNEND")
		{
			ss << labelendnum++;
			curlabelend = label + ss.str();
		}
	}
	void getLoc(const string& regis, const string& symid, const string& label, bool ignoreR, bool arrayref)
	{
		auto kind = symbleTable::get_symTbl(symid).kind;
		if(ignoreR){
			Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
			Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));	
		}else if( arrayref && kind == symbleTable::Aref){
				Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));			

		}else if( arrayref && kind == symbleTable::CAref){
				Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));			
				Tcode::AssC.push_back(assembly("LDR", regis, regis));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));			

		}else{
			switch(symid[0])
			{
			case 'K':
			case 'P':
			case 't':
				Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));			
				break;
			case 'V':
				Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
				Tcode::AssC.push_back(assembly("ADI", regis, "-8"));			
				Tcode::AssC.push_back(assembly("LDR", regis, regis));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));			
				break;
			case 'R':
				Tcode::AssC.push_back(assembly("MOV", regis, "FP", label));
				Tcode::AssC.push_back(assembly("ADI", regis, getOffset(symid)));				
				Tcode::AssC.push_back(assembly("LDR", regis, regis));
				break;

			}
		}

	}
	void getValue(const string& regis, const string& symid, const string& label)
	{
		if(symid.find('l') == -1){
			getLoc(regis, symid, label);
			if(symbleTable::get_symTbl(currentquad->operand1).data.type == "char")
				Tcode::AssC.push_back(assembly("LDB", regis, regis));
			else
				Tcode::AssC.push_back(assembly("LDR", regis, regis));
		}
		else{
			if(symbleTable::get_symTbl(currentquad->operand1).data.type == "char")
				Tcode::AssC.push_back(assembly("LDB", regis, symid, label));
			else
				Tcode::AssC.push_back(assembly("LDR", regis, symid, label));
		}
	}
	//////////////////////////////////////////////////////////////////////////////

	//////NOT USED//////////////////////
	
	void read(){}
	void write(){}

	/////////////////////////////////////

	void Boolean()
	{
		////////////Set up ///////////
		makelabel("BRN");
		makelabel("BRNEND");
		getValue("R3", currentquad->operand1, currentquad->label);
		getValue("R4", currentquad->operand2);
		getLoc("R5", currentquad->operand3);
		/////////////////////////////
		AssC.push_back(assembly("CMP", "R4", "R3"));
		AssC.push_back(assembly("CMP", "R3", "R3", "", "Making Registor 3 zero"));

		if(currentquad->instr == "LT"){
			AssC.push_back(assembly("BLT", "R4", getlableName("BRN")) );
		}if( currentquad->instr == "GT" ){
			AssC.push_back(assembly("BGT", "R4", getlableName("BRN")));
		}if( currentquad->instr == "NE"){
			AssC.push_back(assembly("BNZ", "R4", getlableName("BRN")));

		}if( currentquad->instr == "EQ"){
			AssC.push_back(assembly("BRZ", "R4", getlableName("BRN")));

		}if( currentquad->instr == "LE"){
			AssC.push_back(assembly("BLT", "R4", getlableName("BRN")));
			AssC.push_back(assembly("BRZ", "R4", getlableName("BRN")));

		}if( currentquad->instr == "GE"){
			AssC.push_back(assembly("BGT", "R4", getlableName("BRN")));
			AssC.push_back(assembly("BRZ", "R4", getlableName("BRN")));
		}
		AssC.push_back(assembly("STR", "R3", "R5"));
		AssC.push_back(assembly("JMP", getlableName("BRNEND")));
		AssC.push_back(assembly("ADI", "R3", "1",  getlableName("BRN")));
		AssC.push_back(assembly("STR", "R3", "R5"));
			
		AssC.push_back(assembly("CMP","R13", "R13", getlableName("BRNEND")));
	}
	void Branch()
	{
		getValue("R3", currentquad->operand1, currentquad->label);
		if(currentquad->instr == "BF")
		{
			AssC.push_back(assembly("BRZ","R3", currentquad->operand2 ));
		}
		if(currentquad->instr == "BT")
		{
			AssC.push_back(assembly("BNZ","R3", currentquad->operand2 ));
		}
	}
	void call()
	{
		//Get PC
		AssC.push_back(assembly("MOV","R10","PC",currentquad->label));

		//Compute Return Address
		AssC.push_back(assembly("ADI","R10","21"));

		//FP = SP
		AssC.push_back(assembly("MOV","FP","R0", "", "Sets FP to new Frame"));

		//Store Return Address 
		AssC.push_back(assembly("STR","R10","FP"));

		//Jump to function F
		AssC.push_back(assembly("JMP",currentquad->operand1));

	}
	void frame()
	{
		//Test for overflow (SP <  SL) using the space needed for the Frame
		AssC.push_back(assembly("MOV","R1","SP",currentquad->label,  "ERROR Checking for Stack OverFlow"));
		AssC.push_back(assembly("ADI","R1",getCountSize(currentquad->operand1)));
		AssC.push_back(assembly("LDR","R2","FREE"));
		AssC.push_back(assembly("CMP","R1","R2"));
		AssC.push_back(assembly("BLT","R1","ERROR"));

		//Point at Current Activation Record (FP = SP)
		AssC.push_back(assembly("MOV","R0","SP", "", "Stores Stack Pointer into Registor 0"));
		
		//Adjust Stack Pointer for Return Address
		AssC.push_back(assembly("ADI","SP","-4","", "Adjust Stack Pointer for Return Address"));
		
		//Store PFP to Top of Stack
		AssC.push_back(assembly("STR", "FP","SP", "", "Stores Location of FP into SP"));

		//Adjust Stack Pointer for PFP
		AssC.push_back(assembly("ADI","SP","-4", "", "Adjust Stack Pointer for Return Address"));
		//Store this pointer to Top of Stack
		if(currentquad->operand1 == "main"){
			AssC.push_back(assembly("LDR","R3", symbleTable::getLitSymb(0), "", "Main Storing 0 as This PTR"));
		}

		else{
			AssC.push_back(assembly("","", "", "", "Function call Storing " + currentquad->operand2 + " as This PTR"));
			getValue("R3", currentquad->operand2, "");
		}
		AssC.push_back(assembly("STR", "R3","SP"));

		//Adjust Stack Pointer for this
		AssC.push_back(assembly("ADI","SP","-4", "","Adjust Stack Pointer for Return Address"));
	}
	void func()
	{
		//Allocate # bytes of space on the Stack for Temporary 
		// and Local Variables. # is a negative number.
		AssC.push_back(assembly("ADI","SP",getCountSize(currentquad->operand1), currentquad->label, "Allocates space on top of stack"));
	}
	void JMP()
	{
		AssC.push_back(assembly("JMP",currentquad->operand1, currentquad->label));
	}
	void newa()
	{
		AssC.push_back(assembly("LDR","R3", "FREE", currentquad->label, "Allocates space in heap for Array"));

		getLoc("R4", currentquad->operand2);
		AssC.push_back(assembly("STR","R3", "R4"));
		getLoc("R5", currentquad->operand1);
		AssC.push_back(assembly("LDR","R5", "R5", ""));
		AssC.push_back(assembly("ADD","R3", "R5", "" ));
		AssC.push_back(assembly("STR","R3", "FREE"));
	}
	void newi()
	{
		AssC.push_back(assembly("LDR","R3", "FREE", currentquad->label, "Allocates space in heap for object"));

		getLoc("R4", currentquad->operand2);
		AssC.push_back(assembly("STR","R3", "R4"));
		
		AssC.push_back(assembly("ADI","R3", getObjSize(currentquad->operand1)));
		AssC.push_back(assembly("STR","R3", "FREE"));

	}
	void Math()
	{
		auto k = symbleTable::get_symTbl(currentquad->operand3).kind;
		//cerr << int(k);
		getValue("R3", currentquad->operand1, currentquad->label);
		getValue("R4", currentquad->operand2);
		AssC.push_back(assembly(currentquad->instr,"R4", "R3", "",  "DO Math Operation on " + symbleTable::get_symTbl(currentquad->operand1).value + " and " + symbleTable::get_symTbl(currentquad->operand2).value));
		if(k == symbleTable::Aref || k == symbleTable::CAref)
			getLoc("R5", currentquad->operand3, "", true, true);
		else if(currentquad->operand3.find('R') != -1)
			getValue("R5", currentquad->operand3);
		else 
			getLoc("R5", currentquad->operand3);
		AssC.push_back(assembly("STR","R4", "R5"));
	}
	void move()
	{
		getValue("R3", currentquad->operand1, currentquad->label);
		getLoc("R4", currentquad->operand2);
		if(symbleTable::get_symTbl(currentquad->operand1).data.type == "char")
			AssC.push_back(assembly("STB","R3", "R4", "", "Stores " + symbleTable::get_symTbl(currentquad->operand1).value + " into " + symbleTable::get_symTbl(currentquad->operand2).value));
		else
			AssC.push_back(assembly("STR","R3", "R4", "", "Stores " + symbleTable::get_symTbl(currentquad->operand1).value + " into " + symbleTable::get_symTbl(currentquad->operand2).value) );
	}
	void push()
	{
		getValue("R3", currentquad->operand1, currentquad->label);
		AssC.push_back(assembly("STR","R3", "SP", "", "Stores " + symbleTable::get_symTbl(currentquad->operand1).value + " into top of stack"));
		AssC.push_back(assembly("ADI","SP", "-4"));
	}
	void pop(){}
	void peek()
	{
		if(symbleTable::get_symTbl(currentquad->operand1).data.type == "char")
			AssC.push_back(assembly("LDB","R3", "SP", currentquad->label, "loads what is returned from the prev function call"));
		else
			AssC.push_back(assembly("LDR","R3", "SP", currentquad->label, "loads what is returned from the prev function call" ) );

		getLoc("R4", currentquad->operand1);

		if(symbleTable::get_symTbl(currentquad->operand1).data.type == "char")
			AssC.push_back(assembly("STB","R3", "R4"));
		else
			AssC.push_back(assembly("STR","R3", "R4") );
	}
	void readC()
	{
		AssC.push_back(assembly("TRP","4","", currentquad->label));
		AssC.push_back(assembly("LDB","R4","INPUT"));
		getLoc("R3", currentquad->operand1);
		AssC.push_back(assembly("STB","R4","R3"));
			
	}
	void readI()
	{
		AssC.push_back(assembly("TRP","2","", currentquad->label));
		AssC.push_back(assembly("LDR","R4","INPUT"));
		getLoc("R3", currentquad->operand1);
		AssC.push_back(assembly("STR","R4","R3"));
	}
	void ref()
	{
		getValue("R3", currentquad->operand2, currentquad->label);
		AssC.push_back(assembly("ADI","R3", getOffset(currentquad->operand1), "", "Adds the offset of ""Stores " + symbleTable::get_symTbl(currentquad->operand1).value + " to " + symbleTable::get_symTbl(currentquad->operand2).value));
		getLoc("R4", currentquad->operand3, "", true);

		AssC.push_back(assembly("STR","R3","R4"));
	}
	void RETURN()
	{
		//De-allocate Current Activation Record
		AssC.push_back(assembly("LDR","R15","FP", currentquad->label, " De-Allocating Current AR "));
		AssC.push_back(assembly("MOV","R11","FP"));
		AssC.push_back(assembly("ADI","R11","-4"));
		AssC.push_back(assembly("LDR","R14","R11"));

		//Test for Underflow (SP > SB)

		//Set Return Value
		getValue("R3", currentquad->operand1);
		AssC.push_back(assembly("STR","R3","FP","", "Storing Value into Top of Stack"));

		//Set Previous Frame to Current Frame and Return
		AssC.push_back(assembly("MOV","SP","FP", "", " Set the SP and FP to new Location "));
		AssC.push_back(assembly("MOV","FP","R14", "", " Sets the FP to the Prev Frame Pointer"));
		AssC.push_back(assembly("JMR","R15", "", "", " Jumping back to Caller "));
	}
	void RTN()
	{
		//De-allocate Current Activation Record
		AssC.push_back(assembly("LDR","R15","FP", currentquad->label, " De-Allocating Current AR "));
		AssC.push_back(assembly("MOV","R11","FP"));
		AssC.push_back(assembly("ADI","R11","-4"));
		AssC.push_back(assembly("LDR","R14","R11"));

		//Test for Underflow (SP > SB)

		//Set Previous Frame to Current Frame and Return
		AssC.push_back(assembly("MOV","SP","FP", "", " Set the SP and FP to new Location "));
		AssC.push_back(assembly("MOV","FP","R14", "", " Sets the FP to the Prev Frame Pointer"));
		AssC.push_back(assembly("JMR","R15", "", "", " Jumping back to Caller "));
	}
	void writeC()
	{
		getValue("R3", currentquad->operand1, currentquad->label);
		AssC.push_back(assembly("STB","R3","OUTPUT"));
		AssC.push_back(assembly("TRP","3",""));
	}
	void writeI()
	{
		getValue("R3", currentquad->operand1, currentquad->label);
		AssC.push_back(assembly("STR","R3","OUTPUT"));
		AssC.push_back(assembly("TRP","1",""));
	}
}