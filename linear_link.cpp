#include "graph_link.h"
#include "linear_link.h"

//填充概率矩阵
void modify_matrix(GraphLink* g, Ref<MatrixXf> A, Ref<VectorXf> B){
    if(NULL == g)return;
    for(int i = 0; i < g->NumVertices; ++i){
        if(g->nodeTable[i].visited == 0)
            B(i) = 1;
        else 
            B(i) = 0;
        A(i,i) = 1;
        Edge* p = g->nodeTable[i].adj;
        while(NULL != p){
            //printf("p(%f)->",p->prob);
            //printf("%d->", g->nodeTable[p->idx].idx);
            A(i,p->idx) = -p->prob;
            p = p->link;
    }
  }
}

