% 给出四元数式
Q=[1,1,1,0]
Q_inv =quatinv(Q)
Q_nor =quatnormalize(Q)
Q_conj=quatconj(Q)

% 旋转角度
[r1,r2,r3]= quat2angle(Q)
x=r3*180/pi
y=r2*180/pi
z=r1*180/pi

% 得到旋转矩阵（按照旋转顺序相反的顺序）
R=quat2rotm(Q)
v=[1,1,1]
v2=v*R
% 轴-角表达式
theta = acosd((R(1,1)+R(2,2)+R(3,3)-1)/2)
k_x=(R(3,2)-R(2,3))/(2*sind(theta))
k_y=(R(1,3)-R(3,1))/(2*sind(theta))
k_z=(R(2,1)-R(1,2))/(2*sind(theta))