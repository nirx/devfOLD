# Look-up Tables

The Excel look-up tables provide full estimation information for all available groups. 
The information is selectively displayed under the "Summary" tab of the toolbox based on user-specified age, atlas, ROI, and specificity % cutoff

Data are organized in 3 tabs for each atlas type:

[atlasname]: All available ROIs in the atlas  
[#_Lnd]: Specificity values are organized based on ROI-to-Channel mapping  
[#_Chn]: Specificity values are organized based on Channel-to-ROI mapping

**Determine Appropriate Specificity Cut-off**

The specificity cut-off is a free parameter. Neither the fOLD nor devfOLD toolbox provides combined specificity estimates for channel configurations. Considering this constraint, it is important that the users explore the specificity data carefully to determine the appropriate specificity cut-off base on their ROI(s), age group(s), and available source and detector optodes.  
Cross-sectional or Longitudinal studies that involve more than one age groups need to sensure that the channel-to-ROI specificity values are comparable across age groups. The specificity cut-off setting influences the coverage of the ROI (i.e. the number of channels mapped to the ROI) and the consistency in channel placement between age groups.  

Data visualization and summary statistics can be produced using the ROI-to-Channel mapping [#_Lnd] data. We have provided an example SAS dataset and program (Example_DataExplore) for visualizing the effect of specificity cut-off on the between-age-group (3 Months, 6 Months, 20-24 Years, fOLD adult template) consistency / differences in channel placement. 
