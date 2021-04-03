#include "graph_link.h"
#include "linear_link.h"


int main(){
  GraphLink gl;
  //初始化图
  init_graph_link(&gl);

  graph_gen(&gl);

  //显示图
  //show_graph_link(&gl);
  //拓扑排序
  //topo_sort(&gl);
  //printf("\n");

  map<int, int> cntmap;
  modify_map(&gl,&cntmap);

  automodify(&gl,cntmap);

/*
  //获取gcov.test.c的行号运行情况，并修改概率和访问情况。暂时手动修改概率
  modify_visit(&gl,3);
  modify_visit(&gl,18);
  modify_visit(&gl,20);

  modify_prob(&gl, 3, 5, (double)1/51);
  modify_prob(&gl, 3, 18, (double)50/51);
  modify_prob(&gl, 5, 6, (double)1/2);
  modify_prob(&gl, 5, 14, (double)1/2);
  modify_prob(&gl, 6, 7, (double)1/2);
  modify_prob(&gl, 6, 10, (double)1/2);
*/
  //显示图
  //show_graph_link(&gl);

  //构造矩阵计算reward
  int size = gl.NumVertices;
  MatrixXf A(size,size);
  VectorXf B(size);
  modify_matrix(&gl, A, B);
  //cout<<A<<endl<<endl<<B<<endl;
  //printf("\n");

  //解reward x(0)
  VectorXf x = A.colPivHouseholderQr().solve(B);
  cout<<x(0);

}
