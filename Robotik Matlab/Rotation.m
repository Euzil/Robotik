%给出旋转角度
x_winkel=180;
y_winkel=0;
z_winkel=-90;

% 得到关于各个旋转的矩阵
Rx=[1 0 0; 0 cosd(x_winkel) -sind(x_winkel); 0 sind(x_winkel) cosd(x_winkel)];
Ry=[cosd(y_winkel) 0 sind(y_winkel); 0 1 0; -sind(y_winkel) 0 cosd(y_winkel)];
Rz=[cosd(z_winkel) -sind(z_winkel) 0 ; sind(z_winkel) cosd(z_winkel) 0; 0 0 1];

% 得到旋转矩阵 
% 如果是内在旋转则从左向右连乘
% 如果是外在旋转则从右向左连乘
R_Rotation = Ry * Rx * Rz

% R_Euler=eul2rotm(z_winkel*pi/180 , y_winkel*pi/180 , x_winkel*pi/180 )%得到的是旋转矩阵的转置矩阵

% 轴-角表达式
theta = acosd((R_Rotation(1,1)+R_Rotation(2,2)+R_Rotation(3,3)-1)/2)
k_x=(R_Rotation(3,2)-R_Rotation(2,3))/(2*sind(theta))
k_y=(R_Rotation(1,3)-R_Rotation(3,1))/(2*sind(theta))
k_z=(R_Rotation(2,1)-R_Rotation(1,2))/(2*sind(theta))

% 四元数式
Q_Klassic=[cosd(theta/2), k_x(1,:)*sind(theta/2), k_y(1,:)*sind(theta/2), k_z(1,:)*sind(theta/2)]
% Q_Euler=angle2quat(z_winkel*pi/180,y_winkel*pi/180,x_winkel*pi/180, 'YXZ')
% Q_Matlab =rotm2quat(R_Rotation);






