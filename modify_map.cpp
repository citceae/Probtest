#include "graph_link.h"

void modify_map(GraphLink* g, map<FuncLine,int>* cntmap){
	FuncLine FL;
	FL.name = (char*)"getgrade";FL.line = 3;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"getgrade";FL.line = 4;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"getgrade";FL.line = 5;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 6;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"getgrade";FL.line = 7;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"getgrade";FL.line = 8;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 9;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 10;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 11;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 12;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 13;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"getgrade";FL.line = 14;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"main";FL.line = 16;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"main";FL.line = 20;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"main";FL.line = 21;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	FL.name = (char*)"main";FL.line = 26;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 1));
	modify_visit(g,(char*)"getgrade", 3);
	modify_visit(g,(char*)"getgrade", 4);
	modify_visit(g,(char*)"getgrade", 6);
	modify_visit(g,(char*)"getgrade", 7);
	modify_visit(g,(char*)"getgrade", 8);
	modify_visit(g,(char*)"getgrade", 9);
	modify_visit(g,(char*)"getgrade", 10);
	modify_visit(g,(char*)"getgrade", 11);
	modify_visit(g,(char*)"getgrade", 12);
	modify_visit(g,(char*)"getgrade", 13);
	modify_visit(g,(char*)"getgrade", 14);
	modify_visit(g,(char*)"main", 16);
	modify_visit(g,(char*)"main", 20);
	modify_visit(g,(char*)"main", 21);
	modify_visit(g,(char*)"main", 26);
}
