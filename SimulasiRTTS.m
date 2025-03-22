clc; clear; close all;

% Input parameters
set_angle1 = 75; % Angle (degrees)
b_length = 20;  % Length of the line

theta = deg2rad(set_angle1);
x_length = round(cos(theta) * b_length, 2);
y_length = round(sin(theta) * b_length, 2);

x_cord = [0, x_length];
y_cord = [0, y_length];

figure;
hold on;
plot(x_cord, y_cord, 'b-', 'LineWidth', 2);

plot([0, b_length], [0, 0], 'k--', 'LineWidth', 1);

scatter(x_cord, y_cord, 50, 'b', 'filled');
theta_arc = linspace(0, theta, 20);
arc_radius = b_length * 0.2;
arc_x = arc_radius * cos(theta_arc);
arc_y = arc_radius * sin(theta_arc);
plot(arc_x, arc_y, 'g', 'LineWidth', 2);

text(arc_radius * 1.2, arc_radius * 0.3, ['\theta = ' num2str(set_angle1, '%.1f') '°'], 'FontSize', 12, 'Color', 'g');

text(mean(x_cord) - 1.2, mean(y_cord) + 1.2, ['l = ' num2str(b_length)], 'Rotation', set_angle1,'FontSize', 12, 'Color', 'g');

dotLength = b_length / 2;
dx = dotLength * cos(theta);
dy = dotLength * sin(theta);
plot([x_length, x_length + dx], [y_length, y_length + dy], 'k--', 'LineWidth', 1);

b_length2 = 10;
set_angle2 = 30;
theta2 = deg2rad(set_angle2);

x_length2 = x_length + round(cos(theta + theta2) * b_length2, 2);
y_length2 = y_length + round(sin(theta + theta2) * b_length2, 2);

plot([x_length, x_length2],[y_length, y_length2], 'b-', 'LineWidth', 2);
scatter(x_length2, y_length2, 50, 'b', 'filled');

arc_radius2 = b_length2 * 0.2;
theta_arc2 = linspace(theta, theta + theta2, 20);
arc_x2 = x_length + arc_radius2 * cos(theta_arc2);
arc_y2 = y_length + arc_radius2 * sin(theta_arc2);
plot(arc_x2, arc_y2, 'm', 'LineWidth', 2);

% Second angle label
text(x_length + arc_radius2 * 1.2, y_length + arc_radius2 * 0.3, ['\theta_2 = ' num2str(set_angle2, '%.1f') '°'], 'FontSize', 12, 'Color', 'm');

text(mean([x_length, x_length2]) - 1.8, mean([y_length, y_length2]) - 1.2, ['l = ' num2str(b_length2)], 'Rotation', set_angle2 + set_angle1,'FontSize', 12, 'Color', 'g');

dotLength2 = b_length2 / 2;
dx2 = dotLength2 * cos(theta + theta2);
dy2 = dotLength2 * sin(theta + theta2);
plot([x_length2, x_length2 + dx2], [y_length2, y_length2 + dy2], 'k--', 'LineWidth', 1);

b_length3 = 10;
set_angle3 = 30;
theta3 = deg2rad(set_angle3);

x_length3 = x_length2 + round(cos(theta + theta2 + theta3) * b_length3, 2);
y_length3 = y_length2 + round(sin(theta + theta2 + theta3) * b_length3, 2);

plot([x_length2, x_length3],[y_length2, y_length3], 'b-', 'LineWidth', 2);
scatter(x_length3, y_length3, 50, 'b', 'filled');

arc_radius3 = b_length3 * 0.2;
theta_arc3 = linspace(theta + theta2, theta + theta2 + theta3, 20);
arc_x3 = x_length2 + arc_radius3 * cos(theta_arc3);
arc_y3 = y_length2 + arc_radius3 * sin(theta_arc3);
plot(arc_x3, arc_y3, 'm', 'LineWidth', 2);

text(x_length2 + arc_radius3 * 0.4, y_length2 + arc_radius3 * 0.3, ['\theta_3 = ' num2str(set_angle3, '%.1f') '°'], 'FontSize', 12, 'Color', 'm');

text(mean([x_length2, x_length3]) - 1.8, mean([y_length2, y_length3]) - 1.2, ['l = ' num2str(b_length3)], 'Rotation', set_angle3 + set_angle2 + set_angle1,'FontSize', 12, 'Color', 'g');

ylabel('Y-axis');
axis equal;
grid on;
title('Angle Visualization (\theta)');
datacursormode on;
hold off;
