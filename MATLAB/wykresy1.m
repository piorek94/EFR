clear
clc
disp('Program do symulacji ruchu efektora')
y_min=0;
y_max=15;
y=(y_min:0.1:y_max);
F_k=100;
x_min=0;
warunek0=1;
while warunek0>0
%Wybor odpowiedniej akcji
    
    akcja=menu('Wybierz akcje:',...
        '1.Charakterystyka si³owa i przesuniêciowa od a',...
        '2.Charakterystyka si³owa i przesuniêciowa od b',...
        '3.Charakterystyka si³owa i przesuniêciowa od c',...
        '4.Charakterystyka si³owa i przesuniêciowa od alpha',...
        '5.Zakoncz');   
    switch akcja

        case 1
            clc
%----------------------------od a-----------------------------------------%
a=input('Wpisz wartosc a=');
a2=input('Wpisz wartosc a2=');
a3=input('Wpisz wartosc a3=');

b=input('Wpisz wartosc b=');
c=input('Wpisz wartosc c=');
%d=input('Wpisz wartosc d=');
alpha=input('Wpisz wartosc[stopnie] alpha=');
alpha_rad=alpha*pi/180;

%----------------------------------a--------------------------------------%
disp('Obliczona wartoœæ d z warunków granicznych')
%postopad³y do osi cz³on a
d=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
%m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
m=c*cos(beta_rad(1))+b*cos(bg_rad(1));% to powinno byc(niedok³adnosc
%obliczeniowa)
%x=m-sqrt(b^2 + c^2 - 2*b*c*cos(pi-gamma_rad)-b^2*cos(alpha_rad-pi/2))
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x=m-(c*cos(beta_rad)+b*cos(bg_rad));

