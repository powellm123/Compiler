#ifndef symbleTable_h
#define symbleTable_h
#include "definitions.h"
#include <stdio.h>
#include <stdlib.h>
namespace symbleTable
{

	enum AccessMod {noneAM, _public, _private};
	enum Kinds {noneK, Class, Func, ivar, fvar, tvar, CAref, Aref} ;
	//enum Type {noneT, _int, _char, _bool, _void, _className};


	struct Data
	{
		string type;
		AccessMod accessMod;
		Data(const string& str = "", AccessMod Accessmod = _public)
			: type(str), accessMod(Accessmod)
		{}
	};

	struct identifertype
	{
		string scope;
		string symid;
		string value;
		Kinds  kind;
		Data   data;
	};
	static const Data emptyData("", noneAM);
	static const symbleTable::identifertype emptyident = {"", "", "", noneK, emptyData};

	bool putinSymTbl(const string&, symbleTable::identifertype);
	bool add(const string& scope, char symid, const string& varname, Kinds kind, Data d = emptyData);
	bool check_in_symbletable(const string& scope, const string& varname);
	bool find_nonbasetype(const symbleTable::identifertype& id);
	bool find_nonbasetype(const string& type);
	symbleTable::identifertype get_symTbl(const string& scope, const string& varname);
	symbleTable::identifertype getToken(const string& scope, char symid, const string& varname, Kinds kind, Data d);
	identifertype get_symTbl(const string& symid);
	bool funsign (const string& funcsig);	
	string getLitSymb(int x);

	int getLocation(const string& funcid);
	string findfunctiontypefromscope(const string& scope);
	string get_valuenumber();
	string findscopefromfunc(const string& funcid);
	void dump();
	int  getcount(const string& scope);
	vector<identifertype> getLiters();
	int getclassmembersCount(const string& type);
	vector<pair<string, identifertype> >::const_iterator find(const vector<pair<string, identifertype> >& it, const string& str);

	typedef vector<pair<string, symbleTable::identifertype> >identifermap;
	typedef map<string, identifermap> globalmap;
}
#endif
