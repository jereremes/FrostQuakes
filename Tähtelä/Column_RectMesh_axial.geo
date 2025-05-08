m=1;

Lx=2.6*m; // r
Ly=26*m; // z

Point(1) = {0, 0, 0};
Point(2) = {Lx, 0, 0};
Point(3) = {Lx, Ly, 0};
Point(4) = {0, Ly, 0};

Line(1) = {1, 2};  // bot
Line(2) = {2, 3};  // right
Line(3) = {3, 4};  // top
Line(4) = {4, 1};  // left

Curve Loop(1) = {1, 2, 3, 4};

Plane Surface(1) = {1};

Physical Curve("Bottom", 1) = {1};
Physical Curve("Right", 2) = {2};
Physical Curve("Top", 3) = {3};
Physical Curve("Left", 4) = {4};
Physical Surface("Domain", 1) = {1}; 

// adaptive mesh generation 
Field[1] = MathEval;

//hMin=0.02*m;
//hMax=1.3*m;

Field[1].F ="0.02+0.98*Exp(2*(26-(y+2)))/(1+Exp(2*(26-(y+2))))"; // NOTICE: IF YOU CHANGE Ly, CHANGE 26
//Field[1].F ="0.02+0.98*Exp(2*((y)-2))/(1+Exp(2*((y)-2)))";

Background Field = 1;

Mesh.MeshSizeExtendFromBoundary = 0;
Mesh.MeshSizeFromPoints = 0;
Mesh.MeshSizeFromCurvature = 0;

Mesh.Algorithm = 6;
