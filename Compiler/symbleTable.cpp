#include "symbleTable.h"
namespace symbleTable
{
	int nextvalue = 100;
	static globalmap globalsymtbl;
	static vector<string> nonbasetypes;
	void dump()
	{
		globalmap::iterator it1;
		identifermap::iterator it2;
		identifertype idtp;
		for(it1 = globalsymtbl.begin(); it1 != globalsymtbl.end(); it1++)
		{
			for(it2 = it1->second.begin(); it2 != it1->second.end(); it2++)
			{
				idtp = it2->second;
				cout<< "scope "<< idtp.scope <<endl
					<< "symid "<<idtp.symid<<endl
					<< "value "<<idtp.value<<endl
					<< "kind  "<<idtp.kind<<endl
					<< "type  "<<idtp.data.type<<endl
					<< "accM  "<<idtp.data.accessMod<<endl
					<<endl;
			}
		}
	}
	vector<pair<string, identifertype> >::const_iterator find(const vector<pair<string, identifertype> >& it, const string& str)
	{
		auto iter = it.begin();
		for(; iter < it.end(); ++iter)
		{
			if(iter->first == str)
				break;
		}
		return iter;

	}
	bool putinSymTbl(const string& scope, identifertype id)
	{
		identifermap imp;
		if(globalsymtbl.find(scope) == globalsymtbl.end())
		{
			imp.push_back(pair<string, identifertype>(id.value, id));
			globalsymtbl[scope] = imp;
		}
		else
		{
			
			if(find(globalsymtbl.find(scope)->second, id.value) == globalsymtbl.find(scope)->second.end())
				globalsymtbl.find(scope)->second.push_back(pair<string, identifertype>(id.value, id));
			else
				return false;
		}
		return true;
	}
	bool find_nonbasetype(const identifertype& id)
	{
		vector<string>::iterator it = nonbasetypes.begin();
		for(; it != nonbasetypes.end(); ++it)
		{
			if(*it == id.data.type)
				return true;
		}
		return false;
	}
	bool find_nonbasetype(const string& type)
	{
		vector<string>::iterator it = nonbasetypes.begin();
		for(; it != nonbasetypes.end(); ++it)
		{
			if(*it == type)
				return true;
		}
		return false;
	}

	string getLitSymb(int x)
	{
		vector<identifertype> lits;
		stringstream ss;
		ss << x;

		if(!check_in_symbletable("g", ss.str()))
		{
			Data d;
			d.type = "int";
			d.accessMod = symbleTable::_public;
			add("g", 'l', ss.str(), symbleTable::tvar, d);
		}
		for(globalmap::iterator git = globalsymtbl.begin(); git != globalsymtbl.end(); git++)
		{
			for(identifermap::iterator it = git->second.begin(); it != git->second.end(); it++)
			{
				if(it->second.value == ss.str())
					return it->second.symid;
			}
		}

		return "";
	}

	bool add(const string& scope, char symid, const string& varname, Kinds kind, Data d)
	{
		identifertype id;
		id.scope = scope;
		stringstream stream;
		stream << nextvalue++;
		id.symid = symid + stream.str(); // itoa(nextvalue++,buffer, 10);
		id.value = varname;
		id.kind = kind;
		id.data = d;

		if(d.type == "Class")
			nonbasetypes.push_back(varname);

		if(!putinSymTbl(scope, id))
			//cerr<< "Value "<<id.value <<"already exists in symbol table\n";
		return true;
	}
	bool check_in_symbletable(const string& scope, const string& varname)
	{
		string str = scope;
		while(str != ""){
			identifermap it;
			if(globalsymtbl.find(str) != globalsymtbl.end())
				it = globalsymtbl.find(str)->second;//.find(varname);
			if(find(it, varname) != it.end())
				return true;
			str = str.substr(0, str.find_last_of("."));
			if(str == "g")
				break;
		}
		return false;
	}

	vector<identifertype> getLiters()
	{
		vector<identifertype> lits;

		for(globalmap::iterator git = globalsymtbl.begin(); git != globalsymtbl.end(); git++)
		{
			for(identifermap::iterator it = git->second.begin(); it != git->second.end(); it++)
			{
				if(it->second.symid.find('l') != -1)
					lits.push_back(it->second);
			}
		}
		return lits;
	}

