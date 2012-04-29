#ifndef Assembler_h
#define Assembler_h

#include "definitions.h"
#include "UseFile.h"

class Assembler
{
public:
	Assembler(UseFile<ifstream>* tempfile, UseFile<ofstream>* tempfileout) 
		: inputFile(tempfile), outputFile(tempfileout), toFile(true) {}
	Assembler(UseFile<ifstream>* tempfile) : inputFile(tempfile), toFile(false) {}
	~Assembler() {}
	list<string> cheap_tokenise(string const& input)
	{
		istringstream str(input);
		istream_iterator<string> cur(str), end;
		return list<string>(cur, end);
	}
	string removeComments(string input, int loc)
	{
		while(input.size() >= loc && input.size() != 0)
			input.pop_back();
		//system("pause");
		return input;
	}
	string checkComments(string input)
	{
		
		for(int i = 0; i < input.size(); i++)
		{
			if(input[i] == '#')
				input = removeComments(input, i);
		}
		return input;
	}
	void make_Table()
	{
		InstrSet.insert( pair<string, int>("JMP",	JMP));
		InstrSet.insert( pair<string, int>("JMR",	JMR));
		InstrSet.insert( pair<string, int>("BNZ",	BNZ));
		InstrSet.insert( pair<string, int>("BGT",	BGT));
		InstrSet.insert( pair<string, int>("BLT",	BLT));
		InstrSet.insert( pair<string, int>("BRZ",	BRZ));
		InstrSet.insert( pair<string, int>("MOV",	MOV));
		InstrSet.insert( pair<string, int>("LDA",	LDA));
		InstrSet.insert( pair<string, int>("STR",	STR));
		InstrSet.insert( pair<string, int>("LDR",	LDR));
		InstrSet.insert( pair<string, int>("STB",	STB));
		InstrSet.insert( pair<string, int>("LDB",	LDB));
		InstrSet.insert( pair<string, int>("ADI",	ADI));
		InstrSet.insert( pair<string, int>("ADD",	ADD));
		InstrSet.insert( pair<string, int>("SUB",	SUB));
		InstrSet.insert( pair<string, int>("MUL",	MUL));
		InstrSet.insert( pair<string, int>("DIV",	DIV));
		InstrSet.insert( pair<string, int>("AND",	AND));
		InstrSet.insert( pair<string, int>("OR",	OR));
		InstrSet.insert( pair<string, int>("CMP",	CMP));
		InstrSet.insert( pair<string, int>("TRP",	TRP));
		InstrSet.insert( pair<string, int>(".INT",	dotINT));
		InstrSet.insert( pair<string, int>(".BYT",	dotBYT));

		InstrSet.insert( pair<string, int>("RUN",	RUN));
		InstrSet.insert( pair<string, int>("END",	END));
		InstrSet.insert( pair<string, int>("BLK",	BLK));
		InstrSet.insert( pair<string, int>("LCK",	LCK));
		InstrSet.insert( pair<string, int>("ULK",	ULK));

		InstrSet.insert( pair<string, int>("PC",	0));
		InstrSet.insert( pair<string, int>("SP",	1));
		InstrSet.insert( pair<string, int>("FP",	2));
		InstrSet.insert( pair<string, int>("PFP",	3));
		InstrSet.insert( pair<string, int>("RETURN",4));

		InstrSet.insert( pair<string, int>("R0",	5));
		InstrSet.insert( pair<string, int>("R1",	6));
		InstrSet.insert( pair<string, int>("R2",	7));
		InstrSet.insert( pair<string, int>("R3",	8));
		InstrSet.insert( pair<string, int>("R4",	9));
		InstrSet.insert( pair<string, int>("R5",	10));
		InstrSet.insert( pair<string, int>("R6",	11));
		InstrSet.insert( pair<string, int>("R7",	12));
		InstrSet.insert( pair<string, int>("R8",	13));
		InstrSet.insert( pair<string, int>("R9",	14));
		InstrSet.insert( pair<string, int>("R10",	15));
		InstrSet.insert( pair<string, int>("R11",	16));
		InstrSet.insert( pair<string, int>("R12",	17));
		InstrSet.insert( pair<string, int>("R13",	18));
		InstrSet.insert( pair<string, int>("R14",	19));
		InstrSet.insert( pair<string, int>("R15",	20));

		DataSet.insert( pair<string, int>("OUTPUT", OUTPUT));
		DataSet.insert( pair<string, int>("INPUT" , INPUT));
	}
	void DUMP_DATASET()
	{
		MapType::iterator i;
		i = DataSet.begin();
		for(; i != DataSet.end(); i++)
		{
			cout<<(*i).first<<" "<<(*i).second<<endl; //.at(i)<<endl;
		}
	}
	char get_InstrSet(string s1)
	{
		return InstrSet.find(s1)->second;
	}
	int get_DataSet(string s1)
	{
		return DataSet.find(s1)->second;
	}
	bool try_InstrSet(string s1)
	{
		if(	InstrSet.count(s1)>0)
			return true;
		return false;
	}
	bool try_DataSet(string s1)
	{
		if(	DataSet.count(s1)>0)
			return true;
		return false;
	}
	int intamount(list<string> ls1)
	{
	int count = 0;
	if(ls1.front().at(0) == '{')
	{
		bool run = true;
		int spotend = 0;
		int spot;
		int state = 0;
		while(run)
		{
			if(state == 0){
				spot = ls1.front().find_first_of("0123456789-+", spotend);
				if(spot != -1)
				{
					spotend = ls1.front().find_first_of(",", spot);
					if(!ls1.empty() && spotend == -1)
					{
						spotend = ls1.front().find_first_of("}");
						if(spotend != -1){
							count++;
							run = false;
						}
						else{
							count++;
							state =1;
							ls1.pop_front();
						}
					}
					else{ if(ls1.empty() && spotend == -1){	cerr<<"ERROR NO '}' AT END OF LIST OF INTS";}
					else{ if(!ls1.empty() && spotend != -1)
						{
							//string substr = ls1.front().substr(spot, spotend - spot);
							count++;
						}
					}}
				}
				else{
					spotend = ls1.front().find_first_of("}");
					if(spotend != -1)
						run = false;
					spotend = 0;
					ls1.pop_front();
				}
			}
			if(state == 1){
				spotend = ls1.front().find_first_of(",", spot);
				if(spotend == -1 && ls1.front().length() > 0)
				{
					spot = ls1.front().find_first_of("}", spot);
					if(spot != -1)
					{
						//count++;
						state == 0;
						run = false;
					}
					else{
					cerr<<"No , between numbers!";
					system("pause");
					return 0;
					}
				}
				else{
					if(spotend == -1 && ls1.front().length() ==0)
						ls1.pop_front();
					else if(spotend != -1) { state = 0; } }
			}
		}
		return count;
	}
	else
		return 1;
}
	int charamount(list<string> ls1)
	{
		string str = "";
		while(!ls1.empty())
		{
			str += ls1.front();
			ls1.pop_front();
			if(!ls1.empty())
				str += " ";
		}
		int count = 0;
		if(str.at(0) == '\'')
		{
			bool run = true;
			int spot = 0;
			int spotend = str.find_first_of("\'", spot+1);
			if(spotend != -1)
			{
				string substr = str.substr(spot+1, spotend - (spot+1));
				count = substr.length();
			}
			else{
				cerr<<"ERROR NO ' AT END OF LIST OF chars";
				system("pause");
			}
			return count;
		}
		else{
			return 1;
		}
		return 0;
	}
	string getIntfromString(string str)
{
	
	INTS converter;
	string a = "";
	converter.intform = stoi(str);					//Converts string to int
	a += (char) converter.first;						//puts bytes into a for placement into file/string
	a += (char) converter.second;
	a += (char) converter.third;
	a += (char) converter.forth;

	return a;
}
	string dotINTfunction(list<string>& parsedString)
	{
		string a = "";
		string set = parsedString.front();
		parsedString.pop_front();
	
		if(parsedString.front().at(0) == '{')
		{
			bool run = true;
			int endstr = 0,
				startstr,
				state = 0;
			while(run)
			{
				switch(state)
				{
				case 0:
					startstr = parsedString.front().find_first_of("0123456789-+", endstr);
				
					if(startstr != -1)
					{
						endstr = parsedString.front().find_first_of(",", startstr+1);
						if(!parsedString.empty() && endstr == -1)
						{
							endstr = parsedString.front().find_first_of("}");
							if(endstr != -1) {
							a += getIntfromString(parsedString.front().substr(startstr, endstr - startstr));
							run = false;
							}
							else{ state =1; 
							a+=getIntfromString(parsedString.front().substr(startstr, parsedString.front().length() - startstr));
							parsedString.pop_front();}
						}
						else{ if(parsedString.empty() && endstr == -1){	cerr<<"ERROR NO '}' AT END OF LIST OF INTS";}
						else{ if(!parsedString.empty() && endstr != -1)
							{
								a += getIntfromString(parsedString.front().substr(startstr, endstr - startstr));
							}
						}}
					}
					else{
						endstr = parsedString.front().find_first_of("}");
						if(endstr != -1)
							run = false;
						endstr = 0;
						parsedString.pop_front();
					}
					break;
				case 1:
					endstr = parsedString.front().find_first_of(",", startstr);
					if(endstr == -1 && parsedString.front().length() > 0)
					{
						startstr = parsedString.front().find_first_of("}", startstr);
						if(startstr != -1)
						{
							state = 0;
							run = false;
						}
						else{
						cerr<<"No , between numbers!";
						system("pause");
						return 0;
						}
					}
					else{
						if(endstr == -1 && parsedString.front().length() ==0)
							parsedString.pop_front();
						else if(endstr != -1) { state = 0; } 
					}
					break;
				}
			}
		}
		else
		{
			if(try_DataSet(parsedString.front()))
				a = get_DataSet(parsedString.front());
			else
			a = getIntfromString(parsedString.front());
		}
		return a;
	}
	string dotBYTfunction(list<string>& parsedString)
	{
		string a = "";
		//INTS converter;
		char charnum;
		parsedString.pop_front();
		int startstr = parsedString.front().find_first_of("'");
		int endstr = parsedString.front().find_first_of("'", startstr+1);
		if(endstr == -1 && startstr != -1){						// Checks to see if char has ''
			string getsubstr = "";
			while(endstr == -1 && startstr != -1)				// If line has starting ' but not ending ' then pops off the
			{													// parsedString list to find the ending ' and puts the strings
				getsubstr += parsedString.front() + " ";		// that are seen into a single line
				parsedString.pop_front();
				endstr = parsedString.front().find_first_of("'");
			}
			getsubstr += parsedString.front();					//One more time to get the last parsedString.
			startstr = getsubstr.find_first_of("'");
			endstr = getsubstr.find_first_of("'", startstr+1);
			string substr = getsubstr.substr(startstr+1, endstr-1);	// pulls the string inbetween the ''`s 
			a+= substr;
		}
		else{												// incase the char set dont have '`s
			if(startstr == -1 && endstr == -1)					//if the char is in number form
			{
				charnum = (char) stoi(parsedString.front());
				a += (char) charnum;
			}
			else{											// any other cases that where not cought
				string subStr = parsedString.front().substr(startstr +1, endstr -1);
				a +=subStr;
			}

		}
		parsedString.pop_front();
		return a;
	}
	string BRmodeDeterminer(list<string>& parsedString)
	{
		string a;
		char chara = get_InstrSet(parsedString.front());
		a = chara;
		parsedString.pop_front();

		chara = get_InstrSet(parsedString.front());
		a += chara;
		parsedString.pop_front();

		if(try_InstrSet(parsedString.front()))		//Registor based imm
		{
			a += (char) 0x03;
			a += (char) get_InstrSet(parsedString.front());
			parsedString.pop_front();
		}
		else
		{
			a += (char) 0x02;
			INTS conv;
			if(try_DataSet(parsedString.front()))
				conv.intform = get_DataSet(parsedString.front());
			else
				conv.intform = stoi(parsedString.front());

			a += (char) conv.first;
			a += (char) conv.second;
			a += (char) conv.third;
			a += (char) conv.forth;
			parsedString.pop_front();
		}
		return a;
	}
	int checkBRMode(list<string> tokenr)
	{
		tokenr.pop_front();
		tokenr.pop_front();
		if(try_InstrSet(tokenr.front()))
			return 4;

		return 7;
	}
	void AssemblerRun1()
	{
		make_Table();
		inputFile->Open();
		bytecounter = 0;
		
		list<string> parsedString;

		int i = 0;
		do
		{
			commandline = inputFile->nextLine();
			commandline = checkComments(commandline);
			parsedString = cheap_tokenise(commandline);
			string str = "";
			if(!parsedString.empty())
			{
				if(!try_InstrSet(parsedString.front()))
				{
					DataSet.insert(pair<string, int>(parsedString.front(), bytecounter));
					parsedString.pop_front();
				}
				int instr = (int) get_InstrSet(parsedString.front());								//
				if(instr >= 14 && instr <= 20 || instr == 7 ){ bytecounter += 3; }							//command = OPCODE REG REG
				else{ if(instr == 1 || instr == 21 || instr == LCK || instr == ULK) { bytecounter += 5; }	// command = OPCODE LABEL 
				else{ if(instr == 2) { bytecounter += 2; }													// command = OPCODE REG
				else{ if(instr == END || instr == BLK) { bytecounter += 1; }								// command = OPCODE
				else{ if(instr >= 3 && instr <= 6 || instr == 8 || instr == 13 || instr == RUN) { bytecounter += 6; } //command = OPCODE REG LABEL
				else{ if(instr >= 9  && instr <= 12){ bytecounter += checkBRMode(parsedString); }			// Store or load opcodes
				else{ if(instr == dotBYT) // .BYT
				{
					str = parsedString.front() + " ";
					parsedString.pop_front();
					bytecounter += charamount(parsedString); 
				}
				else{ if(instr == dotINT) // .INT
				{
					str = parsedString.front() + " ";
					parsedString.pop_front(); 
					int amount = intamount(parsedString);
					bytecounter +=(4*amount); 
				}
				else{ if(instr > dotINT) { cerr<<"Error not an instrection!";} }}}}}}}}	// bad command
			}

			while(!parsedString.empty()){				//Pops off all strings in parsedString and
				str += parsedString.front() + " ";		// places them in the secondrun list
				parsedString.pop_front();
			}
			if(str != "")
				secondrun.push_back(str);

			}while(!inputFile->_EOF());
		inputFile->Close();
		//DUMP_DATASET();
	}

