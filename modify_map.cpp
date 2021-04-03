#include "graph_link.h"

void modify_map(GraphLink* g, map<int,int>* cntmap){
	cntmap->insert(pair<int,int>(4,12));
	cntmap->insert(pair<int,int>(5,12));
	cntmap->insert(pair<int,int>(6,2));
	cntmap->insert(pair<int,int>(7,0));
	cntmap->insert(pair<int,int>(8,0));
	cntmap->insert(pair<int,int>(11,0));
	cntmap->insert(pair<int,int>(15,2));
	cntmap->insert(pair<int,int>(19,10));
	modify_visit(g,4);
	modify_visit(g,5);
	modify_visit(g,6);
	modify_visit(g,15);
	modify_visit(g,19);
}
