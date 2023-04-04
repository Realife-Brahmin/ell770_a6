% sc2ph converts symmetrical components to phasor
% vabc = sc2ph(v012) returns phasor in 3-by-2 matric of phase A, B, C and 
% its respective angle in degree
%
% Input Argument
% v012 =    [zero sequence magnitude, zero sequence angle(degree);
%            positive sequence magnitude, positive sequence angle(degree);
%            negative sequence magnitude, negative sequence angle(degree)]
% Output Argument
% vabc =    [phase A magnitude, phase A angle(degree);
%            phase B magnitude, phase B angle(degree);
%            phase C magnitude, phase C angle(degree)]
%
% Written by Dr Rodney Tan
% Version 1.00 (Aug 2015)
function vabc = sc2ph(v012)
    [x, y]=pol2cart((pi*v012(1,2))/180,v012(1,1));
    v0 = complex(x,y);
    [x, y]=pol2cart((pi*v012(2,2))/180,v012(2,1));
    v1 = complex(x,y);
    [x, y]=pol2cart((pi*v012(3,2))/180,v012(3,1));
    v2 = complex(x,y);
    
    a = 1*cos(2*pi/3)+1i*sin(2*pi/3);
    a2 = a*a;
    A = [1 1 1;1 a2 a;1 a a2];
    mag = abs(A*[v0;v1;v2]);
    ang = (angle(A*[v0;v1;v2])*180)/pi;
    vabc = horzcat(mag, ang);
end