% ph2sc converts phasor to symmetrical components
% v012 = ph2sc(vabc) returns symmetrical components in 3-by-2 matric of 
% zero, positive, negative sequence and its respective angle in degree
%
% Input Argument
% vabc =    [phase A magnitude, phase A angle(degree);
%            phase B magnitude, phase B angle(degree);
%            phase C magnitude, phase C angle(degree)]
% Output Argument
% v012 =    [zero sequence magnitude, zero sequence angle(degree);
%            positive sequence magnitude, positive sequence angle(degree);
%            negative sequence magnitude, negative sequence angle(degree)]
%
% Written by Dr Rodney Tan
% Version 1.00 (Aug 2015)
function v012 = ph2sc(vabc)
    [x, y]=pol2cart((pi*vabc(1,2))/180,vabc(1,1));
    pa = complex(x,y);
    [x, y]=pol2cart((pi*vabc(2,2))/180,vabc(2,1));
    pb = complex(x,y);
    [x, y]=pol2cart((pi*vabc(3,2))/180,vabc(3,1));
    pc = complex(x,y);
    
    a = 1*cos(2*pi/3)+1i*sin(2*pi/3);
    a2 = a*a;
    A1 = [1 1 1;1 a a2;1 a2 a]/3;
    mag = abs(A1*[pa;pb;pc]);
    ang = (angle(A1*[pa;pb;pc])*180)/pi;
    v012 = horzcat(mag, ang);
end