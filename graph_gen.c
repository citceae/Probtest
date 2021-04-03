#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, 4);
	insert_vertex(g, 6);
	insert_edge_head(g, 4, 6);
	insert_vertex(g, 19);
	insert_edge_head(g, 4, 19);
	insert_vertex(g, 7);
	insert_edge_head(g, 6, 7);
	insert_vertex(g, 15);
	insert_edge_head(g, 6, 15);
	insert_vertex(g, 8);
	insert_edge_head(g, 7, 8);
	insert_vertex(g, 11);
	insert_edge_head(g, 7, 11);
	insert_vertex(g, 21);
	insert_edge_head(g, 8, 21);
	insert_edge_head(g, 11, 21);
	insert_edge_head(g, 15, 21);
	insert_edge_head(g, 19, 21);
}
