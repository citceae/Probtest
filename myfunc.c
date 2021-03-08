#include "graph_link.h"

void myfunc(GraphLink* g){
	insert_vertex(g, 3);
	insert_vertex(g, 5);
	insert_edge_head(g, 3, 5);
	insert_vertex(g, 18);
	insert_edge_head(g, 3, 18);
	insert_vertex(g, 6);
	insert_edge_head(g, 5, 6);
	insert_vertex(g, 14);
	insert_edge_head(g, 5, 14);
	insert_vertex(g, 7);
	insert_edge_head(g, 6, 7);
	insert_vertex(g, 10);
	insert_edge_head(g, 6, 10);
	insert_vertex(g, 20);
	insert_edge_head(g, 7, 20);
	insert_edge_head(g, 10, 20);
	insert_edge_head(g, 14, 20);
	insert_edge_head(g, 18, 20);
}
