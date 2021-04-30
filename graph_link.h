#ifndef __graph_link__
#define __graph_link__
#include <stdio.h>
#include <malloc.h>
#include <assert.h>
#include <memory.h>
#include <map>
#include <string>

using namespace std;

#define default_vertex_size 100

typedef struct FuncLine{
  char* name;
  int line;
  bool operator<(const FuncLine& f)const{
    if (line < f.line)
      return true;
    else if (line > f.line)
      return false;
    else{
      return strcmp(name,f.name);
    }
  }
}FuncLine;
//边的结构
typedef struct Edge{
  //下一个顶点的编号
  int idx;
  //边上的概率
  double prob;
  //指向下一个边的指针
  struct Edge* link;
}Edge;
//顶点的结构
typedef struct Vertex{
  //顶点的行号
  int idx;
  //顶点所属函数名
  char* name;
  //是否已访问
  int visited;
  //边
  Edge* adj;
}Vertex;
//图的结构
typedef struct GraphLink{
  int MaxVertices;
  int NumVertices;
  int NumEdges;
  Vertex* nodeTable;
}GraphLink;
//初始化图
void init_graph_link(GraphLink* g);
//显示图
void show_graph_link(GraphLink* g);
//插入顶点
void insert_vertex(GraphLink* g, char* func, int v);
//插入边头插
void insert_edge_head(GraphLink* g, char* func1, int v1, char* func2, int v2);
//标记已访问
void modify_visit(GraphLink* g, char* func, int v);
//修改边上的概率
void modify_prob(GraphLink* g, int v1, int v2, double prob);//定位一条边是否还有别的作用？
//生成图
void graph_gen(GraphLink* g);
//获取临时map
void modify_map(GraphLink* g, map<FuncLine,int> * cntmap);
//自动化标记访问及修改概率
void automodify(GraphLink* g, map<FuncLine,int> mymap);
#endif
