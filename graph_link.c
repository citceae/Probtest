#include "graph_link.h"
//初始化图
void init_graph_link(GraphLink* g){
  g->MaxVertices = default_vertex_size;
  g->NumVertices = g->NumEdges = 0;
  g->nodeTable = (Vertex*)malloc(sizeof(Vertex) * g->MaxVertices);
  assert(NULL != g->nodeTable);
  for(int i = 0; i < g->MaxVertices; ++i){
    g->nodeTable[i].adj = NULL;
  }
}
//显示图
void show_graph_link(GraphLink* g){
  if(NULL == g)return;
  for(int i = 0; i < g->NumVertices; ++i){
    printf("%d %d->", i, g->nodeTable[i].idx);
    Edge* p = g->nodeTable[i].adj;
    while(NULL != p){
      printf("p(%f)->",p->prob);
      printf("%d->", g->nodeTable[p->idx].idx);
      p = p->link;
    }
    printf(" NULL\n");
  }
}
//插入顶点
void insert_vertex(GraphLink* g, int v){
  if(g->NumVertices >= g->MaxVertices)return;
  g->nodeTable[g->NumVertices++].idx = v;
  g->nodeTable[g->NumVertices].visited = 0;
}
//查找顶点的index
int getVertexIndex(GraphLink* g, int v){
  for(int i = 0; i < g->NumVertices; ++i){
    if(v == g->nodeTable[i].idx)return i;
  }
  return -1;
}
//创建边
void buyEdge(Edge** e, int idx){
  Edge* p = (Edge*)malloc(sizeof(Edge));
  p->idx = idx;
  p->link = NULL;
  if(NULL == *e){
    *e = p;
  }
  else{
    Edge* tmp = *e;
    while(tmp->link != NULL){
      tmp = tmp->link;
    }
    tmp->link = p;
  }
}
//插入边(尾插）
void insert_edge_tail(GraphLink* g, int v1, int v2){
  int p1 = getVertexIndex(g, v1);
  int p2 = getVertexIndex(g, v2);
  if(p1 == -1 || p2 == -1)return;
  buyEdge(&(g->nodeTable[p1].adj), p2);
  g->NumEdges++;
  buyEdge(&(g->nodeTable[p2].adj), p1);
  g->NumEdges++;
}
//插入边(头插）
void insert_edge_head(GraphLink* g, int v1, int v2){
  int p1 = getVertexIndex(g, v1);
  int p2 = getVertexIndex(g, v2);
  if(p1 == -1 || p2 == -1)return;
  Edge* p = (Edge*)malloc(sizeof(Edge));
  p->idx = p2;
  p->link = g->nodeTable[p1].adj;
  p->prob = 1;
  g->nodeTable[p1].adj = p;
  /*
  p = (Edge*)malloc(sizeof(Edge));
  p->idx = p1;
  p->link = g->nodeTable[p2].adj;
  g->nodeTable[p2].adj = p;
  */
}
//取得指定顶点的第一个后序顶点
int get_first_neighbor(GraphLink* g, int v){
  int i = getVertexIndex(g, v);
  if (-1 == i)return -1;
  Edge* p = g->nodeTable[i].adj;
  if(NULL != p)
    return p->idx;
  else
    return -1;
}
//取得指定顶点v1的临街顶点v2的第一个后序顶点
int get_next_neighbor(GraphLink* g, int ve1, int ve2){
  int v1 = getVertexIndex(g, ve1);
  int v2 = getVertexIndex(g, ve2);
  if(v1 == -1 || v2 == -1)return -1;
  Edge* t = g->nodeTable[v1].adj;
  while(t != NULL && t->idx != v2){
    t = t->link;
  }
  if(NULL != t && t->link != NULL){
    return t->link->idx;
  }
  return -1;
}
//拓扑排序
void topo_sort(GraphLink* g){
  int n = g->NumVertices;
  //表示各个顶点的入度，先都初始化为0
  int* cnt = (int*)malloc(sizeof(int) * n);
  assert(NULL != cnt);
  for(int i = 0; i < n; ++i){
    cnt[i] = 0;
  }
  Edge* p;
  //算出各个顶点的入度
  for(int i = 0; i < n; ++i){
    p = g->nodeTable[i].adj;
    while(p != NULL){
      cnt[p->idx]++;
      p = p->link;
    }
  }
  int top = -1;
  for(int i = 0; i < n; ++i){
    if(cnt[i] == 0){
      //入度为0的顶点入栈（模拟入栈）
      cnt[i] = top; //push
      top = i;
    }
  }
  int v,w;
  for(int i = 0; i < n; ++i){
    if(top == -1)return;//有回路存在
    v = top;         //模拟出栈
    top = cnt[top];
    printf("%d->", g->nodeTable[v].idx);
    w = get_first_neighbor(g, g->nodeTable[v].idx);
    while(-1 != w){
      if(--cnt[w] == 0){
        //入度为0的顶点入栈（模拟入栈）
	cnt[w] = top;
	top = w;
      }
      w = get_next_neighbor(g,g->nodeTable[v].idx,g->nodeTable[w].idx);
    }
  }
  free(cnt);
}

//标记已访问
void modify_visit(GraphLink* g, int v){
  int p = getVertexIndex(g,v);
  if(p==-1) return;
  g->nodeTable[p].visited = 1;
  return;
}

//修改边上的概率
void modify_prob(GraphLink* g, int v1, int v2,double prob){
  int p1 = getVertexIndex(g, v1);
  int p2 = getVertexIndex(g, v2);
  if(p1 == -1 || p2 == -1)return;
  Edge* p = g->nodeTable[p1].adj;
  while(NULL != p){
    if(p2 == p->idx){
      //printf("%f\n",prob);
      p->prob = prob;
      //printf("p(%f)\n",p->prob);
      return;
    }
    p = p->link;
  }
  return;
}

//自动化标记访问及修改概率
void automodify(GraphLink* g, map<int,int> mymap){
  if(NULL == g)return;
  int idx = 0;
  int toidx = 0;
  int edges = 0;
  for(int i = 0; i < g->NumVertices; ++i){
    idx = g->nodeTable[i].idx;
    edges = 0;
    if(0 != mymap[idx])
      modify_visit(g,idx);
    Edge* p = g->nodeTable[i].adj;
    if(NULL == p)
      modify_visit(g,idx);
    //count edges
    while(NULL != p){
      edges++;
      p = p->link;
    }
    p = g->nodeTable[i].adj;
    while(NULL != p){
      toidx = g->nodeTable[p->idx].idx;
      if(2 <= edges){
        modify_prob(g,idx,toidx,(double)(mymap[toidx]+1)/(mymap[idx]+edges));
      }
      p = p->link;
    }
  }
}

