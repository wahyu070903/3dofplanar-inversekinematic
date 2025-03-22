clc; clear; close all;

b_length1 = 10;
b_length2 = 10;
b_length3 = 10;

e_cord = [12, 12];
e_orient = 60; 
e_orient_rad = deg2rad(e_orient);

wrist_x = e_cord(1) - (b_length3 * cos(e_orient_rad));
wrist_y = e_cord(2) - (b_length3 * sin(e_orient_rad));

angle_a = atan2(wrist_y, wrist_x);

r_square = wrist_x ^ 2 + wrist_y ^ 2;
r = sqrt(r_square);

if r > (b_length1 + b_length2) || r < abs(b_length1 - b_length2)
    error('Target point is out of reach!');
end

beta = ((b_length1 ^ 2) + (b_length2 ^ 2) - r_square) / (2 * b_length1 * b_length2);
beta = max(-1, min(1, beta));
beta = acos(beta);

gamma = (r_square + b_length1^2 - b_length2^2) / (2 * b_length1 * sqrt(r_square));
gamma = max(-1, min(1, gamma));
gamma = acos(gamma);

angle2 = pi - beta; 
angle1 = angle_a - gamma; 
angle3 = e_orient_rad - angle1 - angle2;

%{
angle1_deg = rad2deg(angle1);
angle2_deg = rad2deg(angle2);
angle3_deg = rad2deg(angle3);
%}

angle1_deg = mod(rad2deg(angle1), 360);
angle2_deg = mod(rad2deg(angle2), 360);
angle3_deg = mod(rad2deg(angle3), 360);

figure;
hold on;
axis equal;
grid on;

cord1_x = b_length1 * cos(angle1);
cord1_y = b_length1 * sin(angle1);

cord2_x = wrist_x;
cord2_y = wrist_y;

cord3_x = e_cord(1);
cord3_y = e_cord(2);

x_max = max(e_cord(1), e_cord(2)) + 4;
y_max = x_max;

xlim([-x_max, x_max]);
ylim([-y_max, y_max]);

dotted1 = b_length1 / 2;
dtx1 = dotted1 * cos(angle1);
dty1 = dotted1 * sin(angle1);

dotted2 = b_length2 / 2;
dtx2 = dotted2 * cos(angle1 + angle2);
dty2 = dotted2 * sin(angle1 + angle2);

plot([-x_max, x_max], [0, 0], '--', 'Color', [0.5, 0.5, 0.5], 'LineWidth', 0.2); % X-axis-split 
plot([0, 0], [-y_max, y_max], '--', 'Color', [0.5, 0.5, 0.5], 'LineWidth', 0.2); % Y-axis-split 

plot([0, b_length1 * cos(angle1)], [0, b_length1 * sin(angle1)], 'b-', 'LineWidth', 2);
scatter(0, 0, 50, 'b', 'filled');
scatter(b_length1 * cos(angle1), b_length1 * sin(angle1), 50, 'b', 'filled');
plot([b_length1 * cos(angle1), b_length1 * cos(angle1) + dtx1], [b_length1 * sin(angle1), b_length1 * sin(angle1) + dty1], 'b--', 'LineWidth', 0.2);

theta_arc1 = linspace(0, angle1, 20);
arc_radius1 = b_length1 * 0.2;
arc_x1 = arc_radius1 * cos(theta_arc1);
arc_y1 = arc_radius1 * sin(theta_arc1);
plot(arc_x1, arc_y1,'-', 'color', [0.5 , 0.5, 0.5], 'LineWidth', 0.2);
text(arc_radius1 * 0.4,arc_radius1 * 0.3, '\theta_1', 'FontSize', 12, 'Color', 'm');

plot([cord1_x, cord2_x], [cord1_y, cord2_y], 'b-', 'LineWidth', 2);
scatter(cord2_x, cord2_y, 50, 'b', 'filled');
plot([cord2_x, cord2_x + dtx2], [cord2_y, cord2_y + dty2], 'b--', 'LineWidth', 0.2);

theta_arc2 = linspace(angle1, angle1 + angle2, 20);
arc_radius2 = b_length2 * 0.2;
arc_x2 = cord1_x + arc_radius1 * cos(theta_arc2);
arc_y2 = cord1_y + arc_radius1 * sin(theta_arc2);
plot(arc_x2, arc_y2,'-', 'color', [0.5 , 0.5, 0.5], 'LineWidth', 0.2);
text(cord1_x + arc_radius2 * 0.4, cord1_y + arc_radius2 * 0.3, '\theta_2', 'FontSize', 12, 'Color', 'm');

plot([cord2_x, cord3_x], [cord2_y, cord3_y], 'b-', 'LineWidth', 2);
scatter(cord3_x, cord3_y, 50, 'b', 'filled');

theta_arc3 = linspace(angle1 + angle2, angle1 + angle2 + angle3, 20);
arc_radius3 = b_length3 * 0.2;
arc_x3 = cord2_x + arc_radius3 * cos(theta_arc3);
arc_y3 = cord2_y + arc_radius3 * sin(theta_arc3);
plot(arc_x3, arc_y3,'-', 'color', [0.5 , 0.5, 0.5], 'LineWidth', 0.2);
text(cord2_x + arc_radius3 * 0.4, cord2_y + arc_radius3 * 0.3, '\theta_3', 'FontSize', 12, 'Color', 'm');

hold off;

annotation('textbox', [0.75, 0.75, 0.1, 0.1], 'String', {...
    ['\theta_1 = ' num2str(angle1_deg, '%.2f') '°'], ...
    ['\theta_2 = ' num2str(angle2_deg, '%.2f') '°'], ...
    ['\theta_3 = ' num2str(angle3_deg, '%.2f') '°'] ...
    ['\phi = ' num2str(e_orient, '%.2f') '°'] ...
    ['effector_x = ' num2str(e_cord(1), '%.2f')] ...
    ['effector_y = ' num2str(e_cord(2), '%.2f')] ...
    ['wrist_x = ' num2str(wrist_x, '%.2f')] ...
    ['wrist_y = ' num2str(wrist_y, '%.2f')] ...
    ['elbow_x = ' num2str(cord1_x, '%.2f')] ...
    ['elbow_y = ' num2str(cord1_y, '%.2f')] ...
    ['arm1 length = ' num2str(b_length1, '%.2f')] ...
    ['arm2 length = ' num2str(b_length2, '%.2f')] ...
    ['arm3 length = ' num2str(b_length3, '%.2f')]}, ...
    'FitBoxToText', 'on', 'BackgroundColor', 'white');
