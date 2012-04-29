#include "Icode.h"

namespace Icode_h
{
	static int ifskipnum = 0;
	static int elseskipnum = 0;
	static int whilebeginnum = 0;
	static int whileendnum = 0;

	const string pushstr = "PUSH";
	const string popstr  = "POP";
	const string peekstr = "PEEK";

	const string movestr = "MOV";
	const string refstr  = "REF";
	const string jmpstr  = "JMP";

	const string framestr  = "FRAME";
	const string callstr   = "CALL";
	const string RTNstr    = "RTN";
	const string RETURNstr = "RETURN";
	const string funcstr   = "FUNC";

	const string newistr = "NEWI";
	const string newstr  = "NEW";

	const string writestr  = "WRITE";
	const string readstr   = "READ";
	const string writeCstr = "WRTC";
	const string readCstr  = "RDC";
	const string writeIstr = "WRTI";
	const string readIstr  = "RDI";

	const string dotint = ".INT";
	const string dotbyte = ".BYT";

	const string comma	= ", ";

	void dumpicode()
	{
		for(int i = 0; i < icode.size(); ++i)
		{
			cout<<icode[i]<<endl;
		}
	}
	inline
	void resetquad()
	{
		q.instr = q.label = q.operand1 = q.operand2 = q.operand3 = "";
	}
	vector<quad>& get_quadlist()
	{
		return icode;
	}

