%%%%%%% Written by DipeshChuphal %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to change the value of calibrating parameters for ISC river basins

clear all; clc;

%{ 
-----Range of calibrating parameters-----

Soil depth = 1-5 (Meter)
Bulk transfer coefficient = 0.001-0.01 (Dimensionless)
Gamma = 1-4 (Dimensionless)
Tau = 30-300 (Days)

%}

cd=   dlmread('/home/wcl/Dipesh/H08/lnd/lnd_param/dipesh_calib/MIZU/cd');    %importing Bulk transfer coefficient (cd) input file of H08
sd=   dlmread('/home/wcl/Dipesh/H08/lnd/lnd_param/dipesh_calib/MIZU/sd');    %importing Soil depth (sd) input file of H08
gamma=dlmread('/home/wcl/Dipesh/H08/lnd/lnd_param/dipesh_calib/MIZU/gamma'); %importing Gamma input file of H08
tau=  dlmread('/home/wcl/Dipesh/H08/lnd/lnd_param/dipesh_calib/MIZU/tau');   %importing Tau input file of H08
%these files contain the grid-wise value of the parameters

% basin names
basin={'Brahmani';'Brahmaputra';'Cauvery';'EastCoast';'Ganga';'Godavari';
    'Indus';'Krishna';'Mahanadi';'Mahi';'Narmada';'NorthEastCoast';'Pennar';
    'Sabarmati';'SouthCoast';'Subarnarekha';'Tapi';'WestCoast'};

% importing basin grids
WestCoast=dlmread('/media/wcl/Elements/data/Basinslola/WestCoast');
SouthCoast=dlmread('/media/wcl/Elements/data/Basinslola/SouthCoast');
NorthEastCoast=dlmread('/media/wcl/Elements/data/Basinslola/NorthEastCoast');
EastCoast=dlmread('/media/wcl/Elements/data/Basinslola/EastCoast');
Mahi=dlmread('/media/wcl/Elements/data/Basinslola/Mahi');
Sabarmati=dlmread('/media/wcl/Elements/data/Basinslola/Sabarmati');
Krishna=dlmread('/media/wcl/Elements/data/Basinslola/Krishna');
Indus=dlmread('/media/wcl/Elements/data/Basinslola/Indus');
Cauvery=dlmread('/media/wcl/Elements/data/Basinslola/Cauvery');
Pennar=dlmread('/media/wcl/Elements/data/Basinslola/Pennar');
Tapi=dlmread('/media/wcl/Elements/data/Basinslola/Tapi');
Subarnarekha=dlmread('/media/wcl/Elements/data/Basinslola/Subarnarekha');
Ganga=dlmread('/media/wcl/Elements/data/Basinslola/Ganga');
Godavari=dlmread('/media/wcl/Elements/data/Basinslola/Godavari');
Narmada=dlmread('/media/wcl/Elements/data/Basinslola/Narmada');
Brahmaputra=dlmread('/media/wcl/Elements/data/Basinslola/Brahmaputra');
Mahanadi=dlmread('/media/wcl/Elements/data/Basinslola/Mahanadi');
Brahmani=dlmread('/media/wcl/Elements/data/Basinslola/Brahmani');

dt = WestCoast;    % basin grids for calibration, here we have taken westcoast river basin as an example

% finding the index of basin grids in south Asia file 
fd=[];
for i=1:length(dt)
    fd1=find(sd(:,1)==dt(1,1) & sd(:,2)==dt(i,2));
    fd=vertcat(fd,fd1);
end

%new set of parameters
cd(fd,3)= 0.002;
sd(fd,3)= 2;
gamma(fd,3)= 2.8;
tau(fd,3)= 105;

% saving the new parameter file
dlmwrite('/media/wcl/Elements/dc/H08PARAM/new/cd',cd,' ')
dlmwrite('/media/wcl/Elements/dc/H08PARAM/new/sd',sd,' ')
dlmwrite('/media/wcl/Elements/dc/H08PARAM/new/gamma',gamma,' ')
dlmwrite('/media/wcl/Elements/dc/H08PARAM/new/tau',tau,' ')
