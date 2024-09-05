function createJacobianScara()

% Laegen der Armglieder
syms l_1 l_2 l_3
% Gelenkparameter
syms theta_1 theta_2 theta_3 real

J = [];

dhP = ...
    [0, pi/2, l_1, theta_1; ...
    l_2, 0, 0, theta_2; ...
    l_3, 0, 0, theta_3];    

BKS_A_3 = poseSym(dhP,1,3);
BKS_A_3 = simplify(BKS_A_3);

q = [theta_1; theta_2; theta_3];

diary('jacobianScara.txt')
diary on
for i = 1:4
    J = [J; jacobian(BKS_A_3(1:3,i), q)];
end
J
diary off

matlabFunction(J, 'file', 'jacobianScara')