global key;
InitKeyboard();
while 1
   pause(0.1);
   switch key
       case 'uparrow'
           disp('Up Arrow Pressed!');
           brick.MoveMotor('CD', -30);
       case 'downarrow'
           disp('Down Arrow Pressed!');
           brick.MoveMotor('CD', 30);
       case 'leftarrow'
           disp('Left Arrow Pressed!');
           brick.MoveMotor('C', -30);
           brick.MoveMotor('D', 30);
       case 'rightarrow'
           disp('Right Arrow Pressed!');
           brick.MoveMotor('D', -30);
           brick.MoveMotor('C', 30);
       case 'q'
           brick.StopAllMotors();
       case 'b'
           break;
       case 'u'
           brick.MoveMotor('A', -20);
       case 'd'
           brick.MoveMotor('A', 20);
         
   end
end
CloseKeyboard();



