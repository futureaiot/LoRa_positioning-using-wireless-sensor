%% ���߲����Ķ�λ�㷨
%dA,dB,dCΪA,B,C��δ֪�ڵ�(�ٶ�����[x,y]δ֪)��ģ���������
%%����Ⱥ���ģΪ2��ʹ�ø��������빹��Ⱦɫ�壬��ÿ��Ⱦɫ����(A,B,C,dA,dB,dC)����ʽ��ʾ
%��ʼ��Ⱥ���Ⱦɫ��õ�
clear all
for q = 1:1:5 
C = [34.5939,35.6287,31.1817;32.8398,31.8787,37.2563;35.2117,31.9768,33.6699;32.5675,31.0656,31.5022;33.6001,35.7328,33.2570];
%C2 = [32.8398,31.8787,37.2563];
%C3 = [35.2117,31.9768,33.6699];
%C4 = [32.5675,31.0656,31.5022];
%C5 = [33.6001,35.7328,33.2570];
%% ��Ӧֵ����
m = length(C(:,1));
for i = 1:1:m
Eval(i) = TriangleAfter([0,0],[50,0],[0,50],C(i,1),C(i,2),C(i,3));
%Eval(C2) = TriangleAfter([0,0],[50,0],[0,50],C2(1,1),C2(1,2),C2(1,3));
%Eval(C3) = TriangleAfter([0,0],[50,0],[0,50],C3(1,1),C3(1,2),C3(1,3));
end
best = min(Eval);
%% Choice
percent = Eval/sum(Eval);
F(1) = 0;
for j = 1:1:m
    F(j+1) = 0;
    for k = 1:1:j
        F(j+1) = F(j+1)+percent(k);
    end
end
test = rand;
for t = 1:1:m
    if test>=F(j) && test<F(j+1)
     C(t,:) = C(j,:);   
    end
end
%% ����
POP=[];
pc = 0.88;%�������
n=length(C(:,1));  %n = 5
%k=floor(n*pc);  %���ڽ�����Ⱦɫ����Ŀ?%���õ��㽻������?
j=1;
l=length(C(1,:));  %l = 3
for i=1:n
test(i)=rand;
if test(i)<pc
    for z=1:l
        POP(j,z) = C(i,z);
    end
    POP(j,l+1)=i; %������ǵڼ���Ⱦɫ��
    p(j)=randint(1,1,[1,l-1]); %p�ŵ��ǽ���λ
    j=j+1;
end
end
k0=j-1;
k=floor(k0/2);
if k>=1
for m=1:k
for t=p(2*m-1)+1:l 
    s=POP(2*m-1,t);
POP(2*m-1,t)=POP(2*m,t);
POP(2*m,t)=s;
end
end
for m=1:k0
    for i=1:l
        C(POP(m,l+1),i)=POP(m,i);
    end
end
end
%% ����
n=length(C(:,1)); 
m=length(C(1,:));
pe_tubian = 0.1;
for i=1:n
for j=1:m
test=rand;
if test<pe_tubian
C(i,j)=C(i,j)+0.2;
end
end
end
%% Adapte
for i = 1:1:5
Eval1(i) = TriangleAfter([0,0],[50,0],[0,50],C(i,1),C(i,2),C(i,3));
%Eval(C2) = TriangleAfter([0,0],[50,0],[0,50],C2(1,1),C2(1,2),C2(1,3));
%Eval(C3) = TriangleAfter([0,0],[50,0],[0,50],C3(1,1),C3(1,2),C3(1,3));
end
best1 = min(Eval1);
Mbest = Eval1;
if best1<best
    best = best1;
end
end
