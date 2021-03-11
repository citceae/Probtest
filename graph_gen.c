#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, 4);
	insert_vertex(g, 6);
	insert_edge_head(g, 4, 6);
	insert_vertex(g, 28);
	insert_edge_head(g, 4, 28);
	insert_vertex(g, 10);
	insert_edge_head(g, 6, 10);
	insert_vertex(g, 24);
	insert_edge_head(g, 6, 24);
	insert_vertex(g, 14);
	insert_edge_head(g, 10, 14);
	insert_vertex(g, 20);
	insert_edge_head(g, 10, 20);
	insert_vertex(g, 30);
	insert_edge_head(g, 14, 30);
	insert_edge_head(g, 20, 30);
	insert_edge_head(g, 24, 30);
	insert_edge_head(g, 28, 30);
}
