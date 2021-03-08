#include "graph_link.h"

void main(GraphLink* g){
	insert_vertex(g, 23);
	insert_vertex(g, 27);
	insert_edge_head(g, 23, 27);
	insert_vertex(g, 28);
	insert_edge_head(g, 27, 28);
	insert_vertex(g, 31);
	insert_edge_head(g, 27, 31);
	insert_vertex(g, 29);
	insert_edge_head(g, 28, 29);
	insert_vertex(g, 27);
	insert_edge_head(g, 28, 27);
	insert_edge_head(g, 29, 27);
	insert_edge_head(g, 27, 27);
}
