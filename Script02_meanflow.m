%%%%%%% Written by DipeshChuphal %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to calculate mean flow for ISC river basins

clc;clear all;

reachID= ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','seg_id');
streamflow = ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','Streamflow');
Yr = reshape(repmat((1951:2021), 12, 1), [],1);
Mo = repmat(1:12, 1, numel(Yr)/12)';
Da = 1;
t = datetime(Yr,Mo,Da, 'Format','MMM-yyyy');
dm = [year(t) month(t)];

streamflow = [dm streamflow];
%% mean flow

% mean annual flow
mean_annual = mean(streamflow(:,3:end),1)';
annual_mean_streamflow = [double(reachID) mean_annual];
cv_annual_flow = [double(reachID) std(streamflow(:,3:end),1)'./ mean(streamflow(:,3:end),1)'];

% mean monsoon flow
streamflow(streamflow(:,2)<6,:)=[];
streamflow(streamflow(:,2)>9,:)=[];
mean_monsoon = mean(streamflow(:,3:end),1)';
monsoon_mean_streamflow = [double(reachID) mean_annual];
cv_monsoon_flow = [double(reachID) std(streamflow(:,3:end),1)'./ mean(streamflow(:,3:end),1)'];

dlmwrite('/media/wcl/Dipesh/Mizu_route/Output/annual_mean_streamflow',annual_mean_streamflow,' ')
dlmwrite('/media/wcl/Dipesh/Mizu_route/Output/cv_annual_flow',cv_annual_flow,' ')
dlmwrite('/media/wcl/Dipesh/Mizu_route/Output/monsoon_mean_streamflow',monsoon_mean_streamflow,' ')
dlmwrite('/media/wcl/Dipesh/Mizu_route/Output/cv_monsoon_flow',cv_monsoon_flow,' ')
