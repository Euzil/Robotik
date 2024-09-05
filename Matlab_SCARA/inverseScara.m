% Armlaegen des Scara-Roboters aus der Aufgabenstellung
l_1 = 20;
l_2 = 100;
l_3 = 100;

% Start und Zielwerte der Gelenkwinkel
q_Start = [deg2rad(0); deg2rad(0); deg2rad(0)];
q_Ziel = [deg2rad(90); deg2rad(60); deg2rad(-60)];

% DH-Parameter fuer die Startstellung
dhP_Start = ...
    [0, pi/2, l_1, q_Start(1); ...
    l_2, 0, 0, q_Start(2); ...
    l_3, 0, 0, q_Start(3)];
  

% DH-Parameter fuer die Zielstellung
dhP_Ziel = ...
    [0, pi/2, l_1, q_Ziel(1); ...
    l_2, 0, 0, q_Ziel(2); ...
    l_3, 0, 0, q_Ziel(3)];  

% Berechnung der homogenen Matrizen fuer die Start- und Zielstellung
A_0_3_Start = pose(dhP_Start,1,3);
A_0_3_Ziel = pose(dhP_Ziel,1,3);

% Initialisierung der Inkrementellen Raekwoetsrechnung
q = q_Start;
A_0_3 = A_0_3_Start;

% maximale Abweichung in den Eintraegen der initialen Stellungsmatrix von der
% Zielstellung
Delta_pose = max(abs(A_0_3_Ziel(:)-A_0_3(:)));

i=0;
while Delta_pose > 1e-2 
    
    i=i+1;
    J = jacobianScara(l_2,l_3,q(1),q(2),q(3));
    A_diff = A_0_3_Ziel-A_0_3 ;
    % Extraktion der nichttrivialen Eintraegen in der Differenz der
    % Stellungsmatrizen
    A_diff = A_diff(1:3, :);
    % Umsortieren der Abweichung von der Stellungsmatrix zu einem
    % Spaltenvektor
    A_diff = A_diff(:);
    % Loesen des Ueerbestimmten Gleichungssystems zur Bestimmung der
    % aenderung in den Gelenkwinkeln
    dq = J \ A_diff;
    % Berechnung der neuen Gelenkwinkel
    q = q + dq;

    disp(sprintf('Ergebnis der %d. Iteration:',i));
    disp(sprintf('theta_1: %1.3f rad (%3.3f�)',q(1),rad2deg(q(1))));
    disp(sprintf('theta_2: %1.3f rad (%3.3f�)',q(2),rad2deg(q(2))));
    disp(sprintf('theta_3: %1.3f rad (%3.3f�)',q(3),rad2deg(q(3))));
    
    % DH-Parameter der aktuellen Stellung
    dhP = ...
    [0, pi/2, l_1, q(1); ...
    l_2, 0, 0, q(2); ...
    l_3, 0, 0, q(3)];

    % Bestimmung der neuen Stellung
    A_0_1 = pose(dhP,1,1);
    A_0_2 = pose(dhP,1,2);
    A_0_3 = pose(dhP,1,3);
    % Bestimmung der maximalen Abweichung in der Pose-Matrix von der
    % Zielstellung
    Delta_pose = abs(max(A_0_3_Ziel(:)-A_0_3(:)));
    disp(sprintf('maximale Abweichung in der Pose-Matrix: %3.5f\n',Delta_pose));
    
end

