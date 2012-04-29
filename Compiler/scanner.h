#include "definitions.h"

#ifndef scanner_h
#define scanner_h

 //' asdfghjkl'
using namespace std;

	struct token {
		string str1;
		int linenum;
		types tktype;
		string typetostring()
		{
			switch(tktype)
			{
			case keyword: 
				return "keyword"; break;
			case modifier:
				return "modifier"; break;
			case class_name:
				return "class_name"; break;
			case type:
				return "type"; break;
			case character_literal:
				return "character_literal"; break;
			case number:
				return "number"; break;
			case character:
				return "character"; break;
			case printable_ascii:
				return "printable_ascii"; break;
			case nonprintable_ascii:
				return "nonprintable_ascii"; break;
			case math:
				return "math"; break;
			case relational:
				return "relational"; break;
			case boolean:
				return "boolean"; break;
			case assignment:
				return "assignment"; break;
			case arraybe:
				return "arraybe"; break;
			case blockbe:
				return "blockbe"; break;
			case parenthesesoc:
				return "parenthesesoc"; break;
			case EOE:
				return "EOE"; break;
			case unknown:
				return "unknown"; break;
			}
			return "";
		}
		string toString()
		{
			string s;
			std::stringstream out;
			out << linenum;
			s = out.str();
			s += "\t";
			s += str1;
			s += "\t";
			s += typetostring();
			return s;
		}
		friend ostream& operator<<(ostream& out, token &t)
		{
			cout<<t.linenum<<" "<<t.str1<<"\t"<< t.typetostring();
			return out;
		}
	};

