%%

clc;clear all;

reachID= ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','seg_id');
streamflow = ncread('/media/wcl/DipeshSSD1/Mizu_route/Data/Streamflow/Streamflow.nc','Streamflow');
Yr = reshape(repmat((1951:2021), 12, 1), [],1);
Mo = repmat(1:12, 1, numel(Yr)/12)';
Da = 1;
t = datetime(Yr,Mo,Da, 'Format','MMM-yyyy');
dm = [year(t) month(t)];

streamflow = [dm streamflow];

%% trend in time series
dt2=[];dt10=[];
parfor i=1:9579
    disp(i)
    dt3 = [[1:852]' streamflow(:,2+i)];
[taub tau h sig Z S sigma sen n senplot CIlower CIupper D Dall C3 nsigma] = Mann_Kendall(dt3,0.05,0);
dt2(i,1) = sen;
dt10(i,1) = h;
end

%% change (%)
mean_flow = mean(streamflow(:,fd+2),1);
mean_flow=mean_flow';
dt6 = (dt4(:,2)*852*100)./mean_flow;
dt7=[double(reachID(fd,1)) dt6];