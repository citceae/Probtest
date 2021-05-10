#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, (char*)"getgrade",3);
	insert_vertex(g, (char*)"getgrade",5);
	insert_vertex(g, (char*)"getgrade",6);
	insert_vertex(g, (char*)"getgrade",7);
	insert_vertex(g, (char*)"getgrade",8);
	insert_vertex(g, (char*)"getgrade",9);
	insert_vertex(g, (char*)"getgrade",10);
	insert_vertex(g, (char*)"getgrade",11);
	insert_vertex(g, (char*)"getgrade",12);
	insert_vertex(g, (char*)"getgrade",13);
	insert_vertex(g, (char*)"getgrade",14);
	insert_vertex(g, (char*)"getgrade",15);
	insert_vertex(g, (char*)"main",16);
	insert_edge_head(g, (char*)"getgrade",3, (char*)"getgrade",6);
	insert_edge_head(g, (char*)"getgrade",3, (char*)"getgrade",5);
	insert_edge_head(g, (char*)"getgrade",5, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",6, (char*)"getgrade",8);
	insert_edge_head(g, (char*)"getgrade",6, (char*)"getgrade",7);
	insert_edge_head(g, (char*)"getgrade",7, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",8, (char*)"getgrade",10);
	insert_edge_head(g, (char*)"getgrade",8, (char*)"getgrade",9);
	insert_edge_head(g, (char*)"getgrade",9, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",10, (char*)"getgrade",12);
	insert_edge_head(g, (char*)"getgrade",10, (char*)"getgrade",11);
	insert_edge_head(g, (char*)"getgrade",11, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",12, (char*)"getgrade",14);
	insert_edge_head(g, (char*)"getgrade",12, (char*)"getgrade",13);
	insert_edge_head(g, (char*)"getgrade",13, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",14, (char*)"getgrade",15);
	insert_edge_head(g, (char*)"getgrade",15, (char*)"main",16);
	modify_visit(g,(char*)"getgrade", 15);
}
