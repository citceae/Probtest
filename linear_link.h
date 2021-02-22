#ifndef __linear_link__
#define __linear_link__

#include <iostream>
#include "Eigen/Dense"
#include "Eigen/SVD"

using namespace Eigen;
using namespace std;

//填充概率矩阵
void modify_matrix(GraphLink* g, Ref<MatrixXf> A, Ref<VectorXf> B);


#endif