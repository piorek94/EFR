clear
clc
disp('Program do symulacji ruchu efektora1')
y_min=0;
y_max=15;
y=(y_min:0.1:y_max);
F_k=100;

%----------------------------od a1----------------------------------------%
a1=input('Wpisz wartosc a1=');
a2=input('Wpisz wartosc a2=');
a3=input('Wpisz wartosc a3=');

b=input('Wpisz wartosc b=');
c=input('Wpisz wartosc c=');
%d=input('Wpisz wartosc d=');
alpha=input('Wpisz wartosc[stopnie] alpha=');
alpha_rad=alpha*pi/180;

%----------------------------------a1-------------------------------------%
disp('Obliczona wartoœæ d1 z warunków granicznych')
%postopad³y do osi cz³on a
d1=y_max-2*a1-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e1=d1+2*b*cos(alpha_rad-pi/2);

abg_rad1=pi-asin((e1-y)/(2*a1));
abg_st1=(180/pi)*abg_rad1;

bg_rad1=abg_rad1-alpha_rad;
bg_st1=(180/pi)*bg_rad1;

beta_rad1=asin((e1-2*b*sin(bg_rad1)-d1)/(2*c));
beta_st1=(180/pi)*beta_rad1;

gamma_rad1=bg_rad1-beta_rad1;
gamma_st1=(180/pi)*gamma_rad1;

%------------------------------------sprawdzenie d1
w1=pi-abg_rad1(1);
z1=pi-w1-alpha_rad;
if(d1<(e1-2*sin(z1)*(b+c)))
disp('zle wartosci wyliczone d1 jest zbyt ma³e')
(e1-2*sin(z1)*(b+c))
end
%---------------------------------------------------------

o1=size(y);
for i=1:o1(2)
f_F1(i)=b*cos(beta_rad1(i))*sin(gamma_rad1(i))/(2*a1);
end

%------------------------------------charakterystyka przesuniêciowa
m1=sqrt(c*c+2*b*c*cos(gamma_rad1(1)));
%m1=c*cos(beta_rad1(1))+b*cos(bg_rad1(1)); to powinno byc(niedok³adnosc
%obliczeniowa)
spr1=2*b*c*cos(gamma_rad1);
spr11=c*c+2*b*c*cos(gamma_rad1);
spr21=sqrt(c*c+2*b*c*cos(gamma_rad1));
x1(1)=m1-sqrt(c*c+2*b*c*cos(gamma_rad1(1)));
for i=2:o1(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad1(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad1(i-1))))
        x1(i)=m1-sqrt(c*c+2*b*c*cos(gamma_rad1(i)));
    else
        x1(i)=m1+sqrt(c*c+2*b*c*cos(gamma_rad1(i)));
    end
end
%-------------------------------------------------

%----------------------------------a2-------------------------------------%
disp('Obliczona wartoœæ d2 z warunków granicznych')
%postopad³y do osi cz³on a
d2=y_max-2*a2-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a2*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e2=d2+2*b*cos(alpha_rad-pi/2);

abg_rad2=pi-asin((e2-y)/(2*a2));
abg_st2=(180/pi)*abg_rad2;

bg_rad2=abg_rad2-alpha_rad;
bg_st2=(180/pi)*bg_rad2;

beta_rad2=asin((e2-2*b*sin(bg_rad2)-d2)/(2*c));
beta_st2=(180/pi)*beta_rad2;

gamma_rad2=bg_rad2-beta_rad2;
gamma_st2=(180/pi)*gamma_rad2;

%------------------------------------sprawdzenie d2
w2=pi-abg_rad2(1);
z2=pi-w2-alpha_rad;
if(d2<(e2-2*sin(z2)*(b+c)))
disp('zle wartosci wyliczone d2 jest zbyt ma³e')
(e2-2*sin(z2)*(b+c))
end
%---------------------------------------------------------

o2=size(y);
for i=1:o2(2)
f_F2(i)=b*cos(beta_rad2(i))*sin(gamma_rad2(i))/(2*a2);