	////////////////////////////////////////////////////////
	void push(const string& symId)
	{
		q.instr = pushstr;
		q.operand1 = symId;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void pop(const string& symId)
	{
		
		q.instr = popstr;
		q.operand1 = symId;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void peek(const string& symId)
	{
		
		q.instr = peekstr;
		q.operand1 = symId;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	///////////////////////////////////////////////
	void move(const string& symId1, const string& symId2)
	{
		q.instr = movestr;
		q.operand1 = symId1;
		q.operand2 = symId2;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void move(int num, const string& symId)
	{
		stringstream ss;
		ss << num;
		
		q.instr = movestr;
		q.operand1 = symId;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void ref(const string& symId1, const string& symId2, const string& tempsymid)
	{
		q.instr = refstr;
		q.operand1 = symId1;
		q.operand2 = symId2;
		q.operand3 = tempsymid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void JMP(const string& label)
	{
		string labell = q.label;
		q.label = "";
		q.instr = jmpstr;
		q.operand1 = label;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
		q.label = labell;
	}
	////////////////////////////////////////////////////////////////

	void Math(const string& instr, const string& a, const string& b, const string& c)
	{
		
		q.instr = instr;
		q.operand1 = a;
		q.operand2 = b;
		q.operand3 = c;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void Math(const string& instr, const string& a, int num, const string& c)
	{
		stringstream ss; 
		ss << num;
		
		q.instr = instr;
		q.operand1 = a;
		q.operand2 = ss.str();
		q.operand3 = c;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void Boolean(const string& instr, const string& a, const string& b, const string& c)
	{
		
		q.instr = instr;
		q.operand1 = a;
		q.operand2 = b;
		q.operand3 = c;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	//////////////////////////////////////////////////////////////////

	void SetUpMain()
	{
		//q = quad();
		//icode = vector<quad>();
		//get_quadlist();
		//labelstack = vector<string>();

		icode.push_back(quad("START"));

		icode.push_back(quad("FRAME", "main", "this", "", "START"));
		icode.push_back(quad("CALL", "main"));
		pushLable("Error", labelstack);
		popLable("", labelstack);
		icode.push_back(quad("QUIT"));
	}

	void frame(const string& func, const string& object)
	{
		q.instr = framestr;
		q.operand1 = func;
		q.operand2 = object;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void call(const string& func)
	{
		
		q.instr = callstr;
		q.operand1 = func;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void RTN()
	{
		
		q.instr = RTNstr;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void RETURN(const string& returnfromfunction)
	{
		if(icode.back().instr == RTNstr)
			icode.pop_back();
		q.instr = RETURNstr;
		q.operand1 = returnfromfunction;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void func(const string& funcid)
	{
		q.instr = funcstr;
		q.operand1 = funcid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}
	void heap(const string& Aid)
	{
		q.instr = "HEAP";
		q.operand1 = Aid;
		icode.push_back(q);
		resetquad();
	}
	void newi(const string& type, const string& A)
	{
		stringstream ss;
		ss << symbleTable::getclassmembersCount(type);
		q.instr = newistr;
		q.operand1 = ss.str();
		q.operand2 = A;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void newa(const string& R, const string& A)
	{
		q.instr = newstr;
		q.operand1 = R;
		q.operand2 = A;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void write(const string& Aid)
	{
		
		q.instr = writestr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void read(const string& Aid)
	{
		
		q.instr = readstr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void writeC(const string& Aid)
	{
		
		q.instr = writeCstr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void readC(const string& Aid)
	{
		
		q.instr = readCstr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void writeI(const string& Aid)
	{
		
		q.instr = writeIstr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void readI(const string& Aid)
	{
		
		q.instr = readIstr;
		q.operand1 = Aid;
		//cout<<q<<endl;
		icode.push_back(q);
		resetquad();
	}

	void Branch(const string& instr, const string& Aid, const string& whereitsfrom)
	{
		stringstream ss;
		
		q.instr = instr;
		q.operand1 = Aid;
		if(whereitsfrom == "if")
		{
			ss << ifskipnum;


			q.operand2 = "IFSKIP" + ss.str();
			//cout<<q<<endl;
			icode.push_back(q);
			
			//cout<<instr + " " + Aid + comma + "IFSKIP" + ss.str()<<endl;

			//icode.push_back(instr + Aid + comma + ss.str());
		}
		if(whereitsfrom == "else")
		{
			ss << elseskipnum;

			q.operand2 = "ELSESKIP" + ss.str();
			//cout<<q<<endl;
			icode.push_back(q);

			//cout<<instr + " " + Aid + comma + "ELSESKIP" + ss.str()<<endl;
			//icode.push_back(instr + Aid + comma + ss.str());
		}
		if(whereitsfrom == "whileb")
		{
			ss << whilebeginnum;

			q.operand2 = "WHILEBEGIN" + ss.str();
			//cout<<q<<endl;
			icode.push_back(q);

			//cout<<instr + " " + Aid + comma + "WHILESKIP" + ss.str()<<endl;
			//icode.push_back(instr + Aid + comma + ss.str());
		}
		if(whereitsfrom == "whilen")
		{
			ss << whileendnum;

			q.operand2 = "WHILEEND" + ss.str();
			//cout<<q<<endl;
			icode.push_back(q);

			//cout<<instr + " " + Aid + comma + "WHILESKIP" + ss.str()<<endl;
			//icode.push_back(instr + Aid + comma + ss.str());
		}

		resetquad();
	}

	string backLabel()
	{
		if(!labelstack.empty())
			return labelstack.back();
		return "";
	}

	void pushLable(const string& whereitsfrom, vector<string>& st)
	{
		stringstream ss;
		if(whereitsfrom == "if")
		{
			ss << ifskipnum++;
			st.push_back( "IFSKIP" + ss.str());
		}
		else if(whereitsfrom == "else")
		{
			ss << elseskipnum++;
			st.push_back("ELSESKIP" + ss.str());
		}
		else if(whereitsfrom == "whileb")
		{
			ss << whilebeginnum++;
			st.push_back( "WHILEBEGIN" + ss.str());
		}
		else if(whereitsfrom == "whilen")
		{
			ss << whileendnum++;
			st.push_back( "WHILEEND" + ss.str());
		}
		else{
			st.push_back(whereitsfrom);
		}
	}
	void popLable(const string& whereitsfrom, vector<string>& st)
	{
		if(!st.empty())
		{
			if(q.label != "")
			{
				backpatch(q.label, st.back());
			}
//			if(st.size() > 1)
//				backpatch(st);
			q.label = st.back();
			st.pop_back();
		}
	}

	void backpatch(const string& str1, const string& str2) //vector<string>& labelstack)
	{
		for(vector<quad>::reverse_iterator rev_iter = icode.rbegin(); rev_iter != icode.rend(); rev_iter++)
		{
			if(rev_iter->label == str1)
				rev_iter->label = str2;
				
			if(rev_iter->operand1 == str1)
				rev_iter->operand1 = str2;
				
			if(rev_iter->operand2 == str1)
				rev_iter->operand2 = str2;
				
			if(rev_iter->operand3 == str1)
				rev_iter->operand3 = str2;
		}
//		labelstack.push_back(str2);
	}
}