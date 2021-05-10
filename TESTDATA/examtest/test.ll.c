#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, (char*)"myfunc",4);
	insert_vertex(g, (char*)"myfunc",6);
	insert_vertex(g, (char*)"myfunc",7);
	insert_vertex(g, (char*)"myfunc",8);
	insert_vertex(g, (char*)"myfunc",9);
	insert_vertex(g, (char*)"myfunc",10);
	insert_vertex(g, (char*)"myfunc",13);
	insert_vertex(g, (char*)"myfunc",17);
	insert_vertex(g, (char*)"myfunc",21);
	insert_vertex(g, (char*)"myfunc",23);
	insert_vertex(g, (char*)"main",25);
	insert_edge_head(g, (char*)"myfunc",4, (char*)"myfunc",21);
	insert_edge_head(g, (char*)"myfunc",4, (char*)"myfunc",6);
	insert_edge_head(g, (char*)"myfunc",6, (char*)"myfunc",8);
	insert_edge_head(g, (char*)"myfunc",6, (char*)"myfunc",7);
	insert_edge_head(g, (char*)"myfunc",7, (char*)"myfunc",23);
	insert_edge_head(g, (char*)"myfunc",8, (char*)"myfunc",17);
	insert_edge_head(g, (char*)"myfunc",8, (char*)"myfunc",9);
	insert_edge_head(g, (char*)"myfunc",9, (char*)"myfunc",13);
	insert_edge_head(g, (char*)"myfunc",9, (char*)"myfunc",10);
	insert_edge_head(g, (char*)"myfunc",10, (char*)"myfunc",23);
	insert_edge_head(g, (char*)"myfunc",13, (char*)"myfunc",23);
	insert_edge_head(g, (char*)"myfunc",17, (char*)"myfunc",23);
	insert_edge_head(g, (char*)"myfunc",21, (char*)"myfunc",23);
	insert_edge_head(g, (char*)"myfunc",23, (char*)"main",25);
}
