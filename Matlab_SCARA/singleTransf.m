function A = singleTransf(dhRow)
% Berechnung der homogenen Matrix zu einer Zeile der DH-Parameter
% A = singleTransf(dhRow) berechnet aus einer Zeile dhRow der Matrix 
% der Denavit-Hartenberg-Parameter die zugehoeige homogene 4x4-Matrix A.
% Der Zeilenvektor dhRow setzt sich aus den folgenden vier Skalaren
% zusammen: 
% dhRow = [a alpha d theta]

a = 1;
alpha = 2;
d = 3;
theta = 4;

A = [cos(dhRow(theta)), -cos(dhRow(alpha))*sin(dhRow(theta)), sin(dhRow(alpha))*sin(dhRow(theta)), dhRow(a)*cos(dhRow(theta));...
    sin(dhRow(theta)), cos(dhRow(alpha))*cos(dhRow(theta)), -sin(dhRow(alpha))*cos(dhRow(theta)), dhRow(a)*sin(dhRow(theta));...
    0, sin(dhRow(alpha)), cos(dhRow(alpha)), dhRow(d);...
    0, 0, 0, 1];

end