clear all
format long
s=11;

eta0=94;
eta=[  32;
    32;
    32;
    32;
    33;
    34;
    35;
    36;
    37;
    38;
    39;]; 

% eta0=347;
% eta=[  120;
%        120;
%        121;
%        122;
%        124;
%        127;
%        130;
%        133;
%        136;
%        140;
%        144;];
% 
% eta0=116;
% eta=[  40;
%        40;
%        40;
%        40;
%        41;
%        42;
%        43;
%        44;
%        45;
%        46;
%        47;];
% 
% eta0=116;
% eta=[  40;
%        40;
%        40;
%        40;
%        41;
%        42;
%        43;
%        44;
%        45;
%        46;
%        48;];
%  
% eta0=111;
% eta=[  38;
%     38;
%     38;
%     39;
%     40;
%     41;
%     42;
%     43;
%     44;
%     45;
%     46;]; 
% 
% eta0=118;
% eta=[  40;
%     40;
%     40;
%     41;
%     42;
%     43;
%     44;
%     45;
%     46;
%     47;
%     48;];
% 
% eta0=102;
% eta=[35;
%     35;
%     35;
%     35;
%     36;
%     37;
%     38;
%     39;
%     40;
%     41;
%     42;]; 
% 
% eta0=105;
% eta=[  36;
%     36;
%     36;
%     36;
%     37;
%     38;
%     39;
%     40;
%     41;
%     42;
%     43;]; 
%
% eta0=119;
% eta=[41;
%     41;
%     41;
%     42;
%     43;
%     44;
%     45;
%     46;
%     47;
%     48;
%     49;];


str=num2str(eta0);
for i=1:size(eta,1)
    str=[str,',',num2str(eta(i))];
end
disp(str)
   
   
  
eta_min=min(eta(:,1));

d_v=eta(1);
h=[1,eta0-2*d_v,0;
    -1,-d_v,1;
    -1,eta0-d_v,-1;];
for i=2:size(eta,1)
    d_v=eta(i);
    h=[h;
      1,eta0-2*d_v,0;
    -1,-d_v,1;
    -1,eta0-d_v,-1;];
end
h=[h;
    1,2*eta0,-2;
    1,0,2;
    -1,eta0,-1;
    -1,0,1;
    -eta0,1,0;];
    

nn=size(h,1);
x=zeros(nn,nn);
for i=1:nn
    for j=1:nn
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
%     y_list=[0;y_list;1];
    ans_x_mid(i)=min(sum(diag(h(:,1))*floor(h(:,2)*x+h(:,3)*y_list'),1));
end

l_mid=find(x_list==1/(eta0-2*eta_min));
M=(eta0-2*eta_min);
c1=s*M-((sum((psi(x_list(3:end))-psi(x_list(2:end-1))).*ans_x_mid(2:end))+...
sum((1.0./x_list(3:l_mid)-1.0./x_list(2:l_mid-1)).*ans_x_mid(2:l_mid-1))));


f=@(x)(x*prod((  eta0-eta-eta*x ))...
         -prod((  eta-(eta0-eta)*x )));

x0=fzero(f,[0,1]);

xj=(eta(:,1)-(eta0-eta)*x0)./( (eta0-eta)-eta*x0 );

c2=eta0*log(4*eta0)+...
   sum(eta.*log(xj)+(eta0-2*eta).*log(1-xj))-eta0*log(1+prod(xj)); 


disp('-------------------------------')
disp(c1)
disp(c2)
disp('-------------------------------')