	string AssemblerRun2()
	{
		//cout<<"inside the AssemblerRun2()"<<endl;			//Error checking
		if(toFile)
			outputFile->Open();
		list<string> parsedString;
		int i = 0;
		string b = "";
		char chara;
		do{
			commandline = secondrun.front();
			parsedString = cheap_tokenise(commandline);
			secondrun.pop_front();

			string a = "";
			INTS converter;
			//char charnum;
			while(!parsedString.empty())
			{
				if(try_InstrSet(parsedString.front()))						//checks to see if is instrection
				{
					switch(get_InstrSet(parsedString.front()))
					{
					case dotINT: // Imm
						a += dotINTfunction(parsedString);
						parsedString.pop_front();
						break;

					case dotBYT:	// Imm
						a += dotBYTfunction(parsedString);
						//parsedString.pop_front();
						break;

					case STR:	// instruction registor mode registor
					case LDR:	// STORE AND LOAD COMMANDS
					case STB:
					case LDB:
						a = BRmodeDeterminer(parsedString);
						break;
					
					case END:	//instruction
					case BLK:	// OPCODE
					case LCK:
					case ULK:	//Gets OPCODE
					case TRP:	//instruction registor 
					case JMP:	//Command = OPCODE LABEL
						chara = get_InstrSet(parsedString.front());	
						a += chara;
						parsedString.pop_front();
						break;

					case MOV:
					case ADD:
					case SUB:
					case MUL:
					case DIV:	//instruction registor registor
					case AND:	//Command = OPCODE REG REG
					case OR:
					case CMP:
						chara = get_InstrSet(parsedString.front());	
						a += chara;
						parsedString.pop_front();
					default:		// Instruction registor Imm
									// Command = OPCODE REG
						chara = get_InstrSet(parsedString.front());	
						a += chara;
						parsedString.pop_front();
						chara = get_InstrSet(parsedString.front());
						a += chara;
						parsedString.pop_front();
					}
				}
				else{													//If the string is not a instruction then checks the DataSet for it
					if(try_DataSet(parsedString.front())){	
						converter.intform = get_DataSet(parsedString.front());
						a += (char) converter.first;
						a += (char) converter.second;
						a += (char) converter.third;
						a += (char) converter.forth;
						parsedString.pop_front();
					}
					else{												//If the string is not in the instruction set and DataSet
							try{										//trys to see if the string is actully a number
								converter.intform = stoi(parsedString.front());
								a += (char) converter.first;
								a += (char) converter.second;
								a += (char) converter.third;
								a += (char) converter.forth;
								parsedString.pop_front();
							}
							catch(exception e){
								cout<<parsedString.front()<<" Is not Decleared\n";
								system("Pause");
							}
					}
				}
			}
			//for(int i = 0; i < a.length(); i++)
			//	cout<<(int)a[i]<<" ";
			//cout<<endl;
			b += a;
			if(toFile)
				outputFile->toFile(a);

		}while(!secondrun.empty());

		if(toFile)
			outputFile->Close();
		return b;
	}
private:
	string fileName, 
		commandline;
	UseFile<ifstream> *inputFile;
	UseFile<ofstream> *outputFile;
	list<string> secondrun;
	bool toFile;
	typedef map<const string, int> MapType;
	MapType InstrSet, DataSet;
	int bytecounter;
};
#endif