#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, (char*)"myfunc",4);
	insert_vertex(g, (char*)"myfunc",7);
	insert_vertex(g, (char*)"myfunc",8);
	insert_vertex(g, (char*)"myfunc",9);
	insert_vertex(g, (char*)"myfunc",10);
	insert_vertex(g, (char*)"myfunc",11);
	insert_vertex(g, (char*)"myfunc",14);
	insert_vertex(g, (char*)"myfunc",18);
	insert_vertex(g, (char*)"myfunc",22);
	insert_vertex(g, (char*)"myfunc",24);
	insert_vertex(g, (char*)"main",26);
	insert_edge_head(g, (char*)"myfunc",4, (char*)"myfunc",22);
	insert_edge_head(g, (char*)"myfunc",4, (char*)"myfunc",7);
	insert_edge_head(g, (char*)"myfunc",7, (char*)"myfunc",9);
	insert_edge_head(g, (char*)"myfunc",7, (char*)"myfunc",8);
	insert_edge_head(g, (char*)"myfunc",8, (char*)"myfunc",24);
	insert_edge_head(g, (char*)"myfunc",9, (char*)"myfunc",18);
	insert_edge_head(g, (char*)"myfunc",9, (char*)"myfunc",10);
	insert_edge_head(g, (char*)"myfunc",10, (char*)"myfunc",14);
	insert_edge_head(g, (char*)"myfunc",10, (char*)"myfunc",11);
	insert_edge_head(g, (char*)"myfunc",11, (char*)"myfunc",24);
	insert_edge_head(g, (char*)"myfunc",14, (char*)"myfunc",24);
	insert_edge_head(g, (char*)"myfunc",18, (char*)"myfunc",24);
	insert_edge_head(g, (char*)"myfunc",22, (char*)"myfunc",24);
	insert_edge_head(g, (char*)"myfunc",24, (char*)"main",26);
	modify_visit(g,(char*)"myfunc", 24);
}
