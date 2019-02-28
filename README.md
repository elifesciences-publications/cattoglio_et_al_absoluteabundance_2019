# Raw FACS data and analysis code for Cattoglio et al. 2019
--------------------------
written and maintained by
[Anders Sejr Hansen](https://anderssejrhansen.wordpress.com/)

# Raw FACS data
This repository contains the raw FACS data in the directory `Data`,
which contains 4 subdirectories for each of the 4 replicates. There is
forward and side scattering data as well as TMR fluorescence data for
U2OS untreated, U2OS C32 Halo-CTCF, mESC untreated, mESC C3 Halo-Sox2,
mESC C41 Halo-TBP, mESC C45 Rad21-Halo, mESC C59 Halo-CTCF, mESC C87
Halo-CTCF.

Please note that replicate 4 was recorded slightly differently and
that a separate analysis script is neccesary to analyze it.

The data are in the FCS version 3.0 format (linear) and are read with
the Matlab function
[fca_readfcs.m](https://www.mathworks.com/matlabcentral/fileexchange/9608-fca_readfcs). This
function was written by Laszlo Balkay of the University of Debrecen.

# Analysis
The first 3 replicates should be analyzed using
`AbsQuant_U2OS_Standard_rep1_3.m`. Full details are in the
script. Here, choose `Replicates` = 1, 2 or 3 if analyzing the mESC
C45, C59 or C87 lines (Figure 1) or choose `Replicates` = 5, 6 or 7 if
analyzing mESC C3 or C41 lines (Figure 3). The code will do live-cell
gating based on forward and side scattering and then plot the
fluorescence histograms.
The code will save the key plots in the directory `Plots`.

The fourth replicate should be analyzed using
`AbsQuant_U2OS_Standard_rep4.m`. Full details are in the
script. Here, choose `Replicates` = 4 if analyzing the mESC
C45, C59 or C87 lines (Figure 1) or choose `Replicates` = 8 if
analyzing mESC C3 or C41 lines (Figure 3). The code will do live-cell
gating based on forward and side scattering and then plot the
fluorescence histograms.
The code will save the key plots in the directory `Plots`.

# Acknowledgements
This code relies on the Matlab function
[fca_readfcs.m](https://www.mathworks.com/matlabcentral/fileexchange/9608-fca_readfcs), which
was written by Laszlo Balkay of the University of Debrecen.

A preprint describing this work is available on [BioRxiv](https://www.biorxiv.org/content/10.1101/370650v2)

## License
These programs are released under the GNU General Public License version 3 or upper (GPLv3+).

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