	string get_valuenumber()
	{
		stringstream stream;
		stream << nextvalue++;
		return stream.str();
	}
	string findfunctiontypefromscope(const string& scope)
	{
		string str = scope.substr(0, scope.find_last_of("."));
		string varname = scope.substr(scope.find_last_of(".")+1, scope.size());
		identifermap::iterator it = globalsymtbl.find(str)->second.begin();//.find(varname);
		for(;it != globalsymtbl.find(str)->second.end(); it++){
			if( it->second.value.substr(0,it->second.value.find("(")) == varname) 
				return it->second.data.type;
		}
		return "";
	}
	string findscopefromfunc(const string& funcid)
	{
		for(globalmap::iterator git = globalsymtbl.begin(); git != globalsymtbl.end(); git++)
		{
			for(identifermap::iterator it = git->second.begin(); it != git->second.end(); it++)
			{
				if(funcid == it->second.symid)
					return it->second.scope + "." + it->second.value.substr(0, it->second.value.find("("));
			}
		}
		return "";
	}
	int getLocation(const string& funcid)
	{
		int loc = 0;
		for(globalmap::iterator git = globalsymtbl.begin(); git != globalsymtbl.end(); git++)
		{
			loc = 0;
			for(identifermap::iterator it = git->second.begin(); it != git->second.end(); it++)
			{
				if(it->second.symid.find('F') == -1){
					if(funcid == it->second.symid)
						return loc;
					loc +=1;
				}
			}
		}
		return loc;
	}
	identifertype getToken(const string& scope, char symid, const string& varname, Kinds kind, Data d)
	{
		identifertype id;
		if(symbleTable::globalsymtbl.find(scope) != symbleTable::globalsymtbl.end() && find(symbleTable::globalsymtbl.find(scope)->second, varname) != symbleTable::globalsymtbl.find(scope)->second.end())
		{
			id = find(symbleTable::globalsymtbl.find(scope)->second, varname)->second;
		}
		else{
			id.scope = scope;
			stringstream stream;
			stream << nextvalue++;
			id.symid = symid + stream.str(); // itoa(nextvalue++,buffer, 10);
			id.value = varname;
			id.kind = kind;
			id.data = d;
		}

		return id;
	}
	identifertype get_symTbl(const string& scope, const string& varname)
	{
		string str = scope;
		identifermap::iterator iter;
		while(str != ""){
			identifermap it;
			if(globalsymtbl.find(str) != globalsymtbl.end())
				it = globalsymtbl.find(str)->second;
			if(find(it, varname) != it.end())
				return find(it, varname)->second;
			str = str.substr(0, str.find_last_of("."));
			if(str == "g")
				break;
		}
		str = scope;
		while(str != ""){
			identifermap it;
			if(globalsymtbl.find(str) != globalsymtbl.end())
				it = globalsymtbl.find(str)->second;
			for(iter = it.begin(); iter != it.end(); ++iter)
			{
				if(iter->second.value.find(varname) != -1)
				{
					identifertype id = iter->second;
					id.value = varname;
					return id;
				}
			}
			str = str.substr(0, str.find_last_of("."));
			if(str == "g")
				break;
		}

		cerr<<"symble Table Error "<<scope<<"."<<varname<<" Not identifed"<<endl;
		return emptyident;
	}
	identifertype get_symTbl(const string& symid)
	{
		for(globalmap::iterator git = globalsymtbl.begin(); git != globalsymtbl.end(); git++)
		{
			for(identifermap::iterator it = git->second.begin(); it != git->second.end(); it++)
			{
				if(symid == it->second.symid)
					return it->second;
			}
		}
		return emptyident;
	}
	int getclassmembersCount(const string& type)
	{
		string scope = "g." + type;
		int amount = 0;
		auto iter = globalsymtbl.find(scope);
		if(iter != globalsymtbl.end()){
			for(auto clasiter = iter->second.begin(); clasiter != iter->second.end(); ++clasiter)
			{
				if(clasiter->second.symid.find('F') == -1)
					amount++;
			}
		}
		return amount;
	}
	int getcount(const string& scope)
	{
		if( globalsymtbl.find(scope) != globalsymtbl.end())
			return globalsymtbl.find(scope)->second.size();
		return 0;
	}
}