% Define constants
lightport = 2;
touchport = 1;
ultraport = 4;
brick.SetColorMode(lightport, 2);
speed = -36;
% 2 = blue, 3 = green, 4 = yellow
targetcolor = 3;
threshold = 55;
movetime = 2.0;

while 1
    touch = brick.TouchPressed(touchport);
    color = brick.ColorCode(lightport);
    distance = brick.UltrasonicDist(ultraport);
    brick.MoveMotor('D', speed);
    brick.MoveMotor('C', -39.85);
    %navigation with ultrasonic sensor
    if distance > threshold  
        pause(2.0);
        % Turn left 90 degrees
        brick.StopAllMotors('Brake');
        brick.MoveMotor('D', 25);
        brick.MoveMotor('C', -25);
        pause(2.0);
        brick.MoveMotor('D', speed);
        brick.MoveMotor('C', -39.85);
        pause(2.0);
    end
    %touch sensor  
    if touch
        brick.StopAllMotors('Brake');
        brick.MoveMotor('DC', -speed);
        pause(2.0);
        brick.StopAllMotors('Brake');
        brick.MoveMotor('D', -25);
        brick.MoveMotor('C', 25);
        pause(1.93);
        brick.MoveMotor('D', speed);
        brick.MoveMotor('C', -39.85);
        pause(2);
    end
        
    %color readings:
    if color == targetcolor
        pause(2.0);
        brick.StopAllMotors();
        brick.beep();
        run('rmt.m');
        pause(3.0);
        targetcolor = 2;
    end
    if color == 5
        
        disp('red');
        brick.StopAllMotors('Brake');
        pause(2);
        brick.MoveMotor('D', speed);
        brick.MoveMotor('C', -39.85);
        pause(1.5);
    end

    
end

