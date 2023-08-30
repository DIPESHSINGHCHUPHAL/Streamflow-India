%% flow duration curve

clc;clear all;

reachID= ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','seg_id');
streamflow = ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','Streamflow');
Yr = reshape(repmat((1951:2021), 12, 1), [],1);
Mo = repmat(1:12, 1, numel(Yr)/12)';
Da = 1;
t = datetime(Yr,Mo,Da, 'Format','MMM-yyyy');
dm = [year(t) month(t)];

streamflow = [dm streamflow];

idx={'7959';'2418';'8939';'5971'};
name={'sardarsarovar';'hirakud';'mettur';'bhakra'};
figure
for ii=1:4
% Flow Duration Curve -
data = streamflow(:,str2num(idx{ii})+2); %% change data here
n = length(data); % count
% Rank (order) for each value: same as rank function in EXCEL
X = data;

Y=sort(X,'descend');
Y=[[1:length(X)]' Y];
for i=1:length(Y)
   Y(i,3)=Y(i,1)./(n+1);
end

% Flow Duration Curve Plot
subplot(2,2,ii)
scatter(Y(:,3),Y(:,2));
title('Flow Duration Curve');
xlabel('Exceedance Probability');
ylabel('Flow (MCum)');
title(name{ii})
end