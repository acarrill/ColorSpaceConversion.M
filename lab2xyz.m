function [xyz,x,y,z] = lab2xyz(lab, CIE)

% variables assigment
im2double(lab);
l = lab(:,:,1);
a = lab(:,:,2);
b = lab(:,:,3);

% xyz variables initialization
x = zeros(size(l));
y = zeros(size(l));
z = zeros(size(l));

% Define reference tristimulus values. CIE RGB E
RowSum = sum(CIE,2);
x0 = RowSum(1);
y0 = RowSum(2);
z0 = RowSum(3);

% Consts
P = (l+16)/116;

% Identity for assigment 
id = P.^3 > 0.008856;

% lab to xyz equations
x(id) = x0*(P(id) + a(id)/500).^3;
y(id) = y0*P(id).^3;
z(id) = z0*(P(id)-b(id)/200).^3; 

% Return
xyz(:,:,1) = x;
xyz(:,:,2) = y;
xyz(:,:,3) = z;



