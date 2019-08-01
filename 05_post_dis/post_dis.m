%

clear all
close all
clc
%
filelist = dir('*_o.dat'); % (read rinex file, rinex file format: ts_XXXX_e/n/u_o.dat) %
col_num=77;                % (after earthquake �_�᪺�Ѽ�) %

diff=[];                   % (�p�����X�u) %
for i = 1:length(filelist);
    filename= filelist(i).name;
    data = load(filename);
    x=data(:,1);
    y=data(:,2);
    G=[ones(size(x)),x,heaviside(x-2016.09836),heaviside(x-2016.09836).*x,cos(2*pi*(x-2016.09836)),sin(2*pi*(x-2016.09836)),cos(4*pi*(x-2016.09836)),sin(4*pi*(x-2016.09836)),exp(-(x-2016.09836)).*heaviside(x-2016.09836)];
    m=G\y;                 % (�������ѼơG�ĤG��:velocity, �ĤT��: �P�_�q) %
    yc=G*m;                % (���X�u���q��) %
    
    
    xo=2016.09836;         % (�p��_��q�ȡA�Ҵ�h�_��Ĥ@��) %
    for j=1:1:77;
        xe(j)=xo+0.00274*j;
        xe=xe(j);
        ye(j)=m(1,1)+m(2,1)*xe+m(3,1)*heaviside(xe-xo)+m(4,1)*heaviside(xe-xo).*xe+m(5,1)*cos(2*pi*(xe-xo))+m(6,1)*sin(2*pi*(xe-xo))+m(7,1)*cos(4*pi*(xe-xo))+m(8,1)*sin(4*pi*(xe-xo))+m(9,1)*exp(-(xe-xo)).*heaviside(xe-xo);
        ye_name(j)=j;
        for k=1:1:length(ye);
            day(k)=ye(1,k)-ye(1,1);
        end
    end
    diff=[diff;day];    % (E/N/U ���t��) %
end

%====En====% 
diff_sort=zeros(length(filelist),col_num);
for i1=1:round(length(filelist)/3)
    diff_sort(i1,:)=diff(1+(i1-1)*3,:); %for 1+3*(i1-1)
    diff_sort(round(length(filelist)/3)+i1,:)=diff(2+(i1-1)*3,:); %for 2+3*(i1-1)
    diff_sort(round(length(filelist)/3)*2+i1,:)=diff(3+(i1-1)*3,:); %for 3*i1
    fprintf('%d-> %d ; %d-> %d ; %d-> %d \n',i1,1+(i1-1)*3,round(length(filelist)/3)+i1,...
        2+(i1-1)*3,round(length(filelist)/3)*2+i1,3+(i1-1)*3);
end

%====En====%

[lon lat sta]=textread('station.dat', '%f%f%s');

%sta�Q�s��cell�A�Nsta�ର�i�H��J�x�}�����A%
C=[];
for l=1:1:9;                 %(1:1:93 = �Ҵ�h�Ĥ@�ѡG�p��C�@�ѡG�Ҧ������ƶq)%
    C=[C;[sta{l,1}]];
end

% ��X�ɮ� %
A=reshape(diff_sort,9,231);  % (93:255 = �������ƶq�G3(E/N/U) X �n�p�⪺�Ѽ�)%
for n=1:3:228;               %(1:3:276 = �Ҵ�h�Ĥ@�ѡGENU�G����X3-3 )
    Day=A(:,n:n+2);
    PD=[lon';lat';Day(:,1)';Day(:,2)';(0.01*ones(size(lon)))';(0.01*ones(size(lon)))';(0*ones(size(lon)))'];
    filename_new = ['D' num2str((n+2)/3) '_' 'H' '.dat'];
    fid=fopen(filename_new,'w');
    fprintf(fid, '%f\t%f\t%f\t%f\t%f\t%f\t%f\n',PD);
    
    PD2=[lon';lat';Day(:,3)';(0.01*ones(size(lon)))';(0*ones(size(lon)))'];
    filename_new2 = ['D' num2str((n+2)/3) '_' 'V' '.dat'];
    fid2=fopen(filename_new2,'w');
    fprintf(fid2, '%f\t%f\t%f\t%f\t%f\n',PD2);
end
