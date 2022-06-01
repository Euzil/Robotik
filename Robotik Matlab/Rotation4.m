% 给出轴-角表达式
theta =-90
x=0
y=1
z=0

k_x=x/(sqrt(x*x + y*y + z*z))
k_y=y/(sqrt(x*x + y*y + z*z))
k_z=z/(sqrt(x*x + y*y + z*z))



% 得到旋转矩阵
R=[k_x*k_x*(1-cosd(theta))+cosd(theta) , k_x*k_y*(1-cosd(theta))-k_z*sind(theta) , k_x*k_z*(1-cosd(theta))+k_y*sind(theta), 0 ;
   k_x*k_y*(1-cosd(theta))+k_z*sind(theta) , k_y*k_y*(1-cosd(theta))+cosd(theta) , k_y*k_z*(1-cosd(theta))-k_x*sind(theta) , 0 ;
   k_x*k_z*(1-cosd(theta))-k_y*sind(theta) , k_y*k_z*(1-cosd(theta))+k_x*sind(theta) , k_z*k_z*(1-cosd(theta))+cosd(theta) , 0 ;
                          0                ,                        0                ,                    0                , 1 ]




% 四元数式
Q=[cosd(theta/2), k_x(1,:)*sind(theta/2), k_y(1,:)*sind(theta/2), k_z(1,:)*sind(theta/2)]

% 旋转角度
[r1,r2,r3]= quat2angle(Q);
x=r3*180/pi
y=r2*180/pi
z=r1*180/pi


