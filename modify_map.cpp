#include "graph_link.h"

void modify_map(GraphLink* g, map<FuncLine,int>* cntmap){
	FuncLine FL;
	FL.name = (char*)"add";FL.line = 4;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 12));
	FL.name = (char*)"add";FL.line = 5;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 12));
	FL.name = (char*)"add";FL.line = 6;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 2));
	FL.name = (char*)"add";FL.line = 7;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"add";FL.line = 8;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"add";FL.line = 11;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 0));
	FL.name = (char*)"add";FL.line = 15;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 2));
	FL.name = (char*)"add";FL.line = 19;
	cntmap->insert(std::map<FuncLine, int>::value_type (FL, 10));
	modify_visit(g,(char*)"add", 4);
	modify_visit(g,(char*)"add", 5);
	modify_visit(g,(char*)"add", 6);
	modify_visit(g,(char*)"add", 15);
	modify_visit(g,(char*)"add", 19);
}
