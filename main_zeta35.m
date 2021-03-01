clear all

m1=209;
m2=243;
s=35;

delta=[4;
       4;
       4;
       4;
       4;
         5;
         6;
         7;
         8;
         9;
        10;
        12;
        14;
        16;
        18;
        20;
        22;
        24;
        26;
        28;
        30;
        32;
        34;
        36;
        38;
        40;
        42;
        44;
        46;
        48;
        50;
        52;
        56;
        60;
        64;
        68;];
  
delta_min=min(delta);
                         

d_v=delta(1);
h=[1,m2-2*d_v,0;
    -1,-d_v,1;
    -1,m2-d_v,-1;];
for i=2:size(delta,1)
    d_v=delta(i);
    h=[h;
      1,m2-2*d_v,0;
    -1,-d_v,1;
    -1,m2-d_v,-1;];
end
h=[h;
    1,2*m1,2;
    -1,m1,1;
    1,2*(m1+m2),-2;
    -1,(m1+m2),-1;
    1,3*m1,3;
    1,3*(m1+m2),-3;
    -1,0,1;
    -1,m2,-1;
    -(8*m1+3*m2),1,0;];
    

H=size(h,1);
x=zeros(H,H);
for i=1:H
    for j=1:H
        %x(i,j)=det([h(i,2:3);h(j,2:3);]);
        x(i,j)=h(i,2)*h(j,3)-h(i,3)*h(j,2);
    end
end
x=abs(x);
x=x(1:end);
[x]=unique(x);

t=2;
x_list=zeros(sum(x),1);
x_list(1)=0;
x_list(2)=1;


for i=1:length(x)
    if x(i)>0
        for j=1:x(i)-1
            t=t+1;
            x_list(t)=j/x(i);
        end
    end
end
[x_list,ia,~]=unique(x_list);

x_mid=0.5*(x_list(1:end-1)+x_list(2:end));
ans_x_mid=zeros(length(x_mid),1);
y_list_temp=zeros(1000,1);
for i=1:length(x_mid)
    x=x_mid(i);
    p=0;
    for q=1:size(h,1)
        a=h(q,3);
        b=h(q,2)*x;
    
        if a>0
            y=floor(b):ceil(a+b);
        elseif a<0
            y=floor(a+b):ceil(b);
        else
            continue;
        end
        y_list_temp(p+1:p+length(y))=(y-b)/a;
        p=p+length(y);
    end
    y_list=y_list_temp(1:p);
    y_list(y_list<=0)=0;
    y_list(y_list>=1)=1;
    y_list=unique(y_list);
    y_list=0.5*(y_list(1:end-1)+y_list(2:end));
    y_list=[0;y_list;1];
    ans_x_mid(i)=min(sum(diag(h(:,1))*floor(h(:,2)*x+h(:,3)*y_list'),1));
end

l_mid=find(x_list==1/(m2-2*delta_min));

c1=(sum((psi(x_list(3:end))-psi(x_list(2:end-1))).*ans_x_mid(2:end))+...
sum((1.0./x_list(3:l_mid)-1.0./x_list(2:l_mid-1)).*ans_x_mid(2:l_mid-1)));


f=@(x)((2*m1+m2+x)^4/(x^4)*...
       ((m1+x)/(m1+m2+x))*...
       prod(((m1+x+delta)./(m1+m2+x-delta)))...    
   -1);

x0=fzero(f,[eps/8,(2*m1+m2)^2]);

c2=sum(max((m2-2*delta_min),m2-delta))+(2*m1+m2)*log(108)...
   +sum((m2-2*delta).*log(m2-2*delta))...
   +4*(2*m1+m2)*log(2*m1+m2+x0)...
   +m1*log(m1+x0)-(m1+m2)*log(m1+m2+x0)...
   +sum(( (m1+delta).*log(m1+x0+delta)-(m1+m2-delta).*log(m1+m2+x0-delta) ));


disp('-------------------------------')
disp(delta)
disp([m1,m2])
disp((c1-c2)/m2)
disp(c1)
disp(c2)
disp('-------------------------------')




