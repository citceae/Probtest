#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, (char*)"add", 4);
	insert_vertex(g, (char*)"add", 6);
	insert_edge_head(g, (char*)"add", 4, (char*)"add", 6);
	insert_vertex(g, (char*)"add", 19);
	insert_edge_head(g, (char*)"add", 4, (char*)"add", 19);
	insert_vertex(g, (char*)"add", 7);
	insert_edge_head(g, (char*)"add", 6, (char*)"add", 7);
	insert_vertex(g, (char*)"add", 15);
	insert_edge_head(g, (char*)"add", 6, (char*)"add", 15);
	insert_vertex(g, (char*)"add", 8);
	insert_edge_head(g, (char*)"add", 7, (char*)"add", 8);
	insert_vertex(g, (char*)"add", 11);
	insert_edge_head(g, (char*)"add", 7, (char*)"add", 11);
	insert_vertex(g, (char*)"add", 21);
	insert_edge_head(g, (char*)"add", 8, (char*)"add", 21);
	insert_edge_head(g, (char*)"add", 11, (char*)"add", 21);
	insert_edge_head(g, (char*)"add", 15, (char*)"add", 21);
	insert_edge_head(g, (char*)"add", 19, (char*)"add", 21);
}