%{
x(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%}

%-------------------------------------------------


%----------------------------------a2-------------------------------------%
disp('Obliczona wartoœæ d2 z warunków granicznych')
%postopad³y do osi cz³on a
d2=y_max-2*a2-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d2=y_max-2*a2*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d2+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a2));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d2)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d2
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d2<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d2 jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F2(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a2);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x2(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x2(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x2(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------
%----------------------------------a3-------------------------------------%
disp('Obliczona wartoœæ d3 z warunków granicznych')
%postopad³y do osi cz³on a
d3=y_max-2*a3-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d3=y_max-2*a3*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d3+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a3));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d3)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d3
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d3<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d3 jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F3(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a3);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x3(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x3(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x3(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%--------------------------wykresy----------------------------------------$
figure(1);
plot(y,f_F,'r',y,f_F2,'b',y,f_F3,'g');
grid
title(['Charakterystyka si³owa:a=',num2str(a),',a2=',num2str(a2),',a3=',num2str(a3),',b=',num2str(b),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('f_F(y)','f_F2(y)','f_F3(y)','Location','northwest')
xlabel('przesuniêcie y[cm]');
ylabel('F_k/F_s');
figure(2);
plot(x,y,'r',x2,y,'b',x3,y,'g');
grid
title(['Charakterystyka przesuniêciowa:a=',num2str(a),',a2=',num2str(a2),',a3=',num2str(a3),',b=',num2str(b),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('y(x)','y2(x)','y3(x)','Location','northwest')
xlabel('x[cm]');
ylabel('y[cm]');

        case 2
            clc
%----------------------------od b-----------------------------------------%

a=input('Wpisz wartosc a=');

b=input('Wpisz wartosc b=');
b2=input('Wpisz wartosc b2=');
b3=input('Wpisz wartosc b3=');

c=input('Wpisz wartosc c=');
%d=input('Wpisz wartosc d=');
alpha=input('Wpisz wartosc[stopnie] alpha=');
alpha_rad=alpha*pi/180;

%----------------------------------b--------------------------------------%
disp('Obliczona wartoœæ d z warunków granicznych')
%postopad³y do osi cz³on a
d=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc(niedok³adnosc
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%----------------------------------b2-------------------------------------%
disp('Obliczona wartoœæ d2 z warunków granicznych')
%postopad³y do osi cz³on a
d2=y_max-2*a-2*b2*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d2=y_max-2*a*sin(alpha_rad-pi/2)-2*b2*cos(alpha_rad-pi/2)
e=d2+2*b2*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b2*sin(bg_rad)-d2)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d2
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d2<(e-2*sin(z)*(b2+c)))
disp('zle wartosci wyliczone d2 jest zbyt ma³e')
(e-2*sin(z)*(b2+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F2(i)=b2*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b2*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b2*cos(bg_rad(1)); to powinno byc(niedok³adnosc
%obliczeniowa)
spr=2*b2*c*cos(gamma_rad);
spr1=c*c+2*b2*c*cos(gamma_rad);
spr2=sqrt(c*c+2*2*c*cos(gamma_rad));
x2(1)=m-sqrt(c*c+2*2*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b2*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b2*c*cos(gamma_rad(i-1))))
        x2(i)=m-sqrt(c*c+2*b2*c*cos(gamma_rad(i)));
    else
        x2(i)=m+sqrt(c*c+2*b2*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------
%----------------------------------b3-------------------------------------%
disp('Obliczona wartoœæ d3 z warunków granicznych')
%postopad³y do osi cz³on a
d3=y_max-2*a-2*b3*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d3=y_max-2*a3*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d3+2*b3*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b3*sin(bg_rad)-d3)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d3
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d3<(e-2*sin(z)*(b3+c)))
disp('zle wartosci wyliczone d3 jest zbyt ma³e')
(e-2*sin(z)*(b3+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F3(i)=b3*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b3*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b3*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b3*c*cos(gamma_rad);
spr1=c*c+2*b3*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b3*c*cos(gamma_rad));
x3(1)=m-sqrt(c*c+2*b3*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b3*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b3*c*cos(gamma_rad(i-1))))
        x3(i)=m-sqrt(c*c+2*b3*c*cos(gamma_rad(i)));
    else
        x3(i)=m+sqrt(c*c+2*b3*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%--------------------------wykresy----------------------------------------$
figure(1);
plot(y,f_F,'r',y,f_F2,'b',y,f_F3,'g');
grid
title(['Charakterystyka si³owa:a=',num2str(a),',b=',num2str(b),',b2=',num2str(b2),',b3=',num2str(b3),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('f_F(y)','f_F2(y)','f_F3(y)','Location','northwest')
xlabel('przesuniêcie y[cm]');
ylabel('F_k/F_s');

figure(2);
plot(x,y,'r',x2,y,'b',x3,y,'g');
grid
title(['Charakterystyka przesuniêciowa:a=',num2str(a),',b=',num2str(b),',b2=',num2str(b2),',b3=',num2str(b3),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('y(x)','y2(x)','y3(x)','Location','northwest')
xlabel('x[cm]');
ylabel('y[cm]');

        case 3
            clc
%----------------------------od c-----------------------------------------%

a=input('Wpisz wartosc a=');
b=input('Wpisz wartosc b=');

c=input('Wpisz wartosc c=');
c2=input('Wpisz wartosc c2=');
c3=input('Wpisz wartosc c3=');

%d=input('Wpisz wartosc d=');
alpha=input('Wpisz wartosc[stopnie] alpha=');
alpha_rad=alpha*pi/180;

%----------------------------------c--------------------------------------%
disp('Obliczona wartoœæ d z warunków granicznych')
%postopad³y do osi cz³on a
d=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc(niedok³adnosc
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%----------------------------------c2-------------------------------------%
disp('Obliczona wartoœæ d2 z warunków granicznych')
%postopad³y do osi cz³on a
d2=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d2=y_max-2*a2*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d2+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d2)/(2*c2));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d2
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d2<(e-2*sin(z)*(b+c2)))
disp('zle wartosci wyliczone d2 jest zbyt ma³e')
(e-2*sin(z)*(b+c2))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F2(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c2*c2+2*b*c2*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c2*cos(gamma_rad);
spr1=c2*c2+2*b*c2*cos(gamma_rad);
spr2=sqrt(c2*c2+2*b*c2*cos(gamma_rad));
x2(1)=m-sqrt(c2*c2+2*b*c2*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c2*c2+2*b*c2*cos(gamma_rad(i)))<=sqrt(c2*c2+2*b*c2*cos(gamma_rad(i-1))))
        x2(i)=m-sqrt(c2*c2+2*b*c2*cos(gamma_rad(i)));
    else
        x2(i)=m+sqrt(c2*c2+2*b*c2*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%----------------------------------c3-------------------------------------%
disp('Obliczona wartoœæ d3 z warunków granicznych')
%postopad³y do osi cz³on a
d3=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d3=y_max-2*a3*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d3+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d3)/(2*c3));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d3
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d3<(e-2*sin(z)*(b+c3)))
disp('zle wartosci wyliczone d3 jest zbyt ma³e')
(e-2*sin(z)*(b+c3))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F3(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c3*c3+2*b*c3*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c3*cos(gamma_rad);
spr1=c3*c3+2*b*c3*cos(gamma_rad);
spr2=sqrt(c3*c3+2*b*c3*cos(gamma_rad));
x3(1)=m-sqrt(c3*c3+2*b*c3*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c3*c3+2*b*c3*cos(gamma_rad(i)))<=sqrt(c3*c3+2*b*c3*cos(gamma_rad(i-1))))
        x3(i)=m-sqrt(c3*c3+2*b*c3*cos(gamma_rad(i)));
    else
        x3(i)=m+sqrt(c3*c3+2*b*c3*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%--------------------------wykresy----------------------------------------$
figure(1);
plot(y,f_F,'r',y,f_F2,'b',y,f_F3,'g');
grid
title(['Charakterystyka si³owa:a=',num2str(a),',b=',num2str(b),',c=',num2str(c),',c2=',num2str(c2),',c3=',num2str(c3),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('f_F(y)','f_F2(y)','f_F3(y)','Location','northwest')
xlabel('przesuniêcie y[cm]');
ylabel('F_k/F_s');       

figure(2);
plot(x,y,'r',x2,y,'b',x3,y,'g');
grid
title(['Charakterystyka przesuniêciowa:a=',num2str(a),',b=',num2str(b),',c=',num2str(c),',c2=',num2str(c2),',c3=',num2str(c3),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha)])
legend('y(x)','y2(x)','y3(x)','Location','northwest')
xlabel('x[cm]');
ylabel('y[cm]');


        case 4
            clc
%----------------------------od alpha-------------------------------------%

a=input('Wpisz wartosc a=');
b=input('Wpisz wartosc b=');
c=input('Wpisz wartosc c=');
%d=input('Wpisz wartosc d=');

alpha=input('Wpisz wartosc[stopnie] alpha=');
alpha2=input('Wpisz wartosc[stopnie] alpha2=');
alpha3=input('Wpisz wartosc[stopnie] alpha3=');
alpha_rad=alpha*pi/180;
alpha_rad2=alpha2*pi/180;
alpha_rad3=alpha3*pi/180;

%------------------------------alpha--------------------------------------%
disp('Obliczona wartoœæ d z warunków granicznych')
%postopad³y do osi cz³on a
d=y_max-2*a-2*b*cos(alpha_rad-pi/2)
%postopad³y do osi cz³on b
%d=y_max-2*a*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d+2*b*cos(alpha_rad-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d
w=pi-abg_rad(1);
z=pi-w-alpha_rad;
if(d<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1));% to powinno byc(niedok³adnosc
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));

%x=m-(c*cos(beta_rad)+b*cos(bg_rad));

x(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end

%-------------------------------------------------

%------------------------------alpha2-------------------------------------%
disp('Obliczona wartoœæ d2 z warunków granicznych')
%postopad³y do osi cz³on a
d2=y_max-2*a-2*b*cos(alpha_rad2-pi/2)
%postopad³y do osi cz³on b
%d2=y_max-2*a2*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d2+2*b*cos(alpha_rad2-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad2;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d2)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d2
w=pi-abg_rad(1);
z=pi-w-alpha_rad2;
if(d2<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d2 jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F2(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x2(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x2(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x2(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%-------------------------------alpha3------------------------------------%
disp('Obliczona wartoœæ d3 z warunków granicznych')
%postopad³y do osi cz³on a
d3=y_max-2*a-2*b*cos(alpha_rad3-pi/2)
%postopad³y do osi cz³on b
%d3=y_max-2*a3*sin(alpha_rad-pi/2)-2*b*cos(alpha_rad-pi/2)
e=d3+2*b*cos(alpha_rad3-pi/2);

abg_rad=pi-asin((e-y)/(2*a));
abg_st=(180/pi)*abg_rad;

bg_rad=abg_rad-alpha_rad3;
bg_st=(180/pi)*bg_rad;

beta_rad=asin((e-2*b*sin(bg_rad)-d3)/(2*c));
beta_st=(180/pi)*beta_rad;

gamma_rad=bg_rad-beta_rad;
gamma_st=(180/pi)*gamma_rad;

%------------------------------------sprawdzenie d3
w=pi-abg_rad(1);
z=pi-w-alpha_rad3;
if(d3<(e-2*sin(z)*(b+c)))
disp('zle wartosci wyliczone d3 jest zbyt ma³e')
(e-2*sin(z)*(b+c))
end
%---------------------------------------------------------

o=size(y);
for i=1:o(2)
f_F3(i)=b*cos(beta_rad(i))*sin(gamma_rad(i))/(2*a);
end

%------------------------------------charakterystyka przesuniêciowa
m=sqrt(c*c+2*b*c*cos(gamma_rad(1)));
%m=c*cos(beta_rad(1))+b*cos(bg_rad(1)); to powinno byc niedok³adnoœæ
%obliczeniowa)
spr=2*b*c*cos(gamma_rad);
spr1=c*c+2*b*c*cos(gamma_rad);
spr2=sqrt(c*c+2*b*c*cos(gamma_rad));
x3(1)=m-sqrt(c*c+2*b*c*cos(gamma_rad(1)));
for i=2:o(2)
    if(sqrt(c*c+2*b*c*cos(gamma_rad(i)))<=sqrt(c*c+2*b*c*cos(gamma_rad(i-1))))
        x3(i)=m-sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    else
        x3(i)=m+sqrt(c*c+2*b*c*cos(gamma_rad(i)));
    end
end
%-------------------------------------------------

%--------------------------wykresy----------------------------------------$
figure(1);
plot(y,f_F,'r',y,f_F2,'b',y,f_F3,'g');
grid
title(['Charakterystyka si³owa:a=',num2str(a),',b=',num2str(b),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha),',alpha2=',num2str(alpha2),',alpha3=',num2str(alpha3)])
legend('f_F(y)','f_F2(y)','f_F3(y)','Location','northwest')
xlabel('przesuniêcie y[cm]');
ylabel('F_k/F_s'); 

figure(2);
plot(x,y,'r',x2,y,'b',x3,y,'g');
grid
title(['Charakterystyka przesuniêciowa:a=',num2str(a),',b=',num2str(b),',c=',num2str(c),',d=',num2str(d),',d2=',num2str(d2),',d3=',num2str(d3),',alpha=',num2str(alpha),',alpha2=',num2str(alpha2),',alpha3=',num2str(alpha3)])
legend('y(x)','y2(x)','y3(x)','Location','northwest')
xlabel('x[cm]');
ylabel('y[cm]');

        case 5
            close
            close
            clc
            
            warunek0=0;
end
end

