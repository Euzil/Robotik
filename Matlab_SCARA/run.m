clear all
close all
clc

% Falls Sie die aktuelle Funktion zur Berechnung der Jacobi-Matrix
% ueberschreiben wollen
overwrite = false;

if (exist('jacobianScara','file')~=2 || overwrite)
    % erzeugt eine Funktion, die die Jacobi-Matrix berechnet
    createJacobianScara()
    disp('Bitte fuehren sie ''run.m'' nochmals aus um die inkrementelle Rueckwoetsrechnung durchzufuehren!')
else
    % inkrementelle Rueckwoetsrechnung fuer den SCARA
    inverseScara;
end