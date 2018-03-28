vi = 2.9;
thetaLO = 14.16;
thetaSO = 31.9;
target = 1.10;
if (length(target) == 1)
    thetaL = compute_launch_angle(target, vi);
    thetaS = compute_servo_angle(thetaL, thetaLO, thetaSO);
    fprintf('Target distance: %3.2f m \nLaunch angle: %3.2f degrees \nServo angle: %3.2f\n', target, thetaL, thetaS);
else
    thetaL = zeros(1, length(target));
    thetaS = zeros(1, length(target));
    for k = 1:length(target)
        thetaL(k) = compute_launch_angle(target(k), vi);
        thetaS(k) = compute_servo_angle(thetaL(k), thetaLO, thetaSO);
    end
    subplot(2,1,1)
    plot(target, thetaL);
    title('Launch Angle vs. Target Distance');
    xlabel('Target Distance');
    ylabel('Launch Angle');
    
    subplot(2,1,2);
    plot(target, thetaS);
    title('Servo Angle vs. Target Distance');
    xlabel('Target Distance');
    ylabel('Servo Angle');
end