%------------------------------------charakterystyka przesuniêciowa
m2=sqrt(c*c+2*b*c*cos(gamma_rad2(1)));
%m2=c*cos(beta_rad2(1))+b*cos(bg_rad2(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr2=2*b*c*cos(gamma_rad2);
spr12=c*c+2*b*c*cos(gamma_rad2);
spr22=sqrt(c*c+2*b*c*cos(gamma_rad2));
x2(1)=m2-sqrt(c*c+2*b*c*cos(gamma_rad2(1)));
for i=2:o2(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad2(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad2(i-1))))
        x2(i)=m2-sqrt(c*c+2*b*c*cos(gamma_rad2(i)));
    else
        x2(i)=m2+sqrt(c*c+2*b*c*cos(gamma_rad2(i)));
    end
end
%-------------------------------------------------
end
%----------------------------------a3-------------------------------------%
disp('Obliczona wartoœæ d3 z warunków granicznych')
%postopad³y do osi cz³on a
d3=y_max-2*a3-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d3=y_max-2*a3*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e3=d3+2*b*cos(alpha_rad-pi/2);

abg_rad3=pi-asin((e3-y)/(2*a3));
abg_st3=(180/pi)*abg_rad3;

bg_rad3=abg_rad3-alpha_rad;
bg_st3=(180/pi)*bg_rad3;

beta_rad3=asin((e3-2*b*sin(bg_rad3)-d3)/(2*c));
beta_st3=(180/pi)*beta_rad3;

gamma_rad3=bg_rad3-beta_rad3;
gamma_st3=(180/pi)*gamma_rad3;

%------------------------------------sprawdzenie d3
w3=pi-abg_rad3(1);
z3=pi-w3-alpha_rad;
if(d3<(e3-2*sin(z3)*(b+c)))
disp('zle wartosci wyliczone d3 jest zbyt ma³e')
(e3-2*sin(z3)*(b+c))
end
%---------------------------------------------------------

o3=size(y);
for i=1:o3(2)
f_F3(i)=b*cos(beta_rad3(i))*sin(gamma_rad3(i))/(2*a3);
end

%------------------------------------charakterystyka przesuniêciowa
m3=sqrt(c*c+2*b*c*cos(gamma_rad3(1)));
%m3=c*cos(beta_rad3(1))+b*cos(bg_rad3(1)); to powinno byc niedok³adnoœæ
%obliczeniowa
spr3=2*b*c*cos(gamma_rad3);
spr13=c*c+2*b*c*cos(gamma_rad3);
spr23=sqrt(c*c+2*b*c*cos(gamma_rad3));
x3(1)=m3-sqrt(c*c+2*b*c*cos(gamma_rad3(1)));
for i=2:o3(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad3(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad3(i-1))))
        x3(i)=m3-sqrt(c*c+2*b*c*cos(gamma_rad3(i)));
    else
        x3(i)=m3+sqrt(c*c+2*b*c*cos(gamma_rad3(i)));
    end
end
%-------------------------------------------------

%--------------------------wykresy----------------------------------------$
figure(1);
plot(y,f_F1,'r',y,f_F2,'b',y,f_F3,'g');
grid
title(['Charakterystyka si³owa:a1=',num2str(a1),',a2=',num2str(a2),',a3=',num2str(a3),',b=',num2str(b),',c=',num2str(c),',d1=',num2str(d1),',alpha=',num2str(alpha)])
legend('f_F1(y)','f_F2(y)','f_F3(y)','Location','northwest')
xlabel('przesuniêcie y[cm]');
ylabel('charakterystyka si³owa');
figure(2);
plot(x1,y,'r',x2,y,'b',x3,y,'g');
grid
title(['Charakterystyka przesuniêciowa:a1=',num2str(a1),',a2=',num2str(a2),',a3=',num2str(a3),',b=',num2str(b),',c=',num2str(c),',d1=',num2str(d1),',alpha=',num2str(alpha)])
legend('y1(x)','y2(x)','y3(x)','Location','northwest')
xlabel('x[cm]');
ylabel('y[cm]');
