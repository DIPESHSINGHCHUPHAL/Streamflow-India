clc;clear all;

dt =dlmread('/media/wcl/Dipesh/Mizu_route/Trend_analysis/ObsvsSim/Jenapur');
t1=1981;
t2=2010;

dt(dt(:,1)<t1,:)=[];
dt(dt(:,1)>t2,:)=[];
year=[t1:t2]';

%mean monsoon flow
for i=1:length(year)
    fd = find(dt(:,1)==year(i,1))
    dt2 = dt(fd,:);
    dt2(dt2(:,2)>9,:)=[];
    dt2(dt2(:,2)<6,:)=[]; 
    
    dt3(i,:) = nanmean(dt2(:,4:5),1);
    
end

dt4 = [year dt3];

for ii=1:2
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = Mann_Kendall([[1:length(dt4)]' dt4(:,ii+1)],0.05,0);
slope(1,ii) = sen;
signifcn(1,ii) = h;
change(1,ii) = (sen*length(dt4)*100)./nanmean(dt4(:,ii+1),1);
end
 stats = [slope;signifcn;change];
 
 dlmwrite('/media/wcl/DipeshSSD1/Mizu_route/Dipesh/Results/Trend_analysis/ObsvsSim/Jenapurstats',stats,' ');
 dlmwrite('/media/wcl/DipeshSSD1/Mizu_route/Dipesh/Results/Trend_analysis/ObsvsSim/Jenapur_monsoon_flow',dt4,' ');

