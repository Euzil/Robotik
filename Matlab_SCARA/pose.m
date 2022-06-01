function H = pose(dhP,ref,coord)
% Vorw�rtstransformation einer Roboterkonfiguration
% H = pose(dhP,ref,coord) berechnet aus der Matrix dhP
% der Denavit-Hartenberg-Parameter die homogene 4x4-Matrix H, die die
% Orientierung des Koordinatensystems mit dem Index coord gegen�ber dem
% Koordinatensystem mit dem Index ref beschreibt. Die Matrix dhParameters
% setzt sich aus den folgenden vier Spaltenvektoren zusammen: 
% dhParameters = [a alpha d theta]
% Der Index der Parameter entspricht dem Zeilenindex der Matrix.

H = eye(4,4);

for i=ref:coord
    
    A = singleTransf(dhP(i,:));
    
    H = H*A;
    
end