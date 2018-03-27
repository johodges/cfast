% McGrattan
% March 21, 2011
% master_validation_script.m
%
% This script creates the plots that are included in the FDS Validation 
% Guide. It consists of calls to other scripts contained within the
% subfolder called "scripts". 
%
% The most important script is called dataplot. It reads the file called
% validation_data_config_matlab.csv and generates 1000+ plots. If you
% want to process only some of these plots, comment out the other 
% scripts and change the data plot line as follows:
%
% [saved_data,drange] = dataplot(cfil,vdir,plotdir,[a:b]);
%
% where a and b are the lines in the .csv file you want to process.
% Alternatively, you can specify the "Dataname" you want:
%
% [saved_data,drange] = dataplot(cfil,vdir,plotdir,'WTC');
%
% In this case, all the WTC results will be plotted. 

close all
clear all

addpath 'scripts'

% Scripts that run prior to dataplot

max_plume_temp

% dataplot creates most of the plots for the Validation Guide. It must be run before scatplot, which makes the scatter plots.

Dataplot_Inputs_File = [pwd, '/CFAST_validation_dataplot_inputs.csv'];
Working_Dir = [pwd, '/../../Validation/'];
Experimental_Dir = [pwd, '/../../../exp/'];
Manuals_Dir = [pwd, '/../../Manuals/Validation_Guide/'];
Scatterplot_Inputs_File = [pwd, '/CFAST_validation_scatterplot_inputs.csv'];

% Statistics output options

Stats_Output = 'Validation';
Output_File = [pwd, '/CFAST_validation_scatterplot_output.csv'];
Statistics_Tex_Output = [pwd, '/../../Manuals/Validation_Guide/SCRIPT_FIGURES/ScatterPlots/validation_statistics.tex'];
Histogram_Tex_Output = [pwd, '/../../Manuals/Validation_Guide/SCRIPT_FIGURES/ScatterPlots/validation_histograms.tex'];

% Override the plot style options with NRC 1824 plot options
NRC_Options = false;
Append_To_Scatterplot_Title = '';

[saved_data,drange] = dataplot(Dataplot_Inputs_File, Experimental_Dir, Working_Dir, Manuals_Dir, 'NIST/NRC Corner Effects');
scatplot(saved_data, drange, ...
         'Scatterplot_Inputs_File', Scatterplot_Inputs_File, ...
         'Manuals_Dir', Manuals_Dir, ...
         'Output_File', Output_File, ...
         'Stats_Output', Stats_Output, ...
         'Statistics_Tex_Output', Statistics_Tex_Output, ...
         'Histogram_Tex_Output', Histogram_Tex_Output, ...
         'NRC_Options', NRC_Options, ...
         'Append_To_Scatterplot_Title', Append_To_Scatterplot_Title)

% Miscellaneous other scripts for special cases

 
display('validation scripts completed successfully!')
