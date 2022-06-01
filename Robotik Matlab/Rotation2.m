%给出旋转矩阵
R=[  0.89, -0.42 , 0.17; 
     0.15, 0.64, 0.75 ; 
      -0.42, -0.65 , 0.63          ] 
         
% 旋转角度
x = atan2(R(3,2),R(3,3))*180/pi
y = atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2))*180/pi
z = atan2(R(2,1),R(1,1))*180/pi        

% 轴-角表达式
theta = acosd((R(1,1)+R(2,2)+R(3,3)-1)/2)
k_x=(R(3,2)-R(2,3))/(2*sind(theta))
k_y=(R(1,3)-R(3,1))/(2*sind(theta))
k_z=(R(2,1)-R(1,2))/(2*sind(theta))

% 四元数式
Q_Klassic=[cosd(theta/2), k_x(1,:)*sind(theta/2), k_y(1,:)*sind(theta/2), k_z(1,:)*sind(theta/2)]



