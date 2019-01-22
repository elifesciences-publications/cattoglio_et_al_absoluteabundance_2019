%   AbsQuant_4Lines.m
%   Anders Sejr Hansen, March 2017
clear; clc; close all; clearvars -global

%   DESCRIPTION
%   Use the known absolute abundance of U2OS C32 Halo-CTCF to infer the
%   abundance of other proteins

% choose the replicate
Replicate = 4;

% colours and histogram bins:
Fluor_hist_vec = logspace(1.1, 5.1, 150);
Colours = [255/255, 102/255, 0/255; 237/255, 28/255, 36/255; 0/255, 153/255, 204/255; 0/255, 161/255, 75/255];
% Arbitrary rescale factor
U2OS_rescale = 10000; 

% Define the data set:
if Replicate == 1
    DataPath = ['Data', filesep, 'Rep1', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 16, 17, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190108_TMR_20190108_U2OS_blank.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190108_TMR_20190108_U2OS_C32_CTCF.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 10, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190108_TMR_20190108_mESC_blank.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C45 Rad21-Halo', 'mESC C59 Halo-CTCF', 'mESC C87 Halo-CTCF'};
    mESC.Files = {'20190108_TMR_20190108_C45_Rad21.fcs', '20190108_TMR_20190108_C59_CTCF.fcs', '20190108_TMR_20190108_C87_CTCF.fcs'};
    
elseif Replicate == 2
    DataPath = ['Data', filesep, 'Rep2', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 21, 23, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190117_TMR_rep1_20190117_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190117_TMR_rep1_20190117_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 8, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190117_TMR_rep1_20190117_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C45 Rad21-Halo', 'mESC C59 Halo-CTCF', 'mESC C87 Halo-CTCF'};
    mESC.Files = {'20190117_TMR_rep1_20190117_C45_Rad21_TMR.fcs', '20190117_TMR_rep1_20190117_C59_CTCF_TMR.fcs', '20190117_TMR_rep1_20190117_C87_CTCF_TMR.fcs'};
         
elseif Replicate == 3
    DataPath = ['Data', filesep, 'Rep3', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 21, 23, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190117_TMR_rep2_20190117_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190117_TMR_rep2_20190117_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 8, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190117_TMR_rep2_20190117_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C45 Rad21-Halo', 'mESC C59 Halo-CTCF', 'mESC C87 Halo-CTCF'};
    mESC.Files = {'20190117_TMR_rep2_20190117_C45_Rad21_TMR.fcs', '20190117_TMR_rep2_20190117_C59_CTCF_TMR.fcs', '20190117_TMR_rep2_20190117_C87_CTCF_TMR.fcs'};
         
elseif Replicate == 4
    DataPath = ['Data', filesep, 'Rep4', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 16000.* [6, 9, 16, 17, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 7000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190118_TMR_rep3_20190118_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190118_TMR_rep3_20190118_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 16000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 7000.* [5, 5, 10, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190118_TMR_rep3_20190118_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C45 Rad21-Halo', 'mESC C59 Halo-CTCF', 'mESC C87 Halo-CTCF'};
    mESC.Files = {'20190118_TMR_rep3_20190118_C45_Rad21_TMR.fcs', '20190118_TMR_rep3_20190118_C59_CTCF_TMR.fcs', '20190118_TMR_rep3_20190118_C87_CTCF_TMR.fcs'};

    
    
    
    
    
    
    
elseif Replicate == 5
    DataPath = ['Data', filesep, 'Rep1', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 16, 17, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190108_TMR_20190108_U2OS_blank.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190108_TMR_20190108_U2OS_C32_CTCF.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 10, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190108_TMR_20190108_mESC_blank.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C3 Halo-Sox2', 'mESC C41 Halo-TBP'};
    mESC.Files = {'20190108_TMR_20190108_C3_Sox2.fcs', '20190108_TMR_20190108_C41_TBP.fcs'};
    
    
elseif Replicate == 6
    DataPath = ['Data', filesep, 'Rep2', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 21, 23, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190117_TMR_rep1_20190117_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190117_TMR_rep1_20190117_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 8, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190117_TMR_rep1_20190117_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C3 Halo-Sox2', 'mESC C41 Halo-TBP'};
    mESC.Files = {'20190117_TMR_rep1_20190117_C3_Sox2_TMR.fcs', '20190117_TMR_rep1_20190117_C41_TBP_TMR.fcs'};
    
    
elseif Replicate == 7
    DataPath = ['Data', filesep, 'Rep3', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 21, 23, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190117_TMR_rep2_20190117_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190117_TMR_rep2_20190117_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 10, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190117_TMR_rep2_20190117_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C3 Halo-Sox2', 'mESC C41 Halo-TBP'};
    mESC.Files = {'20190117_TMR_rep2_20190117_C3_Sox2_TMR.fcs', '20190117_TMR_rep2_20190117_C41_TBP_TMR.fcs'};
    
    
    
elseif Replicate == 8
    DataPath = ['Data', filesep, 'Rep4', filesep];
    
    % store all the info in structured arrays:
    
    % for U2OS
    U2OS.FSC_SSC_x_gate = 10000.* [6, 9, 16, 17, 13,  6, 4, 6];
    U2OS.FSC_SSC_y_gate = 10000.* [5, 5, 12, 18, 19, 15, 10, 5];
    U2OS.Background_file = '20190118_TMR_rep3_20190118_U2OS_Background_TMR.fcs';
    U2OS.Background_name = 'U2OS Background';
    U2OS.CTCF_file = '20190118_TMR_rep3_20190118_C32_CTCF_TMR.fcs';
    U2OS.CTCF_name = 'U2OS C32 Halo-CTCF';
    
    % for mESC
    mESC.FSC_SSC_x_gate = 10000.* [6, 9, 14, 13, 11,  5.5, 5, 6];
    mESC.FSC_SSC_y_gate = 10000.* [5, 5, 10, 15, 15, 12, 8, 5];
    mESC.Background_file = '20190118_TMR_rep3_20190118_mESC_Background_TMR.fcs';
    mESC.Background_name = 'mESC Background';
    mESC.Names = {'mESC C3 Halo-Sox2', 'mESC C41 Halo-TBP'};
    mESC.Files = {'20190118_TMR_rep3_20190118_C3_Sox2_TMR.fcs', '20190118_TMR_rep3_20190118_C41_TBP_TMR.fcs'};
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% STEP 1: Load in the data %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% U2OS data:
[U2OS.Background.fcsdat, ~, ~, ~] = fca_readfcs([DataPath, U2OS.Background_file]); 
U2OS.Background.FSC_A = U2OS.Background.fcsdat(:,1); 
U2OS.Background.SSC_A = U2OS.Background.fcsdat(:,2); 
U2OS.Background.TMR = U2OS.Background.fcsdat(:,3);
[U2OS.CTCF.fcsdat, ~, ~, ~] = fca_readfcs([DataPath, U2OS.CTCF_file]); 
U2OS.CTCF.FSC_A = U2OS.CTCF.fcsdat(:,1); 
U2OS.CTCF.SSC_A = U2OS.CTCF.fcsdat(:,2); 
U2OS.CTCF.TMR = U2OS.CTCF.fcsdat(:,3);

% mESC data: 
[mESC.Background.fcsdat, ~, ~, ~] = fca_readfcs([DataPath, mESC.Background_file]); 
mESC.Background.FSC_A = mESC.Background.fcsdat(:,1); 
mESC.Background.SSC_A = mESC.Background.fcsdat(:,2); 
mESC.Background.TMR = mESC.Background.fcsdat(:,3);
% loop over all the mESCs to be quantified:
mESC.fcsdat = cell(1,length(mESC.Names));
mESC.FSC_A = cell(1,length(mESC.Names));
mESC.SSC_A = cell(1,length(mESC.Names));
mESC.TMR = cell(1,length(mESC.Names));
for iter = 1:length(mESC.Names)
    [mESC.fcsdat{iter}, ~, ~, ~] = fca_readfcs([DataPath, mESC.Files{iter}]); 
    mESC.FSC_A{iter} = mESC.fcsdat{iter}(:,1);
    mESC.SSC_A{iter} = mESC.fcsdat{iter}(:,2);
    mESC.TMR{iter} = mESC.fcsdat{iter}(:,3);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% STEP 2: Apply Gates %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% U2OS data: apply the gates:
[U2OS.Background.in_gate,~] = inpolygon(U2OS.Background.FSC_A,U2OS.Background.SSC_A, U2OS.FSC_SSC_x_gate,U2OS.FSC_SSC_y_gate); % apply the polygon gate
U2OS.Background.fcsdat_gate1 = U2OS.Background.fcsdat(U2OS.Background.in_gate,:); % get the date that makes it through the date
U2OS.Background.FSC_A_gate1 = U2OS.Background.fcsdat_gate1(:,1); 
U2OS.Background.SSC_A_gate1 = U2OS.Background.fcsdat_gate1(:,2); 
U2OS.Background.TMR_gate1 = U2OS.Background.fcsdat_gate1(:,3);
[U2OS.CTCF.in_gate,~] = inpolygon(U2OS.CTCF.FSC_A,U2OS.CTCF.SSC_A, U2OS.FSC_SSC_x_gate,U2OS.FSC_SSC_y_gate); % apply the polygon gate
U2OS.CTCF.fcsdat_gate1 = U2OS.CTCF.fcsdat(U2OS.CTCF.in_gate,:); % get the date that makes it through the date
U2OS.CTCF.FSC_A_gate1 = U2OS.CTCF.fcsdat_gate1(:,1); 
U2OS.CTCF.SSC_A_gate1 = U2OS.CTCF.fcsdat_gate1(:,2); 
U2OS.CTCF.TMR_gate1 = U2OS.CTCF.fcsdat_gate1(:,3);

% mESC data: apply the gates:
[mESC.Background.in_gate,~] = inpolygon(mESC.Background.FSC_A,mESC.Background.SSC_A, mESC.FSC_SSC_x_gate,mESC.FSC_SSC_y_gate); % apply the polygon gate
mESC.Background.fcsdat_gate1 = mESC.Background.fcsdat(mESC.Background.in_gate,:); % get the date that makes it through the date
mESC.Background.FSC_A_gate1 = mESC.Background.fcsdat_gate1(:,1); 
mESC.Background.SSC_A_gate1 = mESC.Background.fcsdat_gate1(:,2); 
mESC.Background.TMR_gate1 = mESC.Background.fcsdat_gate1(:,3);
% loop over all the mESCs to be quantified:
mESC.in_gate = cell(1,length(mESC.Names));
mESC.fcsdat_gate1 = cell(1,length(mESC.Names));
mESC.FSC_A_gate1 = cell(1,length(mESC.Names));
mESC.SSC_A_gate1 = cell(1,length(mESC.Names));
mESC.TMR_gate1 = cell(1,length(mESC.Names));
for iter = 1:length(mESC.Names)
    [mESC.in_gate{iter}, ~] = inpolygon(mESC.FSC_A{iter},mESC.SSC_A{iter}, mESC.FSC_SSC_x_gate,mESC.FSC_SSC_y_gate); % apply the polygon gate
    mESC.fcsdat_gate1{iter} = mESC.fcsdat{iter}(mESC.in_gate{iter},:); % get the date that makes it through the date
    mESC.FSC_A_gate1{iter} = mESC.fcsdat_gate1{iter}(:,1);
    mESC.SSC_A_gate1{iter} = mESC.fcsdat_gate1{iter}(:,2);
    mESC.TMR_gate1{iter} = mESC.fcsdat_gate1{iter}(:,3);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% STEP 3: Show the forward and side scattering gate %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure1 = figure('position',[10 10 1400 800]); %[x y width height]

%%%% Sub-plot each
subplot(2,3,1);
hold on;
plot(U2OS.Background.FSC_A(U2OS.Background.in_gate), U2OS.Background.SSC_A(U2OS.Background.in_gate), 'ro', 'MarkerSize', 2);
plot(U2OS.Background.FSC_A(~U2OS.Background.in_gate), U2OS.Background.SSC_A(~U2OS.Background.in_gate), 'ko', 'MarkerSize', 2);
plot(U2OS.FSC_SSC_x_gate, U2OS.FSC_SSC_y_gate, 'b-', 'LineWidth', 1);
xlabel('FSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
ylabel('SSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
title(['FSC vs. SSC after gating for ', U2OS.Background_name], 'FontSize',9, 'FontName', 'Helvetica');
axis([9000 251000 9000 251000]);
hold off;

subplot(2,3,2);
hold on;
plot(U2OS.CTCF.FSC_A(U2OS.CTCF.in_gate), U2OS.CTCF.SSC_A(U2OS.CTCF.in_gate), 'ro', 'MarkerSize', 2);
plot(U2OS.CTCF.FSC_A(~U2OS.CTCF.in_gate), U2OS.CTCF.SSC_A(~U2OS.CTCF.in_gate), 'ko', 'MarkerSize', 2);
plot(U2OS.FSC_SSC_x_gate, U2OS.FSC_SSC_y_gate, 'b-', 'LineWidth', 1);
xlabel('FSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
ylabel('SSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
title(['FSC vs. SSC after gating for ', U2OS.CTCF_name], 'FontSize',9, 'FontName', 'Helvetica');
axis([9000 251000 9000 251000]);
hold off;

subplot(2,3,3);
hold on;
plot(mESC.Background.FSC_A(mESC.Background.in_gate), mESC.Background.SSC_A(mESC.Background.in_gate), 'ro', 'MarkerSize', 2);
plot(mESC.Background.FSC_A(~mESC.Background.in_gate), mESC.Background.SSC_A(~mESC.Background.in_gate), 'ko', 'MarkerSize', 2);
plot(mESC.FSC_SSC_x_gate, mESC.FSC_SSC_y_gate, 'b-', 'LineWidth', 1);
xlabel('FSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
ylabel('SSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
title(['FSC vs. SSC after gating for ', mESC.Background_name], 'FontSize',9, 'FontName', 'Helvetica');
axis([9000 251000 9000 251000]);
hold off;

% plot each mESC sample to be gates
for iter = 1:length(mESC.Names)
    subplot(2,3,iter+3);
    hold on;
    plot(mESC.Background.FSC_A(mESC.Background.in_gate), mESC.Background.SSC_A(mESC.Background.in_gate), 'ro', 'MarkerSize', 2);
    plot(mESC.Background.FSC_A(~mESC.Background.in_gate), mESC.Background.SSC_A(~mESC.Background.in_gate), 'ko', 'MarkerSize', 2);
    plot(mESC.FSC_SSC_x_gate, mESC.FSC_SSC_y_gate, 'b-', 'LineWidth', 1);
    xlabel('FSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
    ylabel('SSC-Area', 'FontSize',9, 'FontName', 'Helvetica');
    title(['FSC vs. SSC after gating for ', mESC.Names{iter}], 'FontSize',9, 'FontName', 'Helvetica');
    axis([9000 251000 9000 251000]);
    hold off;
end

% save the plot
set(figure1,'Units','Inches');
pos = get(figure1,'Position');
set(figure1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(figure1,['.', filesep, 'Plots', filesep, 'FACS_Quant_Gate_Rep', num2str(Replicate), '.png'],'-dpng','-r200');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% STEP 4: Re-scale to make U2OS CTCF Consistent %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% find the re-scale factor:
rescale_factor = U2OS_rescale/ mean(U2OS.CTCF.TMR_gate1);

% re-scale everything:
U2OS.Background.TMR_gate1 = rescale_factor * U2OS.Background.TMR_gate1;
U2OS.CTCF.TMR_gate1 = rescale_factor * U2OS.CTCF.TMR_gate1;
mESC.Background.TMR_gate1 = rescale_factor * mESC.Background.TMR_gate1;
for iter = 1:length(mESC.Names)
    mESC.TMR_gate1{iter} = rescale_factor*mESC.TMR_gate1{iter};
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% STEP 5: PLOT the fluorescence PDFs %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Compile the TMR fluorescence histograms
U2OS.Background.TMR_PDF = histc(U2OS.Background.TMR_gate1, Fluor_hist_vec)/length(U2OS.Background.TMR_gate1);
U2OS.CTCF.TMR_PDF = histc(U2OS.CTCF.TMR_gate1, Fluor_hist_vec)/length(U2OS.CTCF.TMR_gate1);
mESC.Background.TMR_PDF = histc(mESC.Background.TMR_gate1, Fluor_hist_vec)/length(mESC.Background.TMR_gate1);
mESC.TMR_PDF = cell(1,length(mESC.Names));
for iter = 1:length(mESC.Names)
    mESC.TMR_PDF{iter} = histc(mESC.TMR_gate1{iter}, Fluor_hist_vec)/length(mESC.TMR_gate1{iter});
end

figure2 = figure('position',[200 200 700 300]); %[x y width height]

% PLOT the PDF histograms for U2OS:
subplot(1,2,1);
hold on;
h1 = area(Fluor_hist_vec, U2OS.Background.TMR_PDF, 'LineStyle','none');
h1.FaceColor = Colours(1,:);
h2 = area(Fluor_hist_vec, U2OS.CTCF.TMR_PDF, 'LineStyle','none');
h2.FaceColor = Colours(2,:);

set(gca,'xscale','log');
set(gca, 'XTick', [10^2 10^3 10^4 10^5]);
axis([40 120000 0 0.14]);
legend(U2OS.Background_name, U2OS.CTCF_name, 'Location', 'NorthWest');
legend boxoff
ylabel('probability', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');
xlabel('FACS TMR fluorescence (AU)', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');

% make the title:
title({['U2OS Background = ', num2str(round(mean(U2OS.Background.TMR_gate1))), ' AU']; ...
      ['U2OS C32 Halo-CTCF = ', num2str(round(mean(U2OS.CTCF.TMR_gate1))), ' AU'];} ...
      ,'FontWeight','Normal', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');
hold off;

% PLOT the PDF histograms for mESC:
subplot(1,2,2);
hold on;

% need to write legends and titles:
legend_text{1} = mESC.Background_name;
title_text(1) = {['mESC Background = ', num2str(round(mean(mESC.Background.TMR_gate1))), ' AU']};

h1 = area(Fluor_hist_vec, mESC.Background.TMR_PDF, 'LineStyle','none');
h1.FaceColor = Colours(1,:);
for iter = 1:length(mESC.Names)
    h2 = area(Fluor_hist_vec, mESC.TMR_PDF{iter}, 'LineStyle','none');
    h2.FaceColor = Colours(iter+1,:);
    
    % compile the legends and titles:
    legend_text{iter+1} = mESC.Names{iter};
    title_text(iter+1,1) = {[mESC.Names{iter}, ' = ', num2str(round(mean(mESC.TMR_gate1{iter}))), ' AU']};
end


set(gca,'xscale','log');
set(gca, 'XTick', [10^2 10^3 10^4 10^5]);
axis([40 120000 0 0.14]);
legend(legend_text, 'Location', 'NorthWest');
legend boxoff
ylabel('probability', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');
xlabel('FACS TMR fluorescence (AU)', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');
title(title_text, 'FontWeight','Normal', 'FontSize',9, 'FontName', 'Helvetica', 'Color', 'k');
hold off;

% save the plot
set(figure2,'Units','Inches');
pos = get(figure2,'Position');
set(figure2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(figure2,['.', filesep, 'Plots', filesep, 'FACS_Quant_TMR_Rep', num2str(Replicate), '.pdf'],'-dpdf','-r0');