class Scanner
{
public:
	Scanner() {}
	Scanner(const string &fname) : file(fname), filename(fname)
	{
		tokenat = 0;
		create_keyTables();
		set_delm();
		foundspace = false;
	}
	Scanner(const Scanner& SC)
	{
		file.open(SC.filename);
		filename = SC.filename;
		tokenat = 0;
		create_keyTables();
		set_delm();
		foundspace = false;
	}
	Scanner& operator =(const Scanner& SC)
	{
		file.open(SC.filename);
		filename = SC.filename;
		tokenat = 0;
		create_keyTables();
		set_delm();
		return *this;
	}
	~Scanner()
	{
		file.close();
	}
	void restartfile()
	{
		file.close();
		file.open(filename);
		set_delm();
	}
	void create_keyTables()
	{
		keywords.insert( pair<string, types>("atoi", keyword));
		keywords.insert( pair<string, types>("bool", keyword));
		keywords.insert( pair<string, types>("class", keyword));
		keywords.insert( pair<string, types>("char", keyword));
		keywords.insert( pair<string, types>("cin", keyword));
		keywords.insert( pair<string, types>("cout", keyword));
		keywords.insert( pair<string, types>("else", keyword));
		keywords.insert( pair<string, types>("false", keyword));
		keywords.insert( pair<string, types>("if", keyword));
		keywords.insert( pair<string, types>("int", keyword));
		keywords.insert( pair<string, types>("types", keyword));
		keywords.insert( pair<string, types>("itoa", keyword));
		keywords.insert( pair<string, types>("main", keyword));
		keywords.insert( pair<string, types>("new", keyword));
		keywords.insert( pair<string, types>("null", keyword));
		keywords.insert( pair<string, types>("object", keyword));
		keywords.insert( pair<string, types>("public", keyword));
		keywords.insert( pair<string, types>("private", keyword));
		keywords.insert( pair<string, types>("return", keyword));
		keywords.insert( pair<string, types>("string", keyword));
		keywords.insert( pair<string, types>("this", keyword));
		keywords.insert( pair<string, types>("true", keyword));
		keywords.insert( pair<string, types>("void", keyword));
		keywords.insert( pair<string, types>("while", keyword));

		keywords.insert( pair<string, types>("0", number));
		keywords.insert( pair<string, types>("1", number));
		keywords.insert( pair<string, types>("2", number));
		keywords.insert( pair<string, types>("3", number));
		keywords.insert( pair<string, types>("4", number));
		keywords.insert( pair<string, types>("5", number));
		keywords.insert( pair<string, types>("6", number));
		keywords.insert( pair<string, types>("7", number));
		keywords.insert( pair<string, types>("8", number));
		keywords.insert( pair<string, types>("9", number));

		keywords.insert( pair<string, types>("+", math));
		keywords.insert( pair<string, types>("-", math));
		keywords.insert( pair<string, types>("*", math));
		keywords.insert( pair<string, types>("/", math));
		
		keywords.insert( pair<string, types>("<", relational));
		keywords.insert( pair<string, types>(">", relational));
		keywords.insert( pair<string, types>("!=", relational));
		keywords.insert( pair<string, types>("==", relational));

		keywords.insert( pair<string, types>("=", assignment));

		keywords.insert( pair<string, types>("[", arraybe));
		keywords.insert( pair<string, types>("]", arraybe));

		keywords.insert( pair<string, types>("{", blockbe));
		keywords.insert( pair<string, types>("}", blockbe));
		keywords.insert( pair<string, types>("(", parenthesesoc));
		keywords.insert( pair<string, types>(")", parenthesesoc));

		keywords.insert( pair<string, types>(";", EOE));

		keywords.insert( pair<string, types>("\'", unknown));
		keywords.insert( pair<string, types>("||", boolean));
		keywords.insert( pair<string, types>("&&", boolean));
		keywords.insert( pair<string, types>("<<", unknown));
		keywords.insert( pair<string, types>(">>", unknown));

	}
	types get_Type(const string &str)
	{
		if(	keywords.count(str)>0)
		{
			return keywords.find(str)->second;
		}
		else
		{
			if(str[0] == '\'')
			{
				return character;
			}
			else
				if(str[0] >= '0' && str[0] <= '9'){
					for(int i = 1; i < (int) str.size(); ++i)
					{
						if(str[i] >= '0' && str[i] <= '9')
						{}
						else
							return unknown;
					}
					return number;
				}
				else
					return unknown;
		}
	}
	token create_token(const string &str, int line)
	{
		token t;
		t.linenum = line;
		t.str1 = str.c_str();
		t.tktype = get_Type(str);
		//tokenlist.push_back(t);
		//cout<<line<<" "<<str<<"\t" << t.tktype<<endl;
		return t;
	}
	void gen_error()
	{
		cerr<< "ERROR cant open file\n";
		assert(false);
	}
	bool _EOF()
	{
		return file.eof(); 
	}
	void set_delm()
	{
		tokenstr = "{}[](),~!@$%^&*;:\'\'\"\\/-=+.`<> \n\t";
		numbers = "1234567890";
		whitespace = " \n\t";
		linenum = 0;
		tokenfound = false;
		get_nextLine();
	}
	void get_nextLine()
	{
		do{
			getline(file, str);
			linenum++;
		} while(str.length() == 0 && !file.eof());		
		tokenfound = false;
		i = 0;
		k = 0;
		tokenat = 0;
		while(!tokenlist.empty())
		{
			tokenlist.pop_back();
		}
	}
	token tokenize()
	{
		token t;
		if(!file.is_open())	
			gen_error();
		else if(foundspace)
		{
			foundspace = false;
			t = create_token(" ", linenum);
		}
		else
		{
				bool gotToken = false;
				for(; i < (signed int) str.length() && !gotToken; i++)
				{
					if(tokenstr.find(str[i]) != -1)  //checks to see if this str[i] id a delmimner
					{
						tokenfound = true;
						if(whitespace.find(str[i]) != -1) // checks to see if delminter was whitespace
						{
							if(k != i){
								t = create_token(str.substr(k, i - k), linenum);
								gotToken = true;
							}
							k = i+1;
							tokenfound = false;
						}
						else
						{
							switch(str[i])
							{
							case '\'' : 
								if(k == i){
									if(str[i+1] == 32)
										foundspace = true;
									else{
										t = create_token(str.substr(i, 1), linenum);
										gotToken = true;
										k++;
									}
								}
								else{
									t = create_token(str.substr(k, i-k), linenum);
									k = i;
									i--;
									gotToken = true;
								}								
								
								tokenfound = false;
								break;
							case '/' :
								if(str[i+1] == '/')
								{
									//i = k = str.size();
									get_nextLine();
									i = -1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;
							case '<' : 
								if(str[i+1] == '<' || str[i+1] == '=')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '|' : 
								if(str[i+1] == '|')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '>' : 
								if(str[i+1] == '>' || str[i+1] == '=')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '&' : 
								if(str[i+1] == '&')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '=' : 
								if(str[i+1] == '=')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '!' : 
								if(str[i+1] == '=')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;

							case '+' : 
								if(str[i+1] == '+')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;
							case '-' : 
								if(str[i+1] == '-')
								{
									t = create_token(str.substr(i, 2), linenum);
									gotToken = true;
									i++;
									k=i+1;
								}
								else{
									if(k == i){
										 t = create_token(str.substr(i, 1), linenum);
										 gotToken = true;
										 k++;
									}
									else{
										t = create_token(str.substr(k, i-k), linenum);
										k = i;
										i--;
										gotToken = true;
									}
								}
								tokenfound = false;
								break;


							default: 
								if(k == i)
								{
									t = create_token(str.substr(i, 1), linenum);
									gotToken = true;
									k++;
									tokenfound = false;
								}
								else
								{
									t = create_token(str.substr(k, i - k), linenum);
									gotToken = true;
									k = i;
								}
								break;
							}
						}
					}
					else
						if(tokenfound){
							t = create_token(str.substr(k, i - k), linenum);
							gotToken = true;
							k = i;
							tokenfound = false;
					}
				}
				if(k != str.size() && !gotToken){
					t = create_token(str.substr(k, str.size() - k), linenum);
					gotToken = true;
					get_nextLine();
				}
				else if( i > (signed int) str.length())
					get_nextLine();
				else  if( i == str.length()) 
					i++;
			//}while(t == nullptr);
		}
		return t;
	}

	token get_Next()
	{
		token t;
		if(tokenat >= (signed int) tokenlist.size()){
			
			do{
				if(!_EOF())
					t = tokenize();
				else
					t.str1 = "EMPTY";
			}while(t.str1 == "" || t.str1 == "\t");
			tokenlist.push_back(t);
		}else{
			t = tokenlist[tokenat];
		}
		++tokenat;
  		return t;
	}
	void get_prev()
	{
		--tokenat;
	}
	
private:
	string str;
	int linenum;
	int i, k;
	//token t;
	bool tokenfound;
	int tokenat;
	bool foundspace;
	map<string, types> keywords;
	string tokenstr, whitespace, variblechars, numbers;
	string filename;
	ifstream file;
	vector<token> tokenlist;
};

#endif