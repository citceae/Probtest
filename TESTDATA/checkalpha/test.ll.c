#include "graph_link.h"

void graph_gen(GraphLink* g){
	insert_vertex(g, (char*)"checkalpha",3);
	insert_vertex(g, (char*)"checkalpha",4);
	insert_vertex(g, (char*)"checkalpha",5);
	insert_vertex(g, (char*)"checkalpha",8);
	insert_vertex(g, (char*)"checkalpha",9);
	insert_vertex(g, (char*)"checkalpha",12);
	insert_vertex(g, (char*)"checkalpha",13);
	insert_vertex(g, (char*)"checkalpha",17);
	insert_vertex(g, (char*)"checkalpha",20);
	insert_vertex(g, (char*)"main",21);
	insert_edge_head(g, (char*)"checkalpha",3, (char*)"checkalpha",8);
	insert_edge_head(g, (char*)"checkalpha",3, (char*)"checkalpha",4);
	insert_edge_head(g, (char*)"checkalpha",4, (char*)"checkalpha",8);
	insert_edge_head(g, (char*)"checkalpha",4, (char*)"checkalpha",5);
	insert_edge_head(g, (char*)"checkalpha",5, (char*)"checkalpha",20);
	insert_edge_head(g, (char*)"checkalpha",8, (char*)"checkalpha",9);
	insert_edge_head(g, (char*)"checkalpha",8, (char*)"checkalpha",12);
	insert_edge_head(g, (char*)"checkalpha",9, (char*)"checkalpha",20);
	insert_edge_head(g, (char*)"checkalpha",12, (char*)"checkalpha",13);
	insert_edge_head(g, (char*)"checkalpha",12, (char*)"checkalpha",17);
	insert_edge_head(g, (char*)"checkalpha",13, (char*)"checkalpha",20);
	insert_edge_head(g, (char*)"checkalpha",17, (char*)"checkalpha",20);
	insert_edge_head(g, (char*)"checkalpha",20, (char*)"main",21);
	modify_visit(g,(char*)"checkalpha", 20);
}
